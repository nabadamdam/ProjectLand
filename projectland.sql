-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: projectland
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `discount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `articles_category_id_foreign` (`category_id`),
  CONSTRAINT `articles_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'New article',2,'Article description','images/1669760427.jpg',0,25.6,0,'2022-11-29 21:38:16','2022-11-29 21:38:16',NULL),(2,'New articlee',2,'Article descriptionn','images/1669837177.jpg',0,25.66,100,'2022-11-29 21:38:25','2022-11-30 18:40:54',NULL),(3,'New article',2,'Article description','images/1669760427.jpg',100,25.6,0,'2022-11-29 21:38:25','2022-11-30 17:01:22','2022-11-30 17:01:22'),(4,'New article',2,'Article description','images/1669760427.jpg',100,25.6,0,'2022-11-29 21:38:26','2022-11-30 16:59:59','2022-11-30 16:59:59'),(5,'New article',2,'Article description','images/1669760427.jpg',100,25.6,0,'2022-11-29 21:38:27','2022-11-29 22:05:15','2022-11-29 22:05:15'),(6,'New article',2,'Article description','images/1669761530.jpg',100,25.6,0,'2022-11-29 21:38:50','2022-11-29 21:41:52','2022-11-29 21:41:52'),(7,'New article',2,'Article description','images/1669832172.jpg',100,25.6,0,'2022-11-30 17:16:12','2022-11-30 17:16:12',NULL),(8,'New article',2,'Article description','images/1669832374.jpg',0,25.6,0,'2022-11-30 17:19:34','2022-12-01 18:41:04','2022-12-01 18:41:04'),(9,'New article',2,'Article description','images/1669832383.jpg',100,25.6,0,'2022-11-30 17:19:43','2022-11-30 17:19:43',NULL),(10,'New article',2,'Article description','images/1669832643.jpg',100,25.6,0,'2022-11-30 17:24:03','2022-11-30 17:24:03',NULL),(11,'New articleee',4,'Article descriptionnn','images/1669837786.jpg',10000,206.66,10,'2022-11-30 18:49:46','2022-11-30 21:20:03','2022-11-30 21:20:03'),(12,'New articleee',5,'Article descriptionnn','images/1669837839.jpg',10000,260.66,70,'2022-11-30 18:50:39','2022-11-30 18:50:39',NULL),(13,'New articleee',2,'Article descriptionnn','images/1669838094.jpg',0,26.66,60,'2022-11-30 18:54:54','2022-11-30 18:54:54',NULL),(14,'New articleee',2,'Article descriptionnn','images/1669838556.jpg',10000,6.66,5,'2022-11-30 19:02:36','2022-11-30 19:02:36',NULL),(15,'New articleee',2,'Article descriptionnn','images/1669838644.jpg',0,26.66,35,'2022-11-30 19:04:04','2022-11-30 19:04:04',NULL),(16,'New articleee',2,'Article descriptionnn','images/1669838755.jpg',9982,2.66,15,'2022-11-30 19:05:55','2022-12-01 20:45:36',NULL),(17,'26',2,'Article descriptionnn','images/1669838762.jpg',9988,26.66,4,'2022-11-30 19:06:02','2022-12-01 20:45:36',NULL),(18,'New articleeee',5,'Article descriptionnnnn','images/1669919417.jpg',9982,65.55,10000,'2022-12-01 17:27:59','2022-12-01 20:45:36',NULL),(19,'New articlee',4,'Article descriptionn','images/1669919292.jpg',9994,65.5,10,'2022-12-01 17:28:12','2022-12-01 17:28:12',NULL),(20,'New article',4,'Article description','images/1669922927.jpg',2555,650.55,10000,'2022-12-01 18:28:47','2022-12-01 18:28:47',NULL),(21,'Article',5,'Description','images/1669923089.jpg',250,5.55,100,'2022-12-01 18:29:00','2022-12-01 18:31:44',NULL);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Friedrich Padberg','2022-11-29 19:52:36','2022-11-29 19:52:36'),(2,'Roscoe Cronin','2022-11-29 19:52:36','2022-11-29 19:52:36'),(3,'Gennaro Labadie','2022-11-29 19:52:36','2022-11-29 19:52:36'),(4,'Melody Bergstrom III','2022-11-29 19:52:36','2022-11-29 19:52:36'),(5,'Itzel Reilly Sr.','2022-11-29 19:52:36','2022-11-29 19:52:36'),(6,'Juvenal Morissette','2022-11-29 19:52:36','2022-11-29 19:52:36'),(7,'Velma Conroy','2022-11-29 19:52:36','2022-11-29 19:52:36'),(8,'Giovanna Lehner','2022-11-29 19:52:36','2022-11-29 19:52:36'),(9,'Prof. Colleen Skiles PhD','2022-11-29 19:52:36','2022-11-29 19:52:36'),(10,'Carmine Langosh V','2022-11-29 19:52:36','2022-11-29 19:52:36'),(11,'Jonathan Lemke','2022-11-29 19:53:07','2022-11-29 19:53:07'),(12,'Jarrod Cruickshank','2022-11-29 19:53:07','2022-11-29 19:53:07'),(13,'Prof. Abner Schulist','2022-11-29 19:53:07','2022-11-29 19:53:07'),(14,'Miss Carolanne McClure','2022-11-29 19:53:07','2022-11-29 19:53:07'),(15,'Karine Upton','2022-11-29 19:53:07','2022-11-29 19:53:07'),(16,'Clyde McKenzie','2022-11-29 19:53:07','2022-11-29 19:53:07'),(17,'Prof. Maxie Cole','2022-11-29 19:53:07','2022-11-29 19:53:07'),(18,'Prof. Lawson Konopelski DVM','2022-11-29 19:53:07','2022-11-29 19:53:07'),(19,'Daphney Gaylord DDS','2022-11-29 19:53:07','2022-11-29 19:53:07'),(20,'Joana Jacobs','2022-11-29 19:53:07','2022-11-29 19:53:07');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2019_12_14_000001_create_personal_access_tokens_table',1),(2,'2022_11_29_182209_create_categories_table',1),(4,'2022_11_29_182258_create_articles_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-01 23:44:04
