package com.xuecheng.orders;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
public class OrdersApplication {
	public static void main(String[] args) {
		SpringApplication.run(OrdersApplication.class, args);
	}
}