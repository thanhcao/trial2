CREATE DATABASE  IF NOT EXISTS `ssm_b564_dev` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `ssm_b564_dev`;
-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: 192.168.1.30    Database: ssm_b564_dev
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.12.04.1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CalibData`
--

DROP TABLE IF EXISTS `CalibData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CalibData` (
  `ID` varchar(36) COLLATE utf8_bin NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `rssi` double DEFAULT NULL,
  `calibpoint_id` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  `ibeacon_id` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK340E4991BCFC084F` (`calibpoint_id`),
  CONSTRAINT `FK340E4991BCFC084F` FOREIGN KEY (`calibpoint_id`) REFERENCES `CalibPoint` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CalibPoint`
--

DROP TABLE IF EXISTS `CalibPoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CalibPoint` (
  `ID` varchar(36) COLLATE utf8_bin NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `description` longtext COLLATE utf8_bin,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `signalmodel_id` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  `floor_id` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK4E6A3889588E3145` (`signalmodel_id`),
  CONSTRAINT `FK4E6A3889588E3145` FOREIGN KEY (`signalmodel_id`) REFERENCES `SignalModel` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ChartType`
--

DROP TABLE IF EXISTS `ChartType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChartType` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReportType`
--

DROP TABLE IF EXISTS `ReportType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReportType` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(255) NOT NULL,
  `URL` varchar(45) DEFAULT NULL,
  `SUPPORTTYPE` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SignalModel`
--

DROP TABLE IF EXISTS `SignalModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SignalModel` (
  `ID` varchar(36) COLLATE utf8_bin NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `description` longtext COLLATE utf8_bin,
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TemplateReport`
--

DROP TABLE IF EXISTS `TemplateReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TemplateReport` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(255) NOT NULL,
  `CHARTTYPE_ID` varchar(36) DEFAULT NULL,
  `REPORTTYPE_ID` varchar(36) DEFAULT NULL,
  `INTERVAL_VALUE` int(11) DEFAULT NULL,
  `INTERVAL_TYPE` varchar(10) DEFAULT NULL,
  `MALL_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK60A2166E283650E5` (`CHARTTYPE_ID`),
  KEY `FK60A2166E85EF666F` (`REPORTTYPE_ID`),
  KEY `FK60A2166E173AEC4F` (`MALL_ID`),
  CONSTRAINT `FK60A2166E173AEC4F` FOREIGN KEY (`MALL_ID`) REFERENCES `mall` (`ID`),
  CONSTRAINT `FK60A2166E283650E5` FOREIGN KEY (`CHARTTYPE_ID`) REFERENCES `ChartType` (`ID`),
  CONSTRAINT `FK60A2166E85EF666F` FOREIGN KEY (`REPORTTYPE_ID`) REFERENCES `ReportType` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TemplateReport_AUD`
--

DROP TABLE IF EXISTS `TemplateReport_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TemplateReport_AUD` (
  `ID` varchar(36) COLLATE utf8_bin NOT NULL,
  `REV` bigint(20) NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `CHARTTYPE_ID` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  `REPORTTYPE_ID` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`,`REV`),
  KEY `FK7BE15D3FA3CD18AE` (`REV`),
  CONSTRAINT `FK7BE15D3FA3CD18AE` FOREIGN KEY (`REV`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserConnection`
--

DROP TABLE IF EXISTS `UserConnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserConnection` (
  `userId` varchar(255) NOT NULL,
  `providerId` varchar(255) NOT NULL,
  `providerUserId` varchar(255) NOT NULL DEFAULT '',
  `rank` int(11) NOT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `profileUrl` varchar(512) DEFAULT NULL,
  `imageUrl` varchar(512) DEFAULT NULL,
  `accessToken` varchar(255) NOT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `refreshToken` varchar(255) DEFAULT NULL,
  `expireTime` bigint(20) DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT '0',
  PRIMARY KEY (`userId`,`providerId`,`providerUserId`),
  UNIQUE KEY `UserConnectionRank` (`userId`,`providerId`,`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activation_token`
--

DROP TABLE IF EXISTS `activation_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activation_token` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `COUNT` int(11) NOT NULL,
  `TOKEN` varchar(255) DEFAULT NULL,
  `USERID` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activitylog`
--

DROP TABLE IF EXISTS `activitylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activitylog` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `ACTION_TYPE` int(11) DEFAULT NULL,
  `DEST_ID` varchar(255) DEFAULT NULL,
  `DEST_TYPE` varchar(255) DEFAULT NULL,
  `METADATA` varchar(255) DEFAULT NULL,
  `SOURCE_ID` varchar(255) DEFAULT NULL,
  `SOURCE_TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `age_category`
--

DROP TABLE IF EXISTS `age_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `age_category` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `MAX_AGE` int(11) DEFAULT NULL,
  `MIN_AGE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `COMPANY_ID` varchar(36) DEFAULT NULL,
  `LOGO_ID` varchar(36) DEFAULT NULL,
  `MALL_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK59A4B8728FD4D65` (`COMPANY_ID`),
  KEY `FK59A4B87DFD33115` (`LOGO_ID`),
  KEY `FK59A4B87173AEC4F` (`MALL_ID`),
  CONSTRAINT `FK59A4B87173AEC4F` FOREIGN KEY (`MALL_ID`) REFERENCES `mall` (`ID`),
  CONSTRAINT `FK59A4B8728FD4D65` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`),
  CONSTRAINT `FK59A4B87DFD33115` FOREIGN KEY (`LOGO_ID`) REFERENCES `image` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `aesUid` bigint(20) DEFAULT NULL,
  `description` longtext,
  `height` float DEFAULT NULL,
  `lenght` float DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `offsetX` float DEFAULT NULL,
  `offsetY` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `campuse_id` varchar(36) DEFAULT NULL,
  `mall_id` varchar(36) DEFAULT NULL,
  `ROUTING_DATA` mediumblob,
  `INIT_FLOOR_NUMBER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKAABA12B417B9F8C5` (`campuse_id`),
  KEY `FKAABA12B4173AEC4F` (`mall_id`),
  CONSTRAINT `FKAABA12B4173AEC4F` FOREIGN KEY (`mall_id`) REFERENCES `mall` (`ID`),
  CONSTRAINT `FKAABA12B417B9F8C5` FOREIGN KEY (`campuse_id`) REFERENCES `campuse` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businessType`
--

DROP TABLE IF EXISTS `businessType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessType` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `description` longtext,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calibrationmodel`
--

DROP TABLE IF EXISTS `calibrationmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calibrationmodel` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `description` longtext,
  `name` varchar(32) DEFAULT NULL,
  `floor_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKB0A2037F43D2A5C5` (`floor_id`),
  CONSTRAINT `FKB0A2037F43D2A5C5` FOREIGN KEY (`floor_id`) REFERENCES `floor` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `END` datetime NOT NULL,
  `EXPECTED_NUMBER_OF_NEW_ENTRIES` int(11) DEFAULT NULL,
  `EXPECTED_NUMBER_OF_NEW_ENTRIES_UNIT` varchar(255) DEFAULT NULL,
  `EXPECTED_NUMBER_OF_SHOPPERS_UNIT` varchar(255) DEFAULT NULL,
  `EXPECTED_NUMBER_OF_SHOPPERS` int(11) DEFAULT NULL,
  `EXPECTED_TIME_SPEND_PER_SHOPPER` int(11) DEFAULT NULL,
  `START` datetime NOT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `STOPPED_DATE` datetime DEFAULT NULL,
  `TIME_SPEND_UNIT` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) NOT NULL,
  `BRAND_ID` varchar(36) DEFAULT NULL,
  `CATEGORY_ID` varchar(36) DEFAULT NULL,
  `COMPANY_ID` varchar(36) DEFAULT NULL,
  `SUB_BRAND_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKF7A90110C9852FE5` (`BRAND_ID`),
  KEY `FKF7A90110975FF98F` (`CATEGORY_ID`),
  KEY `FKF7A9011028FD4D65` (`COMPANY_ID`),
  KEY `FKF7A90110C47935AE` (`SUB_BRAND_ID`),
  CONSTRAINT `FKF7A9011028FD4D65` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`),
  CONSTRAINT `FKF7A90110975FF98F` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`ID`),
  CONSTRAINT `FKF7A90110C47935AE` FOREIGN KEY (`SUB_BRAND_ID`) REFERENCES `sub_brand` (`ID`),
  CONSTRAINT `FKF7A90110C9852FE5` FOREIGN KEY (`BRAND_ID`) REFERENCES `brand` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaign_event`
