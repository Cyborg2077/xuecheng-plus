package com.xuecheng.search.service.impl;

import com.alibaba.fastjson.JSON;
import com.xuecheng.base.model.PageParams;
import com.xuecheng.base.model.PageResult;
import com.xuecheng.search.dto.SearchCourseParamDto;
import com.xuecheng.search.dto.SearchPageResultDto;
import com.xuecheng.search.po.CourseIndex;
import com.xuecheng.search.service.CourseSearchService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.lucene.search.TotalHits;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.text.Text;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.MultiMatchQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.Aggregations;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightField;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 课程搜索service实现类
 */
@Slf4j
@Service
public class CourseSearchServiceImpl implements CourseSearchService {

    @Value("${elasticsearch.course.index}")
    private String courseIndexName;
    @Value("${elasticsearch.course.source_fields}")
    private String sourceFields;

    @Autowired
    RestHighLevelClient client;

    @Override
    public SearchPageResultDto<CourseIndex> queryCoursePubIndex(PageParams pageParams, SearchCourseParamDto courseSearchParam) {
        log.debug("ES条件查询并响应分页结果");
        // 1. 准备Request对象
        SearchRequest request = new SearchRequest(courseIndexName);
        // 2. 组织DSL参数，这里使用布尔查询
        BoolQueryBuilder boolQuery = QueryBuilders.boolQuery();
        String[] sourceFieldsArray = sourceFields.split(",");
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        // sourceFieldsArray指定要返回的字段，new String[]{}指定不返回的字段
        searchSourceBuilder.fetchSource(sourceFieldsArray, new String[]{});
        // 3. 分页
        Long pageNo = pageParams.getPageNo();
        Long pageSize = pageParams.getPageSize();
        // 3.1 指定起始查询位置和查询条数
        int start = (int) ((pageNo - 1) * pageSize);
        searchSourceBuilder.from(start)
                .size(Math.toIntExact(pageSize));
        // 3.2 指定条件查询
        if (courseSearchParam == null) {
            courseSearchParam = new SearchCourseParamDto();
        }
        // 3.2.1 匹配关键字
        if (StringUtils.isNotEmpty(courseSearchParam.getKeywords())) {
            String keywords = courseSearchParam.getKeywords();
            boolQuery.must(QueryBuilders
                    .multiMatchQuery(keywords, "name", "description")
                    .minimumShouldMatch("70%")
                    .field("name", 10));
        }
        // 3.2.2 匹配大分类
        if (StringUtils.isNotEmpty(courseSearchParam.getMt())) {
            boolQuery.filter(QueryBuilders
                    .termQuery("mtName", courseSearchParam.getMt()));
        }
        // 3.2.3 匹配小分类
        if (StringUtils.isNotEmpty(courseSearchParam.getSt())) {
            boolQuery.filter(QueryBuilders
                    .termQuery("stName", courseSearchParam.getSt()));
        }
        // 3.2.4 匹配难度
        if (StringUtils.isNotEmpty(courseSearchParam.getGrade())) {
            boolQuery.filter(QueryBuilders
                    .termQuery("grade", courseSearchParam.getGrade()));
        }
        // 4. 布尔查询
        searchSourceBuilder.query(boolQuery);
        // 高亮
        searchSourceBuilder.highlighter(new HighlightBuilder()
                .field("name")
                .preTags("<font class='eslight'>")
                .postTags("</font>"));
        request.source(searchSourceBuilder);
        // 聚合设置
        buildAggregation(request);
        // 5. 发送请求，获取响应结果
        SearchResponse response = null;
        try {
            response = client.search(request, RequestOptions.DEFAULT);
        } catch (IOException e) {
            log.debug("课程搜索异常：{}", e.getMessage());
            return new SearchPageResultDto<>(new ArrayList<>(), 0, 0, 0);
        }
        // 6. 解析响应
        SearchHits searchHits = response.getHits();
        // 6.1 获取总条数
        long totalHits = searchHits.getTotalHits().value;
        // 6.2 获取文档数组
        SearchHit[] hits = searchHits.getHits();
        ArrayList<CourseIndex> list = new ArrayList<>();
        // 6.3 遍历
        for (SearchHit hit : hits) {
            // 获取文档source
            String jsonCourseString = hit.getSourceAsString();
            // 转为CourseIndex对象
            CourseIndex courseIndex = JSON.parseObject(jsonCourseString, CourseIndex.class);
            // 获取高亮
            Map<String, HighlightField> highlightFields = hit.getHighlightFields();
            log.debug("获取高亮：{}", highlightFields);
            String name = courseIndex.getName();
            // 健壮性判断
            if (!CollectionUtils.isEmpty(highlightFields)) {
                // 获取高亮字段结果
                HighlightField highlightField = highlightFields.get("name");
                log.debug("成功获取高亮字段");
                // 健壮性判断
                if (highlightField != null) {
                    log.debug("取出高亮结果数组的第一个");
                    // 取出高亮结果数组的第一个
                    name = highlightField.getFragments()[0].toString();
                }
            }
            courseIndex.setName(name);
            list.add(courseIndex);
        }
        // 7. 封装结果
        List<String> mtList = getAggregation(response.getAggregations(), "mtAgg");
        List<String> stList = getAggregation(response.getAggregations(), "stAgg");
        SearchPageResultDto<CourseIndex> pageResult = new SearchPageResultDto<>(list, totalHits, pageNo, pageSize);
        pageResult.setMtList(mtList);
        pageResult.setStList(stList);
        return pageResult;
    }


    private void buildAggregation(SearchRequest request) {
        request.source().aggregation(AggregationBuilders
                .terms("mtAgg")
                .field("mtName")
                .size(100)
        );
        request.source().aggregation(AggregationBuilders
                .terms("stAgg")
                .field("stName")
                .size(100)
        );
    }

    /**
     * 根据聚合名称获取聚合结果
     *
     * @param aggregations 聚合对象
     * @param aggName      聚合名称
     * @return 聚合结果，返回List集合
     */
    private List<String> getAggregation(Aggregations aggregations, String aggName) {
        // 1. 根据聚合名称获取聚合结果
        Terms brandTerms = aggregations.get(aggName);
        // 2. 获取buckets
        List<? extends Terms.Bucket> buckets = brandTerms.getBuckets();
        // 3. 遍历
        List<String> brandList = new ArrayList<>();
        for (Terms.Bucket bucket : buckets) {
            // 4. 获取key
            String key = bucket.getKeyAsString();
            // 5. 加入到集合中
            brandList.add(key);
        }
        return brandList;
    }
}
