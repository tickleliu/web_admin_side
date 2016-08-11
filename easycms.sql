create database cms DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

use cms;

DROP TABLE IF EXISTS `cms`.`ac_content`;
CREATE TABLE  `cms`.`ac_content` (
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


create table ec_group(
  id int primary key auto_increment,
  name varchar(100) not null,
  priority int not null default '10',
  allowPerDay int(11) not null default '4096',
  allowMaxFile int(11) not null default '1024',
  allowSuffix varchar(255) default 'jpg,jpeg,gif,png,bmp',
  needCaptcha tinyint(1)  not null default '1',
  needCheck tinyint(1) not null default '1',
  regDef tinyint(1) not null default '1'
);
create table ec_user(
  id int primary key auto_increment,
  group_id int not null,
  username varchar(100) not null,
  password varchar(100) not null,
  email varchar(100) not null,
  registerTime timestamp not null,
  registerIP varchar(50) default '127.0.0.1',
  lastLoginTime datetime,
  lastLoginIp varchar(50) default '127.0.0.1',
  loginCount int(11) not null  default '0',
  rank int(11) not null default '0',
  uploadSize int(11) not null default '0',
  uploadDate datetime,
  admin tinyint(1) not null default '0',
  viewonlyAdmin tinyint(1) not null default '0',
  selfAdmin tinyint(1) not null default '0',
  disabled tinyint(1) not null default '0',
  foreign key(group_id) references ec_group(id)
);
create table ec_user_ext(
  id int primary key auto_increment,
  uid int,
  realname varchar(100),
  gender tinyint(1),
  birthday varchar(255),
  intro varchar(255),
  comefrom varchar(150),
  qq varchar(100),
  msn varchar(100),
  phone varchar(50),
  mobile varchar(50),
  userImg varchar(255),
  userSignature varchar(255),
  foreign key(uid) references ec_user(id)
);
create table ec_role(
  id int primary key auto_increment,
  name varchar(100),
  priority int not null default '1',
  m_super tinyint(1) not null default '0',
  siteId int(11)
);
create table ec_log(
  id int primary key auto_increment,
  category int not null default '3',
  time datetime,
  ip varchar(100),
  url varchar(100),
  title varchar(100),
  content varchar(100),
  username varchar(100)
);
CREATE TABLE ec_message(
	msgId INT PRIMARY KEY AUTO_INCREMENT,
	msgTitle VARCHAR(100),
	msgContent VARCHAR(255),
	sendTime TIMESTAMP,
	msgStaus  TINYINT(1) NOT NULL DEFAULT '0',
	msgBox INT(2) NOT NULL DEFAULT '1',
	siteId INT(11) NOT NULL DEFAULT '1',
	msgSendUserId INT(11) NOT NULL DEFAULT '1',
	msgReceiverUserId INT(11) NOT NULL DEFAULT '0',
	FOREIGN KEY(msgSendUserId) REFERENCES ec_user(id),
	FOREIGN KEY(msgReceiverUserId) REFERENCES ec_user(id)
);
CREATE TABLE ec_message_receiver(
	receiverId INT PRIMARY KEY AUTO_INCREMENT,
	msgTitle VARCHAR(100),
	msgContent VARCHAR(255),
	sendTime TIMESTAMP,
	msgStaus  TINYINT(1) NOT NULL DEFAULT '0',
	msgBox INT(2) NOT NULL DEFAULT '1',
	msgId INT(11),
	siteId INT(11) NOT NULL DEFAULT '1',
	msgSendUserId INT(11) NOT NULL DEFAULT '1',
	msgReceiverUserId INT(11) NOT NULL DEFAULT '0',
	FOREIGN KEY(msgSendUserId) REFERENCES ec_user(id),
	FOREIGN KEY(msgReceiverUserId) REFERENCES ec_user(id),
	FOREIGN KEY(receiverId) REFERENCES ec_message(msgId)
);

-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 08 月 20 日 15:58
-- 服务器版本: 5.1.41
-- PHP 版本: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `easycmsdb`
--

-- --------------------------------------------------------

--
-- 表的结构 `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `account`
--

INSERT INTO `account` (`id`, `username`, `password`) VALUES
(1, 'moocss', NULL),
(2, 'fuxin', NULL),
(3, '??', NULL),
(4, 'fuxin123', NULL),
(5, 'raonbow', NULL),
(6, 'moocss', '123456'),
(7, '??', 'xinyi116518'),
(8, '', ''),
(9, 'moocss', '123456'),
(10, 'moocss', '123456'),
(11, 'moocss', '123456');

-- --------------------------------------------------------

--
-- 表的结构 `ec_group`
--

CREATE TABLE IF NOT EXISTS `ec_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '10',
  `allowPerDay` int(11) NOT NULL DEFAULT '4096',
  `allowMaxFile` int(11) NOT NULL DEFAULT '1024',
  `allowSuffix` varchar(255) DEFAULT '.jpg,.jpeg,.gif,.png,.bmp',
  `needCaptcha` tinyint(1) NOT NULL DEFAULT '1',
  `needCheck` tinyint(1) NOT NULL DEFAULT '1',
  `regDef` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `ec_group`
--

INSERT INTO `ec_group` (`id`, `name`, `priority`, `allowPerDay`, `allowMaxFile`, `allowSuffix`, `needCaptcha`, `needCheck`, `regDef`) VALUES
(1, '设计组', 1, 2, 1000, '.jpg/.jpeg/.png/.bmp', 1, 1, 1),
(9, '投稿者', 10, 1024, 1024, '.jpg/.jpeg/.png/.bmp', 1, 1, 1),
(2, '产品组', 7, 2048, 2000, '.jpg/.jpeg/.png/.bmp', 1, 1, 1),
(3, '销售组', 8, 2048, 5000, '.jpg/.jpeg/.png/.bmp', 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ec_log`
--

CREATE TABLE IF NOT EXISTS `ec_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL DEFAULT '3',
  `time` datetime DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ec_log`
--

INSERT INTO `ec_log` (`id`, `category`, `time`, `ip`, `url`, `title`, `content`, `username`) VALUES
(1, 3, '2013-08-18 21:34:51', '192.168.0.1', NULL, NULL, NULL, 'amdin'),
(2, 3, '2013-08-18 21:39:47', '192.168.0.1', NULL, NULL, NULL, 'fuxin'),
(3, 2, '2013-08-19 21:43:04', NULL, NULL, NULL, NULL, 'fuxin'),
(4, 1, '2013-08-19 21:43:15', NULL, NULL, NULL, NULL, 'moocss'),
(5, 3, '2013-08-20 23:54:04', '127.0.0.1', NULL, '添加用户组操作', '添加的 : id=null;name=投稿者', 'fuxin');

-- --------------------------------------------------------

--
-- 表的结构 `ec_role`
--

CREATE TABLE IF NOT EXISTS `ec_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `m_super` tinyint(1) NOT NULL DEFAULT '0',
  `siteId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ec_role`
--

INSERT INTO `ec_role` (`id`, `name`, `priority`, `m_super`, `siteId`) VALUES
(1, '管理员', 1, 1, NULL),
(2, '发表者', 1, 0, NULL),
(3, '订阅者', 1, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ec_user`
--

CREATE TABLE IF NOT EXISTS `ec_user` (
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
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `ec_user`
--

INSERT INTO `ec_user` (`id`, `group_id`, `username`, `password`, `email`, `registerTime`, `registerIP`, `lastLoginTime`, `lastLoginIp`, `loginCount`, `rank`, `uploadSize`, `uploadDate`, `admin`, `viewonlyAdmin`, `selfAdmin`, `disabled`) VALUES
(2, 1, 'fuxin', 'e10adc3949ba59abbe56e057f20f883e', 'moocss@163.com', '2013-08-20 15:52:29', '127.0.0.1', NULL, '127.0.0.1', 0, 0, 0, NULL, 0, 0, 0, 0),
(6, 2, 'admin', '14e1b600b1fd579f47433b88e8d85291', 'admin@163.com', '2013-08-17 08:52:31', '127.0.0.1', NULL, '127.0.0.1', 0, 0, 0, NULL, 0, 0, 0, 0),
(4, 3, 'zhangguang', '7fa8282ad93047a4d6fe6111c93b308a', 'zhangguang@163.com', '2013-07-21 13:58:08', '127.0.0.1', NULL, '127.0.0.1', 0, 0, 0, NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ec_user_ext`
--

CREATE TABLE IF NOT EXISTS `ec_user_ext` (
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
  KEY `uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `ec_user_ext`
--

INSERT INTO `ec_user_ext` (`id`, `uid`, `realname`, `gender`, `birthday`, `intro`, `comefrom`, `qq`, `msn`, `phone`, `mobile`, `userImg`, `userSignature`) VALUES
(6, 6, 'admin', 2, '1234', '1234', '1234', '1234', '1234', '1234', '1234', NULL, NULL),
(2, 2, '付鑫', 1, '1984-10-11', '1234', '北京,北京', '1234', '1234', '1234', '134', NULL, NULL),
(4, 4, '张广', 0, '2001-10-19', '123456', '内蒙古', '123456', '123456', '123456', '123456', NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;