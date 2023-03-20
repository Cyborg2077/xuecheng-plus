package com.xuecheng.content.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.xuecheng.base.exception.XueChengPlusException;
import com.xuecheng.content.mapper.TeachplanMapper;
import com.xuecheng.content.mapper.TeachplanMediaMapper;
import com.xuecheng.content.model.dto.BindTeachplanMediaDto;
import com.xuecheng.content.model.dto.TeachplanDto;
import com.xuecheng.content.model.po.Teachplan;
import com.xuecheng.content.model.po.TeachplanMedia;
import com.xuecheng.content.service.TeachplanService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Slf4j
@Service
public class TeachplanServiceImpl implements TeachplanService {
    @Autowired
    private TeachplanMapper teachplanMapper;
    @Autowired
    private TeachplanMediaMapper teachplanMediaMapper;

    @Override
    public List<TeachplanDto> findTeachplanTree(Long courseId) {
        return teachplanMapper.selectTreeNodes(courseId);
    }

    @Transactional
    @Override
    public void saveTeachplan(Teachplan teachplan) {
        Long teachplanId = teachplan.getId();
        if (teachplanId == null) {
            // 课程计划id为null，创建对象，拷贝属性，设置创建时间和排序号
            Teachplan plan = new Teachplan();
            BeanUtils.copyProperties(teachplan, plan);
            plan.setCreateDate(LocalDateTime.now());
            // 设置排序号
            plan.setOrderby(getTeachplanCount(plan.getCourseId(), plan.getParentid()) + 1);
            // 如果新增失败，返回0，抛异常
            int flag = teachplanMapper.insert(plan);
            if (flag <= 0) XueChengPlusException.cast("新增失败");
        } else {
            // 课程计划id不为null，查询课程，拷贝属性，设置更新时间，执行更新
            Teachplan plan = teachplanMapper.selectById(teachplanId);
            BeanUtils.copyProperties(teachplan, plan);
            plan.setChangeDate(LocalDateTime.now());
            // 如果修改失败，返回0，抛异常
            int flag = teachplanMapper.updateById(plan);
            if (flag <= 0) XueChengPlusException.cast("修改失败");
        }
    }

    @Transactional
    @Override
    public void deleteTeachplan(Long teachplanId) {
        if (teachplanId == null)
            XueChengPlusException.cast("课程计划id为空");
        Teachplan teachplan = teachplanMapper.selectById(teachplanId);
        // 判断当前课程计划是章还是节
        Integer grade = teachplan.getGrade();
        // 当前课程计划为章
        if (grade == 1) {
            // 查询当前课程计划下是否有小节
            LambdaQueryWrapper<Teachplan> queryWrapper = new LambdaQueryWrapper<>();
            // select * from teachplan where parentid = {当前章计划id}
            queryWrapper.eq(Teachplan::getParentid, teachplanId);
            // 获取一下查询的条目数
            Integer count = teachplanMapper.selectCount(queryWrapper);
            // 如果当前章下还有小节，则抛异常
            if (count > 0)
                XueChengPlusException.cast("课程计划信息还有子级信息，无法操作");
            teachplanMapper.deleteById(teachplanId);
        } else {
            // 课程计划为节，删除改小节课程计划
            teachplanMapper.deleteById(teachplanId);
            // 条件构造器
            LambdaQueryWrapper<TeachplanMedia> queryWrapper = new LambdaQueryWrapper<>();
            // 删除媒资信息中对应teachplanId的数据
            queryWrapper.eq(TeachplanMedia::getTeachplanId, teachplanId);
            teachplanMediaMapper.delete(queryWrapper);
        }
    }

