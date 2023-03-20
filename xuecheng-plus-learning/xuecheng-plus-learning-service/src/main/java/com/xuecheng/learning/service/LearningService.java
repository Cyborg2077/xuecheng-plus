package com.xuecheng.learning.service;


import com.xuecheng.base.model.RestResponse;

public interface LearningService {
    RestResponse<String> getVideo(String userId, Long courseId, Long teachplanId, String mediaId);
}