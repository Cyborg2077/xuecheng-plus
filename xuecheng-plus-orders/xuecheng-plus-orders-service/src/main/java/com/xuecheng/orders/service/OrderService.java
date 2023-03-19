package com.xuecheng.orders.service;

import com.xuecheng.messagesdk.model.po.MqMessage;
import com.xuecheng.orders.model.dto.AddOrderDto;
import com.xuecheng.orders.model.dto.PayRecordDto;
import com.xuecheng.orders.model.dto.PayStatusDto;
import com.xuecheng.orders.model.po.XcPayRecord;

public interface OrderService {
    /**
     * 创建商品订单
     * @param userId        用户id
     * @param addOrderDto   订单信息
     * @return  支付交易记录
     */
    PayRecordDto createOrder(String userId, AddOrderDto addOrderDto);

    /**
     * 查询支付交易记录
     * @param payNo 交易记录号
     * @return
     */
    XcPayRecord getPayRecordByPayNo(String payNo);

    /**
     * 请求支付宝查询支付结果
     * @param payNo 支付记录id
     * @return  支付记录信息
     */
    PayRecordDto queryPayResult(String payNo);

    void saveAlipayStatus(PayStatusDto payStatusDto);

    /**
     * 发送通知结果
     * @param mqMessage 消息
     */
    void notifyPayResult(MqMessage mqMessage);
}
