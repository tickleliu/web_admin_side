-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.13-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema cms
--

CREATE DATABASE IF NOT EXISTS cms;
USE cms;

--
-- Definition of table `ac_content`
--

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

--
-- Dumping data for table `ac_content`
--

/*!40000 ALTER TABLE `ac_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `ac_content` ENABLE KEYS */;


--
-- Definition of table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`id`,`username`,`password`) VALUES 
 (1,'moocss',NULL),
 (2,'fuxin',NULL),
 (3,'??',NULL),
 (4,'fuxin123',NULL),
 (5,'raonbow',NULL),
 (6,'moocss','123456'),
 (7,'??','xinyi116518'),
 (8,'',''),
 (9,'moocss','123456'),
 (10,'moocss','123456'),
 (11,'moocss','123456');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;


--
-- Definition of table `ec_group`
--

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

--
-- Dumping data for table `ec_group`
--

/*!40000 ALTER TABLE `ec_group` DISABLE KEYS */;
INSERT INTO `ec_group` (`id`,`name`,`priority`,`allowPerDay`,`allowMaxFile`,`allowSuffix`,`needCaptcha`,`needCheck`,`regDef`) VALUES 
 (1,'设计组',1,2,1000,'.jpg/.jpeg/.png/.bmp',1,1,1),
 (2,'产品组',7,2048,2000,'.jpg/.jpeg/.png/.bmp',1,1,1),
 (3,'销售组',8,2048,5000,'.jpg/.jpeg/.png/.bmp',1,1,0),
 (9,'投稿者',10,1024,1024,'.jpg/.jpeg/.png/.bmp',1,1,1);
/*!40000 ALTER TABLE `ec_group` ENABLE KEYS */;


--
-- Definition of table `ec_log`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ec_log`
--

/*!40000 ALTER TABLE `ec_log` DISABLE KEYS */;
INSERT INTO `ec_log` (`id`,`category`,`time`,`ip`,`url`,`title`,`content`,`username`) VALUES 
 (1,3,'2013-08-18 21:34:51','192.168.0.1',NULL,NULL,NULL,'amdin'),
 (2,3,'2013-08-18 21:39:47','192.168.0.1',NULL,NULL,NULL,'fuxin'),
 (3,2,'2013-08-19 21:43:04',NULL,NULL,NULL,NULL,'fuxin'),
 (4,1,'2013-08-19 21:43:15',NULL,NULL,NULL,NULL,'moocss'),
 (5,3,'2013-08-20 23:54:04','127.0.0.1',NULL,'添加用户组操作','添加的 : id=null;name=投稿者','fuxin'),
 (6,1,'2016-08-13 10:27:55','127.0.0.1',NULL,'登录成功！',NULL,'fuxin'),
 (7,1,'2016-08-13 10:29:18','127.0.0.1',NULL,'登录成功！',NULL,'fuxin'),
 (8,1,'2016-08-13 16:27:16','127.0.0.1',NULL,'登录成功！',NULL,'fuxin'),
 (9,1,'2016-08-13 16:27:39','127.0.0.1',NULL,'登录成功！',NULL,'fuxin');
/*!40000 ALTER TABLE `ec_log` ENABLE KEYS */;


--
-- Definition of table `ec_message`
--

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

--
-- Dumping data for table `ec_message`
--

/*!40000 ALTER TABLE `ec_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_message` ENABLE KEYS */;


--
-- Definition of table `ec_message_receiver`
--

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

--
-- Dumping data for table `ec_message_receiver`
--

/*!40000 ALTER TABLE `ec_message_receiver` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_message_receiver` ENABLE KEYS */;


--
-- Definition of table `ec_role`
--

