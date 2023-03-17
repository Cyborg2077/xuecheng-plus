package com.xuecheng.learning.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.xuecheng.base.exception.XueChengPlusException;
import com.xuecheng.content.model.po.CoursePublish;
import com.xuecheng.learning.feignclient.ContentServiceClient;
import com.xuecheng.learning.mapper.XcChooseCourseMapper;
import com.xuecheng.learning.mapper.XcCourseTablesMapper;
import com.xuecheng.learning.model.dto.XcChooseCourseDto;
import com.xuecheng.learning.model.dto.XcCourseTablesDto;
import com.xuecheng.learning.model.po.XcChooseCourse;
import com.xuecheng.learning.model.po.XcCourseTables;
import com.xuecheng.learning.service.MyCourseTablesService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Slf4j
@Service
@Transactional
public class MyCourseTablesServiceImpl implements MyCourseTablesService {
    @Autowired
    MyCourseTablesService myCourseTablesService;
    @Autowired
    ContentServiceClient contentServiceClient;
    @Autowired
    XcChooseCourseMapper chooseCourseMapper;
    @Autowired
    XcCourseTablesMapper courseTablesMapper;

    @Override
    @Transactional
    public XcChooseCourseDto addChooseCourse(String userId, Long courseId) {
        // 1. 选课调用内容管理服务提供的查询课程接口，查询课程收费规则
        // 1.1 查询课程
        CoursePublish coursePublish = contentServiceClient.getCoursePublish(courseId);
        if (coursePublish == null) {
            XueChengPlusException.cast("课程不存在");
        }
        // 1.2 获取收费规则
        String charge = coursePublish.getCharge();
        XcChooseCourse chooseCourse = null;
        if ("201000".equals(charge)) {
            // 2. 如果是免费课程，向选课记录表、我的课程表添加数据
            log.info("添加免费课程..");
            chooseCourse = myCourseTablesService.addFreeCourse(userId, coursePublish);
            addCourseTables(chooseCourse);
        } else {
            // 3. 如果是收费课程，向选课记录表添加数据
            log.info("添加收费课程");
            chooseCourse = myCourseTablesService.addChargeCourse(userId, coursePublish);
        }

        // 4. 获取学生的学习资格
        XcCourseTablesDto courseTablesDto = getLearningStatus(userId, courseId);
        // 5. 封装返回值
        XcChooseCourseDto chooseCourseDto = new XcChooseCourseDto();
        BeanUtils.copyProperties(chooseCourse, chooseCourseDto);
        chooseCourseDto.setLearnStatus(courseTablesDto.learnStatus);
        return chooseCourseDto;
    }

    /**
     * 判断学习资格
     *
     * @param userId   用户id
     * @param courseId 课程id
     * @return 学习资格状态：查询数据字典 [{"code":"702001","desc":"正常学习"},{"code":"702002","desc":"没有选课或选课后没有支付"},{"code":"702003","desc":"已过期需要申请续期或重新支付"}]
     */
    @Override
    public XcCourseTablesDto getLearningStatus(String userId, Long courseId) {
        XcCourseTablesDto courseTablesDto = new XcCourseTablesDto();
        // 1. 查询我的课程表
        XcCourseTables courseTables = getXcCourseTables(userId, courseId);
        // 2. 未查到，返回一个状态码为"702002"的对象
        if (courseTables == null) {
            courseTablesDto = new XcCourseTablesDto();
            courseTablesDto.setLearnStatus("702002");
            return courseTablesDto;
        }
        // 3. 查到了，判断是否过期
        boolean isExpires = LocalDateTime.now().isAfter(courseTables.getValidtimeEnd());
        // 3.1 已过期，返回状态码为"702003"的对象
        if (isExpires) {
            BeanUtils.copyProperties(courseTables, courseTablesDto);
            courseTablesDto.setLearnStatus("702003");
            return courseTablesDto;
        }
        // 3.2 未过期，返回状态码为"702001"的对象
        else {
            BeanUtils.copyProperties(courseTables, courseTablesDto);
            courseTablesDto.setLearnStatus("702001");
            return courseTablesDto;
        }
    }

    /**
     * 添加到我的课程表
     *
     * @param chooseCourse 选课记录
     */
    @Transactional
    public XcCourseTables addCourseTables(XcChooseCourse chooseCourse) {
        String status = chooseCourse.getStatus();
        if (!"701001".equals(status)) {
            XueChengPlusException.cast("选课未成功，无法添加到课程表");
        }
        XcCourseTables courseTables = getXcCourseTables(chooseCourse.getUserId(), chooseCourse.getCourseId());
        if (courseTables != null) {
            return courseTables;
        }
        courseTables = new XcCourseTables();
        BeanUtils.copyProperties(chooseCourse, courseTables);
        courseTables.setChooseCourseId(chooseCourse.getId());
        courseTables.setCourseType(chooseCourse.getOrderType());
        courseTables.setUpdateDate(LocalDateTime.now());
        int insert = courseTablesMapper.insert(courseTables);
        if (insert <= 0) {
            XueChengPlusException.cast("添加我的课程表失败");
        }
        return courseTables;
    }

