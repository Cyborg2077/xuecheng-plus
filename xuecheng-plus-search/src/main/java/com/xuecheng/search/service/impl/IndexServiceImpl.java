package com.xuecheng.search.service.impl;

import com.alibaba.fastjson.JSON;

import com.j256.simplemagic.ContentInfo;
import com.xuecheng.base.exception.XueChengPlusException;
import com.xuecheng.search.po.CourseIndex;
import com.xuecheng.search.service.IndexService;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.action.DocWriteResponse;
import org.elasticsearch.action.delete.DeleteRequest;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.update.UpdateRequest;
import org.elasticsearch.action.update.UpdateResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.xcontent.XContentType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;

/**
 * @author Mr.M
 * @version 1.0
 * @description 课程索引管理接口实现
 * @date 2022/9/25 7:23
 */
@Slf4j
@Service
public class IndexServiceImpl implements IndexService {
    @Autowired
    RestHighLevelClient client;

    @Override
    public Boolean addCourseIndex(String indexName, String id, Object object) {
        // 1. 创建request对象
        IndexRequest request = new IndexRequest(indexName).id(id);
        // 2. 准备请求参数，对应DSL语句中的JSON文档，所以要把对象序列化为JSON格式
        String jsonString = JSON.toJSONString(object);
        request.source(jsonString, XContentType.JSON);
        IndexResponse response = null;
        try {
            // 3. 发送请求
            response = client.index(request, RequestOptions.DEFAULT);
        } catch (IOException e) {
            log.debug("添加索引出错：{}", e.getMessage());
            XueChengPlusException.cast("添加索引出错");
        }
        // 4. 获取请求结果
        String result = response.getResult().name();
        // 若文档不存在，则为CREATED，若文档存在，则为UPDATED，若两者均不是，就是出错了
        return "updated".equalsIgnoreCase(result) || "created".equalsIgnoreCase(result);
    }

    @Override
    public Boolean updateCourseIndex(String indexName, String id, Object object) {

        String jsonString = JSON.toJSONString(object);
        UpdateRequest updateRequest = new UpdateRequest(indexName, id);
        updateRequest.doc(jsonString, XContentType.JSON);
        UpdateResponse updateResponse = null;
        try {
            updateResponse = client.update(updateRequest, RequestOptions.DEFAULT);
        } catch (IOException e) {
            log.error("更新索引出错:{}", e.getMessage());
            e.printStackTrace();
            XueChengPlusException.cast("更新索引出错");
        }
        DocWriteResponse.Result result = updateResponse.getResult();
        return result.name().equalsIgnoreCase("updated");

    }

    @Override
    public Boolean deleteCourseIndex(String indexName, String id) {

        //删除索引请求对象
        DeleteRequest deleteRequest = new DeleteRequest(indexName, id);
        //响应对象
        DeleteResponse deleteResponse = null;
        try {
            deleteResponse = client.delete(deleteRequest, RequestOptions.DEFAULT);
        } catch (IOException e) {
            log.error("删除索引出错:{}", e.getMessage());
            e.printStackTrace();
            XueChengPlusException.cast("删除索引出错");
        }
        //获取响应结果
        DocWriteResponse.Result result = deleteResponse.getResult();
        return result.name().equalsIgnoreCase("deleted");
    }
}