DROP TABLE IF EXISTS `ec_role`;
CREATE TABLE `ec_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `m_super` tinyint(1) NOT NULL DEFAULT '0',
  `siteId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ec_role`
--

/*!40000 ALTER TABLE `ec_role` DISABLE KEYS */;
INSERT INTO `ec_role` (`id`,`name`,`priority`,`m_super`,`siteId`) VALUES 
 (1,'管理员',1,1,NULL),
 (2,'发表者',1,0,NULL),
 (3,'订阅者',1,0,NULL);
/*!40000 ALTER TABLE `ec_role` ENABLE KEYS */;


--
-- Definition of table `ec_user`
--

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

--
-- Dumping data for table `ec_user`
--

/*!40000 ALTER TABLE `ec_user` DISABLE KEYS */;
INSERT INTO `ec_user` (`id`,`group_id`,`username`,`password`,`email`,`registerTime`,`registerIP`,`lastLoginTime`,`lastLoginIp`,`loginCount`,`rank`,`uploadSize`,`uploadDate`,`admin`,`viewonlyAdmin`,`selfAdmin`,`disabled`) VALUES 
 (2,1,'fuxin','e10adc3949ba59abbe56e057f20f883e','moocss@163.com','2013-08-20 15:52:29','127.0.0.1',NULL,'127.0.0.1',0,0,0,NULL,0,0,0,0),
 (4,3,'zhangguang','7fa8282ad93047a4d6fe6111c93b308a','zhangguang@163.com','2013-07-21 13:58:08','127.0.0.1',NULL,'127.0.0.1',0,0,0,NULL,0,0,0,0),
 (6,2,'admin','14e1b600b1fd579f47433b88e8d85291','admin@163.com','2013-08-17 08:52:31','127.0.0.1',NULL,'127.0.0.1',0,0,0,NULL,0,0,0,0);
/*!40000 ALTER TABLE `ec_user` ENABLE KEYS */;


--
-- Definition of table `ec_user_ext`
--

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

--
-- Dumping data for table `ec_user_ext`
--

/*!40000 ALTER TABLE `ec_user_ext` DISABLE KEYS */;
INSERT INTO `ec_user_ext` (`id`,`uid`,`realname`,`gender`,`birthday`,`intro`,`comefrom`,`qq`,`msn`,`phone`,`mobile`,`userImg`,`userSignature`) VALUES 
 (2,2,'付鑫',1,'1984-10-11','1234','北京,北京','1234','1234','1234','134',NULL,NULL),
 (4,4,'张广',0,'2001-10-19','123456','内蒙古','123456','123456','123456','123456',NULL,NULL),
 (6,6,'admin',2,'1234','1234','1234','1234','1234','1234','1234',NULL,NULL);
/*!40000 ALTER TABLE `ec_user_ext` ENABLE KEYS */;


--
-- Definition of table `org_attachment`
--

DROP TABLE IF EXISTS `org_attachment`;
CREATE TABLE `org_attachment` (
  `attach_id` bigint(20) NOT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL COMMENT '附件路径',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`attach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织用户附件表';

--
-- Dumping data for table `org_attachment`
--

/*!40000 ALTER TABLE `org_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_attachment` ENABLE KEYS */;


--
-- Definition of table `org_basic_cert`
--

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

--
-- Dumping data for table `org_basic_cert`
--

/*!40000 ALTER TABLE `org_basic_cert` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_basic_cert` ENABLE KEYS */;


--
-- Definition of table `org_basic_info`
--

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
  `main_business` varchar(255) DEFAULT NULL COMMENT '主营业务',
  `resume` text COMMENT '简历',
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构类用户基本信息';

--
-- Dumping data for table `org_basic_info`
--

/*!40000 ALTER TABLE `org_basic_info` DISABLE KEYS */;
INSERT INTO `org_basic_info` (`uid`,`enterprise_name`,`license_number`,`registered_capital`,`legal_representative`,`region`,`address`,`zip_code`,`enterprise_type`,`enterprise_nature`,`industry_fields`,`web_site`,`contact_name`,`contact_position`,`phone`,`main_business`,`resume`,`email`) VALUES 
 (123,'信息技术有限公司','23090310031022',0,'','','test','100010','','','','','王大力','经理','88108081','','','wangdali@qq.com');
/*!40000 ALTER TABLE `org_basic_info` ENABLE KEYS */;


--
-- Definition of table `org_ent_info`
--

