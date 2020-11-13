-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: PlanningDatabase
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.2

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
-- Table structure for table `Accounts_absence`
--

DROP TABLE IF EXISTS `Accounts_absence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounts_absence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `classe` varchar(50) NOT NULL,
  `cours` varchar(50) NOT NULL,
  `debut` varchar(50) NOT NULL,
  `fin` varchar(50) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts_absence`
--

LOCK TABLES `Accounts_absence` WRITE;
/*!40000 ALTER TABLE `Accounts_absence` DISABLE KEYS */;
INSERT INTO `Accounts_absence` VALUES (3,'DIAKHATE','Faty','DIC1_GIT','Machine Learning','14:22','03:33','2020-02-29 00:00:00.000000'),(4,'DIAKHATE','Faty','DIC1_GIT','Machine Learning','20:08','00:00','2020-02-19 00:00:00.000000');
/*!40000 ALTER TABLE `Accounts_absence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Accounts_cahier_de_texte`
--

DROP TABLE IF EXISTS `Accounts_cahier_de_texte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounts_cahier_de_texte` (
  `id` int NOT NULL AUTO_INCREMENT,
  `classe` varchar(50) NOT NULL,
  `titre_EC` varchar(50) NOT NULL,
  `date` datetime(6) NOT NULL,
  `duree_EC` varchar(50) NOT NULL,
  `nom_professeur` varchar(50) DEFAULT NULL,
  `contenu` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts_cahier_de_texte`
--

LOCK TABLES `Accounts_cahier_de_texte` WRITE;
/*!40000 ALTER TABLE `Accounts_cahier_de_texte` DISABLE KEYS */;
/*!40000 ALTER TABLE `Accounts_cahier_de_texte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Accounts_classe`
--

DROP TABLE IF EXISTS `Accounts_classe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounts_classe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `annee` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts_classe`
--

LOCK TABLES `Accounts_classe` WRITE;
/*!40000 ALTER TABLE `Accounts_classe` DISABLE KEYS */;
INSERT INTO `Accounts_classe` VALUES (1,'DIC1_GIT','2020-02-27');
/*!40000 ALTER TABLE `Accounts_classe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Accounts_dispenser_cours`
--

DROP TABLE IF EXISTS `Accounts_dispenser_cours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounts_dispenser_cours` (
  `id` int NOT NULL AUTO_INCREMENT,
  `classe_id` int NOT NULL,
  `uc_id` int NOT NULL,
  `utilisateur_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Accounts_dispenser_c_classe_id_b81cd807_fk_Accounts_` (`classe_id`),
  KEY `Accounts_dispenser_cours_uc_id_384bea7e_fk_Accounts_ec_id` (`uc_id`),
  KEY `Accounts_dispenser_c_utilisateur_id_8bcfca04_fk_Accounts_` (`utilisateur_id`),
  CONSTRAINT `Accounts_dispenser_c_classe_id_b81cd807_fk_Accounts_` FOREIGN KEY (`classe_id`) REFERENCES `Accounts_classe` (`id`),
  CONSTRAINT `Accounts_dispenser_c_utilisateur_id_8bcfca04_fk_Accounts_` FOREIGN KEY (`utilisateur_id`) REFERENCES `Accounts_utilisateur` (`id`),
  CONSTRAINT `Accounts_dispenser_cours_uc_id_384bea7e_fk_Accounts_ec_id` FOREIGN KEY (`uc_id`) REFERENCES `Accounts_ec` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts_dispenser_cours`
--

LOCK TABLES `Accounts_dispenser_cours` WRITE;
/*!40000 ALTER TABLE `Accounts_dispenser_cours` DISABLE KEYS */;
/*!40000 ALTER TABLE `Accounts_dispenser_cours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Accounts_document`
--

DROP TABLE IF EXISTS `Accounts_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounts_document` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `categorie` varchar(50) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `classe` varchar(50) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts_document`
--

LOCK TABLES `Accounts_document` WRITE;
/*!40000 ALTER TABLE `Accounts_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `Accounts_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Accounts_ec`
--

DROP TABLE IF EXISTS `Accounts_ec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounts_ec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `charge_horaire` varchar(50) NOT NULL,
  `coef` varchar(50) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `ue_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Accounts_ec_ue_id_ef3e3765_fk_Accounts_ue_id` (`ue_id`),
  CONSTRAINT `Accounts_ec_ue_id_ef3e3765_fk_Accounts_ue_id` FOREIGN KEY (`ue_id`) REFERENCES `Accounts_ue` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts_ec`
--

LOCK TABLES `Accounts_ec` WRITE;
/*!40000 ALTER TABLE `Accounts_ec` DISABLE KEYS */;
INSERT INTO `Accounts_ec` VALUES (2,'Developpement','Passss','40','2','13251921_E3RJgET.jpg',4),(3,'Architecture des ordinateurs','Pass','40','2','1428520_fLlUl0U.jpg',5),(4,'Assembleur','Pass','20','1','1330547_LqsOAST.jpg',5),(5,'ORACLE','Pass','20','2','1428520_another_copy_T5TnOuM.jpg',6),(6,'MongoDB','Pass','40','2','c521da6ee30942151a367b41ed3329f7_xa1mWE3.gif',6),(7,'Transmission de Donnees','Passss','40','2','13251921_d52ieig.jpg',8);
/*!40000 ALTER TABLE `Accounts_ec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Accounts_maquette`
--

DROP TABLE IF EXISTS `Accounts_maquette`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounts_maquette` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts_maquette`
--

LOCK TABLES `Accounts_maquette` WRITE;
/*!40000 ALTER TABLE `Accounts_maquette` DISABLE KEYS */;
INSERT INTO `Accounts_maquette` VALUES (6,'DIC1_GIT','2020-03-04','Passs'),(7,'DIC1_GIT','2020-01-31','Maquette DIC1 GITV'),(8,'DIC1_GIT','2020-04-28','Paassssss'),(9,'DIC1_GIT','2020-09-26','Passsss');
/*!40000 ALTER TABLE `Accounts_maquette` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Accounts_publication`
--

DROP TABLE IF EXISTS `Accounts_publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounts_publication` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `message` longtext NOT NULL,
  `utilisateur_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Accounts_publication_utilisateur_id_e96c3628_fk_Accounts_` (`utilisateur_id`),
  CONSTRAINT `Accounts_publication_utilisateur_id_e96c3628_fk_Accounts_` FOREIGN KEY (`utilisateur_id`) REFERENCES `Accounts_utilisateur` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts_publication`
--

LOCK TABLES `Accounts_publication` WRITE;
/*!40000 ALTER TABLE `Accounts_publication` DISABLE KEYS */;
/*!40000 ALTER TABLE `Accounts_publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Accounts_time_table`
--

DROP TABLE IF EXISTS `Accounts_time_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounts_time_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `classe` varchar(50) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts_time_table`
--

LOCK TABLES `Accounts_time_table` WRITE;
/*!40000 ALTER TABLE `Accounts_time_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `Accounts_time_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Accounts_timetable`
--

DROP TABLE IF EXISTS `Accounts_timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounts_timetable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ec` varchar(50) DEFAULT NULL,
  `debut` time(6) DEFAULT NULL,
  `fin` time(6) DEFAULT NULL,
  `prof` varchar(50) DEFAULT NULL,
  `jour` varchar(50) DEFAULT NULL,
  `timetableliste_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Accounts_timetable_timetableliste_id_ce74b49c_fk_Accounts_` (`timetableliste_id`),
  CONSTRAINT `Accounts_timetable_timetableliste_id_ce74b49c_fk_Accounts_` FOREIGN KEY (`timetableliste_id`) REFERENCES `Accounts_timetableliste` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts_timetable`
--

LOCK TABLES `Accounts_timetable` WRITE;
/*!40000 ALTER TABLE `Accounts_timetable` DISABLE KEYS */;
INSERT INTO `Accounts_timetable` VALUES (1,'null',NULL,NULL,'null','null',1),(2,'null',NULL,NULL,'null','null',1),(3,'null',NULL,NULL,'null','null',1),(4,'null',NULL,NULL,'null','null',1),(5,'null',NULL,NULL,'null','null',1),(6,'null',NULL,NULL,NULL,'null',1),(7,'Architecture des ordinateurs','01:01:00.000000','14:02:00.000000','null','Lundi',2),(8,'null',NULL,NULL,'null','null',2),(9,'null',NULL,NULL,'null','null',2),(10,'null',NULL,NULL,'null','null',2),(11,'null',NULL,NULL,'null','null',2),(12,'null',NULL,NULL,NULL,'null',2),(13,'null',NULL,NULL,'null','null',2),(14,'null',NULL,NULL,'null','null',2),(15,'null',NULL,NULL,'null','null',2),(16,'null',NULL,NULL,'null','null',2),(17,'null',NULL,NULL,'null','null',2),(18,'Machine Learning','11:11:00.000000','14:22:00.000000','null','Lundi',3),(19,'Architecture des ordinateurs','03:33:00.000000','16:44:00.000000','null','Lundi',3),(20,'Assembleur','09:09:00.000000','12:00:00.000000','null','Mardi',3),(21,'ORACLE','12:00:00.000000','21:09:00.000000','null','Mardi',3),(22,'null',NULL,NULL,'null','null',3),(23,'null',NULL,NULL,NULL,'null',3),(24,'null',NULL,NULL,'null','null',3),(25,'null',NULL,NULL,'null','null',3),(26,'null',NULL,NULL,'null','null',3),(27,'null',NULL,NULL,'null','null',3),(28,'null',NULL,NULL,'null','null',3),(29,'null',NULL,NULL,'null','null',5),(30,'null',NULL,NULL,'null','null',5),(31,'null',NULL,NULL,'null','null',5),(32,'null',NULL,NULL,'null','null',5),(33,'null',NULL,NULL,'null','null',5),(34,'null',NULL,NULL,'null','null',5),(35,'null',NULL,NULL,NULL,'null',5),(36,'null',NULL,NULL,'null','null',5),(37,'null',NULL,NULL,'null','null',5),(38,'null',NULL,NULL,'null','null',5),(39,'null',NULL,NULL,'null','null',5),(40,'null',NULL,NULL,'null','null',5),(41,'null',NULL,NULL,'null','Lundi',6),(42,'null',NULL,NULL,'null','Lundi',6),(43,'null',NULL,NULL,'null','Mardi',6),(44,'null',NULL,NULL,'null','Mardi',6),(45,'null',NULL,NULL,'null','Mercredi',6),(46,'null',NULL,NULL,NULL,'Mercredi',6),(47,'null',NULL,NULL,'null','Jeudi',6),(48,'null',NULL,NULL,'null','Jeudi',6),(49,'null',NULL,NULL,'null','Vendredi',6),(50,'null',NULL,NULL,'null','Vendredi',6),(51,'null',NULL,NULL,'null','Samedi',6),(52,'Examen','15:00:00.000000','19:00:00.000000','null','Lundi',7),(53,'null',NULL,NULL,'null','null',7),(54,'null',NULL,NULL,'null','null',7),(55,'null',NULL,NULL,'null','null',7),(56,'null',NULL,NULL,'null','null',7),(57,'null',NULL,NULL,NULL,'null',7),(58,'null',NULL,NULL,'null','null',7),(59,'null',NULL,NULL,'null','null',7),(60,'null',NULL,NULL,'null','null',7),(61,'null',NULL,NULL,'null','null',7),(62,'null',NULL,NULL,'null','null',7);
/*!40000 ALTER TABLE `Accounts_timetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Accounts_timetableliste`
--

DROP TABLE IF EXISTS `Accounts_timetableliste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounts_timetableliste` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `classe` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts_timetableliste`
--

LOCK TABLES `Accounts_timetableliste` WRITE;
/*!40000 ALTER TABLE `Accounts_timetableliste` DISABLE KEYS */;
INSERT INTO `Accounts_timetableliste` VALUES (1,'Machine Learning','2020-02-29 00:00:00.000000','DIC1_GIT'),(2,'TimeTable','2020-03-02 00:00:00.000000','DIC1_GIT'),(3,'Emploi Du Temps','2020-03-30 00:00:00.000000','DIC1_GIT'),(4,'TimeTable','2020-03-07 00:00:00.000000','DIC1_GIT'),(5,'Emploi du Temps De La Semaine','2020-04-29 00:00:00.000000','DIC1_GIT'),(6,'Transmission de Donnees','2020-06-13 00:00:00.000000','DIC1_GIT'),(7,'Falilou','2020-04-29 00:00:00.000000','DIC1_GIT');
/*!40000 ALTER TABLE `Accounts_timetableliste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Accounts_ue`
--

DROP TABLE IF EXISTS `Accounts_ue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounts_ue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `code` varchar(50) NOT NULL,
  `maquette_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Accounts_ue_maquette_id_25e62fdb_fk_Accounts_maquette_id` (`maquette_id`),
  CONSTRAINT `Accounts_ue_maquette_id_25e62fdb_fk_Accounts_maquette_id` FOREIGN KEY (`maquette_id`) REFERENCES `Accounts_maquette` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts_ue`
--

LOCK TABLES `Accounts_ue` WRITE;
/*!40000 ALTER TABLE `Accounts_ue` DISABLE KEYS */;
INSERT INTO `Accounts_ue` VALUES (4,'Machine Learning','Pess','GIT_DEV1',6),(5,'Complexite','Module Complexite','DFR',7),(6,'Base De Donnees','Pass','DER',7),(7,'DIC1_GIT','Passs','GIT_DEV1',8),(8,'UETES','Pass','DER',9),(9,'Machine Learning','up','DFR',9);
/*!40000 ALTER TABLE `Accounts_ue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Accounts_utilisateur`
--

DROP TABLE IF EXISTS `Accounts_utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounts_utilisateur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `telephone` varchar(50) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `fonction` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `classe_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `Accounts_utilisateur_classe_id_dec509e5_fk_Accounts_classe_id` (`classe_id`),
  CONSTRAINT `Accounts_utilisateur_classe_id_dec509e5_fk_Accounts_classe_id` FOREIGN KEY (`classe_id`) REFERENCES `Accounts_classe` (`id`),
  CONSTRAINT `Accounts_utilisateur_user_id_ae4e7d13_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts_utilisateur`
--

LOCK TABLES `Accounts_utilisateur` WRITE;
/*!40000 ALTER TABLE `Accounts_utilisateur` DISABLE KEYS */;
INSERT INTO `Accounts_utilisateur` VALUES (1,'774402066','access-denied.jpg','Eleve','null',1,3),(2,'7778653419','1428520_ZPMXsnj.jpg','Responsable','null',1,5),(3,'7778653419','53915792.jpeg','Professeur','null',1,7);
/*!40000 ALTER TABLE `Accounts_utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add cahier_ de_ texte',7,'add_cahier_de_texte'),(26,'Can change cahier_ de_ texte',7,'change_cahier_de_texte'),(27,'Can delete cahier_ de_ texte',7,'delete_cahier_de_texte'),(28,'Can view cahier_ de_ texte',7,'view_cahier_de_texte'),(29,'Can add classe',8,'add_classe'),(30,'Can change classe',8,'change_classe'),(31,'Can delete classe',8,'delete_classe'),(32,'Can view classe',8,'view_classe'),(33,'Can add maquette',9,'add_maquette'),(34,'Can change maquette',9,'change_maquette'),(35,'Can delete maquette',9,'delete_maquette'),(36,'Can view maquette',9,'view_maquette'),(37,'Can add time_ table',10,'add_time_table'),(38,'Can change time_ table',10,'change_time_table'),(39,'Can delete time_ table',10,'delete_time_table'),(40,'Can view time_ table',10,'view_time_table'),(41,'Can add time table liste',11,'add_timetableliste'),(42,'Can change time table liste',11,'change_timetableliste'),(43,'Can delete time table liste',11,'delete_timetableliste'),(44,'Can view time table liste',11,'view_timetableliste'),(45,'Can add utilisateur',12,'add_utilisateur'),(46,'Can change utilisateur',12,'change_utilisateur'),(47,'Can delete utilisateur',12,'delete_utilisateur'),(48,'Can view utilisateur',12,'view_utilisateur'),(49,'Can add ue',13,'add_ue'),(50,'Can change ue',13,'change_ue'),(51,'Can delete ue',13,'delete_ue'),(52,'Can view ue',13,'view_ue'),(53,'Can add time table',14,'add_timetable'),(54,'Can change time table',14,'change_timetable'),(55,'Can delete time table',14,'delete_timetable'),(56,'Can view time table',14,'view_timetable'),(57,'Can add publication',15,'add_publication'),(58,'Can change publication',15,'change_publication'),(59,'Can delete publication',15,'delete_publication'),(60,'Can view publication',15,'view_publication'),(61,'Can add ec',16,'add_ec'),(62,'Can change ec',16,'change_ec'),(63,'Can delete ec',16,'delete_ec'),(64,'Can view ec',16,'view_ec'),(65,'Can add dispenser_ cours',17,'add_dispenser_cours'),(66,'Can change dispenser_ cours',17,'change_dispenser_cours'),(67,'Can delete dispenser_ cours',17,'delete_dispenser_cours'),(68,'Can view dispenser_ cours',17,'view_dispenser_cours'),(69,'Can add absence',18,'add_absence'),(70,'Can change absence',18,'change_absence'),(71,'Can delete absence',18,'delete_absence'),(72,'Can view absence',18,'view_absence'),(73,'Can add document',19,'add_document'),(74,'Can change document',19,'change_document'),(75,'Can delete document',19,'delete_document'),(76,'Can view document',19,'view_document');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$yrXLgqocq5Wk$SndIJJQXPmJnbFkqBgz391i+SHowffCpD0cnK75C/h0=',NULL,0,'falloudiakhate','Fallou','DIAKHATE','dfallou@ept.sn',0,1,'2020-02-27 18:51:14.677534'),(2,'pbkdf2_sha256$180000$SwCU8vDFv8Ui$lM6AnJcgOpEmAiC3PNew8YU8SO7yv036nngmhvKv9K8=','2020-02-27 18:55:51.897607',1,'falloudiakhatee','','','dfallou@ept.sn',1,1,'2020-02-27 18:54:14.666914'),(3,'pbkdf2_sha256$150000$TKBCWgVNCDJ5$+/J6y3lTjGyLmZ1N878QwLDlZTi1MiQ/MKY4LGSn+sM=','2020-03-12 23:57:14.351627',0,'fatygueye','Faty','DIAKHATE','faty@ept.sn',0,1,'2020-02-27 19:00:12.200442'),(4,'pbkdf2_sha256$180000$ocj6haWsi0dU$1A/Ifp/lEjWU1zP6dTyp2FdVR5iPZVtesA5Ku5kEwio=','2020-02-29 09:41:30.278830',1,'planning','','','dfallou@ept.sn',1,1,'2020-02-28 22:20:26.695815'),(5,'pbkdf2_sha256$180000$6vQGUjGQW0cT$rk9eYEGC9TO7H3QEIEHCy2R69VQ9nqIOQ5R4NmzmCTs=','2020-02-29 08:57:36.336178',0,'mamadousow2810','SOW','Mamadou','dfallou@ept.sn',0,1,'2020-02-28 22:42:08.711567'),(6,'pbkdf2_sha256$150000$VUdtvXihv0Mz$/GBy5ITRWrl5otUyes30s+KSxqpjvAHAzENqMip4HZM=','2020-07-04 15:39:16.250050',1,'ablayediakhate','','','ablaye@ept.sn',1,1,'2020-07-04 15:18:42.351657'),(7,'pbkdf2_sha256$150000$Ms0xQBtYmp7s$cKqFAyctJaIFmmpiHSggpRJVuuKPHIxiVkfnjh1LxKs=','2020-07-04 15:54:32.094123',0,'aliounesarr','','','',0,1,'2020-07-04 15:20:39.817974');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-02-27 18:55:14.293773','1','DIC1_GIT',1,'[{\"added\": {}}]',8,2),(2,'2020-02-28 22:21:26.991180','1','Maquette object (1)',1,'[{\"added\": {}}]',9,4),(3,'2020-02-28 22:21:34.845516','1','UE object (1)',1,'[{\"added\": {}}]',13,4),(4,'2020-02-28 22:21:47.665185','1','EC object (1)',1,'[{\"added\": {}}]',16,4),(5,'2020-07-04 15:20:39.932554','7','aliounesarr',1,'[{\"added\": {}}]',4,6),(6,'2020-07-04 15:39:45.971433','3','Utilisateur object (3)',1,'[{\"added\": {}}]',12,6);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (18,'Accounts','absence'),(7,'Accounts','cahier_de_texte'),(8,'Accounts','classe'),(17,'Accounts','dispenser_cours'),(19,'Accounts','document'),(16,'Accounts','ec'),(9,'Accounts','maquette'),(15,'Accounts','publication'),(10,'Accounts','time_table'),(14,'Accounts','timetable'),(11,'Accounts','timetableliste'),(13,'Accounts','ue'),(12,'Accounts','utilisateur'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-02-27 18:50:03.379384'),(2,'auth','0001_initial','2020-02-27 18:50:03.821943'),(3,'Accounts','0001_initial','2020-02-27 18:50:06.252108'),(4,'admin','0001_initial','2020-02-27 18:50:07.762800'),(5,'admin','0002_logentry_remove_auto_add','2020-02-27 18:50:08.115121'),(6,'admin','0003_logentry_add_action_flag_choices','2020-02-27 18:50:08.139684'),(7,'contenttypes','0002_remove_content_type_name','2020-02-27 18:50:08.441723'),(8,'auth','0002_alter_permission_name_max_length','2020-02-27 18:50:08.656021'),(9,'auth','0003_alter_user_email_max_length','2020-02-27 18:50:08.714982'),(10,'auth','0004_alter_user_username_opts','2020-02-27 18:50:08.742243'),(11,'auth','0005_alter_user_last_login_null','2020-02-27 18:50:08.891532'),(12,'auth','0006_require_contenttypes_0002','2020-02-27 18:50:08.903069'),(13,'auth','0007_alter_validators_add_error_messages','2020-02-27 18:50:08.931373'),(14,'auth','0008_alter_user_username_max_length','2020-02-27 18:50:09.110069'),(15,'auth','0009_alter_user_last_name_max_length','2020-02-27 18:50:09.343464'),(16,'auth','0010_alter_group_name_max_length','2020-02-27 18:50:09.394306'),(17,'auth','0011_update_proxy_permissions','2020-02-27 18:50:09.427260'),(18,'sessions','0001_initial','2020-02-27 18:50:09.500359'),(19,'Accounts','0002_absence','2020-02-28 17:38:31.600471'),(20,'Accounts','0003_absence_date','2020-02-28 22:24:41.469275'),(21,'Accounts','0004_document','2020-03-04 10:24:27.481593');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1joa16kp7doku303yf4lnkjly997ytfq','ZmUyZjBlZGUxOWY3ZWNhNzAwZmYwYjI4ZDAyNzU4Y2U4ZDM0ZWFjMzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxMjhhOTZkNDU3MTEyZmM5ZTAyMGRlYjc0NjFmMzA0MTMwODdlNGFkIn0=','2020-03-18 10:10:35.840264'),('4dmdr338yavgs8a5q0ur5f0ywpn6cf00','N2Q1Y2M3YzJkMGU2NTBjOTIyZmUwODUzMGJkYzhlNjg1ZDU2ZDgyMjp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYWQ2OTViYzQ2MmFhMWJjZGQ2NzI1M2YwMTBiMDk1NTMwOTFkMDNkIn0=','2020-07-18 15:54:32.106058'),('6kymxp9ttuu0rmrh481fb38cphbskwci','ZWJkNzFlYzY4MmJiZWIyNjViZTAyY2Q3ZTg1OTliZjVkN2NiNTY3Nzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MWEwNWU0NWI3NjY0ZjBjOTI3MDJiZTUyNjA1MmMyNWUyZjhhMTVjIn0=','2020-03-26 23:57:14.366606');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-12 17:46:33
