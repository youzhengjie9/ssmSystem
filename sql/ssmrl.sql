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
  `password` varchar(15) NOT NULL,
  `authoid` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '权限等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`id`,`password`,`authoid`) VALUES 
 ('123','123',1),
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
  PRIMARY KEY (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emp`
--

/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` (`empid`,`empName`,`deptid`) VALUES 
 (1,'小1','003'),
 (2,'小2','003'),
 (3,'小3','002'),
 (4,'小5','003'),
 (5,'zhang','003'),
 (6,'222','002'),
 (7,'333','003'),
 (8,'666','001'),
 (9,'777','002'),
 (10,'333','003'),
 (11,'qqq','002'),
 (12,'www','003'),
 (13,'eee','001');
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
  `remark` varchar(45) NOT NULL COMMENT '备注',
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logger`
--

/*!40000 ALTER TABLE `logger` DISABLE KEYS */;
/*!40000 ALTER TABLE `logger` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
