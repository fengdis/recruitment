/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : recruitment_system

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2017-04-27 17:01:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_company
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `introduce` text,
  `content` text,
  `extend` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES ('1', '百度', '北京', '百度（纳斯达克：BIDU），全球最大的中文搜索引擎、最大的中文网站。1999年底,身在美国硅谷的李彦宏看到了中国互联网及中文搜索引擎服务的巨大发展潜力，抱着技术改变世界的梦想，他毅然辞掉硅谷的高薪工作，携搜索引擎专利技术，于 2000年1月1日在中关村创建了百度公司', '<p><img src=\"http://localhost:8080/zhaopin/resource/1493110472946.jpg\" width=\"300\" height=\"180\" alt=\"\" /><br /></p><p></p><dl class=\"basicInfo-block basicInfo-left\" style=\"margin: 0px; padding: 0px; width: 395px; float: left; color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif;\"><dt class=\"basicInfo-item name\" style=\"margin: 0px; padding: 0px 5px 0px 12px; line-height: 26px; float: left; width: 90px; font-weight: 700; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; word-wrap: normal; color: rgb(153, 153, 153);\">公司名称</dt><dd class=\"basicInfo-item value\" style=\"margin: 0px; padding: 0px; line-height: 26px; float: left; zoom: 1; width: 285px; position: relative;\">百度</dd><dt class=\"basicInfo-item name\" style=\"margin: 0px; padding: 0px 5px 0px 12px; line-height: 26px; float: left; width: 90px; font-weight: 700; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; word-wrap: normal; color: rgb(153, 153, 153);\">外文名称</dt><dd class=\"basicInfo-item value\" style=\"margin: 0px; padding: 0px; line-height: 26px; float: left; zoom: 1; width: 285px; position: relative;\">Baidu</dd><dt class=\"basicInfo-item name\" style=\"margin: 0px; padding: 0px 5px 0px 12px; line-height: 26px; float: left; width: 90px; font-weight: 700; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; word-wrap: normal; color: rgb(153, 153, 153);\">总部地点</dt><dd class=\"basicInfo-item value\" style=\"margin: 0px; padding: 0px; line-height: 26px; float: left; zoom: 1; width: 285px; position: relative;\">中国北京<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E6%B5%B7%E6%B7%80%E5%8C%BA\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">海淀区</a>上地十街10号<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E7%99%BE%E5%BA%A6%E5%A4%A7%E5%8E%A6\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">百度大厦</a></dd><dt class=\"basicInfo-item name\" style=\"margin: 0px; padding: 0px 5px 0px 12px; line-height: 26px; float: left; width: 90px; font-weight: 700; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; word-wrap: normal; color: rgb(153, 153, 153);\">成立时间</dt><dd class=\"basicInfo-item value\" style=\"margin: 0px; padding: 0px; line-height: 26px; float: left; zoom: 1; width: 285px; position: relative;\"><a target=\"_blank\" href=\"http://baike.baidu.com/item/2000%E5%B9%B4/56589\" data-lemmaid=\"56589\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">2000年</a>1月</dd><dt class=\"basicInfo-item name\" style=\"margin: 0px; padding: 0px 5px 0px 12px; line-height: 26px; float: left; width: 90px; font-weight: 700; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; word-wrap: normal; color: rgb(153, 153, 153);\">经营范围</dt><dd class=\"basicInfo-item value\" style=\"margin: 0px; padding: 0px; line-height: 26px; float: left; zoom: 1; width: 285px; position: relative;\"><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E7%BD%91%E7%BB%9C%E4%BF%A1%E6%81%AF%E6%9C%8D%E5%8A%A1\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">网络信息服务</a></dd></dl><dl class=\"basicInfo-block basicInfo-right\" style=\"margin: 0px; padding: 0px; width: 395px; float: left; color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif;\"><dt class=\"basicInfo-item name\" style=\"margin: 0px; padding: 0px 5px 0px 12px; line-height: 26px; float: left; width: 90px; font-weight: 700; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; word-wrap: normal; color: rgb(153, 153, 153);\">公司性质</dt><dd class=\"basicInfo-item value\" style=\"margin: 0px; padding: 0px; line-height: 26px; float: left; zoom: 1; width: 285px; position: relative;\"><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E4%BA%92%E8%81%94%E7%BD%91\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">互联网</a>核心技术的技术型<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E5%85%AC%E5%8F%B8\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">公司</a></dd><dt class=\"basicInfo-item name\" style=\"margin: 0px; padding: 0px 5px 0px 12px; line-height: 26px; float: left; width: 90px; font-weight: 700; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; word-wrap: normal; color: rgb(153, 153, 153);\">公司口号</dt><dd class=\"basicInfo-item value\" style=\"margin: 0px; padding: 0px; line-height: 26px; float: left; zoom: 1; width: 285px; position: relative;\">百度一下，你就知道</dd><dt class=\"basicInfo-item name\" style=\"margin: 0px; padding: 0px 5px 0px 12px; line-height: 26px; float: left; width: 90px; font-weight: 700; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; word-wrap: normal; color: rgb(153, 153, 153);\">年营业额</dt><dd class=\"basicInfo-item value\" style=\"margin: 0px; padding: 0px; line-height: 26px; float: left; zoom: 1; width: 285px; position: relative;\">705.49亿元（2016年）</dd><dt class=\"basicInfo-item name\" style=\"margin: 0px; padding: 0px 5px 0px 12px; line-height: 26px; float: left; width: 90px; font-weight: 700; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; word-wrap: normal; color: rgb(153, 153, 153);\">员工数</dt><dd class=\"basicInfo-item value\" style=\"margin: 0px; padding: 0px; line-height: 26px; float: left; zoom: 1; width: 285px; position: relative;\">约40000人（<a target=\"_blank\" href=\"http://baike.baidu.com/item/2016%E5%B9%B4\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">2016年</a>）</dd><dt class=\"basicInfo-item name\" style=\"margin: 0px; padding: 0px 5px 0px 12px; line-height: 26px; float: left; width: 90px; font-weight: 700; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; word-wrap: normal; color: rgb(153, 153, 153);\">董事长</dt><dd class=\"basicInfo-item value\" style=\"margin: 0px; padding: 0px; line-height: 26px; float: left; zoom: 1; width: 285px; position: relative;\"><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E6%9D%8E%E5%BD%A6%E5%AE%8F\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">李彦宏</a></dd><dt class=\"basicInfo-item name\" style=\"margin: 0px; padding: 0px 5px 0px 12px; line-height: 26px; float: left; width: 90px; font-weight: 700; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; word-wrap: normal; color: rgb(153, 153, 153);\">官&nbsp;&nbsp;&nbsp;&nbsp;网</dt><dd class=\"basicInfo-item value\" style=\"margin: 0px; padding: 0px; line-height: 26px; float: left; zoom: 1; width: 285px; position: relative;\">https://www.baidu.com/</dd></dl><br /><p></p>', null);

