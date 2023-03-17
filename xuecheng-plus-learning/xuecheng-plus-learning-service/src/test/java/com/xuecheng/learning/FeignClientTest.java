package com.xuecheng.learning;

import com.xuecheng.content.model.po.CoursePublish;
import com.xuecheng.learning.feignclient.ContentServiceClient;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


/**
 * @author Mr.M
 * @version 1.0
 * @description TODO
 * @date 2023/2/22 20:14
 */
@SpringBootTest
public class FeignClientTest {

    @Autowired
    ContentServiceClient contentServiceClient;

    @Test
    public void testContentServiceClient() {
        CoursePublish coursepublish = contentServiceClient.getCoursePublish(160L);
        System.out.println(coursepublish);
    }
}