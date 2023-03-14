package com.xuecheng.ucenter.service;

public interface VerifyService {
    /**
     * 校验验证码是否正确
     * @param email 邮箱
     * @param checkcode  用户输入的验证码
     * @return
     */
    Boolean verify(String email, String checkcode);
}