-- ----------------------------
-- Table structure for t_consultation
-- ----------------------------
DROP TABLE IF EXISTS `t_consultation`;
CREATE TABLE `t_consultation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `addDate` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `reDate` varchar(255) DEFAULT NULL,
  `reContent` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `extend` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKCB6090DD8C409568` (`user_id`),
  CONSTRAINT `t_consultation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_simple_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_consultation
-- ----------------------------
INSERT INTO `t_consultation` VALUES ('1', null, '2017-04-10', '人才在哪？要多少钱？什么时候跳槽？怎么能招到？', '2017-04-13', '携手多家调研公司以及业内顶级数据分析师， 倾力打造【互联网职场生态白皮书】，致力于帮你解决职场中的每一个难题，发掘最优解。 没有教诲，杜绝唠叨，一切只看：这个圈子里的人，他们都怎么玩儿。', null, null);
INSERT INTO `t_consultation` VALUES ('2', null, '2017-04-20', '留言', null, null, '2', null);
INSERT INTO `t_consultation` VALUES ('3', null, '2017-04-20', 'user留言', null, null, '1', null);

-- ----------------------------
-- Table structure for t_hotel
-- ----------------------------
DROP TABLE IF EXISTS `t_hotel`;
CREATE TABLE `t_hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `content` text,
  `price` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `extend` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_hotel
