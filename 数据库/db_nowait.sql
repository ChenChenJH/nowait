/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : db_nowait

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2017-11-27 17:29:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `id` int(11) NOT NULL auto_increment,
  `adminName` varchar(20) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uk_adminName` (`adminName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', 'admin', '156650ad747cfb25fcb9a7a2f8a02bdc');
INSERT INTO `tb_admin` VALUES ('2', 'boss', '156650ad747cfb25fcb9a7a2f8a02bdc');

-- ----------------------------
-- Table structure for tb_chainshop
-- ----------------------------
DROP TABLE IF EXISTS `tb_chainshop`;
CREATE TABLE `tb_chainshop` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `pic` varchar(200) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uk_chainshop_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_chainshop
-- ----------------------------
INSERT INTO `tb_chainshop` VALUES ('1', 'K立方量贩式KTV', '测试');
INSERT INTO `tb_chainshop` VALUES ('2', '岳阳烧烤', '测试');
INSERT INTO `tb_chainshop` VALUES ('3', '不夜天柴火烤鱼火锅店', '测试');
INSERT INTO `tb_chainshop` VALUES ('4', '阿甘甜品', '测试');
INSERT INTO `tb_chainshop` VALUES ('5', '和亭日本料理', '测试');
INSERT INTO `tb_chainshop` VALUES ('6', '圣鼎记自助美食汇', '测试');
INSERT INTO `tb_chainshop` VALUES ('7', '甜之心', '测试');

