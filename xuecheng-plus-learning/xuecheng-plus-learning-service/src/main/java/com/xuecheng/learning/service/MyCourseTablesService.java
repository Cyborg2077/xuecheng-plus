package com.xuecheng.learning.service;

import com.xuecheng.base.model.PageResult;
import com.xuecheng.content.model.po.CoursePublish;
import com.xuecheng.learning.model.dto.MyCourseTableParams;
import com.xuecheng.learning.model.dto.XcChooseCourseDto;
import com.xuecheng.learning.model.dto.XcCourseTablesDto;
import com.xuecheng.learning.model.po.XcChooseCourse;
import com.xuecheng.learning.model.po.XcCourseTables;

public interface MyCourseTablesService {
    /**
     * 添加选课
     * @param userId    用户id
     * @param courseId  课程id
     */
    XcChooseCourseDto addChooseCourse(String userId, Long courseId);

    /**
     * 获取学习资格
     * @param userId        用户id
     * @param courseId      课程id
     * @return  学习资格状态
     */
    XcCourseTablesDto getLearningStatus(String userId, Long courseId);

    XcChooseCourse addFreeCourse(String userId, CoursePublish coursePublish);

    XcChooseCourse addChargeCourse(String userId, CoursePublish coursePublish);

    boolean saveChooseCourseStatus(String chooseCourseId);

    PageResult<XcCourseTables> myCourseTables(MyCourseTableParams params);
}
