package com.xuecheng.content.service.jobhandler;

import com.xuecheng.base.exception.XueChengPlusException;
import com.xuecheng.content.service.CoursePublishService;
import com.xuecheng.messagesdk.model.po.MqMessage;
import com.xuecheng.messagesdk.service.MessageProcessAbstract;
import com.xuecheng.messagesdk.service.MqMessageService;
import com.xxl.job.core.context.XxlJobHelper;
import com.xxl.job.core.handler.annotation.XxlJob;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.File;

@Slf4j
@Component
public class CoursePublishTask extends MessageProcessAbstract {
    @Autowired
    private CoursePublishService coursePublishService;

    @XxlJob("CoursePublishJobHandler")
    private void coursePublishJobHandler() {
        int shardIndex = XxlJobHelper.getShardIndex();
        int shardTotal = XxlJobHelper.getShardTotal();
        process(shardIndex, shardTotal, "course_publish", 5, 60);
    }

    @Override
    public boolean execute(MqMessage mqMessage) {
        log.debug("开始执行课程发布任务，课程id：{}", mqMessage.getBusinessKey1());
        // TODO 一阶段：将课程信息静态页面上传至MinIO
        String courseId = mqMessage.getBusinessKey1();
        generateCourseHtml(mqMessage, Long.valueOf(courseId));

        // TODO 二阶段：存储到Redis

        // TODO 三阶段：存储到ElasticSearch
        saveCourseIndex(mqMessage, Long.valueOf(courseId));
        // 三阶段都成功，返回true
        return true;
    }

    private void generateCourseHtml(MqMessage mqMessage, Long courseId) {
        log.debug("开始课程静态化，课程id：{}", courseId);
        // 1. 幂等性判断
        // 1.1 获取消息id
        Long id = mqMessage.getId();
        // 1.2 获取小任务阶段状态
        MqMessageService mqMessageService = this.getMqMessageService();
        int stageOne = mqMessageService.getStageOne(id);
        // 1.3 判断小任务阶段是否完成
        if (stageOne == 1) {
            log.debug("当前阶段为静态化课程信息任务，已完成，无需再次处理，任务信息：{}", mqMessage);
            return;
        }
        // 2. 生成静态页面
        File file = coursePublishService.generateCourseHtml(courseId);
        if (file == null) {
            XueChengPlusException.cast("课程静态化异常");
        }
        // 3. 将静态页面上传至MinIO
        coursePublishService.uploadCourseHtml(courseId, file);
        // 4. 保存第一阶段状态
        mqMessageService.completedStageOne(id);
    }


    public void saveCourseIndex(MqMessage mqMessage, Long courseId) {
        log.debug("正在保存课程信息索引，课程id:{}", courseId);
        // 1. 获取消息id
        Long id = mqMessage.getId();
        // 2. 获取小任务阶段状态
        MqMessageService mqMessageService = this.getMqMessageService();
        int stageTwo = mqMessageService.getStageTwo(id);
        // 3. 当前小任务完成，无需再次处理
        if (stageTwo == 1) {
            log.debug("当前阶段为创建课程索引任务，已完成，无需再次处理，任务信息：{}", mqMessage);
            return;
        }
        // 4. 远程调用保存课程索引接口，将课程信息上传至ElasticSearch
        Boolean result = coursePublishService.saveCourseIndex(courseId);
        if (result) {
            mqMessageService.completedStageTwo(id);
        }
    }
}