    @Transactional
    @Override
    public void orderByTeachplan(String moveType, Long teachplanId) {
        Teachplan teachplan = teachplanMapper.selectById(teachplanId);
        // 获取层级和当前orderby，章节移动和小节移动的处理方式不同
        Integer grade = teachplan.getGrade();
        Integer orderby = teachplan.getOrderby();
        // 章节移动是比较同一课程id下的orderby
        Long courseId = teachplan.getCourseId();
        // 小节移动是比较同一章节id下的orderby
        Long parentid = teachplan.getParentid();
        if ("moveup".equals(moveType)) {
            if (grade == 1) {
                // 章节上移，找到上一个章节的orderby，然后与其交换orderby
                // SELECT * FROM teachplan WHERE courseId = 117 AND grade = 1  AND orderby < 1 ORDER BY orderby DESC limit 1
                LambdaQueryWrapper<Teachplan> queryWrapper = new LambdaQueryWrapper<>();
                queryWrapper.eq(Teachplan::getGrade, 1)
                        .eq(Teachplan::getCourseId, courseId)
                        .lt(Teachplan::getOrderby, orderby)
                        .orderByDesc(Teachplan::getOrderby)
                        .last("limit 1");
                Teachplan tmp = teachplanMapper.selectOne(queryWrapper);
                exchangeOrderby(teachplan, tmp);
            } else if (grade == 2) {
                // 小节上移
                // SELECT * FROM teachplan WHERE parentId = 268 AND orderby < 5 ORDER BY orderby DESC LIMIT 1
                LambdaQueryWrapper<Teachplan> queryWrapper = new LambdaQueryWrapper<>();
                queryWrapper.eq(Teachplan::getParentid, parentid)
                        .lt(Teachplan::getOrderby, orderby)
                        .orderByDesc(Teachplan::getOrderby)
                        .last("LIMIT 1");
                Teachplan tmp = teachplanMapper.selectOne(queryWrapper);
                exchangeOrderby(teachplan, tmp);
            }

        } else if ("movedown".equals(moveType)) {
            if (grade == 1) {
                // 章节下移
                // SELECT * FROM teachplan WHERE courseId = 117 AND grade = 1 AND orderby > 1 ORDER BY orderby ASC LIMIT 1
                LambdaQueryWrapper<Teachplan> queryWrapper = new LambdaQueryWrapper<>();
                queryWrapper.eq(Teachplan::getCourseId, courseId)
                        .eq(Teachplan::getGrade, grade)
                        .gt(Teachplan::getOrderby, orderby)
                        .orderByAsc(Teachplan::getOrderby)
                        .last("LIMIT 1");
                Teachplan tmp = teachplanMapper.selectOne(queryWrapper);
                exchangeOrderby(teachplan, tmp);
            } else if (grade == 2) {
                // 小节下移
                // SELECT * FROM teachplan WHERE parentId = 268 AND orderby > 1 ORDER BY orderby ASC LIMIT 1
                LambdaQueryWrapper<Teachplan> queryWrapper = new LambdaQueryWrapper<>();
                queryWrapper.eq(Teachplan::getParentid, parentid)
                        .gt(Teachplan::getOrderby, orderby)
                        .orderByAsc(Teachplan::getOrderby)
                        .last("LIMIT 1");
                Teachplan tmp = teachplanMapper.selectOne(queryWrapper);
                exchangeOrderby(teachplan, tmp);
            }
        }
    }

    @Override
    public Teachplan getTeachplan(Long teachplanId) {
        return teachplanMapper.selectById(teachplanId);
    }

    @Transactional
    @Override
    public void associationMedia(BindTeachplanMediaDto bindTeachplanMediaDto) {
        Long teachplanId = bindTeachplanMediaDto.getTeachplanId();
        // 先根据请求参数查询出对应的教学计划teachplan
        Teachplan teachplan = teachplanMapper.selectById(teachplanId);
        if (teachplan == null) {
            XueChengPlusException.cast("教学计划不存在");
        }
        // 获取教学计划的层级，只有第二层级允许绑定媒资信息（第二层级为小节，第一层级为章节）
        Integer grade = teachplan.getGrade();
        if (grade != 2) {
            XueChengPlusException.cast("只有小节允许绑定媒资信息");
        }
        // 绑定媒资，如果之前已经绑定过了媒资，再次绑定时为更新（例如该小节已经绑定了 星际牛仔.avi，现在改绑为 胶水.avi，其实现方式为先删再增）
        LambdaQueryWrapper<TeachplanMedia> queryWrapper = new LambdaQueryWrapper<TeachplanMedia>().eq(TeachplanMedia::getTeachplanId, teachplanId);
        // 先删
        teachplanMediaMapper.delete(queryWrapper);
        // 再增
        TeachplanMedia teachplanMedia = new TeachplanMedia();
        teachplanMedia.setTeachplanId(bindTeachplanMediaDto.getTeachplanId());
        teachplanMedia.setMediaFilename(bindTeachplanMediaDto.getFileName());
        teachplanMedia.setMediaId(bindTeachplanMediaDto.getMediaId());
        teachplanMedia.setCourseId(teachplan.getCourseId());
        teachplanMedia.setCreateDate(LocalDateTime.now());
        teachplanMediaMapper.insert(teachplanMedia);
    }

    @Override
    public void unassociationMedia(Long teachPlanId, String mediaId) {
        LambdaQueryWrapper<TeachplanMedia> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(TeachplanMedia::getTeachplanId, teachPlanId)
                .eq(TeachplanMedia::getMediaId, mediaId);
        teachplanMediaMapper.delete(queryWrapper);
    }

    /**
     * 交换两个Teachplan的orderby
     *
     * @param teachplan teachplan1
     * @param tmp       teachplan2
     */
    private void exchangeOrderby(Teachplan teachplan, Teachplan tmp) {
        if (tmp == null)
            XueChengPlusException.cast("已经到头啦，不能再移啦");
        else {
            // 交换orderby，更新
            Integer orderby = teachplan.getOrderby();
            Integer tmpOrderby = tmp.getOrderby();
            teachplan.setOrderby(tmpOrderby);
            tmp.setOrderby(orderby);
            teachplanMapper.updateById(tmp);
            teachplanMapper.updateById(teachplan);
        }
    }

    private int getTeachplanCount(Long courseId, Long parentId) {
        LambdaQueryWrapper<Teachplan> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Teachplan::getCourseId, courseId);
        queryWrapper.eq(Teachplan::getParentid, parentId);
        return teachplanMapper.selectCount(queryWrapper);
    }


}
