CREATE DATABASE  IF NOT EXISTS `cafeteria` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cafeteria`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: cafeteria
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(68) NOT NULL,
  `email` varchar(40) NOT NULL,
  `tel` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'Maria','Koutra','Maleyra','$2a$10$SG/Bz20AyvHqVNWbHIiTOOxsBfoChp8Gm.zy7FS1tVduFVV.XyNuS','mariakoutra4@gmail.com','6981907193'),(2,'Katerina','Koutra','Kate','$2a$10$5B5IgVS/lAyBVt7fBnTUhu8T9BJo.1h3p0avjLr2hym75pJrV8CIy','mrktr47@gmail.com','6984578970'),(3,'Alex','Koutras','Alex','$2a$10$6cw.cmh8ccILJ8e1JYvqseoIZD7m/H9jfVpy1Z3ki4xqjf1Cv8t5i','alex@gmail.com','6987485965');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_has_role`
--

DROP TABLE IF EXISTS `account_has_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_has_role` (
  `account_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`account_id`,`role_id`),
  KEY `fk_account_has_role_role1_idx` (`role_id`),
  KEY `fk_account_has_role_account1_idx` (`account_id`),
  CONSTRAINT `fk_account_has_role_account1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `fk_account_has_role_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_has_role`
--

LOCK TABLES `account_has_role` WRITE;
/*!40000 ALTER TABLE `account_has_role` DISABLE KEYS */;
INSERT INTO `account_has_role` VALUES (1,1),(1,2),(2,2),(3,2);
/*!40000 ALTER TABLE `account_has_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `street` varchar(45) NOT NULL,
  `number` varchar(45) NOT NULL,
  `city` varchar(45) DEFAULT NULL,
  `zipcode` varchar(45) NOT NULL,
  `floor` varchar(15) DEFAULT NULL,
  `doorbell` varchar(30) DEFAULT NULL,
  `Account_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Address_Account1_idx` (`Account_id`),
  CONSTRAINT `fk_Address_Account1` FOREIGN KEY (`Account_id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Kerasountos','25','Aigaleo Athens','12242','2','Koutras',2),(2,'Koliriou','40','Pyrgos','27131','1','Tsioris',2),(3,'Kerasountos','25','Aigaleo Athens','12242','2','Koutras',1),(4,'Koliriou','40','Pyrgos','27131','0','Tsioris',1),(5,'Katakolo','15','Pyrgos','27100','0','Kout',3);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_a`
--

DROP TABLE IF EXISTS `cat_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_a` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cat_a_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_a`
--

LOCK TABLES `cat_a` WRITE;
/*!40000 ALTER TABLE `cat_a` DISABLE KEYS */;
INSERT INTO `cat_a` VALUES (1,'Coffee'),(2,'Snack'),(3,'Drink'),(4,'Disable');
/*!40000 ALTER TABLE `cat_a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_b`
--

DROP TABLE IF EXISTS `cat_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_b` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cat_b_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_b`
--

LOCK TABLES `cat_b` WRITE;
/*!40000 ALTER TABLE `cat_b` DISABLE KEYS */;
INSERT INTO `cat_b` VALUES (1,'Ingredient'),(2,'Sugar'),(3,'Disabled');
/*!40000 ALTER TABLE `cat_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(45) DEFAULT NULL,
  `cat_b_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_cat_b1_idx` (`cat_b_id`),
  CONSTRAINT `fk_category_cat_b1` FOREIGN KEY (`cat_b_id`) REFERENCES `cat_b` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (3,'No Sugar',2),(4,'2 Sugars',2),(5,'4 Sugars',2),(6,'Milk',1),(7,'Chocolate',1),(8,'Cinnamon',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `details_categories`
--

DROP TABLE IF EXISTS `details_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `details_categories` (
  `order_details_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`order_details_id`,`category_id`),
  KEY `fk_category_id_idx` (`category_id`),
  CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_order_details_id` FOREIGN KEY (`order_details_id`) REFERENCES `order_details` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `details_categories`
--

LOCK TABLES `details_categories` WRITE;
/*!40000 ALTER TABLE `details_categories` DISABLE KEYS */;
INSERT INTO `details_categories` VALUES (4,3),(17,3),(19,3),(3,4),(6,4),(8,4),(10,4),(5,5),(7,5),(9,5),(11,5),(16,5),(18,5),(4,6),(17,6),(3,7),(6,7),(10,7),(19,7),(5,8),(7,8),(9,8),(16,8);
/*!40000 ALTER TABLE `details_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `unitprice` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_has_product_product1_idx` (`product_id`),
  KEY `fk_order_has_product_order1_idx` (`order_id`),
  CONSTRAINT `fk_order_has_product_order1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_order_has_product_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,16,1,2.00),(2,1,13,2,4.40),(3,1,3,2,3.60),(4,1,1,1,1.70),(5,1,5,1,1.90),(6,2,6,3,5.70),(7,3,2,1,1.20),(8,3,7,2,3.40),(9,3,15,2,4.00),(10,3,7,1,1.70),(11,3,8,1,1.50),(12,3,14,1,1.80),(13,3,18,1,2.00),(14,4,12,1,1.90),(15,4,23,2,2.00),(16,4,6,1,1.90),(17,4,1,1,1.70),(18,5,2,2,2.40),(19,5,4,1,1.80),(20,5,12,1,1.90);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `odate` datetime NOT NULL,
  `orderprice` decimal(5,2) NOT NULL,
  `comments` varchar(150) DEFAULT NULL,
  `Payment_id` int NOT NULL,
  `Account_id` int NOT NULL,
  `Store_id` int DEFAULT NULL,
  `Address_id` int NOT NULL,
  `status` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_Order_Payment1_idx` (`Payment_id`),
  KEY `fk_Order_Account1_idx` (`Account_id`),
  KEY `fk_Order_Store1_idx` (`Store_id`),
  KEY `fk_Order_Address1_idx` (`Address_id`),
  CONSTRAINT `fk_Order_Account1` FOREIGN KEY (`Account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `fk_Order_Address1` FOREIGN KEY (`Address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_Order_Payment1` FOREIGN KEY (`Payment_id`) REFERENCES `payment` (`id`),
  CONSTRAINT `fk_Order_Store1` FOREIGN KEY (`Store_id`) REFERENCES `store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2021-04-12 01:02:53',13.60,'',1,2,1,1,1),(2,'2021-04-12 01:04:30',5.70,'',1,2,1,1,1),(3,'2021-04-12 01:07:43',15.60,'',1,1,1,3,2),(4,'2021-04-12 01:09:57',7.50,'Call me',1,1,1,3,2),(5,'2021-04-12 03:03:23',6.10,'Call me',1,3,1,5,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'Cash'),(2,'PayPal');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(45) DEFAULT NULL,
  `baseprice` decimal(4,2) DEFAULT NULL,
  `imgsrc` varchar(65) DEFAULT NULL,
  `cat_a_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_cat_a1_idx` (`cat_a_id`),
  CONSTRAINT `fk_product_cat_a1` FOREIGN KEY (`cat_a_id`) REFERENCES `cat_a` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Freddo Espresso',1.70,'freddo-espresso.jpg',1),(2,'Espresso',1.20,'espresso.jpg',1),(3,'Freddo Cappuccino',1.80,'freddo-cappuccino.jpg',1),(4,'Cappuccino',1.80,'cappuccino.jpg',1),(5,'Latte',1.90,'latte.jpg',1),(6,'Freddo Macchiato',1.90,'freddo-machiatto.jpg',1),(7,'Frappe',1.70,'frappe.jpg',1),(8,'Greek Coffee',1.50,'greek-coffee.jpg',1),(9,'Cheese Pie',1.90,'cheese-pie.jpg',2),(10,'Cheese Ham Pie',2.00,'cheeseham-pie.jpg',2),(11,'Spinach Pie',2.10,'spinach-pie.jpg',2),(12,'Chocolate Croissant',1.90,'chocolate-croissant.jpg',2),(13,'Pizza',2.20,'pizza.jpg',2),(14,'French Croissant',1.80,'french-croissant.jpg',2),(15,'CocaCola 330ml',2.00,'coca_cola.jpg',3),(16,'CocaCola Zero 330ml',2.00,'coca_cola_zero.jpg',3),(17,'CocaCola Light 330ml',2.00,'coca_cola_light.jpg',3),(18,'Sprite 330ml',2.00,'sprite.jpg',3),(19,'Fanta 330ml',2.00,'fanta330ml.jpg',3),(20,'Monster Green',2.50,'monster-green.jpg',3),(21,'RedBull ',2.50,'redbull.jpg',3),(22,'Water 500ml',0.50,'water.jpg',3),(23,'Water 1L',1.00,'water.jpg',3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rname` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rname_UNIQUE` (`rname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(80) DEFAULT NULL,
  `storename` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Nikolaou Plastira 8 Aigaleo 12242','Aigaleo');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'cafeteria'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-12 17:18:50
