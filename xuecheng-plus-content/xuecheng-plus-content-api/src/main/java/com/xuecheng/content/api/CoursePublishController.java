package com.xuecheng.content.api;

import com.alibaba.fastjson.JSON;
import com.xuecheng.content.model.dto.CourseBaseInfoDto;
import com.xuecheng.content.model.dto.CoursePreviewDto;
import com.xuecheng.content.model.dto.TeachplanDto;
import com.xuecheng.content.model.po.CoursePublish;
import com.xuecheng.content.service.CoursePublishService;
import com.xuecheng.content.util.SecurityUtil;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@RestController
public class CoursePublishController {
    @Autowired
    private CoursePublishService coursePublishService;

    /**
     * 课程预览
     *
     * @param courseId 课程id
     * @return
     */
    @GetMapping("/coursepreview/{courseId}")
    public ModelAndView preview(@PathVariable("courseId") Long courseId) {
        CoursePreviewDto coursePreviewInfo = coursePublishService.getCoursePreviewInfo(courseId);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("course_template");
        modelAndView.addObject("model", coursePreviewInfo);
        return modelAndView;
    }

    /**
     * 提交课程审核
     *
     * @param courseId 课程id
     */
    @PostMapping("/courseaudit/commit/{courseId}")
    public void commitAudit(@PathVariable Long courseId) {
        SecurityUtil.XcUser user = SecurityUtil.getUser();
        Long companyId = null;
        if (StringUtils.isNotEmpty(user.getCompanyId())) {
            companyId = Long.parseLong(user.getCompanyId());
        }
        coursePublishService.commitAudit(companyId, courseId);
    }

    /**
     * 课程发布接口
     *
     * @param courseId 课程id
     */
    @PostMapping("/coursepublish/{courseId}")
    public void coursePublish(@PathVariable Long courseId) {
        SecurityUtil.XcUser user = SecurityUtil.getUser();
        Long companyId = null;
        if (StringUtils.isNotEmpty(user.getCompanyId())) {
            companyId = Long.parseLong(user.getCompanyId());
        }
        coursePublishService.publishCourse(companyId, courseId);
    }

    @ApiOperation("查询课程发布信息")
    @GetMapping("/r/coursepublish/{courseId}")
    public CoursePublish getCoursePublish(@PathVariable("courseId") Long courseId) {
        return coursePublishService.getCoursePublishCache(courseId);
    }

    @ApiOperation("获取课程发布信息")
    @GetMapping("/course/whole/{courseId}")
    public CoursePreviewDto getCoursePreviewDto(@PathVariable("courseId") Long courseId) {
        return coursePublishService.getCoursePreviewInfo(courseId);
    }
}
