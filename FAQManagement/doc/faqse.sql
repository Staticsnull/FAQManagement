/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : example

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2018-03-11 15:41:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `classes`
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES ('1', 'PHP');
INSERT INTO `classes` VALUES ('2', 'Java');
INSERT INTO `classes` VALUES ('3', 'C语言');

-- ----------------------------
-- Table structure for `edoc_category`
-- ----------------------------
DROP TABLE IF EXISTS `edoc_category`;
CREATE TABLE `edoc_category` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of edoc_category
-- ----------------------------

-- ----------------------------
-- Table structure for `edoc_entry`
-- ----------------------------
DROP TABLE IF EXISTS `edoc_entry`;
CREATE TABLE `edoc_entry` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `categoryId` int(4) NOT NULL,
  `title` varchar(50) NOT NULL,
  `smmary` varchar(200) DEFAULT NULL,
  `uploadUser` varchar(20) DEFAULT NULL,
  `createDate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of edoc_entry
-- ----------------------------
INSERT INTO `edoc_entry` VALUES ('1', '1', 'oracle学习', 'oracle精品', '李小明', '2018-03-09');
INSERT INTO `edoc_entry` VALUES ('2', '2', 'java手册', 'java优化代码', '李小明', '2018-03-08');
INSERT INTO `edoc_entry` VALUES ('3', '2', '关于php', 'php学习规范', '李小明', '2018-03-05');

-- ----------------------------
-- Table structure for `faqs`
-- ----------------------------
DROP TABLE IF EXISTS `faqs`;
CREATE TABLE `faqs` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `classid` int(4) NOT NULL,
  `title` varchar(20) NOT NULL,
  `content` varchar(200) NOT NULL,
  `createdate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of faqs
-- ----------------------------
INSERT INTO `faqs` VALUES ('1', '1', 'PHP简介', '此处省略200字', '2018-03-10');
INSERT INTO `faqs` VALUES ('2', '2', 'Java环境变量配置', '此处省略300字', '2018-03-11');
INSERT INTO `faqs` VALUES ('3', '2', 'Java循环', '此处省略200字', '2018-03-10');
INSERT INTO `faqs` VALUES ('4', '3', 'C语言指针', '此处省略200字', '2018-03-09');
INSERT INTO `faqs` VALUES ('5', '3', 'C语言内存', '此处省略200字', '2018-03-11');
INSERT INTO `faqs` VALUES ('6', '1', 'PHP函数', '此处省略200字', '2018-03-11');
INSERT INTO `faqs` VALUES ('7', '2', 'for循环', '此处省略300字', '2018-03-11');
INSERT INTO `faqs` VALUES ('8', '1', '循环', '此处省略200字', '2018-03-11');
