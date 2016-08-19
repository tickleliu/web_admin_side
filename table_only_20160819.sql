/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2016-08-19 13:24:43
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

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

-- ----------------------------
-- Table structure for user_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `user_basic_info`;
CREATE TABLE `user_basic_info` (
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(45) DEFAULT NULL COMMENT '昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) DEFAULT NULL COMMENT '联系电话',
  `realname` varchar(45) DEFAULT NULL COMMENT '真实姓名',
  `idcard_number` varchar(45) DEFAULT NULL COMMENT '身份证号',
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `bloodtype` varchar(45) DEFAULT NULL COMMENT '血型',
  `nation` varchar(45) DEFAULT NULL COMMENT '民族',
  `heighth` bigint(20) DEFAULT NULL COMMENT '身高',
  `culture_degree` varchar(45) DEFAULT NULL COMMENT '文化程度',
  `political_landscape` varchar(45) DEFAULT NULL COMMENT '政治面貌',
  `into_the_party_time` date DEFAULT NULL COMMENT '入党团时间',
  `native` varchar(45) DEFAULT NULL COMMENT '籍贯',
  `birth` date DEFAULT NULL COMMENT '出生年月日',
  `school` varchar(255) DEFAULT NULL COMMENT '毕业学校',
  `graduation_time` date DEFAULT NULL COMMENT '毕业时间',
  `specialty` varchar(45) DEFAULT NULL COMMENT '专业',
  `first_record` varchar(45) DEFAULT NULL COMMENT '第一学历',
  `degree` varchar(45) DEFAULT NULL COMMENT '学位',
  `first_work_time` date DEFAULT NULL COMMENT '参加工作时间',
  `work_unit` varchar(255) DEFAULT NULL COMMENT '工作单位',
  `unit_category` varchar(45) DEFAULT NULL COMMENT '单位类型',
  `position_level` varchar(45) DEFAULT NULL COMMENT '职务',
  `zip_code` varchar(45) DEFAULT NULL COMMENT '邮编',
  `address` varchar(255) DEFAULT NULL COMMENT '工作地址',
  `resume` text COMMENT '个人简介'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人用户类基本信息';

-- ----------------------------
-- Table structure for user_engineer_academic_achievement
-- ----------------------------
DROP TABLE IF EXISTS `user_engineer_academic_achievement`;
CREATE TABLE `user_engineer_academic_achievement` (
  `academic_id` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `get_time` date NOT NULL COMMENT '获取时间',
  `name` varchar(255) NOT NULL COMMENT '成果名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学术成果表';

-- ----------------------------
-- Table structure for user_engineer_certificate
-- ----------------------------
DROP TABLE IF EXISTS `user_engineer_certificate`;
CREATE TABLE `user_engineer_certificate` (
  `cert_id` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `get_time` date DEFAULT NULL COMMENT '获取时间',
  `certificate_name` varchar(255) DEFAULT NULL COMMENT '证书名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人用户认证信息表';

-- ----------------------------
-- Table structure for user_engineer_important_work
-- ----------------------------
DROP TABLE IF EXISTS `user_engineer_important_work`;
CREATE TABLE `user_engineer_important_work` (
  `work_id` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `get_time` date DEFAULT NULL COMMENT '完成时间',
  `work_name` varchar(255) DEFAULT NULL COMMENT '论著名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='技术人员重要论著表';

-- ----------------------------
-- Table structure for user_engineer_info
-- ----------------------------
DROP TABLE IF EXISTS `user_engineer_info`;
CREATE TABLE `user_engineer_info` (
  `uid` bigint(11) NOT NULL,
  `profession_engaged` varchar(255) DEFAULT NULL COMMENT '现从事专业',
  `major_category` varchar(255) DEFAULT NULL COMMENT '专业大类',
  `detail_category` varchar(255) DEFAULT NULL COMMENT '专业细类',
  `engaged_time` date DEFAULT NULL COMMENT '从事专业时间',
  `profession_ability` varchar(255) DEFAULT NULL COMMENT '技术能力'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人用户，技术人员详细信息';

-- ----------------------------
-- Table structure for user_engineer_worklife
-- ----------------------------
DROP TABLE IF EXISTS `user_engineer_worklife`;
CREATE TABLE `user_engineer_worklife` (
  `work_life_id` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `start_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `company` varchar(255) DEFAULT NULL COMMENT '就职公司',
  `position` varchar(45) DEFAULT NULL COMMENT '职务',
  `intro` text COMMENT '经历简介'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='技术用户工作履历表';

-- ----------------------------
-- Table structure for user_experter_info
-- ----------------------------
DROP TABLE IF EXISTS `user_experter_info`;
CREATE TABLE `user_experter_info` (
  `uid` bigint(20) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL COMMENT '专家类别',
  `year_of_employment` date DEFAULT NULL COMMENT '聘任年份',
  `technical_grade` varchar(45) DEFAULT NULL COMMENT '技术等级',
  `title` varchar(45) DEFAULT NULL COMMENT '职称',
  `profession_engaged` varchar(45) DEFAULT NULL COMMENT '从事专业',
  `profession_engaged_time` date DEFAULT NULL COMMENT '从事专业年份',
  `current_position` varchar(45) DEFAULT NULL COMMENT '当前职务',
  `current_position_time` date DEFAULT NULL COMMENT '任现职级时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人用户，专家详细信息';

-- ----------------------------
-- Table structure for user_experter_proj_info
-- ----------------------------
DROP TABLE IF EXISTS `user_experter_proj_info`;
CREATE TABLE `user_experter_proj_info` (
  `project_id` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `proj_start_time` date DEFAULT NULL COMMENT '项目开始时间',
  `proj_end_time` date DEFAULT NULL COMMENT '项目结束时间',
  `intro` text COMMENT '项目简介',
  `contribution` text COMMENT '主要贡献',
  `title` varchar(255) DEFAULT NULL COMMENT '项目标题'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_login_info
-- ----------------------------
DROP TABLE IF EXISTS `user_login_info`;
CREATE TABLE `user_login_info` (
  `uid` bigint(20) unsigned DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `update_time` date DEFAULT NULL,
  `uwechatid` varchar(45) DEFAULT NULL,
  `head_image` varchar(255) DEFAULT NULL,
  `status` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_rewards
-- ----------------------------
DROP TABLE IF EXISTS `user_rewards`;
CREATE TABLE `user_rewards` (
  `reward_id` bigint(20) DEFAULT NULL,
  `uid` bigint(20) NOT NULL,
  `reward_time` date DEFAULT NULL COMMENT '获奖时间',
  `reward_content` text NOT NULL COMMENT '获奖内容',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户奖励情况表';

-- ----------------------------
-- Table structure for user_role_info
-- ----------------------------
DROP TABLE IF EXISTS `user_role_info`;
CREATE TABLE `user_role_info` (
  `uid` bigint(20) unsigned DEFAULT NULL,
  `isorg` int(10) unsigned DEFAULT NULL,
  `isadmin` int(10) unsigned DEFAULT NULL,
  `isexperter` int(10) unsigned DEFAULT NULL,
  `ismanager` int(10) unsigned DEFAULT NULL,
  `isengineer` int(10) unsigned DEFAULT NULL,
  `isent` int(10) unsigned DEFAULT NULL,
  `isleg` int(10) unsigned DEFAULT NULL,
  `isgov` int(10) unsigned DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `update_time` date DEFAULT NULL,
  `issuperadmin` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
