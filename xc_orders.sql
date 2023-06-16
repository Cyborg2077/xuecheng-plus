/*
 Navicat Premium Data Transfer

 Source Server         : MySQL8.0
 Source Server Type    : MySQL
 Source Server Version : 80029 (8.0.29)
 Source Host           : localhost:3306
 Source Schema         : xc_orders

 Target Server Type    : MySQL
 Target Server Version : 80029 (8.0.29)
 File Encoding         : 65001

 Date: 16/06/2023 15:26:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `mq_message_history` VALUES (1, 'payresult_notify', '16', '60201', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (2, 'payresult_notify', '35', '60201', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (15, 'payresult_notify', '11', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');
INSERT INTO `mq_message_history` VALUES (16, 'payresult_notify', '15', '60201', NULL, 0, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0');

-- ----------------------------
-- Table structure for xc_orders
-- ----------------------------
DROP TABLE IF EXISTS `xc_orders`;
CREATE TABLE `xc_orders`  (
  `id` bigint NOT NULL COMMENT '订单号',
  `total_price` float(8, 2) NOT NULL COMMENT '总价',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易状态',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `order_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单类型',
  `order_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单名称',
  `order_descrip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单描述',
  `order_detail` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单明细json',
  `out_business_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '外部系统业务id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orders_unioue`(`out_business_id` ASC) USING BTREE COMMENT '外部系统的业务id'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xc_orders
-- ----------------------------
INSERT INTO `xc_orders` VALUES (1577177773194113024, 1.00, '2022-10-04 14:04:18', '600002', '50', '60201', '测试课程01', '购买课程:测试课程01', '[{\"goodsId\":2,\"goodsType\":\"60201\",\"goodsName\":\"测试课程01\",\"goodsPrice\":1}]', '10');
INSERT INTO `xc_orders` VALUES (1577258681653280768, 1.00, '2022-10-04 19:25:48', '600002', '52', '60201', 'Nacos微服务开发实战', '购买课程:Nacos微服务开发实战', '[{\"goodsId\":117,\"goodsType\":\"60201\",\"goodsName\":\"Nacos微服务开发实战\",\"goodsPrice\":1}]', '11');
INSERT INTO `xc_orders` VALUES (1585094781512269824, 11.00, '2022-10-26 10:23:40', '600002', '51', '60201', 'java零基础入门', '购买课程:java零基础入门', '[{\"goodsId\":18,\"goodsType\":\"60201\",\"goodsName\":\"java零基础入门\",\"goodsPrice\":11}]', '15');
INSERT INTO `xc_orders` VALUES (1623527995495899136, 1.00, '2023-02-09 11:43:32', '600002', '52', '60201', 'Spring Cloud 开发实战', '购买课程:Spring Cloud 开发实战', '[{\"goodsId\":121,\"goodsType\":\"60201\",\"goodsName\":\"Spring Cloud 开发实战\",\"goodsPrice\":1}]', '16');
INSERT INTO `xc_orders` VALUES (1637024043665518592, 0.10, '2023-03-18 17:32:01', '600001', '52', '60201', 'Python快速入门', '购买课程:Python快速入门', '[{\"goodsId\":161,\"goodsType\":\"60201\",\"goodsName\":\"Python快速入门\",\"goodsPrice\":0.1}]', '32');
INSERT INTO `xc_orders` VALUES (1637335346206851072, 9999.00, '2023-03-19 14:09:01', '600002', '52', '60201', 'Matlab', '购买课程:Matlab', '[{\"goodsId\":\"163\",\"goodsType\":\"60201\",\"goodsName\":\"Matlab\",\"goodsPrice\":9999}]', '34');
INSERT INTO `xc_orders` VALUES (1637392614262325248, 1888.00, '2023-03-19 17:56:35', '600002', '52', '60201', '机器学习', '购买课程:机器学习', '[{\"goodsId\":\"165\",\"goodsType\":\"60201\",\"goodsName\":\"机器学习\",\"goodsPrice\":1888}]', '35');
INSERT INTO `xc_orders` VALUES (1642547684720427008, 0.10, '2023-04-02 23:21:00', '600002', '52', '60201', 'asd', '购买课程:asd', '[{\"goodsId\":\"166\",\"goodsType\":\"60201\",\"goodsName\":\"asd\",\"goodsPrice\":0.1}]', '37');

-- ----------------------------
-- Table structure for xc_orders_goods
-- ----------------------------
DROP TABLE IF EXISTS `xc_orders_goods`;
CREATE TABLE `xc_orders_goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL COMMENT '订单号',
  `goods_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `goods_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品类型',
  `goods_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `goods_price` float(10, 2) NOT NULL COMMENT '商品交易价，单位分',
  `goods_detail` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品详情json',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xc_orders_goods
-- ----------------------------
INSERT INTO `xc_orders_goods` VALUES (2, 1577177773194113024, '2', '60201', '测试课程01', 1.00, NULL);
INSERT INTO `xc_orders_goods` VALUES (3, 1577258681653280768, '117', '60201', 'Nacos微服务开发实战', 1.00, NULL);
INSERT INTO `xc_orders_goods` VALUES (4, 1585094781512269824, '18', '60201', 'java零基础入门', 11.00, NULL);
INSERT INTO `xc_orders_goods` VALUES (5, 1623527995495899136, '121', '60201', 'Spring Cloud 开发实战', 1.00, NULL);
INSERT INTO `xc_orders_goods` VALUES (6, 1637024043665518592, '161', '60201', 'Python快速入门', 0.10, NULL);
INSERT INTO `xc_orders_goods` VALUES (7, 1637055184671883264, '163', '60201', 'Matlab', 9999.00, NULL);
INSERT INTO `xc_orders_goods` VALUES (8, 1637335346206851072, '163', '60201', 'Matlab', 9999.00, NULL);
INSERT INTO `xc_orders_goods` VALUES (9, 1637390300430954496, '165', '60201', '机器学习', 1888.00, NULL);
INSERT INTO `xc_orders_goods` VALUES (10, 1637392614262325248, '165', '60201', '机器学习', 1888.00, NULL);
INSERT INTO `xc_orders_goods` VALUES (11, 1642547684720427008, '166', '60201', 'asd', 0.10, NULL);

-- ----------------------------
-- Table structure for xc_pay_record
-- ----------------------------
DROP TABLE IF EXISTS `xc_pay_record`;
CREATE TABLE `xc_pay_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pay_no` bigint NOT NULL COMMENT '本系统支付交易号',
  `out_pay_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方支付交易流水号',
  `out_pay_channel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方支付渠道编号',
  `order_id` bigint NOT NULL COMMENT '商品订单号',
  `order_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单名称',
  `total_price` float(8, 2) NOT NULL COMMENT '订单总价单位元',
  `currency` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '币种CNY',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付状态',
  `pay_success_time` datetime NULL DEFAULT NULL COMMENT '支付成功时间',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pay_order_unioue2`(`pay_no` ASC) USING BTREE COMMENT '本系统支付交易号',
  UNIQUE INDEX `pay_order_unioue`(`out_pay_no` ASC) USING BTREE COMMENT '第三方支付订单号'
) ENGINE = InnoDB AUTO_INCREMENT = 1642550402056466435 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xc_pay_record
-- ----------------------------
INSERT INTO `xc_pay_record` VALUES (1577177773231415298, 1577177773231861760, NULL, NULL, 1577177773194113024, '测试课程01', 1.00, 'CNY', '2022-10-04 14:04:18', '601001', NULL, '50');
INSERT INTO `xc_pay_record` VALUES (1577179016003612674, 1577179015973519360, NULL, NULL, 1577177773194113024, '测试课程01', 1.00, 'CNY', '2022-10-04 14:09:15', '601001', NULL, '50');
INSERT INTO `xc_pay_record` VALUES (1577181370643955713, 1577181370624544768, NULL, NULL, 1577177773194113024, '测试课程01', 1.00, 'CNY', '2022-10-04 14:18:36', '601001', NULL, '50');
INSERT INTO `xc_pay_record` VALUES (1577182027190972417, 1577182027171524608, NULL, NULL, 1577177773194113024, '测试课程01', 1.00, 'CNY', '2022-10-04 14:21:13', '601001', NULL, '50');
INSERT INTO `xc_pay_record` VALUES (1577182653388025858, 1577182653344460800, NULL, NULL, 1577177773194113024, '测试课程01', 1.00, 'CNY', '2022-10-04 14:23:42', '601001', NULL, '50');
INSERT INTO `xc_pay_record` VALUES (1577237009017651202, 1577237008990695424, NULL, NULL, 1577177773194113024, '测试课程01', 1.00, 'CNY', '2022-10-04 17:59:41', '601001', NULL, '50');
INSERT INTO `xc_pay_record` VALUES (1577239361250500609, 1577239361225244672, NULL, NULL, 1577177773194113024, '测试课程01', 1.00, 'CNY', '2022-10-04 18:09:02', '601002', '2022-10-04 18:09:44', '50');
INSERT INTO `xc_pay_record` VALUES (1577419635984793601, 1577419635962195968, '2022100522001422760505741092', 'Alipay', 1577258681653280768, 'Nacos微服务开发实战', 1.00, 'CNY', '2022-10-05 06:05:23', '601002', '2022-10-05 06:06:39', '52');
INSERT INTO `xc_pay_record` VALUES (1585094781699452930, 1585094781684236288, NULL, NULL, 1585094781512269824, 'java零基础入门', 11.00, 'CNY', '2022-10-26 10:23:40', '601001', NULL, '51');
INSERT INTO `xc_pay_record` VALUES (1585096384011689985, 1585096383987376128, '2022102622001422760505751569', '603002', 1585094781512269824, 'java零基础入门', 11.00, 'CNY', '2022-10-26 10:30:02', '601002', '2022-10-26 10:32:13', '51');
INSERT INTO `xc_pay_record` VALUES (1585118358242865154, 1585118358214623232, '2022102622001422760505751132', '603002', 1585094781512269824, 'java零基础入门', 11.00, 'CNY', '2022-10-26 11:57:21', '601002', '2022-10-26 11:58:50', '51');
INSERT INTO `xc_pay_record` VALUES (1623527995601891329, 1623527995592368128, '2023020922001422760505798854', '603002', 1623527995495899136, 'Spring Cloud 开发实战', 1.00, 'CNY', '2023-02-09 11:43:32', '601002', '2023-02-09 11:44:42', '52');
INSERT INTO `xc_pay_record` VALUES (1637024043792080897, 1637024043787153408, NULL, NULL, 1637024043665518592, 'Python快速入门', 0.10, 'CNY', '2023-03-18 17:32:01', '601001', NULL, '52');
INSERT INTO `xc_pay_record` VALUES (1637038916966141954, 1637038916949913600, NULL, NULL, 1637024043665518592, 'Python快速入门', 0.10, 'CNY', '2023-03-18 18:31:07', '601001', NULL, '52');
INSERT INTO `xc_pay_record` VALUES (1637316754319396866, 1637316754299928576, NULL, NULL, 1637024043665518592, 'Python快速入门', 0.10, 'CNY', '2023-03-19 12:55:09', '601001', NULL, '52');
INSERT INTO `xc_pay_record` VALUES (1637335346305847298, 1637335346294931456, '2023031922001445220502615599', 'Alipay', 1637335346206851072, 'Matlab', 9999.00, 'CNY', '2023-03-19 14:09:01', '601002', '2023-03-19 14:12:22', '52');
INSERT INTO `xc_pay_record` VALUES (1637392614347010049, 1637392614346211328, '2023031922001445220502615602', 'Alipay', 1637392614262325248, '机器学习', 1888.00, 'CNY', '2023-03-19 17:56:35', '601002', '2023-03-19 17:57:00', '52');
INSERT INTO `xc_pay_record` VALUES (1642545881745993729, 1642545881731743744, NULL, NULL, 1637024043665518592, 'Python快速入门', 0.10, 'CNY', '2023-04-02 23:13:50', '601001', NULL, '52');
INSERT INTO `xc_pay_record` VALUES (1642547684831145985, 1642547684833673216, NULL, NULL, 1642547684720427008, 'asd', 0.10, 'CNY', '2023-04-02 23:21:00', '601001', NULL, '52');
INSERT INTO `xc_pay_record` VALUES (1642548057335672833, 1642548057338200064, NULL, NULL, 1642547684720427008, 'asd', 0.10, 'CNY', '2023-04-02 23:22:29', '601001', NULL, '52');
INSERT INTO `xc_pay_record` VALUES (1642550035583348737, 1642550035585875968, NULL, NULL, 1642547684720427008, 'asd', 0.10, 'CNY', '2023-04-02 23:30:20', '601001', NULL, '52');
INSERT INTO `xc_pay_record` VALUES (1642550402056466434, 1642550402058993664, NULL, NULL, 1642547684720427008, 'asd', 0.10, 'CNY', '2023-04-02 23:31:48', '601002', NULL, '52');

SET FOREIGN_KEY_CHECKS = 1;
