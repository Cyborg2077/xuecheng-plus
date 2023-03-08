package com.xuecheng.content.feignclient;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;


@Slf4j
@Component
public class MediaServiceClientFallback implements MediaServiceClient{
    @Override
    public String upload(MultipartFile upload, String folder, String objectName) {
        log.debug("方式一：熔断处理，无法获取异常");
        return null;
    }
}
