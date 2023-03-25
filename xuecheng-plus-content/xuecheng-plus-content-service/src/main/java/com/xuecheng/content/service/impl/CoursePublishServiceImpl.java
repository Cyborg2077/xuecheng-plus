package com.xuecheng.content.service.impl;

import com.alibaba.fastjson.JSON;
import com.xuecheng.base.exception.XueChengPlusException;
import com.xuecheng.content.config.MultipartSupportConfig;
import com.xuecheng.content.feignclient.MediaServiceClient;
import com.xuecheng.content.feignclient.SearchServiceClient;
import com.xuecheng.content.mapper.CourseBaseMapper;
import com.xuecheng.content.mapper.CourseMarketMapper;
import com.xuecheng.content.mapper.CoursePublishMapper;
import com.xuecheng.content.mapper.CoursePublishPreMapper;
import com.xuecheng.content.model.dto.CourseBaseInfoDto;
import com.xuecheng.content.model.dto.CoursePreviewDto;
import com.xuecheng.content.model.dto.TeachplanDto;
import com.xuecheng.content.model.po.CourseBase;
import com.xuecheng.content.model.po.CourseMarket;
import com.xuecheng.content.model.po.CoursePublish;
import com.xuecheng.content.model.po.CoursePublishPre;
import com.xuecheng.content.po.CourseIndex;
import com.xuecheng.content.service.CourseBaseInfoService;
import com.xuecheng.content.service.CoursePublishService;
import com.xuecheng.content.service.TeachplanService;
import com.xuecheng.messagesdk.model.po.MqMessage;
import com.xuecheng.messagesdk.service.MqMessageService;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.bouncycastle.jcajce.provider.digest.MD2;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.concurrent.TimeUnit;

@Slf4j
@Service
public class CoursePublishServiceImpl implements CoursePublishService {
    @Autowired
    private CourseBaseInfoService courseBaseInfoService;
    @Autowired
    private TeachplanService teachplanService;
    @Autowired
    private CourseMarketMapper courseMarketMapper;
    @Autowired
    private CoursePublishPreMapper coursePublishPreMapper;
    @Autowired
    private CourseBaseMapper courseBaseMapper;
    @Autowired
    private CoursePublishMapper coursePublishMapper;
    @Autowired
    private MqMessageService mqMessageService;
    @Autowired
    private MediaServiceClient mediaServiceClient;
    @Autowired
    private SearchServiceClient searchServiceClient;
    @Autowired
    StringRedisTemplate redisTemplate;

    @Autowired
    RedissonClient redissonClient;

    @Override
    public CoursePreviewDto getCoursePreviewInfo(Long courseId) {
        CoursePreviewDto coursePreviewDto = new CoursePreviewDto();
        // 根据课程id查询 课程基本信息、营销信息
        CourseBaseInfoDto courseBaseInfo = courseBaseInfoService.getCourseBaseInfo(courseId);
        // 根据课程id，查询课程计划
        List<TeachplanDto> teachplanDtoList = teachplanService.findTeachplanTree(courseId);
        // 封装返回
        coursePreviewDto.setCourseBase(courseBaseInfo);
        coursePreviewDto.setTeachplans(teachplanDtoList);
        return coursePreviewDto;
    }

