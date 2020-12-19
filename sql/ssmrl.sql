-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.11-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema ssmrl
--

CREATE DATABASE IF NOT EXISTS ssmrl;
USE ssmrl;

--
-- Definition of table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` varchar(10) NOT NULL,
  `password` varchar(15) NOT NULL DEFAULT '123456',
  `authoid` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '权限等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`id`,`password`,`authoid`) VALUES 
 ('1234561','123456',1),
 ('1234562','123456',1),
 ('1234563','123456',1),
 ('1234564','123456',1),
 ('1234565','123456',1),
 ('1234566','123456',1),
 ('1234567','123456',1),
 ('admin','123456',2);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


--
-- Definition of table `authority`
--

DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `authoid` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '权限等级',
  `authoName` varchar(15) NOT NULL COMMENT '权限名称',
  PRIMARY KEY (`authoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authority`
--

/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` (`authoid`,`authoName`) VALUES 
 (1,'普通用户'),
 (2,'超级管理员');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;


--
-- Definition of table `dept`
--

DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `deptid` varchar(3) NOT NULL,
  `deptName` varchar(12) NOT NULL,
  PRIMARY KEY (`deptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dept`
--

/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` (`deptid`,`deptName`) VALUES 
 ('001','Java开发部'),
 ('002','算法部'),
 ('003','运营部');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;


--
-- Definition of table `emp`
--

DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `empid` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `empName` varchar(15) NOT NULL,
  `deptid` varchar(3) NOT NULL,
  `id` varchar(10) NOT NULL COMMENT '帐号',
  PRIMARY KEY (`empid`),
  UNIQUE KEY `Index_2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91002 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emp`
--

/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` (`empid`,`empName`,`deptid`,`id`) VALUES 
 (1,'张三','002','1234561'),
 (2,'李四','003','1234562'),
 (3,'王五','001','1234563'),
 (4,'AA','001','1234564'),
 (5,'bb','001','1234565'),
 (6,'cc','002','1234566'),
 (7,'9dd','003','1234567');
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;


--
-- Definition of table `logger`
--

DROP TABLE IF EXISTS `logger`;
CREATE TABLE `logger` (
  `logid` varchar(45) NOT NULL COMMENT '日志编号',
  `id` varchar(10) NOT NULL COMMENT '用户id',
  `type` varchar(20) NOT NULL COMMENT '操作类型',
  `operation` varchar(45) NOT NULL COMMENT '操作内容',
  `date` datetime NOT NULL COMMENT '操作日期',
  `remark` varchar(45) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logger`
--

/*!40000 ALTER TABLE `logger` DISABLE KEYS */;
INSERT INTO `logger` (`logid`,`id`,`type`,`operation`,`date`,`remark`) VALUES 
 ('02038b98b9254c77bbbd022042af9d0b','admin','修改部门','/changeDept','2020-12-16 17:58:40','oppo'),
 ('089d45391554416b972c47f206bd12cb','admin','修改管理员信息','/changgeAdmin','2020-12-15 22:57:32','22'),
 ('0b0dc60475ef4a51a55239729e74b66f','admin','删除帐号、员工信息','/delAdmin/1234561','2020-12-18 18:03:47',''),
 ('16aece82d7c848e2ba627330cebd846f','admin','添加管理员','/AddAdmin','2020-12-16 20:27:34','33'),
 ('17d7483758ad4bf98f279199c575b4f3','admin','添加员工、开通员工帐号','/AddEmp','2020-12-19 17:57:13',''),
 ('1b8841ca16484a15b352e9fd93cbf4e0','admin','添加管理员','/AddAdmin','2020-12-15 22:50:26','55'),
 ('21f44fa80fba4636bee0cbd432d7a0e1','admin','修改部门','/changeDept','2020-12-16 18:16:34',''),
 ('237f31df98a84fbcb156f535febc6962','admin','添加员工、开通员工帐号','/AddEmp','2020-12-18 18:09:25',''),
 ('24a65c9c395a431f9e66f243bc0f7ced','admin','修改员工信息','/changeEmp','2020-12-16 20:57:55',''),
 ('2ceea8b2289a40469ad47f4be002a290','admin','修改员工信息','/changeEmp','2020-12-14 18:45:02','two'),
 ('2feb1c65371a421faf0b9391f5da065d','admin','添加部门','/addDept','2020-12-16 17:43:35','w99'),
 ('303aa5895c4848fab617ef0add79be95','admin','删除管理员','/delAdmin/my','2020-12-15 22:35:46',''),
 ('378a2960f14249cd9ef8f2dee2b965c4','admin','添加员工','/AddEmp','2020-12-16 20:31:07',''),
 ('409715ce8beb47cc838de288a4da6d56','admin','添加部门','/addDept','2020-12-16 20:28:19',''),
 ('428f21cb12944d9b894bb3106c780ef6','admin','删除员工','/delEmp/undefined','2020-12-16 20:58:26',''),
 ('48363e3700e04954a0322e38217fdbf8','admin','修改部门','/changeDept','2020-12-16 19:22:28','55one'),
 ('4c59fef8aab642a4aa83177a74d43306','admin','修改部门','/changeDept','2020-12-16 18:09:10',''),
 ('5889e7d4a31247909bf885e025a1036f','admin','删除帐号、员工信息','/delAdmin/123','2020-12-18 18:10:44',''),
 ('5c1f5aec9eaa477eb745ebe9bb1540a0','admin','修改部门','/changeDept','2020-12-16 18:13:44',''),
 ('602666fca9ed4c57a876b0ade34c746a','admin','删除部门','/delDept/222','2020-12-16 19:35:40',''),
 ('6058980216ed4324a15959238bb4f0f9','admin','添加管理员','/AddAdmin','2020-12-15 22:35:34',''),
 ('6303c1e4bbe941e6836aaf357096933f','admin','修改管理员信息','/changgeAdmin','2020-12-15 22:55:03',''),
 ('664f413ec2774888b5e96181d0b81596','admin','添加员工、开通员工帐号','/AddEmp','2020-12-18 18:06:40',''),
 ('669042adf0954db7bd880dbf775c877b','admin','添加员工、开通员工帐号','/AddEmp','2020-12-18 21:42:36',''),
 ('6eb03fa07872448c963e5df286d9bd1c','admin','添加员工','/AddEmp','2020-12-16 20:08:01',''),
 ('716370a35b2846ebb4101944a2090c64','admin','添加员工、开通员工帐号','/AddEmp','2020-12-18 18:03:27',''),
 ('76a104de1cde46668f4c58ad9b84a887','admin','删除管理员','/delAdmin/330','2020-12-15 22:49:11',''),
 ('77cd2e07d79e4752a6da37fa5ea62fd1','admin','修改部门','/changeDept','2020-12-16 17:43:48',''),
 ('787de0e4f25946af92240dbe73158831','admin','删除管理员','/delAdmin/9333','2020-12-16 19:54:41',''),
 ('7b3deb58c9a04fabbf560ac978aefb42','admin','添加部门','/addDept','2020-12-16 17:38:38',''),
 ('7c982756f394405997ac15a847f841ba','admin','删除部门','/delDept/222','2020-12-15 14:38:12',''),
 ('7d10361192b84f6d9e9ef1ff29e5bb3c','admin','修改管理员信息','/changgeAdmin','2020-12-16 19:49:23',''),
 ('7fa6635e5c754025a5af408397aa2cbc','admin','删除管理员','/delAdmin/220','2020-12-15 22:58:08',''),
 ('801941b472c040f693a4b32e7cfefe52','admin','添加员工、开通员工帐号','/AddEmp','2020-12-19 17:56:53',''),
 ('8207762f9db542a192c0ef7c0236733b','admin','添加管理员','/AddAdmin','2020-12-15 22:48:50',''),
 ('831d5322ba8c4a198d0657b3ae798b7a','admin','修改管理员信息','/changgeAdmin','2020-12-15 22:58:04',''),
 ('8cf9ee3b627942e08c973a4ea636ab27','admin','添加管理员','/AddAdmin','2020-12-15 22:57:27',''),
 ('8d03028fc9fc458ca458e2aeab6c2fbe','admin','修改部门','/changeDept','2020-12-16 20:28:25',''),
 ('923774ba06174d87a898b74966fd7bb2','admin','删除管理员','/delAdmin/99','2020-12-16 20:27:48',''),
 ('9a26a63edf8d494cb0f75437f7ec0c1b','admin','删除管理员','/delAdmin/220','2020-12-15 22:50:38',''),
 ('9d59058a87fb469dbc7934682cee2941','admin','添加部门','/addDept','2020-12-15 14:38:09',''),
 ('a18afa4152ea4294a5e0ae85325b067f','admin','修改管理员信息','/changgeAdmin','2020-12-16 20:27:41',''),
 ('ace2e0f6df0a445db15b73caf9ef587c','admin','修改部门','/changeDept','2020-12-16 18:31:45',''),
 ('b144775e9fb94e828c1ba24814af62d3','admin','修改部门','/changeDept','2020-12-16 18:02:56',''),
 ('b6fc7c7a1ccd43af976b02de109affce','admin','删除员工、员工帐号','/delEmp/12','2020-12-18 18:09:58',''),
 ('b8e100492d1b4452a0ce1882f1387d1f','admin','删除管理员','/delAdmin/922','2020-12-16 19:49:27',''),
 ('c4514d8bd2d04359b38c2fe3afc311fe','admin','添加管理员','/AddAdmin','2020-12-16 19:49:13',''),
 ('c546abc6a976413786da15bac972d1e4','admin','修改管理员信息','/changgeAdmin','2020-12-15 22:48:58',''),
 ('c64493c819a044f797e71a22c9e7c3f5','admin','修改管理员信息','/changgeAdmin','2020-12-15 22:49:07',''),
 ('c964b905d1074fe98d1b2067d33247ae','admin','添加员工、开通员工帐号','/AddEmp','2020-12-18 21:42:21',''),
 ('ce944498e6cf47ba9e672154e003e265','admin','删除部门','/delDept/999','2020-12-16 17:38:42',''),
 ('d14bb42c501b4dae9263c5547edaa1c1','admin','删除员工','/delEmp/undefined','2020-12-16 20:58:17',''),
 ('d1aaf6e727c44343a6e7ea491fd375e5','admin','修改部门','/changeDept','2020-12-16 18:31:52',''),
 ('dce229bbcf224035ae1688b1ca49b60e','admin','添加员工、开通员工帐号','/AddEmp','2020-12-18 21:42:50',''),
 ('dfdf915ad194455abad0243c2f5baea7','admin','修改管理员信息','/changgeAdmin','2020-12-15 22:53:11',''),
 ('e073b6c23d05464399ae33d706461472','admin','删除帐号、员工信息','/delAdmin/1234561','2020-12-18 18:09:12',''),
 ('e62671ed760242f3a44cbf937ef74a6d','admin','删除部门','/delDept/222','2020-12-16 20:28:30',''),
 ('e6a3232a40ef4929a4ec08ae3b98da64','admin','修改部门','/changeDept','2020-12-16 18:02:05',''),
 ('e74f89c4f0b04ce7a515ae10740ae5d1','admin','删除管理员','/delAdmin/220','2020-12-15 22:53:16',''),
 ('e8357f33af9f48bdaa754762772782e8','admin','添加管理员','/AddAdmin','2020-12-15 22:54:53',''),
 ('ea887ae29505455e83d2da118f7023ca','admin','添加员工、开通员工帐号','/AddEmp','2020-12-19 17:56:48',''),
 ('eb6ecd61bace4ea09c1bac402df05871','admin','修改员工信息','/changeEmp','2020-12-14 18:44:58','two'),
 ('ecda048d811c4c889ebb780fe059ac57','admin','删除员工','/delEmp/15','2020-12-16 21:00:03',''),
 ('edf8de9108464c0eb366732126af5dbf','admin','添加员工、开通员工帐号','/AddEmp','2020-12-19 17:57:02',''),
 ('f382daa74f2f4e64bfdec3ff8d717af1','admin','修改管理员信息','/changgeAdmin','2020-12-15 22:50:33',''),
 ('f58a9aa04c1f46a3b4c22355ef37154c','admin','修改部门','/changeDept','2020-12-16 18:04:37',''),
 ('f79bf43fb9a148628d363251327369db','admin','添加管理员','/AddAdmin','2020-12-15 22:53:05',''),
 ('fc2d4dca786c486fabcf8e0232822cb0','admin','添加管理员','/AddAdmin','2020-12-16 19:54:31',''),
 ('ffaffcd275d0456db2fc804f2f487484','admin','删除管理员','/delAdmin/220','2020-12-15 22:55:07','');
/*!40000 ALTER TABLE `logger` ENABLE KEYS */;


--
-- Definition of table `publish`
--

DROP TABLE IF EXISTS `publish`;
CREATE TABLE `publish` (
  `sid` varchar(45) NOT NULL COMMENT '签到编号',
  `id` varchar(10) NOT NULL COMMENT '发布者id',
  `startTIme` datetime NOT NULL COMMENT '开始时间',
  `endTime` datetime NOT NULL COMMENT '结束时间',
  `deptName` varchar(12) NOT NULL COMMENT '签到部门',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publish`
--

/*!40000 ALTER TABLE `publish` DISABLE KEYS */;
INSERT INTO `publish` (`sid`,`id`,`startTIme`,`endTime`,`deptName`) VALUES 
 ('06da8629409f4ed7a8013db7aba5570f','1234563','2020-12-19 10:40:22','2020-12-19 10:41:22','所有部门'),
 ('6d9b01b640dd4bcea6700ac8cf27a828','admin','2020-12-19 06:00:20','2020-12-19 06:01:20','所有部门'),
 ('a3d422caf5b64312bc3621603bf89bec','admin','2020-12-19 05:57:34','2020-12-19 05:58:34','001');
/*!40000 ALTER TABLE `publish` ENABLE KEYS */;


--
-- Definition of table `sign`
--

DROP TABLE IF EXISTS `sign`;
CREATE TABLE `sign` (
  `num` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '没啥用',
  `sid` varchar(45) NOT NULL COMMENT '签到编号',
  `empid` int(5) unsigned NOT NULL COMMENT '员工编号',
  `endTime` datetime NOT NULL COMMENT '结束时间',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否签到',
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sign`
--

/*!40000 ALTER TABLE `sign` DISABLE KEYS */;
INSERT INTO `sign` (`num`,`sid`,`empid`,`endTime`,`flag`) VALUES 
 (2,'a3d422caf5b64312bc3621603bf89bec',3,'2020-12-19 05:58:34',0),
 (3,'a3d422caf5b64312bc3621603bf89bec',4,'2020-12-19 05:58:34',0),
 (4,'a3d422caf5b64312bc3621603bf89bec',5,'2020-12-19 05:58:34',0),
 (5,'6d9b01b640dd4bcea6700ac8cf27a828',1,'2020-12-19 06:01:20',0),
 (6,'6d9b01b640dd4bcea6700ac8cf27a828',2,'2020-12-19 06:01:20',0),
 (7,'6d9b01b640dd4bcea6700ac8cf27a828',3,'2020-12-19 06:01:20',0),
 (8,'6d9b01b640dd4bcea6700ac8cf27a828',4,'2020-12-19 06:01:20',0),
 (9,'6d9b01b640dd4bcea6700ac8cf27a828',5,'2020-12-19 06:01:20',0),
 (10,'6d9b01b640dd4bcea6700ac8cf27a828',6,'2020-12-19 06:01:20',0),
 (11,'6d9b01b640dd4bcea6700ac8cf27a828',7,'2020-12-19 06:01:20',0),
 (12,'06da8629409f4ed7a8013db7aba5570f',1,'2020-12-19 10:41:22',0),
 (13,'06da8629409f4ed7a8013db7aba5570f',2,'2020-12-19 10:41:22',0),
 (14,'06da8629409f4ed7a8013db7aba5570f',3,'2020-12-19 10:41:22',1),
 (15,'06da8629409f4ed7a8013db7aba5570f',4,'2020-12-19 10:41:22',0),
 (16,'06da8629409f4ed7a8013db7aba5570f',5,'2020-12-19 10:41:22',0),
 (17,'06da8629409f4ed7a8013db7aba5570f',6,'2020-12-19 10:41:22',0),
 (18,'06da8629409f4ed7a8013db7aba5570f',7,'2020-12-19 10:41:22',0);
/*!40000 ALTER TABLE `sign` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
