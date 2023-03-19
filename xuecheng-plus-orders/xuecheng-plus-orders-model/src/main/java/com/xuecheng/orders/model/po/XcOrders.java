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
@TableName("xc_orders")
public class XcOrders implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 订单号
     */
    private Long id;

    /**
     * 总价
     */
    private Float totalPrice;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createDate;

    /**
     * 交易状态
     */
    private String status;

    /**
     * 用户id
     */
    private String userId;


    /**
     * 订单类型
     */
    private String orderType;

    /**
     * 订单名称
     */
    private String orderName;

    /**
     * 订单描述
     */
    private String orderDescrip;

    /**
     * 订单明细json
     */
    private String orderDetail;

    /**
     * 外部系统业务id
     */
    private String outBusinessId;


}
