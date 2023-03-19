package com.xuecheng.orders.model.po;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
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
@TableName("xc_pay_record")
public class XcPayRecord implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 支付记录号
     */
    private Long id;

    /**
     * 本系统支付交易号
     */
    private Long payNo;

    /**
     * 第三方支付交易流水号
     */
    private String outPayNo;

    /**
     * 第三方支付渠道编号
     */
    private String outPayChannel;

    /**
     * 商品订单号
     */
    private Long orderId;

    /**
     * 订单名称
     */
    private String orderName;
    /**
     * 订单总价单位元
     */
    private Float totalPrice;

    /**
     * 币种CNY
     */
    private String currency;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createDate;

    /**
     * 支付状态
     */
    private String status;

    /**
     * 支付成功时间
     */
    private LocalDateTime paySuccessTime;

    /**
     * 用户id
     */
    private String userId;



}
