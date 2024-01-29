/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.1.36-community-log : Database - dbminimarket2110033
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbminimarket2110033` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dbminimarket2110033`;

/*Table structure for table `barang2110033` */

DROP TABLE IF EXISTS `barang2110033`;

CREATE TABLE `barang2110033` (
  `idbarang2110033` char(7) NOT NULL,
  `namabarang2110033` varchar(100) DEFAULT NULL,
  `satuan2110033` varchar(50) DEFAULT NULL,
  `hargabeli2110033` double DEFAULT NULL,
  `hargajual2110033` double DEFAULT NULL,
  `stok2110033` int(11) DEFAULT NULL,
  PRIMARY KEY (`idbarang2110033`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `barang2110033` */

insert  into `barang2110033`(`idbarang2110033`,`namabarang2110033`,`satuan2110033`,`hargabeli2110033`,`hargajual2110033`,`stok2110033`) values ('BRG0001','Biore Man','Botol',10000,12000,5),('BRG0002','Relaxa','Pcs',3000,5000,17),('BRG0003','Lasegar','Botol',4000,5000,40),('BRG0004','Le Mineral','Botol',3000,4000,20),('BRG0005','Green Tea','Pcs',3000,5000,30),('BRG0006','Vaseline','Botol',60000,70000,10),('BRG0007','Nivea','Botol',20000,22000,30);

/*Table structure for table `detailjual2110033` */

DROP TABLE IF EXISTS `detailjual2110033`;

CREATE TABLE `detailjual2110033` (
  `iddetail2110033` int(11) NOT NULL AUTO_INCREMENT,
  `idjual2110033` char(10) DEFAULT NULL,
  `idbarang2110033` char(7) DEFAULT NULL,
  `qty2110033` int(11) DEFAULT NULL,
  `harga2110033` double DEFAULT NULL,
  PRIMARY KEY (`iddetail2110033`),
  KEY `idjual2110033` (`idjual2110033`),
  KEY `idbarang2110033` (`idbarang2110033`),
  CONSTRAINT `detailjual2110033_ibfk_1` FOREIGN KEY (`idjual2110033`) REFERENCES `jual2110033` (`idjual2110033`) ON UPDATE CASCADE,
  CONSTRAINT `detailjual2110033_ibfk_2` FOREIGN KEY (`idbarang2110033`) REFERENCES `barang2110033` (`idbarang2110033`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `detailjual2110033` */

insert  into `detailjual2110033`(`iddetail2110033`,`idjual2110033`,`idbarang2110033`,`qty2110033`,`harga2110033`) values (1,'F0001','BRG0001',5,12000),(2,'F0001','BRG0002',3,5000),(3,'F0002','BRG0003',10,15000),(4,'F0002','BRG0004',5,10000);

/*Table structure for table `jual2110033` */

DROP TABLE IF EXISTS `jual2110033`;

CREATE TABLE `jual2110033` (
  `idjual2110033` char(10) NOT NULL,
  `tgl2110033` date DEFAULT NULL,
  `username2110033` char(5) DEFAULT NULL,
  `total2110033` double DEFAULT NULL,
  PRIMARY KEY (`idjual2110033`),
  KEY `username2110033` (`username2110033`),
  CONSTRAINT `jual2110033_ibfk_1` FOREIGN KEY (`username2110033`) REFERENCES `user2110033` (`username2110033`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jual2110033` */

insert  into `jual2110033`(`idjual2110033`,`tgl2110033`,`username2110033`,`total2110033`) values ('F0001','2023-12-12','A0001',12000),('F0002','2023-12-14','A0002',5000);

/*Table structure for table `user2110033` */

DROP TABLE IF EXISTS `user2110033`;

CREATE TABLE `user2110033` (
  `username2110033` char(5) NOT NULL,
  `nama2110033` varchar(50) DEFAULT NULL,
  `password2110033` varchar(50) DEFAULT NULL,
  `email2110033` varchar(100) DEFAULT NULL,
  `lastlogin2110033` datetime DEFAULT NULL,
  PRIMARY KEY (`username2110033`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user2110033` */

insert  into `user2110033`(`username2110033`,`nama2110033`,`password2110033`,`email2110033`,`lastlogin2110033`) values ('A0001','Yolanda Ssaadah','202cb962ac59075b964b07152d234b70','yolandassa@gmail.com','2024-01-04 12:13:30'),('A0002','Shandra Monalisa','250cf8b51c773f3f8dc8b4be867a9a02','shandramo@gmail.com','2023-12-28 08:24:53'),('A0003','Reslina Darmansyah','68053af2923e00204c3ca7c6a3150cf7','reslinadar@gmail.com','2023-12-28 08:25:44');

/* Trigger structure for table `detailjual2110033` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `t_ai_detailjual2110033` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `t_ai_detailjual2110033` AFTER INSERT ON `detailjual2110033` FOR EACH ROW BEGIN
	update barang2110033 set stok2110033=stok2110033 - new.qty2110033 where idbarang2110033=new.idbarang2110033;
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
