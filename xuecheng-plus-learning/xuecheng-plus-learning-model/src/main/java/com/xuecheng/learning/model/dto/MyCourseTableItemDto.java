package com.xuecheng.learning.model.dto;

import com.xuecheng.learning.model.po.XcCourseTables;
import lombok.Data;
import lombok.ToString;

import java.time.LocalDateTime;

/**
 * @author Mr.M
 * @version 1.0
 * @description 我的课程查询条件
 * @date 2022/10/6 9:42
 */
@Data
@ToString
public class MyCourseTableItemDto extends XcCourseTables {

    /**
     * 最近学习时间
     */
    private LocalDateTime learnDate;

    /**
     * 学习时长
     */
    private Long learnLength;

    /**
     * 章节id
     */
    private Long teachplanId;

    /**
     * 章节名称
     */
    private String teachplanName;


}