--

DROP TABLE IF EXISTS `campaign_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_event` (
  `CAMPAIGN_ID` varchar(36) NOT NULL,
  `EVENT_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CAMPAIGN_ID`,`EVENT_ID`),
  KEY `FKB16ACAABDBC87305` (`EVENT_ID`),
  KEY `FKB16ACAABAC91A84F` (`CAMPAIGN_ID`),
  CONSTRAINT `FKB16ACAABAC91A84F` FOREIGN KEY (`CAMPAIGN_ID`) REFERENCES `campaign` (`ID`),
  CONSTRAINT `FKB16ACAABDBC87305` FOREIGN KEY (`EVENT_ID`) REFERENCES `event` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaign_promotion`
--

DROP TABLE IF EXISTS `campaign_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_promotion` (
  `CAMPAIGN_ID` varchar(36) NOT NULL,
  `PROMOTION_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CAMPAIGN_ID`,`PROMOTION_ID`),
  KEY `FKE304E43423378CE5` (`PROMOTION_ID`),
  KEY `FKE304E434AC91A84F` (`CAMPAIGN_ID`),
  CONSTRAINT `FKE304E43423378CE5` FOREIGN KEY (`PROMOTION_ID`) REFERENCES `promotion` (`ID`),
  CONSTRAINT `FKE304E434AC91A84F` FOREIGN KEY (`CAMPAIGN_ID`) REFERENCES `campaign` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campuse`
--

DROP TABLE IF EXISTS `campuse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campuse` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `aesUid` bigint(20) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `lenght` float DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `width` float DEFAULT NULL,
  `map_id` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK20C3AF665F93B45E` (`map_id`),
  CONSTRAINT `FK20C3AF665F93B45E` FOREIGN KEY (`map_id`) REFERENCES `sitemap` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `business_type` varchar(255) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(255) DEFAULT NULL,
  `ICON_ID` varchar(36) DEFAULT NULL,
  `MALL_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK302BCFE4735162F` (`ICON_ID`),
  KEY `FK302BCFE173AEC4F` (`MALL_ID`),
  CONSTRAINT `FK302BCFE173AEC4F` FOREIGN KEY (`MALL_ID`) REFERENCES `mall` (`ID`),
  CONSTRAINT `FK302BCFE4735162F` FOREIGN KEY (`ICON_ID`) REFERENCES `icon` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category_activity`
--

DROP TABLE IF EXISTS `category_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_activity` (
  `CATEGORY_ID` varchar(255) NOT NULL,
  `ACTIVITY_ID` varchar(36) DEFAULT NULL,
  `INTERNAL_CATEGORY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`),
  KEY `FK31E02530975FF98F` (`CATEGORY_ID`),
  KEY `FK31E0253090D2ACCC` (`ACTIVITY_ID`),
  KEY `FK31E02530ED0DA3EA` (`INTERNAL_CATEGORY_ID`),
  CONSTRAINT `FK31E0253090D2ACCC` FOREIGN KEY (`ACTIVITY_ID`) REFERENCES `internal_activity` (`ID`),
  CONSTRAINT `FK31E02530975FF98F` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`ID`),
  CONSTRAINT `FK31E02530ED0DA3EA` FOREIGN KEY (`INTERNAL_CATEGORY_ID`) REFERENCES `internal_category` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category_mapping`
--

DROP TABLE IF EXISTS `category_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_mapping` (
  `CATEGORY_ID` varchar(36) NOT NULL,
  `INTERNAL_CATEGORY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`,`INTERNAL_CATEGORY_ID`),
  KEY `FKFCE89E8D975FF98F` (`CATEGORY_ID`),
  KEY `FKFCE89E8DED0DA3EA` (`INTERNAL_CATEGORY_ID`),
  CONSTRAINT `FKFCE89E8D975FF98F` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`ID`),
  CONSTRAINT `FKFCE89E8DED0DA3EA` FOREIGN KEY (`INTERNAL_CATEGORY_ID`) REFERENCES `internal_category` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `EMAIL` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `PHONE` varchar(255) DEFAULT NULL,
  `LOGO_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK38A73C7DDFD33115` (`LOGO_ID`),
  CONSTRAINT `FK38A73C7DDFD33115` FOREIGN KEY (`LOGO_ID`) REFERENCES `image` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `calling_code` varchar(255) DEFAULT NULL,
  `cctld` varchar(255) DEFAULT NULL,
  `iso2` char(2) DEFAULT NULL,
  `iso3` char(3) DEFAULT NULL,
  `long_name` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `numcode` varchar(255) DEFAULT NULL,
  `un_member` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SYMBOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dashboard`
--

DROP TABLE IF EXISTS `dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `CONTENT` longtext,
  `DESCRIPTION` longtext,
  `NAME` varchar(255) NOT NULL,
  `USER` varchar(36) DEFAULT NULL,
  `MALL_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKC18AEA94E5C3FAAB` (`USER`),
  KEY `FKC18AEA94173AEC4F` (`MALL_ID`),
  CONSTRAINT `FKC18AEA94173AEC4F` FOREIGN KEY (`MALL_ID`) REFERENCES `mall` (`ID`),
  CONSTRAINT `FKC18AEA94E5C3FAAB` FOREIGN KEY (`USER`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `draft`
--

DROP TABLE IF EXISTS `draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `draft` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `DETAIL` blob,
  `OWNER_ID` varchar(255) DEFAULT NULL,
  `DRAFT_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ecoupon`
--

DROP TABLE IF EXISTS `ecoupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecoupon` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `END` datetime NOT NULL,
  `ISSUER` varchar(255) DEFAULT NULL,
  `NUMBER_OF_COUPONS` int(11) DEFAULT NULL,
  `NUMBER_OF_GOTTEN` int(11) DEFAULT NULL,
  `OWNER_ID` varchar(255) DEFAULT NULL,
  `START` datetime NOT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `IMAGE_ID` varchar(36) DEFAULT NULL,
  `MALL_ID` varchar(36) DEFAULT NULL,
  `QR_IMAGE_ID` varchar(36) DEFAULT NULL,
  `ZONE_ID` varchar(36) DEFAULT NULL,
  `SHOP_ID` varchar(36) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `NUMBER_OF_REDEEM` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK8E1838CB982C6F65` (`IMAGE_ID`),
  KEY `FK8E1838CB173AEC4F` (`MALL_ID`),
  KEY `FK8E1838CB1F38E7C3` (`QR_IMAGE_ID`),
  KEY `FK8E1838CBDEEEE54F` (`ZONE_ID`),
  KEY `FK8E1838CB60C1290F` (`SHOP_ID`),
  CONSTRAINT `FK8E1838CB173AEC4F` FOREIGN KEY (`MALL_ID`) REFERENCES `mall` (`ID`),
  CONSTRAINT `FK8E1838CB1F38E7C3` FOREIGN KEY (`QR_IMAGE_ID`) REFERENCES `image` (`ID`),
  CONSTRAINT `FK8E1838CB60C1290F` FOREIGN KEY (`SHOP_ID`) REFERENCES `shop` (`ID`),
  CONSTRAINT `FK8E1838CB982C6F65` FOREIGN KEY (`IMAGE_ID`) REFERENCES `image` (`ID`),
  CONSTRAINT `FK8E1838CBDEEEE54F` FOREIGN KEY (`ZONE_ID`) REFERENCES `zone` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ecoupon_zone`
--

DROP TABLE IF EXISTS `ecoupon_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecoupon_zone` (
  `ECOUPON_ID` varchar(36) NOT NULL,
  `ZONE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ECOUPON_ID`,`ZONE_ID`),
  KEY `FK70266AA0DEEEE54F` (`ZONE_ID`),
  KEY `FK70266AA02F142EC5` (`ECOUPON_ID`),
  CONSTRAINT `FK70266AA02F142EC5` FOREIGN KEY (`ECOUPON_ID`) REFERENCES `ecoupon` (`ID`),
  CONSTRAINT `FK70266AA0DEEEE54F` FOREIGN KEY (`ZONE_ID`) REFERENCES `zone` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `education_category`
