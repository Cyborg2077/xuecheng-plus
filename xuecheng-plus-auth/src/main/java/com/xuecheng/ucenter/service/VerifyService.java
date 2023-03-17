package com.xuecheng.ucenter.service;

import com.xuecheng.ucenter.model.dto.FindPswDto;
import com.xuecheng.ucenter.model.dto.RegisterDto;

public interface VerifyService {
    void findPassword(FindPswDto findPswDto);

    void register(RegisterDto registerDto);
}
