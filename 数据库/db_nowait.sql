/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50556
Source Host           : localhost:3306
Source Database       : db_nowait

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2017-12-18 15:53:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_admin`
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(20) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_adminName` (`adminName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', 'admin', '156650ad747cfb25fcb9a7a2f8a02bdc');
INSERT INTO `tb_admin` VALUES ('2', 'boss', '156650ad747cfb25fcb9a7a2f8a02bdc');

-- ----------------------------
-- Table structure for `tb_chainshop`
-- ----------------------------
DROP TABLE IF EXISTS `tb_chainshop`;
CREATE TABLE `tb_chainshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pic` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_chainshop_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_chainshop
-- ----------------------------
INSERT INTO `tb_chainshop` VALUES ('1', 'K立方量贩式KTV', 'http://120.78.182.217/images/1513216860516.jpg');
INSERT INTO `tb_chainshop` VALUES ('2', '岳阳烧烤', 'http://120.78.182.217/images/1513216871120.jpg');
INSERT INTO `tb_chainshop` VALUES ('3', '不夜天柴火烤鱼火锅店', 'http://120.78.182.217/images/1513216880935.jpg');
INSERT INTO `tb_chainshop` VALUES ('4', '阿甘甜品', 'http://120.78.182.217/images/1513216890359.jpg');
INSERT INTO `tb_chainshop` VALUES ('5', '和亭日本料理', 'http://120.78.182.217/images/1513216899772.jpg');
INSERT INTO `tb_chainshop` VALUES ('6', '圣鼎记自助美食汇', 'http://120.78.182.217/images/1513216907599.jpg');
INSERT INTO `tb_chainshop` VALUES ('7', '甜之心', 'http://120.78.182.217/images/1513216915810.jpg');

-- ----------------------------
-- Table structure for `tb_desk`
-- ----------------------------
DROP TABLE IF EXISTS `tb_desk`;
CREATE TABLE `tb_desk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `style` varchar(40) NOT NULL,
  `info` varchar(40) DEFAULT NULL,
  `restId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_desk
-- ----------------------------
INSERT INTO `tb_desk` VALUES ('1', '大桌', '5-8人', '1');
INSERT INTO `tb_desk` VALUES ('2', '中桌', '3-4人', '1');
INSERT INTO `tb_desk` VALUES ('3', '小桌', '1-2人', '1');
INSERT INTO `tb_desk` VALUES ('4', '大桌', '5-8人', '2');
INSERT INTO `tb_desk` VALUES ('5', '中桌', '3-4人', '2');
INSERT INTO `tb_desk` VALUES ('6', '小桌', '1-2人', '2');
INSERT INTO `tb_desk` VALUES ('7', '大桌', '5-8人', '3');
INSERT INTO `tb_desk` VALUES ('8', '中桌', '3-4人', '3');
INSERT INTO `tb_desk` VALUES ('9', '小桌', '1-2人', '3');
INSERT INTO `tb_desk` VALUES ('10', '大桌', '5-8人', '4');
INSERT INTO `tb_desk` VALUES ('11', '中桌', '3-4人', '4');
INSERT INTO `tb_desk` VALUES ('12', '小桌', '1-2人', '4');
INSERT INTO `tb_desk` VALUES ('13', '大桌', '5-8人', '5');
INSERT INTO `tb_desk` VALUES ('14', '中桌', '3-4人', '5');
INSERT INTO `tb_desk` VALUES ('15', '小桌', '1-2人', '5');
INSERT INTO `tb_desk` VALUES ('16', '大桌', '5-8人', '6');
INSERT INTO `tb_desk` VALUES ('17', '中桌', '3-4人', '6');
INSERT INTO `tb_desk` VALUES ('18', '小桌', '1-2人', '6');
INSERT INTO `tb_desk` VALUES ('19', '大桌', '5-8人', '7');
INSERT INTO `tb_desk` VALUES ('20', '中桌', '3-4人', '7');
INSERT INTO `tb_desk` VALUES ('21', '小桌', '1-2人', '7');
INSERT INTO `tb_desk` VALUES ('22', '大桌', '5-8人', '8');
INSERT INTO `tb_desk` VALUES ('23', '中桌', '3-4人', '8');
INSERT INTO `tb_desk` VALUES ('24', '小桌', '1-2人', '8');
INSERT INTO `tb_desk` VALUES ('25', '大桌', '5-8人', '9');
INSERT INTO `tb_desk` VALUES ('26', '中桌', '3-4人', '9');
INSERT INTO `tb_desk` VALUES ('27', '小桌', '1-2人', '9');
INSERT INTO `tb_desk` VALUES ('28', '大桌', '5-8人', '10');
INSERT INTO `tb_desk` VALUES ('29', '中桌', '3-4人', '10');
INSERT INTO `tb_desk` VALUES ('30', '小桌', '1-2人', '10');
INSERT INTO `tb_desk` VALUES ('32', '中桌', '3-4人', '11');
INSERT INTO `tb_desk` VALUES ('33', '小桌', '1-2人', '11');
INSERT INTO `tb_desk` VALUES ('34', '大桌', '5-8人', '15');
INSERT INTO `tb_desk` VALUES ('35', '中桌', '3-4人', '15');
INSERT INTO `tb_desk` VALUES ('36', '小桌', '1-2人', '15');
INSERT INTO `tb_desk` VALUES ('37', '大桌', '5-8人', '14');
INSERT INTO `tb_desk` VALUES ('38', '中桌', '3-4人', '14');
INSERT INTO `tb_desk` VALUES ('39', '小桌', '1-2人', '14');
INSERT INTO `tb_desk` VALUES ('40', '大桌', '5-8人', '13');
INSERT INTO `tb_desk` VALUES ('41', '中桌', '3-4人', '13');
INSERT INTO `tb_desk` VALUES ('42', '小桌', '1-2人', '13');
INSERT INTO `tb_desk` VALUES ('43', '大桌', '5-8人', '12');
INSERT INTO `tb_desk` VALUES ('44', '中桌', '3-4人', '12');
INSERT INTO `tb_desk` VALUES ('45', '小桌', '1-2人', '12');
INSERT INTO `tb_desk` VALUES ('46', '大桌', '5-8人', '16');
INSERT INTO `tb_desk` VALUES ('47', '中桌', '3-4人', '16');
INSERT INTO `tb_desk` VALUES ('48', '小桌', '1-2人', '16');

-- ----------------------------
-- Table structure for `tb_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `tb_feedback`;
CREATE TABLE `tb_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wxuserId` int(11) NOT NULL,
  `info` varchar(200) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  `isRead` char(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_feedback
-- ----------------------------
INSERT INTO `tb_feedback` VALUES ('1', '1', '还行，下次再来', '2017-11-14 12:14:15', '已讀');
INSERT INTO `tb_feedback` VALUES ('2', '2', 'haha', '2017-11-21 10:37:18', '未讀');
INSERT INTO `tb_feedback` VALUES ('3', '2', '哈哈', '2017-11-22 13:31:53', '已讀');
INSERT INTO `tb_feedback` VALUES ('4', '1', '这是测试', '2017-12-07 20:38:02', '未讀');
INSERT INTO `tb_feedback` VALUES ('5', '1', '这是测试', '2017-12-07 20:38:21', '已讀');
INSERT INTO `tb_feedback` VALUES ('6', '1', '这是测试', '2017-12-07 20:38:21', '已讀');
INSERT INTO `tb_feedback` VALUES ('7', '1', '这是测试', '2017-12-07 20:38:21', '未讀');
INSERT INTO `tb_feedback` VALUES ('8', '1', '这是测试', '2017-12-07 20:38:21', '未讀');
INSERT INTO `tb_feedback` VALUES ('9', '1', '这是测试', '2017-12-07 20:38:21', '未讀');
INSERT INTO `tb_feedback` VALUES ('10', '1', '这是测试', '2017-12-07 20:38:21', '未讀');
INSERT INTO `tb_feedback` VALUES ('11', '1', '这是测试', '2017-12-07 20:38:21', '已讀');
INSERT INTO `tb_feedback` VALUES ('12', '1', '这是测试', '2017-12-07 20:38:21', '已讀');
INSERT INTO `tb_feedback` VALUES ('15', '1', '这是测试', '2017-12-07 20:38:21', '未讀');
INSERT INTO `tb_feedback` VALUES ('17', '1', '这是测试', '2017-12-07 20:38:46', '已讀');
INSERT INTO `tb_feedback` VALUES ('18', '1', '这是测试', '2017-12-07 20:38:46', '已讀');
INSERT INTO `tb_feedback` VALUES ('19', '1', '这是测试', '2017-12-07 20:38:47', '已讀');
INSERT INTO `tb_feedback` VALUES ('20', '1', '这是测试', '2017-12-07 20:38:47', '已讀');
INSERT INTO `tb_feedback` VALUES ('21', '1', '这是测试', '2017-12-07 20:38:47', '已讀');
INSERT INTO `tb_feedback` VALUES ('22', '1', '这是测试', '2017-12-07 20:38:47', '已讀');
INSERT INTO `tb_feedback` VALUES ('23', '1', '这是测试', '2017-12-07 20:38:47', '未讀');
INSERT INTO `tb_feedback` VALUES ('24', '1', '这是测试', '2017-12-07 20:38:47', '已讀');
INSERT INTO `tb_feedback` VALUES ('25', '1', '这是测试', '2017-12-07 20:38:47', '未讀');
INSERT INTO `tb_feedback` VALUES ('26', '1', '这是测试', '2017-12-07 20:38:47', '已讀');
INSERT INTO `tb_feedback` VALUES ('27', '1', '这是测试', '2017-12-07 20:38:47', '未讀');
INSERT INTO `tb_feedback` VALUES ('29', '2', '这是测试', '2017-12-07 20:44:55', '已讀');
INSERT INTO `tb_feedback` VALUES ('30', '2', '这是测试', '2017-12-07 20:44:55', '未讀');
INSERT INTO `tb_feedback` VALUES ('31', '2', '这是测试', '2017-12-07 20:44:55', '已讀');
INSERT INTO `tb_feedback` VALUES ('32', '2', '这是测试', '2017-12-07 20:44:55', '已讀');
INSERT INTO `tb_feedback` VALUES ('34', '2', '这是测试', '2017-12-08 08:37:38', '已讀');
INSERT INTO `tb_feedback` VALUES ('35', '2', '这是测试', '2017-12-08 08:37:38', '已讀');
INSERT INTO `tb_feedback` VALUES ('36', '2', '这是测试', '2017-12-08 08:37:38', '已讀');
INSERT INTO `tb_feedback` VALUES ('37', '2', '这是测试', '2017-12-08 08:37:38', '已讀');
INSERT INTO `tb_feedback` VALUES ('38', '2', '这是测试', '2017-12-08 08:37:38', '未讀');
INSERT INTO `tb_feedback` VALUES ('41', '2', '这是测试', '2017-12-08 08:37:38', '未讀');
INSERT INTO `tb_feedback` VALUES ('42', '2', '这是测试', '2017-12-08 08:37:38', '未讀');

-- ----------------------------
-- Table structure for `tb_order`
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wxuserId` int(11) NOT NULL,
  `restId` int(11) NOT NULL,
  `restName` varchar(50) NOT NULL,
  `style` varchar(40) DEFAULT NULL,
  `info` varchar(40) DEFAULT NULL,
  `waitNo` varchar(40) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  `isUsage` char(2) NOT NULL,
  `warnInfo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('3', '1', '1', 'K立方量贩式KTV(红旗店)', '中桌', '5-8人', 'B01', '2017-11-22 09:58:02', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('4', '1', '1', 'K立方量贩式KTV(红旗店)', '中桌', '5-8人', 'B02', '2017-11-22 09:58:11', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('5', '1', '1', 'K立方量贩式KTV(红旗店)', '中桌', '5-8人', 'B02', '2017-11-22 09:58:27', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('6', '1', '1', 'K立方量贩式KTV(红旗店)', '小桌', '2-4人', 'C02', '2017-11-22 09:58:59', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('7', '1', '1', 'K立方量贩式KTV(红旗店)', '小桌', '2-4人', 'C03', '2017-11-22 09:59:06', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('8', '1', '1', 'K立方量贩式KTV(红旗店)', '小桌', '2-4人', 'C04', '2017-11-22 09:59:21', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('9', '1', '1', 'K立方量贩式KTV(红旗店)', '小桌', '2-4人', 'C05', '2017-11-22 10:01:26', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('10', '1', '8', '甜之心(湾仔沙店)', '大桌', '9-12人', 'A01', '2017-11-18 12:10:14', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('11', '1', '8', '甜之心(湾仔沙店)', '大桌', '9-12人', 'A02', '2017-11-18 12:10:14', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('12', '1', '8', '甜之心(湾仔沙店)', '中桌', '5-8人', 'B01', '2017-11-18 12:10:14', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('13', '1', '8', '甜之心(湾仔沙店)', '中桌', '5-8人', 'B02', '2017-11-18 12:10:14', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('14', '1', '8', '甜之心(湾仔沙店)', '小桌', '2-4人', 'C01', '2017-11-18 12:10:14', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('15', '1', '8', '甜之心(湾仔沙店)', '小桌', '2-4人', 'C02', '2017-11-18 12:10:14', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('16', '1', '8', '甜之心(湾仔沙店)', '小桌', '2-4人', 'C03', '2017-11-18 12:10:14', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('17', '1', '13', '圣鼎记自助美食汇(科干店)', '大桌', '9-12人', 'A01', '2017-11-22 10:07:15', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('18', '1', '13', '圣鼎记自助美食汇(科干店)', '大桌', '9-12人', 'A02', '2017-11-22 10:07:17', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('19', '1', '13', '圣鼎记自助美食汇(科干店)', '中桌', '5-8人', 'B01', '2017-11-22 10:07:30', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('20', '1', '13', '圣鼎记自助美食汇(科干店)', '中桌', '5-8人', 'B02', '2017-11-22 10:07:32', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('21', '1', '13', '圣鼎记自助美食汇(科干店)', '小桌', '2-4人', 'C01', '2017-11-22 10:07:44', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('22', '1', '13', '圣鼎记自助美食汇(科干店)', '小桌', '2-4人', 'C02', '2017-11-22 10:07:44', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('23', '1', '14', '岳阳烧烤(科干店)', '大桌', '9-12人', 'A01', '2017-11-22 10:08:09', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('24', '1', '14', '岳阳烧烤(科干店)', '大桌', '9-12人', 'A02', '2017-11-22 10:08:10', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('25', '1', '14', '岳阳烧烤(科干店)', '中桌', '5-8人', 'B01', '2017-11-22 10:08:30', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('26', '1', '14', '岳阳烧烤(科干店)', '中桌', '5-8人', 'B02', '2017-11-22 10:08:31', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('27', '1', '14', '岳阳烧烤(科干店)', '小桌', '2-4人', 'C01', '2017-11-22 10:08:44', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('28', '1', '14', '岳阳烧烤(科干店)', '小桌', '2-4人', 'C02', '2017-11-22 10:08:46', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('29', '1', '11', '阿甘甜品(科干店)', '小桌', '2-4人', 'C01', '2017-11-22 10:43:40', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('30', '1', '11', '阿甘甜品(科干店)', '小桌', '2-4人', 'C02', '2017-11-22 10:43:43', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('31', '3', '11', '阿甘甜品(科干店)', '小桌', '2-4人', 'C03', '2017-11-23 09:51:34', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('38', '3', '14', '岳阳烧烤(科干店)', '大桌', '5-8人', 'A03', '2017-11-27 16:59:38', '是', '過號不作廢');
INSERT INTO `tb_order` VALUES ('39', '3', '13', '圣鼎记自助美食汇(科干店)', '中桌', '3-4人', 'B03', '2017-11-27 16:59:56', '是', '過號作廢');
INSERT INTO `tb_order` VALUES ('40', '3', '8', '甜之心(湾仔沙店)', '中桌', '3-4人', 'B03', '2017-11-27 17:06:11', '是', '過號作廢');
INSERT INTO `tb_order` VALUES ('42', '8', '14', '岳阳烧烤(科干店)', '中桌', '3-4人', 'B03', '2017-11-27 17:19:35', '是', '過號不作廢');
INSERT INTO `tb_order` VALUES ('45', '8', '1', 'K立方量贩式KTV(红旗店)', '大桌', '5-8人', 'A01', '2017-11-28 08:36:21', '是', '過號作廢');
INSERT INTO `tb_order` VALUES ('47', '9', '14', '岳阳烧烤(科干店)', '小桌', '1-2人', 'C03', '2017-11-28 08:50:22', '是', '過號不作廢');
INSERT INTO `tb_order` VALUES ('49', '11', '14', '岳阳烧烤(科干店)', '中桌', '3-4人', 'B04', '2017-11-28 09:53:51', '否', '過號不作廢');
INSERT INTO `tb_order` VALUES ('52', '11', '14', '岳阳烧烤(科干店)', '大桌', '5-8人', 'A05', '2017-11-28 10:38:29', '是', '過號不作廢');
INSERT INTO `tb_order` VALUES ('53', '16', '1', 'K立方量贩式KTV(红旗店)', '大桌', '5-8人', 'A02', '2017-12-04 15:10:32', '否', '過號作廢');
INSERT INTO `tb_order` VALUES ('54', '17', '1', 'K立方量贩式KTV(红旗店)', '大桌', '5-8人', 'A02', '2017-12-04 15:13:46', '是', '過號作廢');
INSERT INTO `tb_order` VALUES ('55', '18', '11', '阿甘甜品(科干店)', '中桌', '3-4人', 'B01', '2017-12-04 15:21:45', '是', '過號不作廢');
INSERT INTO `tb_order` VALUES ('56', '19', '11', '阿甘甜品(科干店)', '中桌', '3-4人', 'B02', '2017-12-04 15:23:14', '是', '過號不作廢');
INSERT INTO `tb_order` VALUES ('58', '21', '14', '岳阳烧烤(科干店)', '大桌', '5-8人', 'A06', '2017-12-05 10:54:45', '否', '過號不作廢');
INSERT INTO `tb_order` VALUES ('59', '32', '14', '岳阳烧烤(科干店)', '小桌', '1-2人', 'C04', '2017-12-12 08:58:38', '否', '過號不作廢');
INSERT INTO `tb_order` VALUES ('60', '32', '14', '岳阳烧烤(科干店)', '小桌', '1-2人', 'C04', '2017-12-12 09:22:30', '否', '過號不作廢');
INSERT INTO `tb_order` VALUES ('61', '32', '14', '岳阳烧烤(科干店)', '小桌', '1-2人', 'C04', '2017-12-12 09:23:20', '是', '過號不作廢');

-- ----------------------------
-- Table structure for `tb_restaurant`
-- ----------------------------
DROP TABLE IF EXISTS `tb_restaurant`;
CREATE TABLE `tb_restaurant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `priceInfo` varchar(50) DEFAULT NULL,
  `warnInfo` varchar(100) DEFAULT NULL,
  `address` varchar(140) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `shopTime` varchar(50) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `chainName` varchar(50) DEFAULT NULL,
  `coverPic` varchar(200) DEFAULT NULL,
  `navPic` varchar(200) DEFAULT NULL,
  `lng` decimal(10,6) DEFAULT NULL,
  `lat` decimal(10,6) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  `isOverdue` char(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_restaurant
-- ----------------------------
INSERT INTO `tb_restaurant` VALUES ('1', 'K立方量贩式KTV(红旗店)', '30', '测试', '广东省珠海市金湾区南翔路111号', '(010)1234-1235', '8:00-20:00', '前方正在等待', '1', 'K立方量贩式KTV', 'http://120.78.182.217/images/1513216860516.jpg', 'http://120.78.182.217/images/1513216982125.jpg,http://120.78.182.217/images/1513216951269.jpg,http://120.78.182.217/images/1513216899772.jpg', '113.343470', '22.129130', '2017-12-18 15:42:46', '0');
INSERT INTO `tb_restaurant` VALUES ('2', '岳阳烧烤(XX店)', '30', '测试', '广东省珠海市金湾区岳阳烧烤', '(010)1234-1234', '19:00-23:00', '餐廳暫停取號', '1', '岳阳烧烤', 'http://120.78.182.217/images/1513216871120.jpg', 'http://120.78.182.217/images/1513216982125.jpg,http://120.78.182.217/images/1513216907599.jpg,http://120.78.182.217/images/1513216998410.jpg', '113.347690', '22.135850', '2017-11-19 13:20:32', '0');
INSERT INTO `tb_restaurant` VALUES ('3', '不夜天柴火烤鱼火锅店(红旗店)', '35', '测试', '广东省珠海市金湾区红旗虹晖一路中珠花园旁', '(010)1234-1236', '8:00-20:00', '當前排隊狀況', '1', '不夜天柴火烤鱼火锅店', 'http://120.78.182.217/images/1513216880935.jpg', 'http://120.78.182.217/images/1513216860516.jpg,http://120.78.182.217/images/1513216899772.jpg,http://120.78.182.217/images/1513216880935.jpg', '113.347690', '22.135850', '2017-11-16 08:35:10', '0');
INSERT INTO `tb_restaurant` VALUES ('4', '阿甘甜品(红旗店)', '20', '测试', '广东省珠海市金湾区世纪名城商业街156号(世纪名城08Bar斜对面)', '(010)1234-1237', '8:00-20:00', '當前排隊狀況', '2', '阿甘甜品', 'http://120.78.182.217/images/1513216890359.jpg', 'http://120.78.182.217/images/1513216915810.jpg,http://120.78.182.217/images/1513216959179.jpg,http://120.78.182.217/images/1513216982125.jpg', '113.348200', '22.134010', '2017-11-16 08:35:21', '1');
INSERT INTO `tb_restaurant` VALUES ('5', '和亭日本料理(红旗店)', '50', '测试', '广东省珠海市金湾区虹晖一路232', '(010)1234-1238', '8:00-20:00', '餐廳暫停取號', '2', '和亭日本料理', 'http://120.78.182.217/images/1513216899772.jpg', 'http://120.78.182.217/images/1513216998410.jpg,http://120.78.182.217/images/1513216990416.jpg,http://120.78.182.217/images/1513216967608.jpg', '113.341310', '22.133200', '2017-11-16 08:35:32', '1');
INSERT INTO `tb_restaurant` VALUES ('6', '圣鼎记自助美食汇(红旗店)', '40', '测试', '广东省珠海市金湾区益百家1楼', '(010)1234-1239', '8:00-20:00', '餐廳暫停取號', '2', '圣鼎记自助美食汇', 'http://120.78.182.217/images/1513216907599.jpg', 'http://120.78.182.217/images/1513216951269.jpg,http://120.78.182.217/images/1513216907599.jpg', '113.343180', '22.135410', '2017-11-16 08:35:55', '0');
INSERT INTO `tb_restaurant` VALUES ('7', '岳阳烧烤(红旗店)', '30', '测试', '广东省珠海市金湾区岳阳烧烤', '(010)1234-1234', '19:00-23:00', '餐廳暫停取號', '3', '岳阳烧烤', 'http://120.78.182.217/images/1513216871120.jpg', 'http://120.78.182.217/images/1513216982125.jpg,http://120.78.182.217/images/1513216907599.jpg,http://120.78.182.217/images/1513216998410.jpg', '113.347690', '22.135850', '2017-11-19 13:20:32', '1');
INSERT INTO `tb_restaurant` VALUES ('8', '甜之心(湾仔沙店)', '25', '测试', '广东省珠海市香洲区凤凰南路1009号', '(010)1234-1234', '8:00-20:00', '前方正在等待', '3', '甜之心', 'http://120.78.182.217/images/1513216915810.jpg', 'http://120.78.182.217/images/1513216890359.jpg', '113.577930', '22.271500', '2017-11-16 08:34:17', '0');
INSERT INTO `tb_restaurant` VALUES ('10', '不夜天柴火烤鱼火锅店(科干店)', '35', '测试', '广东省珠海市金湾区红旗虹晖一路中珠花园旁', '(010)1234-1236', '8:00-20:00', '當前排隊狀況', '3', '不夜天柴火烤鱼火锅店', 'http://120.78.182.217/images/1513216880935.jpg', 'http://120.78.182.217/images/1513216860516.jpg,http://120.78.182.217/images/1513216899772.jpg,http://120.78.182.217/images/1513216880935.jpg', '113.347690', '22.135850', '2017-12-18 15:46:37', '0');
INSERT INTO `tb_restaurant` VALUES ('11', '阿甘甜品(科干店)', '20', '测试', '广东省珠海市金湾区世纪名城商业街156号(世纪名城08Bar斜对面)', '(010)1234-1237', '8:00-20:00', '前方正在等待', '3', '阿甘甜品', 'http://120.78.182.217/images/1513216890359.jpg', 'http://120.78.182.217/images/1513216915810.jpg,http://120.78.182.217/images/1513216959179.jpg,http://120.78.182.217/images/1513216982125.jpg', '113.348200', '22.134010', '2017-11-16 08:35:21', '1');
INSERT INTO `tb_restaurant` VALUES ('12', '和亭日本料理(科干店)', '50', '测试', '广东省珠海市金湾区虹晖一路232', '(010)1234-1238', '8:00-20:00', '餐廳暫停取號', '4', '和亭日本料理', 'http://120.78.182.217/images/1513216899772.jpg', 'http://120.78.182.217/images/1513216998410.jpg,http://120.78.182.217/images/1513216990416.jpg,http://120.78.182.217/images/1513216967608.jpg', '113.341310', '22.133200', '2017-11-16 08:35:32', '1');
INSERT INTO `tb_restaurant` VALUES ('13', '圣鼎记自助美食汇(科干店)', '40', '测试', '广东省珠海市金湾区益百家1楼', '(010)1234-1239', '8:00-20:00', '前方正在等待', '4', '圣鼎记自助美食汇', 'http://120.78.182.217/images/1513216907599.jpg', 'http://120.78.182.217/images/1513216951269.jpg,http://120.78.182.217/images/1513216907599.jpg', '113.343180', '22.135410', '2017-11-16 08:35:55', '0');
INSERT INTO `tb_restaurant` VALUES ('14', '岳阳烧烤(科干店)', '30', '测试', '广东省珠海市金湾区岳阳烧烤', '(010)1234-1234', '19:00-23:00', '前方正在等待', '4', '岳阳烧烤', 'http://120.78.182.217/images/1513216871120.jpg', 'http://120.78.182.217/images/1513216982125.jpg,http://120.78.182.217/images/1513216907599.jpg,http://120.78.182.217/images/1513216998410.jpg', '113.347690', '22.135850', '2017-11-19 13:20:32', '1');
INSERT INTO `tb_restaurant` VALUES ('16', 'K立方量贩式KTV(科干店)', '30', '测试', '广东省珠海市金湾区南翔路111号', '(010)1234-1235', '8:00-20:00', '餐廳暫停取號', '4', 'K立方量贩式KTV', 'http://120.78.182.217/images/1513216860516.jpg', 'http://120.78.182.217/images/1513216982125.jpg,http://120.78.182.217/images/1513216951269.jpg,http://120.78.182.217/images/1513216899772.jpg', '113.343470', '22.129130', '2017-11-16 08:35:02', '0');

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `trueName` varchar(40) NOT NULL,
  `card` varchar(18) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `createDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_userName` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'chen', '156650ad747cfb25fcb9a7a2f8a02bdc', 'chen', '440883199606012315', '13420156312', '2017-11-15 20:30:12');
INSERT INTO `tb_user` VALUES ('2', 'wang', '156650ad747cfb25fcb9a7a2f8a02bdc', '王小锤', '440883199606011524', '13420156348', '2017-11-15 20:57:10');
INSERT INTO `tb_user` VALUES ('3', 'test1234', '53387f9299e3455b9b7510d4127d385b', '李四', '440883199606011235', '13420156347', '2017-12-06 12:01:18');
INSERT INTO `tb_user` VALUES ('4', 'test01', '156650ad747cfb25fcb9a7a2f8a02bdc', '测试', '440883199606011235', '13420156347', '2017-12-07 22:14:53');
INSERT INTO `tb_user` VALUES ('5', 'test02', '156650ad747cfb25fcb9a7a2f8a02bdc', '测试', '440883199606011235', '13420156347', '2017-12-07 22:15:45');
INSERT INTO `tb_user` VALUES ('6', 'test03', '156650ad747cfb25fcb9a7a2f8a02bdc', '测试', '440883199606011235', '13420156347', '2017-12-07 22:15:45');
INSERT INTO `tb_user` VALUES ('7', 'test04', '156650ad747cfb25fcb9a7a2f8a02bdc', '测试', '440883199606011235', '13420156348', '2017-12-07 22:15:45');
INSERT INTO `tb_user` VALUES ('8', 'test05', '156650ad747cfb25fcb9a7a2f8a02bdc', '测试', '440883199606011235', '13420156349', '2017-12-07 22:15:45');
INSERT INTO `tb_user` VALUES ('9', 'test06', '156650ad747cfb25fcb9a7a2f8a02bdc', '测试', '440883199606011235', '13420156347', '2017-12-07 22:53:08');
INSERT INTO `tb_user` VALUES ('10', 'test07', '156650ad747cfb25fcb9a7a2f8a02bdc', '测试', '440883199606011235', '13420156347', '2017-12-07 23:11:07');
INSERT INTO `tb_user` VALUES ('11', 'test08', '156650ad747cfb25fcb9a7a2f8a02bdc', '测试', '440883199606011235', '13420156347', '2017-12-07 23:11:07');
INSERT INTO `tb_user` VALUES ('12', 'test10', '156650ad747cfb25fcb9a7a2f8a02bdc', '测试', '440883199606011235', '13420156347', '2017-12-07 23:11:07');
INSERT INTO `tb_user` VALUES ('13', 'test11', '156650ad747cfb25fcb9a7a2f8a02bdc', '测试', '440883199606011235', '13420156347', '2017-12-07 23:11:07');
INSERT INTO `tb_user` VALUES ('17', 'test14', '156650ad747cfb25fcb9a7a2f8a02bdc', '测试', '440883199606011235', '13420156347', '2017-12-07 23:12:18');
INSERT INTO `tb_user` VALUES ('18', 'test15', '156650ad747cfb25fcb9a7a2f8a02bdc', '测试6', '440883199606011235', '13420156347', '2017-12-07 23:12:18');
INSERT INTO `tb_user` VALUES ('21', 'test16', '156650ad747cfb25fcb9a7a2f8a02bdc', '测试', '440883199606011235', '13420156347', '2017-12-08 08:41:25');
INSERT INTO `tb_user` VALUES ('22', 'test17', '156650ad747cfb25fcb9a7a2f8a02bdc', '测试', '440883199606011235', '13420156347', '2017-12-08 08:42:05');
INSERT INTO `tb_user` VALUES ('23', 'test18', '156650ad747cfb25fcb9a7a2f8a02bdc', '测试', '440883199606011235', '13420156347', '2017-12-08 08:42:05');
INSERT INTO `tb_user` VALUES ('25', 'test27', '156650ad747cfb25fcb9a7a2f8a02bdc', '测试', '440883199606011235', '13420156347', '2017-12-08 08:43:23');
INSERT INTO `tb_user` VALUES ('26', 'test28', '156650ad747cfb25fcb9a7a2f8a02bdc', '测试', '440883199606011235', '13420156347', '2017-12-08 08:43:23');
INSERT INTO `tb_user` VALUES ('28', 'test19', '156650ad747cfb25fcb9a7a2f8a02bdc', '测试', '440883199606011235', '13420156347', '2017-12-08 08:43:24');
INSERT INTO `tb_user` VALUES ('29', 'test26', '156650ad747cfb25fcb9a7a2f8a02bdc', '测试', '440883199606011235', '13420156347', '2017-12-08 08:43:24');
INSERT INTO `tb_user` VALUES ('30', 'test36', '156650ad747cfb25fcb9a7a2f8a02bdc', '测试', '440883199606011235', '13420156347', '2017-12-08 08:43:24');
INSERT INTO `tb_user` VALUES ('31', 'test112', '53387f9299e3455b9b7510d4127d385b', '小小鸟', '440883199606011235', '13420156346', '2017-12-08 10:09:39');
INSERT INTO `tb_user` VALUES ('32', 'test0104', '53387f9299e3455b9b7510d4127d385b', '测试1号', '440883199601231245', '13536401298', '2017-12-08 15:27:15');

-- ----------------------------
-- Table structure for `tb_wxuser`
-- ----------------------------
DROP TABLE IF EXISTS `tb_wxuser`;
CREATE TABLE `tb_wxuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `createDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_wxuser
-- ----------------------------
INSERT INTO `tb_wxuser` VALUES ('1', 'gh_1564612sd', '13420156345', '2017-10-12 12:45:41');
INSERT INTO `tb_wxuser` VALUES ('2', 'oyYPs0EGJw3rK0vVXXZ-dWgHxv-s', '60147891', '2017-11-27 17:11:49');
INSERT INTO `tb_wxuser` VALUES ('3', 'test123', '13536403516', '2017-12-07 20:32:32');
INSERT INTO `tb_wxuser` VALUES ('4', 'test1234', '13536403516', '2017-12-07 20:33:22');
INSERT INTO `tb_wxuser` VALUES ('5', 'test1235', '13536403516', '2017-12-07 20:33:22');
INSERT INTO `tb_wxuser` VALUES ('6', 'test1236', '13536403516', '2017-12-07 20:33:22');
INSERT INTO `tb_wxuser` VALUES ('7', 'test1237', '13536403516', '2017-12-07 20:33:22');
INSERT INTO `tb_wxuser` VALUES ('8', 'test1238', '13536403516', '2017-12-07 20:33:22');
INSERT INTO `tb_wxuser` VALUES ('9', 'test1239', '13536403516', '2017-12-07 20:33:23');
INSERT INTO `tb_wxuser` VALUES ('10', 'test12310', '13536403516', '2017-12-07 20:33:23');
INSERT INTO `tb_wxuser` VALUES ('11', 'test12311', '13536403516', '2017-12-07 20:33:23');
INSERT INTO `tb_wxuser` VALUES ('12', 'test12345', '13536403516', '2017-12-07 20:33:23');
INSERT INTO `tb_wxuser` VALUES ('14', 'test2234', '13536403516', '2017-12-07 20:35:01');
INSERT INTO `tb_wxuser` VALUES ('16', 'test2236', '13536403516', '2017-12-07 20:35:01');
INSERT INTO `tb_wxuser` VALUES ('17', 'test2237', '13536403516', '2017-12-07 20:35:01');
INSERT INTO `tb_wxuser` VALUES ('18', 'test2238', '13536403516', '2017-12-07 20:35:01');
INSERT INTO `tb_wxuser` VALUES ('19', 'test2239', '13536403516', '2017-12-07 20:35:01');
INSERT INTO `tb_wxuser` VALUES ('20', 'test22310', '13536403516', '2017-12-07 20:35:01');
INSERT INTO `tb_wxuser` VALUES ('21', 'test22311', '13536403516', '2017-12-07 20:35:02');
INSERT INTO `tb_wxuser` VALUES ('22', 'test22345', '13536403516', '2017-12-07 20:35:02');
INSERT INTO `tb_wxuser` VALUES ('25', 'test3235', '13536403516', '2017-12-07 20:35:49');
INSERT INTO `tb_wxuser` VALUES ('26', 'test3236', '13536403516', '2017-12-07 20:35:49');
INSERT INTO `tb_wxuser` VALUES ('30', 'test0012', '13536403518', '2017-12-08 14:44:48');
INSERT INTO `tb_wxuser` VALUES ('31', 'aa0104', '13536403519', '2017-12-08 14:48:06');
INSERT INTO `tb_wxuser` VALUES ('32', 'oXWki0bwAlqY-LOiGG5EEhmW4gw0', '66494498', '2017-12-12 08:56:37');