    @Transactional
    @Override
    public void commitAudit(Long companyId, Long courseId) {
        // 查询课程基本信息
        CourseBase courseBase = courseBaseMapper.selectById(courseId);
        // 查询课程营销信息
        CourseMarket courseMarket = courseMarketMapper.selectById(courseId);
        // 查询课程基本信息、课程营销信息
        CourseBaseInfoDto courseBaseInfo = courseBaseInfoService.getCourseBaseInfo(courseId);
        // 查询课程计划
        List<TeachplanDto> teachplanTree = teachplanService.findTeachplanTree(courseId);

        // 1. 约束
        String auditStatus = courseBaseInfo.getAuditStatus();
        // 1.1 审核完后，方可提交审核
        if ("202003".equals(auditStatus)) {
            XueChengPlusException.cast("该课程现在属于待审核状态，审核完成后可再次提交");
        }
        // 1.2 本机构只允许提交本机构的课程
        if (!companyId.equals(courseBaseInfo.getCompanyId())) {
            XueChengPlusException.cast("本机构只允许提交本机构的课程");
        }
        // 1.3 没有上传图片，不允许提交
        if (StringUtils.isEmpty(courseBaseInfo.getPic())) {
            XueChengPlusException.cast("没有上传课程封面，不允许提交审核");
        }
        // 1.4 没有添加课程计划，不允许提交审核
        if (teachplanTree.isEmpty()) {
            XueChengPlusException.cast("没有添加课程计划，不允许提交审核");
        }
        // 2. 准备封装返回对象
        CoursePublishPre coursePublishPre = new CoursePublishPre();
        BeanUtils.copyProperties(courseBaseInfo, coursePublishPre);
        coursePublishPre.setMarket(JSON.toJSONString(courseMarket));
        coursePublishPre.setTeachplan(JSON.toJSONString(teachplanTree));
        coursePublishPre.setCompanyId(companyId);
        coursePublishPre.setCreateDate(LocalDateTime.now());
        // 3. 设置预发布记录状态为已提交
        coursePublishPre.setStatus("202003");
        // 判断是否已经存在预发布记录，若存在，则更新
        CoursePublishPre coursePublishPreUpdate = coursePublishPreMapper.selectById(courseId);
        if (coursePublishPreUpdate == null) {
            coursePublishPreMapper.insert(coursePublishPre);
        } else {
            coursePublishPreMapper.updateById(coursePublishPre);
        }
        // 4. 设置课程基本信息审核状态为已提交
        courseBase.setAuditStatus("202003");
        courseBaseMapper.updateById(courseBase);
    }

    @Transactional
    @Override
    public void publishCourse(Long companyId, Long courseId) {
        // 1. 约束校验
        // 1.1 获取课程预发布表数据
        CoursePublishPre coursePublishPre = coursePublishPreMapper.selectById(courseId);
        if (coursePublishPre == null) {
            XueChengPlusException.cast("请先提交课程审核，审核通过后方可发布");
        }
        // 1.2 课程审核通过后，方可发布
        if (!"202004".equals(coursePublishPre.getStatus())) {
            XueChengPlusException.cast("操作失败，课程审核通过后方可发布");
        }
        // 1.3 本机构只允许发布本机构的课程
        if (!coursePublishPre.getCompanyId().equals(companyId)) {
            XueChengPlusException.cast("操作失败，本机构只允许发布本机构的课程");
        }
        // 2. 向课程发布表插入数据
        saveCoursePublish(courseId);
        // 3. 向消息表插入数据
        saveCoursePublishMessage(courseId);
        // 4. 删除课程预发布表对应记录
        coursePublishPreMapper.deleteById(courseId);
    }

    @Override
    public File generateCourseHtml(Long courseId) {
        File htmlFile = null;
        try {
            // 1. 创建一个Freemarker配置
            Configuration configuration = new Configuration(Configuration.getVersion());
            // 2. 告诉Freemarker在哪里可以找到模板文件
            String classPath = this.getClass().getResource("/").getPath();
            configuration.setDirectoryForTemplateLoading(new File(classPath + "/templates/"));
            configuration.setDefaultEncoding("utf-8");
            // 3. 创建一个模型数据，与模板文件中的数据模型保持一致，这里是CoursePreviewDto类型
            CoursePreviewDto coursePreviewDto = this.getCoursePreviewInfo(courseId);
            HashMap<String, Object> map = new HashMap<>();
            map.put("model", coursePreviewDto);
            // 4. 加载模板文件
            Template template = configuration.getTemplate("course_template.ftl");
            // 5. 将数据模型应用于模板
            String content = FreeMarkerTemplateUtils.processTemplateIntoString(template, map);
            // 5.1 将静态文件内容输出到文件中
            InputStream inputStream = IOUtils.toInputStream(content);
            htmlFile = File.createTempFile("course", ".html");
            FileOutputStream fos = new FileOutputStream(htmlFile);
            IOUtils.copy(inputStream, fos);
        } catch (Exception e) {
            log.debug("课程静态化失败：{}", e.getMessage());
            e.printStackTrace();
        }
        return htmlFile;
    }

    @Override
    public void uploadCourseHtml(Long courseId, File file) {
        MultipartFile multipartFile = MultipartSupportConfig.getMultipartFile(file);
        String course = mediaServiceClient.upload(multipartFile, "/course/", courseId + ".html");
        if (course == null) {
            XueChengPlusException.cast("远程调用媒资服务上传文件失败");
        }
    }

