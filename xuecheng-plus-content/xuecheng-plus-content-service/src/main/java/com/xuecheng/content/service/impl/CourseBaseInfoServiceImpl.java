package com.xuecheng.content.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xuecheng.base.model.PageParams;
import com.xuecheng.base.model.PageResult;
import com.xuecheng.content.mapper.CourseBaseMapper;
import com.xuecheng.content.model.dto.QueryCourseParamDto;
import com.xuecheng.content.model.po.CourseBase;
import com.xuecheng.content.service.CourseBaseInfoService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CourseBaseInfoServiceImpl implements CourseBaseInfoService {
    @Resource
    CourseBaseMapper courseBaseMapper;

    @Override
    public PageResult<CourseBase> queryCourseBaseList(PageParams pageParams, QueryCourseParamDto queryCourseParams) {
        // 构建条件查询器
        LambdaQueryWrapper<CourseBase> queryWrapper = new LambdaQueryWrapper<>();
        // 构建查询条件：按照课程名称模糊查询
        queryWrapper.like(StringUtils.isNotEmpty(queryCourseParams.getCourseName()), CourseBase::getCompanyName, queryCourseParams.getCourseName());
        // 构建查询条件，按照课程审核状态查询
        queryWrapper.eq(StringUtils.isNotEmpty(queryCourseParams.getAuditStatus()), CourseBase::getAuditStatus, queryCourseParams.getAuditStatus());
        // 构建查询条件，按照课程发布状态查询
        queryWrapper.eq(StringUtils.isNotEmpty(queryCourseParams.getPublishStatus()), CourseBase::getStatus, queryCourseParams.getPublishStatus());
        // 分页对象
        Page<CourseBase> page = new Page<>(pageParams.getPageNo(), pageParams.getPageSize());
        // 查询数据内容获得结果
        Page<CourseBase> pageInfo = courseBaseMapper.selectPage(page, queryWrapper);
        // 获取数据列表
        List<CourseBase> items = pageInfo.getRecords();
        // 获取数据总条数
        long counts = pageInfo.getTotal();
        // 构建结果集
        return new PageResult<>(items, counts, pageParams.getPageNo(), pageParams.getPageSize());
    }
}
