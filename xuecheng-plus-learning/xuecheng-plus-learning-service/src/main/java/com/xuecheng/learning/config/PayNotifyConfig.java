package com.xuecheng.learning.config;

import com.alibaba.fastjson.JSON;
import com.xuecheng.messagesdk.model.po.MqMessage;
import com.xuecheng.messagesdk.service.MqMessageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.*;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Slf4j
@Configuration
public class PayNotifyConfig {

    //交换机
    public static final String PAYNOTIFY_EXCHANGE_FANOUT = "paynotify_exchange_fanout";
    //支付结果通知消息类型
    public static final String MESSAGE_TYPE = "payresult_notify";
    //支付通知队列
    public static final String PAYNOTIFY_QUEUE = "paynotify_queue";

    //声明交换机，且持久化
    @Bean(PAYNOTIFY_EXCHANGE_FANOUT)
    public FanoutExchange paynotify_exchange_fanout() {
        // 三个参数：交换机名称、是否持久化、当没有queue与其绑定时是否自动删除
        return new FanoutExchange(PAYNOTIFY_EXCHANGE_FANOUT, true, false);
    }

    //支付通知队列,且持久化
    @Bean(PAYNOTIFY_QUEUE)
    public Queue course_publish_queue() {
        return QueueBuilder.durable(PAYNOTIFY_QUEUE).build();
    }

    //交换机和支付通知队列绑定
    @Bean
    public Binding binding_course_publish_queue(@Qualifier(PAYNOTIFY_QUEUE) Queue queue, @Qualifier(PAYNOTIFY_EXCHANGE_FANOUT) FanoutExchange exchange) {
        return BindingBuilder.bind(queue).to(exchange);
    }

}
