package com.xuecheng.content.service;

import com.xuecheng.content.model.dto.BindTeachplanMediaDto;
import com.xuecheng.content.model.dto.TeachplanDto;
import com.xuecheng.content.model.po.Teachplan;

import java.util.List;

public interface TeachplanService {
    List<TeachplanDto> findTeachplanTree(Long courseId);

    void saveTeachplan(Teachplan teachplan);

    void deleteTeachplan(Long teachplanId);

    void orderByTeachplan(String moveType, Long teachplanId);

    Teachplan getTeachplan(Long teachplanId);

    /**
     * 教学计划绑定媒资信息
     *
     * @param bindTeachplanMediaDto
     */
    void associationMedia(BindTeachplanMediaDto bindTeachplanMediaDto);

    /** 解绑教学计划与媒资信息
     * @param teachPlanId       教学计划id
     * @param mediaId           媒资信息id
     */
    void unassociationMedia(Long teachPlanId, String mediaId);
}