    /**
     * 根据用户id和课程id查询我的课程表中的某一门课程
     *
     * @param userId   用户id
     * @param courseId 课程id
     * @return 我的课程表中的课程
     */
    public XcCourseTables getXcCourseTables(String userId, Long courseId) {
        return courseTablesMapper.selectOne(new LambdaQueryWrapper<XcCourseTables>()
                .eq(XcCourseTables::getUserId, userId)
                .eq(XcCourseTables::getCourseId, courseId));
    }

    /**
     * 将付费课程加入到选课记录表
     *
     * @param userId        用户id
     * @param coursePublish 课程发布信息
     * @return 选课记录
     */
    @Transactional
    public XcChooseCourse addChargeCourse(String userId, CoursePublish coursePublish) {
        // 1. 先判断是否已经存在对应的选课，因为数据库中没有约束，所以可能存在相同数据的选课
        LambdaQueryWrapper<XcChooseCourse> lambdaQueryWrapper = new LambdaQueryWrapper<XcChooseCourse>()
                .eq(XcChooseCourse::getUserId, userId)
                .eq(XcChooseCourse::getCourseId, coursePublish.getId())
                .eq(XcChooseCourse::getOrderType, "700002")  // 收费课程
                .eq(XcChooseCourse::getStatus, "701002");// 待支付
        // 1.1 由于可能存在多条，所以这里用selectList
        List<XcChooseCourse> chooseCourses = chooseCourseMapper.selectList(lambdaQueryWrapper);
        // 1.2 如果已经存在对应的选课数据，返回一条即可
        if (!chooseCourses.isEmpty()) {
            return chooseCourses.get(0);
        }
        // 2. 数据库中不存在数据，添加选课信息，对照着数据库中的属性挨个set即可
        XcChooseCourse chooseCourse = new XcChooseCourse();
        chooseCourse.setCourseId(coursePublish.getId());
        chooseCourse.setCourseName(coursePublish.getName());
        chooseCourse.setUserId(userId);
        chooseCourse.setCompanyId(coursePublish.getCompanyId());
        chooseCourse.setOrderType("700002");
        chooseCourse.setCreateDate(LocalDateTime.now());
        chooseCourse.setCoursePrice(coursePublish.getPrice());
        chooseCourse.setValidDays(365);
        chooseCourse.setStatus("701002");
        chooseCourse.setValidtimeStart(LocalDateTime.now());
        chooseCourse.setValidtimeEnd(LocalDateTime.now().plusDays(365));
        int insert = chooseCourseMapper.insert(chooseCourse);
        if (insert <= 0) {
            XueChengPlusException.cast("添加选课记录失败");
        }
        return chooseCourse;
    }

    /**
     * 将免费课程加入到选课表
     *
     * @param userId        用户id
     * @param coursePublish 课程发布信息
     * @return 选课记录
     */
    @Transactional
    public XcChooseCourse addFreeCourse(String userId, CoursePublish coursePublish) {
        // 1. 先判断是否已经存在对应的选课，因为数据库中没有约束，所以可能存在相同数据的选课
        LambdaQueryWrapper<XcChooseCourse> lambdaQueryWrapper = new LambdaQueryWrapper<XcChooseCourse>()
                .eq(XcChooseCourse::getUserId, userId)
                .eq(XcChooseCourse::getCourseId, coursePublish.getId())
                .eq(XcChooseCourse::getOrderType, "700001")  // 免费课程
                .eq(XcChooseCourse::getStatus, "701001");// 选课成功
        // 1.1 由于可能存在多条，所以这里用selectList
        List<XcChooseCourse> chooseCourses = chooseCourseMapper.selectList(lambdaQueryWrapper);
        // 1.2 如果已经存在对应的选课数据，返回一条即可
        if (!chooseCourses.isEmpty()) {
            return chooseCourses.get(0);
        }
        // 2. 数据库中不存在数据，添加选课信息，对照着数据库中的属性挨个set即可
        XcChooseCourse chooseCourse = new XcChooseCourse();
        chooseCourse.setCourseId(coursePublish.getId());
        chooseCourse.setCourseName(coursePublish.getName());
        chooseCourse.setUserId(userId);
        chooseCourse.setCompanyId(coursePublish.getCompanyId());
        chooseCourse.setOrderType("700001");
        chooseCourse.setCreateDate(LocalDateTime.now());
        chooseCourse.setCoursePrice(coursePublish.getPrice());
        chooseCourse.setValidDays(365);
        chooseCourse.setStatus("701001");
        chooseCourse.setValidtimeStart(LocalDateTime.now());
        chooseCourse.setValidtimeEnd(LocalDateTime.now().plusDays(365));
        int insert = chooseCourseMapper.insert(chooseCourse);
        if (insert <= 0) {
            XueChengPlusException.cast("添加选课记录失败");
        }
        return chooseCourse;
    }
}
