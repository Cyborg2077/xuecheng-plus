package com.xuecheng.ucenter.service;

import com.xuecheng.ucenter.model.po.XcUser;

public interface WxAuthService {
    XcUser wxAuth(String code);
}