--

DROP TABLE IF EXISTS `education_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education_category` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `CONTENT` longtext,
  `DISCOUNT` decimal(19,2) DEFAULT NULL,
  `EFFECT_FROM` time DEFAULT NULL,
  `EFFECT_TO` time DEFAULT NULL,
  `END` datetime NOT NULL,
  `NEW_PRICE` decimal(19,2) DEFAULT NULL,
  `OLD_PRICE` decimal(19,2) DEFAULT NULL,
  `OTHER` longtext,
  `PRIORITY` int(11) NOT NULL,
  `START` datetime NOT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `STOPPED_DATE` datetime DEFAULT NULL,
  `TITLE` longtext NOT NULL,
  `BANNER_IMAGE_ID` varchar(36) DEFAULT NULL,
  `BRAND_ID` varchar(36) DEFAULT NULL,
  `CATEGORY_ID` varchar(36) DEFAULT NULL,
  `CURRENCY_ID` varchar(36) DEFAULT NULL,
  `SHOP_ID` varchar(36) DEFAULT NULL,
  `SUB_BRAND_ID` varchar(36) DEFAULT NULL,
  `MALL_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK5C6729AEA2A7318` (`BANNER_IMAGE_ID`),
  KEY `FK5C6729AC9852FE5` (`BRAND_ID`),
  KEY `FK5C6729A975FF98F` (`CATEGORY_ID`),
  KEY `FK5C6729A7DF7BCAF` (`CURRENCY_ID`),
  KEY `FK5C6729A60C1290F` (`SHOP_ID`),
  KEY `FK5C6729AC47935AE` (`SUB_BRAND_ID`),
  KEY `FK5C6729A173AEC4F` (`MALL_ID`),
  CONSTRAINT `FK5C6729A173AEC4F` FOREIGN KEY (`MALL_ID`) REFERENCES `mall` (`ID`),
  CONSTRAINT `FK5C6729A60C1290F` FOREIGN KEY (`SHOP_ID`) REFERENCES `shop` (`ID`),
  CONSTRAINT `FK5C6729A7DF7BCAF` FOREIGN KEY (`CURRENCY_ID`) REFERENCES `currency` (`ID`),
  CONSTRAINT `FK5C6729A975FF98F` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`ID`),
  CONSTRAINT `FK5C6729AC47935AE` FOREIGN KEY (`SUB_BRAND_ID`) REFERENCES `sub_brand` (`ID`),
  CONSTRAINT `FK5C6729AC9852FE5` FOREIGN KEY (`BRAND_ID`) REFERENCES `brand` (`ID`),
  CONSTRAINT `FK5C6729AEA2A7318` FOREIGN KEY (`BANNER_IMAGE_ID`) REFERENCES `image` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_AUD`
--

DROP TABLE IF EXISTS `event_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_AUD` (
  `ID` varchar(36) NOT NULL,
  `REV` bigint(20) NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `CONTENT` longtext,
  `DISCOUNT` decimal(19,2) DEFAULT NULL,
  `EFFECT_FROM` time DEFAULT NULL,
  `EFFECT_TO` time DEFAULT NULL,
  `END` datetime DEFAULT NULL,
  `NEW_PRICE` decimal(19,2) DEFAULT NULL,
  `OLD_PRICE` decimal(19,2) DEFAULT NULL,
  `OTHER` longtext,
  `PRIORITY` int(11) DEFAULT NULL,
  `START` datetime DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `STOPPED_DATE` datetime DEFAULT NULL,
  `TITLE` longtext,
  `BANNER_IMAGE_ID` varchar(36) DEFAULT NULL,
  `BRAND_ID` varchar(36) DEFAULT NULL,
  `CATEGORY_ID` varchar(36) DEFAULT NULL,
  `CURRENCY_ID` varchar(36) DEFAULT NULL,
  `SHOP_ID` varchar(36) DEFAULT NULL,
  `SUB_BRAND_ID` varchar(36) DEFAULT NULL,
  `MALL_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`,`REV`),
  KEY `FK1E3C36BA3CD18AE` (`REV`),
  CONSTRAINT `FK1E3C36BA3CD18AE` FOREIGN KEY (`REV`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_delivery`
--

