-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: zimino
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first` tinytext,
  `last` tinytext,
  `menu_id` int(11) DEFAULT NULL,
  `ordered_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `meun_id_idx` (`menu_id`),
  KEY `ordered_id` (`ordered_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`ordered_id`) REFERENCES `ordered` (`ordered_id`),
  CONSTRAINT `meun_id` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Domenico ','Dolce',NULL,NULL),(2,' Domenico ','Dolce',NULL,NULL),(3,' Domenico ','Dolce',NULL,NULL),(4,' Domenico ','Dolce',NULL,NULL),(5,'Domenico ','Dolce',NULL,NULL),(6,' Domenico ','Dolce',NULL,NULL),(7,'shell','s',NULL,NULL),(8,'Domenico ','Dolce',NULL,NULL),(9,'Domenico ','Dolce',NULL,NULL),(10,'Domenico ','Dolce',NULL,NULL),(11,'Shell','S',NULL,NULL),(12,'Pavel','D',NULL,NULL),(13,'shell','s',NULL,NULL),(14,'shell','s',NULL,NULL),(15,'shelly','sun',NULL,NULL),(16,'shell','han',NULL,NULL),(17,'shell','s',NULL,NULL),(18,'shell','o',NULL,NULL),(19,'shelly','s',NULL,NULL),(20,'shell','sun',NULL,NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-10 22:26:41
