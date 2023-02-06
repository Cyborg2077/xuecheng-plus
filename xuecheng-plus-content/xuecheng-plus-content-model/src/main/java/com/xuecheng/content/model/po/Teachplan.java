package com.xuecheng.content.model.po;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 课程计划
 * </p>
 *
 * @author cyborg2077
 */
@Data
@TableName("teachplan")
public class Teachplan implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 课程计划名称
     */
    @ApiModelProperty(value = "课程计划名称", required = true)
    private String pname;

    /**
     * 课程计划父级Id
     */
    @ApiModelProperty(value = "课程计划父级Id", required = true)
    private Long parentid;

    /**
     * 层级，分为1、2、3级
     */
    @ApiModelProperty(value = "层级，分为1、2、3级", required = true)
    private Integer grade;

    /**
     * 课程类型:1视频、2文档
     */
    @ApiModelProperty(value = "课程类型:1视频、2文档", required = true)
    private String mediaType;

    /**
     * 开始直播时间
     */
    @ApiModelProperty(value = "开始直播时间", required = true)
    private LocalDateTime startTime;

    /**
     * 直播结束时间
     */
    @ApiModelProperty(value = "直播结束时间", required = true)
    private LocalDateTime endTime;

    /**
     * 章节及课程时介绍
     */
    @ApiModelProperty(value = "章节及课程时介绍", required = true)
    private String description;

    /**
     * 时长，单位时:分:秒
     */
    @ApiModelProperty(value = "时长，单位时:分:秒", required = true)
    private String timelength;

    /**
     * 排序字段
     */
    @ApiModelProperty(value = "排序字段", required = true)
    private Integer orderby;

    /**
     * 课程标识
     */
    @ApiModelProperty(value = "课程标识", required = true)
    private Long courseId;

    /**
     * 课程发布标识
     */
    @ApiModelProperty(value = "课程发布标识", required = true)
    private Long coursePubId;

    /**
     * 状态（1正常  0删除）
     */
    @ApiModelProperty(value = "状态（1正常  0删除）", required = true)
    private Integer status;

    /**
     * 是否支持试学或预览（试看）
     */
    @ApiModelProperty(value = "是否支持试学或预览（试看）", required = true)
    private String isPreview;

    /**
     * 创建时间
     */
    @ApiModelProperty(value = "创建时间", required = true)
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createDate;

    /**
     * 修改时间
     */
    @ApiModelProperty(value = "修改时间", required = true)
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime changeDate;


}
