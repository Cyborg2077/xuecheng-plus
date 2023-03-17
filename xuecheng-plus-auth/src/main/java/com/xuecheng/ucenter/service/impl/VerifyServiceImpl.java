package com.xuecheng.ucenter.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.xuecheng.ucenter.mapper.XcUserMapper;
import com.xuecheng.ucenter.mapper.XcUserRoleMapper;
import com.xuecheng.ucenter.model.dto.FindPswDto;
import com.xuecheng.ucenter.model.dto.RegisterDto;
import com.xuecheng.ucenter.model.po.XcUser;
import com.xuecheng.ucenter.model.po.XcUserRole;
import com.xuecheng.ucenter.service.VerifyService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.UUID;

@Service
public class VerifyServiceImpl implements VerifyService {
    @Autowired
    XcUserMapper userMapper;
    @Autowired
    XcUserRoleMapper xcUserRoleMapper;
    @Autowired
    StringRedisTemplate redisTemplate;

    public Boolean verify(String email, String checkcode) {
        // 1. 从redis中获取缓存的验证码
        String codeInRedis = redisTemplate.opsForValue().get(email);
        // 2. 判断是否与用户输入的一致
        if (codeInRedis.equalsIgnoreCase(checkcode)) {
            redisTemplate.delete(email);
            return true;
        }
        return false;
    }

    @Override
    public void findPassword(FindPswDto findPswDto) {
        String email = findPswDto.getEmail();
        String checkcode = findPswDto.getCheckcode();
        Boolean verify = verify(email, checkcode);
        if (!verify) {
            throw new RuntimeException("验证码输入错误");
        }
        String password = findPswDto.getPassword();
        String confirmpwd = findPswDto.getConfirmpwd();
        if (!password.equals(confirmpwd)) {
            throw new RuntimeException("两次输入的密码不一致");
        }
        LambdaQueryWrapper<XcUser> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(XcUser::getEmail, findPswDto.getEmail());
        XcUser user = userMapper.selectOne(lambdaQueryWrapper);
        if (user == null) {
            throw new RuntimeException("用户不存在");
        }
        user.setPassword(new BCryptPasswordEncoder().encode(password));
        userMapper.updateById(user);
    }

    @Override
    @Transactional
    public void register(RegisterDto registerDto) {
        String uuid = UUID.randomUUID().toString();
        String email = registerDto.getEmail();
        String checkcode = registerDto.getCheckcode();
        Boolean verify = verify(email, checkcode);
        if (!verify) {
            throw new RuntimeException("验证码输入错误");
        }
        String password = registerDto.getPassword();
        String confirmpwd = registerDto.getConfirmpwd();
        if (!password.equals(confirmpwd)) {
            throw new RuntimeException("两次输入的密码不一致");
        }
        LambdaQueryWrapper<XcUser> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(XcUser::getEmail, registerDto.getEmail());
        XcUser user = userMapper.selectOne(lambdaQueryWrapper);
        if (user != null) {
            throw new RuntimeException("用户已存在，一个邮箱只能注册一个账号");
        }
        XcUser xcUser = new XcUser();
        BeanUtils.copyProperties(registerDto, xcUser);
        xcUser.setPassword(new BCryptPasswordEncoder().encode(password));
        xcUser.setId(uuid);
        xcUser.setUtype("101001");  // 学生类型
        xcUser.setStatus("1");
        xcUser.setName(registerDto.getNickname());
        xcUser.setCreateTime(LocalDateTime.now());
        int insert = userMapper.insert(xcUser);
        if (insert <= 0) {
            throw new RuntimeException("新增用户信息失败");
        }
        XcUserRole xcUserRole = new XcUserRole();
        xcUserRole.setId(uuid);
        xcUserRole.setUserId(uuid);
        xcUserRole.setRoleId("17");
        xcUserRole.setCreateTime(LocalDateTime.now());
        int insert1 = xcUserRoleMapper.insert(xcUserRole);
        if (insert1 <= 0) {
            throw new RuntimeException("新增用户角色信息失败");
        }
    }
}
