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
-- Table structure for table `ordered`
--

DROP TABLE IF EXISTS `ordered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered` (
  `ordered_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `drink` tinytext,
  `appetizers` tinytext,
  `main_course` tinytext,
  `dessert` tinytext,
  `tip` float DEFAULT NULL,
  PRIMARY KEY (`ordered_id`),
  KEY `customer_id` (`customer_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `ordered_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `ordered_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered`
--

LOCK TABLES `ordered` WRITE;
/*!40000 ALTER TABLE `ordered` DISABLE KEYS */;
INSERT INTO `ordered` VALUES (51,NULL,NULL,'Italian soda','Calamari Fritti','Fradiavola','Cheesecake',25),(52,NULL,NULL,'Italian soda','Bruschetta','Linguine con Gamberetti','Chocolate cake',30),(53,NULL,NULL,'Italian soda','Carpaccio di salmone','Linguine Di Granchio','Chocolate cake',20),(54,NULL,NULL,'Sprite','Calamari Fritti','Linguine con Gamberetti','Cheesecake',23),(55,NULL,NULL,'Diet Coke','Bruschetta','Ravioli alla Aragosta','Tiramisu',20),(56,NULL,NULL,'Coffee','Salad','Linguine con Gamberetti','Tiramisu',30),(57,NULL,NULL,'Sprite','Bruschetta','Fradiavola','Cheesecake',23),(58,NULL,NULL,'Italian soda','Panzerotti','Linguine con Gamberetti','Cheesecake',18),(59,NULL,NULL,'Italian soda','Bruschetta','Spiedini di polpettine','Tiramisu',28),(60,NULL,NULL,'Tea','Bruschetta','Linguine con Gamberetti','Tiramisu',30);
/*!40000 ALTER TABLE `ordered` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-13 18:28:36