DROP TABLE IF EXISTS `org_ent_info`;
CREATE TABLE `org_ent_info` (
  `uid` bigint(20) DEFAULT NULL,
  `employees` bigint(20) DEFAULT NULL COMMENT '雇员数',
  `sales` bigint(20) DEFAULT NULL COMMENT '销售额',
  `profits` bigint(20) DEFAULT NULL COMMENT '盈利额',
  `qualification` varchar(255) DEFAULT NULL COMMENT '资质'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构类用户，企业机构信息';

--
-- Dumping data for table `org_ent_info`
--

/*!40000 ALTER TABLE `org_ent_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_ent_info` ENABLE KEYS */;


--
-- Definition of table `org_gov_info`
--

DROP TABLE IF EXISTS `org_gov_info`;
CREATE TABLE `org_gov_info` (
  `uid` bigint(20) DEFAULT NULL,
  `gdp` bigint(20) DEFAULT NULL COMMENT '上年度gdp',
  `gdp_growth` bigint(20) DEFAULT NULL COMMENT 'gdp增幅',
  `military_gdp` bigint(20) DEFAULT NULL COMMENT '军工gdp占比'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构类，政府机构信息';

--
-- Dumping data for table `org_gov_info`
--

/*!40000 ALTER TABLE `org_gov_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_gov_info` ENABLE KEYS */;


--
-- Definition of table `org_leg_awrards`
--

DROP TABLE IF EXISTS `org_leg_awrards`;
CREATE TABLE `org_leg_awrards` (
  `award_id` bigint(20) NOT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `get_time` date DEFAULT NULL COMMENT '获奖时间',
  `title` varchar(255) DEFAULT NULL COMMENT '获奖名称',
  PRIMARY KEY (`award_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='联盟成员获奖';

--
-- Dumping data for table `org_leg_awrards`
--

/*!40000 ALTER TABLE `org_leg_awrards` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_leg_awrards` ENABLE KEYS */;


--
-- Definition of table `org_leg_branches`
--

DROP TABLE IF EXISTS `org_leg_branches`;
CREATE TABLE `org_leg_branches` (
  `branch_id` bigint(20) NOT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '分支机构名称',
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='联盟成员分支机构';

--
-- Dumping data for table `org_leg_branches`
--

/*!40000 ALTER TABLE `org_leg_branches` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_leg_branches` ENABLE KEYS */;


--
-- Definition of table `org_leg_info`
--

DROP TABLE IF EXISTS `org_leg_info`;
CREATE TABLE `org_leg_info` (
  `uid` bigint(20) DEFAULT NULL,
  `competent_authority` varchar(255) DEFAULT NULL COMMENT '主管机关',
  `technical_person_number` bigint(20) DEFAULT NULL COMMENT '技术人员数',
  `per_capital_output` bigint(20) DEFAULT NULL COMMENT '人均产值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构类，评估联盟成员信息';

--
-- Dumping data for table `org_leg_info`
--

/*!40000 ALTER TABLE `org_leg_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_leg_info` ENABLE KEYS */;


--
-- Definition of table `org_leg_proj`
--

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

--
-- Dumping data for table `org_leg_proj`
--

/*!40000 ALTER TABLE `org_leg_proj` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_leg_proj` ENABLE KEYS */;


--
-- Definition of table `org_supply_demand`
--

DROP TABLE IF EXISTS `org_supply_demand`;
CREATE TABLE `org_supply_demand` (
  `sd_id` bigint(20) NOT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `isS_D` varchar(45) DEFAULT NULL COMMENT '供应还是需求',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `intro` text COMMENT '供需介绍',
  PRIMARY KEY (`sd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业供需表';

--
-- Dumping data for table `org_supply_demand`
--

/*!40000 ALTER TABLE `org_supply_demand` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_supply_demand` ENABLE KEYS */;


--
-- Definition of table `user_basic_info`
--

DROP TABLE IF EXISTS `user_basic_info`;
CREATE TABLE `user_basic_info` (
  `uid` bigint(20) unsigned DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(45) DEFAULT NULL COMMENT '昵称',
  `phone` varchar(45) DEFAULT NULL COMMENT '联系电话',
  `realname` varchar(45) DEFAULT NULL COMMENT '真实姓名',
  `idcard_number` varchar(45) DEFAULT NULL COMMENT '身份证号',
  `sex` int(10) unsigned DEFAULT NULL COMMENT '性别',
  `bloodtype` varchar(45) DEFAULT NULL COMMENT '血型',
  `nation` varchar(45) DEFAULT NULL COMMENT '民族',
  `heighth` bigint(20) unsigned DEFAULT NULL COMMENT '身高',
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
  `resume` text COMMENT '个人简介',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人用户类基本信息';

--
-- Dumping data for table `user_basic_info`
--

/*!40000 ALTER TABLE `user_basic_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_basic_info` ENABLE KEYS */;


--
-- Definition of table `user_engineer_academic_achievement`
--

DROP TABLE IF EXISTS `user_engineer_academic_achievement`;
CREATE TABLE `user_engineer_academic_achievement` (
  `academ_id` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `get_time` date DEFAULT NULL COMMENT '获取时间',
  `name` varchar(255) DEFAULT NULL COMMENT '成果名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学术成果表';

--
-- Dumping data for table `user_engineer_academic_achievement`
--

/*!40000 ALTER TABLE `user_engineer_academic_achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_engineer_academic_achievement` ENABLE KEYS */;


--
-- Definition of table `user_engineer_certificate`
--

DROP TABLE IF EXISTS `user_engineer_certificate`;
CREATE TABLE `user_engineer_certificate` (
  `cert_id` bigint(20) unsigned DEFAULT NULL,
  `uid` date DEFAULT NULL,
  `get_time` date DEFAULT NULL,
  `certificate_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_engineer_certificate`
--

/*!40000 ALTER TABLE `user_engineer_certificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_engineer_certificate` ENABLE KEYS */;


--
-- Definition of table `user_engineer_important_work`
--

DROP TABLE IF EXISTS `user_engineer_important_work`;
CREATE TABLE `user_engineer_important_work` (
  `word_id` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `get_time` date DEFAULT NULL COMMENT '完成时间',
  `work_name` varchar(255) DEFAULT NULL COMMENT '论著名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='技术人员重要论著表';

--
-- Dumping data for table `user_engineer_important_work`
--

/*!40000 ALTER TABLE `user_engineer_important_work` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_engineer_important_work` ENABLE KEYS */;


--
-- Definition of table `user_engineer_info`
--

DROP TABLE IF EXISTS `user_engineer_info`;
CREATE TABLE `user_engineer_info` (
  `uid` bigint(20) unsigned DEFAULT NULL,
  `profession_engaged` varchar(255) DEFAULT NULL,
  `major_category` varchar(255) DEFAULT NULL,
  `detail_category` varchar(255) DEFAULT NULL,
  `engaged_time` date DEFAULT NULL,
  `profession_ability` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_engineer_info`
--

/*!40000 ALTER TABLE `user_engineer_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_engineer_info` ENABLE KEYS */;


--
-- Definition of table `user_engineer_worklife`
--

DROP TABLE IF EXISTS `user_engineer_worklife`;
CREATE TABLE `user_engineer_worklife` (
  `uid` bigint(20) unsigned DEFAULT NULL,
  `start_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `company` varchar(255) DEFAULT NULL COMMENT '就只公司',
  `position` varchar(45) DEFAULT NULL COMMENT '职务',
  `intro` text COMMENT '经历简介',
  `work_life_id` bigint(20) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='技术用户工作履历表';

--
-- Dumping data for table `user_engineer_worklife`
--

/*!40000 ALTER TABLE `user_engineer_worklife` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_engineer_worklife` ENABLE KEYS */;


--
-- Definition of table `user_experter_info`
--

DROP TABLE IF EXISTS `user_experter_info`;
CREATE TABLE `user_experter_info` (
  `uid` bigint(20) unsigned DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `year_of_employment` date DEFAULT NULL,
  `technical_grade` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `profession_engaged` varchar(255) DEFAULT NULL,
  `profession_engaged_time` date DEFAULT NULL,
  `current_position` varchar(255) DEFAULT NULL,
  `current_position_time` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_experter_info`
--

/*!40000 ALTER TABLE `user_experter_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_experter_info` ENABLE KEYS */;


--
-- Definition of table `user_experter_proj_info`
--

DROP TABLE IF EXISTS `user_experter_proj_info`;
CREATE TABLE `user_experter_proj_info` (
  `pid` bigint(20) unsigned DEFAULT NULL,
  `uid` bigint(20) unsigned DEFAULT NULL,
  `proj_start_time` date DEFAULT NULL,
  `proj_end_time` date DEFAULT NULL,
  `intro` text,
  `contribution` text,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_experter_proj_info`
--

/*!40000 ALTER TABLE `user_experter_proj_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_experter_proj_info` ENABLE KEYS */;


--
-- Definition of table `user_login_info`
--

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

--
-- Dumping data for table `user_login_info`
--

/*!40000 ALTER TABLE `user_login_info` DISABLE KEYS */;
INSERT INTO `user_login_info` (`uid`,`username`,`password`,`create_time`,`update_time`,`uwechatid`,`head_image`,`status`) VALUES 
 (123,'fuxin','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `user_login_info` ENABLE KEYS */;


--
-- Definition of table `user_reward_info`
--

DROP TABLE IF EXISTS `user_reward_info`;
CREATE TABLE `user_reward_info` (
  `reward_id` bigint(20) unsigned DEFAULT NULL,
  `uid` bigint(20) unsigned DEFAULT NULL,
  `reward_time` date DEFAULT NULL,
  `reward` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_reward_info`
--

/*!40000 ALTER TABLE `user_reward_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_reward_info` ENABLE KEYS */;


--
-- Definition of table `user_role_info`
--

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

--
-- Dumping data for table `user_role_info`
--

/*!40000 ALTER TABLE `user_role_info` DISABLE KEYS */;
INSERT INTO `user_role_info` (`uid`,`isorg`,`isadmin`,`isexperter`,`ismanager`,`isengineer`,`isent`,`isleg`,`isgov`,`create_time`,`update_time`,`issuperadmin`) VALUES 
 (123,2,1,2,2,2,2,2,2,NULL,NULL,1);
/*!40000 ALTER TABLE `user_role_info` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
