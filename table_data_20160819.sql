/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2016-08-19 13:24:21
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
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'moocss', null);
INSERT INTO `account` VALUES ('2', 'fuxin', null);
INSERT INTO `account` VALUES ('3', '??', null);
INSERT INTO `account` VALUES ('4', 'fuxin123', null);
INSERT INTO `account` VALUES ('5', 'raonbow', null);
INSERT INTO `account` VALUES ('6', 'moocss', '123456');
INSERT INTO `account` VALUES ('7', '??', 'xinyi116518');
INSERT INTO `account` VALUES ('8', '', '');
INSERT INTO `account` VALUES ('9', 'moocss', '123456');
INSERT INTO `account` VALUES ('10', 'moocss', '123456');
INSERT INTO `account` VALUES ('11', 'moocss', '123456');

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
-- Records of ac_content
-- ----------------------------
INSERT INTO `ac_content` VALUES ('1470707170811', '2016-08-09', '2016-08-09', '新闻资讯', '钱晓虎', '陆航试飞员驾武直-10空中靶试100%命中目标', '<p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">当被誉为“霹雳火”的国产武装直升机——武直-10一次次在中国军队实兵对抗演习中惊艳亮相时，越来越多的国外军事权威开始接受这样一个事实：中国陆军不仅有了飞起来的“翅膀”，还有了全副武装的“牙齿”。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">很少有人知道，国产武装直升机走上世界前台的背后，除了潜心攻关的科研团队和精益求精的生产厂家，还有一支常年行走于极限禁区、穿梭在生死边缘的特殊团队——陆军航空兵某试飞大队。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">从15年前组建开始，这支部队就一直肩负着促进我军武器装备建设发展和国家直升机工业崛起的双重使命。这些年，他们遭遇过大量的空中险情，却每次都在千钧一发之际力挽狂澜，带着宝贵的数据安全返航。“自己的名字能与国家使命联系在一起，没有比这更有意义的了！”采访中，曾经多次空中历险的大队长姚海忠这样评价自己投身的事业。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">2007年仲夏，试飞员张志强和张云磊按计划进行直升机极限旋翼载荷测试试飞时，机体突然剧烈抖动，驾驶杆操纵困难，高度迅速下降。凭借精湛的技术和过人的胆识，试飞机组在短短几分钟内，驾驶直升机避开多个居民区，并成功迫降在距机场20公里外的稻田里。现场检查发现，直升机尾部蒙皮多处撕裂，尾传动系统严重损坏，油管断裂、液压油漏光。“再耽误几秒，直升机就可能空中解体！”试飞员的果敢与担当让头发花白的专家泪流满面：这次迫降成功保住了科研成果，更挽救了武直-10这个凝聚多年心血的型号。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">“每次与死神擦肩而过之后，试飞员们抖掉满身征尘，又会微笑着继续奋勇驾机起飞。”作为大队政委，陈风华最感自豪的就是试飞员们这种百折不挠、乐观进取的状态。多年来，试飞员们不仅用心飞越未知世界，更用心推动科研创新。他们在飞行实践中提出的千余条可行性建议，解决了大量影响国产直升机性能品质和飞行安全的问题，提升了国产装备的战技术性能，推动我国直升机工业向世界先进水平迈进。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">一次试飞，某新型武装直升机右侧发动机尾喷管5个固定支点中的4个支点接连发生脱落，尾喷管仅有一端与发动机相连，随时都有分离的危险。究竟是试飞员操作不当，还是设计问题？大队连夜组织试飞员研读该机的设计、安装、飞行等技术资料，逐个剖析故障原因，最终找出尾喷管固定设计存在的缺陷。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">一次，试飞机组在西北某基地执行武直-10机载武器试验，直升机旋翼被出膛的火箭弹击穿，碎片溅射至数十米外，不少内部元器件被烧焦。面对这起罕见的重大险情，试飞机组没有被吓住，而是与专家组一起进行故障分析，协助科研人员改进试验方案。在后续试验中，他们果敢驾机升空，取得了空中靶试100%命中目标的骄人战果。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">正是凭着这股坚韧与执著，他们在短时间内先后完成4个系列、20余个新型号直升机的科研试飞任务，将数百架直升机顺利交付陆、海、空军和武警部队，为国防武器装备建设的跨越式发展作出贡献。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">在探索、验证装备性能极限的同时，大队试飞员们利用自身技术优势，为部队新装备形成战斗力、完成多样化军事任务铺路搭桥，提供技术保障，培训带飞部队飞行员400余名，成为陆军航空兵部队名副其实的“金牌教练”。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">即将赴高原训练场打靶的姚海忠告诉记者，由他们负责改装培训的飞行员，大都成为各部队的骨干力量，在遂行跨区对抗、中外联合军演和抢险救灾等军事任务中发挥着中坚作用，推动着陆军部队向“机动作战、立体攻防”这一战略目标加速迈进。</p><p><img src=\"http://localhost:8000/upload/../upload/image/20160809/1470707219057065796.jpg\" title=\"1470707219057065796.jpg\" alt=\"武直十.jpg\"/></p>', '1', '1', 'http://localhost:8000/upload/main/1470707201357.jpg');
INSERT INTO `ac_content` VALUES ('1470707745625', '2016-08-09', '2016-08-09', '新闻资讯', '张海龙', '北海舰队4艘战舰进行实弹演练', '<p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">雷达飞旋、炮声隆隆，浩瀚黄海波诡云谲。8月2日至5日，由北海舰队某驱逐舰支队大庆舰、大连舰、开封舰和洛阳舰4艘舰艇组成的编队转战多个海区，开展全员额、全要素、全课目海上实弹射击训练，在近似实战的环境中摔打部队。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><img src=\"http://localhost:8000/upload/../upload/image/20160809/1470707866178021696.jpg\" title=\"1470707866178021696.jpg\" alt=\"北海舰队.jpg\"/></p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">训练中，他们按照“港岸苦练，海上精练”的组训思路，精心设置逼真“海战场”。在连续四天的实兵实弹训练中，他们先后完成了主炮对海射击、副炮对空射击、海上轻武器射击、舰艇综合攻防等7项实弹射击训练任务和20余项部署操演，有效检验了舰艇编队在高强度立体火力对抗中遂行作战任务的能力。</p><p><br/></p>', '1', '1', 'http://localhost:8000/upload/main/1470707796445.jpg');
INSERT INTO `ac_content` VALUES ('1470707960509', '2016-08-09', '2016-08-09', '新闻资讯', '梁蓬飞', '我军在“苏沃洛夫突击”最后一轮单车赛中勇夺第一', '<p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><img src=\"http://localhost:8000/upload/../upload/image/20160809/1470708071850054818.jpg\" title=\"1470708071850054818.jpg\" alt=\"中国步战车2.jpg\"/></p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">阿拉比诺主赛场，除了“坦克两项”，还有一项比赛同样备受瞩目——苏沃洛夫突击。该项目与“坦克两项”使用同一场地，课目和障碍设置基本相同。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">在这场硬碰硬的对决中，俄罗斯、哈萨克斯坦、伊朗和委内瑞拉参赛队使用的是俄制BMP-2步战车，中国参赛队则使用国产86A步战车，其总体性能比对手低一代水平。有外电称，“苏沃洛夫突击”更像是一场装备的“代差之战”。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">其实，“差距”何止在装备上。据第二次代表我军率队出战的第39集团军某机步旅旅长黄庆利介绍，此次比赛，无论是障碍物类型数量、射击机动距离，还是实战标准要求，都是按俄军训练大纲确定的。更为艰难的是，今年比赛主办方对规则进行了不小的改动，不利于我参赛装备发挥最大潜能。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">剑不如人，剑法受制于人。面对同组强手俄罗斯和哈萨克斯坦的“围追堵截”，我参赛3个车组毫不示弱、敢于亮剑，凭借出色的技战术发挥，在3轮单车赛中，相继夺得第三、第二和第一。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">这是一条持续上扬的成绩曲线——记者现场观战注意到，开赛以来，面对主办方从全军选拔的超强对手，我依托该旅抽组的86A步战车车组失误越来越少、射击越来越准、机动越来越快、越障越来越灵活，各种表现明显好于去年；</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">这是一条持续上扬的实力曲线——上次参赛备战，该旅不断挑战人员和装备极限，实现了86A步战车技术训练12项突破。时隔一年，该旅再度受命出征，有针对性地开展了适应性训练，又在射击技能、驾驶技能、装备性能等6个方面完成了新跨越；</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">这是一条持续上扬的自信曲线——无论发挥如何、成绩好坏，记者总能听到黄旅长用这8个字鼓励队员：“阳光心态，享受比赛。”他说，在装备、规则均于我不利的情况下，过分强调名次已没有实质意义。最重要的是，通过这两年参赛，对官兵的能力素质更自信了，对我军的国产装备发展更自信了，对我军的实战化训练更自信了，对打赢未来信息化战争更自信了。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">“代差之战”打出“中国自信”。回望这两天的单车赛，再现那些令人<span style=\"box-sizing: border-box;\">血脉偾张</span>的场景，让我们去感受该旅参赛官兵迎难而上、不畏强手，勇于接受挑战的自信与力量吧——</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">水上浮渡，是“苏沃洛夫突击”最为惊险的课目，也一度是我军装甲兵训练的弱项，十几吨重的步战车要游过750米长的河面，稍有操作不慎，就有可能陷落水中。第一个出场的车组驾驶员蔡依山沉着冷静，心细如发，用妙到毫巅的技术动作稳控油门和操纵杆，战车如一名出色的游泳健将灵巧地穿过浮标抵达终点，速度明显快于同组对手。</p><p style=\"text-align: justify; box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">在单车赛最后一轮比赛中，驾驶员鲁博、车长王坤龙、炮长包红军披挂上阵，操控战车闯关过障一气呵成，枪炮射击发发命中，涉水爬坡如履平地，以完美的发挥、明显的优势拔得头筹，上演了一场中国版的“速度与激情”，引爆全场。</p><p style=\"text-align: justify; box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">再过几天，“苏沃洛夫突击” 接力赛就将拉开战幕。面对接下来更加激烈残酷的对决，旅长黄庆利自信地挥了挥拳头：“拼了！拼了！”</p>', '1', '1', 'http://localhost:8000/upload/main/1470708003165.jpg');
INSERT INTO `ac_content` VALUES ('1470708144725', '2016-08-09', '2016-08-09', '新闻资讯', '王晓玉', '中国飞豹异域实弹射击 俄方惊呼“压力山大”', '<p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">莫斯科时间8月2日，在俄罗斯举办的国际军事2016“航空飞镖”竞赛首次组织大规模对地目标打击课目适应性训练。中国、俄罗斯、哈萨克斯坦、白俄罗斯4国参赛队，共48个机组、15个机型、50多架飞机参加实弹训练。这是本届“航空飞镖”开赛以来出动飞机数量最多、机型最多、规模最大的一次训练。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">此次适应性实弹训练分为歼击机组、轰炸机组、远程航空兵组、武装直升机组等4个组实施，要求各国参赛队熟悉飞行机场、空域、靶场目标等竞赛环境、验证飞行装备、明确飞行程序。根据赛事要求，所有飞行员选手年龄当年不超过35岁。俄制先进的苏34、苏35、卡52武装直升机悉数亮相，纷纷拿出看家本领，发挥各自装备性能，同场竞技。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">中国空军两架飞豹战机参加轰炸机组赛前训练。北京时间8月2日晚上20点12分，莫斯科时间8月2日下午15点12分，中国空军两架飞豹战机按照比赛规则，各挂载一枚航空炸弹和8枚火箭弹滑向跑道，依次加力起飞，飞向对地攻击空域。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">按规定航线进入目标靶场后，中国空军参赛飞行员王小军和罗峰，开始目视搜寻地面，并按规定时间内轰炸指定目标。轰炸完成后，迅速实施战斗转弯，随即又建立攻击航线，拉起、俯冲、发射航空火箭弹，再次完成对地面目标攻击。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">飞行员罗峰介绍说：火箭弹是一种非制导武器，飞行员操纵飞机攻击地面很小的目标，难度比拿着手枪在运动中打靶还要大，考验的是飞行员操纵飞机能力和瞄准精确度。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">中国空军参赛飞行员于当地时间7月25日安全顺利抵达赛区——俄罗斯梁赞州嘉垓列沃机场后，已顺利通过体能测试考核，并在俄方组织下与其他各国参赛队一起，先后进行了空情信息和飞行安全规则授课、实地勘察靶场等准备活动。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">俄空军远程航空兵飞行监察中心主任伊格里说：中国空军飞行员对竞赛准备非常充分，特别是实战应用、对地打击方面表现优秀。从2014年举办第一届“”航空飞镖“”比赛开始，我们就感到中国空军训练水平非常高，俄空军飞行员与他们同台竞技，感到压力非常大。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">适应性飞行结束后，“航空飞镖”竞赛将进入正式比赛阶段。俄罗斯当地时间8月3日上午，将首先进行目视侦察和特技飞行课目比赛。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><img src=\"http://localhost:8000/upload/../upload/image/20160809/1470708240754060201.jpg\" title=\"1470708240754060201.jpg\" alt=\"实弹射击1.jpg\"/></p><p><br/></p>', '1', '1', 'http://localhost:8000/upload/main/1470708178136.jpg');
INSERT INTO `ac_content` VALUES ('1470708258967', '2016-08-09', '2016-08-09', '新闻资讯', '张伟', '中国地空导弹兵首次亮相国际赛场', '<p><span style=\"color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; line-height: 32px; text-align: justify; text-indent: 32px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;俄罗斯阿斯特拉罕州当地时间8月7日，“国际军事比赛-2016”“天空之钥”项目在俄罗斯阿舒鲁克靶场闭幕。经过5轮比拼，中国地空导弹兵参赛队员最终夺得季军。俄罗斯空天军总司令邦达列夫上将出席闭幕式，并颁发奖杯奖牌。</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; line-height: 32px; text-align: justify; text-indent: 32px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"http://localhost:8000/upload/../upload/image/20160809/1470708441564054220.jpg\" title=\"1470708441564054220.jpg\" alt=\"导弹兵2.jpg\" width=\"425\" height=\"250\" style=\"width: 425px; height: 250px;\"/></span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; line-height: 32px; text-align: justify; text-indent: 32px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;赴俄罗斯参加“天空之钥”项目比赛，是中国地空导弹兵首次亮相国际赛场，主要目的是学习借鉴外军先进训练理念及有益经验，通过国际军事比赛锻炼部队，拓展视野。代表中国地空导弹兵参赛的，是以素有“津门利剑”之称的地导某部为主体组建的，7月25日飞抵莫斯科后，迅即投入紧张的比赛。</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; line-height: 32px; text-align: justify; text-indent: 32px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"http://localhost:8000/upload/../upload/image/20160809/1470708454967048161.jpg\" title=\"1470708454967048161.jpg\" alt=\"导弹兵3.jpg\" width=\"419\" height=\"235\" style=\"width: 419px; height: 235px;\"/></span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; line-height: 32px; text-indent: 32px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8月1日，“天空之钥”项目竞赛正式打响后，中国地空导弹兵先后参加了导弹装填、特种车辆单兵驾驶、导弹营战术机动、团营协同抗击空中大规模集群目标作战以及实弹射击空中靶标等5个项目比赛。</span></p>', '1', '1', 'http://localhost:8000/upload/main/1470708435535.jpg');
INSERT INTO `ac_content` VALUES ('1470708504326', '2016-08-09', '2016-08-09', '新闻资讯', '王鹏', '美国要组建新型太空作战部队', '<p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><span style=\"color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; line-height: 32px; text-align: justify; text-indent: 32px;\">7月15日</span>,美国空军航天司令部网站发布了题为《建设太空任务部队，训练明天的太空战士》的白皮书。该文件从体制架构、训练方式和作战运用等方面详细阐述了美国空军航天司令部对太空部队下一步建设与发展的构想，体现了美国对太空军事力量建设的重新考量。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><strong style=\"box-sizing: border-box;\">从“作战保障”向“直接对抗”转变的新型太空任务部队</strong></p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">在此次颁布的白皮书中，作为美军太空力量主体的美国空军航天司令部明确指出，“在当前对抗性、低级别、受限制的作战环境下，过去几十年里为太空作战提供支持保障的训练和技能已经不能满足今天的美军应对威胁并赢得胜利的需要了。”这意味着，美军太空部队将由执行传统作战保障的任务转为执行直接的太空对抗任务。因此，其对未来太空部队的规划设计中充分体现了满足新实战需求的思想。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">在太空部队构成方面，白皮书明确了两种类型太空部队的基本组成、主要任务和运用方式：一是“太空任务部队”，即指构成空军太空作战系统的所有单元和人员，他们主要在驻地开展军事行动，是能够在对抗性、低级别、受限制作战环境下操作武器系统和执行任务的战备部队；二是“太空任务特遣部队”，即太空任务部队的组成部分，由美国空军向美国战略司令部司令提供，用于实施战役作战行动。这类部队由太空操作人员、任务规划人员、情报人员、空间武器系统和其他必要的支持设备组成。从建设的目标来看，新型的太空任务部队将能够在动态多变的威胁环境中执行战区指挥官赋予的作战任务，以满足太空领域对抗的需要。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">在太空部队训练方面，白皮书提出了一种突出用于满足太空领域对抗实战需求的“战备太空机组项目”。在训练目标上，该项目强调以创新理念开发、利用、测试和训练新的战术、技术与程序，以对抗来自太空的威胁；在训练对象上，该项目是专门为战役战术级的太空作战人员设计的训练项目；在训练内容上，该项目重点关注的是对太空武器系统集成和太空作战行动指挥控制的训练；在训练手段上，该项目强调以“实物——虚拟——构造”相结合的仿真技术获取最大的训练效果，特别是使用模拟器进行训练，以确保训练场景最大限度地接近实战；在训练组织上，该项目要求参加由空中、网络等多个领域共同实施的训练演习，即为美国空军实施的“空天网”一体化作战和更好地融入美军联合作战体系进行战备训练。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><strong style=\"box-sizing: border-box;\">对太空的重新定位促使美军太空部队战略转型</strong></p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">从根本上看，美军此次提出的太空部队建设规划反映出其对未来太空领域地位作用的研判。此次白皮书的发布就能看出些许端倪，白皮书在前言中说：“太空作为全球性的公共空间对于商业活动至关重要，同时也是联合作战和全球稳定的核心要素。太空不再是美国、美国的盟友和合作伙伴可以随心所欲而不受惩罚的避难所。”从中可以看出，美军认为未来战争中的太空将不仅是一个支撑和保障联合作战的领域，而将会成为一个对抗激烈，且美军并不占有绝对优势的作战域，特别是对这一作战域的控制程度将会大大影响到美军在其他作战域的作战行动。在这种重新定位认识的基础上，美国需要、也不得不在太空军事战略的制订和太空军事力量的建设上作出调整。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">首先是制订符合当前战略形势的太空军事战略。美国太空军事战略的核心目标是威慑，有效的威慑既能够确保潜在对手不敢采取敌对行动，又能够确保战略态势向美国有利的方向发展。但是，随着空天领域相关技术的不断发展和其他战略竞争对手的能力提升，美国认为其在太空领域威慑能力大大降低、威慑效果大打折扣。在这种情况下，太空军事战略的调整势在必行。今年4月，美国智库“新美国安全中心”发布了一份题为《从圣地到战场：美国太空防御与威慑战略构想》的研究报告，提出了“有限太空战”的构想，即以适当的方式限制太空战的范围与程度，通过制订有利于美国的太空战规则来限制太空领域直接对抗造成的危害。紧接着在6月17日，美国智库“大西洋理事会”又发布了《面向新的国家安全太空战略：战略再平衡的时机已到》的研究报告，提出建立“主动预防”的太空新战略，以及做好预防与备战的两手准备。这些智库报告的密集发布，实际上是在为美国太空军事战略的调整进行战略上的造势和思想上的铺垫。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">其次是建设适应未来发展的太空军事力量。面对当前面临太空可能“失势”的现实情况，美军认为自己在太空力量建设方面必须作出调整与变革，特别是在太空部队的组织、训练和装备的模式上，此次白皮书的发布正是顺应了这一形势。英国《每日邮报》7月25日报道称，美国空军航天司令部司令约翰·海顿在透露美军将要建立新型兵种计划时就表示，“如果不能够迅速转变，我们将失去在太空中的竞争优势，并危及自身能力，从而无法赢得我们的竞争对手。”同时，美军认为其竞争对手在这方面已经是频繁动作且卓有成效。2015年8月1日，俄罗斯组建完毕的空天部队开始战斗值班。所谓的空天部队由之前的俄罗斯空军、空天防御部队和反导部队合并而成，主要是为了应对美国及北约的空天威胁。该部队的建立普遍被认为是对美国全球快速打击构想的回应。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">正因如此，美国空军在此次白皮书中提出了新的太空部队建设规划，其中突出了两个特性：一是“战斗”特性。为了执行真正的作战任务，而不是保障行动，美国空军提出要像航空兵等常备作战部队一样，建立起以特定任务为牵引，下辖太空任务联队、大队和中队的太空任务特遣部队。而在美军中，任务特遣部队的设置是典型的作战部队编组方式，虽有临时编组和常设编组之分，但都是执行作战任务的战斗编组；二是“独立”特性。美国空军在白皮书中提出，要将太空部队的作战任务与军种活动分离，特别是太空任务特遣部队担负的是专门的太空战斗值班，而不是传统的用于保障其他军种相关的业务值班上，这相当于在某种程度上将太空作战与常规作战分离和并行。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><strong style=\"box-sizing: border-box;\">美国对新型太空军事力量的建设将进一步加速太空军事化</strong></p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">美国对新型太空力量的规划，以及建设步骤的具体实施，将会影响到太空战略形势的总体态势，而最直接的后果就是进一步加速太空军事化的进程。由于太空部队和太空武器系统是太空军事能力的典型物化实体，因而也成为太空军事化的典型标志。这两项内容长期以来都是美国持续投入的重点领域。虽然其在各种场合和发布的文件中都表示要避免太空冲突，但实际上作为“一超独霸”的太空军事大国、强国，美国一直是太空军事化口头上的“反对者”和行动上的主导者、推动者。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">早在2015年12月7日举行的联合国第七十届会议大会上，当129个国家对中俄等国联合提交的“不首先在外层空间放置武器”的决议案投赞成票时，美国却带头以“没有给出太空武器”的完整定义为由投了反对票。今年2月，美国再次拒绝了中俄禁止太空军事化的倡议，负责军控和国际安全问题的美国副国务卿罗丝·戈特莫勒明确向记者说明，美国不同意俄罗斯和中国提出的禁止在太空部署武器的倡议。其主要原因正如美国空军部长黛博拉·詹姆斯早先所说，美国赞成制订太空行为准则，但前提是相关准则不会约束美军的自卫能力，而且各国对相关协议的履行必须得到核实。言外之意，符合美国利益的准则可以制订，不符合的则不予理睬。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">因此，美国国会毫不犹豫地完成了自己在太空领域的战略规划与布局，以重点太空任务部队和大型太空武器系统为代表的太空军事力量无疑是其建设的重头戏。就在此次美国空军航天司令部发布要建设太空任务部队的白皮书不久，美国媒体就透露了五角大楼要加速发展“天基空间监视系统”的消息，其意在强化太空态势感知能力，进一步掌握太空战场主动权。可以预见，美国未来将会竭尽全力重新争夺对太空领域的绝对控制权。</p><p><br/></p>', '1', '1', 'http://localhost:8000/upload/main/1470708744250.jpg');
INSERT INTO `ac_content` VALUES ('1470709307286', '2016-08-09', '2016-08-09', '政策解读', '胡志军', '军报文章：发扬长征战斗精神就能所向无敌', '<p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">80年前中国工农红军的万里长征，是中国革命斗争史上的重大历史事件，是世界军事史上的伟大壮举，是一部气壮山河的英雄史诗。中国工农红军冲破重重险阻取得伟大胜利，除了因为党的正确路线的英明，也源于战斗精神的充盈。今天我们纪念长征，就是要学习这种战斗精神，发扬长征战斗精神，更好地奋进在强军征程上。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><strong style=\"box-sizing: border-box;\">忠诚与信仰是战斗精神之源</strong></p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">在长征过程中，红军既要同围追堵截的几十万国民党军队浴血奋战，又要与党内的错误思想展开斗争，还要克服无数个高山大川等天然屏障的阻隔困厄，特别是爬雪山过草地，更要面对世所罕见的艰难困苦。广大红军将士靠什么来战胜敌人、克服险阻、渡过难关？对此，邓小平同志曾说：“在长征中为什么我们能在非常困难的情况下奋斗出来，战胜千难万险使革命胜利呢？那就是因为我们有理想，有马克思主义信念，有共产主义信念。”可以说，长征的胜利就是革命理想和坚定信念的胜利。正是有了对革命事业的无比忠诚和对党能够领导革命胜利的坚定信念，才支撑了红军反败为胜、转危为安。这种忠诚和信念，是战胜敌人、克服险阻、渡过难关的原动力，也是整个长征中战斗精神之源。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">长征的胜利就是崇高理想信念的胜利，这也启示我们，任何情况下都要坚定官兵理想信念，这是深入推进改革强军新征程、夺取强军兴军新胜利的重要法宝。要教育官兵继承和发扬老红军的光荣传统，透彻理解和掌握长征精神内涵，像红军指战员那样坚定理想信念，始终以党的旗帜为旗帜、以党的意志为意志，不论时代如何发展，环境如何变化，人员如何更替，也不论遇到何种风险、何种诱惑、何种考验，都能做到理想信念不动摇，思想道德不滑坡，革命意志不衰退；坚持把思想政治建设摆在首位，深入推进“两学一做”，坚决贯彻执行党对军队绝对领导的一系列根本原则和制度，确保部队高度稳定和集中统一。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><strong style=\"box-sizing: border-box;\">英雄主义是战斗精神的集中体现</strong></p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">红军飞夺泸定桥的战斗，是战争史上的一个奇迹。泸定桥横跨于咆哮如雷的大渡河上，长103.67米，宽3米，由13根粗铁索组成。这13根铁链，代表当时中国13省募捐所造。桥身铁链9根，平行系于两岸，每根铁链相距1尺。左右两边各有两根铁链，作为桥栏。铁索桥高于河面数丈，悬于半空，人行桥上，左右摇晃，随桥起伏，俯视河面，波涛汹涌，头晕目眩，胆战心惊。当时国民党守军在对岸设有重兵，并撤掉桥面的木板，更增添了夺桥的困难。但就是在这种情况下，红军勇士硬是冒着密集的枪弹，在震撼河谷的军号声、枪炮声和喊杀声中，爬过光溜溜的铁链，夺占该桥。朱德在谈到勇夺泸定桥的勇士们时曾说：“红军体现了英雄主义的新观念。”</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">飞夺泸定桥只是红军能打善战的一个缩影。在整个长征途中，这样的战斗比比皆是。而其中所反映出的英雄主义战斗精神，集中起来说就是“一不怕苦、二不怕死”。在战斗中不畏强敌，不怕流血，视死如归，任何时候都勇往直前，敢打敢拼，决不退缩，决不屈服。湘江战役中，红军广大指战员坚决响应上级号召，发扬英勇顽强的战斗精神，不顾一切牺牲，同国民党军展开激烈的拼搏，用刺刀、手榴弹打垮敌军整连、整营的一次又一次冲锋。经过5昼夜的浴血奋战，终于突破了国民党军重兵设防的第四道封锁线，粉碎了国民党围歼中央红军于湘江以东的企图。担任掩护任务的红军第三十四师师长陈树湘身负重伤，不幸被俘后，乘敌不备，用手从腹部伤口处绞断了肠子，壮烈牺牲，谱写了悲壮的一幕。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">英勇顽强是红军镌刻在长征路上不朽的战斗作风，更是长征留给我们的宝贵精神财富，因为战争从来都是残酷而无情的，在生与死的较量中，勇气和胆量必不可少。勇敢，不怕死，是军人最基本的素质，是士兵的第一美德。事到万难须放胆，狭路相逢勇者胜，两军对阵，胜利的天平总是倾向于英勇作战的一方。英勇顽强的战斗作风，是战斗精神直接的体现，是我军克敌制胜的重要传统，需要我们一代代保持和发扬。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><strong style=\"box-sizing: border-box;\">机动灵活的战略战术是战斗精神得以发挥的有力保证</strong></p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">战斗精神是战斗力的重要构成元素，是支撑军人英勇战斗的精神力量。但强调战斗精神，并不等于说要盲目牺牲。一部红军长征史充分说明，仅有不怕艰难困苦和流血牺牲的精神，并不能使革命取得胜利。只有在正确的路线和战略战术的指导下，顽强的战斗精神才能所向无敌，取得最终胜利。无论是1935年1月初，红军主力部队取得突破乌江的伟大胜利；还是著名的四渡赤水，都是红军机动灵活战略战术的典范。在这些战役战斗中，红军以较小的伤亡，彻底粉碎了敌军妄图凭借天险消灭红军的黄粱美梦，使红军从长征初期死打硬拼的被动局面中彻底摆脱出来，不仅掌握了战场主动权，而且开辟了革命新天地。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">任何时候任何情况下，弘扬战斗精神都要把战争制胜机理研究透，熟悉敌情我情和战场情况，做到运筹帷幄，决胜千里。在平时的军事训练中既应加大训练难度，提升训练标准，让各种演练接近于实战，注重培养志坚如钢、百折不挠、压倒一切敌人的意志品质，更要注重锻炼沉着冷静、敢打善打的良好素质，使战斗精神培育真正促进能打胜仗。</p><p><br/></p>', '1', '1', 'http://localhost:8000/upload/main/1470709371762.jpg');
INSERT INTO `ac_content` VALUES ('1470709482838', '2016-08-09', '2016-08-09', '政策解读', '唐兴华', '创新驱动，瞄准这四个发力点', '<p style=\"box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><strong style=\"box-sizing: border-box;\">找准创新驱动的发力点</strong></p><p style=\"box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">创新驱动是习主席改革强军战略思想的重要内容，对破解我军改革发展问题瓶颈、如期实现强军目标具有重大意义。当前，创新驱动发展出现历史性机遇，我们应乘势而上，运用科学方法，找准创新驱动发力点。</p><p style=\"box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">向作战理论创新发力。纵观历史，每一次军队脱胎换骨，每一次战斗力的跃升，每一次战争的完胜，都少不了创新作战理论的引领。近年来军事实践发展很快，创新理论层出不穷，相比之下，我军作战理论显得滞后于战争形态的变化，成了制约战斗力建设的弱项和短板。一些军事理论研究对上同决策脱节、对下同部队脱节、对外同对手脱节，成为制约我军创新发展的瓶颈。究其原因，我军的作战理论研究解读表态的多，研究过去的多，克隆外军的多，形成自己的远远不够。因此，部队要增强责任感使命感，紧贴部队实际和使命任务，从现实军事斗争准备中提炼、从研究信息化战争制胜机理中提炼、从吸收外军经验优长中提炼、从挖掘现代作战指挥规律中提炼，形成“你打你的、我打我的”理论优势，丰富克敌制胜的作战理论。</p><p style=\"box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">向战法训法创新发力。冷战结束后，美军主导的几场战争，基本上是一场战争一个打法。随着战争形态不断变化、武器装备升级换代、作战对手行动多变，我们的战法训法也必须随之改变。现在部队武器装备更新换代力度大、节奏快，大批新装备已配发到一线部队，很多武器装备的技战术性能已经发生了质的飞跃。当前的突出问题是：基层对新装备的使用还停留在学技术、学操作的初级阶段，缺少配套的战法训法，不利于形成作战能力；有些单位在组织战术训练时，用自己的攻防战术搞“双手互搏”式演练、不考虑任务地区作战环境搞异想天开式演练、不贴近现代作战特点搞按部就班式演练，这些都是不行的。要避免战法创新在低层次徘徊，必须紧盯实战要求、紧盯备战急需、紧盯作战对手、紧盯新装备技战术性能发挥，让智力与物力充分融合，在战法训法创新中设计战争、打赢战争。</p><p style=\"box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">向指导方式创新发力。改革强军已进入“新体制时间”，新体制已经建立运行，需要创新工作指导方式，以新的思路和办法开展工作，以新的工作作风解决“五多”问题。创新指导方式是篇大文章，上下都是撰稿人，哪级都有关联，必须做到同向同力。当前，迫切需要牢固确立主体之责的思维理念、精准精确的思维理念、简政放权的思维理念，拿起战斗力的尺子、整风整改的刀子、官兵满意的镜子，切实让新体制发挥新效能、带来新作风。</p><p style=\"box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">向教育管理模式创新发力。当前，教育管理模式滞后是一些部队建设的一个软肋，跟不上时代步伐，抓不住官兵特点，贴不近战斗力要求，很多时候着力点是封得住、管老实，结果教育管理主体压力越来越大，教育管理对象负担越来越重。因此，要下功夫在创新教育管理模式上寻求突破，切实把先进的理念引进来，把拧着劲的做法转过来，把时代性感召力的标准立起来，把现代科技优势用起来，大胆引进时尚元素，对新生事物不能当洪水而要当活水、不能当禁地而要当阵地。要以思维理念的转变，创建出一套新活实用的教育管理模式。</p><p><br/></p>', '1', '1', 'http://localhost:8000/upload/main/1470709759703.jpg');
INSERT INTO `ac_content` VALUES ('1470709856002', '2016-08-09', '2016-08-09', '政策解读', '中国军网', '军队转业干部安置暂行办法', '<p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">第一章 总则</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">第一条 为了做好军队转业干部安置工作，加强国防和军队建设，促进经济和社会发展，保持社会稳定，根据《中华人民共和国国防法》、《中华人民共和国兵役法》和其他有关法律法规的规定，制定本办法。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">第二条 本办法所称军队转业干部，是指退出现役作转业安置的军官和文职干部。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">第三条 军队转业干部是党和国家干部队伍的组成部分，是重要的人才资源，是社会主义现代化建设的重要力量。 军队转业干部为国防事业、军队建设作出了牺牲和贡献，应当受到国家和社会的尊重、优待。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">第四条 军队干部转业到地方工作，是国家和军队的一项重要制度。国家对军队转业干部实行计划分配和自主择业相结合的方式安置。计划分配的军队转业干部由党委、政府负责安排工作和职务；自主择业的军队转业干部由政府协助就业、发给退役金。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">第五条 军队转业干部安置工作，坚持为经济社会发展和军队建设服务的方针，贯彻妥善安置、合理使用、人尽其才、各得其所的原则。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">第六条 国家设立军队转业干部安置工作机构，在中共中央、国务院、中央军事委员会领导下，负责全国军队转业干部安置工作。 省（自治区、直辖市）设立相应的军队转业干部安置工作机构，负责本行政区域的军队转业干部安置工作。市（地）可以根据实际情况设立军队转业干部安置工作机构。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">第七条 解放军总政治部统一管理全军干部转业工作。军队团级以上单位党委和政治机关负责本单位干部转业工作。省军区（卫戍区、警备区）负责全军转业到所在省、自治区、直辖市干部的移交，并配合当地党委、政府做好军队转业干部安置工作。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">第八条 接收、安置军队转业干部是一项重要的政治任务，是全社会的共同责任。党和国家机关、团体、企业事业单位，应当按照国家有关规定，按时完成军队转业干部安置任务。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">第九条 军队转业干部应当保持和发扬人民军队的优良传统，适应国家经济和社会发展的需要，服从组织安排，努力学习，积极进取，为社会主义现代化建设贡献力量。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">第十条 对在社会主义现代化建设中贡献突出的军队转业干部和在军队转业干部安置工作中做出显著成绩的单位、个人，国家和军队给予表彰奖励。</p><p><br/></p>', '1', '1', 'http://localhost:8000/upload/main/1470709949256.jpg');
INSERT INTO `ac_content` VALUES ('1470709964487', '2016-08-09', '2016-08-09', '政策解读', '曾波', '增强军营吸引力不单靠“内力”', '<p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">日前在湖南某地征兵现场，笔者看到这样一幕：有的青年放弃万元月薪，行程1300余里，专门从上海赶回老家，只为应征入伍。青年的心声是：应征入伍，公私兼顾。公：应召参军，效力国防，青年之责，不容推卸；私:当过兵的人，真的不一样：为人豪爽，遇事有主见，做事有魄力。部队，是有志青年向往已久的能人学堂。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">由此，笔者想到多年前流行的一首歌曲《军营男子汉》，唱的就是军人与众不同的气质和过硬作风：如，雷厉风行、令行禁止，等等。但这些优秀素质，不是与生俱来的，不是一蹴而就的，需要在军营的大舞台大熔炉中历练得来。军营，之所以对有志有为青年具有强大的吸引力，正是因为多年来积累的能打胜仗、作风过硬等优良传统。而且可以相信，随着国防和军队改革的深入，随着官兵形势战备教育、军人职责教育和战斗精神培育的加强，随着各级更加注重在艰苦环境和实战条件下摔打锻炼部队，部队的虎气朝气也将更强，对于社会青年的吸引力将更大。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">但增强军营吸引力，在发扬我军优良传统，建设过硬部队的同时，也需要全社会共同努力，形成增强军营吸引力的内外合力。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">军人的职业属性，使之承载着社会一般行业无法比拟的艰苦和风险，最需要牺牲奉献精神，同样也需要通过社会的支持来完成荣誉感的培植和塑造。应科学统筹军事教育与国防教育资源，建立多层次的国防教育培养体系，让每一个热血青年都能体会到“国家兴亡，匹夫有责”的内涵。当前，有的军事强国选择通过建立少年军校或类似组织，从小就开始磨炼青少年的意志，激发青少年的国防意识。美国的童子军、俄罗斯的少年军校等运作多年，收效明显。通过后备训练项目，使学生具备基本的军事素质，体会到“什么是军人、军人是干什么的”，能够让年轻人认识到军旅生涯是人生中非常宝贵的一段经历，激起年轻人对军旅生活的美好憧憬和向往。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">军队不生产谷物，却生产和维护安全。凡是有远见的国家，无不把优待军人作为保持军队战斗力的重要手段。素有战斗民族之称的俄罗斯以英雄名字命名城市、街道、舰船已成传统。有的国家则大力推进军人家庭援助计划，以化解军人家庭难题。军人家庭工作虽然不能直接生成战斗力，但对战斗力的生成、巩固和提高具有重要影响。从20世纪90年代开始，美国高层就把军人家庭保障工作提升到战略位置。美军各级指挥人员高度重视家庭支援计划，各级都设有军人家庭工作机构，专人负责。与此同时，美国积极调动社会力量提供优质的服务和制度保障，帮助军人家庭解决实际困难，形成关心军人家属的良好社会风气。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">增强军营吸引力，最根本的是国家在顶层设计上理念明确、立法得力、措施具体、落实到位。从国家层面立法推动英雄文化传承等工作，在全社会树立崇尚英雄、缅怀先烈的良好风尚。进一步净化涉军舆论环境，浓厚崇军尚武的社会氛围。健全完善军人荣誉制度，建立军队勋章和军队荣誉称号落实制度，给予受表彰人员相应政治、经济和社会待遇。加强退役军人服务保障，把军人军衔、服役时间、职务级别、实绩贡献与安置优抚挂钩，加大退役军人创业扶持力度。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">“没有一支人民的军队，便没有人民的一切。”这一著名论断，至今仍具有深远的教育意义。只有深刻理解全社会巩固国防的重大意义，才能促进形成人人关心国防、热爱军队的浓厚氛围，增强现代军营的吸引力。</p><p><br/></p>', '1', '1', 'http://localhost:8000/upload/main/1470710066214.jpg');
INSERT INTO `ac_content` VALUES ('1470710142096', '2016-08-09', '2016-08-09', '政策解读', '中国军网', '中央军委办公厅要求全军认真学习贯彻习总书记“七一”重要讲话精神', '<p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><strong style=\"box-sizing: border-box;\">经中央军委批准</strong></p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><strong style=\"box-sizing: border-box;\">中央军委办公厅发出通知要求全军和武警部队认真学习贯彻习近平总书记在庆祝中国共产党成立95周年大会上的重要讲话精神</strong></p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><strong style=\"box-sizing: border-box;\">中国军网北京7月4日电</strong>&nbsp; 经中央军委批准，中央军委办公厅发出通知，就军队学习贯彻习近平总书记在庆祝中国共产党成立95周年大会上的重要讲话精神作出部署。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">通知指出，习主席“七一”重要讲话，高瞻远瞩、总揽全局，思想深邃、内涵丰富，通篇闪耀着马克思主义真理的光辉，是全党在新的历史条件下进行具有许多新的历史特点的伟大斗争的政治宣言；是党的重要理论创新成果，是马克思主义在当代中国的丰富和发展，是指引我们党奋力推进中国特色社会主义伟大事业和全面推进党的建设新的伟大工程的纲领性文献。认真学习贯彻习主席“七一”重要讲话精神，对于团结动员全党全国各族人民在以习近平同志为总书记的党中央的领导下，满怀信心为实现“两个一百年”奋斗目标，实现中华民族伟大复兴的中国梦而奋斗；对于统筹推进“五位一体”总体布局、协调推进“四个全面”战略布局，夺取中国特色社会主义伟大事业新胜利；对于加强和改进新形势下军队党的建设，全面实施政治建军、改革强军、依法治军，实现强军目标、建设世界一流军队，具有重大而深远的意义。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">通知要求，各级要把学习贯彻习主席“七一”重要讲话作为重大政治任务，及时把思想和行动统一到习主席重要讲话精神上来。团以上党委要安排专门时间，采取党委会、常委会、中心组学习等方式组织专题学习研讨；基层党组织要结合各自实际，利用党日时间和组织生活开展讨论交流。要把学习习主席“七一”重要讲话贯穿“两学一做”学习教育和改革强军主题教育活动全过程，纳入干部理论轮训和院校政治理论课教学，推动讲话精神进教材、进课堂、进头脑。要围绕讲话提出的一系列新思想新观点新论断，深化理论研究阐释，组织领导干部和理论工作者深入部队宣讲辅导，军队新闻媒体要加强舆论引导，注重用好基层“六小阵地”和军媒“两微一端”，迅速兴起学习宣传贯彻热潮。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">通知强调，要全面理解把握习主席重要讲话的深刻内涵和精神实质，着重引导广大官兵深刻认识我们党紧紧依靠人民为中华民族作出的“三个伟大历史贡献”、“三个伟大飞跃”重大意义以及取得的历史性成就，更加坚信我们党的伟大、光荣和正确，坚定不移地听党话跟党走；深刻认识“三个历史告诉我们”揭示的历史规律、历史经验和历史启示，更加坚定中国特色社会主义道路自信、理论自信、制度自信、文化自信；深刻认识把党的事业“八个不断推向前进”的战略部署，永远保持中国共产党人的奋斗精神和对人民的赤子之心，更加有力地推进中国特色社会主义伟大事业和党的建设新的伟大工程；深刻认识加强党的建设的基本规律和时代要求，紧紧抓住保持党的先进性和纯洁性这条红线，更加自觉落实全面从严治党要求；深刻认识建设同我国国际地位相称、同国家安全和发展利益相适应的巩固国防和强大军队是我国社会主义现代化建设的战略任务，牢牢把握建军治军的指导思想和方针原则，更加强化推进强军兴军的使命担当。要把学习习主席“七一”重要讲话同学习党的理论特别是习主席系列重要讲话精神结合起来，同学习党史、国史、军史和改革开放史结合起来，同破解军队建设、改革和军事斗争准备实践难题结合起来，同加强和改进军队党的建设结合起来，同各单位各部门的具体实际结合起来，全面深入领会习主席治国理政新理念新思想新战略，不断深化对讲话精神的理解领悟，真正学深学透、融会贯通，增强贯彻落实的自觉性坚定性。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">通知要求，各级要全面贯彻落实习主席“七一”重要讲话精神，充分贯彻到军队党的思想、组织、作风、反腐倡廉和制度建设各方面，落实到军队建设、改革和备战打仗各领域，体现到培育“四有”新一代革命军人和合格党员上，努力把党的政治优势、组织优势、作风优势转化为强军兴军的强大力量。要在坚定理想信念、铸牢军魂上下功夫，强化习主席系列重要讲话精神的武装引领，加强党性教育和我党我军光荣传统教育，以先进模范为榜样和鞭策，着力引导官兵深刻理解不忘初心、继续前进的重大意义和实践要求，坚定马克思主义信仰，坚定共产主义远大理想和中国特色社会主义共同理想，不断增强政治意识、大局意识、核心意识、看齐意识，深扎忠诚之根。深入做好古田全军政工会“下篇文章”，坚持党对军队绝对领导的一系列根本原则和制度，坚决维护和贯彻军委主席负责制，坚决听从党中央、中央军委和习主席指挥。要在推动改革落地、促进转型重塑上下功夫，认真贯彻习主席关于全面深化改革的重要指示和改革强军战略部署，深化“新体制、新职能、新使命”和“政治工作发挥生命线作用”大讨论，进一步读懂改革、吃透改革、坚定改革，积极破解改革中遇到的矛盾问题，推动转变职能、转变作风、转变工作方式，确保改革部署要求落到实处。要在强化管党治党责任、严肃党内政治生活上下功夫，深入学习贯彻习主席在中央政治局第三十三次集体学习时的重要讲话精神，坚持全面从严治党，坚守“三严三实”，认真执行民主集中制，严肃政治纪律和政治规矩，把严的要求贯彻全过程，做到真管真严、敢管敢严、长管长严。扎实抓好“两学一做”学习教育，严格落实七项组织生活制度，抓实应知应会应做，开展帮建支部、帮带干部、帮抓骨干活动，着力建强一线战斗堡垒和过硬党员队伍。要在深化正风反腐、纯正政治生态上下功夫，持之以恒加强作风建设，坚持抓常、抓细、抓长，坚持破立并举、激浊扬清，坚决防止和纠正选人用人上的不正之风，彻底扫除<span style=\"box-sizing: border-box;\">郭伯雄徐才厚</span>流毒造成的潜规陋习和雾霾沾染，使部队作风全面好起来。要严格监督执纪问责，坚持挺纪在前，以顽强的意志品质、零容忍的态度肃贪反腐，做到有案必查、有腐必惩。领导干部要牢固树立正确权力观，保持高尚精神追求，敬畏人民、敬畏组织、敬畏法纪，永葆共产党人拒腐蚀、永不沾的政治本色。要在树牢战斗力标准、聚力备战打仗上下功夫，全面贯彻“五个更加注重”的战略指导和新形势下军事战略方针，认真落实全军实战化军事训练座谈会精神，拓展和深化军事斗争准备，切实把思维理念和工作模式转到聚焦实战上来，把和平积弊、假大虚空赶出训练场演兵场，引导激励官兵苦练实练、精武强能，全面提高能打胜仗和履行使命能力，为实现中国梦强军梦提供有力支撑。</p><p><br/></p>', '1', '1', 'http://localhost:8000/upload/main/1470710283227.jpg');
INSERT INTO `ac_content` VALUES ('1470710307514', '2016-08-09', '2016-08-09', '政策解读', '解放军报', '军报评论：以革命性举措突破强军兴军瓶颈', '<p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><strong style=\"box-sizing: border-box;\">不断把改革开放推向前进</strong></p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><strong style=\"box-sizing: border-box;\">——六谈学习贯彻习总书记在庆祝中国共产党成立95周年大会上的重要讲话</strong></p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">■本报评论员</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">改革开放是决定当代中国命运的关键抉择，是党和人民事业大踏步赶上时代的重要法宝。习总书记在庆祝中国共产党成立95周年大会上的重要讲话中，深刻阐述了改革开放对于发展中国特色社会主义的重大意义，发出了“不断把改革开放推向前进”的伟大号召。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">改革开放是当代中国最鲜明的特色，是我们党在新的历史时期最鲜明的旗帜。回顾改革开放以来的历程，每一次重大改革都给党和国家发展注入新的活力、给事业前进增添强大动力，党和人民的事业在不断深化改革中大步向前推进。没有改革开放，就没有中国的今天。正是靠着坚持不懈推进改革开放，才使中国这个世界上最大的发展中国家在短短30多年里摆脱贫困，并跃升为世界第二大经济体，彻底摆脱被开除球籍的危险，创造了人类社会发展史上惊天动地的发展奇迹，使中华民族焕发出新的蓬勃生机。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">改革开放只有进行时，没有完成时。纵观世界，变革是大势所趋、人心所向。世界各国都在加快推进变革，新一轮科技革命和产业变革正在孕育兴起。国内外环境和主客观条件对我们深化改革有利，抓住这个千载难逢的历史性机遇，就能赢得战略主动，否则就有可能陷于被动。只有增强忧患意识、机遇意识，以更大的政治勇气和智慧、更有力的措施和办法推进改革，才能抢占未来发展的制高点。当前，我国发展还面临一系列突出矛盾和挑战，前进道路上还有不少困难和问题。比如，发展中不平衡、不协调、不可持续问题依然突出，科技创新能力不强，产业结构不合理，发展方式依然粗放，等等。破解这些难题，化解来自各方面的风险挑战，推动经济社会持续健康发展，必须依靠全面深化改革。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">国防和军队改革是国家全面深化改革的重要组成部分，也是全面深化改革的重要标志。党的十八届三中全会把国防和军队改革单独作为一章写进《决定》，纳入国家全面深化改革的总盘子，充分体现了国防和军队改革在国家全面改革总体布局中的特殊意义和重要地位作用。不论是应对当今世界前所未有之大变局、有效维护国家安全，坚持和发展中国特色社会主义、协调推进“四个全面”战略布局，还是贯彻落实强军目标和军事战略方针、履行好军队使命任务，都要求我们必须深化国防和军队改革。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">我军改革创新的步伐从来没有停止过，但这轮改革与以往有很大不同。从“局部性”到“整体性”，从“数量增减”到&nbsp;“体系重塑”，从“动棋子”到“动棋盘”，目的是以革命性举措，突破强军兴军的瓶颈。&nbsp;&nbsp;&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">通过改革，体制性障碍、结构性矛盾、政策性问题将得到有力解决，制约能打仗打胜仗的短板、弱项将得到有效克服，领导指挥体制会更加科学，力量结构会更加合理，政策制度会更加完善，构建起能够打赢信息化战争、有效履行使命任务的中国特色现代军事力量体系。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">深化国防和军队改革是一项长期、复杂、艰巨的战略工程。现在改革的“四梁八柱”搭起来了，但还需一砖一瓦砌、一钉一铆紧，时间很急、任务很重、要求很高。如何按照时间节点确保重大改革举措落地？如何把握改革节奏做到梯次接续、前后衔接？如何实现“三个转变”保证新体制正常有序运转？如何搞好配套保障增强改革系统性整体性协同性？解决好这些重大现实问题，既要在战略上勇于进取，又要在战术上步步为营；既要在思想上坚定果敢，又要在行动上踩实抓实，将改革要求坚决贯彻到底，将改革部署坚决执行到底，将改革任务坚决落实到底。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">深化国防和军队改革是回避不了的一场大考。全军官兵要充分认清深化国防和军队改革的重要性和紧迫性，准确把握改革的目标和任务，强化政治意识、大局意识、号令意识，以踏石留印、抓铁有痕的精神把各项改革任务完成好，坚决打赢这场攻坚战。</p><p><br/></p>', '1', '1', 'http://localhost:8000/upload/main/1470710389823.jpg');
INSERT INTO `ac_content` VALUES ('1470710576755', '2016-08-09', '2016-08-09', '技术前沿', '胡喆', '长征五号将成为我国载人空间站和探月工程主力火箭', '<p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">新华社北京3月1日电（记者胡喆、余晓洁）“长征五号是我国即将于今年实现首飞的运载能力最大的运载火箭，也是我国目前推力最大的绿色环保火箭。”全国人大代表、中国航天科技集团公司六院院长谭永华1日在接受新华社记者专访时说，“长征五号将成为我国载人空间站建设和探月工程的主力火箭。”</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><img src=\"http://localhost:8000/upload/../upload/image/20160809/1470710777856053986.jpg\" title=\"1470710777856053986.jpg\" alt=\"长征五号.jpg\"/></p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><span style=\"font-size: 1rem; line-height: 2rem; text-indent: 2em;\">2016年，长征家族中的新晋“老大”——长征五号运载火箭将正式首飞。而在今年早些时候，长征家族的另一名“后起之秀”——长征七号运载火箭，也将踏上太空首秀的征程。预计到2020年后，长征七号将逐步替代现有长征家族的大部分运载火箭，承担我国70%左右的航天发射任务。</span></p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">“长征七号动力系统全部采用航天科技集团六院研制的液氧煤油火箭发动机。具备近地轨道13.5吨、700千米太阳同步轨道5.5吨的运载能力。而长征五号动力系统，除了液氧煤油发动机外，还装备了由六院研制的氢氧发动机。长征七号和长征五号首飞，标志着我国运载火箭全面开启‘绿色环保大推力’时代。”谭永华说。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">航天发展，动力先行。作为我国航天事业发展的核心力量之一，航天科技集团六院始终保持常规火箭发动机的金牌品质，创造了火箭发动机在重大飞行试验中百分之百的成功率。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">谭永华向记者介绍，此次长征五号与长征七号运载火箭使用的120吨级发动机，都是液氧煤油发动机。具有高能量特性、无毒无污染、可实现自身起动、大范围推力调节等突出优势，是当今世界航天运载器十分重要的动力装置，也是航天技术先进性的标志之一。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">航天发动机是火箭的“心脏”，涡轮泵又是发动机的“心脏”。这颗“心脏”到底有多强呢？谭永华打了个形象的比方，“液氧煤油发动机的涡轮泵，产生的最高压强可达到500个大气压，相当于能够把上海的黄浦江水，打到5000米的青藏高原。”</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">谭永华表示，2017年左右我国即将实施的探月三期工程计划，就是利用航天六院研制的上面级氢氧火箭发动机空间两次启动，将嫦娥五号探测器推送到地月转移轨道，从而实现我国首次月球取样及回收。</p><p><br/></p>', '1', '1', 'http://localhost:8000/upload/main/1470710677700.png');
INSERT INTO `ac_content` VALUES ('1470710911365', '2016-08-09', '2016-08-09', '技术前沿', '罗朝文', '中国海军舰艇编队完成“环太军演”启程回国', '<p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">本报夏威夷8月5日电 记者罗朝文、李开强报道：当地时间8月5日上午，参加“环太平洋-2016”演习的中国海军舰艇编队圆满完成演习任务，启程回国。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><img src=\"http://localhost:8000/upload/../upload/image/20160809/1470710960318068174.jpg\" title=\"1470710960318068174.jpg\" alt=\"海军演习.jpg\" width=\"470\" height=\"284\" style=\"width: 470px; height: 284px;\"/></p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">9时30分，中国海军舰艇编队导弹驱逐舰西安舰、导弹护卫舰衡水舰、综合补给舰高邮湖舰、综合援潜救生船长岛船和和平方舟医院船陆续驶离夏威夷珍珠港码头。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">此次演习历时53天，分为海上航渡、港岸训练、海上实施和总结撤收4个阶段。中国海军舰艇编队与美国、法国、印尼等国共10艘舰船组成的175特混编队，完成了海上封锁行动的3大类16个课目演练。综合援潜救生船长岛船在海上实际对接演练中与美方提供的模拟平台实现完美对接。西安舰、和平方舟医院船组织甲板招待会和舰艇开放日，接待各国来宾和参观人员3000多人次，中方参演官兵参加了12场外方招待会、15次多边医学论坛交流活动、10余项“环太杯”体育比赛。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">中国海军舰艇编队指挥员王社强说：“这次我们参加‘环太平洋-2016’演习，可以说，是一次友谊之旅、合作之旅、展示之旅，显示了实力，同时也传递了我们谋求和平的真诚善意。中国海军愿意与所有爱好和平的国家海军合作，共同维护世界和平与地区稳定。”</p><p><br/></p>', '1', '1', 'http://localhost:8000/upload/main/1470710945185.jpg');
INSERT INTO `ac_content` VALUES ('1470711014672', '2016-08-09', '2016-08-09', '技术前沿', '傅宴宾', '首战首胜！中国空降兵勇夺国际赛事“空降排”首阶段第一', '<p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><img src=\"http://localhost:8000/upload/../upload/image/20160809/1470711078785090435.jpg\" title=\"1470711078785090435.jpg\" alt=\"空降兵.jpg\" width=\"442\" height=\"311\" style=\"width: 442px; height: 311px;\"/></p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">8月5日，国际军事比赛2016“空降排”赛事的第一阶段比赛落下帷幕，中国空降兵参赛队员，以18分的成绩位居榜首。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">比赛首日进行了 “空降急行军”课目。中国参赛队员依靠娴熟的降落伞操纵技能，顺利完成了空降集结。之后10公里急行军，队员要完成全副武装的10公里奔袭，中国参赛队员制定了严密的战术方案：将全排划分为3个小队，分别安排体能好的队员负责在前领跑和在后帮带，同时，根据比赛地草木茂密的地形特点，对参赛队员的体力进行全程合理分配，确保了我方优势课目处于领先地位。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">8月4日，进行的是“战车单车赛”课目，分为战车山地障碍驾驶和车载火炮射击。此次比赛，共用到4种装甲装备，中国参赛队使用的是国产03式轻型履带步兵战车，也是唯一使用非俄制装备的参赛队。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">比赛中，我方队员制定了“稳中求快、减少失误”的灵活战术，结合生疏地形反复进行换挡模拟训练，根据赛道弯道多、坡度大的特点，规范了各个赛段的档位和转速，并形成口诀，确保6.2公里，最大坡度31度的赛道“零失误”。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">8月5日，进行的是“单兵两项”项目，分为载员山地越野和轻武器射击。此前的两天比赛，中国参赛队以2个第二的成绩与俄、哈参赛队得分持平，均积11分，所以，“单兵两项”的胜负，将直接决定第一阶段的排名，进而影响最终成绩。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">赛前，参赛队全体官兵召开会议，进行战前动员，叫响“用体能战胜性能，用精度战胜速度”、“不是拼搏而是拼命”的口号，强烈的荣誉感和使命感让参赛将士们绝地反击。经过7个小时的激烈角逐，中国参赛队以越野时间最短、射击精度最高、罚时最少的单日总成绩，取得当天最高得分——7分！</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">第一阶段3天赛事，完成了7个课目的比武，中国参赛队获得了3个单项第一、3个第二、1个第三，以18分的总成绩排名第一！</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">“空降排”第二阶段的比赛已全面展开，后续比赛竞争更加激烈、争夺更加残酷，让我们共同期待中国空降兵的优异表现！</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">此次“空降排”比赛共有中国、俄罗斯、埃及、哈萨克斯坦等7个国家参加，分为4个阶段28个单项比赛。中国空降兵参赛队是以著名的“上甘岭特功八连”为主体组建的。“上甘岭特功八连”在64年前举世闻名的上甘岭战役中一战成名！当时，坚守阵地的八连官兵伤亡惨重，被迫转入坑道作战，面对断水断粮的绝境，连队组建“坑道党支部”，党员骨干带领剩余官兵顽强战斗，最终将布满381个弹孔的战旗插上上甘岭主峰，铸就形成“只吹冲锋号、不打退堂鼓”的连魂。</p><p><br/></p>', '1', '1', 'http://localhost:8000/upload/main/1470711060436.jpg');
INSERT INTO `ac_content` VALUES ('1470711167558', '2016-08-09', '2016-08-09', '技术前沿', '王卫东', '火箭军创新近百项伪装成果 千人百车突然消失', '<p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><strong style=\"box-sizing: border-box;\">带领科研人员为全军制定20部相关标准规范，完成数十项重点工程伪装设计，取得研究成果近百项。火箭军某研究室党支部——</strong></p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><strong style=\"box-sizing: border-box;\">勇当科研创新路上“火车头”</strong></p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">■本报记者　王卫东　通讯员　魏　鹏　潘　斌</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><span style=\"color:blue;box-sizing: border-box;\">书记心语：“坚持创新驱动是提高战斗力的必由之路。在这场寂寞又没有终点的跋涉中，党支部要充当凝心聚力的‘火车头’，带领官兵始终将科技创新的‘准星’瞄准战场‘靶心’，让创新激情燃烧在战位。”</span></p><p style=\"text-align:right;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal; color: blue;\"><span style=\"color:blue;box-sizing: border-box;\">——火箭军某研究室党支部书记&nbsp;&nbsp;潘玉龙</span></p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><img src=\"http://localhost:8000/upload/../upload/image/20160809/1470711319911029549.jpg\" title=\"1470711319911029549.jpg\" alt=\"火箭军.jpg\"/></p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">新年伊始，大漠深处，一场实兵演练拉开序幕。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">激战中，火箭军某导弹旅千人百车在“敌”眼皮底下突然消失得无影无踪。发挥关键作用的，正是随军征战的火箭军某研究室刚推出的一批伪装创新成果。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">近年来，这个仅10余人的研究室，一直是全军工程伪装建设的“中心”，先后为全军制定20部相关标准规范，取得近百项服务部队的创新成果。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">问起他们创新成果持续井喷的动力源泉，该室官兵说：火车跑得快，全靠车头带。我们有一个坚强的党支部，有一套科学务实的创新机制，有一批创新能力强的党员干部。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">对于一个工程设计研究单位，强烈的创新意识和过硬的创新能力是核心竞争力。“党支部对科研创新的支持帮助，从来都不遗余力。”谈起这个话题，工程师何超博士深有感触。刚到研究室时，何超对到基层调研、参观见学等活动有些不以为然，一心想埋头“憋”出创新成果。但他提出的想法因创新起点不高被否决，积极性一度受挫。这时党支部成员主动靠上来，建议他立足本职搞创新，并积极出谋划策。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">沉到部队一线调研，确定多个“接地气”的课题后，何超领衔的某创新研究成果在第2年就获得军队科技进步二等奖。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">为鼓励创新激情，提升创新本领，该室党支部在合理选拔人才、实行师徒帮带、建立容错机制等方面，进行不懈探索，有些制度措施还被上级推广。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">去年，受领阅兵迷彩方案设计任务后，该室党支部研究决定由年轻工程师王永清担纲。最终，王永清没有辜负组织信任，大胆创新形成18套优质方案，高质量完成设计任务。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">记者采访发现，无论党支部一班人，还是其他科研干部身上，都有一股子创新进取的劲。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">“博士，硕士，首先是战士。”博士周许申在笔记本这样写道。他告诉记者，研究室老党员黄炳华，奋战34年积劳成疾，病逝在工作岗位上，被中央军委授予“献身国防现代化模范科技干部”荣誉称号。每次重温黄炳华的先进事迹，他都能感受到使命感荣誉感在心中升腾。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">“创新是一场寂寞又没有终点的跋涉，党员干部更应冲在最前面！”原党支部书记、室主任王学进在执行一次紧急任务时，10余次赴工程现场调研、测试数据，在大山中连续穿行3昼夜，身体多处被严重划伤，最终拿出设计方案；为方便部队实时评定、快速判断、及时改进伪装工作，党员赵西亮和同事不分昼夜试验百余次，成功研发多波段检测仪，被演训部队广泛应用……</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">既然是创新，难免有风险。党支部是否敢于担当，直接影响到人心士气。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">研究室党支部书记、室主任潘玉龙在33岁那年，因创新成果多、创新能力强被破格提拔。这些年，他把工作重心更多放在培育官兵创新能力上，大力纠治脱离战斗力、课题挂名等不良科研习气，使全室求实创新、敢于担当的科研导向愈发鲜明。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">那年，该室受命执行某伪装检测任务。为尽可能获取真实数据，课题组准备申请启用无人机进行空中全方位检测。当时，任务地域气候条件恶劣，飞行风险极大。一班人多次研究后表示：数据不真实，项目必然有缺憾。为战斗力而飞，责任我们担！</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">随着无人机一次次起降，一组组检测数据被精准收集。20余天后，他们高标准完成任务。</p><p style=\"text-align:justify;box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">从幕后到前台，从空中到地面，从荒漠到森林……近年来，在党支部带领下，该室官兵一次次攻坚克难，推出一项项重大科研创新成果，使部队战场生存能力不断攀升。</p><p><br/></p>', '1', '1', 'http://localhost:8000/upload/main/1470711284378.jpg');
INSERT INTO `ac_content` VALUES ('1470711388652', '2016-08-09', '2016-08-09', '技术前沿', '钱晓虎', '陆军航空兵自主研制专用空地导弹', '<p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><strong style=\"box-sizing: border-box;\">从引进装备到自主创新，从辅助支援到主战突击，从集中使用到体系成军，陆军航空兵组建30年来，紧跟陆军建设步伐，有力支撑了新型陆军“机动作战、立体攻防”的战略转型要求——</strong></p><p style=\"box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><strong style=\"box-sizing: border-box;\">空中铁骑：助推陆军转型新飞跃</strong></p><p style=\"box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><strong style=\"box-sizing: border-box;\"><img src=\"http://localhost:8000/upload/../upload/image/20160809/1470711436309060712.jpg\" title=\"1470711436309060712.jpg\" alt=\"陆军航空兵.jpg\" width=\"421\" height=\"236\" style=\"width: 421px; height: 236px;\"/></strong></p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">本报讯 记者钱晓虎、通讯员胡宇报道：盛夏，雪山脚下。全副武装的两型国产直升机，经过长距离机动，出现在高原训练场。随着一声令下，导弹、火箭弹如离弦之箭，向“敌”发起攻击……国产武装直升机高海拔作战效能检验取得成功，是陆军航空兵组建30年来，紧跟陆军建设步伐，强力推动陆军转型发展的一个缩影。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">30年前，陆航部队组建之初，仅有转隶接收的几十架老旧直升机。为在短时间内提升陆航部队遂行多样化军事任务能力，我军不得不引进一批装备，集中力量建设有限的几支陆航部队。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">负重起飞的陆航人深知，只有依靠自己的力量打造陆军的空中铁骑，才能在关键时候不受制于人。他们知难而进，一方面集中力量发展专用武装直升机，攻克诸多技术难关，成功研制具有自主知识产权的新型发动机；另一方面，在国产直升机平台上，成功探索出一条现役装备改进挖潜的路子，大胆实施多次重大改进改型，满足了陆航部队对不同功能武装直升机的作战使用需要。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">工欲善其事，必先利其器。在机载武器发展过程中，陆航人走出了一条适应性改型、专用化研制和系列化发展的递进上升之路，研制出具有我军特色的空地、空空系列武器装备。他们将地面反坦克导弹移植到空中，取得经验后又自主研制出专用空地导弹。机载火箭弹采用多种口径和战斗部，具备打击多种目标能力。</p><p style=\"text-align:justify;box-sizing: border-box; margin: 0px 3px 15px; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">从引进装备到自主创新，从辅助支援到主战突击，从集中使用到体系成军，今天的陆军航空兵，装备规模大幅扩充、体系结构不断优化、作战效能显著提升、保障能力全面增强，已形成以二代装备为主体、三代装备为骨干、综合电子信息系统为依托的装备体系，武装型、侦察型、运输型、救援型等不同功能装备型谱得到全面发展，基于信息系统的体系作战能力得到全面强化。随着陆航装备规模的不断扩充，陆军航空兵已成陆军各集团军的“制式标配”。陆航战鹰越来越多地出现在跨区对抗、中外联演和抢险救灾等行动中，成为推动陆军部队实现“机动作战、立体攻防”战略转型的重要力量。</p><p><br/></p>', '1', '1', 'http://localhost:8000/upload/main/1470711440253.jpg');
INSERT INTO `ac_content` VALUES ('1470711485129', '2016-08-09', '2016-08-09', '技术前沿', '中国军网', '中国空军多型主战飞机赴南海战斗巡航', '<p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><img src=\"http://localhost:8000/upload/../upload/image/20160809/1470711553289019819.jpg\" title=\"1470711553289019819.jpg\" alt=\"空军飞机.jpg\" width=\"415\" height=\"264\" style=\"width: 415px; height: 264px;\"/></p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">中国军网－中国空军网广州8月6日电 中国空军新闻发言人申进科空军大校6日发布消息：中国空军组织轰-6K、苏-30等多型战机飞赴南海，对南沙岛礁和黄岩岛附近空域实施战斗巡航，推动海上方向实战化训练深入发展，提升应对各种安全威胁的实战能力。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">申进科介绍，中国空军组织轰炸机、歼击机、预警机、侦察机和空中加油机等多型飞机，从多个机场起飞，遂行此次南海战斗巡航任务，构建起海上制空、突防突击和支援保障力量为一体的作战体系。期间，中国空军苏-30战机2次实施海上空中加油。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">中国空军此次赴南海战斗巡航，突出复杂电磁环境下作战体系运用，以侦察预警、对抗空战和岛礁巡航等为主要样式组织行动，达成了战斗巡航目的。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">申进科说，中国空军战略转型正处在由量变积累到质变跨越的关键时期，主建不能忘战。空军组织常态化南海战斗巡航，练战术战法，砺血性胆气，推动海上方向实战化训练深入发展，提升应对各种安全威胁的实战能力，捍卫国家主权、安全和海洋权益。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\">申进科表示，走过67年光辉历程的中国空军，已成长为多兵种、多机种构成的现代化战略性军种，是捍卫国家主权和民族尊严、维护国家空天安全和发展利益的重要力量。空军官兵把“主建不能忘战”贯彻落实到每时每刻、每个战位，时刻不忘练兵备战、能打胜仗这个初心，紧贴使命任务、作战对手和战场环境强化实战化训练，不断提升打赢能力，维护国家空天安全。</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; padding: 0px 20px 0px 0px; text-indent: 2em; font-size: 1rem; line-height: 2rem; overflow: hidden; color: rgb(51, 51, 51); font-family: &#39;Segoe UI&#39;, &#39;Lucida Grande&#39;, Helvetica, Arial, &#39;Microsoft YaHei&#39;, FreeSans, Arimo, &#39;Droid Sans&#39;, &#39;wenquanyi micro hei&#39;, &#39;Hiragino Sans GB&#39;, &#39;Hiragino Sans GB W3&#39;, Arial, sans-serif; white-space: normal;\"><img src=\"http://localhost:8000/upload/../upload/image/20160809/1470711584940031080.jpg\" title=\"1470711584940031080.jpg\" alt=\"空军飞机2.jpg\" width=\"399\" height=\"240\" style=\"width: 399px; height: 240px;\"/></p><p><br/></p>', '1', '1', 'http://localhost:8000/upload/main/1470711533570.jpg');

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
-- Records of ec_group
-- ----------------------------
INSERT INTO `ec_group` VALUES ('1', '设计组', '1', '2', '1000', '.jpg/.jpeg/.png/.bmp', '1', '1', '1');
INSERT INTO `ec_group` VALUES ('2', '产品组', '7', '2048', '2000', '.jpg/.jpeg/.png/.bmp', '1', '1', '1');
INSERT INTO `ec_group` VALUES ('3', '销售组', '8', '2048', '5000', '.jpg/.jpeg/.png/.bmp', '1', '1', '0');
INSERT INTO `ec_group` VALUES ('9', '投稿者', '10', '1024', '1024', '.jpg/.jpeg/.png/.bmp', '1', '1', '1');

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
-- Records of ec_log
-- ----------------------------
INSERT INTO `ec_log` VALUES ('1', '3', '2013-08-18 21:34:51', '192.168.0.1', null, null, null, 'amdin');
INSERT INTO `ec_log` VALUES ('2', '3', '2013-08-18 21:39:47', '192.168.0.1', null, null, null, 'fuxin');
INSERT INTO `ec_log` VALUES ('3', '2', '2013-08-19 21:43:04', null, null, null, null, 'fuxin');
INSERT INTO `ec_log` VALUES ('4', '1', '2013-08-19 21:43:15', null, null, null, null, 'moocss');
INSERT INTO `ec_log` VALUES ('5', '3', '2013-08-20 23:54:04', '127.0.0.1', null, '添加用户组操作', '添加的 : id=null;name=投稿者', 'fuxin');
INSERT INTO `ec_log` VALUES ('6', '1', '2016-08-02 10:11:21', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('7', '1', '2016-08-02 10:56:01', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('8', '2', '2016-08-02 15:03:35', '127.0.0.1', null, '登录失败！', '登录密码：sysadmin用户名：1', null);
INSERT INTO `ec_log` VALUES ('9', '2', '2016-08-02 15:03:43', '127.0.0.1', null, '登录失败！', '登录密码：sysadmin用户名：1', null);
INSERT INTO `ec_log` VALUES ('10', '1', '2016-08-02 15:03:55', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('11', '2', '2016-08-02 16:26:13', '127.0.0.1', null, '登录失败！', '登录密码：fuxin用户名：123456', null);
INSERT INTO `ec_log` VALUES ('12', '2', '2016-08-02 16:26:20', '127.0.0.1', null, '登录失败！', '登录密码：sysadmin用户名：1', null);
INSERT INTO `ec_log` VALUES ('13', '1', '2016-08-02 16:26:33', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('14', '1', '2016-08-03 16:40:47', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('15', '1', '2016-08-03 17:49:02', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('16', '1', '2016-08-03 17:50:56', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('17', '1', '2016-08-03 17:52:55', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('18', '1', '2016-08-03 18:01:18', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('19', '1', '2016-08-03 18:03:47', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('20', '1', '2016-08-03 19:07:11', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('21', '2', '2016-08-03 19:12:38', '127.0.0.1', null, '登录失败！', '登录密码：fuxin用户名：123456', null);
INSERT INTO `ec_log` VALUES ('22', '1', '2016-08-03 19:12:43', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('23', '1', '2016-08-03 19:16:06', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('24', '1', '2016-08-03 19:21:22', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('25', '1', '2016-08-03 19:47:01', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('26', '1', '2016-08-03 20:05:41', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('27', '1', '2016-08-04 10:57:15', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('28', '1', '2016-08-04 10:57:42', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('29', '1', '2016-08-04 18:58:09', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('30', '1', '2016-08-04 19:01:23', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('31', '1', '2016-08-04 20:36:52', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('32', '2', '2016-08-04 21:02:01', '127.0.0.1', null, '登录失败！', '登录密码：fuxin用户名：123456', null);
INSERT INTO `ec_log` VALUES ('33', '1', '2016-08-04 21:02:08', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('34', '1', '2016-08-05 19:06:40', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('35', '2', '2016-08-05 21:51:06', '127.0.0.1', null, '登录失败！', '登录密码：fuxin用户名：123456', null);
INSERT INTO `ec_log` VALUES ('36', '1', '2016-08-05 21:51:13', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('37', '1', '2016-08-07 12:40:04', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('38', '1', '2016-08-07 12:49:21', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('39', '1', '2016-08-07 13:00:20', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('40', '2', '2016-08-07 13:10:39', '127.0.0.1', null, '登录失败！', '登录密码：fuxin用户名：123456', null);
INSERT INTO `ec_log` VALUES ('41', '1', '2016-08-07 13:10:45', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('42', '1', '2016-08-08 11:09:20', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('43', '1', '2016-08-08 11:21:26', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('44', '1', '2016-08-08 11:23:27', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('45', '1', '2016-08-08 11:25:31', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('46', '1', '2016-08-09 14:50:27', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('47', '1', '2016-08-15 10:48:00', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('48', '1', '2016-08-15 10:49:26', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('49', '1', '2016-08-15 10:51:22', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('50', '1', '2016-08-15 10:52:44', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('51', '1', '2016-08-15 10:53:48', '127.0.0.1', null, '登录成功！', null, 'fuxin');
INSERT INTO `ec_log` VALUES ('52', '1', '2016-08-15 10:55:41', '127.0.0.1', null, '登录成功！', null, 'fuxin');

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
-- Records of ec_message
-- ----------------------------

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
-- Records of ec_message_receiver
-- ----------------------------

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
-- Records of ec_role
-- ----------------------------
INSERT INTO `ec_role` VALUES ('1', '管理员', '1', '1', null);
INSERT INTO `ec_role` VALUES ('2', '发表者', '1', '0', null);
INSERT INTO `ec_role` VALUES ('3', '订阅者', '1', '0', null);

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
-- Records of ec_user
-- ----------------------------
INSERT INTO `ec_user` VALUES ('2', '1', 'fuxin', 'e10adc3949ba59abbe56e057f20f883e', 'moocss@163.com', '2013-08-20 15:52:29', '127.0.0.1', null, '127.0.0.1', '0', '0', '0', null, '0', '0', '0', '0');
INSERT INTO `ec_user` VALUES ('4', '3', 'zhangguang', '7fa8282ad93047a4d6fe6111c93b308a', 'zhangguang@163.com', '2013-07-21 13:58:08', '127.0.0.1', null, '127.0.0.1', '0', '0', '0', null, '0', '0', '0', '0');
INSERT INTO `ec_user` VALUES ('6', '2', 'admin', '14e1b600b1fd579f47433b88e8d85291', 'admin@163.com', '2013-08-17 08:52:31', '127.0.0.1', null, '127.0.0.1', '0', '0', '0', null, '0', '0', '0', '0');

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
-- Records of ec_user_ext
-- ----------------------------
INSERT INTO `ec_user_ext` VALUES ('2', '2', '付鑫', '1', '1984-10-11', '1234', '北京,北京', '1234', '1234', '1234', '134', null, null);
INSERT INTO `ec_user_ext` VALUES ('4', '4', '张广', '0', '2001-10-19', '123456', '内蒙古', '123456', '123456', '123456', '123456', null, null);
INSERT INTO `ec_user_ext` VALUES ('6', '6', 'admin', '2', '1234', '1234', '1234', '1234', '1234', '1234', '1234', null, null);

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
-- Records of org_attachment
-- ----------------------------

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
-- Records of org_basic_cert
-- ----------------------------

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
-- Records of org_basic_info
-- ----------------------------

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
-- Records of org_ent_info
-- ----------------------------

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
-- Records of org_gov_info
-- ----------------------------

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
-- Records of org_leg_awrards
-- ----------------------------

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
-- Records of org_leg_branches
-- ----------------------------

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
-- Records of org_leg_info
-- ----------------------------

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
-- Records of org_leg_proj
-- ----------------------------

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
-- Records of org_supply_demand
-- ----------------------------

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
-- Records of user_basic_info
-- ----------------------------

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
-- Records of user_engineer_academic_achievement
-- ----------------------------
INSERT INTO `user_engineer_academic_achievement` VALUES ('0', '-2332476250345792669', '2016-08-17', '');

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
-- Records of user_engineer_certificate
-- ----------------------------

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
-- Records of user_engineer_important_work
-- ----------------------------

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
-- Records of user_engineer_info
-- ----------------------------

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
-- Records of user_engineer_worklife
-- ----------------------------

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
-- Records of user_experter_info
-- ----------------------------

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
-- Records of user_experter_proj_info
-- ----------------------------
INSERT INTO `user_experter_proj_info` VALUES ('0', '0', '2016-08-17', '2016-08-17', '', '', '');
INSERT INTO `user_experter_proj_info` VALUES ('0', '0', '2016-08-17', '2016-08-17', '', '', '');
INSERT INTO `user_experter_proj_info` VALUES ('0', '0', '2016-08-17', '2016-08-17', '', '', '');

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
-- Records of user_login_info
-- ----------------------------
INSERT INTO `user_login_info` VALUES ('123', '312', '3123', '2016-08-27', '2016-08-14', '123', '3123', '2');
INSERT INTO `user_login_info` VALUES ('456', '213', '312', '2016-08-02', '2016-08-26', '3123', '3213', '1');

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
-- Records of user_rewards
-- ----------------------------

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

-- ----------------------------
-- Records of user_role_info
-- ----------------------------
INSERT INTO `user_role_info` VALUES ('123', '2', '1', '1', '2', '2', '1', '1', '1', '2016-08-10', '2016-08-17', '2');
INSERT INTO `user_role_info` VALUES ('456', '1', '2', '2', '1', '1', '2', '2', '1', '2016-08-03', '2016-08-19', '1');