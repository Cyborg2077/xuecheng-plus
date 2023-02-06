package com.xuecheng.content.model.dto;

import com.xuecheng.content.model.po.Teachplan;
import com.xuecheng.content.model.po.TeachplanMedia;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

@Data
public class TeachplanDto extends Teachplan {
    @ApiModelProperty(value = "课程媒资信息", required = true)
    private TeachplanMedia teachplanMedia;
    @ApiModelProperty(value = "课程计划子目录", required = true)
    private List<TeachplanDto> teachPlanTreeNodes;
}
