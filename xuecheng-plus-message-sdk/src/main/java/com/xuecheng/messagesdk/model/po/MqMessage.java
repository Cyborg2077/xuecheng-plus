package com.xuecheng.messagesdk.model.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.ToString;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 
 * </p>
 *
 * @author itcast
 */
@Data
@ToString
@TableName("mq_message")
public class MqMessage implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 消息id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 消息类型代码: course_publish ,  media_test,
     */
    private String messageType;

    /**
     * 关联业务信息
     */
    private String businessKey1;

    /**
     * 关联业务信息
     */
    private String businessKey2;

    /**
     * 关联业务信息
     */
    private String businessKey3;

    /**
     * 执行次数
     */
    private Integer executeNum;

    /**
     * 处理状态，0:初始，1:成功
     */
    private String state;

    /**
     * 回复失败时间
     */
    private LocalDateTime returnfailureDate;

    /**
     * 回复成功时间
     */
    private LocalDateTime returnsuccessDate;

    /**
     * 回复失败内容
     */
    private String returnfailureMsg;

    /**
     * 最近执行时间
     */
    private LocalDateTime executeDate;

    /**
     * 阶段1处理状态, 0:初始，1:成功
     */
    private String stageState1;

    /**
     * 阶段2处理状态, 0:初始，1:成功
     */
    private String stageState2;

    /**
     * 阶段3处理状态, 0:初始，1:成功
     */
    private String stageState3;

    /**
     * 阶段4处理状态, 0:初始，1:成功
     */
    private String stageState4;


}