-- ----------------------------
-- Table structure for tb_desk
-- ----------------------------
DROP TABLE IF EXISTS `tb_desk`;
CREATE TABLE `tb_desk` (
  `id` int(11) NOT NULL auto_increment,
  `style` varchar(40) NOT NULL,
  `info` varchar(40) default NULL,
  `restId` int(11) default NULL,
  PRIMARY KEY  (`id`)
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
-- Table structure for tb_feedback
-- ----------------------------
DROP TABLE IF EXISTS `tb_feedback`;
CREATE TABLE `tb_feedback` (
  `id` int(11) NOT NULL auto_increment,
  `wxuserId` int(11) NOT NULL,
  `info` varchar(200) default NULL,
  `createDate` datetime NOT NULL,
  `isRead` char(2) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_feedback
-- ----------------------------
INSERT INTO `tb_feedback` VALUES ('1', '1', '还行，下次再来', '2017-11-14 12:14:15', '是');
INSERT INTO `tb_feedback` VALUES ('2', '2', 'haha', '2017-11-21 10:37:18', '否');
INSERT INTO `tb_feedback` VALUES ('3', '2', '哈哈', '2017-11-22 13:31:53', '否');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` int(11) NOT NULL auto_increment,
  `wxuserId` int(11) NOT NULL,
  `restId` int(11) NOT NULL,
  `restName` varchar(50) NOT NULL,
  `style` varchar(40) default NULL,
  `info` varchar(40) default NULL,
  `waitNo` varchar(40) default NULL,
  `createDate` datetime NOT NULL,
  `isUsage` char(2) NOT NULL,
  `warnInfo` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('1', '1', '1', 'K立方量贩式KTV(红旗店)', '大桌', '9-12人', 'A01', '2017-11-18 12:10:14', '是', '过号不作废');
INSERT INTO `tb_order` VALUES ('2', '1', '1', 'K立方量贩式KTV(红旗店)', '大桌', '9-12人', 'A02', '2017-11-22 09:57:11', '是', '过号不作废');
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

-- ----------------------------
-- Table structure for tb_restaurant
-- ----------------------------
DROP TABLE IF EXISTS `tb_restaurant`;
CREATE TABLE `tb_restaurant` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `priceInfo` varchar(50) default NULL,
  `warnInfo` varchar(100) default NULL,
  `address` varchar(140) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `shopTime` varchar(50) NOT NULL,
  `status` varchar(20) default NULL,
  `userId` int(11) NOT NULL,
  `chainName` varchar(50) default NULL,
  `coverPic` varchar(200) default NULL,
  `navPic` varchar(200) default NULL,
  `lng` decimal(10,6) default NULL,
  `lat` decimal(10,6) default NULL,
  `createDate` datetime NOT NULL,
  `isOverdue` char(2) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_restaurant
-- ----------------------------
INSERT INTO `tb_restaurant` VALUES ('1', 'K立方量贩式KTV(红旗店)', '30', '测试', '广东省珠海市金湾区南翔路111号', '(010)1234-1235', '8:00-20:00', '前方正在等待', '1', 'K立方量贩式KTV', '测试', '测试', '113.343470', '22.129130', '2017-11-16 08:35:02', '0');
INSERT INTO `tb_restaurant` VALUES ('2', '岳阳烧烤(XX店)', '30', '测试', '广东省珠海市金湾区岳阳烧烤', '(010)1234-1234', '19:00-23:00', '餐廳暫停取號', '1', '岳阳烧烤', '测试', '测试', '113.347690', '22.135850', '2017-11-19 13:20:32', '0');
INSERT INTO `tb_restaurant` VALUES ('3', '不夜天柴火烤鱼火锅店(红旗店)', '35', '测试', '广东省珠海市金湾区红旗虹晖一路中珠花园旁', '(010)1234-1236', '8:00-20:00', '當前排隊狀況', '1', '不夜天柴火烤鱼火锅店', '测试', '测试', '113.347690', '22.135850', '2017-11-16 08:35:10', '0');
INSERT INTO `tb_restaurant` VALUES ('4', '阿甘甜品(红旗店)', '20', '测试', '广东省珠海市金湾区世纪名城商业街156号(世纪名城08Bar斜对面)', '(010)1234-1237', '8:00-20:00', '當前排隊狀況', '1', '阿甘甜品', '测试', '测试', '113.348200', '22.134010', '2017-11-16 08:35:21', '1');
INSERT INTO `tb_restaurant` VALUES ('5', '和亭日本料理(红旗店)', '50', '测试', '广东省珠海市金湾区虹晖一路232', '(010)1234-1238', '8:00-20:00', '餐廳暫停取號', '1', '和亭日本料理', '测试', '测试', '113.341310', '22.133200', '2017-11-16 08:35:32', '1');
INSERT INTO `tb_restaurant` VALUES ('6', '圣鼎记自助美食汇(红旗店)', '40', '测试', '广东省珠海市金湾区益百家1楼', '(010)1234-1239', '8:00-20:00', '餐廳暫停取號', '1', '圣鼎记自助美食汇', '测试', '测试', '113.343180', '22.135410', '2017-11-16 08:35:55', '0');
INSERT INTO `tb_restaurant` VALUES ('7', '岳阳烧烤(红旗店)', '30', '测试', '广东省珠海市金湾区岳阳烧烤', '(010)1234-1234', '19:00-23:00', '餐廳暫停取號', '1', '岳阳烧烤', '测试', '测试', '113.347690', '22.135850', '2017-11-19 13:20:32', '1');
INSERT INTO `tb_restaurant` VALUES ('8', '甜之心(湾仔沙店)', '25', '测试', '广东省珠海市香洲区凤凰南路1009号', '(010)1234-1234', '8:00-20:00', '前方正在等待', '1', '甜之心', '测试', '测试', '113.577930', '22.271500', '2017-11-16 08:34:17', '0');
INSERT INTO `tb_restaurant` VALUES ('9', '岳阳烧烤(科干店)', '30', '测试', '广东省珠海市金湾区岳阳烧烤', '(010)1234-1234', '19:00-23:00', '餐廳暫停取號', '1', '岳阳烧烤', '测试', '测试', '113.347690', '22.135850', '2017-11-19 13:20:32', '0');
INSERT INTO `tb_restaurant` VALUES ('10', '不夜天柴火烤鱼火锅店(科干店)', '35', '测试', '广东省珠海市金湾区红旗虹晖一路中珠花园旁', '(010)1234-1236', '8:00-20:00', '當前排隊狀況', '1', '不夜天柴火烤鱼火锅店', '测试', '测试', '113.347690', '22.135850', '2017-11-16 08:35:10', '0');
INSERT INTO `tb_restaurant` VALUES ('11', '阿甘甜品(科干店)', '20', '测试', '广东省珠海市金湾区世纪名城商业街156号(世纪名城08Bar斜对面)', '(010)1234-1237', '8:00-20:00', '前方正在等待', '1', '阿甘甜品', '测试', '测试', '113.348200', '22.134010', '2017-11-16 08:35:21', '1');
INSERT INTO `tb_restaurant` VALUES ('12', '和亭日本料理(科干店)', '50', '测试', '广东省珠海市金湾区虹晖一路232', '(010)1234-1238', '8:00-20:00', '餐廳暫停取號', '1', '和亭日本料理', '测试', '测试', '113.341310', '22.133200', '2017-11-16 08:35:32', '1');
INSERT INTO `tb_restaurant` VALUES ('13', '圣鼎记自助美食汇(科干店)', '40', '测试', '广东省珠海市金湾区益百家1楼', '(010)1234-1239', '8:00-20:00', '前方正在等待', '1', '圣鼎记自助美食汇', '测试', '测试', '113.343180', '22.135410', '2017-11-16 08:35:55', '0');
INSERT INTO `tb_restaurant` VALUES ('14', '岳阳烧烤(科干店)', '30', '测试', '广东省珠海市金湾区岳阳烧烤', '(010)1234-1234', '19:00-23:00', '前方正在等待', '1', '岳阳烧烤', '测试', '测试', '113.347690', '22.135850', '2017-11-19 13:20:32', '1');
INSERT INTO `tb_restaurant` VALUES ('16', 'K立方量贩式KTV(科干店)', '30', '测试', '广东省珠海市金湾区南翔路111号', '(010)1234-1235', '8:00-20:00', '餐廳暫停取號', '1', 'K立方量贩式KTV', '测试', '测试', '113.343470', '22.129130', '2017-11-16 08:35:02', '0');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL auto_increment,
  `userName` varchar(20) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `trueName` varchar(40) NOT NULL,
  `card` varchar(18) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `createDate` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uk_userName` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'chen', '156650ad747cfb25fcb9a7a2f8a02bdc', 'chen', '440883199606012315', '13420156312', '2017-11-15 20:30:12');
INSERT INTO `tb_user` VALUES ('2', 'wang', '156650ad747cfb25fcb9a7a2f8a02bdc', '王小锤', '440883199606011524', '13420156348', '2017-11-15 20:57:10');

-- ----------------------------
-- Table structure for tb_wxuser
-- ----------------------------
DROP TABLE IF EXISTS `tb_wxuser`;
CREATE TABLE `tb_wxuser` (
  `id` int(11) NOT NULL auto_increment,
  `openid` varchar(50) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `createDate` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_wxuser
-- ----------------------------
INSERT INTO `tb_wxuser` VALUES ('1', 'gh_1564612sd', '13420156345', '2017-10-12 12:45:41');
INSERT INTO `tb_wxuser` VALUES ('8', 'oyYPs0EGJw3rK0vVXXZ-dWgHxv-s', '60147891', '2017-11-27 17:11:49');
