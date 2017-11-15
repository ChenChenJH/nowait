/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : db_nowait

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2017-11-15 22:35:37
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_chainshop
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_desk`
-- ----------------------------
DROP TABLE IF EXISTS `tb_desk`;
CREATE TABLE `tb_desk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `style` varchar(40) NOT NULL,
  `info` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_desk
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_deskuser`
-- ----------------------------
DROP TABLE IF EXISTS `tb_deskuser`;
CREATE TABLE `tb_deskuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restId` int(11) NOT NULL,
  `deskId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_deskuser
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_feedback
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------

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
  `lng` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `createDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_restaurant
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_wxuser
-- ----------------------------
