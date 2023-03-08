package com.xuecheng.search.service;

import com.xuecheng.search.po.CourseIndex;

/**
 *  课程索引service
 */
public interface IndexService {

    /**
     * 添加索引
     * @param indexName 索引名称
     * @param id        主键
     * @param object    索引对象
     * @return          true：添加成功；false：添加失败
     */
    Boolean addCourseIndex(String indexName, String id, Object object);


    /**
     * @param indexName 索引名称
     * @param id        主键
     * @param object    索引对象
     * @return Boolean true表示成功,false失败
     * @description 更新索引
     * @author Mr.M
     * @date 2022/9/25 7:49
     */
    Boolean updateCourseIndex(String indexName, String id, Object object);

    /**
     * @param indexName 索引名称
     * @param id        主键
     * @return java.lang.Boolean
     * @description 删除索引
     * @author Mr.M
     * @date 2022/9/25 9:27
     */
    Boolean deleteCourseIndex(String indexName, String id);

}