-- ----------------------------
INSERT INTO `t_hotel` VALUES ('1', '北京中国大饭店', '北京 朝阳区 建国门外大街1号 ，近国际贸易中心。', '<div style=\"height: auto;\" class=\"htl_room_txt text_3l \" id=\"htlDes\"><p>1990年开业&nbsp;&nbsp;2015年装修&nbsp;&nbsp;716间房&nbsp;&nbsp;<span id=\"J_realContact\" data-real=\"电话010-65052266&nbsp;&nbsp;<a target=\'_blank\' href=\'http://my.ctrip.com/uxp/Community/CommunityAdvice.aspx?producttype=3&amp;categoryid=65\'>纠错</a>\" style=\"color:#0066cc;cursor:pointer;\">联系方式</span>　　<br /><span id=\"ctl00_MainContentPlaceHolder_hotelDetailInfo_lbDesc\" itemprop=\"description\">　　由香格里拉酒店管理集团管理的北京中国大饭店是一家豪华五星级酒店，饭店以提供无微不至的香格里拉热情好客服务和一应俱全的服务设施而著称，并被中国国家旅游局评为“中国白金五星级旅游饭店”，荣获此奖项的酒店在中国大陆地区仅有三家。<br />　　中国大饭店位于北京经济、外交及商务活动的中心地带，距离国贸地铁站仅3分钟的步行路程，距离故宫和天安门广场有15分钟车程，距离北京首都国际机场有45分钟车程。<br />　　饭店拥有宽敞舒适的客房和套房，房间内整幅落地式玻璃窗可俯瞰北京繁华地带迷人的风光。每个房间均提供免费无线网络连接和宽敞工作区。<br />　　饭店配套设施先进，拥有室内温水游泳池、健身房、壁球场、网球场及蒸汽浴室。饭店内拥有世界知名的国际名厨，多元化美食满足了各界宾客的多样需求:&nbsp;开放式厨房的咖啡苑提供京城最炫自助餐；具有世界葡萄酒收藏特色的阿丽雅餐厅经营西式烹饪风格美食；夏宫中餐厅提供精美粤菜，淮扬美味以及中国各地风味小吃；美食店为宾客提供品种繁多、质量精美的面包、糕点及饮品；可无线宽带上网的大堂酒廊是商务会晤的完美地点，品尝经典下午茶时还可欣赏到精彩管弦乐队的现场表演。</span></p></div><h2 class=\"detail_title \">酒店设施</h2><div id=\"J_htl_facilities\" class=\"htl_info_table \">    <table>        <tbody>            <tr><th>通用设施</th><td><ul class=\"facility_list\"><li title=\"免费旅游交通图(可赠送)\" data-rank=\"1\"><span class=\"green\">免费</span>旅游交通图(可赠送)</li><li title=\"有可无线上网的公共区域免费\" data-rank=\"1\">有可无线上网的公共区域 <span class=\"green\">免费</span></li><li title=\"中餐厅\" data-rank=\"1\">中餐厅</li><li title=\"西餐厅\" data-rank=\"1\">西餐厅</li><li title=\"咖啡厅\" data-rank=\"0\">咖啡厅</li><li title=\"酒吧\" data-rank=\"0\">酒吧</li><li title=\"残疾人客房\" data-rank=\"0\">残疾人客房</li><li title=\"商场\" data-rank=\"0\">商场</li><li title=\"理发美容中心\" data-rank=\"0\">理发美容中心</li><li title=\"前台贵重物品保险柜\" data-rank=\"0\">前台贵重物品保险柜</li><li title=\"自动取款机\" data-rank=\"0\">自动取款机</li><li title=\"收费停车场\" data-rank=\"1\">收费停车场</li><li title=\"大堂吧\" data-rank=\"0\">大堂吧</li><li title=\"电梯\" data-rank=\"0\">电梯</li><li title=\"中央空调\" data-rank=\"0\">中央空调</li><li title=\"所有公共及私人场所严禁吸烟\" data-rank=\"0\">所有公共及私人场所严禁吸烟</li><li title=\"暖气\" data-rank=\"0\">暖气</li><li title=\"多功能厅\" data-rank=\"0\">多功能厅</li><li title=\"公共音响系统\" data-rank=\"0\">公共音响系统</li><li title=\"非经营性客人休息区\" data-rank=\"0\">非经营性客人休息区</li><li title=\"无烟楼层\" data-rank=\"1\">无烟楼层</li><li title=\"行政楼层\" data-rank=\"0\">行政楼层</li><li title=\"行政酒廊\" data-rank=\"0\">行政酒廊</li><li title=\"公共区域闭路电视监控系统\" data-rank=\"0\">公共区域闭路电视监控系统</li></ul></td></tr><tr><th>活动设施</th><td><ul class=\"facility_list\"><li title=\"乒乓球室\" data-rank=\"0\">乒乓球室</li><li title=\"室内游泳池\" data-rank=\"1\">室内游泳池</li><li title=\"网球场\" data-rank=\"0\">网球场</li><li title=\"壁球室\" data-rank=\"0\">壁球室</li><li title=\"健身室\" data-rank=\"1\">健身室</li><li title=\"按摩室\" data-rank=\"0\">按摩室</li><li title=\"桑拿浴室\" data-rank=\"0\">桑拿浴室</li><li title=\"日光浴场\" data-rank=\"0\">日光浴场</li><li title=\"SPA\" data-rank=\"1\">SPA</li></ul></td></tr><tr><th>服务项目</th><td><ul class=\"facility_list\"><li title=\"会议厅\" data-rank=\"1\">会议厅</li><li title=\"商务中心\" data-rank=\"0\">商务中心</li><li title=\"外币兑换服务\" data-rank=\"0\">外币兑换服务</li><li title=\"旅游票务服务\" data-rank=\"0\">旅游票务服务</li><li title=\"洗衣服务\" data-rank=\"0\">洗衣服务</li><li title=\"送餐服务\" data-rank=\"0\">送餐服务</li><li title=\"医务室\" data-rank=\"0\">医务室</li><li title=\"叫车服务\" data-rank=\"0\">叫车服务</li><li title=\"邮政服务\" data-rank=\"0\">邮政服务</li><li title=\"专职行李员\" data-rank=\"0\">专职行李员</li><li title=\"行李寄存\" data-rank=\"1\">行李寄存</li><li title=\"叫醒服务\" data-rank=\"1\">叫醒服务</li><li title=\"接机服务\" data-rank=\"1\">接机服务</li><li title=\"儿童看护\" data-rank=\"0\">儿童看护</li><li title=\"租车服务\" data-rank=\"0\">租车服务</li><li title=\"礼宾服务\" data-rank=\"0\">礼宾服务</li><li title=\"干洗\" data-rank=\"0\">干洗</li><li title=\"熨衣服务\" data-rank=\"0\">熨衣服务</li><li title=\"擦鞋服务\" data-rank=\"0\">擦鞋服务</li><li title=\"秘书服务\" data-rank=\"0\">秘书服务</li><li title=\"翻译服务\" data-rank=\"0\">翻译服务</li><li title=\"婚宴服务\" data-rank=\"0\">婚宴服务</li><li title=\"管家服务\" data-rank=\"0\">管家服务</li><li title=\"24小时前台服务\" data-rank=\"1\">24小时前台服务</li><li title=\"快速办理入住/退房手续\" data-rank=\"0\">快速办理入住/退房手续</li><li title=\"专职门童\" data-rank=\"0\">专职门童</li><li title=\"信用卡结算服务\" data-rank=\"0\">信用卡结算服务</li><li title=\"24小时大堂经理\" data-rank=\"0\">24小时大堂经理</li></ul></td></tr><tr><th>客房设施</th><td><ul class=\"facility_list\"><li title=\"免费瓶装水\" data-rank=\"1\"><span class=\"green\">免费</span>瓶装水</li><li title=\"免费洗漱用品(6样以内)\" data-rank=\"1\"><span class=\"green\">免费</span>洗漱用品(6样以内)</li><li title=\"免费报纸\" data-rank=\"0\"><span class=\"green\">免费</span>报纸</li><li title=\"客房WIFI覆盖免费\" data-rank=\"0\">客房WIFI覆盖<span class=\"green\">免费</span></li><li title=\"国内长途电话\" data-rank=\"0\">国内长途电话</li><li title=\"国际长途电话\" data-rank=\"0\">国际长途电话</li><li title=\"拖鞋\" data-rank=\"0\">拖鞋</li><li title=\"雨伞\" data-rank=\"0\">雨伞</li><li title=\"书桌\" data-rank=\"0\">书桌</li><li title=\"浴室化妆放大镜\" data-rank=\"0\">浴室化妆放大镜</li><li title=\"24小时热水\" data-rank=\"1\">24小时热水</li><li title=\"电热水壶\" data-rank=\"0\">电热水壶</li><li title=\"咖啡壶/茶壶\" data-rank=\"0\">咖啡壶/茶壶</li><li title=\"迷你吧\" data-rank=\"0\">迷你吧</li><li title=\"熨衣设备\" data-rank=\"0\">熨衣设备</li><li title=\"小冰箱\" data-rank=\"0\">小冰箱</li><li title=\"浴衣\" data-rank=\"0\">浴衣</li><li title=\"多种规格电源插座\" data-rank=\"0\">多种规格电源插座</li><li title=\"110V电压插座\" data-rank=\"0\">110V电压插座</li><li title=\"浴缸\" data-rank=\"0\">浴缸</li><li title=\"独立淋浴间\" data-rank=\"0\">独立淋浴间</li><li title=\"吹风机\" data-rank=\"1\">吹风机</li><li title=\"房内保险箱\" data-rank=\"0\">房内保险箱</li><li title=\"中央空调\" data-rank=\"0\">中央空调</li><li title=\"有线频道\" data-rank=\"0\">有线频道</li><li title=\"卫星频道\" data-rank=\"0\">卫星频道</li><li title=\"液晶电视机\" data-rank=\"0\">液晶电视机</li><li title=\"iPod音乐基座\" data-rank=\"0\">iPod音乐基座</li><li title=\"咖啡机\" data-rank=\"0\">咖啡机</li><li title=\"烤面包机\" data-rank=\"0\">烤面包机</li><li title=\"烤箱\" data-rank=\"0\">烤箱</li><li title=\"炉灶\" data-rank=\"0\">炉灶</li><li title=\"用餐区\" data-rank=\"0\">用餐区</li><li title=\"厨房\" data-rank=\"0\">厨房</li><li title=\"厨房用具\" data-rank=\"0\">厨房用具</li><li title=\"更衣室\" data-rank=\"0\">更衣室</li><li title=\"微波炉\" data-rank=\"0\">微波炉</li><li title=\"衣柜/衣橱\" data-rank=\"0\">衣柜/衣橱</li><li title=\"连通房\" data-rank=\"0\">连通房</li><li title=\"闹钟\" data-rank=\"0\">闹钟</li><li title=\"针线包\" data-rank=\"0\">针线包</li><li title=\"220V电压插座\" data-rank=\"0\">220V电压插座</li><li title=\"遮光窗帘\" data-rank=\"0\">遮光窗帘</li><li title=\"手动窗帘\" data-rank=\"0\">手动窗帘</li><li title=\"坐卧两用长沙发\" data-rank=\"0\">坐卧两用长沙发</li><li title=\"备用床具\" data-rank=\"0\">备用床具</li><li title=\"床具:鸭绒被\" data-rank=\"0\">床具:鸭绒被</li><li title=\"床具:毯子或被子\" data-rank=\"0\">床具:毯子或被子</li><li title=\"唤醒服务\" data-rank=\"0\">唤醒服务</li><li title=\"语音留言\" data-rank=\"0\">语音留言</li><li title=\"欢迎礼品\" data-rank=\"0\">欢迎礼品</li><li title=\"行政酒廊\" data-rank=\"0\">行政酒廊</li><li title=\"浴室\" data-rank=\"0\">浴室</li><li title=\"城景\" data-rank=\"0\">城景</li><li title=\"花园景\" data-rank=\"0\">花园景</li><li title=\"地标景\" data-rank=\"0\">地标景</li><li title=\"传真\" data-rank=\"0\">传真</li><li title=\"洗浴间电话\" data-rank=\"0\">洗浴间电话</li><li title=\"沙发\" data-rank=\"0\">沙发</li><li title=\"DVD播放机\" data-rank=\"0\">DVD播放机</li><li title=\"开夜床\" data-rank=\"0\">开夜床</li><li title=\"电子秤\" data-rank=\"0\">电子秤</li><li title=\"房间内高速上网\" data-rank=\"0\">房间内高速上网</li><li title=\"电话\" data-rank=\"0\">电话</li><li title=\"淋浴\" data-rank=\"0\">淋浴</li></ul></td></tr><tr><td colspan=\"2\"><div class=\"facility_btn\"><a class=\"show_fold\" id=\"J_show_fold\">收起</a></div></td></tr>        </tbody>    </table></div><h2 class=\"detail_title\">酒店政策</h2><p></p><table class=\"detail_extracontent     \"><tbody><tr><th>入住和离店</th><td>入住时间：14:00以后&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;离店时间：12:00以前</td></tr><tr><th>儿童政策</th><td>酒店的家庭计划向与父母入住同一房间的12岁以下儿童提供<span class=\"text_green\">免费</span>住宿，每间房最多可住两位儿童。已登记入住的酒店客人之6岁以下儿童，在一名自费享膳的成年人陪同下，可于全日制餐厅和池畔餐厅<span class=\"text_green\">免费</span>享用自助餐（限至多两位6岁以下儿童）。额外的6岁以下儿童，或6岁以上至12岁以下的儿童，可享50%优惠。</td></tr><tr><th>膳食安排</th><td>自助早餐&nbsp;RMB&nbsp;207.00</td></tr><tr><th>宠物</th><td>不可携带宠物。</td></tr>        <tr><th>接受信用卡</th><td><div class=\"detail_extracontent layoutfix\"><span data-role=\"jmp\" data-params=\"{\'options\':{\'type\':\'jmp_table\',\'template\':\'$jmp_table\',\'content\':{\'txt\':\'<div class=\" jmp_bd=\"\" --=\"\" master=\"\" div=\"\" classnames=\"\" :=\"\" boxtype=\"\" jmp_table=\"\" css=\"\" maxwidth=\"\" :500=\"\" class=\"card_master\"></span><span data-role=\"jmp\" data-params=\"{\'options\':{\'type\':\'jmp_table\',\'template\':\'$jmp_table\',\'content\':{\'txt\':\'<div class=\" jmp_bd=\"\" --=\"\" visa=\"\" classnames=\"\" :=\"\" boxtype=\"\" jmp_table=\"\" css=\"\" maxwidth=\"\" :500=\"\" class=\"card_visa\"></span><span data-role=\"jmp\" data-params=\"{\'options\':{\'type\':\'jmp_table\',\'template\':\'$jmp_table\',\'content\':{\'txt\':\'<div class=\" jmp_bd=\"\" --=\"\" amex=\"\" classnames=\"\" :=\"\" boxtype=\"\" jmp_table=\"\" css=\"\" maxwidth=\"\" :500=\"\" class=\"card_amex\"></span><span data-role=\"jmp\" data-params=\"{\'options\':{\'type\':\'jmp_table\',\'template\':\'$jmp_table\',\'content\':{\'txt\':\'<div class=\" jmp_bd=\"\" --=\"\" diners=\"\" club=\"\" classnames=\"\" :=\"\" boxtype=\"\" jmp_table=\"\" css=\"\" maxwidth=\"\" :500=\"\" class=\"card_diners\"></span><span data-role=\"jmp\" data-params=\"{\'options\':{\'type\':\'jmp_table\',\'template\':\'$jmp_table\',\'content\':{\'txt\':\'<div class=\" jmp_bd=\"\" --=\"\" jcb=\"\" classnames=\"\" :=\"\" boxtype=\"\" jmp_table=\"\" css=\"\" maxwidth=\"\" :500=\"\" class=\"card_jcb\"></span><span data-role=\"jmp\" data-params=\"{\'options\':{\'type\':\'jmp_table\',\'template\':\'$jmp_table\',\'content\':{\'txt\':\'<div class=\" jmp_bd=\"\" classnames=\"\" :=\"\" boxtype=\"\" jmp_table=\"\" css=\"\" maxwidth=\"\" :500=\"\" class=\"card_unionpay\"></span></div></td></tr></tbody></table><p></p>', '2500起', '五星级', null);

