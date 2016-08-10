/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2016-08-10 12:39:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for ac_content
-- ----------------------------
DROP TABLE IF EXISTS `ac_content`;
CREATE TABLE `ac_content` (
  `aid` bigint(20) unsigned DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `update_time` date DEFAULT NULL,
  `cate` varchar(45) NOT NULL,
  `author` varchar(45) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `irecom` tinyint(1) NOT NULL DEFAULT '0',
  `igraph` tinyint(1) NOT NULL DEFAULT '0',
  `gpath` varchar(255) DEFAULT NULL,
  KEY `cate_index` (`cate`) USING HASH,
  KEY `time_index` (`create_time`) USING BTREE,
  KEY `author_index` (`author`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ec_group
-- ----------------------------
DROP TABLE IF EXISTS `ec_group`;
CREATE TABLE `ec_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '10',
  `allowPerDay` int(11) NOT NULL DEFAULT '4096',
  `allowMaxFile` int(11) NOT NULL DEFAULT '1024',
  `allowSuffix` varchar(255) DEFAULT 'jpg,jpeg,gif,png,bmp',
  `needCaptcha` tinyint(1) NOT NULL DEFAULT '1',
  `needCheck` tinyint(1) NOT NULL DEFAULT '1',
  `regDef` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ec_log
-- ----------------------------
DROP TABLE IF EXISTS `ec_log`;
CREATE TABLE `ec_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL DEFAULT '3',
  `time` datetime DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ec_message
-- ----------------------------
DROP TABLE IF EXISTS `ec_message`;
CREATE TABLE `ec_message` (
  `msgId` int(11) NOT NULL AUTO_INCREMENT,
  `msgTitle` varchar(100) DEFAULT NULL,
  `msgContent` varchar(255) DEFAULT NULL,
  `sendTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `msgStaus` tinyint(1) NOT NULL DEFAULT '0',
  `msgBox` int(2) NOT NULL DEFAULT '1',
  `siteId` int(11) NOT NULL DEFAULT '1',
  `msgSendUserId` int(11) NOT NULL DEFAULT '1',
  `msgReceiverUserId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`msgId`),
  KEY `msgSendUserId` (`msgSendUserId`),
  KEY `msgReceiverUserId` (`msgReceiverUserId`),
  CONSTRAINT `ec_message_ibfk_1` FOREIGN KEY (`msgSendUserId`) REFERENCES `ec_user` (`id`),
  CONSTRAINT `ec_message_ibfk_2` FOREIGN KEY (`msgReceiverUserId`) REFERENCES `ec_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ec_message_receiver
-- ----------------------------
DROP TABLE IF EXISTS `ec_message_receiver`;
CREATE TABLE `ec_message_receiver` (
  `receiverId` int(11) NOT NULL AUTO_INCREMENT,
  `msgTitle` varchar(100) DEFAULT NULL,
  `msgContent` varchar(255) DEFAULT NULL,
  `sendTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `msgStaus` tinyint(1) NOT NULL DEFAULT '0',
  `msgBox` int(2) NOT NULL DEFAULT '1',
  `msgId` int(11) DEFAULT NULL,
  `siteId` int(11) NOT NULL DEFAULT '1',
  `msgSendUserId` int(11) NOT NULL DEFAULT '1',
  `msgReceiverUserId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`receiverId`),
  KEY `msgSendUserId` (`msgSendUserId`),
  KEY `msgReceiverUserId` (`msgReceiverUserId`),
  CONSTRAINT `ec_message_receiver_ibfk_1` FOREIGN KEY (`msgSendUserId`) REFERENCES `ec_user` (`id`),
  CONSTRAINT `ec_message_receiver_ibfk_2` FOREIGN KEY (`msgReceiverUserId`) REFERENCES `ec_user` (`id`),
  CONSTRAINT `ec_message_receiver_ibfk_3` FOREIGN KEY (`receiverId`) REFERENCES `ec_message` (`msgId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ec_role
-- ----------------------------
DROP TABLE IF EXISTS `ec_role`;
CREATE TABLE `ec_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `m_super` tinyint(1) NOT NULL DEFAULT '0',
  `siteId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ec_user
-- ----------------------------
DROP TABLE IF EXISTS `ec_user`;
CREATE TABLE `ec_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `registerTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `registerIP` varchar(50) DEFAULT '127.0.0.1',
  `lastLoginTime` datetime DEFAULT NULL,
  `lastLoginIp` varchar(50) DEFAULT '127.0.0.1',
  `loginCount` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `uploadSize` int(11) NOT NULL DEFAULT '0',
  `uploadDate` datetime DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `viewonlyAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `selfAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `ec_user_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `ec_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ec_user_ext
-- ----------------------------
DROP TABLE IF EXISTS `ec_user_ext`;
CREATE TABLE `ec_user_ext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `realname` varchar(100) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `comefrom` varchar(150) DEFAULT NULL,
  `qq` varchar(100) DEFAULT NULL,
  `msn` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `userImg` varchar(255) DEFAULT NULL,
  `userSignature` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `ec_user_ext_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `ec_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for org_attachment
-- ----------------------------
DROP TABLE IF EXISTS `org_attachment`;
CREATE TABLE `org_attachment` (
  `attach_id` bigint(20) NOT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL COMMENT '附件路径',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`attach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织用户附件表';

-- ----------------------------
-- Table structure for org_basic_cert
-- ----------------------------
DROP TABLE IF EXISTS `org_basic_cert`;
CREATE TABLE `org_basic_cert` (
  `cert_id` bigint(20) unsigned NOT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL,
  `get_time` date DEFAULT NULL,
  `valid_time` date DEFAULT NULL,
  PRIMARY KEY (`cert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for org_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `org_basic_info`;
CREATE TABLE `org_basic_info` (
  `uid` bigint(20) NOT NULL,
  `enterprise_name` varchar(255) DEFAULT NULL COMMENT '企业名称',
  `license_number` varchar(255) DEFAULT NULL COMMENT '工商营业执照号',
  `registered_capital` bigint(20) DEFAULT NULL COMMENT '注册资金',
  `legal_representative` varchar(45) DEFAULT NULL COMMENT '法人代表',
  `region` varchar(255) DEFAULT NULL COMMENT '所在地区',
  `address` varchar(255) DEFAULT NULL COMMENT '通信地址',
  `zip_code` varchar(45) DEFAULT NULL COMMENT '邮编',
  `enterprise_type` varchar(45) DEFAULT NULL COMMENT '企业类型',
  `enterprise_nature` varchar(45) DEFAULT NULL COMMENT '企业性质',
  `industry_fields` varchar(255) DEFAULT NULL COMMENT '所属行业领域',
  `web_site` varchar(255) DEFAULT NULL COMMENT '企业网址',
  `contact_name` varchar(45) DEFAULT NULL COMMENT '联系人姓名',
  `contact_position` varchar(45) DEFAULT NULL COMMENT '联系人职务',
  `phone` varchar(45) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(45) DEFAULT NULL COMMENT '电子邮箱',
  `main_business` varchar(255) DEFAULT NULL COMMENT '主营业务',
  `resume` text COMMENT '简历'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构类用户基本信息';

-- ----------------------------
-- Table structure for org_ent_info
-- ----------------------------
DROP TABLE IF EXISTS `org_ent_info`;
CREATE TABLE `org_ent_info` (
  `uid` bigint(20) DEFAULT NULL,
  `employees` bigint(20) DEFAULT NULL COMMENT '雇员数',
  `sales` bigint(20) DEFAULT NULL COMMENT '销售额',
  `profits` bigint(20) DEFAULT NULL COMMENT '盈利额',
  `qualification` varchar(255) DEFAULT NULL COMMENT '资质'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构类用户，企业机构信息';

-- ----------------------------
-- Table structure for org_gov_info
-- ----------------------------
DROP TABLE IF EXISTS `org_gov_info`;
CREATE TABLE `org_gov_info` (
  `uid` bigint(20) DEFAULT NULL,
  `gdp` bigint(20) DEFAULT NULL COMMENT '上年度gdp',
  `gdp_growth` bigint(20) DEFAULT NULL COMMENT 'gdp增幅',
  `military_gdp` bigint(20) DEFAULT NULL COMMENT '军工gdp占比'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构类，政府机构信息';

-- ----------------------------
-- Table structure for org_leg_awrards
-- ----------------------------
DROP TABLE IF EXISTS `org_leg_awrards`;
CREATE TABLE `org_leg_awrards` (
  `award_id` bigint(20) NOT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `get_time` date DEFAULT NULL COMMENT '获奖时间',
  `title` varchar(255) DEFAULT NULL COMMENT '获奖名称',
  PRIMARY KEY (`award_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='联盟成员获奖';

-- ----------------------------
-- Table structure for org_leg_branches
-- ----------------------------
DROP TABLE IF EXISTS `org_leg_branches`;
CREATE TABLE `org_leg_branches` (
  `branch_id` bigint(20) NOT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '分支机构名称',
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='联盟成员分支机构';

-- ----------------------------
-- Table structure for org_leg_info
-- ----------------------------
DROP TABLE IF EXISTS `org_leg_info`;
CREATE TABLE `org_leg_info` (
  `uid` bigint(20) DEFAULT NULL,
  `competent_authority` varchar(255) DEFAULT NULL COMMENT '主管机关',
  `technical_person_number` bigint(20) DEFAULT NULL COMMENT '技术人员数',
  `per_capital_output` bigint(20) DEFAULT NULL COMMENT '人均产值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构类，评估联盟成员信息';

-- ----------------------------
-- Table structure for org_leg_proj
-- ----------------------------
DROP TABLE IF EXISTS `org_leg_proj`;
CREATE TABLE `org_leg_proj` (
  `project_id` bigint(20) NOT NULL,
  `uid` bigint(20) NOT NULL,
  `start_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `intro` text COMMENT '介绍',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='联盟成员重要工程';

-- ----------------------------
-- Table structure for org_supply_demand
-- ----------------------------
DROP TABLE IF EXISTS `org_supply_demand`;
CREATE TABLE `org_supply_demand` (
  `sd_id` bigint(20) NOT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `isS_D` varchar(45) DEFAULT NULL COMMENT '供应还是需求',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `intro` text COMMENT '供需介绍',
  PRIMARY KEY (`sd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业供需表';
