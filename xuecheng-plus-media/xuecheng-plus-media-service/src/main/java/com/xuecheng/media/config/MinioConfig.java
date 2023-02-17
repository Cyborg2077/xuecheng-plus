package com.xuecheng.media.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * minio配置
 */
@Configuration
public class MinioConfig {
    @Value("${minio.endpoint}")
    private String endpoint;
    @Value("${minio.accessKey}")
    private String accessKey;
    @Value("${minio.secretKey}")
    private String secretKey;

    @Bean
    public io.minio.MinioClient minioClient() {
        return io.minio.MinioClient.builder().
                endpoint(endpoint).
                credentials(accessKey, secretKey).
                build();
    }
}