-- ----------------------------
-- Table structure for t_position
-- ----------------------------
DROP TABLE IF EXISTS `t_position`;
CREATE TABLE `t_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `area` varchar(255) DEFAULT NULL,
  `salary` varchar(255) NOT NULL,
  `addDate` varchar(255) DEFAULT NULL,
  `positionCount` int(11) NOT NULL,
  `positionType` varchar(255) DEFAULT NULL,
  `content` text,
  `introduce` text,
  `company_id` int(11) DEFAULT NULL,
  `sysType` varchar(255) DEFAULT NULL,
  `applyCount` int(11) DEFAULT '0',
  `extend` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK7F60BD377E91C676` (`company_id`),
  CONSTRAINT `t_position_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_position
-- ----------------------------
INSERT INTO `t_position` VALUES ('1', 'Java开发工程师', '北京', '10000-15000元/月', '2017-04-13', '1', '地图内容生态部_国际化地图Android研发工程师', '<p style=\"margin: 2em 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; font-size: 13px;\">-本科或以上学历，计算机软件相关专业</p><p style=\"margin: 2em 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; font-size: 13px;\">-熟悉Andorid程序设计，熟悉Android平台UI设计，熟悉常用布局</p><p style=\"margin: 2em 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; font-size: 13px;\">-理解Android OS系统体系结构、framework、以及底层库</p><p style=\"margin: 2em 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; font-size: 13px;\">-理解面向对象设计的基本原则，熟悉常用的设计模式</p><p style=\"margin: 2em 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; font-size: 13px;\">-熟悉Java程序设计，熟悉C++语言加分</p><p style=\"margin: 2em 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; font-size: 13px;\">-有地图、LBS、O2O产品经验加分</p><p style=\"margin: 2em 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; font-size: 13px;\">-具备良好的分析、解决问题的能力；接受能力强，能很快学习和掌握新技术</p><p style=\"margin: 2em 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; font-size: 13px;\">-具备良好的责任心、上进心、执行力以及良好的沟通能力和团队合作能力，熟悉Scrum等敏捷开发模式者优先</p>', '工作职责:  -负责Android手机平台应用软件的设计和开发  -参与手机地图国际化相关业务研发  -通过不断的技术研究和创新，推动优化产品功能和用户体验', '1', '社会招聘', '1', null);

-- ----------------------------
-- Table structure for t_position_user
-- ----------------------------
DROP TABLE IF EXISTS `t_position_user`;
CREATE TABLE `t_position_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applyDate` varchar(255) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `reDate` varchar(255) DEFAULT NULL,
  `interviewArea` varchar(255) DEFAULT NULL,
  `interviewDate` varchar(255) DEFAULT NULL,
  `extend` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK6FE095B1D46558` (`position_id`),
  KEY `FK6FE0958C409568` (`user_id`),
  CONSTRAINT `t_position_user_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `t_position` (`id`),
  CONSTRAINT `t_position_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `t_simple_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_position_user
-- ----------------------------
INSERT INTO `t_position_user` VALUES ('2', '2017-04-18', '1', '已投简历', '2', '1', '2017-04-20', '额', '2017-04-19', null);
INSERT INTO `t_position_user` VALUES ('4', '2017-04-19', '1', '已投简历', '2', '1', '2017-04-20', '天津', '2017-04-20', null);
INSERT INTO `t_position_user` VALUES ('5', '2017-04-19', '1', '用户取消', '2', '1', null, null, null, null);
INSERT INTO `t_position_user` VALUES ('7', '2017-04-20', '1', '通知面试', '2', '1', null, null, null, null);
INSERT INTO `t_position_user` VALUES ('8', '2017-04-20', '1', '已投简历', '1', '1', null, null, null, null);
INSERT INTO `t_position_user` VALUES ('9', '2017-04-20', '1', '待投简历', '2', '1', null, null, null, null);

-- ----------------------------
-- Table structure for t_resume
-- ----------------------------
DROP TABLE IF EXISTS `t_resume`;
CREATE TABLE `t_resume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `extend` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `t_resume_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_simple_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resume
-- ----------------------------
INSERT INTO `t_resume` VALUES ('1', 'aaaaaa', '1', null);
INSERT INTO `t_resume` VALUES ('4', 'hhhhh', '1', null);
INSERT INTO `t_resume` VALUES ('5', 'aaaa', '1', null);
INSERT INTO `t_resume` VALUES ('7', 'wwwww', '1', null);

-- ----------------------------
-- Table structure for t_simple_user
-- ----------------------------
DROP TABLE IF EXISTS `t_simple_user`;
CREATE TABLE `t_simple_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK99BA02ED78313856` (`userId`),
  CONSTRAINT `t_simple_user_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_simple_user
