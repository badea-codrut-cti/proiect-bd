-- MariaDB dump 10.19  Distrib 10.11.3-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: lastfm
-- ------------------------------------------------------
-- Server version	10.11.3-MariaDB-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `albume`
--

DROP TABLE IF EXISTS `albume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albume` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(64) NOT NULL,
  `data_lansare` date NOT NULL,
  `trupa` bigint(20) unsigned NOT NULL,
  `oficial` tinyint(1) NOT NULL DEFAULT 0,
  `url_coperta` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nume` (`nume`,`trupa`),
  KEY `trupa` (`trupa`),
  CONSTRAINT `albume_ibfk_1` FOREIGN KEY (`trupa`) REFERENCES `trupe` (`id`) ON DELETE CASCADE,
  CONSTRAINT `albume_len_url_coperta` CHECK (octet_length(`url_coperta`) = 64)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albume`
--

LOCK TABLES `albume` WRITE;
/*!40000 ALTER TABLE `albume` DISABLE KEYS */;
INSERT INTO `albume` VALUES
(1,'BTR','2010-10-11',1,1,'b45efe879d8a8ec308499b7331972768573856af85e93d3d8a4d347b069e7597'),
(2,'Elevate','2011-11-18',1,1,'087e5a4f86e20af2bfe516e69769442ec34a72ee905450b6065419ee7c6c9bfb'),
(3,'Abbey Road','1969-09-26',2,1,'c3bc8888c3c1c5b2077b2d8f7e3d19c852fd4ca8f67d64dec17e3fb0111a4aa4'),
(4,'Revolver','1966-08-05',2,1,'7e7ba52660e92e91a3647e18b6db563750bda1002586313df865ada4bf858279'),
(5,'Juiced up the EP','2016-01-30',3,0,'b363111042341a03a06cbdbf75a125d9dd0e096d662fbf436d0ef3b86c344201'),
(6,'Twilight Zone EP','2016-07-06',3,0,'563dbe894a6af10c9a7f8f35985db5a5e2fda2328dead54b05af63f2e0a6d0a0'),
(7,'Death race for love','2019-03-08',4,1,'43bf04d9e58fce504646862f183dbbd065e1d4ba404d90a07e428cd31bec61ec'),
(8,'Homework','1997-03-25',5,1,'baa43910ab0f0e6b4d3a6a9dda76552459f005bb1ed55525c8c0da77dd3b106f'),
(9,'Discovery','2001-03-13',5,1,'d580c0208805be086c66bed676954e59ae82fa60e48bb6f8323f18b25f565640'),
(10,'Human After All','2005-03-14',5,1,'35716622164264e0c4555fd9c15b85cca4de768fd21295c6fc5bca5d0f043f12'),
(11,'Random Access Memories','2013-05-17',5,1,'693eb68c6deea911739a438fe2dc8aee74f5af37ebf45eeed96caa894578edb5'),
(12,'No Strings Attached','1999-12-31',6,1,'a5a89351c1958e3dc012dfdf3ff1b5c5f66db3d6d757a5347ff5f43c387d31f6'),
(13,'Definitely Maybe','1994-08-19',8,1,'2be44b4d51aca712b2d590c7c25bc03daac4897c5d9f257194c72a72755b99d8');
/*!40000 ALTER TABLE `albume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cantareti`
--

DROP TABLE IF EXISTS `cantareti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cantareti` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(32) NOT NULL,
  `prenume` varchar(32) NOT NULL,
  `data_nastere` date NOT NULL,
  `tara_origine` char(2) NOT NULL,
  `website` varchar(64) DEFAULT NULL,
  `oficial` tinyint(1) NOT NULL DEFAULT 0,
  `url_poza` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `cantaret_tara_origine_iso` CHECK (octet_length(`tara_origine`) = 2),
  CONSTRAINT `cantareti_len_url_poza` CHECK (octet_length(`url_poza`) = 64)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cantareti`
--

LOCK TABLES `cantareti` WRITE;
/*!40000 ALTER TABLE `cantareti` DISABLE KEYS */;
INSERT INTO `cantareti` VALUES
(1,'Kendall','Schmidt','1990-01-02','US',NULL,1,'9314a6c7ce946481c8a69a7d1d2d10e3b10fe401eb9984c57ef822758cd20f30'),
(2,'James','Maslow','1990-07-16','US',NULL,1,'f208dcee37778c8a5b2d417db37e87b2bd6c056013c62ae99445922efdac4589'),
(3,'Logan','Henderson','1989-10-14','US',NULL,1,'e960c966d0cade875e003c5781fc877c8a0d73aa7d5e8a1324a001c4e10d74f0'),
(4,'Carlos','PenaVega','1989-08-15','US',NULL,1,'f6b1405f4b22d29239a8e53e833739d3f3634470d2e4aa76090930626207af83'),
(5,'John','Lennon','1940-10-09','GB',NULL,1,'6e2cfa9b5e9ec51d64ae6e429153b62e7581fdd77b02e878f25e2dd9ed00732b'),
(6,'Paul','McCarney','1942-06-18','GB','https://paulmccartney.com/',1,'e4b67e4d1ef0c1b9bdf4661c596ca23fa2b3214c8b4bf55649b00457114e921e'),
(7,'George','Harrison','1943-02-25','GB',NULL,1,'f5d216b137cf30113b44ad0e97aae2c051af2b207e3a8e16f3b576cda5620de5'),
(8,'Ringo','Starr','1940-07-07','GB','https://ringostarr.com/',1,'85b30fb617e6e55bc313e240de393bf94384e678bade37f6e3cfd41e3de33a37'),
(9,'Jarad','Anthony Higgins','1998-12-02','US',NULL,1,'8a22be9f7fecb0e2b348f969dfa91a09e428e0519cbbc94606a657ae3581aea4'),
(10,'Thomas','Bangalter','1975-01-03','FR',NULL,1,'a29aea13c74bd34f90f0572fcbe8cd4db6c0e7e006ccd35b121faebfb8e3721d'),
(11,'Guy-Manuel','de Homem-Christo','1974-02-08','FR',NULL,1,'61c5b7859e13da3495273e4671bcb4279f337fb66767adb60d37aebd8923fc80'),
(12,'Justin','Randall','1981-01-31','US','https://www.justintimberlake.com/',1,'ff329c4eaf0b8a5f54a1c8d45b7d387d1fcef96db537fbf0d95acc888bd92af4'),
(13,'Noel Gallagher','Thomas','1967-05-29','UK','https://www.noelgallagher.com/',1,'c50a6510a0e14f54c2056d017521ea7c7b98782b797c027d9d82af4d20803aaa'),
(14,'Liam Gallagher','Gallagher','1972-09-21','UK','https://www.liamgallagher.com/',1,'a8dff6c1b07519a4320e7d87fc2b7f9926ac00da4a6ce8f0754e8bf995ae213f'),
(15,'Gem Archer','Mark','1968-03-12','UK',NULL,1,'eddf88c6a850506a33f5558577c787e861aa9a534103fc68b3835afce3ea7af0'),
(16,'Andy Bell','Andrew','1970-05-27','UK',NULL,1,'24ecc41075073bc2438e1a55f94facd409ca5bdb64ffb037533720c9188e69e0'),
(17,'Chris Sharrock','Christopher','1967-07-30','UK',NULL,1,'f46ebb500b9228bfb08e0d26af61ea941561d341e70f3aeda2244678b0f08b60');
/*!40000 ALTER TABLE `cantareti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genuri`
--

DROP TABLE IF EXISTS `genuri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genuri` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `eticheta` varchar(32) NOT NULL,
  `data_infiintat` date NOT NULL,
  `parinte` bigint(20) unsigned DEFAULT NULL,
  `url_emblema` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parinte` (`parinte`),
  CONSTRAINT `genuri_ibfk_1` FOREIGN KEY (`parinte`) REFERENCES `genuri` (`id`) ON DELETE SET NULL,
  CONSTRAINT `len_url_emblema` CHECK (octet_length(`url_emblema`) = 64)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genuri`
--

LOCK TABLES `genuri` WRITE;
/*!40000 ALTER TABLE `genuri` DISABLE KEYS */;
INSERT INTO `genuri` VALUES
(1,'Pop','1955-10-02',NULL,'b87b3e6394dd54c220e2320925c5485fd05c63b07e57d5f70f213a15dcc6ffc1'),
(2,'Rock','1956-11-10',NULL,'4dd67241365243efb7858e780b7fc4bddfa80807a95ad7ee31524da3c88c7b48'),
(3,'Classic Rock','1970-06-15',2,'4c862b90bc12c85e63d1cbc18b50be2128ba2278271f4a2463cc84552f2e4c77'),
(4,'Psychedelic Rock','1980-02-20',2,'cbfddf44800e0747bdd690a83cca5a92be90eef18c56e7ed6ab59e49cd4d7812'),
(5,'Hip-hop','1973-08-11',NULL,'ad18c49e2b0a15e513c8d27820abdc4a0026c3e2932b327047faec210a20beb7'),
(6,'Rap','1973-08-11',5,'13850cbaac56f86875c6425e5be5b6b023679c1ab15d4315f0abbf81057a3184'),
(7,'Trap','1991-04-12',6,'6ab704c85ec344f5a73ce05a970ebc0b2e8a1dce9ec3e26d76a64ca215da0a81'),
(8,'Cloud Rap','2010-10-02',5,'e94c7cd0e7775438eb03afb8374e1883b85124a486c4836bb8591b7454ef1e6a'),
(9,'Emo Rap','2010-11-09',6,'f477ee307bd7654166aa75eb6632f6de79ef1ca57c1704e299083ce42e15619c'),
(10,'Electronic','1953-02-07',NULL,'f644dac5bead0f89171a464608b32eb946ef07aad5be55297ca50e07f1b0c391'),
(11,'Industrial','1973-11-05',10,'dc34a4184e2bd7392f11cf18efcdaa9ce3964e0ece7fbe735fb4f9ce599619d3'),
(13,'Metal','1969-07-15',2,'3672eb23864ba888a036eb838c6de67b4508c37d286f8eb78039e5d9139a49f7'),
(14,'Electropop','1985-07-14',1,'a19ec70fb2fd084ca9c9b27717b9513885e2e49fdff585572fd012f0bdcbe082'),
(15,'Synthpop','1978-08-12',1,'bf9b45287a5b25f407507f00e4c73d490b945484d0417a3167f3574ccfa4f7d8'),
(16,'Techno','1989-11-18',10,'4585da28336354500bad638aa0e8d8668935ab3b4f442aad32adb0dd8d81a3a4');
/*!40000 ALTER TABLE `genuri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genuri_melodii`
--

DROP TABLE IF EXISTS `genuri_melodii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genuri_melodii` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `melodie` bigint(20) unsigned NOT NULL,
  `gen` bigint(20) unsigned NOT NULL,
  `data_adaugare` date NOT NULL DEFAULT current_timestamp(),
  `relevanta` decimal(2,2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `melodie_gen_unice` (`melodie`,`gen`),
  KEY `gen` (`gen`),
  CONSTRAINT `genuri_melodii_ibfk_1` FOREIGN KEY (`melodie`) REFERENCES `melodii` (`id`) ON DELETE CASCADE,
  CONSTRAINT `genuri_melodii_ibfk_2` FOREIGN KEY (`gen`) REFERENCES `genuri` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genuri_melodii`
--

LOCK TABLES `genuri_melodii` WRITE;
/*!40000 ALTER TABLE `genuri_melodii` DISABLE KEYS */;
INSERT INTO `genuri_melodii` VALUES
(1,1,1,'2023-11-30',0.80),
(2,2,1,'2023-11-30',0.80),
(3,3,1,'2023-11-30',0.80),
(4,4,1,'2023-11-30',0.80),
(5,5,1,'2023-11-30',0.80),
(6,6,1,'2023-11-30',0.80),
(7,7,1,'2023-11-30',0.80),
(8,8,1,'2023-11-30',0.80),
(9,9,1,'2023-11-30',0.80),
(10,10,1,'2023-11-30',0.80),
(11,11,1,'2023-11-30',0.80),
(12,12,1,'2023-11-30',0.80),
(13,13,1,'2023-11-30',0.80),
(14,14,1,'2023-11-30',0.80),
(15,15,1,'2023-11-30',0.80),
(16,16,1,'2023-11-30',0.80),
(17,17,1,'2023-11-30',0.80),
(18,18,1,'2023-11-30',0.80),
(19,19,1,'2023-11-30',0.80),
(20,20,1,'2023-11-30',0.80),
(21,21,1,'2023-11-30',0.80),
(22,22,1,'2023-11-30',0.80),
(23,23,1,'2023-11-30',0.80),
(24,24,1,'2023-11-30',0.80),
(25,44,1,'2023-11-30',0.30),
(26,44,2,'2023-11-30',0.50),
(27,44,3,'2023-11-30',0.70),
(28,45,1,'2023-11-30',0.30),
(29,45,2,'2023-11-30',0.50),
(30,45,3,'2023-11-30',0.70),
(31,46,1,'2023-11-30',0.30),
(32,46,2,'2023-11-30',0.50),
(33,46,3,'2023-11-30',0.70),
(34,47,1,'2023-11-30',0.30),
(35,47,2,'2023-11-30',0.50),
(36,47,3,'2023-11-30',0.70),
(37,48,1,'2023-11-30',0.30),
(38,48,2,'2023-11-30',0.50),
(39,48,3,'2023-11-30',0.70),
(40,49,1,'2023-11-30',0.30),
(41,49,2,'2023-11-30',0.50),
(42,49,3,'2023-11-30',0.70),
(43,50,1,'2023-11-30',0.30),
(44,50,2,'2023-11-30',0.50),
(45,50,3,'2023-11-30',0.70),
(46,51,1,'2023-11-30',0.30),
(47,51,2,'2023-11-30',0.50),
(48,51,3,'2023-11-30',0.70),
(49,52,1,'2023-11-30',0.30),
(50,52,2,'2023-11-30',0.50),
(51,52,3,'2023-11-30',0.70),
(52,53,1,'2023-11-30',0.30),
(53,53,2,'2023-11-30',0.50),
(54,53,3,'2023-11-30',0.70),
(55,54,1,'2023-11-30',0.30),
(56,54,2,'2023-11-30',0.50),
(57,54,3,'2023-11-30',0.70),
(58,55,1,'2023-11-30',0.30),
(59,55,2,'2023-11-30',0.50),
(60,55,3,'2023-11-30',0.70),
(61,56,1,'2023-11-30',0.30),
(62,56,2,'2023-11-30',0.50),
(63,56,3,'2023-11-30',0.70),
(64,57,1,'2023-11-30',0.30),
(65,57,2,'2023-11-30',0.50),
(66,57,3,'2023-11-30',0.70),
(67,58,1,'2023-11-30',0.30),
(68,58,2,'2023-11-30',0.50),
(69,58,3,'2023-11-30',0.70),
(70,59,1,'2023-11-30',0.30),
(71,59,2,'2023-11-30',0.50),
(72,59,3,'2023-11-30',0.70),
(73,60,1,'2023-11-30',0.30),
(74,60,2,'2023-11-30',0.50),
(75,60,3,'2023-11-30',0.70),
(76,61,2,'2023-11-30',0.30),
(77,61,3,'2023-11-30',0.50),
(78,61,4,'2023-11-30',0.80),
(79,62,2,'2023-11-30',0.30),
(80,62,3,'2023-11-30',0.50),
(81,62,4,'2023-11-30',0.80),
(82,63,2,'2023-11-30',0.30),
(83,63,3,'2023-11-30',0.50),
(84,63,4,'2023-11-30',0.80),
(85,64,2,'2023-11-30',0.30),
(86,64,3,'2023-11-30',0.50),
(87,64,4,'2023-11-30',0.70),
(88,65,2,'2023-11-30',0.30),
(89,65,3,'2023-11-30',0.50),
(90,65,4,'2023-11-30',0.80),
(91,66,2,'2023-11-30',0.40),
(92,66,3,'2023-11-30',0.50),
(93,66,4,'2023-11-30',0.80),
(94,67,2,'2023-11-30',0.30),
(95,67,3,'2023-11-30',0.50),
(96,67,4,'2023-11-30',0.80),
(97,68,2,'2023-11-30',0.30),
(98,68,3,'2023-11-30',0.50),
(99,68,4,'2023-11-30',0.80),
(100,69,2,'2023-11-30',0.30),
(101,69,3,'2023-11-30',0.50),
(102,69,4,'2023-11-30',0.80),
(103,70,2,'2023-11-30',0.30),
(104,70,3,'2023-11-30',0.50),
(105,70,4,'2023-11-30',0.80),
(106,71,2,'2023-11-30',0.30),
(107,71,3,'2023-11-30',0.50),
(108,71,4,'2023-11-30',0.80),
(109,72,2,'2023-11-30',0.30),
(110,72,3,'2023-11-30',0.50),
(111,72,4,'2023-11-30',0.80),
(112,73,2,'2023-11-30',0.30),
(113,73,3,'2023-11-30',0.50),
(114,73,4,'2023-11-30',0.80),
(115,74,2,'2023-11-30',0.30),
(116,74,3,'2023-11-30',0.50),
(117,74,4,'2023-11-30',0.80),
(118,75,5,'2023-12-02',0.50),
(119,75,6,'2023-12-02',0.70),
(120,75,7,'2023-12-02',0.60),
(121,76,5,'2023-12-02',0.50),
(122,76,6,'2023-12-02',0.70),
(123,76,7,'2023-12-02',0.30),
(124,77,5,'2023-12-02',0.50),
(125,77,6,'2023-12-02',0.70),
(126,77,7,'2023-12-02',0.60),
(127,78,5,'2023-12-02',0.50),
(128,78,6,'2023-12-02',0.70),
(129,78,7,'2023-12-02',0.30),
(130,79,5,'2023-12-02',0.50),
(131,79,6,'2023-12-02',0.70),
(132,79,7,'2023-12-02',0.80),
(133,80,5,'2023-12-02',0.70),
(134,80,6,'2023-12-02',0.80),
(138,82,5,'2023-12-02',0.60),
(139,82,6,'2023-12-02',0.80),
(140,82,7,'2023-12-02',0.90),
(141,82,8,'2023-12-02',0.20),
(142,83,5,'2023-12-02',0.80),
(143,83,6,'2023-12-02',0.80),
(144,83,7,'2023-12-02',0.90),
(145,83,8,'2023-12-02',0.20),
(146,84,5,'2023-12-02',0.70),
(147,84,6,'2023-12-02',0.80),
(148,84,7,'2023-12-02',0.80),
(149,84,8,'2023-12-02',0.20),
(150,85,5,'2023-12-02',0.40),
(151,85,6,'2023-12-02',0.80),
(152,85,7,'2023-12-02',0.60),
(153,85,9,'2023-12-02',0.80),
(154,86,5,'2023-12-02',0.40),
(155,86,6,'2023-12-02',0.80),
(156,86,7,'2023-12-02',0.60),
(157,86,9,'2023-12-02',0.80),
(158,87,5,'2023-12-02',0.40),
(159,87,6,'2023-12-02',0.80),
(160,87,7,'2023-12-02',0.60),
(161,87,9,'2023-12-02',0.80),
(162,88,5,'2023-12-02',0.40),
(163,88,6,'2023-12-02',0.80),
(164,88,7,'2023-12-02',0.60),
(165,88,9,'2023-12-02',0.80),
(166,89,5,'2023-12-02',0.40),
(167,89,6,'2023-12-02',0.80),
(168,89,7,'2023-12-02',0.60),
(169,89,9,'2023-12-02',0.80),
(170,90,5,'2023-12-02',0.40),
(171,90,6,'2023-12-02',0.80),
(172,90,7,'2023-12-02',0.60),
(173,90,9,'2023-12-02',0.80),
(174,91,5,'2023-12-02',0.40),
(175,91,6,'2023-12-02',0.80),
(176,91,7,'2023-12-02',0.60),
(177,91,9,'2023-12-02',0.80),
(178,92,5,'2023-12-02',0.40),
(179,92,6,'2023-12-02',0.80),
(180,92,7,'2023-12-02',0.60),
(181,93,5,'2023-12-02',0.40),
(182,93,6,'2023-12-02',0.80),
(183,93,7,'2023-12-02',0.60),
(184,94,5,'2023-12-02',0.40),
(185,94,6,'2023-12-02',0.80),
(186,94,7,'2023-12-02',0.60),
(187,95,5,'2023-12-02',0.40),
(188,95,6,'2023-12-02',0.80),
(189,95,7,'2023-12-02',0.60),
(190,95,9,'2023-12-02',0.80),
(191,96,5,'2023-12-02',0.40),
(192,96,6,'2023-12-02',0.80),
(193,96,7,'2023-12-02',0.60),
(194,97,5,'2023-12-02',0.40),
(195,97,6,'2023-12-02',0.80),
(196,97,7,'2023-12-02',0.60),
(197,97,9,'2023-12-02',0.80),
(198,98,5,'2023-12-02',0.40),
(199,98,6,'2023-12-02',0.80),
(200,98,7,'2023-12-02',0.60),
(201,98,9,'2023-12-02',0.80),
(202,99,5,'2023-12-02',0.40),
(203,99,6,'2023-12-02',0.80),
(204,99,7,'2023-12-02',0.60),
(206,100,5,'2023-12-02',0.40),
(207,100,6,'2023-12-02',0.80),
(208,100,7,'2023-12-02',0.60),
(209,100,9,'2023-12-02',0.80),
(210,101,5,'2023-12-02',0.40),
(211,101,6,'2023-12-02',0.80),
(212,101,7,'2023-12-02',0.60),
(213,102,5,'2023-12-02',0.40),
(214,102,6,'2023-12-02',0.80),
(215,102,7,'2023-12-02',0.60),
(216,103,5,'2023-12-02',0.40),
(217,103,6,'2023-12-02',0.80),
(218,103,7,'2023-12-02',0.60),
(219,104,5,'2023-12-02',0.40),
(220,104,6,'2023-12-02',0.80),
(221,104,7,'2023-12-02',0.60),
(222,104,9,'2023-12-02',0.80),
(223,105,1,'2023-12-08',0.80),
(224,105,10,'2023-12-08',0.90),
(225,105,14,'2023-12-08',0.50),
(226,105,15,'2023-12-08',0.70),
(227,106,1,'2023-12-08',0.60),
(228,106,10,'2023-12-08',0.70),
(229,106,14,'2023-12-08',0.80),
(230,106,15,'2023-12-08',0.70),
(231,107,1,'2023-12-08',0.60),
(232,107,10,'2023-12-08',0.70),
(233,107,14,'2023-12-08',0.80),
(234,107,15,'2023-12-08',0.70),
(235,108,1,'2023-12-08',0.20),
(236,108,10,'2023-12-08',0.70),
(237,108,14,'2023-12-08',0.80),
(238,108,15,'2023-12-08',0.70),
(239,109,1,'2023-12-08',0.50),
(240,109,10,'2023-12-08',0.70),
(241,109,14,'2023-12-08',0.80),
(242,109,15,'2023-12-08',0.70),
(243,110,1,'2023-12-08',0.50),
(244,110,10,'2023-12-08',0.70),
(245,110,14,'2023-12-08',0.80),
(246,110,15,'2023-12-08',0.70),
(247,111,1,'2023-12-08',0.40),
(248,111,10,'2023-12-08',0.70),
(249,111,14,'2023-12-08',0.80),
(250,111,15,'2023-12-08',0.70),
(251,112,1,'2023-12-08',0.50),
(252,112,10,'2023-12-08',0.70),
(253,112,14,'2023-12-08',0.80),
(254,112,15,'2023-12-08',0.70),
(255,113,1,'2023-12-08',0.80),
(256,113,10,'2023-12-08',0.70),
(257,113,14,'2023-12-08',0.80),
(258,113,15,'2023-12-08',0.70),
(259,114,1,'2023-12-08',0.50),
(260,114,10,'2023-12-08',0.70),
(261,114,14,'2023-12-08',0.80),
(262,114,15,'2023-12-08',0.70),
(263,115,1,'2023-12-08',0.50),
(264,115,10,'2023-12-08',0.70),
(265,115,14,'2023-12-08',0.80),
(266,115,15,'2023-12-08',0.70),
(267,116,1,'2023-12-08',0.50),
(268,116,10,'2023-12-08',0.70),
(269,116,14,'2023-12-08',0.80),
(270,116,15,'2023-12-08',0.70),
(271,117,1,'2023-12-08',0.50),
(272,117,10,'2023-12-08',0.70),
(273,117,14,'2023-12-08',0.80),
(274,117,15,'2023-12-08',0.70),
(278,119,1,'2023-12-08',0.50),
(279,119,10,'2023-12-08',0.90),
(280,119,16,'2023-12-08',0.50),
(281,120,1,'2023-12-08',0.50),
(282,120,10,'2023-12-08',0.90),
(283,120,16,'2023-12-08',0.50),
(284,121,1,'2023-12-08',0.50),
(285,121,10,'2023-12-08',0.90),
(286,121,16,'2023-12-08',0.50),
(287,122,1,'2023-12-08',0.50),
(288,122,10,'2023-12-08',0.90),
(289,122,16,'2023-12-08',0.50),
(290,123,1,'2023-12-08',0.50),
(291,123,10,'2023-12-08',0.90),
(292,123,16,'2023-12-08',0.50),
(293,124,1,'2023-12-08',0.50),
(294,124,10,'2023-12-08',0.90),
(295,124,16,'2023-12-08',0.50),
(296,125,1,'2023-12-08',0.40),
(297,125,10,'2023-12-08',0.80),
(298,125,16,'2023-12-08',0.50),
(299,126,1,'2023-12-08',0.50),
(300,126,10,'2023-12-08',0.90),
(301,126,16,'2023-12-08',0.50),
(302,127,1,'2023-12-08',0.50),
(303,127,10,'2023-12-08',0.90),
(304,127,16,'2023-12-08',0.50),
(305,128,1,'2023-12-08',0.50),
(306,128,10,'2023-12-08',0.99),
(307,128,16,'2023-12-08',0.50),
(308,129,1,'2023-12-08',0.40),
(309,129,10,'2023-12-08',0.90),
(310,129,16,'2023-12-08',0.50),
(311,130,1,'2023-12-08',0.50),
(312,130,10,'2023-12-08',0.80),
(313,130,16,'2023-12-08',0.70),
(314,145,1,'2023-12-08',0.90),
(315,145,10,'2023-12-08',0.70),
(316,145,16,'2023-12-08',0.30),
(317,146,1,'2023-12-08',0.70),
(318,146,10,'2023-12-08',0.70),
(319,146,16,'2023-12-08',0.30),
(320,147,1,'2023-12-08',0.70),
(321,147,10,'2023-12-08',0.70),
(322,147,16,'2023-12-08',0.30),
(323,148,1,'2023-12-08',0.70),
(324,148,10,'2023-12-08',0.70),
(325,148,16,'2023-12-08',0.30),
(326,149,1,'2023-12-08',0.70),
(327,149,10,'2023-12-08',0.50),
(328,149,16,'2023-12-08',0.30),
(329,150,1,'2023-12-08',0.70),
(330,150,10,'2023-12-08',0.70),
(332,151,1,'2023-12-08',0.70),
(333,151,10,'2023-12-08',0.70),
(334,151,16,'2023-12-08',0.50),
(335,152,1,'2023-12-08',0.90),
(336,152,10,'2023-12-08',0.70),
(337,152,16,'2023-12-08',0.30),
(338,153,1,'2023-12-08',0.70),
(339,153,10,'2023-12-08',0.70),
(340,153,16,'2023-12-08',0.30),
(341,154,1,'2023-12-08',0.70),
(342,154,10,'2023-12-08',0.70),
(343,154,16,'2023-12-08',0.30),
(344,155,1,'2023-12-08',0.70),
(345,155,10,'2023-12-08',0.70),
(346,155,16,'2023-12-08',0.30),
(347,156,1,'2023-12-08',0.70),
(348,156,10,'2023-12-08',0.70),
(349,156,16,'2023-12-08',0.30),
(350,157,1,'2023-12-08',0.70),
(351,157,10,'2023-12-08',0.70),
(352,157,16,'2023-12-08',0.30),
(353,158,1,'2023-12-08',0.40),
(354,158,10,'2023-12-08',0.60),
(355,158,16,'2023-12-08',0.30),
(356,159,1,'2023-12-08',0.50),
(357,159,10,'2023-12-08',0.80),
(358,159,16,'2023-12-08',0.50),
(359,160,1,'2023-12-08',0.70),
(360,160,10,'2023-12-08',0.90),
(361,160,16,'2023-12-08',0.50),
(362,161,1,'2023-12-08',0.70),
(363,161,10,'2023-12-08',0.80),
(364,161,16,'2023-12-08',0.40),
(365,162,1,'2023-12-08',0.70),
(366,162,10,'2023-12-08',0.80),
(367,162,16,'2023-12-08',0.50),
(368,163,1,'2023-12-08',0.70),
(369,163,10,'2023-12-08',0.80),
(370,163,16,'2023-12-08',0.50),
(371,164,1,'2023-12-08',0.70),
(372,164,10,'2023-12-08',0.80),
(373,164,16,'2023-12-08',0.30),
(374,165,1,'2023-12-08',0.70),
(375,165,10,'2023-12-08',0.80),
(376,165,16,'2023-12-08',0.50),
(377,166,1,'2023-12-08',0.70),
(378,166,10,'2023-12-08',0.80),
(379,166,16,'2023-12-08',0.50),
(380,167,1,'2023-12-08',0.70),
(381,167,10,'2023-12-08',0.80),
(382,167,16,'2023-12-08',0.20),
(383,182,1,'2023-12-27',0.10),
(384,182,2,'2023-12-27',0.90),
(385,183,1,'2023-12-27',0.20),
(386,183,2,'2023-12-27',0.70),
(387,184,1,'2023-12-27',0.20),
(388,184,2,'2023-12-27',0.70),
(389,185,1,'2023-12-27',0.20),
(390,185,2,'2023-12-27',0.70),
(391,186,1,'2023-12-27',0.20),
(392,186,2,'2023-12-27',0.70),
(393,187,1,'2023-12-27',0.10),
(394,187,2,'2023-12-27',0.80),
(395,188,1,'2023-12-27',0.20),
(396,188,2,'2023-12-27',0.70),
(397,189,1,'2023-12-27',0.20),
(398,189,2,'2023-12-27',0.70),
(399,190,1,'2023-12-27',0.20),
(400,190,2,'2023-12-27',0.70),
(401,191,1,'2023-12-27',0.20),
(402,191,2,'2023-12-27',0.70),
(403,192,1,'2023-12-27',0.50),
(404,192,2,'2023-12-27',0.60);
/*!40000 ALTER TABLE `genuri_melodii` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `istoric_artisti`
--

DROP TABLE IF EXISTS `istoric_artisti`;
/*!50001 DROP VIEW IF EXISTS `istoric_artisti`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `istoric_artisti` AS SELECT
 1 AS `id`,
  1 AS `cantaret`,
  1 AS `data_intrare`,
  1 AS `data_plecare`,
  1 AS `trupa`,
  1 AS `nume`,
  1 AS `url_poza` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `istoric_trupe`
--

DROP TABLE IF EXISTS `istoric_trupe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istoric_trupe` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cantaret` bigint(20) unsigned NOT NULL,
  `trupa` bigint(20) unsigned NOT NULL,
  `data_intrare` date NOT NULL,
  `data_plecare` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cantaret` (`cantaret`),
  KEY `trupa` (`trupa`),
  CONSTRAINT `istoric_trupe_ibfk_1` FOREIGN KEY (`cantaret`) REFERENCES `cantareti` (`id`) ON DELETE CASCADE,
  CONSTRAINT `istoric_trupe_ibfk_2` FOREIGN KEY (`trupa`) REFERENCES `trupe` (`id`) ON DELETE CASCADE,
  CONSTRAINT `CONSTRAINT_1` CHECK (`data_plecare` >= `data_intrare` or `data_plecare` is null)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istoric_trupe`
--

LOCK TABLES `istoric_trupe` WRITE;
/*!40000 ALTER TABLE `istoric_trupe` DISABLE KEYS */;
INSERT INTO `istoric_trupe` VALUES
(1,1,1,'2009-11-28','2013-07-15'),
(2,2,1,'2009-11-28','2013-07-15'),
(3,3,1,'2009-11-28','2013-07-15'),
(4,4,1,'2009-11-28','2013-07-15'),
(5,1,1,'2021-07-19',NULL),
(6,2,1,'2021-07-19',NULL),
(7,3,1,'2021-07-19',NULL),
(8,4,1,'2021-07-19',NULL),
(9,5,2,'1957-07-12','1970-04-10'),
(10,6,2,'1957-07-12','1970-09-27'),
(11,7,2,'1960-08-15','1970-11-29'),
(12,8,2,'1962-08-19','1970-09-27'),
(13,9,3,'2015-10-11','2017-12-03'),
(14,9,4,'2017-12-03',NULL),
(15,10,5,'1993-02-09','2021-02-22'),
(16,11,5,'1993-02-09','2021-02-22'),
(18,12,6,'1995-04-22','2002-03-21'),
(19,13,8,'1991-05-10','2009-10-01'),
(20,14,8,'1991-05-10','2009-10-01'),
(21,15,8,'1995-06-15','2009-10-01'),
(22,16,8,'1998-05-23','2009-10-01'),
(23,17,8,'2004-10-02','2009-10-01'),
(24,14,9,'2009-10-02','2014-08-21'),
(25,15,9,'2009-10-02','2014-08-21'),
(26,16,9,'2009-10-02','2014-08-21');
/*!40000 ALTER TABLE `istoric_trupe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `melodii`
--

DROP TABLE IF EXISTS `melodii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `melodii` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(64) NOT NULL,
  `album` bigint(20) unsigned NOT NULL,
  `ascultari` bigint(20) unsigned NOT NULL DEFAULT 0,
  `durata` bigint(20) unsigned NOT NULL,
  `calitate` enum('MP3_320kbps','MP3_128kbps','FLAC_16bit','FLAC_24bit','FLAC_32bit') NOT NULL,
  `data_lansare` date NOT NULL,
  `limba` char(2) NOT NULL,
  `explicit` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `melodii_unique_album_nume` (`album`,`nume`),
  CONSTRAINT `melodii_ibfk_1` FOREIGN KEY (`album`) REFERENCES `albume` (`id`) ON DELETE CASCADE,
  CONSTRAINT `limba_iso` CHECK (octet_length(`limba`) = 2)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `melodii`
--

LOCK TABLES `melodii` WRITE;
/*!40000 ALTER TABLE `melodii` DISABLE KEYS */;
INSERT INTO `melodii` VALUES
(1,'Til I Forget About You',1,101285,237,'MP3_320kbps','2010-10-11','GB',0),
(2,'Boyfriend',1,261042,248,'MP3_320kbps','2010-10-11','GB',0),
(3,'City Is Ours',1,62139,192,'MP3_320kbps','2010-10-11','GB',0),
(4,'Nothing Even Matters',1,45375,228,'MP3_320kbps','2010-10-11','GB',0),
(5,'Worldwide',1,101145,224,'MP3_320kbps','2010-10-11','GB',0),
(6,'Halfway There',1,75471,212,'MP3_320kbps','2010-10-11','GB',0),
(7,'Big Night',1,45873,196,'MP3_320kbps','2010-10-11','GB',0),
(8,'Oh Yeah',1,35654,204,'MP3_320kbps','2010-10-11','GB',0),
(9,'Count On You',1,21752,209,'MP3_320kbps','2010-10-11','GB',0),
(10,'I Know You Know',1,12534,175,'MP3_320kbps','2010-10-11','GB',0),
(11,'Big Time Rush (Theme)',1,968,197,'MP3_320kbps','2010-10-11','GB',0),
(12,'Music Sounds Better With U',2,14683,189,'MP3_320kbps','2011-11-18','GB',0),
(13,'Show Me',2,22157,170,'MP3_320kbps','2011-11-18','GB',0),
(14,'All Over Again',2,19057,218,'MP3_320kbps','2011-11-18','GB',0),
(15,'No Idea',2,21646,300,'MP3_320kbps','2011-11-18','GB',0),
(16,'Cover Girl',2,23891,180,'MP3_320kbps','2011-11-18','GB',0),
(17,'Love Me Love Me',2,22479,181,'MP3_320kbps','2011-11-18','GB',0),
(18,'If I Ruled The World',2,20553,180,'MP3_320kbps','2011-11-18','GB',0),
(19,'Invisible',2,16609,200,'MP3_320kbps','2011-11-18','GB',0),
(20,'Time of Our Life',2,18519,207,'MP3_320kbps','2011-11-18','GB',0),
(21,'Superstar',2,26415,203,'MP3_320kbps','2011-11-18','GB',0),
(22,'You\'re Not Alone',2,13537,233,'MP3_320kbps','2011-11-18','GB',0),
(23,'Elevate',2,33188,185,'MP3_320kbps','2011-11-18','GB',0),
(24,'Blow Your Speakers',2,3672,192,'MP3_320kbps','2011-11-18','GB',0),
(44,'Come Together',3,1031,260,'FLAC_32bit','1969-09-26','GB',0),
(45,'Something',3,853541,184,'FLAC_24bit','1969-09-26','GB',0),
(46,'Maxwell\'s Silver Hammer',3,515250,207,'FLAC_32bit','1969-09-26','GB',0),
(47,'Oh! Darling',3,583134,209,'FLAC_24bit','1969-09-26','GB',0),
(48,'Octopus\'s Garden',3,619117,172,'FLAC_24bit','1969-09-26','GB',0),
(49,'I Want You (She\'s So Heavy)',3,474532,467,'FLAC_16bit','1969-09-26','GB',0),
(50,'Here Comes the Sun',3,913369,187,'FLAC_24bit','1969-09-26','GB',0),
(51,'Because',3,604766,165,'FLAC_24bit','1969-09-26','GB',0),
(52,'You Never Give Me Your Money',3,474529,242,'FLAC_24bit','1969-09-26','GB',0),
(53,'Sun King',3,457228,146,'FLAC_24bit','1969-09-26','GB',0),
(54,'Mean Mr. Mustard',3,401143,66,'FLAC_24bit','1969-09-26','GB',0),
(55,'Polythene Pam',3,468026,72,'FLAC_24bit','1969-09-26','GB',0),
(56,'She Came in Through the Bathroom Window',3,468231,117,'FLAC_24bit','1969-09-26','GB',0),
(57,'Golden Slumbers',3,511866,91,'FLAC_24bit','1969-09-26','GB',0),
(58,'Carry That Weight',3,473521,96,'FLAC_24bit','1969-09-26','GB',0),
(59,'The End',3,466169,139,'FLAC_24bit','1969-09-26','GB',0),
(60,'Her Majesty',3,45381,364,'FLAC_32bit','1969-09-26','GB',0),
(61,'Taxman',4,474989,158,'FLAC_16bit','1966-08-06','GB',0),
(62,'Eleanor Rigby',4,1047,128,'FLAC_16bit','1966-08-05','GB',0),
(63,'I\'m Only Sleeping',4,454923,178,'FLAC_16bit','1966-08-05','GB',0),
(64,'Love You To',4,403160,181,'FLAC_16bit','1966-08-05','GB',0),
(65,'Here, There and Everywhere',4,431742,144,'FLAC_16bit','1966-08-07','GB',0),
(66,'Yellow Submarine',4,944226,158,'FLAC_16bit','1966-08-06','GB',0),
(67,'She Said She Said',4,384762,157,'FLAC_16bit','1966-08-05','GB',0),
(68,'Good Day Sunshine',4,432677,130,'FLAC_24bit','1966-08-05','GB',0),
(69,'And Your Bird Can Sing',4,443184,122,'FLAC_16bit','1966-08-05','GB',0),
(70,'For No One',4,450393,122,'FLAC_16bit','1966-08-05','GB',0),
(71,'Doctor Robert',4,379724,137,'FLAC_16bit','1966-08-05','GB',0),
(72,'I Want to Tell You',4,379649,150,'FLAC_16bit','1966-08-05','GB',0),
(73,'Got to Get You Into My Life',4,417830,148,'MP3_320kbps','1966-08-05','GB',0),
(74,'Tomorrow Never Knows',4,437423,177,'FLAC_16bit','1966-08-05','GB',0),
(75,'I Swear',5,978,251,'MP3_320kbps','2016-01-30','GB',0),
(76,'Pretty Boy',5,846,215,'MP3_128kbps','2016-01-30','GB',0),
(77,'Too Smooth',5,1523,204,'MP3_128kbps','2016-01-30','GB',0),
(78,'RUNNAWAY FREESTYLE',5,914,343,'MP3_128kbps','2016-01-30','GB',1),
(79,'WOAH',5,1892,240,'MP3_128kbps','2016-01-30','GB',1),
(80,'Midnight',6,10200,243,'MP3_320kbps','2016-07-06','GB',0),
(82,'Cruising',6,7300,255,'MP3_320kbps','2016-07-06','GB',1),
(83,'Dream$',6,10100,243,'MP3_320kbps','2016-07-07','GB',1),
(84,'5AM (I\'m cool)',6,11100,340,'MP3_320kbps','2016-07-06','GB',0),
(85,'Empty',7,242294,190,'FLAC_16bit','2019-03-08','GB',1),
(86,'Maze',7,197965,210,'FLAC_16bit','2019-03-08','GB',1),
(87,'HeMotions',7,123833,310,'FLAC_16bit','2019-03-08','GB',1),
(88,'Fast',7,221758,208,'FLAC_16bit','2019-03-08','GB',0),
(89,'Hear Me Calling',7,198061,189,'FLAC_16bit','2019-03-08','GB',1),
(90,'Big',7,100462,295,'FLAC_16bit','2019-03-08','GB',1),
(91,'Robbery',7,428802,244,'FLAC_16bit','2019-03-08','GB',1),
(92,'Flaws and Sins',7,181925,189,'FLAC_16bit','2019-03-08','GB',0),
(93,'Feeling',7,190944,310,'FLAC_16bit','2019-03-08','GB',1),
(94,'Who Shot Cupid?',7,133665,190,'FLAC_16bit','2019-03-08','GB',1),
(95,'Ring Ring',7,345,171,'FLAC_16bit','2019-03-08','GB',0),
(96,'Desire',7,101274,124,'FLAC_16bit','2019-03-08','GB',1),
(97,'Out My Way',7,98947,131,'FLAC_16bit','2019-03-08','GB',1),
(98,'The Bees Knees',7,106800,300,'FLAC_16bit','2019-03-08','GB',1),
(99,'ON GOD',7,419,250,'FLAC_16bit','2019-03-08','GB',1),
(100,'10 Feet',7,111357,301,'FLAC_16bit','2019-03-08','GB',0),
(101,'Won\'t Let Go',7,6010,200,'FLAC_16bit','2019-03-08','GB',0),
(102,'She\'s the One',7,6076,188,'FLAC_16bit','2019-03-08','GB',0),
(103,'Rider',7,95716,167,'FLAC_16bit','2019-03-08','GB',1),
(104,'Make Believe',7,185985,152,'FLAC_16bit','2019-03-08','GB',1),
(105,'Give Life Back to Music',11,751071,177,'FLAC_16bit','2013-05-17','GB',0),
(106,'The Game of Love',11,620565,322,'FLAC_16bit','2013-05-17','GB',0),
(107,'Giorgio by Moroder',11,659705,544,'FLAC_32bit','2013-05-18','GB',0),
(108,'Within',11,575262,228,'FLAC_16bit','2013-05-17','GB',0),
(109,'Instant Crush',11,1008,337,'FLAC_24bit','2013-05-17','GB',0),
(110,'Lose Yourself to Dance',11,831422,353,'FLAC_16bit','2013-05-17','GB',0),
(111,'Touch',11,536335,498,'FLAC_16bit','2013-05-17','GB',0),
(112,'Get Lucky',11,796992,233,'FLAC_24bit','2013-05-17','GB',0),
(113,'Beyond',11,533111,290,'FLAC_16bit','2013-05-17','GB',0),
(114,'Motherboard',11,486201,341,'FLAC_16bit','2013-05-17','GB',0),
(115,'Fragments of Time',11,508530,279,'FLAC_16bit','2013-05-17','GB',0),
(116,'Doin\' It Right',11,629628,251,'FLAC_16bit','2013-05-17','GB',0),
(117,'Contact',11,471776,383,'FLAC_16bit','2013-05-17','GB',0),
(119,'Revolution 909',8,515537,335,'FLAC_16bit','1996-09-24','GB',0),
(120,'Da Funk',8,760030,227,'FLAC_16bit','1996-09-24','GB',0),
(121,'Phoenix',8,347880,297,'FLAC_16bit','1996-09-24','GB',0),
(122,'Around the World',8,1286,240,'FLAC_16bit','1996-09-24','GB',0),
(123,'Teachers',8,310488,172,'FLAC_16bit','1996-09-24','GB',0),
(124,'High Fidelity',8,295730,360,'FLAC_16bit','1996-09-24','GB',0),
(125,'Rock\'n Roll',8,188042,452,'FLAC_16bit','1996-09-24','GB',0),
(126,'Oh Yeah',8,284701,121,'FLAC_16bit','1996-09-24','GB',0),
(127,'Burnin\'',8,274796,414,'FLAC_16bit','1996-09-24','GB',0),
(128,'Indo Silver Club',8,256583,274,'FLAC_16bit','1996-09-24','GB',0),
(129,'Alive',8,358845,269,'FLAC_16bit','1996-09-24','GB',0),
(130,'Funk Ad',8,276370,50,'FLAC_16bit','1996-09-24','GB',0),
(145,'One More Time',9,1671421,236,'FLAC_24bit','2001-01-22','GB',0),
(146,'Aerodynamic',9,1023231,208,'FLAC_16bit','2001-01-22','GB',0),
(147,'Digital Love',9,1086865,301,'FLAC_16bit','2001-01-22','GB',0),
(148,'Harder, Better, Faster, Stronger',9,1634,224,'FLAC_32bit','2001-01-22','GB',0),
(149,'Crescendolls',9,728930,207,'FLAC_16bit','2001-01-22','GB',0),
(150,'Nightvision',9,723940,103,'FLAC_16bit','2001-01-22','GB',0),
(151,'Superheroes',9,653054,237,'FLAC_16bit','2001-01-22','GB',0),
(152,'High Life',9,656891,201,'FLAC_16bit','2001-01-22','GB',0),
(153,'Something About Us',9,1091,232,'FLAC_16bit','2001-01-22','GB',0),
(154,'Voyager',9,754947,227,'FLAC_16bit','2001-01-22','GB',0),
(155,'Veridis Quo',9,779485,344,'FLAC_16bit','2001-01-22','GB',0),
(156,'Short Circuit',9,568362,206,'FLAC_16bit','2001-01-22','GB',0),
(157,'Face to Face',9,759313,243,'FLAC_16bit','2001-01-22','GB',0),
(158,'Too Long',9,496481,322,'FLAC_16bit','2001-01-22','GB',0),
(159,'Human After All',10,492859,320,'FLAC_32bit','2005-03-01','GB',0),
(160,'The Prime Time of Your Life',10,337358,263,'FLAC_16bit','2005-03-01','GB',0),
(161,'Robot Rock',10,713466,461,'FLAC_16bit','2005-03-01','GB',0),
(162,'Steam Machine',10,274271,405,'FLAC_16bit','2005-03-01','GB',0),
(163,'Make Love',10,406422,289,'FLAC_16bit','2005-03-01','GB',0),
(164,'The Brainwasher',10,255202,248,'FLAC_16bit','2005-03-01','GB',0),
(165,'Television Rules the Nation',10,293744,290,'FLAC_16bit','2005-03-01','GB',0),
(166,'Technologic',10,791093,428,'FLAC_16bit','2005-03-01','GB',0),
(167,'Emotion',10,256543,417,'FLAC_16bit','2005-03-01','GB',0),
(168,'Bye Bye Bye',12,705707,200,'FLAC_16bit','2000-01-01','EN',0),
(169,'It\'s Gonna Be Me',12,396017,191,'MP3_320kbps','2000-01-01','EN',0),
(170,'Just Got Paid',12,56593,248,'MP3_320kbps','2000-01-01','EN',0),
(171,'It Makes Me Ill',12,68724,206,'MP3_320kbps','2000-01-01','EN',0),
(172,'This I Promise You',12,191358,265,'MP3_320kbps','2000-01-01','EN',0),
(173,'No Strings Attached',12,60682,230,'MP3_320kbps','2000-01-01','EN',0),
(174,'Digital Get Down',12,50815,263,'MP3_320kbps','2000-01-01','EN',0),
(175,'Bringin\' Da Noise',12,36385,210,'MP3_320kbps','2000-01-01','EN',0),
(176,'I\'ll Be Good for You',12,32612,236,'MP3_320kbps','2000-01-01','EN',0),
(177,'I Thought She Knew',12,40718,200,'MP3_320kbps','2000-01-01','EN',0),
(178,'If I\'m Not The One',12,13577,204,'MP3_320kbps','2000-01-01','EN',0),
(179,'I\'ll Never Stop',12,29862,206,'MP3_320kbps','2000-01-01','EN',0),
(180,'If Only in Heaven\'s Eyes',12,5595,277,'MP3_320kbps','2000-01-01','EN',0),
(181,'Bye Bye Bye (Teddy Riley Club Remix)',12,1107,329,'MP3_128kbps','2000-08-15','EN',0),
(182,'Rock \'N\' Roll Star',13,343172,326,'FLAC_16bit','1994-08-19','EN',0),
(183,'Shakermaker',13,296816,308,'FLAC_16bit','1994-08-19','EN',0),
(184,'Live Forever',13,795274,276,'FLAC_16bit','1994-08-19','EN',0),
(185,'Up in the Sky',13,243846,199,'FLAC_16bit','1994-08-19','EN',0),
(186,'Columbia',13,232840,409,'FLAC_16bit','1994-08-19','EN',0),
(187,'Supersonic',13,602840,284,'FLAC_16bit','1994-08-19','EN',0),
(188,'Bring It on Down',13,226091,245,'FLAC_16bit','1994-08-19','EN',0),
(189,'Cigarettes & Alcohol',13,337819,289,'FLAC_16bit','1994-08-19','EN',0),
(190,'Digsy\'s Dinner',13,200299,166,'FLAC_16bit','1994-08-19','EN',0),
(191,'Slide Away',13,352088,362,'FLAC_16bit','1994-08-19','EN',0),
(192,'Married With Children',13,281180,196,'FLAC_16bit','1994-08-19','EN',0);
/*!40000 ALTER TABLE `melodii` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlisturi`
--

DROP TABLE IF EXISTS `playlisturi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlisturi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(64) NOT NULL,
  `data_creat` date NOT NULL,
  `privat` tinyint(1) NOT NULL DEFAULT 0,
  `ascultari` bigint(20) unsigned NOT NULL DEFAULT 0,
  `creator` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `playlist_unic_nume` (`nume`,`creator`),
  KEY `creator` (`creator`),
  CONSTRAINT `playlisturi_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `utilizatori` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlisturi`
--

LOCK TABLES `playlisturi` WRITE;
/*!40000 ALTER TABLE `playlisturi` DISABLE KEYS */;
INSERT INTO `playlisturi` VALUES
(1,'Melodii vechi','2023-12-08',0,753,1);
/*!40000 ALTER TABLE `playlisturi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlisturi_melodii`
--

DROP TABLE IF EXISTS `playlisturi_melodii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlisturi_melodii` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `playlist` bigint(20) unsigned NOT NULL,
  `melodie` bigint(20) unsigned NOT NULL,
  `data_adaugare` date NOT NULL DEFAULT current_timestamp(),
  `pozitie` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `playlist_pozitie_unica` (`playlist`,`pozitie`),
  KEY `melodie` (`melodie`),
  CONSTRAINT `playlisturi_melodii_ibfk_1` FOREIGN KEY (`playlist`) REFERENCES `playlisturi` (`id`) ON DELETE CASCADE,
  CONSTRAINT `playlisturi_melodii_ibfk_2` FOREIGN KEY (`melodie`) REFERENCES `melodii` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlisturi_melodii`
--

LOCK TABLES `playlisturi_melodii` WRITE;
/*!40000 ALTER TABLE `playlisturi_melodii` DISABLE KEYS */;
INSERT INTO `playlisturi_melodii` VALUES
(1,1,60,'2023-12-08',4),
(3,1,130,'2023-12-08',1),
(4,1,147,'2023-12-08',3),
(6,1,148,'2023-12-11',2);
/*!40000 ALTER TABLE `playlisturi_melodii` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `statistici`
--

DROP TABLE IF EXISTS `statistici`;
/*!50001 DROP VIEW IF EXISTS `statistici`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `statistici` AS SELECT
 1 AS `cantareti`,
  1 AS `trupe`,
  1 AS `albume`,
  1 AS `genuri`,
  1 AS `utilizatori`,
  1 AS `playlisturi` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `trupe`
--

DROP TABLE IF EXISTS `trupe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trupe` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(64) NOT NULL,
  `data_lansare` date NOT NULL,
  `tara_origine` char(2) NOT NULL,
  `website` varchar(64) DEFAULT NULL,
  `oficial` tinyint(1) NOT NULL DEFAULT 0,
  `url_poza` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `tara_origine_iso` CHECK (octet_length(`tara_origine`) = 2),
  CONSTRAINT `trupa_len_url_poza` CHECK (octet_length(`url_poza`) = 64)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trupe`
--

LOCK TABLES `trupe` WRITE;
/*!40000 ALTER TABLE `trupe` DISABLE KEYS */;
INSERT INTO `trupe` VALUES
(1,'Big Time Rush','2009-11-28','US','https://bigtimerush.com/',1,'b2469a3009264f7eea5aae166ede42b92255f2ac82a216b9cd681f60afc11604'),
(2,'The Beatles','1957-07-12','GB','https://www.thebeatles.com/',1,'6f2d1b8dde71ab26134cfb2e32167c1c7b1b5d289321b0cc72ca29037cdb3b78'),
(3,'Juicethekidd','2015-12-02','US',NULL,0,'db34f4359539222d37232e14aa63f84061cdb3021e64b7700da35354362b4953'),
(4,'Juice WRLD','2017-12-03','US','https://999club.com',1,'8561ae9e515df455e40748a0aa696997fabc4c048af6dc8f639b9b1ce76d5c05'),
(5,'Daft Punk','1993-02-09','FR','http://www.daftpunk.com/',1,'d8f19f01198d22e9ceba724dd92146e56d9f51a138fd8f27d43a48bffabc40ed'),
(6,'*NSYNC','1995-04-22','US','https://www.nsync.com/',1,'7bf948b0d86db7f2c160810f830326adc208b4f864e78484430e39713cfa8357'),
(8,'Oasis','1991-05-10','UK',NULL,1,'1cf818a5f199d0eb02277fe096294689e2c83fe93d069a773b6aea1072bd1ade'),
(9,'Beady Eye','2009-10-01','UK',NULL,0,'dcba93568d2b2753ff1e08991308f6b01a7bb802c842662329604db47110ac6d');
/*!40000 ALTER TABLE `trupe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilizatori`
--

DROP TABLE IF EXISTS `utilizatori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilizatori` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `parola` char(64) DEFAULT NULL,
  `data_inregistrare` date NOT NULL,
  `data_nasterii` date DEFAULT NULL,
  `tara_origine` char(2) DEFAULT NULL,
  `url_poza` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `user_tara_origine_iso` CHECK (octet_length(`tara_origine`) = 2),
  CONSTRAINT `user_len_url_poza` CHECK (octet_length(`url_poza`) = 64),
  CONSTRAINT `data_nastere_invalida` CHECK (`data_nasterii` <= `data_inregistrare`),
  CONSTRAINT `parola_is_hash` CHECK (octet_length(`parola`) = 64)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilizatori`
--

LOCK TABLES `utilizatori` WRITE;
/*!40000 ALTER TABLE `utilizatori` DISABLE KEYS */;
INSERT INTO `utilizatori` VALUES
(1,'codrea_tiribomba','oreoezi@oreo.ac','6ecf7f1b540a0254882bd78e70e6b494689a44e3904e49bb80b4957ecd9443ad','2023-12-02','2003-12-09','RO','0b83d16c5125bbe17b3f1863dc2917a5303b4255831b2d534db4973451793af4'),
(2,'imrazvanbadea','contact@artone.studio','4502935e025f1cc5ff9c1d2d7f953938923402f8a5cfc4b00a219fc74182f543','2023-12-20','2002-06-15','RO','2838840e7e6fd84028b6d4ee272678b7a32d073ef1c5ec3cf8b29a618dc0477c');
/*!40000 ALTER TABLE `utilizatori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `istoric_artisti`
--

/*!50001 DROP VIEW IF EXISTS `istoric_artisti`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`codrut`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `istoric_artisti` AS select `it`.`id` AS `id`,`it`.`cantaret` AS `cantaret`,`it`.`data_intrare` AS `data_intrare`,`it`.`data_plecare` AS `data_plecare`,`it`.`trupa` AS `trupa`,`tr`.`nume` AS `nume`,`tr`.`url_poza` AS `url_poza` from (`istoric_trupe` `it` join `trupe` `tr` on(`it`.`trupa` = `tr`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statistici`
--

/*!50001 DROP VIEW IF EXISTS `statistici`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`codrut`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `statistici` AS select (select count(`cantareti`.`id`) from `cantareti`) AS `cantareti`,(select count(`trupe`.`id`) from `trupe`) AS `trupe`,(select count(`albume`.`id`) from `albume`) AS `albume`,(select count(`genuri`.`id`) from `genuri`) AS `genuri`,(select count(`utilizatori`.`id`) from `utilizatori`) AS `utilizatori`,(select count(`playlisturi`.`id`) from `playlisturi`) AS `playlisturi` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-05 16:01:41
