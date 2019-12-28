CREATE DATABASE  IF NOT EXISTS `zimino` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `zimino`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: zimino
-- ------------------------------------------------------
-- Server version	8.0.18

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
  `menu_id` int(11) DEFAULT NULL,
  `first` tinytext,
  `last` tinytext,
  `ordered_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `menu_id` (`menu_id`),
  KEY `ordered_id` (`ordered_id`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`ordered_id`) REFERENCES `ordered` (`ordered_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (51,NULL,'Shelly','Sun',NULL),(52,NULL,'Drew','Houston',NULL),(53,NULL,'Andrew','Bell',NULL),(54,NULL,'Jasper','Kolp',NULL),(55,NULL,'Greg','Brown',NULL),(56,NULL,'Stefano','Gabbana',NULL),(57,NULL,'Andrew','Terrado',NULL),(58,NULL,'Dalia','Faria',NULL),(59,NULL,'Anderson','Cooper',NULL),(60,NULL,'Domenico ','Dolce ',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `description_drink` tinytext,
  `description_appetizers` tinytext,
  `description_main_course` tinytext,
  `description_dessert` tinytext,
  `appetizers_infor` tinytext,
  `main_course_infor` tinytext,
  `dessert_infor` tinytext,
  `drink_price` float DEFAULT NULL,
  `appetizers_price` float DEFAULT NULL,
  `main_course_price` float DEFAULT NULL,
  `dessert_price` float DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Italian soda','Calamari Fritti','Spaghetti Al Salmone','Chocolate cake','Fried calamari','Salmon Spaghetti in Alfredo sauce',NULL,3,15.95,15.95,4),(2,'Coke','Carpaccio di salmone','Fettuccine ai Gamberoni','Cheesecake','Thin slices of smoked salmon with lemon and oil','Prawns Fettuccine in Alfredo sauce',NULL,1.5,13.95,16.25,5),(3,'Diet Coke','Bruschetta','Linguine con Gamberetti','Tiramisu','Fresh tomatoes with oil, garlic, and vinegar served on Italian bread','Shrimp Linguine in white wine sauce',NULL,1.5,8.95,16.25,5),(4,'Sprite','Salad','Ravioli alla Aragosta',NULL,'Greens, croutons, nuts, parmesan, Italian Vinaigrette dressing','Lobster ravioli in a red sauce',NULL,1.5,10.59,16.95,NULL),(5,'Fanta','Panzerotti','Linguine Di Granchio',NULL,'small tomato, ham, mozzarella calzone, deep fried','Crab linguine in a pink sauce',NULL,1.5,8.95,20.95,NULL),(6,'Coffee',NULL,'Spiedini di polpettine',NULL,NULL,'Spaghetti and meatballs with red sauce',NULL,3,NULL,11.95,NULL),(7,'Wine',NULL,'Vegetariana',NULL,NULL,'Pizza with mozzarella, eggplant, tomatoes, mushrooms',NULL,5,NULL,15.95,NULL),(8,'Tea',NULL,'Fradiavola',NULL,NULL,'Pizza with Italian sausage, pepperoni, mushrooms, red onions',NULL,3,NULL,16.95,NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

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
  CONSTRAINT `ordered_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
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

--
-- Temporary view structure for view `tips_view`
--

DROP TABLE IF EXISTS `tips_view`;
/*!50001 DROP VIEW IF EXISTS `tips_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tips_view` AS SELECT 
 1 AS `tip`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'zimino'
--

--
-- Final view structure for view `tips_view`
--

/*!50001 DROP VIEW IF EXISTS `tips_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tips_view` AS select `ordered`.`tip` AS `tip` from `ordered` */;
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

-- Dump completed on 2019-12-28  2:25:25