    @Override
    public Boolean saveCourseIndex(Long courseId) {
        // 1. 取出课程发布信息
        CoursePublish coursePublish = coursePublishMapper.selectById(courseId);
        // 2. 拷贝至课程索引对象
        CourseIndex courseIndex = new CourseIndex();
        BeanUtils.copyProperties(coursePublish, courseIndex);
        // 3. 远程调用搜索服务API，添加课程索引信息
        Boolean result = searchServiceClient.add(courseIndex);
        if (!result) {
            XueChengPlusException.cast("添加索引失败");
        }
        return true;
    }

    @Override
    public CoursePublish getCoursePublish(Long courseId) {
        return coursePublishMapper.selectById(courseId);
    }

    @Override
    public CoursePublish getCoursePublishCache(Long courseId) {
        // 1. 先从缓存中查询
        String courseCacheJson = redisTemplate.opsForValue().get("course:" + courseId);
        // 2. 如果缓存里有，直接返回
        if (StringUtils.isNotEmpty(courseCacheJson)) {
            log.debug("从缓存中查询");
            if ("null".equals(courseCacheJson)) {
                return null;
            }
            CoursePublish coursePublish = JSON.parseObject(courseCacheJson, CoursePublish.class);
            return coursePublish;
        } else {
            RLock lock = redissonClient.getLock("courseQueryLock" + courseId);
            lock.lock();
            try {
                // 1. 先从缓存中查询
                courseCacheJson = redisTemplate.opsForValue().get("course:" + courseId);
                // 2. 如果缓存里有，直接返回
                if (StringUtils.isNotEmpty(courseCacheJson)) {
                    log.debug("从缓存中查询");
                    if ("null".equals(courseCacheJson)) {
                        return null;
                    }
                    CoursePublish coursePublish = JSON.parseObject(courseCacheJson, CoursePublish.class);
                    return coursePublish;
                }
                log.debug("缓存中没有，查询数据库");
                System.out.println("缓存中没有，查询数据库");
                // 3. 如果缓存里没有，查询数据库
                CoursePublish coursePublish = coursePublishMapper.selectById(courseId);
                if (coursePublish == null) {
                    redisTemplate.opsForValue().set("course:" + courseId, JSON.toJSONString(null), 30 + new Random().nextInt(100), TimeUnit.SECONDS);
                    return null;
                }
                String jsonString = JSON.toJSONString(coursePublish);
                // 3.1 将查询结果缓存
                redisTemplate.opsForValue().set("course:" + courseId, jsonString, 300 + new Random().nextInt(100), TimeUnit.SECONDS);
                // 3.1 返回查询结果
                return coursePublish;
            } finally {
                lock.unlock();
            }
        }
    }


    /**
     * 保存课程发布信息
     *
     * @param courseId 课程id
     */
    private void saveCoursePublish(Long courseId) {
        CoursePublishPre coursePublishPre = coursePublishPreMapper.selectById(courseId);
        if (coursePublishPre == null) {
            XueChengPlusException.cast("课程预发布数据为空");
        }
        CoursePublish coursePublish = new CoursePublish();
        BeanUtils.copyProperties(coursePublishPre, coursePublish);
        // 设置发布状态为已发布
        coursePublish.setStatus("203002");
        CoursePublish coursePublishUpdate = coursePublishMapper.selectById(courseId);
        // 有则更新，无则新增
        if (coursePublishUpdate == null) {
            coursePublishMapper.insert(coursePublish);
        } else {
            coursePublishMapper.updateById(coursePublish);
        }
        // 更新课程基本信息表的发布状态为已发布
        CourseBase courseBase = courseBaseMapper.selectById(courseId);
        courseBase.setAuditStatus("203002");
        courseBaseMapper.updateById(courseBase);
    }

    /**
     * 保存消息表
     *
     * @param courseId 课程id
     */
    private void saveCoursePublishMessage(Long courseId) {
        MqMessage mqMessage = mqMessageService.addMessage("course_publish", String.valueOf(courseId), null, null);
        if (mqMessage == null) {
            XueChengPlusException.cast("添加消息记录失败");
        }
    }
}
