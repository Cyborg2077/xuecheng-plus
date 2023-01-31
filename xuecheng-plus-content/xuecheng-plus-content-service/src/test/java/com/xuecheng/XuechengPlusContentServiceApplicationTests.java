package com.xuecheng;

import com.xuecheng.base.model.PageParams;
import com.xuecheng.base.model.PageResult;
import com.xuecheng.content.mapper.CourseBaseMapper;
import com.xuecheng.content.model.dto.QueryCourseParamDto;
import com.xuecheng.content.model.po.CourseBase;
import com.xuecheng.content.service.CourseBaseInfoService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

@Slf4j
@SpringBootTest(classes = XuechengPlusContentServiceApplication.class)
class XuechengPlusContentServiceApplicationTests {
    @Resource
    CourseBaseMapper courseBaseMapper;

    @Resource
    CourseBaseInfoService courseBaseInfoService;

    @Test
    void contextLoads() {
        CourseBase courseBase = courseBaseMapper.selectById(22);
        log.info("查询到数据：{}", courseBase);
        Assertions.assertNotNull(courseBase);
    }

    @Test
    void contextQueryCourseTest() {
        PageResult<CourseBase> result = courseBaseInfoService.queryCourseBaseList(new PageParams(1L, 10L), new QueryCourseParamDto());
        log.info("查询到数据：{}", result);
    }
}