package com.xuecheng.checkcode.service;

import com.xuecheng.checkcode.model.CheckCodeParamsDto;
import com.xuecheng.checkcode.model.CheckCodeResultDto;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;

/**
 * @author Mr.M
 * @version 1.0
 * @description 验证码接口
 * @date 2022/9/29 15:59
 */
@Slf4j
public abstract class AbstractCheckCodeService implements CheckCodeService {

    protected CheckCodeGenerator checkCodeGenerator;
    protected KeyGenerator keyGenerator;
    protected CheckCodeStore checkCodeStore;

    public abstract void  setCheckCodeGenerator(CheckCodeGenerator checkCodeGenerator);
    public abstract void  setKeyGenerator(KeyGenerator keyGenerator);
    public abstract void  setCheckCodeStore(CheckCodeStore CheckCodeStore);


    /**
     * @description 生成验证公用方法
     * @param checkCodeParamsDto 生成验证码参数
     * @param code_length 验证码长度
     * @param keyPrefix key的前缀
     * @param expire 过期时间
     * @return com.xuecheng.checkcode.service.AbstractCheckCodeService.GenerateResult 生成结果
     * @author Mr.M
     * @date 2022/9/30 6:07
    */
    public GenerateResult generate(CheckCodeParamsDto checkCodeParamsDto,Integer code_length,String keyPrefix,Integer expire){
        //生成四位验证码
        String code = checkCodeGenerator.generate(code_length);
        log.debug("生成验证码:{}",code);
        //生成一个key
        String key = keyGenerator.generate(keyPrefix);

        //存储验证码
        checkCodeStore.set(key,code,expire);
        //返回验证码生成结果
        GenerateResult generateResult = new GenerateResult();
        generateResult.setKey(key);
        generateResult.setCode(code);
        return generateResult;
    }

    @Data
    protected class GenerateResult{
        String key;
        String code;
    }


    public abstract CheckCodeResultDto generate(CheckCodeParamsDto checkCodeParamsDto);


    public boolean verify(String key, String code){
        if (StringUtils.isBlank(key) || StringUtils.isBlank(code)){
            return false;
        }
        String code_l = checkCodeStore.get(key);
        if (code_l == null){
            return false;
        }
        boolean result = code_l.equalsIgnoreCase(code);
        if(result){
            //删除验证码
            checkCodeStore.remove(key);
        }
        return result;
    }


}
