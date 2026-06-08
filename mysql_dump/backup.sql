-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: nextapp
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.22.04.2

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
-- Table structure for table `auth_users`
--

DROP TABLE IF EXISTS `auth_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_users`
--

LOCK TABLES `auth_users` WRITE;
/*!40000 ALTER TABLE `auth_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_events`
--

DROP TABLE IF EXISTS `security_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `security_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `severity` enum('low','medium','high','critical') DEFAULT 'low',
  `description` text,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `metadata` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_events`
--

LOCK TABLES `security_events` WRITE;
/*!40000 ALTER TABLE `security_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `security_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `phoneno` varchar(10) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `rollno` int NOT NULL,
  PRIMARY KEY (`rollno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES ('Arthika K','arthika@gmail.com','5609899878',41,1),('Athira KA','athira@gmail.com','7899897876',22,2),('Kevin','kevin@gmail.com','9009899878',25,3),('Zibin','zibin@gmail.com','9809899878',35,4),('Tanush','tanushkr@gmail.com','9609899878',24,5),('Tirakha','tirakha@gmail.com','8609899878',13,6),('Adithya','adithya@gmail.com','6609899878',56,7),('Keerthy','keerthy@gmail.com','7819897876',34,8),('Tinu','tinu@gmail.com','7899497876',23,9),('Athul','athul@gmail.com','7609899878',45,10),('Jna','jna@test.com','7609899872',21,12),('Aparna K','aparna@gmail.com','7609899878',45,45);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_devices`
--

DROP TABLE IF EXISTS `user_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_devices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `device_fingerprint` varchar(255) NOT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `device_type` varchar(100) DEFAULT NULL,
  `browser` varchar(100) DEFAULT NULL,
  `platform` varchar(100) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `user_agent` text,
  `last_seen` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_trusted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_device` (`user_id`,`device_fingerprint`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_devices`
--

LOCK TABLES `user_devices` WRITE;
/*!40000 ALTER TABLE `user_devices` DISABLE KEYS */;
INSERT INTO `user_devices` VALUES (1,1,'46c230e601b92ad53890dde7764b2809913634bcd3e55de2a671d15e92dd3e4a','\"Android\" - \"Chromium\";v=\"146\"','web','\"Chromium\";v=\"146\"','\"Android\"','::1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36','2026-05-20 09:29:27','2026-05-12 05:38:54',0),(2,1,'0dbe86488737b6f8c21fade7b60c3d6164dd40af05b84d12abe4c04c6482f92f','\"Linux\" - \"Chromium\";v=\"146\"','web','\"Chromium\";v=\"146\"','\"Linux\"','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36','2026-05-21 06:57:16','2026-05-12 05:43:23',0),(7,1,'f7b92813886de0c598b480d199a3728b415ad54a98b1147610f8f7b3997e3d1c','\"Android\" - \"Chromium\";v=\"146\"','web','\"Chromium\";v=\"146\"','\"Android\"','::1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36','2026-05-20 11:46:31','2026-05-12 05:56:05',0),(9,1,'ef4cc00d0f0223344b6c6c40e2416b3936765be4c467a79c282d338f2494f4e6','\"Linux\" - \"Chromium\";v=\"146\"','web','\"Chromium\";v=\"146\"','\"Linux\"','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36','2026-05-21 09:52:29','2026-05-12 06:21:17',0),(13,2,'ef4cc00d0f0223344b6c6c40e2416b3936765be4c467a79c282d338f2494f4e6','\"Linux\" - \"Chromium\";v=\"146\"','web','\"Chromium\";v=\"146\"','\"Linux\"','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36','2026-05-21 11:36:05','2026-05-12 06:42:57',0),(22,1,'80fec121258f2fe67f9f673c4b8f6aca473cec064e82d3e61ba6ae4678e17b82','Unknown - Unknown Browser','web','Unknown','Unknown','::ffff:127.0.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:150.0) Gecko/20100101 Firefox/150.0','2026-05-19 08:01:05','2026-05-13 05:45:38',0),(29,2,'46c230e601b92ad53890dde7764b2809913634bcd3e55de2a671d15e92dd3e4a','\"Android\" - \"Chromium\";v=\"146\"','web','\"Chromium\";v=\"146\"','\"Android\"','::1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36','2026-05-19 06:25:01','2026-05-13 10:52:56',0),(57,2,'0dbe86488737b6f8c21fade7b60c3d6164dd40af05b84d12abe4c04c6482f92f','\"Linux\" - \"Chromium\";v=\"146\"','web','\"Chromium\";v=\"146\"','\"Linux\"','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36','2026-05-19 07:29:42','2026-05-19 07:29:42',0),(58,2,'80fec121258f2fe67f9f673c4b8f6aca473cec064e82d3e61ba6ae4678e17b82','Unknown - Unknown Browser','web','Unknown','Unknown','::ffff:127.0.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:150.0) Gecko/20100101 Firefox/150.0','2026-05-19 07:47:15','2026-05-19 07:33:52',0),(59,2,'f7b92813886de0c598b480d199a3728b415ad54a98b1147610f8f7b3997e3d1c','\"Android\" - \"Chromium\";v=\"146\"','web','\"Chromium\";v=\"146\"','\"Android\"','::1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36','2026-05-19 07:46:21','2026-05-19 07:37:24',0),(68,1,'e30de25be436b33ef9c73354c8ecb07aff1bfdb9eb35182e1280c0dcf8c6be61','Unknown - Unknown Browser','web','Unknown','Unknown','::ffff:127.0.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:151.0) Gecko/20100101 Firefox/151.0','2026-05-25 10:02:03','2026-05-20 09:48:20',0),(80,2,'cddee51e723f9d431002246bc464c5e4ef8520fea62daf31c6b0f9d7706f2971','\"Linux\" - \"Chromium\";v=\"148\"','web','\"Chromium\";v=\"148\"','\"Linux\"','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-06-08 07:34:38','2026-05-25 04:31:33',0),(81,1,'cddee51e723f9d431002246bc464c5e4ef8520fea62daf31c6b0f9d7706f2971','\"Linux\" - \"Chromium\";v=\"148\"','web','\"Chromium\";v=\"148\"','\"Linux\"','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-29 09:06:18','2026-05-25 04:46:46',0),(89,2,'8193d8fa13853b6a3339e52f0d494b44328052713e18ec1b70472b50be957f50','\"macOS\" - \"Chromium\";v=\"148\"','web','\"Chromium\";v=\"148\"','\"macOS\"','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-25 07:22:54','2026-05-25 07:22:54',0),(96,2,'5ead71296c322fe768124a280662a65b0d29637129dea8eeacb468c5cffe0180','\"Linux\" - \"Chromium\";v=\"148\"','web','\"Chromium\";v=\"148\"','\"Linux\"','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-26 07:10:26','2026-05-26 06:11:19',0);
/*!40000 ALTER TABLE `user_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_sessions`
--

DROP TABLE IF EXISTS `user_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `session_token` varchar(255) NOT NULL,
  `expires_at` timestamp NOT NULL,
  `last_activity` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `device_fingerprint` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `logout_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `session_token` (`session_token`),
  KEY `idx_session_token` (`session_token`),
  KEY `idx_expires_at` (`expires_at`),
  KEY `idx_ip_address` (`ip_address`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_device_fingerprint` (`device_fingerprint`),
  KEY `idx_is_active` (`is_active`),
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `fk_user_sessions_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_sessions`
--

LOCK TABLES `user_sessions` WRITE;
/*!40000 ALTER TABLE `user_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('admin','manager','user') DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'bibin@gmail.com','$2b$10$KypADughuw3h5mlAMlZ64.O1QL.ysGf0r0aHySVzQ3eY7lZJeu9Hi','user','2026-05-06 08:07:49','2026-05-06 08:07:49',NULL),(2,NULL,'libin@gmail.com','$2b$10$noZ5J.E3ov48K5OUiyOIbOA63Wq88LT.nHg6dKOM1VESHYUT5qJwK','admin','2026-05-06 09:18:55','2026-05-06 10:01:00',NULL),(3,NULL,'athul@gmail.com','$2b$10$MJGCHqplLDid1BnrttIBq.aPYJoaWOCt6kd0TxpPO6/yY/808qvve','user','2026-05-07 05:35:32','2026-05-07 05:35:32',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-08 14:43:58