DROP TABLE IF EXISTS `event_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_delivery` (
  `EVENT_ID` varchar(36) NOT NULL,
  `DELIVERY` varchar(255) DEFAULT NULL,
  KEY `FKF80227F9DBC87305` (`EVENT_ID`),
  CONSTRAINT `FKF80227F9DBC87305` FOREIGN KEY (`EVENT_ID`) REFERENCES `event` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_delivery_AUD`
--

DROP TABLE IF EXISTS `event_delivery_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_delivery_AUD` (
  `REV` bigint(20) NOT NULL,
  `EVENT_ID` varchar(36) COLLATE utf8_bin NOT NULL,
  `DELIVERY` varchar(255) COLLATE utf8_bin NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`REV`,`EVENT_ID`,`DELIVERY`),
  KEY `FK5A77B14AA3CD18AE` (`REV`),
  CONSTRAINT `FK5A77B14AA3CD18AE` FOREIGN KEY (`REV`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_image`
--

DROP TABLE IF EXISTS `event_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_image` (
  `EVENT_ID` varchar(36) NOT NULL,
  `IMAGE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`EVENT_ID`,`IMAGE_ID`),
  KEY `FK1A3FA376982C6F65` (`IMAGE_ID`),
  KEY `FK1A3FA376DBC87305` (`EVENT_ID`),
  CONSTRAINT `FK1A3FA376982C6F65` FOREIGN KEY (`IMAGE_ID`) REFERENCES `image` (`ID`),
  CONSTRAINT `FK1A3FA376DBC87305` FOREIGN KEY (`EVENT_ID`) REFERENCES `event` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_image_AUD`
--

DROP TABLE IF EXISTS `event_image_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_image_AUD` (
  `REV` bigint(20) NOT NULL,
  `EVENT_ID` varchar(36) NOT NULL,
  `IMAGE_ID` varchar(36) NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`REV`,`EVENT_ID`,`IMAGE_ID`),
  KEY `FKE2612647A3CD18AE` (`REV`),
  CONSTRAINT `FKE2612647A3CD18AE` FOREIGN KEY (`REV`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_zone`
--

DROP TABLE IF EXISTS `event_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_zone` (
  `EVENT_ID` varchar(36) NOT NULL,
  `ZONE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`EVENT_ID`,`ZONE_ID`),
  KEY `FK3AAEFA31DEEEE54F` (`ZONE_ID`),
  KEY `FK3AAEFA31DBC87305` (`EVENT_ID`),
  CONSTRAINT `FK3AAEFA31DBC87305` FOREIGN KEY (`EVENT_ID`) REFERENCES `event` (`ID`),
  CONSTRAINT `FK3AAEFA31DEEEE54F` FOREIGN KEY (`ZONE_ID`) REFERENCES `zone` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_zone_AUD`
--

DROP TABLE IF EXISTS `event_zone_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_zone_AUD` (
  `REV` bigint(20) NOT NULL,
  `EVENT_ID` varchar(36) NOT NULL,
  `ZONE_ID` varchar(36) NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`REV`,`EVENT_ID`,`ZONE_ID`),
  KEY `FKF980A782A3CD18AE` (`REV`),
  CONSTRAINT `FKF980A782A3CD18AE` FOREIGN KEY (`REV`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature` (
  `ID` varchar(255) NOT NULL,
  `FEATURE_NAME` varchar(255) DEFAULT NULL,
  `CREATED_DATE` timestamp NULL DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `floor`
--

DROP TABLE IF EXISTS `floor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `floor` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `feature` varchar(35) DEFAULT NULL,
  `description` longtext,
  `height` float DEFAULT '0',
  `image` longtext,
  `length` float DEFAULT '0',
  `name` varchar(32) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `width` float DEFAULT '0',
  `building_id` varchar(36) DEFAULT NULL,
  `floor_image_id` varchar(36) DEFAULT NULL,
  `INIT_ZOOM` float DEFAULT NULL,
  `MAX_ZOOM` float DEFAULT NULL,
  `MIN_CALL_OUT_ZOOM` float DEFAULT NULL,
  `MIN_SHOP_ICON_ZOOM` float DEFAULT NULL,
  `MIN_SHOP_NAME_ZOOM` float DEFAULT NULL,
  `MIN_ZOOM` float DEFAULT NULL,
  `orientation` float DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK5D0240C8EF695CF` (`building_id`),
  KEY `FK5D0240C9EDD5D56` (`floor_image_id`),
  CONSTRAINT `FK5D0240C8EF695CF` FOREIGN KEY (`building_id`) REFERENCES `building` (`ID`),
  CONSTRAINT `FK5D0240C9EDD5D56` FOREIGN KEY (`floor_image_id`) REFERENCES `floor_image` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `floor_image`
--

DROP TABLE IF EXISTS `floor_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `floor_image` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `description` longtext,
  `length` float DEFAULT NULL,
  `mapurl` longtext,
  `width` float DEFAULT NULL,
  `thumbnail_id` varchar(36) DEFAULT NULL,
  `svgurl` longtext,
  PRIMARY KEY (`ID`),
  KEY `FKED06F768B6255234` (`thumbnail_id`),
  CONSTRAINT `FKED06F768B6255234` FOREIGN KEY (`thumbnail_id`) REFERENCES `image` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fss_flashsale`
--

DROP TABLE IF EXISTS `fss_flashsale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fss_flashsale` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `CONTENT` longtext,
  `START` datetime NOT NULL,
  `END` datetime NOT NULL,
  `EFFECT_FROM` time DEFAULT NULL,
  `EFFECT_TO` time DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `CATEGORY_ID` varchar(36) DEFAULT NULL,
  `CURRENCY_ID` varchar(36) DEFAULT NULL,
  `FLASHSALE_TYPE` varchar(255) DEFAULT NULL,
  `SHOP_ID` varchar(36) NOT NULL,
  `ORDER_COMPLETED_NUMBER` int(11) DEFAULT NULL,
  `ORDER_NUMBER` int(11) DEFAULT NULL,
  `BANNER_IMAGE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKC2AB607E975FF98F` (`CATEGORY_ID`),
  KEY `FKC2AB607E7DF7BCAF` (`CURRENCY_ID`),
  KEY `FKC2AB607E60C1290F` (`SHOP_ID`),
  KEY `FKC2AB607EEA2A7318` (`BANNER_IMAGE_ID`),
  CONSTRAINT `FKC2AB607EEA2A7318` FOREIGN KEY (`BANNER_IMAGE_ID`) REFERENCES `image` (`ID`),
  CONSTRAINT `FKC2AB607E60C1290F` FOREIGN KEY (`SHOP_ID`) REFERENCES `shop` (`ID`),
  CONSTRAINT `FKC2AB607E7DF7BCAF` FOREIGN KEY (`CURRENCY_ID`) REFERENCES `currency` (`ID`),
  CONSTRAINT `FKC2AB607E975FF98F` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fss_flashsale_AUD`
--

DROP TABLE IF EXISTS `fss_flashsale_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fss_flashsale_AUD` (
  `ID` varchar(36) COLLATE utf8_bin NOT NULL,
  `REV` bigint(20) NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `CATEGORY_ID` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  `CURRENCY_ID` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  `SHOP_ID` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  `BANNER_IMAGE_ID` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`,`REV`),
  KEY `FKC5171F4FA3CD18AE` (`REV`),
  CONSTRAINT `FKC5171F4FA3CD18AE` FOREIGN KEY (`REV`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fss_flashsale_image`
--

DROP TABLE IF EXISTS `fss_flashsale_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fss_flashsale_image` (
  `FLASHSALE_ID` varchar(36) NOT NULL,
  `IMAGE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`FLASHSALE_ID`,`IMAGE_ID`),
  KEY `FKDE0B965A982C6F65` (`IMAGE_ID`),
  KEY `FKDE0B965A461545E9` (`FLASHSALE_ID`),
  CONSTRAINT `FKDE0B965A461545E9` FOREIGN KEY (`FLASHSALE_ID`) REFERENCES `fss_flashsale` (`ID`),
  CONSTRAINT `FKDE0B965A982C6F65` FOREIGN KEY (`IMAGE_ID`) REFERENCES `image` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fss_flashsale_image_AUD`
--

DROP TABLE IF EXISTS `fss_flashsale_image_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fss_flashsale_image_AUD` (
  `REV` bigint(20) NOT NULL,
  `FLASHSALE_ID` varchar(36) COLLATE utf8_bin NOT NULL,
  `IMAGE_ID` varchar(36) COLLATE utf8_bin NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`REV`,`FLASHSALE_ID`,`IMAGE_ID`),
  KEY `FK2771072BA3CD18AE` (`REV`),
  CONSTRAINT `FK2771072BA3CD18AE` FOREIGN KEY (`REV`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fss_invoice`
--

DROP TABLE IF EXISTS `fss_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fss_invoice` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `AMOUNT` bigint(20) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `FSS_ORDER_ID` varchar(36) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKAC40D134281E28C2` (`FSS_ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fss_order`
--

DROP TABLE IF EXISTS `fss_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fss_order` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `AMOUNT` bigint(20) DEFAULT NULL,
  `CREDIT_CARD_INFO` varchar(255) DEFAULT NULL,
  `ITEM_INFO` longtext,
  `STATUS` varchar(32) DEFAULT NULL,
  `CURRENCY_ID` varchar(36) DEFAULT NULL,
  `SHOP_ID` varchar(36) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `FSS_TRANSACTION_ID` varchar(36) DEFAULT NULL,
  `STATUS_MSG` varchar(255) DEFAULT NULL,
  `LAST_MODIFIED_USER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK2945EB157DF7BCAF` (`CURRENCY_ID`),
  KEY `FK2945EB1560C1290F` (`SHOP_ID`),
  KEY `FK2945EB15DCC7FCEF` (`USER_ID`),
  KEY `FK2945EB1560C85C02` (`LAST_MODIFIED_USER_ID`),
  CONSTRAINT `FK2945EB1560C1290F` FOREIGN KEY (`SHOP_ID`) REFERENCES `shop` (`ID`),
  CONSTRAINT `FK2945EB1560C85C02` FOREIGN KEY (`LAST_MODIFIED_USER_ID`) REFERENCES `user` (`ID`),
  CONSTRAINT `FK2945EB157DF7BCAF` FOREIGN KEY (`CURRENCY_ID`) REFERENCES `currency` (`ID`),
  CONSTRAINT `FK2945EB15DCC7FCEF` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fss_order_action_tracking`
--

DROP TABLE IF EXISTS `fss_order_action_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fss_order_action_tracking` (
  `ID` varchar(36) COLLATE utf8_bin NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `ACTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FSS_ORDER_ID` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fss_payment_transaction`
--

DROP TABLE IF EXISTS `fss_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fss_payment_transaction` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `AMOUNT` bigint(20) DEFAULT NULL,
  `RESPONSE` varchar(255) DEFAULT NULL,
  `FSS_ORDER_ID` varchar(36) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `TRANSACTION_ID` varchar(36) DEFAULT NULL,
  `CANCEL_RESPONSE` varchar(255) DEFAULT NULL,
  `PAY_RESPONSE` varchar(255) DEFAULT NULL,
  `PREAUTH_RESPONSE` varchar(255) DEFAULT NULL,
  `REFUND_RESPONSE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK2B9B45AC988114F5` (`FSS_ORDER_ID`),
  KEY `FK2B9B45AC281E28C2` (`FSS_ORDER_ID`),
  CONSTRAINT `FK2B9B45AC281E28C2` FOREIGN KEY (`FSS_ORDER_ID`) REFERENCES `fss_order` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groupTable`
--

DROP TABLE IF EXISTS `groupTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupTable` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `description` longtext,
  `name` varchar(32) DEFAULT NULL,
  `floor_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK4BCD8C8F43D2A5C5` (`floor_id`),
  CONSTRAINT `FK4BCD8C8F43D2A5C5` FOREIGN KEY (`floor_id`) REFERENCES `floor` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iBeacon`
--

DROP TABLE IF EXISTS `iBeacon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iBeacon` (
  `id` varchar(36) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `time_interval` int(11) DEFAULT NULL,
  `mac_address` varchar(20) DEFAULT NULL,
  `UUID` varchar(36) DEFAULT NULL,
  `minor` int(11) DEFAULT NULL,
  `major` int(11) DEFAULT NULL,
  `broacasting_power` int(11) DEFAULT NULL,
  `radius` double DEFAULT NULL,
  `x` double DEFAULT '0',
  `y` double DEFAULT '0',
  `zone_id` varchar(36) DEFAULT NULL,
  `floor_id` varchar(36) DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5D0240C9ED45D57_idx` (`floor_id`),
  KEY `FK5D0240C9ED45D56_idx` (`zone_id`),
  CONSTRAINT `FK5D0240C9ED45D56` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`ID`),
  CONSTRAINT `FK5D0240C9ED45D57` FOREIGN KEY (`floor_id`) REFERENCES `floor` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ibeaconpoint`
--

DROP TABLE IF EXISTS `ibeaconpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibeaconpoint` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `description` longtext,
  `ibeacons` mediumblob NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `calibmodel_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK944C67C384BAF34C` (`calibmodel_id`),
  CONSTRAINT `FK944C67C384BAF34C` FOREIGN KEY (`calibmodel_id`) REFERENCES `calibrationmodel` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `icon`
--

DROP TABLE IF EXISTS `icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icon` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `PATH` longtext,
  `TITLE` varchar(255) DEFAULT NULL,
  `type` varchar(64) DEFAULT 'Category' COMMENT '(''Category'', ''Mozo Icon'')',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `LARGE_IMAGE_PATH` longtext,
  `ORIGINAL_IMAGE_PATH` longtext,
  `SMALL_IMAGE_PATH` longtext,
  `TITLE` varchar(255) DEFAULT NULL,
  `LOW_IMAGE_PATH` longtext,
  `MEDIUM_IMAGE_PATH` longtext,
  `HIGH_IMAGE_PATH` longtext,
  `EXTRA_HIGH_IMAGE_PATH` longtext,
  `CROPPED_IMAGE_PATH` longtext,
  `IS_STANDARD_SCALE` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `internal_activity`
--

DROP TABLE IF EXISTS `internal_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `internal_activity` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `internal_category`
--

DROP TABLE IF EXISTS `internal_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `internal_category` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ACTIVITY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKDCFF6C4090D2ACCC` (`ACTIVITY_ID`),
  CONSTRAINT `FKDCFF6C4090D2ACCC` FOREIGN KEY (`ACTIVITY_ID`) REFERENCES `internal_activity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_statistic`
--

DROP TABLE IF EXISTS `item_statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_statistic` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `item_id` varchar(45) DEFAULT NULL,
  `like_count` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `rating_count` int(11) DEFAULT NULL,
  `share_count` int(11) DEFAULT NULL,
  `view_count` int(11) DEFAULT NULL,
  `follow_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_attempts` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `ATTEMPTS_NUMBER` int(11) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loyaltypoint`
--

DROP TABLE IF EXISTS `loyaltypoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loyaltypoint` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `POINT` int(11) DEFAULT NULL,
  `USED_POINT` int(11) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mall`
--

DROP TABLE IF EXISTS `mall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mall` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `COMPANYNAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `EMAIL` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `PHONE` varchar(255) DEFAULT NULL,
  `TIMEZONE_ID` varchar(36) DEFAULT NULL,
  `IMAGE_ID` varchar(128) DEFAULT NULL,
  `NOTIFICATION_URL` longtext,
  `SSID` longtext,
  `OPENING_HOURS_FROM` time DEFAULT NULL,
  `OPENING_HOURS_TO` time DEFAULT NULL,
  `COUNTRY_ID` varchar(36) DEFAULT NULL,
  `VISIBLE_STATUS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK3306147D0DD3AF` (`TIMEZONE_ID`),
  KEY `fk_mall_image_idx` (`IMAGE_ID`),
  KEY `FK3306141F4ECAC5` (`COUNTRY_ID`),
  CONSTRAINT `FK3306141F4ECAC5` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`ID`),
  CONSTRAINT `FK3306147D0DD3AF` FOREIGN KEY (`TIMEZONE_ID`) REFERENCES `timezone` (`ID`),
  CONSTRAINT `fk_mall_image` FOREIGN KEY (`IMAGE_ID`) REFERENCES `image` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mall_icon`
--

DROP TABLE IF EXISTS `mall_icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mall_icon` (
  `ID` varchar(36) NOT NULL,
  `MALL_ID` varchar(36) DEFAULT NULL,
  `WELCOME_ICON_ID` int(11) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `PROMOTION_ICON_ID` int(11) DEFAULT NULL,
  `COUPON_ICON_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_mall_icon_1_idx` (`MALL_ID`),
  KEY `fk_mall_icon_2_idx` (`WELCOME_ICON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `destIPList` longtext,
  `duration` int(11) DEFAULT NULL,
  `eventType` varchar(100) DEFAULT NULL,
  `messageFormat` varchar(255) DEFAULT NULL,
  `portNumber` int(11) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  `transportType` varchar(30) DEFAULT NULL,
  `building_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK237A88EB8EF695CF` (`building_id`),
  CONSTRAINT `FK237A88EB8EF695CF` FOREIGN KEY (`building_id`) REFERENCES `building` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `ID` varchar(255) NOT NULL,
  `FOR_ROLE` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(255) DEFAULT NULL,
  `FEATURE_ID` varchar(255) DEFAULT NULL,
  `JSON_DETAIL` varchar(255) DEFAULT NULL,
  `ALLOWED` bit(1) DEFAULT b'1',
  `CREATED_DATE` timestamp NULL DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_permission_1` (`ROLE_ID`),
  KEY `fk_permission_2` (`FEATURE_ID`),
  CONSTRAINT `fk_permission_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_permission_2` FOREIGN KEY (`FEATURE_ID`) REFERENCES `feature` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `CONTENT` longtext,
  `DISCOUNT` decimal(19,2) DEFAULT NULL,
  `DISPLAY_ON_BANNER` tinyint(4) DEFAULT NULL,
  `EFFECT_FROM` time DEFAULT NULL,
  `EFFECT_TO` time DEFAULT NULL,
  `END` datetime NOT NULL,
  `LOYALTY_POINT_EXCHANGE` int(11) DEFAULT NULL,
  `LOYALTY_POINT_EXCHANGE_REQUIRED` bit(1) DEFAULT NULL,
  `LOYALTY_POINT_REQUIRED` bit(1) DEFAULT NULL,
  `MEMBERSHIP_REQUIRED` bit(1) DEFAULT NULL,
  `MIN_LOYALTY_POINT` int(11) DEFAULT NULL,
  `NEW_PRICE` double DEFAULT NULL,
  `OLD_PRICE` double DEFAULT NULL,
  `OTHER` longtext,
  `PROMOTION_TYPE` varchar(255) DEFAULT NULL,
  `START` datetime NOT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `STOPPED_DATE` datetime DEFAULT NULL,
  `TITLE` varchar(255) NOT NULL,
  `BANNER_IMAGE_ID` varchar(36) DEFAULT NULL,
  `BRAND_ID` varchar(36) DEFAULT NULL,
  `CATEGORY_ID` varchar(36) NOT NULL,
  `CURRENCY_ID` varchar(36) DEFAULT NULL,
  `SCHEDULE_ID` varchar(36) DEFAULT NULL,
  `SHOP_ID` varchar(36) NOT NULL,
  `MALL_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKD05CFCA3EA2A7318` (`BANNER_IMAGE_ID`),
  KEY `FKD05CFCA3C9852FE5` (`BRAND_ID`),
  KEY `FKD05CFCA3975FF98F` (`CATEGORY_ID`),
  KEY `FKD05CFCA37DF7BCAF` (`CURRENCY_ID`),
  KEY `FKD05CFCA3199966EF` (`SCHEDULE_ID`),
  KEY `FKD05CFCA360C1290F` (`SHOP_ID`),
  KEY `FKD05CFCA3173AEC4F` (`MALL_ID`),
  CONSTRAINT `FKD05CFCA3173AEC4F` FOREIGN KEY (`MALL_ID`) REFERENCES `mall` (`ID`),
  CONSTRAINT `FKD05CFCA3199966EF` FOREIGN KEY (`SCHEDULE_ID`) REFERENCES `schedule` (`ID`),
  CONSTRAINT `FKD05CFCA360C1290F` FOREIGN KEY (`SHOP_ID`) REFERENCES `shop` (`ID`),
  CONSTRAINT `FKD05CFCA37DF7BCAF` FOREIGN KEY (`CURRENCY_ID`) REFERENCES `currency` (`ID`),
  CONSTRAINT `FKD05CFCA3975FF98F` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`ID`),
  CONSTRAINT `FKD05CFCA3C9852FE5` FOREIGN KEY (`BRAND_ID`) REFERENCES `brand` (`ID`),
  CONSTRAINT `FKD05CFCA3EA2A7318` FOREIGN KEY (`BANNER_IMAGE_ID`) REFERENCES `image` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promotion_AUD`
--

DROP TABLE IF EXISTS `promotion_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_AUD` (
  `ID` varchar(36) NOT NULL,
  `REV` bigint(20) NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `CONTENT` longtext,
  `DISCOUNT` decimal(19,2) DEFAULT NULL,
  `DISPLAY_ON_BANNER` tinyint(4) DEFAULT NULL,
  `EFFECT_FROM` time DEFAULT NULL,
  `EFFECT_TO` time DEFAULT NULL,
  `END` datetime DEFAULT NULL,
  `LOYALTY_POINT_EXCHANGE` int(11) DEFAULT NULL,
  `LOYALTY_POINT_EXCHANGE_REQUIRED` bit(1) DEFAULT NULL,
  `LOYALTY_POINT_REQUIRED` bit(1) DEFAULT NULL,
  `MEMBERSHIP_REQUIRED` bit(1) DEFAULT NULL,
  `MIN_LOYALTY_POINT` int(11) DEFAULT NULL,
  `NEW_PRICE` double DEFAULT NULL,
  `OLD_PRICE` double DEFAULT NULL,
  `OTHER` longtext,
  `PROMOTION_TYPE` varchar(255) DEFAULT NULL,
  `START` datetime DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `STOPPED_DATE` datetime DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `BANNER_IMAGE_ID` varchar(36) DEFAULT NULL,
  `BRAND_ID` varchar(36) DEFAULT NULL,
  `CATEGORY_ID` varchar(36) DEFAULT NULL,
  `CURRENCY_ID` varchar(36) DEFAULT NULL,
  `SCHEDULE_ID` varchar(36) DEFAULT NULL,
  `SHOP_ID` varchar(36) DEFAULT NULL,
  `MALL_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`,`REV`),
  KEY `FK2AA420F4A3CD18AE` (`REV`),
  CONSTRAINT `FK2AA420F4A3CD18AE` FOREIGN KEY (`REV`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promotion_image`
--

DROP TABLE IF EXISTS `promotion_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_image` (
  `PROMOTION_ID` varchar(36) NOT NULL,
  `IMAGE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`PROMOTION_ID`,`IMAGE_ID`),
  KEY `FK145EC2BF982C6F65` (`IMAGE_ID`),
  KEY `FK145EC2BF23378CE5` (`PROMOTION_ID`),
  CONSTRAINT `FK145EC2BF23378CE5` FOREIGN KEY (`PROMOTION_ID`) REFERENCES `promotion` (`ID`),
  CONSTRAINT `FK145EC2BF982C6F65` FOREIGN KEY (`IMAGE_ID`) REFERENCES `image` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promotion_image_AUD`
--

DROP TABLE IF EXISTS `promotion_image_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_image_AUD` (
  `REV` bigint(20) NOT NULL,
  `PROMOTION_ID` varchar(36) NOT NULL,
  `IMAGE_ID` varchar(36) NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`REV`,`PROMOTION_ID`,`IMAGE_ID`),
  KEY `FK6DDD7910A3CD18AE` (`REV`),
  CONSTRAINT `FK6DDD7910A3CD18AE` FOREIGN KEY (`REV`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promotion_target`
--

DROP TABLE IF EXISTS `promotion_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_target` (
  `PROMOTION_ID` varchar(36) NOT NULL,
  `TARGET_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`PROMOTION_ID`,`TARGET_ID`),
  KEY `FK899D84AD833B6DEF` (`TARGET_ID`),
  KEY `FK899D84AD23378CE5` (`PROMOTION_ID`),
  CONSTRAINT `FK899D84AD23378CE5` FOREIGN KEY (`PROMOTION_ID`) REFERENCES `promotion` (`ID`),
  CONSTRAINT `FK899D84AD833B6DEF` FOREIGN KEY (`TARGET_ID`) REFERENCES `target` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promotion_target_AUD`
--

DROP TABLE IF EXISTS `promotion_target_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_target_AUD` (
  `REV` bigint(20) NOT NULL,
  `PROMOTION_ID` varchar(36) NOT NULL,
  `TARGET_ID` varchar(36) NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`REV`,`PROMOTION_ID`,`TARGET_ID`),
  KEY `FKC0ED93FEA3CD18AE` (`REV`),
  CONSTRAINT `FKC0ED93FEA3CD18AE` FOREIGN KEY (`REV`) REFERENCES `revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reset_password_token`
--

DROP TABLE IF EXISTS `reset_password_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reset_password_token` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `COUNT` int(11) NOT NULL,
  `TOKEN` varchar(255) DEFAULT NULL,
  `USERID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revision`
--

DROP TABLE IF EXISTS `revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revision` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AUDITOR_ID` varchar(255) DEFAULT NULL,
  `timestamp` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=723 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedule_custom`
--

DROP TABLE IF EXISTS `schedule_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_custom` (
  `SCHEDULE_ID` varchar(36) NOT NULL,
  `WEEK_DAY` varchar(255) DEFAULT NULL,
  `CUSTOM_DATE` datetime DEFAULT NULL,
  KEY `FK4D492E19199966EF` (`SCHEDULE_ID`),
  CONSTRAINT `FK4D492E19199966EF` FOREIGN KEY (`SCHEDULE_ID`) REFERENCES `schedule` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `session_information`
--

DROP TABLE IF EXISTS `session_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_information` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `login_times` varchar(200) DEFAULT NULL,
  `logout_times` varchar(200) DEFAULT NULL,
  `mac_addresses` varchar(200) DEFAULT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `CONTACT` varchar(255) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(255) DEFAULT NULL,
  `SLOGAN` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `BRAND_ID` varchar(36) DEFAULT NULL,
  `CATEGORY_ID` varchar(36) DEFAULT NULL,
  `LOGO_ID` varchar(36) DEFAULT NULL,
  `OWNER_ID` varchar(36) DEFAULT NULL,
  `SUB_BRAND_ID` varchar(36) DEFAULT NULL,
  `ZONE_ID` varchar(36) DEFAULT NULL,
  `MALL_ID` varchar(45) DEFAULT NULL,
  `STATUS` varchar(45) DEFAULT 'INACTIVE' COMMENT 'INACTIVE, ACTIVE',
  `ENABLED_STATUS` varchar(45) DEFAULT 'ENABLED' COMMENT 'ENABLED, DISABLED',
  PRIMARY KEY (`ID`),
  KEY `FK35DAF6C9852FE5` (`BRAND_ID`),
  KEY `FK35DAF6975FF98F` (`CATEGORY_ID`),
  KEY `FK35DAF6DFD33115` (`LOGO_ID`),
  KEY `FK35DAF648AEAD07` (`OWNER_ID`),
  KEY `FK35DAF6C47935AE` (`SUB_BRAND_ID`),
  KEY `FK35DAF6DEEEE54F` (`ZONE_ID`),
  KEY `FK35DAF6173AEC4F` (`MALL_ID`),
  CONSTRAINT `FK35DAF6173AEC4F` FOREIGN KEY (`MALL_ID`) REFERENCES `mall` (`ID`),
  CONSTRAINT `FK35DAF648AEAD07` FOREIGN KEY (`OWNER_ID`) REFERENCES `user` (`ID`),
  CONSTRAINT `FK35DAF6975FF98F` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`ID`),
  CONSTRAINT `FK35DAF6C47935AE` FOREIGN KEY (`SUB_BRAND_ID`) REFERENCES `sub_brand` (`ID`),
  CONSTRAINT `FK35DAF6C9852FE5` FOREIGN KEY (`BRAND_ID`) REFERENCES `brand` (`ID`),
  CONSTRAINT `FK35DAF6DEEEE54F` FOREIGN KEY (`ZONE_ID`) REFERENCES `zone` (`ID`),
  CONSTRAINT `FK35DAF6DFD33115` FOREIGN KEY (`LOGO_ID`) REFERENCES `image` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_internalCategory`
--

DROP TABLE IF EXISTS `shop_internalCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_internalCategory` (
  `SHOP_ID` varchar(36) NOT NULL,
  `INTERNALCATEGORY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SHOP_ID`,`INTERNALCATEGORY_ID`),
  KEY `FKFC6EED04958E438F` (`INTERNALCATEGORY_ID`),
  KEY `FKFC6EED0460C1290F` (`SHOP_ID`),
  CONSTRAINT `FKFC6EED0460C1290F` FOREIGN KEY (`SHOP_ID`) REFERENCES `shop` (`ID`),
  CONSTRAINT `FKFC6EED04958E438F` FOREIGN KEY (`INTERNALCATEGORY_ID`) REFERENCES `internal_category` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitemap`
--

DROP TABLE IF EXISTS `sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitemap` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitemap_component`
--

DROP TABLE IF EXISTS `sitemap_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitemap_component` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `TYPE` varchar(64) DEFAULT NULL,
  `NAME` varchar(512) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `MALL_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK850725F3173AEC4F` (`MALL_ID`),
  CONSTRAINT `FK850725F3173AEC4F` FOREIGN KEY (`MALL_ID`) REFERENCES `mall` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stats_item_rate`
--

DROP TABLE IF EXISTS `stats_item_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_item_rate` (
  `ID` varchar(36) COLLATE utf8_bin NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ITEM_TYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RATE_AVG_0` double DEFAULT NULL,
  `RATE_AVG_1` double DEFAULT NULL,
  `RATE_AVG_2` double DEFAULT NULL,
  `RATE_AVG_3` double DEFAULT NULL,
  `RATE_AVG_4` double DEFAULT NULL,
  `RATE_AVG_5` double DEFAULT NULL,
  `RATE_AVG_6` double DEFAULT NULL,
  `RATE_AVG_7` double DEFAULT NULL,
  `RATE_AVG_8` double DEFAULT NULL,
  `RATE_AVG_9` double DEFAULT NULL,
  `RATE_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stats_user_rating`
--

DROP TABLE IF EXISTS `stats_user_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_user_rating` (
  `ID` varchar(36) COLLATE utf8_bin NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ITEM_TYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RATE_CMT` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RATE_VALUE_0` double DEFAULT NULL,
  `RATE_VALUE_1` double DEFAULT NULL,
  `RATE_VALUE_2` double DEFAULT NULL,
  `RATE_VALUE_3` double DEFAULT NULL,
  `RATE_VALUE_4` double DEFAULT NULL,
  `RATE_VALUE_5` double DEFAULT NULL,
  `RATE_VALUE_6` double DEFAULT NULL,
  `RATE_VALUE_7` double DEFAULT NULL,
  `RATE_VALUE_8` double DEFAULT NULL,
  `RATE_VALUE_9` double DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub_brand`
--

DROP TABLE IF EXISTS `sub_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_brand` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `BRAND_ID` varchar(36) DEFAULT NULL,
  `LOGO_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKFC80BCC8C9852FE5` (`BRAND_ID`),
  KEY `FKFC80BCC8DFD33115` (`LOGO_ID`),
  CONSTRAINT `FKFC80BCC8C9852FE5` FOREIGN KEY (`BRAND_ID`) REFERENCES `brand` (`ID`),
  CONSTRAINT `FKFC80BCC8DFD33115` FOREIGN KEY (`LOGO_ID`) REFERENCES `image` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `target`
--

DROP TABLE IF EXISTS `target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `target` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `GENDER` tinyint(1) DEFAULT NULL,
  `HAS_CHILDREN` tinyint(1) DEFAULT NULL,
  `AGE_CATEGORY_ID` varchar(36) DEFAULT NULL,
  `EDUCATION_CATEGORY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKCB7E7191533C5324` (`AGE_CATEGORY_ID`),
  KEY `FKCB7E71917AA0DDB6` (`EDUCATION_CATEGORY_ID`),
  CONSTRAINT `FKCB7E7191533C5324` FOREIGN KEY (`AGE_CATEGORY_ID`) REFERENCES `age_category` (`ID`),
  CONSTRAINT `FKCB7E71917AA0DDB6` FOREIGN KEY (`EDUCATION_CATEGORY_ID`) REFERENCES `education_category` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblcalibdata`
--

DROP TABLE IF EXISTS `tblcalibdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcalibdata` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `rssi` double DEFAULT NULL,
  `calibpoint_id` varchar(36) DEFAULT NULL,
  `ibeacon_id` varchar(36) DEFAULT NULL,
  `orientation` float DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK47B1CB93BCFC084F` (`calibpoint_id`),
  KEY `FK47B1CB932CE71765` (`ibeacon_id`),
  CONSTRAINT `FK47B1CB932CE71765` FOREIGN KEY (`ibeacon_id`) REFERENCES `iBeacon` (`id`),
  CONSTRAINT `FK47B1CB93BCFC084F` FOREIGN KEY (`calibpoint_id`) REFERENCES `tblcalibpoint` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblcalibpoint`
--

DROP TABLE IF EXISTS `tblcalibpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcalibpoint` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `description` longtext,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `signalmodel_id` varchar(36) DEFAULT NULL,
  `floor_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKAF36F6C7588E3145` (`signalmodel_id`),
  KEY `FKAF36F6C743D2A5C5` (`floor_id`),
  CONSTRAINT `FKAF36F6C743D2A5C5` FOREIGN KEY (`floor_id`) REFERENCES `floor` (`ID`),
  CONSTRAINT `FKAF36F6C7588E3145` FOREIGN KEY (`signalmodel_id`) REFERENCES `tblsignalmodel` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblsignalmodel`
--

DROP TABLE IF EXISTS `tblsignalmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsignalmodel` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `description` longtext,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timezone`
--

DROP TABLE IF EXISTS `timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timezone` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `UTC_OFFSET` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trackdefn`
--

DROP TABLE IF EXISTS `trackdefn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackdefn` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `adminStatus` tinyint(1) DEFAULT NULL,
  `dayMask` int(11) DEFAULT NULL,
  `endHour` int(11) DEFAULT NULL,
  `endMinute` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `startHour` int(11) DEFAULT NULL,
  `startMinute` int(11) DEFAULT NULL,
  `trackgroup` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK2B8750D468F8F77D` (`trackgroup`),
  CONSTRAINT `FK2B8750D468F8F77D` FOREIGN KEY (`trackgroup`) REFERENCES `trackgroup` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trackgroup`
--

DROP TABLE IF EXISTS `trackgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackgroup` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transportsmtp`
--

DROP TABLE IF EXISTS `transportsmtp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportsmtp` (
  `id` varchar(36) NOT NULL,
  `authName` varchar(45) DEFAULT NULL,
  `authPassword` varchar(45) DEFAULT NULL,
  `Recipient` varchar(45) DEFAULT NULL,
  `Sender` varchar(45) DEFAULT NULL,
  `subjectPrefix` varchar(45) DEFAULT NULL,
  `Type` int(11) DEFAULT NULL,
  `useAuth` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transportsnmp`
--

DROP TABLE IF EXISTS `transportsnmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportsnmp` (
  `id` varchar(36) NOT NULL,
  `Community` varchar(45) DEFAULT NULL,
  `portNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transportsoap`
--

DROP TABLE IF EXISTS `transportsoap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportsoap` (
  `id` varchar(36) NOT NULL,
  `portNumber` int(11) DEFAULT NULL,
  `useHTTPS` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transportsyslog`
--

DROP TABLE IF EXISTS `transportsyslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportsyslog` (
  `id` varchar(36) NOT NULL,
  `Facility` int(11) DEFAULT NULL,
  `portNumber` int(11) DEFAULT NULL,
  `Priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `triggerTable`
--

DROP TABLE IF EXISTS `triggerTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `triggerTable` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `applyTo` int(11) DEFAULT NULL,
  `matchByType` int(11) DEFAULT NULL,
  `matchByValue` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `trackDefn_id` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK15C2C8F6813D5345` (`trackDefn_id`),
  CONSTRAINT `FK15C2C8F6813D5345` FOREIGN KEY (`trackDefn_id`) REFERENCES `trackdefn` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `triggercontainment`
--

DROP TABLE IF EXISTS `triggercontainment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `triggercontainment` (
  `id` varchar(36) NOT NULL,
  `Operator` int(11) DEFAULT NULL,
  `triggerClass` int(11) DEFAULT NULL,
  `triggerType` int(11) DEFAULT NULL,
  `trigger_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1D48177A34F57F85` (`trigger_id`),
  CONSTRAINT `FK1D48177A34F57F85` FOREIGN KEY (`trigger_id`) REFERENCES `triggerTable` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `triggercontainment_has_unit`
--

DROP TABLE IF EXISTS `triggercontainment_has_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `triggercontainment_has_unit` (
  `triggerContainment_id` varchar(36) NOT NULL,
  `unit_id` varchar(36) NOT NULL,
  `triggerFrequence` varchar(45) DEFAULT NULL,
  `triggerIf` int(11) DEFAULT NULL,
  PRIMARY KEY (`triggerContainment_id`,`unit_id`),
  KEY `FK65AC732EDB0A21CF` (`triggerContainment_id`),
  KEY `FK65AC732ED478F64F` (`unit_id`),
  CONSTRAINT `FK65AC732ED478F64F` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`ID`),
  CONSTRAINT `FK65AC732EDB0A21CF` FOREIGN KEY (`triggerContainment_id`) REFERENCES `triggercontainment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `notificationTrigger` varchar(255) DEFAULT NULL,
  `points` longtext,
  `pointsSize` int(11) DEFAULT NULL,
  `floor_id` varchar(36) DEFAULT NULL,
  `zone_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK36D98443D2A5C5` (`floor_id`),
  KEY `FK36D984DEEEE54F` (`zone_id`),
  CONSTRAINT `FK36D98443D2A5C5` FOREIGN KEY (`floor_id`) REFERENCES `floor` (`ID`),
  CONSTRAINT `FK36D984DEEEE54F` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unit_has_notification`
--

DROP TABLE IF EXISTS `unit_has_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_has_notification` (
  `unit_id` varchar(36) NOT NULL,
  `notification_id` varchar(36) NOT NULL,
  PRIMARY KEY (`unit_id`,`notification_id`),
  KEY `FK71992BCB881F83EF` (`notification_id`),
  KEY `FK71992BCBD478F64F` (`unit_id`),
  CONSTRAINT `FK71992BCB881F83EF` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`ID`),
  CONSTRAINT `FK71992BCBD478F64F` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `BIRTHDAY` date DEFAULT NULL,
  `CODE_IS_SENT_TO` varchar(255) DEFAULT NULL,
  `COMPANY` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `FACEBOOKID` varchar(255) DEFAULT NULL,
  `FIRSTNAME` varchar(255) DEFAULT NULL,
  `GENDER` int(11) DEFAULT NULL,
  `HASHCODE` varchar(255) DEFAULT NULL,
  `LASTNAME` varchar(255) DEFAULT NULL,
  `LOCALE` varchar(255) DEFAULT NULL,
  `MAC_ADDRESS` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PHONE` varchar(255) DEFAULT NULL,
  `PROFILE_STATUS` int(11) DEFAULT NULL,
  `RELATIONSHIP` varchar(255) DEFAULT NULL,
  `UNLOCK_DATE` datetime DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `COUNTRYID` varchar(36) DEFAULT NULL,
  `IMAGEID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK36EBCBAC93B792` (`COUNTRYID`),
  KEY `FK36EBCB3D5EB49C` (`IMAGEID`),
  CONSTRAINT `FK36EBCB3D5EB49C` FOREIGN KEY (`IMAGEID`) REFERENCES `image` (`ID`),
  CONSTRAINT `FK36EBCBAC93B792` FOREIGN KEY (`COUNTRYID`) REFERENCES `country` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_ecoupon`
--

DROP TABLE IF EXISTS `user_ecoupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_ecoupon` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `DATE_CLAIMED` datetime DEFAULT NULL,
  `ECOUPON_ID` varchar(255) DEFAULT NULL,
  `IS_CLAIMED` tinyint(1) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_event`
--

DROP TABLE IF EXISTS `user_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_event` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `IS_FOLLOWED` tinyint(1) DEFAULT NULL,
  `IS_LIKED` tinyint(1) DEFAULT NULL,
  `IS_SHARED` tinyint(1) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `EVENT_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER` (`USER_ID`),
  KEY `IDX_EVENT` (`EVENT_ID`),
  CONSTRAINT `FK_EVENT` FOREIGN KEY (`EVENT_ID`) REFERENCES `event` (`ID`),
  CONSTRAINT `FK_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_item`
--

DROP TABLE IF EXISTS `user_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_item` (
  `ID` varchar(36) COLLATE utf8_bin NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `CMT` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CMT_DATE` datetime DEFAULT NULL,
  `IS_ADDED_CHECKLIST` tinyint(1) DEFAULT NULL,
  `IS_ADDED_FAVOURITE` tinyint(1) DEFAULT NULL,
  `IS_LIKED` tinyint(1) DEFAULT NULL,
  `IS_SHARED` tinyint(1) DEFAULT NULL,
  `IS_SUBSCRIBED` tinyint(1) DEFAULT NULL,
  `IS_VIEWED` tinyint(1) DEFAULT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ITEM_TYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RATING` float DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_promotion`
--

DROP TABLE IF EXISTS `user_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_promotion` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `COMMENT` varchar(255) DEFAULT NULL,
  `IS_DONE` tinyint(1) DEFAULT NULL,
  `IS_FAVOURITE` tinyint(1) DEFAULT NULL,
  `IS_IN_CHECKLIST` tinyint(1) DEFAULT NULL,
  `IS_LIKED` tinyint(1) DEFAULT NULL,
  `IS_SHARED` tinyint(1) DEFAULT NULL,
  `PROMOTION_ID` varchar(255) DEFAULT NULL,
  `RATING` float DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `COMMENT_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK2DC4E12FDCC7FCEF` (`USER_ID`),
  CONSTRAINT `FK2DC4E12FDCC7FCEF` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `MALL_ID` varchar(36) DEFAULT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ZONE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK143BF46A173AEC4F` (`MALL_ID`),
  KEY `FK143BF46A379D390F` (`ROLE_ID`),
  KEY `FK143BF46ADCC7FCEF` (`USER_ID`),
  KEY `FK143BF46ADEEEE54F` (`ZONE_ID`),
  CONSTRAINT `FK143BF46A173AEC4F` FOREIGN KEY (`MALL_ID`) REFERENCES `mall` (`ID`),
  CONSTRAINT `FK143BF46A379D390F` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`),
  CONSTRAINT `FK143BF46ADCC7FCEF` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`),
  CONSTRAINT `FK143BF46ADEEEE54F` FOREIGN KEY (`ZONE_ID`) REFERENCES `zone` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zone` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `description` longtext,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `category_id` varchar(36) DEFAULT NULL,
  `floor_id` varchar(36) DEFAULT NULL,
  `group_id` varchar(36) DEFAULT NULL,
  `shop_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK3923AC975FF98F` (`category_id`),
  KEY `FK3923AC43D2A5C5` (`floor_id`),
  KEY `FK3923ACE97DACE5` (`group_id`),
  KEY `FK3923AC60C1290F` (`shop_id`),
  CONSTRAINT `FK3923AC43D2A5C5` FOREIGN KEY (`floor_id`) REFERENCES `floor` (`ID`),
  CONSTRAINT `FK3923AC60C1290F` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`ID`),
  CONSTRAINT `FK3923AC975FF98F` FOREIGN KEY (`category_id`) REFERENCES `category` (`ID`),
  CONSTRAINT `FK3923ACE97DACE5` FOREIGN KEY (`group_id`) REFERENCES `groupTable` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zone_has_zone`
--

DROP TABLE IF EXISTS `zone_has_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zone_has_zone` (
  `ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `relationship` varchar(36) DEFAULT NULL,
  `mainzone_id` varchar(36) DEFAULT NULL,
  `secondzone_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK6983496446F5AD76` (`mainzone_id`),
  KEY `FK69834964D687765B` (`secondzone_id`),
  CONSTRAINT `FK6983496446F5AD76` FOREIGN KEY (`mainzone_id`) REFERENCES `zone` (`ID`),
  CONSTRAINT `FK69834964D687765B` FOREIGN KEY (`secondzone_id`) REFERENCES `zone` (`ID`)
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

-- Dump completed on 2015-01-23 15:50:36
