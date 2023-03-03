package com.xuecheng.content.service;

import com.xuecheng.content.model.dto.CoursePreviewDto;

/**
 * 课程预览、发布接口
 */
public interface CoursePublishService {
    /**
     * 获取课程预览信息
     * @param courseId  课程id
     * @return  package com.xuecheng.content.model.dto.CoursePreviewDto;
     */
    CoursePreviewDto getCoursePreviewInfo(Long courseId);
}
