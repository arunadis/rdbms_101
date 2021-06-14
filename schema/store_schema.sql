-- MySQL dump 10.13  Distrib 8.0.23, for osx10.15 (x86_64)
--
-- Host: localhost    Database: STORE
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOMER` (
  `ID` varchar(36) NOT NULL,
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `IS_ACTIVE` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CUSTOMER_PHONE`
--

DROP TABLE IF EXISTS `CUSTOMER_PHONE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOMER_PHONE` (
  `ID` varchar(36) NOT NULL,
  `CUSTOMER_ID` varchar(36) NOT NULL,
  `AREA_CODE` int NOT NULL,
  `EXCHANGE` int NOT NULL,
  `NUMBER` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CUSTOMER_PHONE` (`CUSTOMER_ID`),
  CONSTRAINT `FK_CUSTOMER_PHONE` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DAILY_SALES_SUMMARY`
--

DROP TABLE IF EXISTS `DAILY_SALES_SUMMARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DAILY_SALES_SUMMARY` (
  `DATE` date NOT NULL,
  `STORE_ID` varchar(10) NOT NULL,
  `TOTAL_SALE` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `TOTAL_TAX` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `TOTLA_TIP` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `TOTAL_DISCOUNT` decimal(10,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`STORE_ID`,`DATE`),
  CONSTRAINT `FK_STORE_SALES_SUMARY` FOREIGN KEY (`STORE_ID`) REFERENCES `store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `STORE`
--

DROP TABLE IF EXISTS `STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STORE` (
  `ID` varchar(10) NOT NULL,
  `NAME` varchar(150) DEFAULT NULL,
  `IMAGE` blob,
  `CREATED_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_CREATED_TIME` (`CREATED_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `STORE_SETTINGS`
--

DROP TABLE IF EXISTS `STORE_SETTINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STORE_SETTINGS` (
  `ID` varchar(36) NOT NULL,
  `STORE_ID` varchar(10) NOT NULL,
  `SETTING_KEY` varchar(50) NOT NULL,
  `SETTING_VALUE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_STORE_SETTING` (`STORE_ID`),
  CONSTRAINT `FK_STORE_SETTING` FOREIGN KEY (`STORE_ID`) REFERENCES `store` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TRANSACTIONS`
--

DROP TABLE IF EXISTS `TRANSACTIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TRANSACTIONS` (
  `ID` varchar(36) NOT NULL,
  `STORE_ID` varchar(10) DEFAULT NULL,
  `CUSTOMER_ID` varchar(36) NOT NULL,
  `ORDER_NUMBER` varchar(20) DEFAULT NULL,
  `TAX` double(9,2) NOT NULL DEFAULT '0.00',
  `TIP` double(9,2) NOT NULL DEFAULT '0.00',
  `TOTAL` double(10,2) NOT NULL,
  `DISCOUNT` double(9,2) DEFAULT '0.00',
  `CREATED_TIME` bigint DEFAULT NULL,
  `CLOSED_TIME` bigint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CUSTOMER` (`CUSTOMER_ID`),
  CONSTRAINT `FK_CUSTOMER` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-13 17:04:01
