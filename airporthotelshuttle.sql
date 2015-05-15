
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `driver`
-- ----------------------------
DROP TABLE IF EXISTS `driver`;
CREATE TABLE `driver` (
  `driverid` varchar(8) NOT NULL,
  `drivername` varchar(11) NOT NULL,
  `gender` varchar(5) NOT NULL,
  `telphoneno` varchar(11) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nativeplace` varchar(255) default NULL,
  `createperson` varchar(255) default NULL,
  `entrytime` datetime default NULL,
  `updateperson` varchar(255) default NULL,
  `updatetime` datetime default NULL,
  `evaluatestar` int(11) default NULL,
  `driverstatus` varchar(10) NOT NULL,
  `rid` int(11) default NULL,
  PRIMARY KEY  (`driverid`),
  UNIQUE KEY `UK_hmto1ser0hxfcuojnidaequ9b` (`telphoneno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of driver
-- ----------------------------
INSERT INTO `driver` VALUES ('8aO2ENXg', '张三', 'WOMEN', '13951302284', '302284', '吐鲁番', null, '2015-05-13 05:44:56', null, null, null, 'VALID', '777777');
INSERT INTO `driver` VALUES ('B6Lr4EbS', '王五', 'MAN', '15632569876', '569876', '上海', null, '2015-05-13 07:12:40', null, null, null, 'VALID', '777777');
INSERT INTO `driver` VALUES ('lAQdjyt7', '侯柳', 'MAN', '14592049544', '049544', '北京', null, '2015-05-13 11:15:27', null, null, null, 'VALID', '777777');
INSERT INTO `driver` VALUES ('M6KhUoEw', 'Rubic', 'MAN', '15011151169', '151169', '北京', null, '2015-05-13 06:11:38', null, null, null, 'VALID', '777777');
INSERT INTO `driver` VALUES ('u8aZgIuh', '小强', 'WOMEN', '1383838438', '987654321', '内蒙古', '超人', '2015-05-12 12:18:43', null, null, null, 'VALID', '777777');

-- ----------------------------
-- Table structure for `drivestatus`
-- ----------------------------
DROP TABLE IF EXISTS `drivestatus`;
CREATE TABLE `drivestatus` (
  `driveid` varchar(255) NOT NULL,
  `vehicle_id` varchar(255) default NULL,
  `driver_id` varchar(8) default NULL,
  `authorizeddate` datetime default NULL,
  `lastdrivetime` datetime default NULL,
  PRIMARY KEY  (`driveid`),
  KEY `FK_2r4kqj0k44fs10ixmhq0aa3b1` (`vehicle_id`),
  KEY `FK_1irqqm7p6yu2rl0v8yr8hsos` (`driver_id`),
  CONSTRAINT `FK_1irqqm7p6yu2rl0v8yr8hsos` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driverid`),
  CONSTRAINT `FK_2r4kqj0k44fs10ixmhq0aa3b1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`carno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of drivestatus
-- ----------------------------
INSERT INTO `drivestatus` VALUES ('0GdP4uwY', '12342234', 'M6KhUoEw', '2015-05-13 06:11:38', null);
INSERT INTO `drivestatus` VALUES ('6WHLktDr', '12342234', '8aO2ENXg', '2015-05-13 05:45:08', null);
INSERT INTO `drivestatus` VALUES ('CbTtgJUY', '1237654', 'lAQdjyt7', '2015-05-13 11:15:27', null);
INSERT INTO `drivestatus` VALUES ('Jbf7FVbh', '12342234', 'lAQdjyt7', '2015-05-13 11:15:27', null);
INSERT INTO `drivestatus` VALUES ('JbTr9OGP', '12345678', 'B6Lr4EbS', '2015-05-13 07:12:40', null);
INSERT INTO `drivestatus` VALUES ('jHplCpba', '12345678', '8aO2ENXg', '2015-05-13 05:45:11', null);
INSERT INTO `drivestatus` VALUES ('ORp2DMUa', '12345678', 'lAQdjyt7', '2015-05-13 11:15:27', null);

-- ----------------------------
-- Table structure for `operations`
-- ----------------------------
DROP TABLE IF EXISTS `operations`;
CREATE TABLE `operations` (
  `oprtnid` varchar(8) NOT NULL,
  `orptname` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `shifts` varchar(255) NOT NULL,
  `vehicle_id` varchar(255) default NULL,
  `driver_id` varchar(8) default NULL,
  `otst_id` int(11) default NULL,
  `route_id` varchar(8) default NULL,
  `validity` varchar(255) default NULL,
  `istoaprflag` int(11) default NULL,
  PRIMARY KEY  (`oprtnid`),
  KEY `FK_kigr5357vvkxlgunpj9qvp788` (`vehicle_id`),
  KEY `FK_idvq4hmxrm7xhbhekmguh095` (`driver_id`),
  KEY `FK_csokc20fnubyhrrwkmpku1k95` (`otst_id`),
  KEY `FK_14bcfa74ldgp39u75lw8fd4po` (`route_id`),
  CONSTRAINT `FK_14bcfa74ldgp39u75lw8fd4po` FOREIGN KEY (`route_id`) REFERENCES `route` (`routeid`),
  CONSTRAINT `FK_csokc20fnubyhrrwkmpku1k95` FOREIGN KEY (`otst_id`) REFERENCES `operationstatus` (`otstid`),
  CONSTRAINT `FK_idvq4hmxrm7xhbhekmguh095` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driverid`),
  CONSTRAINT `FK_kigr5357vvkxlgunpj9qvp788` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`carno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations
-- ----------------------------

-- ----------------------------
-- Table structure for `operationstatus`
-- ----------------------------
DROP TABLE IF EXISTS `operationstatus`;
CREATE TABLE `operationstatus` (
  `otstid` int(11) NOT NULL,
  `otstname` varchar(255) NOT NULL,
  PRIMARY KEY  (`otstid`),
  UNIQUE KEY `UK_i8enbc0d6qgvciqn2e0wn3kyq` (`otstname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operationstatus
-- ----------------------------
INSERT INTO `operationstatus` VALUES ('1003', '已完成');
INSERT INTO `operationstatus` VALUES ('1001', '未开始');
INSERT INTO `operationstatus` VALUES ('1002', '进行中');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderid` varchar(255) NOT NULL,
  `orderno` varchar(255) NOT NULL,
  `passenger_id` varchar(9) default NULL,
  `telphoneno` varchar(255) NOT NULL,
  `buytime` datetime NOT NULL,
  `orderstate_id` int(11) default NULL,
  `stateupdatetime` datetime default NULL,
  `payment` varchar(255) default NULL,
  `quantity` int(11) default NULL,
  `totalprice` decimal(19,2) default NULL,
  `origin` varchar(8) default NULL,
  `terminal` varchar(8) default NULL,
  `operations` varchar(8) default NULL,
  `destination` varchar(255) default NULL,
  `couponsusedstate` decimal(19,2) default NULL,
  `couponsid` varchar(255) default NULL,
  `evaluate` int(11) default NULL,
  PRIMARY KEY  (`orderid`),
  KEY `FK_27dulgocyaal5akf3fdq5bq5` (`passenger_id`),
  KEY `FK_hfdjt5iu8qw9pqk7q45vqr6xd` (`orderstate_id`),
  KEY `FK_b8q0j49lcv9uoetddcnwpkov9` (`origin`),
  KEY `FK_t880xngo0bm0m9u1ui9f1rby3` (`terminal`),
  KEY `FK_blxgh99pr8e3fi86purih4w64` (`operations`),
  CONSTRAINT `FK_blxgh99pr8e3fi86purih4w64` FOREIGN KEY (`operations`) REFERENCES `operations` (`oprtnid`),
  CONSTRAINT `FK_27dulgocyaal5akf3fdq5bq5` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`userid`),
  CONSTRAINT `FK_b8q0j49lcv9uoetddcnwpkov9` FOREIGN KEY (`origin`) REFERENCES `station` (`stationid`),
  CONSTRAINT `FK_hfdjt5iu8qw9pqk7q45vqr6xd` FOREIGN KEY (`orderstate_id`) REFERENCES `orderstatus` (`orderstateid`),
  CONSTRAINT `FK_t880xngo0bm0m9u1ui9f1rby3` FOREIGN KEY (`terminal`) REFERENCES `station` (`stationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for `orderstatus`
-- ----------------------------
DROP TABLE IF EXISTS `orderstatus`;
CREATE TABLE `orderstatus` (
  `orderstateid` int(11) NOT NULL,
  `orderstatename` varchar(255) NOT NULL,
  PRIMARY KEY  (`orderstateid`),
  UNIQUE KEY `UK_lje2esxpbkap40b2fo8ocbpio` (`orderstatename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderstatus
-- ----------------------------
INSERT INTO `orderstatus` VALUES ('3', '已完成');
INSERT INTO `orderstatus` VALUES ('4', '已改签');
INSERT INTO `orderstatus` VALUES ('6', '已退款');
INSERT INTO `orderstatus` VALUES ('1', '未付款');
INSERT INTO `orderstatus` VALUES ('8', '未使用');
INSERT INTO `orderstatus` VALUES ('2', '等待检票');
INSERT INTO `orderstatus` VALUES ('7', '订单超时');
INSERT INTO `orderstatus` VALUES ('5', '退款中');

-- ----------------------------
-- Table structure for `passenger`
-- ----------------------------
DROP TABLE IF EXISTS `passenger`;
CREATE TABLE `passenger` (
  `userid` varchar(9) NOT NULL,
  `username` varchar(255) NOT NULL,
  `gender` varchar(5) NOT NULL,
  `telphoneno` varchar(11) NOT NULL,
  `password` varchar(32) NOT NULL,
  `registtime` datetime NOT NULL,
  `lastlogintime` datetime default NULL,
  `purchasenum` int(11) default NULL,
  `totalprice` decimal(19,2) default NULL,
  `registchannel` varchar(255) default NULL,
  `point` int(11) default NULL,
  `coupons` decimal(19,2) default NULL,
  `userstatus` varchar(10) NOT NULL,
  `rid` int(11) default NULL,
  PRIMARY KEY  (`userid`),
  UNIQUE KEY `UK_gar0fryqy3jt8e2j35hgh0o0q` (`telphoneno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of passenger
-- ----------------------------
INSERT INTO `passenger` VALUES ('I5OGhb3Ae', '旺财', 'MAN', '15011151169', '1234567890', '2015-05-04 15:14:14', '2015-05-04 15:14:14', '1', '100.00', '自然', '10', '8.00', 'VALID', '666666');

-- ----------------------------
-- Table structure for `route`
-- ----------------------------
DROP TABLE IF EXISTS `route`;
CREATE TABLE `route` (
  `routeid` varchar(8) NOT NULL,
  `routename` varchar(255) NOT NULL,
  `origin` varchar(255) NOT NULL,
  `terminal` varchar(255) NOT NULL,
  `createpersion` varchar(255) default NULL,
  `createtime` datetime NOT NULL,
  `updatepersion` varchar(255) default NULL,
  `updatetime` datetime default NULL,
  `routestatus` varchar(10) NOT NULL,
  PRIMARY KEY  (`routeid`),
  UNIQUE KEY `UK_fa323g6r3sorhcugyyspwa3d2` (`routename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of route
-- ----------------------------
INSERT INTO `route` VALUES ('DIko6MJA', 'A2', '裕景大饭店', '喜来登由由酒店', null, '2015-05-07 15:06:27', null, null, 'VALID');
INSERT INTO `route` VALUES ('EjfuNIec', 'A3', '世博洲际大酒店', '东锦江希尔顿逸林酒店', null, '2015-05-07 15:27:00', null, null, 'VALID');
INSERT INTO `route` VALUES ('QADLax9o', 'A1', '上海金茂君悦大酒店', '浦东香格里拉酒店', null, '2015-05-07 15:04:00', null, null, 'VALID');
INSERT INTO `route` VALUES ('vHOrz26K', 'B1', '外滩悦榕庄', '和平饭店', null, '2015-05-07 19:29:22', null, null, 'VALID');

-- ----------------------------
-- Table structure for `routestation`
-- ----------------------------
DROP TABLE IF EXISTS `routestation`;
CREATE TABLE `routestation` (
  `rsid` varchar(255) NOT NULL,
  `route_id` varchar(8) default NULL,
  `station_id` varchar(8) default NULL,
  `position` int(11) default NULL,
  PRIMARY KEY  (`rsid`),
  KEY `FK_k25f79bycdalycjdf9viql4kl` (`route_id`),
  KEY `FK_4emlgss3n56rhthnhp7d48qa6` (`station_id`),
  CONSTRAINT `FK_4emlgss3n56rhthnhp7d48qa6` FOREIGN KEY (`station_id`) REFERENCES `station` (`stationid`),
  CONSTRAINT `FK_k25f79bycdalycjdf9viql4kl` FOREIGN KEY (`route_id`) REFERENCES `route` (`routeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of routestation
-- ----------------------------
INSERT INTO `routestation` VALUES ('1Ue21NJo', 'EjfuNIec', '03Dag1jD', '1');
INSERT INTO `routestation` VALUES ('3CWVuwJX', 'vHOrz26K', 'ZaqUIdyq', '4');
INSERT INTO `routestation` VALUES ('4k0lBUao', 'vHOrz26K', 'Reax28SY', '1');
INSERT INTO `routestation` VALUES ('AKbmsDAi', 'EjfuNIec', 'PVjxyXNS', '4');
INSERT INTO `routestation` VALUES ('C9FUmFLg', 'vHOrz26K', 'Jfi2dmKH', '3');
INSERT INTO `routestation` VALUES ('co2CUk6w', 'QADLax9o', 'F5kMThnA', '2');
INSERT INTO `routestation` VALUES ('dklGLctC', 'DIko6MJA', 'ahNTGvk4', '3');
INSERT INTO `routestation` VALUES ('fWQTG4wT', 'EjfuNIec', 'sH57pe06', '5');
INSERT INTO `routestation` VALUES ('hqicbax6', 'vHOrz26K', 'pQWdp20b', '5');
INSERT INTO `routestation` VALUES ('K4o9GpNz', 'QADLax9o', 'pOKMvjJg', '4');
INSERT INTO `routestation` VALUES ('kfli9ZTv', 'QADLax9o', 'h4LLEzrO', '5');
INSERT INTO `routestation` VALUES ('n2M7YqD0', 'DIko6MJA', 'Cjy7XVdr', '4');
INSERT INTO `routestation` VALUES ('OqYByJlY', 'EjfuNIec', 'nvTh5FFK', '2');
INSERT INTO `routestation` VALUES ('ph0jWtH5', 'DIko6MJA', 'TcYvTJHA', '2');
INSERT INTO `routestation` VALUES ('QMrffc4t', 'vHOrz26K', 'fMNCopgI', '2');
INSERT INTO `routestation` VALUES ('UQem3tVq', 'DIko6MJA', 'jllt0kV7', '1');
INSERT INTO `routestation` VALUES ('Vm5Wauhy', 'EjfuNIec', 'ASYiCJYe', '3');
INSERT INTO `routestation` VALUES ('Ye42ouAT', 'QADLax9o', 'Wd0M9WdI', '1');
INSERT INTO `routestation` VALUES ('zCZOzrsU', 'QADLax9o', '2DJsvEQl', '3');

-- ----------------------------
-- Table structure for `shifts`
-- ----------------------------
DROP TABLE IF EXISTS `shifts`;
CREATE TABLE `shifts` (
  `shiftid` int(5) NOT NULL auto_increment,
  `shiftname` varchar(10) NOT NULL,
  PRIMARY KEY  (`shiftid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shifts
-- ----------------------------
INSERT INTO `shifts` VALUES ('10810', '08:10');
INSERT INTO `shifts` VALUES ('10830', '08:30');
INSERT INTO `shifts` VALUES ('10850', '08:50');
INSERT INTO `shifts` VALUES ('10910', '09:10');
INSERT INTO `shifts` VALUES ('10930', '09:30');
INSERT INTO `shifts` VALUES ('10950', '09:50');
INSERT INTO `shifts` VALUES ('11010', '10:10');
INSERT INTO `shifts` VALUES ('11030', '10:30');
INSERT INTO `shifts` VALUES ('11050', '10:50');
INSERT INTO `shifts` VALUES ('11110', '11:10');
INSERT INTO `shifts` VALUES ('11130', '11:30');
INSERT INTO `shifts` VALUES ('11150', '11:50');
INSERT INTO `shifts` VALUES ('11210', '12:10');
INSERT INTO `shifts` VALUES ('11230', '12:30');
INSERT INTO `shifts` VALUES ('11250', '12:50');
INSERT INTO `shifts` VALUES ('11310', '13:10');
INSERT INTO `shifts` VALUES ('11330', '13:30');
INSERT INTO `shifts` VALUES ('11350', '13:50');
INSERT INTO `shifts` VALUES ('11410', '14:10');
INSERT INTO `shifts` VALUES ('11430', '14:30');
INSERT INTO `shifts` VALUES ('11450', '14:50');
INSERT INTO `shifts` VALUES ('11510', '15:10');
INSERT INTO `shifts` VALUES ('11530', '15:30');
INSERT INTO `shifts` VALUES ('11550', '15:50');
INSERT INTO `shifts` VALUES ('11610', '16:10');
INSERT INTO `shifts` VALUES ('11630', '16:30');
INSERT INTO `shifts` VALUES ('11650', '16:50');
INSERT INTO `shifts` VALUES ('11710', '17:10');
INSERT INTO `shifts` VALUES ('11730', '17:30');
INSERT INTO `shifts` VALUES ('11750', '17:50');
INSERT INTO `shifts` VALUES ('11810', '18:10');
INSERT INTO `shifts` VALUES ('11830', '18:30');
INSERT INTO `shifts` VALUES ('11850', '18:50');
INSERT INTO `shifts` VALUES ('11910', '19:10');
INSERT INTO `shifts` VALUES ('11930', '19:30');
INSERT INTO `shifts` VALUES ('11950', '19:50');
INSERT INTO `shifts` VALUES ('12010', '20:10');
INSERT INTO `shifts` VALUES ('12030', '20:30');
INSERT INTO `shifts` VALUES ('12050', '20:50');

-- ----------------------------
-- Table structure for `station`
-- ----------------------------
DROP TABLE IF EXISTS `station`;
CREATE TABLE `station` (
  `stationid` varchar(8) NOT NULL,
  `chname` varchar(255) NOT NULL,
  `enname` varchar(255) NOT NULL,
  `janame` varchar(255) NOT NULL,
  `longitude` double default NULL,
  `latitude` double default NULL,
  `areaname` varchar(255) default NULL,
  `createpersion` varchar(255) default NULL,
  `createtime` datetime default NULL,
  `updatepersion` varchar(255) default NULL,
  `updatetime` datetime default NULL,
  `stationstatus` varchar(10) NOT NULL,
  PRIMARY KEY  (`stationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of station
-- ----------------------------
INSERT INTO `station` VALUES ('03Dag1jD', '浦东文华东方酒店', '', '', '121.513882', '31.24929', 'A', null, '2015-05-07 14:29:46', null, null, 'VALID');
INSERT INTO `station` VALUES ('1VnTNIxd', '新锦江大酒店', '', '', '121.469126', '31.226511', 'D', null, '2015-05-07 17:59:39', null, null, 'VALID');
INSERT INTO `station` VALUES ('2DJsvEQl', '浦东丽思卡尔顿酒店', '', '', '121.507856', '31.241973', 'A', null, '2015-05-07 10:50:56', null, null, 'VALID');
INSERT INTO `station` VALUES ('35aGWCLU', '花园饭店', '', '', '121.466375', '31.225986', 'D', null, '2015-05-07 17:58:28', null, null, 'VALID');
INSERT INTO `station` VALUES ('4OHBZAjV', '世博洲际大酒店', '', '', '121.511495', '31.204731', 'A', null, '2015-05-07 14:29:27', null, null, 'VALID');
INSERT INTO `station` VALUES ('4prJeR1H', '浦东香格里拉酒店', '', '', '121.505745', '31.241047', 'A', null, '2015-05-07 11:38:17', null, null, 'VALID');
INSERT INTO `station` VALUES ('4Pug6EVT', '王宝和大酒店', '', '', '121.487181', '31.240746', 'C', null, '2015-05-07 17:26:34', null, null, 'VALID');
INSERT INTO `station` VALUES ('5eL3tJIi', '上海虹桥元一希尔顿酒店', '', '', '121.400834', '31.193016', 'E', null, '2015-05-07 18:11:49', null, null, 'VALID');
INSERT INTO `station` VALUES ('5kVdXbyI', '喜来登由由酒店', '', '', '121.524879', '31.214915', 'A', null, '2015-05-07 14:29:03', null, null, 'VALID');
INSERT INTO `station` VALUES ('5RRd3wJi', '扬子精品酒店', '', '', '121.482981', '31.239341', 'C', null, '2015-05-07 17:25:46', null, null, 'VALID');
INSERT INTO `station` VALUES ('69PMZFTf', '上海四季酒店', '', '', '121.468893', '31.233289', 'D', null, '2015-05-07 17:57:53', null, null, 'VALID');
INSERT INTO `station` VALUES ('6Vby4MN2', '裕景大饭店', '', '', '121.526864', '31.246782', 'A', null, '2015-05-07 14:25:19', null, null, 'VALID');
INSERT INTO `station` VALUES ('87Yi3ESX', '龙柏饭店', '', '', '121.366999', '31.194924', 'E', null, '2015-05-07 18:10:50', null, null, 'VALID');
INSERT INTO `station` VALUES ('ahNTGvk4', '上海豪华精选红塔大酒店', '', '', '121.534846', '31.229669', 'A', null, '2015-05-07 14:28:13', null, null, 'VALID');
INSERT INTO `station` VALUES ('ASYiCJYe', '世纪皇冠假日酒店', '', '', '121.557367', '31.229684', 'B', null, '2015-05-07 15:25:58', null, null, 'VALID');
INSERT INTO `station` VALUES ('AUSZwG4a', '天禧嘉福璞缇客酒店', '', '', '121.402035', '31.187186', 'E', null, '2015-05-07 18:11:21', null, null, 'VALID');
INSERT INTO `station` VALUES ('Cjy7XVdr', '中油阳光大酒店', '', '', '121.535225', '31.22838', 'B', null, '2015-05-07 14:28:36', null, null, 'VALID');
INSERT INTO `station` VALUES ('DRYkkIGc', '世茂皇家艾美酒店', '', '', '121.482715', '31.240337', 'C', null, '2015-05-07 17:24:10', null, null, 'VALID');
INSERT INTO `station` VALUES ('dzdHMeg4', '滨江欣景大酒店', '', '', '121.505969', '31.229831', 'B', null, '2015-05-07 16:45:40', null, null, 'VALID');
INSERT INTO `station` VALUES ('ewdlgtM1', '外滩东方商旅酒店', '', '', '121.499441', '31.237342', 'B', null, '2015-05-07 16:24:42', null, null, 'VALID');
INSERT INTO `station` VALUES ('F5kMThnA', '上海柏悦酒店', '', '', '121.513639', '31.240993', 'B', null, '2015-05-07 10:50:25', null, null, 'VALID');
INSERT INTO `station` VALUES ('fMNCopgI', '上海大厦', '', '', '121.496435', '31.250154', 'B', null, '2015-05-07 16:11:11', null, null, 'VALID');
INSERT INTO `station` VALUES ('h4LLEzrO', '凯宾斯基酒店', '', '', '121.510727', '31.248387', 'B', null, '2015-05-07 11:23:42', null, null, 'VALID');
INSERT INTO `station` VALUES ('hGle6AhZ', '上海虹桥万豪大酒店', '', '', '121.383325', '31.197071', 'E', null, '2015-05-07 18:02:28', null, null, 'VALID');
INSERT INTO `station` VALUES ('HQEXjZXy', '国际饭店', '', '', '121.478227', '31.239503', 'C', null, '2015-05-07 17:22:35', null, null, 'VALID');
INSERT INTO `station` VALUES ('HxxHVRq5', '新世界丽笙酒店', '', '', '121.479712', '31.240414', 'C', null, '2015-05-07 17:23:45', null, null, 'VALID');
INSERT INTO `station` VALUES ('IZch5OYy', '威斯汀大酒店', '', '', '121.493381', '31.238121', 'C', null, '2015-05-07 17:31:58', null, null, 'VALID');
INSERT INTO `station` VALUES ('Jcg63Tao', '虹桥喜来登上海太平洋大饭店', '', '', '121.412643', '31.20968', 'E', null, '2015-05-07 18:13:12', null, null, 'VALID');
INSERT INTO `station` VALUES ('Jfi2dmKH', '海鸥饭店', '', '', '121.49851', '31.249468', 'B', null, '2015-05-07 16:14:35', null, null, 'VALID');
INSERT INTO `station` VALUES ('jllt0kV7', '锦江汤臣洲际大酒店', '', '', '121.528253', '31.235427', 'B', null, '2015-05-07 14:26:48', null, null, 'VALID');
INSERT INTO `station` VALUES ('jZyLMetF', '浦东机场T2', '', '', '121.815352', '31.157385', 'A', null, '2015-05-07 14:46:18', null, null, 'VALID');
INSERT INTO `station` VALUES ('kbuuDQso', '虹桥迎宾馆', '', '', '121.40099', '31.20826', 'E', null, '2015-05-07 18:37:09', null, null, 'VALID');
INSERT INTO `station` VALUES ('kCMSNA80', '绿地九龙宾馆', '', '', '121.498793', '31.259601', 'B', null, '2015-05-07 16:46:10', null, null, 'VALID');
INSERT INTO `station` VALUES ('L19GVQ3q', '南新雅大酒店', '', '', '121.483623', '31.24026', 'C', null, '2015-05-07 17:25:10', null, null, 'VALID');
INSERT INTO `station` VALUES ('LNoq5NAm', '浦东机场T1', '', '', '121.809158', '31.156249', 'A', null, '2015-05-07 14:45:09', null, null, 'VALID');
INSERT INTO `station` VALUES ('m54HYpo9', '静安香格里拉大酒店', '', '', '121.457103', '31.229375', 'D', null, '2015-05-07 17:38:52', null, null, 'VALID');
INSERT INTO `station` VALUES ('MjxtHVl2', '雅居乐万豪酒店', '', '', '121.479804', '31.242228', 'C', null, '2015-05-07 17:24:39', null, null, 'VALID');
INSERT INTO `station` VALUES ('nhEMqn05', '上海国际贵都大饭店', '', '', '121.451246', '31.226372', 'D', null, '2015-05-07 17:37:32', null, null, 'VALID');
INSERT INTO `station` VALUES ('nJ1FcAA8', '静安希尔顿大酒店', '', '', '121.451877', '31.225631', 'D', null, '2015-05-07 17:37:09', null, null, 'VALID');
INSERT INTO `station` VALUES ('NuAPYp40', '虹桥宾馆', '', '', '121.416502', '31.209873', 'E', null, '2015-05-07 18:37:30', null, null, 'VALID');
INSERT INTO `station` VALUES ('nvTh5FFK', '淳大万丽酒店', '', '', '121.558963', '31.230155', 'A', null, '2015-05-07 14:41:54', null, null, 'VALID');
INSERT INTO `station` VALUES ('oDCSZnBL', '明天广场JW万豪酒店', '', '', '121.476249', '31.236331', 'C', null, '2015-05-07 17:22:08', null, null, 'VALID');
INSERT INTO `station` VALUES ('oIVlr72T', '东锦江希尔顿逸林酒店', '', '', '121.540465', '31.217108', 'A', null, '2015-05-07 14:43:31', null, null, 'VALID');
INSERT INTO `station` VALUES ('OTtv0xHZ', '宏安瑞士酒店', '', '', '121.453608', '31.231344', 'D', null, '2015-05-07 17:39:58', null, null, 'VALID');
INSERT INTO `station` VALUES ('p6IpETXU', '扬子江万丽大酒店', '', '', '121.412254', '31.208839', 'E', null, '2015-05-07 18:12:27', null, null, 'VALID');
INSERT INTO `station` VALUES ('pOKMvjJg', '东方滨江大酒店', '', '', '121.503459', '31.244868', 'A', null, '2015-05-07 11:23:11', null, null, 'VALID');
INSERT INTO `station` VALUES ('pQWdp20b', '上海华尔道夫酒店', '', '', '121.496329', '31.239187', 'B', null, '2015-05-07 16:15:53', null, null, 'VALID');
INSERT INTO `station` VALUES ('PvB0lh6C', '千禧海鸥大酒店', '', '', '121.401613', '31.202878', 'E', null, '2015-05-07 18:05:40', null, null, 'VALID');
INSERT INTO `station` VALUES ('PVjxyXNS', '证大丽笙酒店', '', '', '121.566974', '31.23261', 'B', null, '2015-05-07 14:42:36', null, null, 'VALID');
INSERT INTO `station` VALUES ('pw1MTupH', '外滩英迪格酒店', '', '', '121.506546', '31.23207', 'B', null, '2015-05-07 16:21:48', null, null, 'VALID');
INSERT INTO `station` VALUES ('QInkw4Sd', '璞丽酒店', '', '', '121.454552', '31.228611', 'D', null, '2015-05-07 17:39:35', null, null, 'VALID');
INSERT INTO `station` VALUES ('QSn15MYn', '上海宾馆', '', '', '121.450788', '31.224566', 'D', null, '2015-05-07 17:38:20', null, null, 'VALID');
INSERT INTO `station` VALUES ('Reax28SY', '外滩茂悦酒店', '', '', '121.49994', '31.250926', 'B', null, '2015-05-07 16:10:33', null, null, 'VALID');
INSERT INTO `station` VALUES ('s6IXj88S', '波特曼丽思卡尔顿酒店', '', '', '121.458183', '31.233382', 'D', null, '2015-05-07 17:40:33', null, null, 'VALID');
INSERT INTO `station` VALUES ('sH57pe06', '浦东嘉里酒店', '', '', '121.570164', '31.219679', 'B', null, '2015-05-07 14:42:55', null, null, 'VALID');
INSERT INTO `station` VALUES ('SmWyBZSm', '锦江饭店', '', '', '121.467328', '31.226643', 'D', null, '2015-05-07 17:58:58', null, null, 'VALID');
INSERT INTO `station` VALUES ('TcYvTJHA', '上海紫金山大酒店', '', '', '121.53012', '31.23366', 'B', null, '2015-05-07 14:27:53', null, null, 'VALID');
INSERT INTO `station` VALUES ('TgQcyGeX', '上海大酒店', '', '', '121.488011', '31.241016', 'C', null, '2015-05-07 17:30:52', null, null, 'VALID');
INSERT INTO `station` VALUES ('W11FYLg4', '外滩悦榕庄', '', '', '121.513118', '31.255518', 'A', null, '2015-05-07 15:52:20', null, null, 'VALID');
INSERT INTO `station` VALUES ('Wd0M9WdI', '上海金茂君悦大酒店', '', '', '121.512069', '31.240754', 'A', null, '2015-05-07 10:35:13', null, null, 'VALID');
INSERT INTO `station` VALUES ('wUzcwAT9', '虹桥雅高美爵酒店', '', '', '121.403182', '31.212035', 'E', null, '2015-05-07 18:36:13', null, null, 'VALID');
INSERT INTO `station` VALUES ('WvlxZdYM', '浦东四季酒店', '', '', '121.516535', '31.240221', 'A', null, '2015-05-07 14:52:37', null, null, 'VALID');
INSERT INTO `station` VALUES ('xNaCx9hU', '和平饭店', '', '', '121.495979', '31.24469', 'B', null, '2015-05-07 16:21:05', null, null, 'VALID');
INSERT INTO `station` VALUES ('z3kfC6Sk', '虹口三至喜来登酒店', '', '', '121.494333', '31.263637', 'B', null, '2015-05-07 17:16:42', null, null, 'VALID');
INSERT INTO `station` VALUES ('ZaqUIdyq', '半岛酒店', '', '', '121.495605', '31.247191', 'B', null, '2015-05-07 16:15:11', null, null, 'VALID');
INSERT INTO `station` VALUES ('ZBFNYB77', '古象大酒店', '', '', '121.486054', '31.240175', 'C', null, '2015-05-07 17:26:09', null, null, 'VALID');

-- ----------------------------
-- Table structure for `takes`
-- ----------------------------
DROP TABLE IF EXISTS `takes`;
CREATE TABLE `takes` (
  `takeid` varchar(255) NOT NULL,
  `order_id` varchar(255) default NULL,
  `takeprice` decimal(19,2) NOT NULL,
  `qrcodepath` varchar(255) default NULL,
  `takestatus` varchar(10) NOT NULL,
  PRIMARY KEY  (`takeid`),
  KEY `FK_nx0iev6q320x7e41776p3jyht` (`order_id`),
  CONSTRAINT `FK_nx0iev6q320x7e41776p3jyht` FOREIGN KEY (`order_id`) REFERENCES `orders` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of takes
-- ----------------------------

-- ----------------------------
-- Table structure for `vehicle`
-- ----------------------------
DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE `vehicle` (
  `carno` varchar(255) NOT NULL,
  `platno` varchar(255) NOT NULL,
  `carmodel` varchar(255) NOT NULL,
  `passengernum` int(11) NOT NULL,
  `motionstatus` varchar(255) NOT NULL,
  `vehiclestatus` varchar(255) NOT NULL,
  `buytime` datetime default NULL,
  `createperson` varchar(255) default NULL,
  `createtime` datetime default NULL,
  `updateperson` varchar(255) default NULL,
  `updatetime` datetime default NULL,
  `motionupdatetime` datetime default NULL,
  PRIMARY KEY  (`carno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vehicle
-- ----------------------------
INSERT INTO `vehicle` VALUES ('12342234', '沪A·666666', '法拉利', '4', 'INVALID', 'VALID', '2015-01-01 00:00:00', '社会你大飞哥', '2015-05-13 02:17:57', null, null, null);
INSERT INTO `vehicle` VALUES ('12345678', '沪A·888888', '玛莎拉蒂', '4', 'INVALID', 'VALID', '2015-05-12 00:00:00', '社会你大飞哥', '2015-05-13 04:12:33', null, null, null);
INSERT INTO `vehicle` VALUES ('1237654', '沪B·888888', '雷克萨斯', '4', 'INVALID', 'VALID', '2015-02-05 00:00:00', '社会你大飞哥', '2015-05-13 11:10:31', null, null, null);
