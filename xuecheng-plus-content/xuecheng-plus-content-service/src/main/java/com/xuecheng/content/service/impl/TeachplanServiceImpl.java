package com.xuecheng.content.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.xuecheng.base.exception.XueChengPlusException;
import com.xuecheng.content.mapper.TeachplanMapper;
import com.xuecheng.content.mapper.TeachplanMediaMapper;
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
            if (flag <= 0) XueChengPlusException.cast("修改失败");
        } else {
            // 课程计划id不为null，查询课程，拷贝属性，设置更新时间，执行更新
            Teachplan plan = teachplanMapper.selectById(teachplanId);
            BeanUtils.copyProperties(teachplan, plan);
            plan.setChangeDate(LocalDateTime.now());
            // 如果新增失败，返回0，抛异常
            int flag = teachplanMapper.updateById(plan);
            if (flag <= 0) XueChengPlusException.cast("修改失败");
        }
    }

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

    private int getTeachplanCount(Long courseId, Long parentId) {
        LambdaQueryWrapper<Teachplan> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Teachplan::getCourseId, courseId);
        queryWrapper.eq(Teachplan::getParentid, parentId);
        return teachplanMapper.selectCount(queryWrapper);
    }


}
