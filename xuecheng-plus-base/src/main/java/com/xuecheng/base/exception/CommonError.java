
package com.xuecheng.base.exception;


/**
 * @description 通用错误信息
 */
public enum CommonError {
	UNKOWN_ERROR("执行过程异常，请重试"),
	PARAS_ERROR("非法参数"),
	OBJECT_NULL("对象为空"),
	QUERY_NULL("查询结果为空"),
	REQUEST_NULL("请求参数为空");

	private String errMessage;

	public String getErrMessage() {
		return errMessage;
	}

	CommonError(String errMessage) {
		this.errMessage = errMessage;
	}
}
