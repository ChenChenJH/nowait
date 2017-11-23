/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50556
Source Host           : localhost:3306
Source Database       : db_nowait

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2017-11-23 14:57:07
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_chainshop
-- ----------------------------
INSERT INTO `tb_chainshop` VALUES ('1', '猪仔城', null);
INSERT INTO `tb_chainshop` VALUES ('2', '爱美食', null);
INSERT INTO `tb_chainshop` VALUES ('3', '一家人', null);

-- ----------------------------
-- Table structure for `tb_desk`
-- ----------------------------
DROP TABLE IF EXISTS `tb_desk`;
CREATE TABLE `tb_desk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `style` varchar(40) NOT NULL,
  `info` varchar(40) DEFAULT NULL,
  `restId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_desk
-- ----------------------------
INSERT INTO `tb_desk` VALUES ('1', '大桌', '5-8人', '1');
INSERT INTO `tb_desk` VALUES ('2', '中桌', '3-4人', '1');
INSERT INTO `tb_desk` VALUES ('3', '小桌', '1-2人', '1');

-- ----------------------------
-- Table structure for `tb_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `tb_feedback`;
CREATE TABLE `tb_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wxuserId` int(11) NOT NULL,
  `info` varchar(200) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  `isRead` char(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_feedback
-- ----------------------------
INSERT INTO `tb_feedback` VALUES ('1', '1', '还行，下次再来', '2017-11-14 12:14:15', '已讀');
INSERT INTO `tb_feedback` VALUES ('2', '1', '测试', '2017-11-21 12:45:15', '已讀');
INSERT INTO `tb_feedback` VALUES ('3', '1', '又来测试了', '2017-11-21 14:50:12', '已讀');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('1', '1', '1', '猪仔城（红旗店）', '大桌', '5-8人', 'A17', '2017-11-18 12:10:14', '是', '过号不作废');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_restaurant
-- ----------------------------
INSERT INTO `tb_restaurant` VALUES ('1', '猪仔城（香洲店）', '12元/人', '过号不作废', '广东省珠海市红旗镇世纪名城1楼12号', '0751-6649449', '8:00-21:00', '暂时取号', '1', '猪仔城', null, null, '113.360493', '22.132428', '2017-10-07 10:24:16', '否');
INSERT INTO `tb_restaurant` VALUES ('2', '猪仔城（红旗店）', '25', '测试', '广东省珠海市香洲区凤凰南路1009号', '(010)1234-1234', '8:00-20:00', '前方正在等待', '1', '猪仔城', '', '', '113.577930', '22.271500', '2017-11-16 08:34:17', '是');
INSERT INTO `tb_restaurant` VALUES ('3', 'K立方量贩式KTV(红旗店)', '30', '测试', '广东省珠海市金湾区南翔路111号', '(010)1234-1235', '8:00-20:00', '前方正在等待', '1', '爱美食', '', '', '113.343470', '22.129130', '2017-11-16 08:35:02', '是');
INSERT INTO `tb_restaurant` VALUES ('4', '不夜天柴火烤鱼火锅店', '35', '测试', '广东省珠海市金湾区红旗虹晖一路中珠花园旁', '(010)1234-1236', '8:00-20:00', '當前排隊狀況', '1', '一家人', '', '', '113.347690', '22.135850', '2017-11-16 08:35:10', '是');
INSERT INTO `tb_restaurant` VALUES ('5', '阿甘甜品(红旗店)', '20', '测试', '广东省珠海市金湾区世纪名城商业街156号(世纪名城08Bar斜对面)', '(010)1234-1237', '8:00-20:00', '當前排隊狀況', '1', '一家人', '', '', '113.348200', '22.134010', '2017-11-16 08:35:21', '是');
INSERT INTO `tb_restaurant` VALUES ('6', '和亭日本料理(红旗店)', '50', '测试', '广东省珠海市金湾区虹晖一路232', '(010)1234-1238', '8:00-20:00', '餐厅暂停取号', '1', null, '', '', '113.341310', '22.133200', '2017-11-16 08:35:32', '否');
INSERT INTO `tb_restaurant` VALUES ('7', '圣鼎记自助美食汇(红旗店)', '40', '测试', '广东省珠海市金湾区益百家1楼', '(010)1234-1239', '8:00-20:00', '餐厅暂停取号', '1', '', '', '', '113.343180', '22.135410', '2017-11-16 08:35:55', '否');
INSERT INTO `tb_restaurant` VALUES ('8', '岳阳烧烤', '30', '测试', '广东省珠海市金湾区岳阳烧烤', '(010)1234-1234', '19:00-23:00', '餐厅暂停取号', '1', '爱美食', '', '', '113.347690', '22.135850', '2017-11-19 13:20:32', '否');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'chen', '156650ad747cfb25fcb9a7a2f8a02bdc', 'chen', '440883199606012315', '13420156312', '2017-11-15 20:30:12');
INSERT INTO `tb_user` VALUES ('2', 'wang', '156650ad747cfb25fcb9a7a2f8a02bdc', '王小锤', '440883199606011524', '13420156348', '2017-11-15 20:57:10');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_wxuser
-- ----------------------------
INSERT INTO `tb_wxuser` VALUES ('1', 'gh_1564612sd', '13420156345', '2017-10-12 12:45:41');
INSERT INTO `tb_wxuser` VALUES ('2', 'oyYPs0EGJw3rK0vVXXZ-dWgHxv-s', '60147891', '2017-11-19 11:10:56');
INSERT INTO `tb_wxuser` VALUES ('4', 'hello010412sdf', '13536401235', '2017-11-21 11:11:33');
INSERT INTO `tb_wxuser` VALUES ('5', 'sdfds', '13536401232', '2017-11-23 09:53:30');
