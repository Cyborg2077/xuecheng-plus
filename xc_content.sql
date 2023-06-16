/*
 Navicat Premium Data Transfer

 Source Server         : MySQL8.0
 Source Server Type    : MySQL
 Source Server Version : 80029 (8.0.29)
 Source Host           : localhost:3306
 Source Schema         : xc_content

 Target Server Type    : MySQL
 Target Server Version : 80029 (8.0.29)
 File Encoding         : 65001

 Date: 16/06/2023 15:26:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course_audit
-- ----------------------------
DROP TABLE IF EXISTS `course_audit`;
CREATE TABLE `course_audit`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_id` bigint NOT NULL COMMENT '课程id',
  `audit_mind` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `audit_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '审核状态',
  `audit_people` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_date` datetime NULL DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_audit
-- ----------------------------

-- ----------------------------
-- Table structure for course_base
-- ----------------------------
DROP TABLE IF EXISTS `course_base`;
CREATE TABLE `course_base`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_id` bigint NOT NULL COMMENT '机构ID',
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `users` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '适用人群',
  `tags` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程标签',
  `mt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '大分类',
  `st` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小分类',
  `grade` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程等级',
  `teachmode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教育模式(common普通，record 录播，live直播等）',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '课程介绍',
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程图片',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `change_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `create_people` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `change_people` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `audit_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审核状态',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '课程发布状态 未发布  已发布 下线',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程基本信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_base
-- ----------------------------
INSERT INTO `course_base` VALUES (1, 22, NULL, 'JAVA8/9/10新特性讲解啊', 'java爱好者,有一定java基础', '有个java 版本变化的新内容，帮助大家使用最新的思想和工具', '1', '1-3-2', '204002', '200002', NULL, 'https://cdn.educba.com/academy/wp-content/uploads/2018/08/Spring-BOOT-Interview-questions.jpg', '2019-09-03 17:48:19', '2023-02-06 20:27:45', '1', NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (2, 1232141425, 'Test1', '测试课程01', 'IT爱好者IT爱好者IT爱好者IT爱好者IT爱好者IT爱好者IT爱好者IT爱好者', '课程标签', '1-1', '1-1-1', '204001', '200002', '测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程', '/mediafiles/2022/09/18/a16da7a132559daf9e1193166b3e7f52.jpg', '2019-09-04 08:49:26', '2023-02-07 17:36:31', NULL, NULL, '202004', '203002');
INSERT INTO `course_base` VALUES (7, 1232141425, 'Test3', 'wode24', '高级程师', NULL, '1', '1-3-2', '204003', '200002', NULL, 'https://cdn.educba.com/academy/wp-content/uploads/2018/08/Spring-BOOT-Interview-questions.jpg', '2019-09-04 09:56:19', '2023-02-07 17:36:48', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (18, 1232141425, NULL, 'java零基础入门', 'java小白java小白java小白java小白', 'aa', '1-3', '1-3-2', '200001', '200002', 'java零基础入门java零基础入门java零基础入门java零基础入门', '/mediafiles/2022/09/13/a16da7a132559daf9e1193166b3e7f52.jpg', '2019-09-04 09:56:19', '2023-03-05 19:04:42', NULL, NULL, '203002', '203001');
INSERT INTO `course_base` VALUES (22, 1232141425, NULL, '大数据2', '具有一定的java基础', NULL, '1-6', '1-6-1', '200001', '200002', '111111大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据大数据', 'https://cdn.educba.com/academy/wp-content/uploads/2018/08/Spring-BOOT-Interview-questions.jpg', '2019-09-04 09:56:19', '2022-09-16 07:59:57', NULL, NULL, '202001', '203001');
INSERT INTO `course_base` VALUES (24, 1232141425, NULL, '人工智能+python', '人工智能+python非常不错！！！人工智能+python非常不错！！！人工智能+python非常不错！！！', NULL, '1-6', '1-6-5', '200002', '200002', '人工智能+python非常不错！！！人工智能+python非常不错！！！', 'https://cdn.educba.com/academy/wp-content/uploads/2018/08/Spring-BOOT-Interview-questions.jpg', '2019-09-04 09:56:19', '2023-03-07 22:43:27', NULL, NULL, '203002', '203001');
INSERT INTO `course_base` VALUES (25, 1232141425, NULL, 'Bootstrap开发框架', 'Bootstrap是由Twitter推出的一个前台页面开发框架，在行业之中使用较为广泛。此开发框架包含了大量的CSS、JS程序代码，可以帮助开发者（尤其是不擅长页面开发的程序人员）轻松的实现一个不受浏览器限制的精美界面效果。', NULL, '1-1', '1-1-1', '200002', '200002', 'Bootstrap是由Twitter推出的一个前台页面开发框架，在行业之中使用较为广泛。此开发框架包含了大量的CSS、JS程序代码，可以帮助开发者（尤其是不擅长页面开发的程序人员）轻松的实现一个不受浏览器限制的精美界面效果。', 'https://cdn.educba.com/academy/wp-content/uploads/2018/08/Spring-BOOT-Interview-questions.jpg', '2019-09-04 09:56:19', '2022-09-09 21:13:51', NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (26, 1232141425, NULL, 'spring cloud实战', '所有人', NULL, '1-3', '1-3-2', '200003', '200002', '本课程主要从四个章节进行讲解： 1.微服务架构入门 2.spring cloud 基础入门 3.实战Spring Boot 4.注册中心eureka。', 'https://cdn.educba.com/academy/wp-content/uploads/2018/08/Spring-BOOT-Interview-questions.jpg', '2019-09-04 09:56:19', '2021-12-26 22:10:38', NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (27, 1232141425, NULL, 'Javascript之VueJS', '所有人', NULL, '1-1', '1-1-9', '200002', '200002', 'Vue系列课程：从Vue1.0讲到Vue2.0，从理论讲到实战，理论与案例巧妙结合，让课程更容易理解！', 'https://cdn.educba.com/academy/wp-content/uploads/2018/08/Spring-BOOT-Interview-questions.jpg', '2019-09-04 09:56:19', NULL, NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (28, 1232141425, NULL, 'Redis从入门到项目实战', '', NULL, '1-3', '1-3-2', '200002', '200002', 'redis在当前的大型网站和500强企业中，已被广泛应用。 redis是基于内存的key-value数据库，比传统的关系型数据库在性能方面有非常大的优势。 肖老师这套视频，精选了redis在实际项目中的十几个应用场景。通过本课程的学习，可以让学员快速掌握redis在实际项目中如何应用。 作为架构师，redis是必须要掌握的技能！', 'https://cdn.educba.com/academy/wp-content/uploads/2018/08/Spring-BOOT-Interview-questions.jpg', '2019-09-04 09:56:19', NULL, NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (39, 1, NULL, 'SpringBoot核心11111', 'Spring Boot初学者', 'Spring项目的快速构建', '1-3', '1-3-2', '200003', '200002', '课程系统性地深度探讨 Spring Boot 核心特性，引导小伙伴对 Java 规范的重视，启发对技术原理性的思考，掌握排查问题的技能，以及学习阅读源码的方法和技巧，全面提升研发能力，进军架构师队伍。', 'https://cdn.educba.com/academy/wp-content/uploads/2018/08/Spring-BOOT-Interview-questions.jpg', '2019-09-10 16:03:51', '2019-09-11 14:53:17', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (40, 1232141425, NULL, 'SpringBoot核心', 'Spring Boot初学者', 'Spring项目的快速构建', '1-3', '1-3-2', '200003', '200002', '课程系统性地深度探讨 Spring Boot 核心特性，引导小伙伴对 Java 规范的重视，启发对技术原理性的思考，掌握排查问题的技能，以及学习阅读源码的方法和技巧，全面提升研发能力，进军架构师队伍。', 'https://cdn.educba.com/academy/wp-content/uploads/2018/08/Spring-BOOT-Interview-questions.jpg', '2019-09-10 16:05:39', '2022-09-16 08:07:41', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (71, 1232141425, '', 'java入门', '初学者', 'java', '1-3', '1-3-2', '204001', '200002', 'java入门', 'http://r3zc5rung.hd-bkt.clouddn.com/d8ff4b26-3611-486b-b101-dd14646e1316CpWXDoUKfAkzdYlM', '2021-12-17 22:28:35', '2021-12-21 00:27:10', '', '', '202004', '203001');
INSERT INTO `course_base` VALUES (72, 1232141425, NULL, '卢中耀讲java', 'group01', '', '1-1', '1-1-1', '204001', '200002', '卢中耀牛逼', 'http://r3zc5rung.hd-bkt.clouddn.com/53659164-6287-4e8e-b516-4e01b451abd1crlkQdKe3v13QIS0', '2021-12-25 16:17:50', '2021-12-25 17:45:04', NULL, NULL, '202003', '203001');
INSERT INTO `course_base` VALUES (73, 1232141425, NULL, '111', '111', '111', '1-1', '1-1-1', '204001', '200002', '111', 'http://r3zc5rung.hd-bkt.clouddn.com/c6e8f95e-435f-4d26-8d8d-0e3291443bb2v3Epoz06pYcxUJa8', '2021-12-25 17:50:28', '2021-12-25 18:19:11', NULL, NULL, '202003', '203001');
INSERT INTO `course_base` VALUES (74, 1232141425, NULL, '思想政治', '中小学生中小学生中小学生中小学生', '', '1-1', '1-1-1', '204001', '200002', '思想政治思想政治思想政治', '/bucket-pic/2022/08/25/44fd0d55-b4d6-4d13-9127-abdf48030218.png', '2021-12-25 17:53:07', '2022-09-16 15:54:56', NULL, NULL, '202004', '203002');
INSERT INTO `course_base` VALUES (75, 1232141425, NULL, '测试课程001', '初学者初学者初学者初学者', 'aa', '1-3', '1-3-3', '204001', '200002', '测试课程001', '', '2021-12-26 18:21:44', '2022-09-08 22:05:45', NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (76, 1232141425, NULL, '3w点', '小学生', '22', '1-1', '1-1-1', '204003', '200002', '无', '', '2021-12-26 19:59:38', '2021-12-27 16:08:51', NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (77, 1232141425, NULL, '测试10', '1', '无', '1-1', '1-1-1', '204003', '200002', '1', '', '2021-12-26 20:01:59', '2022-08-22 18:25:48', NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (78, 1232141425, NULL, '测试', '1', '123', '1-1', '1-1-1', '204001', '200002', '1', '', '2021-12-26 20:54:22', '2021-12-27 11:14:29', NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (79, 1232141425, NULL, 'Spring', 'Spring', 'Spring', '1-3', '1-3-3', '204001', '200002', 'Spring', 'http://r3zc5rung.hd-bkt.clouddn.com/d96b3f2a-7c72-42e1-89bb-200558027f05flX5NNF7EklC9sqe', '2021-12-27 10:34:34', '2021-12-27 10:50:01', NULL, NULL, '202003', '203001');
INSERT INTO `course_base` VALUES (80, 1232141425, NULL, 'Java Web', 'Java Web', 'Java Web', '1-3', '1-3-3', '204001', '200002', 'Java Web', 'http://r3zc5rung.hd-bkt.clouddn.com/a3ad6341-b9dc-4e82-a571-88786945001aKrbAuMnLP0jHK8hB', '2021-12-27 11:08:29', '2021-12-27 11:11:44', NULL, NULL, '202003', '203001');
INSERT INTO `course_base` VALUES (81, 1232141425, NULL, 'Spring Boot', 'Spring Boot', 'Spring Boot', '1-5', '1-5-5', '204002', '200002', 'Spring Boot', '', '2021-12-27 11:27:59', '2021-12-27 11:38:20', NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (82, 1232141425, NULL, 'Spring Boot入门', 'Spring 初级程序员。', 'Spring Boot', '1-3', '1-3-2', '204002', '200002', 'springboot可以帮你简化spring的搭建，并且快速创建一个spring的应用程序。该框架使用了特定的方式来进行配置，从而使开发人员不再需要定义样板化的配置。', '/mediafiles/2022/09/18/d4af959873182feb0fdb91dc6c1958b5.png', '2021-12-27 11:28:00', '2022-09-19 09:35:31', NULL, NULL, '202003', '203001');
INSERT INTO `course_base` VALUES (83, 1232141425, NULL, '123', '123', '123', '1-5', '1-5-5', '204002', '200002', '123', 'http://r3zc5rung.hd-bkt.clouddn.com/7bcf3dae-3ee6-43ed-8a4e-c5deb75bf54468C4F11uCgf5KPki', '2021-12-27 12:22:01', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (84, 1232141425, NULL, 'Spring Cloud', 'Spring Cloud', 'Spring Cloud', '1-1', '1-1-1', '204001', '200002', 'Spring Cloud', '/mediafiles/2022/09/18/e00ce88f53cc391d9ffd51a81834d2af.jpg', '2021-12-27 13:42:01', '2022-09-18 21:48:53', NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (85, 1232141425, NULL, '最终测试', '小母牛', '好', '1-5', '1-5-1', '204003', '200002', 'nb', 'http://r3zc5rung.hd-bkt.clouddn.com/cc807e18-f3d2-4e0a-9326-e8c42a3ba6cdbvjU3MrtGeV0yxUR', '2021-12-27 15:54:59', '2021-12-27 18:08:08', NULL, NULL, '202003', '203001');
INSERT INTO `course_base` VALUES (86, 1232141425, NULL, '最终测试2', '好', '加油', '1-1', '1-1-1', '204001', '200002', '好', 'http://r3zc5rung.hd-bkt.clouddn.com/eea77eb2-04d0-45c0-80f5-baeb37897592FfVk8l6h1K84gaht', '2021-12-27 20:01:06', '2021-12-27 20:12:46', NULL, NULL, '202003', '203001');
INSERT INTO `course_base` VALUES (87, 1232141425, NULL, '1', '1', '1', '1-1', '1-1-1', '204001', '200002', '1', 'http://r3zc5rung.hd-bkt.clouddn.com/cb1b6038-ef68-4362-8c29-a966886d1dc5sakUiFHLb5sRFdIK', '2021-12-27 20:14:13', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (88, 1232141425, NULL, '1', '1', '1', '1-1', '1-1-1', '204001', '200002', '1', 'http://r3zc5rung.hd-bkt.clouddn.com/cb1b6038-ef68-4362-8c29-a966886d1dc5sakUiFHLb5sRFdIK', '2021-12-27 20:14:53', '2021-12-27 20:28:58', NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (89, 1232141425, NULL, 'qaq', 'qaq', 'qaq', '1-1', '1-1-1', '204001', '200002', 'qaq', 'http://r3zc5rung.hd-bkt.clouddn.com/11935d1c-f84e-41ee-b24c-44f7cceae887YA0wRBRNilq25y55', '2021-12-27 20:21:46', '2021-12-27 20:23:12', NULL, NULL, '202003', '203001');
INSERT INTO `course_base` VALUES (90, 1232141425, NULL, '111111', '1', '111', '1-1', '1-1-1', '204001', '200002', '1', 'http://r3zc5rung.hd-bkt.clouddn.com/09275e98-3792-449f-82be-94139f425c0aXq5Or9VUJ9SxuKiM', '2021-12-27 20:26:57', '2021-12-27 20:30:49', NULL, NULL, '202003', '203001');
INSERT INTO `course_base` VALUES (91, 1232141425, NULL, '测试测试', '1', '测试', '1-5', '1-5-5', '204003', '200002', '1', 'http://r3zc5rung.hd-bkt.clouddn.com/c1efba7e-165c-4373-855f-e3cfd6eb771978y2fvUzmxhEFMPt', '2021-12-27 20:35:07', '2021-12-27 20:36:35', NULL, NULL, '202003', '203001');
INSERT INTO `course_base` VALUES (92, 1232141425, NULL, '最终测试2', '问问', '新', '1-3', '1-3-1', '204003', '200002', '我', 'http://r3zc5rung.hd-bkt.clouddn.com/028688b0-6107-4ded-916d-eabb5fdb9cd2vomf7CoLMD27hqU0', '2021-12-27 20:53:32', '2021-12-27 20:54:58', NULL, NULL, '202003', '203001');
INSERT INTO `course_base` VALUES (93, 1232141425, NULL, '最最最终测试', '踩踩踩踩踩踩从', '测试', '1-1', '1-1-1', '204002', '200002', '草草草草', 'http://r3zc5rung.hd-bkt.clouddn.com/d4e83002-e92c-4d23-9281-b218187e1632XzB1WC2Ckw4gcTMj', '2021-12-27 23:23:17', '2021-12-27 23:24:59', NULL, NULL, '202003', '203001');
INSERT INTO `course_base` VALUES (94, 1232141425, NULL, '最最最最最最最最最最终测试', '最最最最最最最最最最终测试', '最最最最最最最最最最终测试', '1-2', '1-2-1', '204003', '200002', '最最最最最最最最最最终测试', 'http://r3zc5rung.hd-bkt.clouddn.com/4a603cf0-a6ee-460d-bd02-4a730c1f5fdc7zfCzVvxi6tFY5nP', '2021-12-27 23:48:14', '2021-12-27 23:49:20', NULL, NULL, '202003', '203001');
INSERT INTO `course_base` VALUES (95, 1232141425, NULL, '真最终测试', 'v', '真最终测试', '1-1', '1-1-1', '204001', '200002', '真最终测试', '', '2021-12-28 02:08:08', '2021-12-28 02:09:24', NULL, NULL, '202003', '203001');
INSERT INTO `course_base` VALUES (96, 1232141425, NULL, '究极测试', '究极测试', '究极测试', '1-1', '1-1-1', '204001', '200002', '究极测试', 'http://r3zc5rung.hd-bkt.clouddn.com/1370eeb2-47a1-4e68-9e04-d0f56ebb10217aovGzS2Ipyp7dqD', '2021-12-28 03:10:25', '2021-12-28 03:12:22', NULL, NULL, '202003', '203001');
INSERT INTO `course_base` VALUES (97, 1232141425, NULL, '项目展示', '项目展示', '项目展示', '1-1', '1-1-1', '204002', '200002', '项目展示', '', '2021-12-28 03:36:52', '2021-12-28 03:41:18', NULL, NULL, '202003', '203001');
INSERT INTO `course_base` VALUES (98, 1232141425, NULL, '测试课01', '初学者', '', '1-1', '1-1-1', '204001', '200002', '', '', '2022-08-22 10:07:09', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (99, 1232141425, NULL, '测试课程02', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '', '', '2022-08-22 12:23:01', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (100, 1232141425, NULL, '测试课程02', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '', '', '2022-08-22 12:55:29', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (101, 1, NULL, '测试课程03', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '', '', NULL, NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (102, 1, NULL, '测试课程102', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '', '', '2022-09-07 19:13:16', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (103, 1, NULL, '测试课程103', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '', '', '2022-09-07 19:17:25', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (104, 1, NULL, '测试课程104', '测试课程104', '测试课程104', '1-1', '1-1-1', '204001', '200003', '测试课程104', '', '2022-09-07 19:19:47', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (105, 1, NULL, '测试课程104', '测试课程104', '测试课程104', '1-1', '1-1-1', '204001', '200003', '测试课程104', '', '2022-09-07 19:24:38', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (106, 1, NULL, '测试课程106', '测试课程106', '', '1-1', '1-1-1', '204001', '200003', NULL, '', '2022-09-07 21:46:52', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (107, 1, NULL, '测试课程106', '测试课程106', '', '1-1', '1-1-1', '204001', '200003', NULL, '', '2022-09-07 21:49:22', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (108, 1, NULL, '测试课程106', '测试课程106', '', '1-1', '1-1-1', '204001', '200003', NULL, '', '2022-09-07 21:56:22', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (109, 1, NULL, '测试课程103', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '', '', '2022-09-08 07:35:16', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (111, 1, NULL, '测试课程01', '初学者', '', '1-3', '1-3-3', '204001', '200002', '测试课程01', '', '2022-09-08 21:34:33', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (112, 1, NULL, '测试课程01', '测试课程01', '', '1-3', '1-3-3', '204001', '200002', '测试课程01', '', '2022-09-08 21:40:05', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (113, 1, NULL, '测试课程01', 'w', 'ww', '1-3', '1-3-3', '204001', '200002', 'w', '', '2022-09-08 21:40:51', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (114, 1, NULL, '测试课程01', 'w', 'ww', '1-3', '1-3-3', '204001', '200002', 'w', '', '2022-09-08 21:41:33', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (115, 1, NULL, '测试课程01', 'w', 'ww', '1-3', '1-3-3', '204001', '200002', 'w', '', '2022-09-08 21:42:05', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (116, 1, NULL, '人性的弱点', '人性的弱点人性的弱点人性的弱点', '', '1-1', '1-1-1', '204001', '200002', '人性的弱点人性的弱点', '', '2022-09-09 11:31:50', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (117, 1232141425, NULL, 'Nacos微服务开发实战', '中高级Java开发工程师', '', '1-3', '1-3-2', '204002', '200002', 'Nacos 是阿里巴巴推出来的一个新开源项目，这是一个更易于构建云原生应用的动态服务发现、配置管理和服务管理平台。\n\nNacos 致力于帮助您发现、配置和管理微服务。Nacos 提供了一组简单易用的特性集，帮助您快速实现动态服务发现、服务配置、服务元数据及流量管理。\n\nNacos 帮助您更敏捷和容易地构建、交付和管理微服务平台。 Nacos 是构建以“服务”为中心的现代应用架构 (例如微服务范式、云原生范式) 的服务基础设施\n\nNacos 支持如下核心特性：\n\n1）服务发现： 支持 DNS 与 RPC 服务发现，也提供原生 SDK 、OpenAPI 等多种服务注册方式和 DNS、HTTP 与 API 等多种服务发现方式。\n2）服务健康监测： Nacos 提供对服务的实时的健康检查，阻止向不健康的主机或服务实例发送请求。\n3）动态配置服务： Nacos 提供配置统一管理功能，能够帮助我们将配置以中心化、外部化和动态化的方式管理所有环境的应用配置和服务配置。\n4）动态 DNS 服务： Nacos 支持动态 DNS 服务权重路由，能够让我们很容易地实现中间层负载均衡、更灵活的路由策略、流量控制以及数据中心内网的简单 DNS 解析服务。\n5）服务及其元数据管理： Nacos 支持从微服务平台建设的视角管理数据中心的所有服务及元数据，包括管理服务的描述、生命周期、服务的静态依赖分析、服务的健康状态、服务的流量管理、路由及安全策略、服务的 SLA 以及最首要的 metrics 统计数据。', '/mediafiles/2023/02/17/9835702fe0f7df8de526447b2a70db06.png', '2022-10-04 18:58:11', '2023-02-28 17:25:47', NULL, NULL, '202003', '203002');
INSERT INTO `course_base` VALUES (118, 22, NULL, '测试课程tmp', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '这是一门测试课程', '', '2023-02-02 20:51:27', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (134, 22, NULL, '123', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '这是一门测试课程', '', '2023-02-03 00:14:30', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (135, 22, NULL, '123', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '这是一门测试课程', '', '2023-02-03 00:20:21', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (136, 22, NULL, '123', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '这是一门测试课程', '', '2023-02-03 00:27:11', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (137, 22, NULL, '123', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '这是一门测试课程', '', '2023-02-03 00:28:09', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (138, 22, NULL, '123', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '这是一门测试课程', '', '2023-02-03 00:31:30', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (139, 22, NULL, '123', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '这是一门测试课程', '', '2023-02-03 00:31:42', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (140, 22, NULL, '321', '啊', '', '1-1', '1-1-10', '204002', '200002', NULL, '', '2023-02-03 00:32:00', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (141, 22, NULL, '123', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '这是一门测试课程', '', '2023-02-03 00:32:30', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (142, 22, NULL, '123', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '这是一门测试课程', '', '2023-02-03 00:33:38', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (143, 22, NULL, '123', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '这是一门测试课程', '', '2023-02-03 00:36:37', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (144, 22, NULL, '123', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '这是一门测试课程', '', '2023-02-03 00:37:40', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (145, 22, NULL, '123', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '这是一门测试课程', '', '2023-02-03 00:40:04', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (146, 22, NULL, '123', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '这是一门测试课程', '', '2023-02-03 00:44:24', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (147, 22, NULL, '123', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '这是一门测试课程', '', '2023-02-03 00:46:44', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (148, 22, NULL, '123', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '这是一门测试课程', '', '2023-02-03 00:51:57', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (149, 22, NULL, '123', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '这是一门测试课程', '', '2023-02-03 00:58:45', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (150, 22, NULL, '123', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '这是一门测试课程', '', '2023-02-03 01:10:58', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (151, 22, NULL, '123', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '这是一门测试课程', '', '2023-02-03 01:18:31', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (152, 22, NULL, '123', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '这是一门测试课程', '', '2023-02-03 10:32:20', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (153, 22, NULL, '123', '初级人员', '', '1-1', '1-1-1', '204001', '200002', '这是一门测试课程', '', '2023-02-03 10:36:30', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (154, 22, NULL, '啊啊', '啊', '', '1-1', '1-1-1', '204001', '200002', '啊', '', '2023-02-03 10:40:57', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (155, 22, NULL, '啊', '啊啊啊啊啊啊啊啊啊啊啊啊啊 ', '啊', '1-10', '1-10-3', '204001', '200002', '啊啊啊啊啊啊啊啊啊啊啊啊啊 ', '', '2023-02-03 15:38:43', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (156, 22, NULL, '123321', '啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '', '1-1', '1-1-10', '204001', '200002', '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '', '2023-02-06 20:12:13', '2023-02-06 20:32:56', NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (159, 1232141425, NULL, 'tmp', '啊啊啊啊啊啊啊啊啊啊啊啊', '', '1-10', '1-10-3', '204002', '200002', NULL, '/mediafiles/2023/02/18/632fb34166d91865da576032b9330ced.jpg', '2023-02-09 15:26:58', '2023-03-03 20:59:45', NULL, NULL, '203002', '203001');
INSERT INTO `course_base` VALUES (160, 1232141425, NULL, '猫片', '不知道啊不知道啊不知道啊a a a ', '', '1-5', '1-5-4', '204003', '200002', NULL, '/mediafiles/2023/03/03/76ac562669dc346992af9dd039060e7b.jpg', '2023-03-02 17:17:07', '2023-03-05 11:09:31', NULL, NULL, '203002', '203001');
INSERT INTO `course_base` VALUES (161, 1232141425, NULL, 'Python快速入门', '不知道不知道不知道不知道不知道不知道', '', '1-3', '1-3-6', '204003', '200002', '不知道不知道不知道不知道不知道不知道', '/mediafiles/2023/03/08/36f8926f95da00ef0f823747aa9c1292.jpg', '2023-03-08 11:26:46', NULL, NULL, NULL, '203002', '203001');
INSERT INTO `course_base` VALUES (162, 1232141425, NULL, 'JavaScript快速入门', '不知道不知道不知道不知道不知道不知道', '', '1-1', '1-1-1', '204001', '200002', '不知道不知道不知道不知道不知道不知道不知道', '', '2023-03-18 19:29:37', NULL, NULL, NULL, '202002', '203001');
INSERT INTO `course_base` VALUES (163, 1232141425, NULL, 'Matlab', 'MatlabMatlabMatlabMatlab', '', '1-11', '1-11-8', '204003', '200002', 'MatlabMatlabMatlabMatlab', '/mediafiles/2023/03/18/66d196e9269c0ef7ee898108476b4408.jpg', '2023-03-18 19:32:44', '2023-03-18 19:38:12', NULL, NULL, '203002', '203001');
INSERT INTO `course_base` VALUES (164, 1232141425, NULL, 'UI设计', 'UI设计UI设计UI设计UI设计', 'UI设计UI设计UI设计', '1-1', '1-1-10', '204003', '200002', 'UI设计UI设计UI设计UI设计', '/mediafiles/2023/03/18/171ef1af45a0c0cb831a265cf9e558ff.png', '2023-03-18 19:50:19', NULL, NULL, NULL, '203002', '203001');
INSERT INTO `course_base` VALUES (165, 1232141425, NULL, '机器学习', '机器学习机器学习机器学习机器学习', '机器学习机器学习', '1-3', '1-3-8', '204003', '200002', '机器学习机器学习机器学习机器学习', '/mediafiles/2023/03/19/71744f739043fc9fbc78a0e075bfa214.bmp', '2023-03-19 17:41:50', NULL, NULL, NULL, '203002', '203001');
INSERT INTO `course_base` VALUES (166, 1232141425, NULL, 'asd', '不知道不知道不知道不知道', 'asd', '1-10', '1-10-2', '204002', '200002', '不知道不知道不知道不知道不知道', '/mediafiles/2023/04/02/50ba42e6be07eb947fa2a62592846b23.png', '2023-04-02 23:16:52', NULL, NULL, NULL, '203002', '203001');

-- ----------------------------
-- Table structure for course_category
-- ----------------------------
DROP TABLE IF EXISTS `course_category`;
CREATE TABLE `course_category`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `label` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类标签默认和名称一样',
  `parentid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '父结点id（第一级的父节点是0，自关联字段id）',
  `is_show` tinyint NULL DEFAULT NULL COMMENT '是否显示',
  `orderby` int NULL DEFAULT NULL COMMENT '排序字段',
  `is_leaf` tinyint NULL DEFAULT NULL COMMENT '是否叶子',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_category
-- ----------------------------
INSERT INTO `course_category` VALUES ('1', '根结点', '根结点', '0', 1, 1, 0);
INSERT INTO `course_category` VALUES ('1-1', '前端开发', '前端开发', '1', 1, 1, 0);
INSERT INTO `course_category` VALUES ('1-1-1', 'HTML/CSS', 'HTML/CSS', '1-1', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-1-10', '其它', '其它', '1-1', 1, 10, 1);
INSERT INTO `course_category` VALUES ('1-1-2', 'JavaScript', 'JavaScript', '1-1', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-1-3', 'jQuery', 'jQuery', '1-1', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-1-4', 'ExtJS', 'ExtJS', '1-1', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-1-5', 'AngularJS', 'AngularJS', '1-1', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-1-6', 'ReactJS', 'ReactJS', '1-1', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-1-7', 'Bootstrap', 'Bootstrap', '1-1', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-1-8', 'Node.js', 'Node.js', '1-1', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-1-9', 'Vue', 'Vue', '1-1', 1, 9, 1);
INSERT INTO `course_category` VALUES ('1-10', '研发管理', '研发管理', '1', 1, 10, 0);
INSERT INTO `course_category` VALUES ('1-10-1', '敏捷开发', '敏捷开发', '1-10', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-10-2', '软件设计', '软件设计', '1-10', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-10-3', '软件测试', '软件测试', '1-10', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-10-4', '研发管理', '研发管理', '1-10', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-10-5', '其它', '其它', '1-10', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-11', '系统运维', '系统运维', '1', 1, 11, 0);
INSERT INTO `course_category` VALUES ('1-11-1', 'Linux', 'Linux', '1-11', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-11-10', '其它', '其它', '1-11', 1, 10, 1);
INSERT INTO `course_category` VALUES ('1-11-2', 'Windows', 'Windows', '1-11', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-11-3', 'UNIX', 'UNIX', '1-11', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-11-4', 'Mac OS', 'Mac OS', '1-11', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-11-5', '网络技术', '网络技术', '1-11', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-11-6', '路由协议', '路由协议', '1-11', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-11-7', '无线网络', '无线网络', '1-11', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-11-8', 'Ngnix', 'Ngnix', '1-11', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-11-9', '邮件服务器', '邮件服务器', '1-11', 1, 9, 1);
INSERT INTO `course_category` VALUES ('1-12', '产品经理', '产品经理', '1', 1, 12, 0);
INSERT INTO `course_category` VALUES ('1-12-1', '交互设计', '交互设计', '1-12', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-12-2', '产品设计', '产品设计', '1-12', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-12-3', '原型设计', '原型设计', '1-12', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-12-4', '用户体验', '用户体验', '1-12', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-12-5', '需求分析', '需求分析', '1-12', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-12-6', '其它', '其它', '1-12', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-13', '企业/办公/职场', '企业/办公/职场', '1', 1, 13, 0);
INSERT INTO `course_category` VALUES ('1-13-1', '运营管理', '运营管理', '1-13', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-13-2', '企业信息化', '企业信息化', '1-13', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-13-3', '网络营销', '网络营销', '1-13', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-13-4', 'Office/WPS', 'Office/WPS', '1-13', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-13-5', '招聘/面试', '招聘/面试', '1-13', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-13-6', '电子商务', '电子商务', '1-13', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-13-7', 'CRM', 'CRM', '1-13', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-13-8', 'ERP', 'ERP', '1-13', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-13-9', '其它', '其它', '1-13', 1, 9, 1);
INSERT INTO `course_category` VALUES ('1-14', '信息安全', '信息安全', '1', 1, 14, 0);
INSERT INTO `course_category` VALUES ('1-14-1', '密码学/加密/破解', '密码学/加密/破解', '1-14', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-14-10', '其它', '其它', '1-14', 1, 10, 1);
INSERT INTO `course_category` VALUES ('1-14-2', '渗透测试', '渗透测试', '1-14', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-14-3', '社会工程', '社会工程', '1-14', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-14-4', '漏洞挖掘与利用', '漏洞挖掘与利用', '1-14', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-14-5', '云安全', '云安全', '1-14', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-14-6', '防护加固', '防护加固', '1-14', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-14-7', '代码审计', '代码审计', '1-14', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-14-8', '移动安全', '移动安全', '1-14', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-14-9', '病毒木马', '病毒木马', '1-14', 1, 9, 1);
INSERT INTO `course_category` VALUES ('1-15', '测试目录', '测试目录', '1', 1, 15, 0);
INSERT INTO `course_category` VALUES ('1-15-1', '测试目录01', '测试目录01', '1-15', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-2', '移动开发', '移动开发', '1', 1, 2, 0);
INSERT INTO `course_category` VALUES ('1-2-1', '微信开发', '微信开发', '1-2', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-2-2', 'iOS', 'iOS', '1-2', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-2-3', '手游开发', '手游开发', '1-2', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-2-4', 'Swift', 'Swift', '1-2', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-2-5', 'Android', 'Android', '1-2', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-2-6', 'ReactNative', 'ReactNative', '1-2', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-2-7', 'Cordova', 'Cordova', '1-2', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-2-8', '其它', '其它', '1-2', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-3', '编程开发', '编程开发', '1', 1, 3, 0);
INSERT INTO `course_category` VALUES ('1-3-1', 'C/C++', 'C/C++', '1-3', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-3-2', 'Java', 'Java', '1-3', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-3-3', '.NET', '.NET', '1-3', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-3-4', 'Objective-C', 'Objective-C', '1-3', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-3-5', 'Go语言', 'Go语言', '1-3', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-3-6', 'Python', 'Python', '1-3', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-3-7', 'Ruby/Rails', 'Ruby/Rails', '1-3', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-3-8', '其它', '其它', '1-3', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-4', '数据库', '数据库', '1', 1, 4, 0);
INSERT INTO `course_category` VALUES ('1-4-1', 'Oracle', 'Oracle', '1-4', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-4-2', 'MySQL', 'MySQL', '1-4', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-4-3', 'SQL Server', 'SQL Server', '1-4', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-4-4', 'DB2', 'DB2', '1-4', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-4-5', 'NoSQL', 'NoSQL', '1-4', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-4-6', 'Mongo DB', 'Mongo DB', '1-4', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-4-7', 'Hbase', 'Hbase', '1-4', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-4-8', '数据仓库', '数据仓库', '1-4', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-4-9', '其它', '其它', '1-4', 1, 9, 1);
INSERT INTO `course_category` VALUES ('1-5', '人工智能', '人工智能', '1', 1, 5, 0);
INSERT INTO `course_category` VALUES ('1-5-1', '机器学习', '机器学习', '1-5', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-5-2', '深度学习', '深度学习', '1-5', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-5-3', '语音识别', '语音识别', '1-5', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-5-4', '计算机视觉', '计算机视觉', '1-5', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-5-5', 'NLP', 'NLP', '1-5', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-5-6', '强化学习', '强化学习', '1-5', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-5-7', '其它', '其它', '1-5', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-6', '云计算/大数据', '云计算/大数据', '1', 1, 6, 0);
INSERT INTO `course_category` VALUES ('1-6-1', 'Spark', 'Spark', '1-6', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-6-2', 'Hadoop', 'Hadoop', '1-6', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-6-3', 'OpenStack', 'OpenStack', '1-6', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-6-4', 'Docker/K8S', 'Docker/K8S', '1-6', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-6-5', '云计算基础架构', '云计算基础架构', '1-6', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-6-6', '虚拟化技术', '虚拟化技术', '1-6', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-6-7', '云平台', '云平台', '1-6', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-6-8', 'ELK', 'ELK', '1-6', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-6-9', '其它', '其它', '1-6', 1, 9, 1);
INSERT INTO `course_category` VALUES ('1-7', 'UI设计', 'UI设计', '1', 1, 7, 0);
INSERT INTO `course_category` VALUES ('1-7-1', 'Photoshop', 'Photoshop', '1-7', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-7-10', 'InDesign', 'InDesign', '1-7', 1, 10, 1);
INSERT INTO `course_category` VALUES ('1-7-11', 'Pro/Engineer', 'Pro/Engineer', '1-7', 1, 11, 1);
INSERT INTO `course_category` VALUES ('1-7-12', 'Cinema 4D', 'Cinema 4D', '1-7', 1, 12, 1);
INSERT INTO `course_category` VALUES ('1-7-13', '3D Studio', '3D Studio', '1-7', 1, 13, 1);
INSERT INTO `course_category` VALUES ('1-7-14', 'After Effects（AE）', 'After Effects（AE）', '1-7', 1, 14, 1);
INSERT INTO `course_category` VALUES ('1-7-15', '原画设计', '原画设计', '1-7', 1, 15, 1);
INSERT INTO `course_category` VALUES ('1-7-16', '动画制作', '动画制作', '1-7', 1, 16, 1);
INSERT INTO `course_category` VALUES ('1-7-17', 'Dreamweaver', 'Dreamweaver', '1-7', 1, 17, 1);
INSERT INTO `course_category` VALUES ('1-7-18', 'Axure', 'Axure', '1-7', 1, 18, 1);
INSERT INTO `course_category` VALUES ('1-7-19', '其它', '其它', '1-7', 1, 19, 1);
INSERT INTO `course_category` VALUES ('1-7-2', '3Dmax', '3Dmax', '1-7', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-7-3', 'Illustrator', 'Illustrator', '1-7', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-7-4', 'Flash', 'Flash', '1-7', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-7-5', 'Maya', 'Maya', '1-7', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-7-6', 'AUTOCAD', 'AUTOCAD', '1-7', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-7-7', 'UG', 'UG', '1-7', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-7-8', 'SolidWorks', 'SolidWorks', '1-7', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-7-9', 'CorelDraw', 'CorelDraw', '1-7', 1, 9, 1);
INSERT INTO `course_category` VALUES ('1-8', '游戏开发', '游戏开发', '1', 1, 8, 0);
INSERT INTO `course_category` VALUES ('1-8-1', 'Cocos', 'Cocos', '1-8', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-8-2', 'Unity3D', 'Unity3D', '1-8', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-8-3', 'Flash', 'Flash', '1-8', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-8-4', 'SpriteKit 2D', 'SpriteKit 2D', '1-8', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-8-5', 'Unreal', 'Unreal', '1-8', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-8-6', '其它', '其它', '1-8', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-9', '智能硬件/物联网', '智能硬件/物联网', '1', 1, 9, 0);
INSERT INTO `course_category` VALUES ('1-9-1', '无线通信', '无线通信', '1-9', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-9-10', '物联网技术', '物联网技术', '1-9', 1, 10, 1);
INSERT INTO `course_category` VALUES ('1-9-11', '其它', '其它', '1-9', 1, 11, 1);
INSERT INTO `course_category` VALUES ('1-9-2', '电子工程', '电子工程', '1-9', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-9-3', 'Arduino', 'Arduino', '1-9', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-9-4', '体感技术', '体感技术', '1-9', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-9-5', '智能硬件', '智能硬件', '1-9', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-9-6', '驱动/内核开发', '驱动/内核开发', '1-9', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-9-7', '单片机/工控', '单片机/工控', '1-9', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-9-8', 'WinCE', 'WinCE', '1-9', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-9-9', '嵌入式', '嵌入式', '1-9', 1, 9, 1);

-- ----------------------------
-- Table structure for course_market
-- ----------------------------
DROP TABLE IF EXISTS `course_market`;
CREATE TABLE `course_market`  (
  `id` bigint NOT NULL COMMENT '主键，课程id',
  `charge` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收费规则，对应数据字典',
  `price` float(10, 2) NULL DEFAULT NULL COMMENT '现价',
  `original_price` float(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `qq` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '咨询qq',
  `wechat` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信',
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `valid_days` int NULL DEFAULT NULL COMMENT '有效期天数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程营销信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_market
-- ----------------------------
INSERT INTO `course_market` VALUES (1, '201001', 2.00, 11.00, '1', '1', '1', 1);
INSERT INTO `course_market` VALUES (2, '201001', 1.00, 11111.00, '2222', '3333', '4444', 555);
INSERT INTO `course_market` VALUES (7, '201000', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course_market` VALUES (18, '201001', 11.00, 111.00, '123456', '654321', '13333333', 365);
INSERT INTO `course_market` VALUES (22, '201001', 11.00, 1111.00, '334455', '223321', '1333333', 33);
INSERT INTO `course_market` VALUES (24, '201000', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course_market` VALUES (40, '201001', 11.00, 1111.00, NULL, NULL, NULL, NULL);
INSERT INTO `course_market` VALUES (74, '201001', 1.00, 100.00, '123456', '654321', '1333333', 365);
INSERT INTO `course_market` VALUES (82, '201001', 22.00, 222.00, '22', '33', '33', 33);
INSERT INTO `course_market` VALUES (84, '201001', 11.00, 11111.00, '11', '11', '22', 22);
INSERT INTO `course_market` VALUES (117, '201001', 1.00, 198.00, '24965575', '24965575', '24965575', 365);
INSERT INTO `course_market` VALUES (118, '201000', 99.00, 999.00, '123564', '123654', '156213', 365);
INSERT INTO `course_market` VALUES (155, '201000', 1.00, 1.00, '11', '11', '11', 365);
INSERT INTO `course_market` VALUES (156, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (159, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (160, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (161, '201001', 0.10, 999.00, '999', '999', '999', 365);
INSERT INTO `course_market` VALUES (162, '201001', 1.00, 1.00, '', '', '', 365);
INSERT INTO `course_market` VALUES (163, '201001', 9999.00, 999.00, '123', '321', '1231231', 365);
INSERT INTO `course_market` VALUES (164, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (165, '201001', 1888.00, 999.00, '123', '2313', '21', 321);
INSERT INTO `course_market` VALUES (166, '201001', 0.10, 0.10, '123', '321', '231', 365);

-- ----------------------------
-- Table structure for course_publish
-- ----------------------------
DROP TABLE IF EXISTS `course_publish`;
CREATE TABLE `course_publish`  (
  `id` bigint NOT NULL COMMENT '主键',
  `company_id` bigint NOT NULL COMMENT '机构ID',
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `users` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '适用人群',
  `tags` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `mt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '大分类',
  `mt_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '大分类名称',
  `st` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小分类',
  `st_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小分类名称',
  `grade` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程等级',
  `teachmode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教育模式',
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程图片',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '课程介绍',
  `market` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '课程营销信息，json格式',
  `teachplan` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '所有课程计划，json格式',
  `teachers` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '教师信息，json格式',
  `create_date` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `online_date` datetime NULL DEFAULT NULL COMMENT '上架时间',
  `offline_date` datetime NULL DEFAULT NULL COMMENT '下架时间',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '发布状态',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `charge` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收费规则，对应数据字典--203',
  `price` float(10, 2) NULL DEFAULT NULL COMMENT '现价',
  `original_price` float(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `valid_days` int NULL DEFAULT NULL COMMENT '课程有效期天数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程发布' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_publish
-- ----------------------------
INSERT INTO `course_publish` VALUES (18, 1232141425, NULL, 'java零基础入门', 'java小白java小白java小白java小白', 'aa', NULL, '1-3', '编程开发', '1-3-2', 'Java', '200001', '200002', '/mediafiles/2022/09/13/a16da7a132559daf9e1193166b3e7f52.jpg', 'java零基础入门java零基础入门java零基础入门java零基础入门', '{\"charge\":\"201001\",\"id\":18,\"originalPrice\":111.0,\"phone\":\"13333333\",\"price\":11.0,\"qq\":\"123456\",\"validDays\":365,\"wechat\":\"654321\"}', '[{\"courseId\":18,\"grade\":1,\"id\":327,\"orderby\":1,\"parentid\":0,\"pname\":\"新章名称 [点击修改]\",\"teachPlanTreeNodes\":[]}]', NULL, '2023-03-07 22:38:00', NULL, NULL, '203002', NULL, '201001', 11.00, 111.00, 365);
INSERT INTO `course_publish` VALUES (24, 1232141425, NULL, '人工智能+python', '人工智能+python非常不错！！！人工智能+python非常不错！！！人工智能+python非常不错！！！', NULL, NULL, '1-6', '云计算/大数据', '1-6-5', '云计算基础架构', '200002', '200002', 'https://cdn.educba.com/academy/wp-content/uploads/2018/08/Spring-BOOT-Interview-questions.jpg', '人工智能+python非常不错！！！人工智能+python非常不错！！！', '{\"charge\":\"201000\",\"id\":24}', '[{\"courseId\":24,\"grade\":1,\"id\":328,\"orderby\":1,\"parentid\":0,\"pname\":\"新章名称 [点击修改]\",\"teachPlanTreeNodes\":[]}]', NULL, '2023-03-07 22:43:36', NULL, NULL, '203002', NULL, '201000', NULL, NULL, NULL);
INSERT INTO `course_publish` VALUES (159, 1232141425, NULL, 'tmp', '啊啊啊啊啊啊啊啊啊啊啊啊', '', NULL, '1-10', '研发管理', '1-10-3', '软件测试', '204002', '200002', '/mediafiles/2023/02/18/632fb34166d91865da576032b9330ced.jpg', NULL, '{\"charge\":\"201000\",\"id\":159,\"phone\":\"\",\"price\":0.0,\"qq\":\"\",\"validDays\":365,\"wechat\":\"\"}', '[{\"courseId\":159,\"grade\":1,\"id\":306,\"orderby\":1,\"parentid\":0,\"pname\":\"1\",\"teachPlanTreeNodes\":[{\"courseId\":159,\"grade\":2,\"id\":307,\"orderby\":1,\"parentid\":306,\"pname\":\"1.1\",\"teachplanMedia\":{\"courseId\":159,\"teachplanId\":307}},{\"courseId\":159,\"grade\":2,\"id\":308,\"orderby\":2,\"parentid\":306,\"pname\":\"1.2\",\"teachplanMedia\":{\"courseId\":159,\"teachplanId\":308}},{\"courseId\":159,\"grade\":2,\"id\":309,\"orderby\":3,\"parentid\":306,\"pname\":\"1.3\",\"teachplanMedia\":{\"courseId\":159,\"teachplanId\":309}}]}]', NULL, '2023-03-07 22:49:14', NULL, NULL, '203002', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (160, 1232141425, NULL, '猫片', '不知道啊不知道啊不知道啊a a a ', '', NULL, '1-5', '人工智能', '1-5-4', '计算机视觉', '204003', '200002', '/mediafiles/2023/03/03/76ac562669dc346992af9dd039060e7b.jpg', NULL, '{\"charge\":\"201000\",\"id\":160,\"phone\":\"\",\"price\":0.0,\"qq\":\"\",\"validDays\":365,\"wechat\":\"\"}', '[{\"courseId\":160,\"grade\":1,\"id\":320,\"orderby\":1,\"parentid\":0,\"pname\":\"胶水开门\",\"teachPlanTreeNodes\":[{\"courseId\":160,\"grade\":2,\"id\":325,\"orderby\":1,\"parentid\":320,\"pname\":\"新小节名称 [点击修改]\",\"teachplanMedia\":{\"courseId\":160,\"id\":57,\"mediaFilename\":\"胶水01.mp4\",\"mediaId\":\"2324914c0a065a583f6bfba7080faef3\",\"teachplanId\":325}}]},{\"courseId\":160,\"grade\":1,\"id\":321,\"orderby\":2,\"parentid\":0,\"pname\":\"胶水撒娇\",\"teachPlanTreeNodes\":[{\"courseId\":160,\"grade\":2,\"id\":324,\"orderby\":1,\"parentid\":321,\"pname\":\"新小节名称 [点击修改]\",\"teachplanMedia\":{\"courseId\":160,\"id\":58,\"mediaFilename\":\"胶水02.mp4\",\"mediaId\":\"c00c815ab0e77e4da33309cc2d8ab77c\",\"teachplanId\":324}}]},{\"courseId\":160,\"grade\":1,\"id\":322,\"orderby\":3,\"parentid\":0,\"pname\":\"胶水睡觉\",\"teachPlanTreeNodes\":[{\"courseId\":160,\"grade\":2,\"id\":323,\"orderby\":1,\"parentid\":322,\"pname\":\"新小节名称 [点击修改]\",\"teachplanMedia\":{\"courseId\":160,\"id\":61,\"mediaFilename\":\"胶水03.mp4\",\"mediaId\":\"d8849c8a7b55c64d38a7b565ef01b9f3\",\"teachplanId\":323}},{\"courseId\":160,\"grade\":2,\"id\":326,\"orderby\":2,\"parentid\":322,\"pname\":\"新小节名称 [点击修改]\",\"teachplanMedia\":{\"courseId\":160,\"id\":60,\"mediaFilename\":\"胶水04.mp4\",\"mediaId\":\"f56582224553598bfbaf529f9e5d140b\",\"teachplanId\":326}}]}]', NULL, '2023-03-07 22:46:01', NULL, NULL, '203002', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (161, 1232141425, NULL, 'Python快速入门', '不知道不知道不知道不知道不知道不知道', '', NULL, '1-3', '编程开发', '1-3-6', 'Python', '204003', '200002', '/mediafiles/2023/03/08/36f8926f95da00ef0f823747aa9c1292.jpg', '不知道不知道不知道不知道不知道不知道', '{\"charge\":\"201001\",\"id\":161,\"originalPrice\":999.0,\"phone\":\"999\",\"price\":0.1,\"qq\":\"999\",\"validDays\":365,\"wechat\":\"999\"}', '[{\"courseId\":161,\"grade\":1,\"id\":329,\"orderby\":1,\"parentid\":0,\"pname\":\"新章名称 [点击修改]\",\"teachPlanTreeNodes\":[]}]', NULL, '2023-03-08 11:26:56', NULL, NULL, '203002', NULL, '201001', 0.10, 999.00, 365);
INSERT INTO `course_publish` VALUES (163, 1232141425, NULL, 'Matlab', 'MatlabMatlabMatlabMatlab', '', NULL, '1-11', '系统运维', '1-11-8', 'Ngnix', '204003', '200002', '/mediafiles/2023/03/18/66d196e9269c0ef7ee898108476b4408.jpg', 'MatlabMatlabMatlabMatlab', '{\"charge\":\"201001\",\"id\":163,\"originalPrice\":999.0,\"phone\":\"1231231\",\"price\":9999.0,\"qq\":\"123\",\"validDays\":365,\"wechat\":\"321\"}', '[{\"courseId\":163,\"grade\":1,\"id\":332,\"orderby\":1,\"parentid\":0,\"pname\":\"1.1\",\"teachPlanTreeNodes\":[{\"courseId\":163,\"grade\":2,\"id\":335,\"orderby\":1,\"parentid\":332,\"pname\":\"1.1.1\",\"teachplanMedia\":{\"courseId\":163,\"id\":64,\"mediaFilename\":\"胶水01.mp4\",\"mediaId\":\"2324914c0a065a583f6bfba7080faef3\",\"teachplanId\":335}}]},{\"courseId\":163,\"grade\":1,\"id\":333,\"orderby\":2,\"parentid\":0,\"pname\":\"1.2\",\"teachPlanTreeNodes\":[{\"courseId\":163,\"grade\":2,\"id\":336,\"orderby\":1,\"parentid\":333,\"pname\":\"1.2.1\",\"teachplanMedia\":{\"courseId\":163,\"id\":65,\"mediaFilename\":\"胶水02.mp4\",\"mediaId\":\"c00c815ab0e77e4da33309cc2d8ab77c\",\"teachplanId\":336}},{\"courseId\":163,\"grade\":2,\"id\":337,\"orderby\":2,\"parentid\":333,\"pname\":\"1.2.2\",\"teachplanMedia\":{\"courseId\":163,\"id\":66,\"mediaFilename\":\"胶水03.mp4\",\"mediaId\":\"d8849c8a7b55c64d38a7b565ef01b9f3\",\"teachplanId\":337}}]},{\"courseId\":163,\"grade\":1,\"id\":334,\"orderby\":3,\"parentid\":0,\"pname\":\"1.3\",\"teachPlanTreeNodes\":[{\"courseId\":163,\"grade\":2,\"id\":338,\"orderby\":1,\"parentid\":334,\"pname\":\"1.3\",\"teachplanMedia\":{\"courseId\":163,\"teachplanId\":338}}]}]', NULL, '2023-03-18 19:42:44', NULL, NULL, '203002', NULL, '201001', 9999.00, 999.00, 365);
INSERT INTO `course_publish` VALUES (164, 1232141425, NULL, 'UI设计', 'UI设计UI设计UI设计UI设计', 'UI设计UI设计UI设计', NULL, '1-1', '前端开发', '1-1-10', '其它', '204003', '200002', '/mediafiles/2023/03/18/171ef1af45a0c0cb831a265cf9e558ff.png', 'UI设计UI设计UI设计UI设计', '{\"charge\":\"201000\",\"id\":164,\"phone\":\"\",\"price\":0.0,\"qq\":\"\",\"validDays\":365,\"wechat\":\"\"}', '[{\"courseId\":164,\"grade\":1,\"id\":339,\"orderby\":1,\"parentid\":0,\"pname\":\"UI设计\",\"teachPlanTreeNodes\":[{\"courseId\":164,\"grade\":2,\"id\":340,\"orderby\":1,\"parentid\":339,\"pname\":\"1.1\",\"teachplanMedia\":{\"courseId\":164,\"teachplanId\":340}},{\"courseId\":164,\"grade\":2,\"id\":341,\"orderby\":2,\"parentid\":339,\"pname\":\"1.2\",\"teachplanMedia\":{\"courseId\":164,\"teachplanId\":341}}]}]', NULL, '2023-03-18 19:50:54', NULL, NULL, '203002', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (165, 1232141425, NULL, '机器学习', '机器学习机器学习机器学习机器学习', '机器学习机器学习', NULL, '1-3', '编程开发', '1-3-8', '其它', '204003', '200002', '/mediafiles/2023/03/19/71744f739043fc9fbc78a0e075bfa214.bmp', '机器学习机器学习机器学习机器学习', '{\"charge\":\"201001\",\"id\":165,\"originalPrice\":999.0,\"phone\":\"21\",\"price\":1888.0,\"qq\":\"123\",\"validDays\":321,\"wechat\":\"2313\"}', '[{\"courseId\":165,\"grade\":1,\"id\":342,\"orderby\":1,\"parentid\":0,\"pname\":\"笨比AI\",\"teachPlanTreeNodes\":[{\"courseId\":165,\"grade\":2,\"id\":344,\"orderby\":1,\"parentid\":342,\"pname\":\"新小节名称 [点击修改]\",\"teachplanMedia\":{\"courseId\":165,\"id\":67,\"mediaFilename\":\"胶水01.mp4\",\"mediaId\":\"2324914c0a065a583f6bfba7080faef3\",\"teachplanId\":344}}]},{\"courseId\":165,\"grade\":1,\"id\":343,\"orderby\":2,\"parentid\":0,\"pname\":\"猫娘调教\",\"teachPlanTreeNodes\":[{\"courseId\":165,\"grade\":2,\"id\":345,\"orderby\":1,\"parentid\":343,\"pname\":\"新小节名称 [点击修改]\",\"teachplanMedia\":{\"courseId\":165,\"id\":68,\"mediaFilename\":\"胶水02.mp4\",\"mediaId\":\"c00c815ab0e77e4da33309cc2d8ab77c\",\"teachplanId\":345}}]}]', NULL, '2023-03-19 17:43:15', NULL, NULL, '203002', NULL, '201001', 1888.00, 999.00, 321);
INSERT INTO `course_publish` VALUES (166, 1232141425, NULL, 'asd', '不知道不知道不知道不知道', 'asd', NULL, '1-10', '研发管理', '1-10-2', '软件设计', '204002', '200002', '/mediafiles/2023/04/02/50ba42e6be07eb947fa2a62592846b23.png', '不知道不知道不知道不知道不知道', '{\"charge\":\"201001\",\"id\":166,\"originalPrice\":0.1,\"phone\":\"231\",\"price\":0.1,\"qq\":\"123\",\"validDays\":365,\"wechat\":\"321\"}', '[{\"courseId\":166,\"grade\":1,\"id\":346,\"orderby\":1,\"parentid\":0,\"pname\":\"新章名称 [点击修改]1\",\"teachPlanTreeNodes\":[{\"courseId\":166,\"grade\":2,\"id\":348,\"orderby\":1,\"parentid\":346,\"pname\":\"新小节名称 [点击修改]\",\"teachplanMedia\":{\"courseId\":166,\"id\":69,\"mediaFilename\":\"胶水01.mp4\",\"mediaId\":\"2324914c0a065a583f6bfba7080faef3\",\"teachplanId\":348}}]},{\"courseId\":166,\"grade\":1,\"id\":347,\"orderby\":2,\"parentid\":0,\"pname\":\"新章名称 [点击修改]2\",\"teachPlanTreeNodes\":[{\"courseId\":166,\"grade\":2,\"id\":349,\"orderby\":1,\"parentid\":347,\"pname\":\"新小节名称 [点击修改]\",\"teachplanMedia\":{\"courseId\":166,\"id\":70,\"mediaFilename\":\"胶水01.mp4\",\"mediaId\":\"2324914c0a065a583f6bfba7080faef3\",\"teachplanId\":349}}]}]', NULL, '2023-04-02 23:17:37', NULL, NULL, '203002', NULL, '201001', 0.10, 0.10, 365);

-- ----------------------------
-- Table structure for course_publish_pre
-- ----------------------------
DROP TABLE IF EXISTS `course_publish_pre`;
CREATE TABLE `course_publish_pre`  (
  `id` bigint NOT NULL COMMENT '主键',
  `company_id` bigint NOT NULL COMMENT '机构ID',
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `users` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '适用人群',
  `tags` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `mt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '大分类',
  `mt_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '大分类名称',
  `st` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小分类',
  `st_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小分类名称',
  `grade` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程等级',
  `teachmode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教育模式（common普通，record录播，live直播）',
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程图片',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '课程介绍',
  `market` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '课程营销信息，json格式',
  `teachplan` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '所有课程计划，json格式',
  `teachers` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '教师信息，json格式',
  `create_date` datetime NULL DEFAULT NULL COMMENT '提交时间',
  `audit_date` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态（已提交，审核通过，审核未通过）',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `charge` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收费规则，对应数据字典--203',
  `price` float(10, 2) NULL DEFAULT NULL COMMENT '现价',
  `original_price` float(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `valid_days` int NULL DEFAULT NULL COMMENT '课程有效期天数',
  PRIMARY KEY (`id`, `pic`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程发布' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_publish_pre
-- ----------------------------

-- ----------------------------
-- Table structure for course_teacher
-- ----------------------------
DROP TABLE IF EXISTS `course_teacher`;
CREATE TABLE `course_teacher`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `course_id` bigint NULL DEFAULT NULL COMMENT '课程标识',
  `teacher_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师标识',
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师职位',
  `introduction` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师简介',
  `photograph` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '照片',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `courseid_teacherId_unique`(`course_id` ASC, `teacher_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程-教师关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_teacher
-- ----------------------------
INSERT INTO `course_teacher` VALUES (1, 72, 'wangxu', 'java高级讲师', '1111', 'http://r3zc5rung.hd-bkt.clouddn.com/2424e25d-b3ff-4ea2-92a5-249af918a42dGDSzBXIgWuwMCiZ4', '2021-12-25 17:44:07');
INSERT INTO `course_teacher` VALUES (3, 79, '博文', '教师', '帅哥', 'http://r3zc5rung.hd-bkt.clouddn.com/5fc0c47f-a3b4-4d93-b618-bb1cce8271f065L1s0qQjE1eLUAS', '2021-12-27 10:35:49');
INSERT INTO `course_teacher` VALUES (4, 80, '小王吧', 'SaaS', 'ASAD', 'http://r3zc5rung.hd-bkt.clouddn.com/bbdca546-524e-4938-abda-41b221642e7b4KtfBnPKutsdcqwI', '2021-12-27 11:09:43');
INSERT INTO `course_teacher` VALUES (5, 82, '驱蚊器', '为', '去', NULL, '2021-12-27 11:29:16');
INSERT INTO `course_teacher` VALUES (6, 83, '111', '111', '111', 'http://r3zc5rung.hd-bkt.clouddn.com/e169c906-a32a-4d0d-8262-e050de0f5f78obzlSd955zLAdeqv', '2021-12-27 12:24:01');
INSERT INTO `course_teacher` VALUES (7, 84, '123', '123', '123', 'http://r3zc5rung.hd-bkt.clouddn.com/6f6ac157-fc87-4bcc-a0ea-6c1e7c802fa6Igv8qAA9vwVYuNEv', '2021-12-27 13:44:01');
INSERT INTO `course_teacher` VALUES (8, 85, '黄哥', '大牛', 'nb', 'http://r3zc5rung.hd-bkt.clouddn.com/0ac34fcb-009c-40d3-9a67-9615d2d2e079ZR3JLyZNbcpdhdZF', '2021-12-27 16:11:30');
INSERT INTO `course_teacher` VALUES (9, 86, '1', '1', '1', 'http://r3zc5rung.hd-bkt.clouddn.com/625f7d6b-eeb8-4b24-aa9c-d2dd7fc0a3f2FXkxFmophiqhz5au', '2021-12-27 20:03:21');
INSERT INTO `course_teacher` VALUES (10, 88, '1', '1', '1', 'http://r3zc5rung.hd-bkt.clouddn.com/4fd7bfaa-f374-44c9-a4db-aa8ef23a76ddhvlJXSn6zcGKQS1u', '2021-12-27 20:15:19');
INSERT INTO `course_teacher` VALUES (11, 89, 'q', 'qq', '去', 'http://r3zc5rung.hd-bkt.clouddn.com/5e7a6877-39e2-4269-a656-c6c56c4ee259DVa7QIBQHs0OQ3yI', '2021-12-27 20:22:40');
INSERT INTO `course_teacher` VALUES (12, 90, '1', '11', '1', 'http://r3zc5rung.hd-bkt.clouddn.com/b3aeddb4-b4a4-4707-a4dc-16b9a9b04ddbATTiKwht7R3UFem6', '2021-12-27 20:27:43');
INSERT INTO `course_teacher` VALUES (13, 91, '1', '1', '1', 'http://r3zc5rung.hd-bkt.clouddn.com/28535bad-5186-4b93-b949-85af1f9698157U9V9ybKbD6eMIym', '2021-12-27 20:35:55');
INSERT INTO `course_teacher` VALUES (14, 92, '1', '1', '1', 'http://r3zc5rung.hd-bkt.clouddn.com/347a1e0d-793c-4b7f-8c26-2f3b1d2509aardGNVuaR19aV9EYW', '2021-12-27 20:54:23');
INSERT INTO `course_teacher` VALUES (15, 93, '小公牛', '欢喜', '欢喜', 'http://r3zc5rung.hd-bkt.clouddn.com/7b60fbeb-1857-4881-b4f1-1752e7c897ecQJGFVRhfevzXqVIU', '2021-12-27 23:24:27');
INSERT INTO `course_teacher` VALUES (16, 94, '最最最最最最最最最最终测试', '最最最最最最最最最最终测试', '最最最最最最最最最最终测试', NULL, '2021-12-27 23:48:59');
INSERT INTO `course_teacher` VALUES (17, 95, '1', '1', '1', 'http://r3zc5rung.hd-bkt.clouddn.com/490587bd-21df-4739-bcfb-dd0dbcad9a58OW3cttni1nlacpmZ', '2021-12-28 02:08:54');
INSERT INTO `course_teacher` VALUES (18, 96, '究极测试', '究极测试', '究极测试', 'http://r3zc5rung.hd-bkt.clouddn.com/8bc6a8be-df5c-4456-82c0-edc4c51731f1gkuxrGC7Jwlj7RKT', '2021-12-28 03:11:24');
INSERT INTO `course_teacher` VALUES (19, 22, '王老师', '高级讲师', '', NULL, '2022-08-21 21:17:53');
INSERT INTO `course_teacher` VALUES (20, 74, '张老师', 'java老师', '讲课生动。', '/bucket-pic/2022/08/25/a0950c47-ed28-4dec-8a87-76ff108448d7.jpg', '2022-08-23 15:46:27');
INSERT INTO `course_teacher` VALUES (21, 117, 'Lucy', 'Java 讲师', 'Java Instructor', NULL, '2023-02-07 16:57:28');
INSERT INTO `course_teacher` VALUES (22, 117, 'Kyle', 'Java僵尸', 'Java Zombie', NULL, '2023-02-07 17:06:57');
INSERT INTO `course_teacher` VALUES (26, 163, 'Matlab', 'MatlabMatlab', 'MatlabMatlab', NULL, '2023-03-18 19:33:31');

-- ----------------------------
-- Table structure for mq_message
-- ----------------------------
DROP TABLE IF EXISTS `mq_message`;
CREATE TABLE `mq_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `message_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息类型代码: course_publish ,  media_test',
  `business_key1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `execute_num` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '通知次数',
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '处理状态，0:初始，1:成功',
  `returnfailure_date` datetime NULL DEFAULT NULL COMMENT '回复失败时间',
  `returnsuccess_date` datetime NULL DEFAULT NULL COMMENT '回复成功时间',
  `returnfailure_msg` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复失败内容',
  `execute_date` datetime NULL DEFAULT NULL COMMENT '最近通知时间',
  `stage_state1` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '阶段1处理状态, 0:初始，1:成功',
  `stage_state2` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '阶段2处理状态, 0:初始，1:成功',
  `stage_state3` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '阶段3处理状态, 0:初始，1:成功',
  `stage_state4` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '阶段4处理状态, 0:初始，1:成功',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mq_message
-- ----------------------------

-- ----------------------------
-- Table structure for mq_message_history
-- ----------------------------
DROP TABLE IF EXISTS `mq_message_history`;
CREATE TABLE `mq_message_history`  (
  `id` bigint NOT NULL COMMENT '消息id',
  `message_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息类型代码',
  `business_key1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `execute_num` int UNSIGNED NULL DEFAULT NULL COMMENT '通知次数',
  `state` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '处理状态，0:初始，1:成功，2:失败',
  `returnfailure_date` datetime NULL DEFAULT NULL COMMENT '回复失败时间',
  `returnsuccess_date` datetime NULL DEFAULT NULL COMMENT '回复成功时间',
  `returnfailure_msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复失败内容',
  `execute_date` datetime NULL DEFAULT NULL COMMENT '最近通知时间',
  `stage_state1` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stage_state2` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stage_state3` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stage_state4` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mq_message_history
-- ----------------------------
INSERT INTO `mq_message_history` VALUES (20, 'course_publish', '160', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (22, 'course_publish', '159', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (23, 'course_publish', '161', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (27, 'course_publish', '164', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (28, 'course_publish', '165', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (29, 'course_publish', '166', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');

-- ----------------------------
-- Table structure for teachplan
-- ----------------------------
DROP TABLE IF EXISTS `teachplan`;
CREATE TABLE `teachplan`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程计划名称',
  `parentid` bigint NOT NULL COMMENT '课程计划父级Id',
  `grade` smallint NOT NULL COMMENT '层级，分为1、2、3级',
  `media_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程类型:1视频、2文档',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始直播时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '直播结束时间',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '章节及课程时介绍',
  `timelength` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时长，单位时:分:秒',
  `orderby` int NULL DEFAULT 0 COMMENT '排序字段',
  `course_id` bigint NOT NULL COMMENT '课程标识',
  `course_pub_id` bigint NULL DEFAULT NULL COMMENT '课程发布标识',
  `status` int NOT NULL DEFAULT 1 COMMENT '状态（1正常  0删除）',
  `is_preview` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否支持试学或预览（试看）',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `change_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 350 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程计划' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teachplan
-- ----------------------------
INSERT INTO `teachplan` VALUES (2, '我叼你妈的', 43, 2, '1', '2019-09-16 10:45:36', NULL, NULL, NULL, 1, 25, NULL, 0, NULL, '2019-09-16 10:45:36', '2023-02-06 20:18:37');
INSERT INTO `teachplan` VALUES (3, 'SQL查询', 43, 2, '1', '2019-09-16 10:45:36', NULL, NULL, NULL, 3, 25, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (4, 'SQL优化', 43, 2, '1', '2019-09-16 10:45:36', NULL, NULL, NULL, 2, 25, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (5, '微服务架构入门', 0, 1, NULL, '2019-09-16 10:45:36', NULL, '微服务架构入门', NULL, 1, 26, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (6, 'spring cloud 基础入门', 0, 1, NULL, '2019-09-16 10:45:36', NULL, 'spring cloud 基础入门', NULL, 2, 26, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (7, '实战-Spring Boot', 0, 1, NULL, '2019-09-16 10:45:36', NULL, '实战-Spring Boot', NULL, 3, 26, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (8, '注册中心Eureka', 0, 1, NULL, '2019-09-16 10:45:36', NULL, '注册中心Eureka', '55.00', 4, 26, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (9, '为什么要使用微服务:微服务的优缺点', 13, 2, '1', '2019-09-16 10:45:36', NULL, '为什么要使用微服务:微服务的优缺点', '55.00', 2, 26, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (10, '为什么要使用微服务:单体架构的特点', 13, 2, '1', '2019-09-16 10:45:36', NULL, '为什么要使用微服务:单体架构的特点', '44.00', 1, 26, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (11, '为什么springcloud要设计一套新的版本升级规则？', 14, 2, '1', '2019-09-16 10:45:36', NULL, '为什么springcloud要设计一套新的版本升级规则？', '33.00', 2, 26, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (12, '计算机原理', 0, 1, '0', '2019-09-16 10:45:36', NULL, '介绍计算机工作原理', NULL, 1, 25, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (13, '为什么要选择spring cloud?', 14, 2, '1', '2019-09-16 10:45:36', NULL, '为什么要选择spring cloud?', '12.00', 1, 26, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (14, 'spring boot的入门例子', 15, 2, '1', '2019-09-16 10:45:36', NULL, 'spring boot的入门例子', '44.00', 2, 26, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (16, '为什么越来越多的开发者选择使用spring boot？它解决了什么问题？', 15, 2, '1', '2019-09-16 10:45:36', NULL, '为什么越来越多的开发者选择使用spring boot？它解决了什么问题？', '10.00', 1, 26, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (17, ' 一个Eureka注册中心的入门例子', 16, 2, '1', '2019-09-16 10:45:36', NULL, ' 一个Eureka注册中心的入门例子', '22.00', 2, 26, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (18, '微服务架构为什么需要注册中心，它解决了什么问题？', 16, 2, '1', '2019-09-16 10:45:36', NULL, '微服务架构为什么需要注册中心，它解决了什么问题？', '33.00', 1, 26, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (20, '0', 0, 1, NULL, '2019-09-16 10:45:36', NULL, 'Vuejs 第一讲', NULL, 1, 27, NULL, 0, NULL, '2019-09-16 10:45:36', '2023-02-06 20:18:21');
INSERT INTO `teachplan` VALUES (21, 'Vuejs 第二讲', 0, 1, NULL, '2019-09-16 10:45:36', NULL, NULL, NULL, 2, 43, 23, 203002, NULL, '2019-09-16 10:45:36', '2019-11-19 00:55:16');
INSERT INTO `teachplan` VALUES (22, 'Vuejs 第三讲', 0, 1, NULL, '2019-09-16 10:45:36', NULL, NULL, NULL, 3, 27, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (23, '计算机硬件', 2, 2, '1', '2019-09-16 10:45:36', NULL, NULL, '10.00', 1, 25, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (24, '第一节 vue基础、常用指令、bootstrap+vue的简易留言', 20, 2, '1', '2019-09-16 10:45:36', NULL, '第一节 vue基础、常用指令、bootstrap+vue的简易留言', '22.00', 1, 27, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (25, '第二节 属性和事件、模板、交互、案例', 20, 2, '1', '2019-09-16 10:45:36', NULL, '第二节 属性和事件、模板、交互、案例', '33.00', 2, 27, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (26, '第一节 计算属性的使用、vue实例的简单方法、提高循环的性能，让重复数据显示出来', 21, 2, NULL, '2019-09-16 10:45:36', NULL, NULL, NULL, 1, 27, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (27, '第二节 自定义过滤器、自定义指令 、自定义键盘事件、数据的监听', 21, 2, '1', '2019-09-16 10:45:36', NULL, NULL, NULL, 2, 27, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (29, '第一章：redis简介', 0, 1, NULL, '2019-09-16 10:45:36', NULL, NULL, NULL, 1, 28, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (30, '第二章：redis的安装与配置', 0, 1, NULL, '2019-09-16 10:45:36', NULL, NULL, NULL, 2, 28, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (31, '第三章：Redis数据操作', 0, 1, NULL, '2019-09-16 10:45:36', NULL, NULL, NULL, 3, 28, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (32, '第四章：Redis进阶操作', 0, 1, NULL, '2019-09-16 10:45:36', NULL, NULL, NULL, 4, 28, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (33, '第五章：Redis主从配置', 0, 1, NULL, '2019-09-16 10:45:36', NULL, NULL, NULL, 5, 28, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (34, '计算机软件', 2, 2, '1', '2019-09-16 10:45:36', NULL, NULL, '12.00', 2, 25, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (35, '操作系统类型介绍', 12, 2, '1', '2019-09-16 10:45:36', NULL, '操作系统类型介绍操作系统类型介绍', '11.00', 2, 25, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (36, '操作系统原理', 12, 2, '1', '2019-09-16 10:45:36', NULL, '操作系统原理操作系统原理操作系统原理操作系统原理', '22.00', 1, 25, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (37, '第一节 NoSQL简介', 29, 2, '1', '2019-09-16 10:45:36', NULL, NULL, NULL, 1, 28, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (38, '第二节 认识Redis', 29, 2, '1', '2019-09-16 10:45:36', NULL, NULL, NULL, 2, 28, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (39, '计算机编程入门', 0, 1, '0', '2019-09-16 10:45:36', NULL, NULL, NULL, 3, 25, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (40, 'java语法介绍', 39, 2, '1', '2019-09-16 10:45:36', NULL, NULL, NULL, 2, 25, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (41, 'Hello World', 39, 2, '1', '2019-09-16 10:45:36', NULL, NULL, NULL, 1, 25, NULL, 0, NULL, '2019-09-16 10:45:36', NULL);
INSERT INTO `teachplan` VALUES (43, '0', 0, 1, '1', '2019-09-16 10:45:36', NULL, '数据库编程数据库编程', '11.00', 2, 25, NULL, 0, NULL, '2019-09-16 10:45:36', '2023-02-06 20:18:39');
INSERT INTO `teachplan` VALUES (110, '第一章', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 72, NULL, 1, '0', '2021-12-25 16:27:34', NULL);
INSERT INTO `teachplan` VALUES (111, '第一小节', 110, 2, NULL, NULL, NULL, NULL, NULL, 1, 72, NULL, 1, '0', '2021-12-25 16:27:42', NULL);
INSERT INTO `teachplan` VALUES (113, '第1章基础知识', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 74, NULL, 1, '0', '2021-12-25 17:53:12', NULL);
INSERT INTO `teachplan` VALUES (115, '第1节项目概述', 113, 2, '001002', NULL, NULL, NULL, NULL, 1, 74, NULL, 1, '0', '2021-12-25 17:53:17', NULL);
INSERT INTO `teachplan` VALUES (117, '新章名称 [点击修改]', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 75, NULL, 1, '0', '2021-12-26 18:21:51', NULL);
INSERT INTO `teachplan` VALUES (118, '新章名称 [点击修改]', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 75, NULL, 1, '0', '2021-12-26 18:29:48', NULL);
INSERT INTO `teachplan` VALUES (121, '第一大章节', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 76, NULL, 1, '0', '2021-12-26 19:59:43', NULL);
INSERT INTO `teachplan` VALUES (122, '新章名称 [点击修改]', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 76, NULL, 1, '0', '2021-12-26 19:59:43', NULL);
INSERT INTO `teachplan` VALUES (123, '第一小节', 121, 2, NULL, NULL, NULL, NULL, NULL, 1, 76, NULL, 1, '0', '2021-12-26 19:59:46', NULL);
INSERT INTO `teachplan` VALUES (125, '第一大章节', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 77, NULL, 1, '0', '2021-12-26 20:02:08', NULL);
INSERT INTO `teachplan` VALUES (126, '第一小节', 125, 2, NULL, NULL, NULL, NULL, NULL, 1, 77, NULL, 1, '0', '2021-12-26 20:02:24', NULL);
INSERT INTO `teachplan` VALUES (128, '第一大章', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 78, NULL, 1, '0', '2021-12-26 20:54:25', NULL);
INSERT INTO `teachplan` VALUES (129, '第一小节', 128, 2, NULL, NULL, NULL, NULL, NULL, 1, 78, NULL, 1, '0', '2021-12-26 20:54:40', NULL);
INSERT INTO `teachplan` VALUES (131, '新小节名称 [点击修改]', 128, 2, NULL, NULL, NULL, NULL, NULL, 3, 78, NULL, 1, '0', '2021-12-26 20:55:40', NULL);
INSERT INTO `teachplan` VALUES (135, '新小节名称 [点击修改]', 121, 2, '001004', NULL, NULL, NULL, NULL, 2, 76, NULL, 1, '0', '2021-12-27 09:56:49', NULL);
INSERT INTO `teachplan` VALUES (137, 'Spring1', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 79, NULL, 1, '0', '2021-12-27 10:34:41', NULL);
INSERT INTO `teachplan` VALUES (138, 'Spring1.2', 137, 2, NULL, NULL, NULL, NULL, NULL, 1, 79, NULL, 1, '0', '2021-12-27 10:34:52', NULL);
INSERT INTO `teachplan` VALUES (139, 'Spring2', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 79, NULL, 1, '0', '2021-12-27 10:34:59', NULL);
INSERT INTO `teachplan` VALUES (141, 'Java Web1', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 80, NULL, 1, '0', '2021-12-27 11:08:35', NULL);
INSERT INTO `teachplan` VALUES (142, 'Java Web1.1', 141, 2, NULL, NULL, NULL, NULL, NULL, 1, 80, NULL, 1, '0', '2021-12-27 11:08:40', NULL);
INSERT INTO `teachplan` VALUES (143, 'Java Web2', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 80, NULL, 1, '0', '2021-12-27 11:09:05', NULL);
INSERT INTO `teachplan` VALUES (144, 'Java Web2.1', 143, 2, NULL, NULL, NULL, NULL, NULL, 1, 80, NULL, 1, '0', '2021-12-27 11:09:10', NULL);
INSERT INTO `teachplan` VALUES (146, '什么是微服务', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 82, NULL, 1, '1', '2021-12-27 11:28:07', NULL);
INSERT INTO `teachplan` VALUES (147, '什么是微服务', 146, 2, NULL, NULL, NULL, NULL, NULL, 1, 82, NULL, 1, '1', '2021-12-27 11:28:14', NULL);
INSERT INTO `teachplan` VALUES (148, 'Spring Boot入门', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 82, NULL, 1, '1', '2021-12-27 11:28:35', NULL);
INSERT INTO `teachplan` VALUES (149, '入门程序', 148, 2, NULL, NULL, NULL, NULL, NULL, 1, 82, NULL, 1, '1', '2021-12-27 11:28:41', NULL);
INSERT INTO `teachplan` VALUES (152, '123', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 83, NULL, 1, '0', '2021-12-27 12:22:08', NULL);
INSERT INTO `teachplan` VALUES (153, '123456', 152, 2, '001002', NULL, NULL, NULL, NULL, 1, 83, NULL, 1, '0', '2021-12-27 12:22:14', NULL);
INSERT INTO `teachplan` VALUES (154, '456', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 83, NULL, 1, '0', '2021-12-27 12:22:23', NULL);
INSERT INTO `teachplan` VALUES (155, '123456', 154, 2, '001004', NULL, NULL, NULL, NULL, 1, 83, NULL, 1, '0', '2021-12-27 12:22:29', NULL);
INSERT INTO `teachplan` VALUES (157, 'Spring Cloud1', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 84, NULL, 1, '0', '2021-12-27 13:42:06', NULL);
INSERT INTO `teachplan` VALUES (158, 'Spring Cloud1.1', 157, 2, '001002', NULL, NULL, NULL, NULL, 1, 84, NULL, 1, '1', '2021-12-27 13:42:12', NULL);
INSERT INTO `teachplan` VALUES (159, 'Spring Cloud2', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 84, NULL, 1, '0', '2021-12-27 13:42:18', NULL);
INSERT INTO `teachplan` VALUES (160, 'Spring Cloud2.1', 159, 2, '001004', NULL, NULL, NULL, NULL, 1, 84, NULL, 1, '1', '2021-12-27 13:42:23', NULL);
INSERT INTO `teachplan` VALUES (162, '第一章', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 85, NULL, 1, '0', '2021-12-27 15:55:03', NULL);
INSERT INTO `teachplan` VALUES (163, '第二章', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 85, NULL, 1, '0', '2021-12-27 15:55:04', NULL);
INSERT INTO `teachplan` VALUES (164, '第三章', 0, 1, NULL, NULL, NULL, NULL, NULL, 3, 85, NULL, 1, '0', '2021-12-27 15:55:05', NULL);
INSERT INTO `teachplan` VALUES (165, '第一小节', 162, 2, '001004', NULL, NULL, NULL, NULL, 1, 85, NULL, 1, '0', '2021-12-27 15:55:06', NULL);
INSERT INTO `teachplan` VALUES (166, '第一小节', 163, 2, '001004', NULL, NULL, NULL, NULL, 1, 85, NULL, 1, '0', '2021-12-27 15:55:07', NULL);
INSERT INTO `teachplan` VALUES (167, '第二小节', 162, 2, '001002', NULL, NULL, NULL, NULL, 2, 85, NULL, 1, '0', '2021-12-27 15:55:08', NULL);
INSERT INTO `teachplan` VALUES (168, '第一章', 164, 2, '001002', NULL, NULL, NULL, NULL, 1, 85, NULL, 1, '0', '2021-12-27 15:55:10', NULL);
INSERT INTO `teachplan` VALUES (170, '1', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 86, NULL, 1, '0', '2021-12-27 20:01:08', NULL);
INSERT INTO `teachplan` VALUES (171, '2', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 86, NULL, 1, '0', '2021-12-27 20:01:16', NULL);
INSERT INTO `teachplan` VALUES (172, '3', 0, 1, NULL, NULL, NULL, NULL, NULL, 3, 86, NULL, 1, '0', '2021-12-27 20:01:17', NULL);
INSERT INTO `teachplan` VALUES (173, '1', 170, 2, '001004', NULL, NULL, NULL, NULL, 1, 86, NULL, 1, '0', '2021-12-27 20:01:31', NULL);
INSERT INTO `teachplan` VALUES (174, '2', 170, 2, '001004', NULL, NULL, NULL, NULL, 2, 86, NULL, 1, '0', '2021-12-27 20:01:37', NULL);
INSERT INTO `teachplan` VALUES (175, '1', 171, 2, '001002', NULL, NULL, NULL, NULL, 1, 86, NULL, 1, '0', '2021-12-27 20:01:42', NULL);
INSERT INTO `teachplan` VALUES (176, '2', 171, 2, '001002', NULL, NULL, NULL, NULL, 2, 86, NULL, 1, '0', '2021-12-27 20:01:43', NULL);
INSERT INTO `teachplan` VALUES (177, '1', 172, 2, '001004', NULL, NULL, NULL, NULL, 1, 86, NULL, 1, '0', '2021-12-27 20:01:47', NULL);
INSERT INTO `teachplan` VALUES (179, '新章名称 [点击修改]', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 87, NULL, 1, '0', '2021-12-27 20:14:15', NULL);
INSERT INTO `teachplan` VALUES (180, '新小节名称 [点击修改]', 179, 2, '001004', NULL, NULL, NULL, NULL, 1, 87, NULL, 1, '0', '2021-12-27 20:14:17', NULL);
INSERT INTO `teachplan` VALUES (181, '新小节名称 [点击修改]', 179, 2, '001004', NULL, NULL, NULL, NULL, 2, 87, NULL, 1, '0', '2021-12-27 20:14:29', NULL);
INSERT INTO `teachplan` VALUES (183, '新章名称 [点击修改]', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 88, NULL, 1, '0', '2021-12-27 20:14:56', NULL);
INSERT INTO `teachplan` VALUES (184, '新小节名称 [点击修改]', 183, 2, '001004', NULL, NULL, NULL, NULL, 1, 88, NULL, 1, '0', '2021-12-27 20:14:59', NULL);
INSERT INTO `teachplan` VALUES (186, '1', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 89, NULL, 1, '0', '2021-12-27 20:21:50', NULL);
INSERT INTO `teachplan` VALUES (187, '2', 186, 2, '001002', NULL, NULL, NULL, NULL, 1, 89, NULL, 1, '1', '2021-12-27 20:21:55', NULL);
INSERT INTO `teachplan` VALUES (189, '1', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 90, NULL, 1, '0', '2021-12-27 20:26:59', NULL);
INSERT INTO `teachplan` VALUES (190, '2', 189, 2, '001002', NULL, NULL, NULL, NULL, 1, 90, NULL, 1, '1', '2021-12-27 20:27:04', NULL);
INSERT INTO `teachplan` VALUES (191, '3', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 90, NULL, 1, '0', '2021-12-27 20:27:11', NULL);
INSERT INTO `teachplan` VALUES (192, '4', 191, 2, '001004', NULL, NULL, NULL, NULL, 1, 90, NULL, 1, '1', '2021-12-27 20:27:14', NULL);
INSERT INTO `teachplan` VALUES (194, '第一大章', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 91, NULL, 1, '0', '2021-12-27 20:35:10', NULL);
INSERT INTO `teachplan` VALUES (195, '1', 194, 2, '001002', NULL, NULL, NULL, NULL, 1, 91, NULL, 1, '1', '2021-12-27 20:35:13', NULL);
INSERT INTO `teachplan` VALUES (196, '2', 194, 2, '001004', NULL, NULL, NULL, NULL, 2, 91, NULL, 1, '1', '2021-12-27 20:35:27', NULL);
INSERT INTO `teachplan` VALUES (198, '新章名称 [点击修改]', 0, 1, '', NULL, NULL, NULL, NULL, 1, 92, NULL, 1, '0', '2021-12-27 20:53:34', NULL);
INSERT INTO `teachplan` VALUES (199, '新章名称 [点击修改]', 0, 1, '', NULL, NULL, NULL, NULL, 2, 92, NULL, 1, '0', '2021-12-27 20:53:35', NULL);
INSERT INTO `teachplan` VALUES (200, '新小节名称 [点击修改]', 198, 2, '001004', NULL, NULL, NULL, NULL, 1, 92, NULL, 1, '0', '2021-12-27 20:53:39', NULL);
INSERT INTO `teachplan` VALUES (201, '新小节名称 [点击修改]', 198, 2, '001004', NULL, NULL, NULL, NULL, 2, 92, NULL, 1, '0', '2021-12-27 20:53:40', NULL);
INSERT INTO `teachplan` VALUES (202, '新小节名称 [点击修改]', 199, 2, '001002', NULL, NULL, NULL, NULL, 1, 92, NULL, 1, '0', '2021-12-27 20:53:41', NULL);
INSERT INTO `teachplan` VALUES (204, '新章名称 [点击修改]', 0, 1, '', NULL, NULL, NULL, NULL, 1, 93, NULL, 1, '0', '2021-12-27 23:23:19', NULL);
INSERT INTO `teachplan` VALUES (205, '新章名称 [点击修改]', 0, 1, '', NULL, NULL, NULL, NULL, 2, 93, NULL, 1, '0', '2021-12-27 23:23:20', NULL);
INSERT INTO `teachplan` VALUES (206, '新章名称 [点击修改]', 0, 1, '', NULL, NULL, NULL, NULL, 3, 93, NULL, 1, '0', '2021-12-27 23:23:21', NULL);
INSERT INTO `teachplan` VALUES (207, '新小节名称 [点击修改]', 204, 2, '001004', NULL, NULL, NULL, NULL, 1, 93, NULL, 1, '0', '2021-12-27 23:23:22', NULL);
INSERT INTO `teachplan` VALUES (208, '新小节名称 [点击修改]', 204, 2, '001004', NULL, NULL, NULL, NULL, 2, 93, NULL, 1, '0', '2021-12-27 23:23:23', NULL);
INSERT INTO `teachplan` VALUES (209, '新小节名称 [点击修改]', 205, 2, '001002', NULL, NULL, NULL, NULL, 1, 93, NULL, 1, '0', '2021-12-27 23:23:24', NULL);
INSERT INTO `teachplan` VALUES (211, '新章名称 [点击修改]', 0, 1, '', NULL, NULL, NULL, NULL, 1, 94, NULL, 1, '0', '2021-12-27 23:48:16', NULL);
INSERT INTO `teachplan` VALUES (212, '新章名称 [点击修改]', 0, 1, '', NULL, NULL, NULL, NULL, 2, 94, NULL, 1, '0', '2021-12-27 23:48:17', NULL);
INSERT INTO `teachplan` VALUES (213, '新章名称 [点击修改]', 0, 1, '', NULL, NULL, NULL, NULL, 3, 94, NULL, 1, '0', '2021-12-27 23:48:17', NULL);
INSERT INTO `teachplan` VALUES (214, '新小节名称 [点击修改]', 211, 2, '001004', NULL, NULL, NULL, NULL, 1, 94, NULL, 1, '0', '2021-12-27 23:48:18', NULL);
INSERT INTO `teachplan` VALUES (215, '新小节名称 [点击修改]', 211, 2, '001004', NULL, NULL, NULL, NULL, 2, 94, NULL, 1, '0', '2021-12-27 23:48:20', NULL);
INSERT INTO `teachplan` VALUES (216, '新小节名称 [点击修改]', 212, 2, '001004', NULL, NULL, NULL, NULL, 1, 94, NULL, 1, '0', '2021-12-27 23:48:22', NULL);
INSERT INTO `teachplan` VALUES (217, '新小节名称 [点击修改]', 213, 2, '001002', NULL, NULL, NULL, NULL, 1, 94, NULL, 1, '0', '2021-12-27 23:48:47', NULL);
INSERT INTO `teachplan` VALUES (219, '新章名称 [点击修改]', 0, 1, '', NULL, NULL, NULL, NULL, 1, 95, NULL, 1, '0', '2021-12-28 02:08:10', NULL);
INSERT INTO `teachplan` VALUES (220, '新章名称 [点击修改]', 0, 1, '', NULL, NULL, NULL, NULL, 2, 95, NULL, 1, '0', '2021-12-28 02:08:11', NULL);
INSERT INTO `teachplan` VALUES (221, '新小节名称 [点击修改]', 219, 2, '001004', NULL, NULL, NULL, NULL, 1, 95, NULL, 1, '0', '2021-12-28 02:08:13', NULL);
INSERT INTO `teachplan` VALUES (222, '新小节名称 [点击修改]', 219, 2, '001004', NULL, NULL, NULL, NULL, 2, 95, NULL, 1, '0', '2021-12-28 02:08:14', NULL);
INSERT INTO `teachplan` VALUES (223, '新小节名称 [点击修改]', 220, 2, '001002', NULL, NULL, NULL, NULL, 1, 95, NULL, 1, '0', '2021-12-28 02:08:38', NULL);
INSERT INTO `teachplan` VALUES (225, '究极测试1', 0, 1, '', NULL, NULL, NULL, NULL, 1, 96, NULL, 1, '0', '2021-12-28 03:10:28', NULL);
INSERT INTO `teachplan` VALUES (226, '1', 225, 2, '001004', NULL, NULL, NULL, NULL, 1, 96, NULL, 1, '1', '2021-12-28 03:10:32', NULL);
INSERT INTO `teachplan` VALUES (227, '2', 225, 2, '001002', NULL, NULL, NULL, NULL, 2, 96, NULL, 1, '1', '2021-12-28 03:10:34', NULL);
INSERT INTO `teachplan` VALUES (228, '究极测试2', 0, 1, '', NULL, NULL, NULL, NULL, 2, 96, NULL, 1, '0', '2021-12-28 03:10:35', NULL);
INSERT INTO `teachplan` VALUES (230, '新章名称 [点击修改]', 0, 1, '', NULL, NULL, NULL, NULL, 1, 97, NULL, 1, '0', '2021-12-28 03:36:54', NULL);
INSERT INTO `teachplan` VALUES (231, '新章名称 [点击修改]', 0, 1, '', NULL, NULL, NULL, NULL, 2, 97, NULL, 1, '0', '2021-12-28 03:36:55', NULL);
INSERT INTO `teachplan` VALUES (232, '新章名称 [点击修改]', 0, 1, '', NULL, NULL, NULL, NULL, 3, 97, NULL, 1, '0', '2021-12-28 03:36:56', NULL);
INSERT INTO `teachplan` VALUES (234, '新小节名称 [点击修改]', 231, 2, '001002', NULL, NULL, NULL, NULL, 1, 97, NULL, 1, '0', '2021-12-28 03:36:59', NULL);
INSERT INTO `teachplan` VALUES (235, '新小节名称 [点击修改]', 230, 2, '001004', NULL, NULL, NULL, NULL, 2, 97, NULL, 1, '0', '2021-12-28 03:38:27', NULL);
INSERT INTO `teachplan` VALUES (236, '新小节名称 [点击修改]', 231, 2, '001004', NULL, NULL, NULL, NULL, 2, 97, NULL, 1, '0', '2021-12-28 03:39:11', NULL);
INSERT INTO `teachplan` VALUES (237, '第1章', 0, 1, '', NULL, NULL, NULL, NULL, 1, 22, NULL, 1, '0', '2022-08-21 21:09:58', NULL);
INSERT INTO `teachplan` VALUES (240, '第1节', 237, 2, '', NULL, NULL, NULL, NULL, 1, 22, NULL, 1, '1', '2022-08-21 21:16:29', NULL);
INSERT INTO `teachplan` VALUES (241, '第2节', 237, 2, '', NULL, NULL, NULL, NULL, 2, 22, NULL, 1, '0', '2022-08-21 21:17:20', NULL);
INSERT INTO `teachplan` VALUES (242, '第2章快速入门', 0, 1, '', NULL, NULL, NULL, NULL, 1, 74, NULL, 1, '0', '2022-08-23 15:07:09', NULL);
INSERT INTO `teachplan` VALUES (244, '第1节搭建环境', 242, 2, '001002', NULL, NULL, NULL, NULL, 2, 74, NULL, 1, '1', '2022-08-23 15:36:30', NULL);
INSERT INTO `teachplan` VALUES (245, '第2节项目概述', 242, 2, '001002', NULL, NULL, NULL, NULL, 3, 74, NULL, 1, '0', '2022-08-23 18:35:16', NULL);
INSERT INTO `teachplan` VALUES (246, '第3章项目概述', 0, 1, NULL, NULL, NULL, NULL, NULL, 3, 74, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (247, '第4章', 0, 1, NULL, NULL, NULL, NULL, NULL, 4, 74, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (248, '第3-1节', 246, 2, NULL, NULL, NULL, NULL, NULL, 4, 74, NULL, 1, '1', NULL, NULL);
INSERT INTO `teachplan` VALUES (249, '第4-1小节 ', 247, 2, NULL, NULL, NULL, NULL, NULL, 5, 74, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (250, '第4-0小节', 247, 2, NULL, NULL, NULL, NULL, NULL, 2, 74, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (251, '新章名称 [点击修改]', 0, 1, NULL, NULL, NULL, NULL, NULL, 5, 74, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (252, '小节名称 [点击修改]', 247, 2, NULL, NULL, NULL, NULL, NULL, 3, 74, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (253, '第1节修改名称', 237, 2, '', NULL, NULL, NULL, NULL, 3, 22, NULL, 1, '1', NULL, NULL);
INSERT INTO `teachplan` VALUES (255, '第1章', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (256, '第1小节', 255, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (257, '配置详解', 148, 2, NULL, NULL, NULL, NULL, NULL, 2, 82, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (258, '项目实战', 148, 2, NULL, NULL, NULL, NULL, NULL, 3, 82, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (259, '新章名称 [点击修改]', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 22, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (260, '新小节名称 [点击修改]', 259, 2, NULL, NULL, NULL, NULL, NULL, 1, 22, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (261, '新章名称 [点击修改]', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 40, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (262, '新小节名称 [点击修改]', 261, 2, NULL, NULL, NULL, NULL, NULL, 1, 40, NULL, 1, '1', NULL, NULL);
INSERT INTO `teachplan` VALUES (263, '新小节名称 [点击修改]', 255, 2, NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (264, '新章名称 [点击修改]', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (265, '新小节名称 [点击修改]', 264, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (266, '第1章', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (267, '266', 266, 2, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 1, '0', NULL, '2023-02-06 20:13:05');
INSERT INTO `teachplan` VALUES (268, '1.配置管理', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 117, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (269, '1.1Nacos', 268, 2, NULL, NULL, NULL, NULL, NULL, 1, 117, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (270, '1.2Nacos简介', 268, 2, NULL, NULL, NULL, NULL, NULL, 2, 117, NULL, 1, '0', NULL, '2023-02-07 13:18:42');
INSERT INTO `teachplan` VALUES (271, '1.3安装Nacos Server', 268, 2, NULL, NULL, NULL, NULL, NULL, 3, 117, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (272, '1.4Nacos配置入门', 268, 2, NULL, NULL, NULL, NULL, NULL, 4, 117, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (273, '1.5命名空间管理', 268, 2, NULL, NULL, NULL, NULL, NULL, 5, 117, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (274, '2.服务发现', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 117, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (275, '2.1什么是服务发现', 274, 2, NULL, NULL, NULL, NULL, NULL, 1, 117, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (276, '2.2服务发现快速入门', 274, 2, NULL, NULL, NULL, NULL, NULL, 2, 117, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (277, '2.3服务发现数据模型', 274, 2, NULL, NULL, NULL, NULL, NULL, 3, 117, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (288, '新章名称 [点击修改]', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 156, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (292, '3.综合案例', 0, 1, NULL, NULL, NULL, NULL, NULL, 3, 117, NULL, 1, '0', '2023-02-06 21:05:10', '2023-02-06 21:05:32');
INSERT INTO `teachplan` VALUES (293, '3.1Nacos作配置中心', 292, 2, NULL, NULL, NULL, NULL, NULL, 1, 117, NULL, 1, '0', '2023-02-06 21:05:34', '2023-02-06 21:12:51');
INSERT INTO `teachplan` VALUES (304, '新小节名称 [点击修改]', 292, 2, NULL, NULL, NULL, NULL, NULL, 2, 117, NULL, 1, '0', '2023-02-07 17:58:25', '2023-02-07 17:58:27');
INSERT INTO `teachplan` VALUES (306, '1', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 159, NULL, 1, '0', '2023-02-09 15:27:00', '2023-02-09 15:27:14');
INSERT INTO `teachplan` VALUES (307, '1.1', 306, 2, NULL, NULL, NULL, NULL, NULL, 1, 159, NULL, 1, '0', '2023-02-09 15:27:02', '2023-02-09 15:27:17');
INSERT INTO `teachplan` VALUES (308, '1.2', 306, 2, NULL, NULL, NULL, NULL, NULL, 2, 159, NULL, 1, '0', '2023-02-09 15:27:05', '2023-02-09 15:27:22');
INSERT INTO `teachplan` VALUES (309, '1.3', 306, 2, NULL, NULL, NULL, NULL, NULL, 3, 159, NULL, 1, '0', '2023-02-09 15:27:06', '2023-02-09 15:27:24');
INSERT INTO `teachplan` VALUES (315, '新小节名称 [点击修改]', 292, 2, NULL, NULL, NULL, NULL, NULL, 3, 117, NULL, 1, '0', '2023-02-13 23:06:31', '2023-02-28 16:45:25');
INSERT INTO `teachplan` VALUES (320, '胶水开门', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 160, NULL, 1, '0', '2023-03-02 17:17:10', '2023-03-02 17:17:25');
INSERT INTO `teachplan` VALUES (321, '胶水撒娇', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 160, NULL, 1, '0', '2023-03-02 17:17:12', '2023-03-02 17:17:32');
INSERT INTO `teachplan` VALUES (322, '胶水睡觉', 0, 1, NULL, NULL, NULL, NULL, NULL, 3, 160, NULL, 1, '0', '2023-03-02 17:17:12', '2023-03-03 12:48:22');
INSERT INTO `teachplan` VALUES (323, '新小节名称 [点击修改]', 322, 2, NULL, NULL, NULL, NULL, NULL, 1, 160, NULL, 1, '0', '2023-03-02 17:17:38', NULL);
INSERT INTO `teachplan` VALUES (324, '新小节名称 [点击修改]', 321, 2, NULL, NULL, NULL, NULL, NULL, 1, 160, NULL, 1, '0', '2023-03-02 17:17:39', NULL);
INSERT INTO `teachplan` VALUES (325, '新小节名称 [点击修改]', 320, 2, NULL, NULL, NULL, NULL, NULL, 1, 160, NULL, 1, '0', '2023-03-02 17:17:40', NULL);
INSERT INTO `teachplan` VALUES (326, '新小节名称 [点击修改]', 322, 2, NULL, NULL, NULL, NULL, NULL, 2, 160, NULL, 1, '0', '2023-03-02 17:18:04', NULL);
INSERT INTO `teachplan` VALUES (327, '新章名称 [点击修改]', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 18, NULL, 1, '0', '2023-03-05 19:04:44', NULL);
INSERT INTO `teachplan` VALUES (328, '新章名称 [点击修改]', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 24, NULL, 1, '0', '2023-03-07 22:43:28', NULL);
INSERT INTO `teachplan` VALUES (330, '1.1', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 162, NULL, 1, '0', '2023-03-18 19:29:38', '2023-03-18 19:29:42');
INSERT INTO `teachplan` VALUES (331, '1.2', 330, 2, NULL, NULL, NULL, NULL, NULL, 1, 162, NULL, 1, '0', '2023-03-18 19:29:43', '2023-03-18 19:29:48');
INSERT INTO `teachplan` VALUES (332, '1.1', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 163, NULL, 1, '0', '2023-03-18 19:32:45', '2023-03-18 19:32:48');
INSERT INTO `teachplan` VALUES (333, '1.2', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 163, NULL, 1, '0', '2023-03-18 19:32:50', '2023-03-18 19:32:53');
INSERT INTO `teachplan` VALUES (334, '1.3', 0, 1, NULL, NULL, NULL, NULL, NULL, 3, 163, NULL, 1, '0', '2023-03-18 19:32:50', '2023-03-18 19:32:55');
INSERT INTO `teachplan` VALUES (335, '1.1.1', 332, 2, NULL, NULL, NULL, NULL, NULL, 1, 163, NULL, 1, '0', '2023-03-18 19:32:56', '2023-03-18 19:32:59');
INSERT INTO `teachplan` VALUES (336, '1.2.1', 333, 2, NULL, NULL, NULL, NULL, NULL, 1, 163, NULL, 1, '0', '2023-03-18 19:33:01', '2023-03-18 19:33:04');
INSERT INTO `teachplan` VALUES (337, '1.2.2', 333, 2, NULL, NULL, NULL, NULL, NULL, 2, 163, NULL, 1, '0', '2023-03-18 19:33:01', '2023-03-18 19:33:08');
INSERT INTO `teachplan` VALUES (338, '1.3', 334, 2, NULL, NULL, NULL, NULL, NULL, 1, 163, NULL, 1, '0', '2023-03-18 19:33:09', '2023-03-18 19:33:12');
INSERT INTO `teachplan` VALUES (339, 'UI设计', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 164, NULL, 1, '0', '2023-03-18 19:50:20', '2023-03-18 19:50:25');
INSERT INTO `teachplan` VALUES (340, '1.1', 339, 2, NULL, NULL, NULL, NULL, NULL, 1, 164, NULL, 1, '0', '2023-03-18 19:50:26', '2023-03-18 19:50:31');
INSERT INTO `teachplan` VALUES (341, '1.2', 339, 2, NULL, NULL, NULL, NULL, NULL, 2, 164, NULL, 1, '0', '2023-03-18 19:50:27', '2023-03-18 19:50:33');
INSERT INTO `teachplan` VALUES (342, '笨比AI', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 165, NULL, 1, '1', '2023-03-19 17:41:53', '2023-03-19 17:42:01');
INSERT INTO `teachplan` VALUES (343, '猫娘调教', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 165, NULL, 1, '0', '2023-03-19 17:42:02', '2023-03-19 17:42:07');
INSERT INTO `teachplan` VALUES (344, '新小节名称 [点击修改]', 342, 2, NULL, NULL, NULL, NULL, NULL, 1, 165, NULL, 1, '1', '2023-03-19 17:42:09', NULL);
INSERT INTO `teachplan` VALUES (345, '新章名称 [点击修改]', 343, 2, NULL, NULL, NULL, NULL, NULL, 1, 165, NULL, 1, '0', '2023-03-08 11:26:48', NULL);
INSERT INTO `teachplan` VALUES (346, '新章名称 [点击修改]1', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 166, NULL, 1, '0', '2023-04-02 23:16:53', '2023-04-02 23:16:59');
INSERT INTO `teachplan` VALUES (347, '新章名称 [点击修改]2', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 166, NULL, 1, '0', '2023-04-02 23:16:55', '2023-04-02 23:17:01');
INSERT INTO `teachplan` VALUES (348, '新小节名称 [点击修改]', 346, 2, NULL, NULL, NULL, NULL, NULL, 1, 166, NULL, 1, '0', '2023-04-02 23:17:02', NULL);
INSERT INTO `teachplan` VALUES (349, '新小节名称 [点击修改]', 347, 2, NULL, NULL, NULL, NULL, NULL, 1, 166, NULL, 1, '0', '2023-04-02 23:17:03', NULL);

-- ----------------------------
-- Table structure for teachplan_media
-- ----------------------------
DROP TABLE IF EXISTS `teachplan_media`;
CREATE TABLE `teachplan_media`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `media_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '媒资文件id',
  `teachplan_id` bigint NOT NULL COMMENT '课程计划标识',
  `course_id` bigint NOT NULL COMMENT '课程标识',
  `media_fileName` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '媒资文件原始名称',
  `create_date` datetime NULL DEFAULT NULL,
  `create_people` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `change_people` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teachplan_media
-- ----------------------------
INSERT INTO `teachplan_media` VALUES (35, '23f83ae728bd1269eee7ea2236e79644', 149, 82, '16-Nacos配置管理-课程总结.avi', '2022-09-15 08:02:26', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (38, '3a5a861d1c745d05166132c47b44f9e4', 147, 82, '01-Nacos配置管理-内容介绍.avi', '2022-09-15 08:02:55', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (40, '3a5a861d1c745d05166132c47b44f9e4', 269, 117, '01-Nacos配置管理-内容介绍.avi', '2022-10-04 19:04:45', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (41, '23f83ae728bd1269eee7ea2236e79644', 270, 117, '16-Nacos配置管理-课程总结.avi', '2022-10-04 19:04:55', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (42, '3a5a861d1c745d05166132c47b44f9e4', 271, 117, '01-Nacos配置管理-内容介绍.avi', '2022-10-04 19:05:03', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (43, '3a5a861d1c745d05166132c47b44f9e4', 272, 117, '01-Nacos配置管理-内容介绍.avi', '2022-10-04 19:05:10', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (44, '23f83ae728bd1269eee7ea2236e79644', 273, 117, '16-Nacos配置管理-课程总结.avi', '2022-10-04 19:05:14', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (45, '1f229319d6fed3431d2f9d06193a433b', 275, 117, '01-分布式事务专题课程介绍.avi', '2022-10-04 19:05:22', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (46, '6ad24a762f67c18f61966c1b8c55abe6', 276, 117, '07-分布式事务基础理论-BASE理论.avi', '2022-10-04 19:05:27', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (47, '1f229319d6fed3431d2f9d06193a433b', 277, 117, '01-分布式事务专题课程介绍.avi', '2022-10-04 19:05:31', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (57, '2324914c0a065a583f6bfba7080faef3', 325, 160, '胶水01.mp4', '2023-03-02 17:17:47', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (58, 'c00c815ab0e77e4da33309cc2d8ab77c', 324, 160, '胶水02.mp4', '2023-03-02 17:17:55', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (60, 'f56582224553598bfbaf529f9e5d140b', 326, 160, '胶水04.mp4', '2023-03-02 17:18:15', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (61, 'd8849c8a7b55c64d38a7b565ef01b9f3', 323, 160, '胶水03.mp4', '2023-03-03 11:38:16', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (63, 'ff73b385ba975356f2ec7405ac70e4ea', 331, 162, '胶水06.mp4', '2023-03-18 19:30:22', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (64, '2324914c0a065a583f6bfba7080faef3', 335, 163, '胶水01.mp4', '2023-03-18 19:38:18', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (65, 'c00c815ab0e77e4da33309cc2d8ab77c', 336, 163, '胶水02.mp4', '2023-03-18 19:38:30', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (66, 'd8849c8a7b55c64d38a7b565ef01b9f3', 337, 163, '胶水03.mp4', '2023-03-18 19:38:36', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (67, '2324914c0a065a583f6bfba7080faef3', 344, 165, '胶水01.mp4', '2023-03-19 17:42:16', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (69, '2324914c0a065a583f6bfba7080faef3', 348, 166, '胶水01.mp4', '2023-04-02 23:17:16', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (70, '2324914c0a065a583f6bfba7080faef3', 349, 166, '胶水01.mp4', '2023-04-02 23:17:23', NULL, NULL);

-- ----------------------------
-- Table structure for teachplan_work
-- ----------------------------
DROP TABLE IF EXISTS `teachplan_work`;
CREATE TABLE `teachplan_work`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `work_id` bigint NOT NULL COMMENT '作业信息标识',
  `work_title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作业标题',
  `teachplan_id` bigint NOT NULL COMMENT '课程计划标识',
  `course_id` bigint NULL DEFAULT NULL COMMENT '课程标识',
  `create_date` datetime NULL DEFAULT NULL,
  `course_pub_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teachplan_work
-- ----------------------------
INSERT INTO `teachplan_work` VALUES (12, 8, '测试作业1', 138, 79, '2021-12-27 10:35:15', NULL);
INSERT INTO `teachplan_work` VALUES (13, 8, '测试作业1', 144, 80, '2021-12-27 11:09:20', NULL);
INSERT INTO `teachplan_work` VALUES (14, 8, '测试作业1', 129, 78, '2021-12-27 11:15:04', NULL);
INSERT INTO `teachplan_work` VALUES (15, 8, '测试作业1', 147, 82, '2021-12-27 11:28:28', NULL);
INSERT INTO `teachplan_work` VALUES (17, 8, '测试作业1', 155, 83, '2021-12-27 12:22:55', NULL);
INSERT INTO `teachplan_work` VALUES (18, 8, '测试作业1', 160, 84, '2021-12-27 13:43:42', NULL);
INSERT INTO `teachplan_work` VALUES (19, 24, '最终测试', 165, 85, '2021-12-27 15:55:17', NULL);
INSERT INTO `teachplan_work` VALUES (21, 8, '测试作业1', 135, 76, '2021-12-27 16:06:23', NULL);
INSERT INTO `teachplan_work` VALUES (22, 24, '最终测试', 166, 85, '2021-12-27 16:09:17', NULL);
INSERT INTO `teachplan_work` VALUES (23, 24, '最终测试', 173, 86, '2021-12-27 20:02:03', NULL);
INSERT INTO `teachplan_work` VALUES (24, 8, '测试作业1', 174, 86, '2021-12-27 20:02:34', NULL);
INSERT INTO `teachplan_work` VALUES (25, 8, '测试作业1', 177, 86, '2021-12-27 20:03:03', NULL);
INSERT INTO `teachplan_work` VALUES (26, 8, '测试作业1', 180, 87, '2021-12-27 20:14:25', NULL);
INSERT INTO `teachplan_work` VALUES (27, 20, '测试作业', 181, 87, '2021-12-27 20:14:36', NULL);
INSERT INTO `teachplan_work` VALUES (28, 8, '测试作业1', 184, 88, '2021-12-27 20:15:05', NULL);
INSERT INTO `teachplan_work` VALUES (29, 8, '测试作业1', 192, 90, '2021-12-27 20:27:33', NULL);
INSERT INTO `teachplan_work` VALUES (30, 8, '测试作业1', 196, 91, '2021-12-27 20:35:41', NULL);
INSERT INTO `teachplan_work` VALUES (31, 24, '最终测试', 200, 92, '2021-12-27 20:53:50', NULL);
INSERT INTO `teachplan_work` VALUES (32, 24, '最终测试', 201, 92, '2021-12-27 20:54:06', NULL);
INSERT INTO `teachplan_work` VALUES (33, 25, '小母猪', 207, 93, '2021-12-27 23:23:38', NULL);
INSERT INTO `teachplan_work` VALUES (34, 26, '小母牛', 208, 93, '2021-12-27 23:23:48', NULL);
INSERT INTO `teachplan_work` VALUES (35, 24, '最终测试', 214, 94, '2021-12-27 23:48:28', NULL);
INSERT INTO `teachplan_work` VALUES (36, 25, '小母猪', 215, 94, '2021-12-27 23:48:36', NULL);
INSERT INTO `teachplan_work` VALUES (37, 26, '小母牛', 216, 94, '2021-12-27 23:48:44', NULL);
INSERT INTO `teachplan_work` VALUES (39, 29, '真最终测试', 222, 95, '2021-12-28 02:08:28', NULL);
INSERT INTO `teachplan_work` VALUES (40, 8, '测试作业1', 221, 95, '2021-12-28 02:08:36', NULL);
INSERT INTO `teachplan_work` VALUES (41, 8, '测试作业1', 226, 96, '2021-12-28 03:11:04', NULL);
INSERT INTO `teachplan_work` VALUES (42, 32, '项目展示', 233, 97, '2021-12-28 03:37:11', NULL);
INSERT INTO `teachplan_work` VALUES (43, 20, '测试作业', 235, 97, '2021-12-28 03:39:08', NULL);
INSERT INTO `teachplan_work` VALUES (44, 32, '项目展示', 236, 97, '2021-12-28 03:40:56', NULL);

SET FOREIGN_KEY_CHECKS = 1;