-- ----------------------------
INSERT INTO `t_simple_user` VALUES ('1', '2');
INSERT INTO `t_simple_user` VALUES ('2', '4');

-- ----------------------------
-- Table structure for t_sysnews
-- ----------------------------
DROP TABLE IF EXISTS `t_sysnews`;
CREATE TABLE `t_sysnews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` longtext,
  `extend` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sysnews
-- ----------------------------
INSERT INTO `t_sysnews` VALUES ('1', '独家出品|第一份资本寒冬下的薪资与招聘数据报告', '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, SimSun, Arial, sans-serif; font-size: 14px;\">回望2015年下半年，“资本寒冬”就已经不断在一部分人的言论里来回翻炒。</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, SimSun, Arial, sans-serif; font-size: 14px;\" /><span style=\"color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, SimSun, Arial, sans-serif; font-size: 14px;\">可直到此时，我们仍被各方声音所干扰，不确信的来源使我们对信息缺乏准确的判断。</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, SimSun, Arial, sans-serif; font-size: 14px;\" /><span style=\"color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft Yahei&quot;, SimSun, Arial, sans-serif; font-size: 14px;\">“资本寒冬”是否已经浸入到创业公司的骨髓？程度有多深？对我们的工作又有多少影响？</span><br />', null);

-- ----------------------------
-- Table structure for t_systips
-- ----------------------------
DROP TABLE IF EXISTS `t_systips`;
CREATE TABLE `t_systips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `extend` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_systips
-- ----------------------------
INSERT INTO `t_systips` VALUES ('3', '2017互联网行业的整体薪酬是看涨还是看跌？', '所谓信息时代，即以资讯取胜的时代，立志于互联网行业的广大青年，除了努力提高自身技能外，还要随时关注行业现状，了解行业需求，尤其是行业薪资变化，这样才能在求职过程中底气十足。\r\n2016 已经过去大半，这半年来，互联网行业的整体薪酬是看涨还是看跌？最近哪类职位最好找工作？产品经理的市场价是多少？程序员是去初创公司还是去上市公司工资更高？\r\n这份报告全方位为你解答 2016 互联网人才的薪资问题', null);

-- ----------------------------
-- Table structure for t_systype
-- ----------------------------
DROP TABLE IF EXISTS `t_systype`;
CREATE TABLE `t_systype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` longtext,
  `addDate` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `extend` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_systype
-- ----------------------------
INSERT INTO `t_systype` VALUES ('1', '教育事业部_策略产品设计师, 2017-04-13, 社会招聘, 2017-04-13, 2017-04-13', '<p style=\"margin: 2em 0px; color: rgb(102, 102, 102); font-family: \" microsoft=\"\" yahei=\"\" font-size:=\"\" 13px=\"\">-对文库流量负责，根据部门战略发展要求，全面负责百度文库阿拉丁方向的工作，并制定搜索引擎优化策略</p><p style=\"margin: 2em 0px; color: rgb(102, 102, 102); font-family: \" microsoft=\"\" yahei=\"\" font-size:=\"\" 13px=\"\">-负责文库阿拉丁的用户需求分析、制定需求、项目推动、策略效果分析及后续提升优化，并为内容建设提供后续建设方向建议</p><p style=\"margin: 2em 0px; color: rgb(102, 102, 102); font-family: \" microsoft=\"\" yahei=\"\" font-size:=\"\" 13px=\"\">-能够独立完成并跟进SEO需求方案，定期跟踪、分析、总结SEO效果，提出合理的改进意见和报告</p><p style=\"margin: 2em 0px; color: rgb(102, 102, 102); font-family: \" microsoft=\"\" yahei=\"\" font-size:=\"\" 13px=\"\">-研究和监控竞品站点SEO做法，并提出有效调整方案</p><p style=\"margin: 2em 0px; color: rgb(102, 102, 102); font-family: \" microsoft=\"\" yahei=\"\" font-size:=\"\" 13px=\"\">-培训部门SEO基础知识，普及SEO相关常识</p>', '2017-04-14', '社会招聘', null);
INSERT INTO `t_systype` VALUES ('2', '1', '1', '2017-04-14', '校园招聘', null);
INSERT INTO `t_systype` VALUES ('3', '1', '1', '2017-04-14', '内部推荐', null);
INSERT INTO `t_systype` VALUES ('6', '222', '1222', '2017-04-14', '校园招聘', null);
INSERT INTO `t_systype` VALUES ('9', '1', '1', '2017-04-14', '内部推荐', null);
INSERT INTO `t_systype` VALUES ('10', 'UI设计师 ', '<p style=\"outline: 0px; margin: 1em 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, SimSun, Arial, &quot;Helvetica Neue&quot;, Helvetica; font-size: 14px;\">1、根据产品需求，对产品具体功能的界面结构、操作流程等做出设计；<br style=\"outline: 0px;\" />2、负责项目中各种交互界面、图标、LOGO、按钮等相关元素的设计与制作；<br style=\"outline: 0px;\" />3、根据各种用户群体，提出构思新颖、有高度吸引力的创意设计。<br style=\"outline: 0px;\" />4、对页面进行优化，使用户操作更趋于人性化。<br style=\"outline: 0px;\" />5、维护现有的应用产品。</p>', '2017-04-14', '社会招聘', null);

-- ----------------------------
-- Table structure for t_sysuser
-- ----------------------------
DROP TABLE IF EXISTS `t_sysuser`;
CREATE TABLE `t_sysuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `t_sysuser_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sysuser
-- ----------------------------
INSERT INTO `t_sysuser` VALUES ('1', '管理员', '1');
INSERT INTO `t_sysuser` VALUES ('2', '员工', '3');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `userPassword` varchar(150) NOT NULL,
  `userGender` int(11) NOT NULL,
  `userPhone` varchar(255) NOT NULL,
  `userEmail` varchar(50) DEFAULT NULL,
  `userAddress` varchar(100) DEFAULT NULL,
  `userBirth` varchar(10) DEFAULT NULL,
  `userJob` varchar(255) NOT NULL,
  `extend` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userID` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '系统管理员', 'E10ADC3949BA59ABBE56E057F20F883E', '1', '18369658735', '', '', '', '程序员', null);
