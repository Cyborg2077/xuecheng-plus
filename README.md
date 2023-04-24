# 黑马学成在线项目
- 技术栈：Nginx、SpringBoot、Spring Cloud、Spring Security、MinIO、MyBatis-Plus、MQ、Redis、Elasticsearch
- 共分为七个模块

## 前端资源：
网盘链接：https://pan.baidu.com/s/1XSdezXLuC3UdaxAqjjJ2wg?pwd=2077 提取码：2077

## 项目基础环境搭建：
- 对应的文章地址：https://cyborg2077.github.io/2023/01/29/XuechengOnlinePart1/
## 内容管理模块（含实战内容）
- 对应的文章地址：https://cyborg2077.github.io/2023/02/02/XuechengOnlinePart2/
- 前置知识SpringCloud的相关笔记：https://cyborg2077.github.io/2022/11/08/SpringCloud/
## 媒资管理模块
- 这部分采用MinIO构建分布式文件系统
- 对应的文章地址：https://cyborg2077.github.io/2023/02/10/XuechengOnlinePart3/
## 课程发布模块
- 对应的文章地址：https://cyborg2077.github.io/2023/02/28/XuechengOnlinePart4/
- 这部分最后还用到了ElasticSearch完成搜索结果高亮，但是课程中讲的不是很详细，我的博客中也有详细介绍ElasticSearch的笔记：https://cyborg2077.github.io/2022/12/24/ElasticSearch/
## 认证授权模块（含实战内容，解决微信登录）
- 对应的文章地址：https://cyborg2077.github.io/2023/03/08/XuechengOnlinePart5/
## 选课学习模块
- 这部分还接入了支付宝的沙箱支付环境，可以模拟真实的用户扫码支付
- 支付结果也支持基于RabbitMQ实现异步消息通知处理 
- 对应的文章地址：https://cyborg2077.github.io/2023/03/17/XuechengOnlinePart6/
- RabbitMQ的前置知识也可以参阅我这篇文章：https://cyborg2077.github.io/2022/12/22/MeassageQueue/
## 项目优化
- 这部分主要是用Redis来缓存一些热点数据，粗略介绍了一点缓存穿透、缓存雪崩、缓存击穿和分布式锁的实现
- 对应的文章地址：https://cyborg2077.github.io/2023/03/23/XuechengOnlinePart7/
- 但是这里的Redis讲解很潦草，建议看我这篇文章深入学习一下Redis：https://cyborg2077.github.io/2022/10/22/RedisPractice/