INSERT INTO `t_user` VALUES ('2', 'user', 'user', 'E10ADC3949BA59ABBE56E057F20F883E', '0', '11111111111', '', '', '', '测试', null);
INSERT INTO `t_user` VALUES ('3', 'test', '测试', 'E10ADC3949BA59ABBE56E057F20F883E', '0', '11111111111', '', '', '', '测试员', null);
INSERT INTO `t_user` VALUES ('4', 'ceshi', 'ceshi', 'E10ADC3949BA59ABBE56E057F20F883E', '0', '11111111111', '', '', '', '测试', null);

-- ----------------------------
-- Table structure for t_user_log
-- ----------------------------
DROP TABLE IF EXISTS `t_user_log`;
CREATE TABLE `t_user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` varchar(255) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amounts` int(11) NOT NULL,
  `extend` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKA6CF543BB5505151` (`user_id`),
  KEY `FKA6CF543BB23AF9F5` (`company_id`),
  KEY `position_id` (`position_id`),
  CONSTRAINT `t_user_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_simple_user` (`id`),
  CONSTRAINT `t_user_log_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_user_log_ibfk_3` FOREIGN KEY (`position_id`) REFERENCES `t_position` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_log
-- ----------------------------
INSERT INTO `t_user_log` VALUES ('1', '2017-04-20', '70', '1', null, '2', '0', null);
INSERT INTO `t_user_log` VALUES ('2', '2017-04-20', '2', '1', null, '1', '0', null);
INSERT INTO `t_user_log` VALUES ('3', '2017-04-20', '0', null, '1', '1', '1', null);
