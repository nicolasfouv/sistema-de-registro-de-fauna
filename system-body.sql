CREATE DATABASE  IF NOT EXISTS `srf` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `srf`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: srf
-- ------------------------------------------------------
-- Server version	9.5.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '1f3ce19b-f3da-11f0-8ce9-0250f71b524a:1-2158';

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('10b67c60-7c52-4f81-b75f-b7de44d2091a','e1d403024b0f6d53b33aad29a960d17d5ec6e9c65a28ac2f97d34bf60b59ed37','2026-02-10 15:57:54.097','20260209170928_role_and_group_separation',NULL,NULL,'2026-02-10 15:57:49.929',1),('135d6d07-8a9d-47e4-a78e-9e7f115957ab','e4156c3ce35c051698233f8cb9947ffd314564e6b2d92b6b30d6914d0c95896d','2026-02-10 15:57:49.846','20260202221002_undo_email_verified',NULL,NULL,'2026-02-10 15:57:48.807',1),('24360c53-5212-4de9-a27c-1bc385f6f179','a4f4c15ca74d926473c69706a973add35e2247aa2b05595d76f05587d538b137','2026-02-10 15:58:01.413','20260209181545_audit_log',NULL,NULL,'2026-02-10 15:57:58.214',1),('26fd93d5-9aad-400c-ac4a-2df1bb619a74','a97985d3f36dcb553fbc24ee78e051ebb7e7f129d92da5ce18e7ebae1cd4a4aa','2026-02-10 15:57:41.992','20260125123420_applicant',NULL,NULL,'2026-02-10 15:57:41.298',1),('31c7965b-fe4b-455c-8be6-4cbb7816a9a2','4cc88de0ab8e6c35b618511d2c603ec22a491bfc602b0ce1e94c6f3211472406','2026-02-10 15:57:45.110','20260129152057_category',NULL,NULL,'2026-02-10 15:57:42.063',1),('41363ef9-3388-4b7d-ae88-1a93d44e2e97','d96c39bb99e06675d2bffcc02c4f7be89b5f7119e6238ad952ec98e0330e94b9','2026-02-10 15:57:47.305','20260129154850_icons_and_picturies',NULL,NULL,'2026-02-10 15:57:45.221',1),('4479be5d-7faa-4a2f-99b4-12464c7a5e93','70c64f40248cfcca0c92a2a6dcbc9de8018b2fa2e27ac4467fcbca4bb65181b0','2026-02-10 15:57:37.963','20260122192613_role_user_link',NULL,NULL,'2026-02-10 15:57:36.622',1),('55cd2e13-a05a-4891-b3f2-1e063f859b83','8531ca082498f0f6a23f5af74af1a02615b175cc58251444c01920e6ed527438','2026-02-10 15:57:41.223','20260124165641_roleless',NULL,NULL,'2026-02-10 15:57:38.046',1),('613cfd8d-426a-4f2c-8346-ec01ea52eb13','766a5ea179bb15c6413fbeeaf5f6e390795ce4018aee49067c88e614dcb06d65','2026-02-10 18:01:43.471','20260210180142_datetime_to_applicants',NULL,NULL,'2026-02-10 18:01:42.821',1),('6bccc282-f383-475b-b3a9-d200effa1b11','73570be22366e92c5a03f2acb669f9b6b0379b228bd6933f55450adbad64e82d','2026-02-10 15:57:36.552','20260122180055_auth_system',NULL,NULL,'2026-02-10 15:57:27.950',1),('7c952663-7e7b-4a59-9d9d-a2122522db61','56d4d9cd5fb56f914d0101e89f6865e2d92977525650daa1a16785af14bc8a2a','2026-02-10 15:58:24.688','20260210155650_change_changelog_id_to_int',NULL,NULL,'2026-02-10 15:58:23.496',1),('84f64939-1083-4288-9c04-b70fcd51eb7d','f67465f79aa3f6aeaba95eed000baddb71dcd01f850d232c892d5b3f241817a4','2026-02-10 15:58:23.397','20260209235446_form_name_non_unique',NULL,NULL,'2026-02-10 15:58:23.010',1),('999cb079-5496-413a-b731-e83cd870fc5b','8a2df992e8a2762c76ecf500832f3d4876f4e4a9c7e5b47d3bbc75aa98bc2b22','2026-02-10 15:57:57.517','20260209171141_fix_mapping_names',NULL,NULL,'2026-02-10 15:57:54.181',1),('bb649624-4d3f-4cdf-98c1-1436bd36ee96','4270cdd1111649dbd739cac783b677a6e36eceedfefb4acdc7f6e240f5a9c861','2026-02-10 15:58:22.938','20260209223115_audit_log_v2',NULL,NULL,'2026-02-10 15:58:17.129',1),('c54a5270-130c-4646-877b-86326aa62d2e','844e0e9b2d3a8ab95b612cc7e7fddf8a3026a7a49b51d375fc7b1adeb44f68f5','2026-02-10 18:06:31.076','20260210180630_map_to_date',NULL,NULL,'2026-02-10 18:06:30.723',1),('d34ef417-1354-42ec-93d4-b5ed11e1fd5c','ede21ebf5ad6de9a86b4965a630fa46d6e358c308b0201ffaf3c78b39174e61a','2026-02-10 15:58:17.062','20260209195031_sub_category',NULL,NULL,'2026-02-10 15:58:01.472',1),('d661b356-2c2e-487c-a40c-6539ca01b5d1','d962626550d9bbb9238ad3219b486771ca2e8a3caa60cc7abf3c0d87c5c10d72','2026-02-10 15:57:58.121','20260209174255_new_acess_level',NULL,NULL,'2026-02-10 15:57:57.686',1),('f8a35632-0c60-4ac1-b11f-4144bf2b1d12','6eb2e0604ad4883e5da68dae7411fe707f38223534e0d15b58483fd1a7cffbdc','2026-02-10 15:57:48.729','20260202205149_email_verified',NULL,NULL,'2026-02-10 15:57:47.389',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog`
--

DROP TABLE IF EXISTS `auditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditlog` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `acao` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_usuario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_formulario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auditlog_id_usuario_fkey` (`id_usuario`),
  KEY `auditlog_id_formulario_fkey` (`id_formulario`),
  CONSTRAINT `auditlog_id_formulario_fkey` FOREIGN KEY (`id_formulario`) REFERENCES `formulario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `auditlog_id_usuario_fkey` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog`
--

LOCK TABLES `auditlog` WRITE;
/*!40000 ALTER TABLE `auditlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autorizacao_grupo`
--

DROP TABLE IF EXISTS `autorizacao_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autorizacao_grupo` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nivel_acesso` enum('read','edit','edit_unrestricted') COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_formulario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_grupo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `autorizacao_grupo_id_grupo_fkey` (`id_grupo`),
  KEY `autorizacao_grupo_id_formulario_fkey` (`id_formulario`),
  CONSTRAINT `autorizacao_grupo_id_formulario_fkey` FOREIGN KEY (`id_formulario`) REFERENCES `formulario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `autorizacao_grupo_id_grupo_fkey` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorizacao_grupo`
--

LOCK TABLES `autorizacao_grupo` WRITE;
/*!40000 ALTER TABLE `autorizacao_grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `autorizacao_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autorizacao_usuario`
--

DROP TABLE IF EXISTS `autorizacao_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autorizacao_usuario` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nivel_acesso` enum('read','edit','edit_unrestricted') COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_formulario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_usuario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `autorizacao_usuario_id_usuario_fkey` (`id_usuario`),
  KEY `autorizacao_usuario_id_formulario_fkey` (`id_formulario`),
  CONSTRAINT `autorizacao_usuario_id_formulario_fkey` FOREIGN KEY (`id_formulario`) REFERENCES `formulario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `autorizacao_usuario_id_usuario_fkey` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorizacao_usuario`
--

LOCK TABLES `autorizacao_usuario` WRITE;
/*!40000 ALTER TABLE `autorizacao_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `autorizacao_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icone_categoria` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categoria_nome_key` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES ('1','Animais Vivos','https://www.svgrepo.com/show/295893/pet-house-kennel.svg'),('2','Animais Mortos','https://www.svgrepo.com/show/493629/warning-triangle.svg'),('3','Cadastros Básicos','https://www.svgrepo.com/show/145158/form.svg');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changelog`
--

DROP TABLE IF EXISTS `changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changelog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_auditlog` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tabela` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_registro` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_acao` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dados_antigos` json DEFAULT NULL,
  `dados_novos` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `changelog_id_auditlog_fkey` (`id_auditlog`),
  CONSTRAINT `changelog_id_auditlog_fkey` FOREIGN KEY (`id_auditlog`) REFERENCES `auditlog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changelog`
--

LOCK TABLES `changelog` WRITE;
/*!40000 ALTER TABLE `changelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `changelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formulario`
--

DROP TABLE IF EXISTS `formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formulario` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_sub_categoria` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `formulario_id_sub_categoria_fkey` (`id_sub_categoria`),
  CONSTRAINT `formulario_id_sub_categoria_fkey` FOREIGN KEY (`id_sub_categoria`) REFERENCES `sub_categoria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formulario`
--

LOCK TABLES `formulario` WRITE;
/*!40000 ALTER TABLE `formulario` DISABLE KEYS */;
/*!40000 ALTER TABLE `formulario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcao`
--

DROP TABLE IF EXISTS `funcao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcao` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcao`
--

LOCK TABLES `funcao` WRITE;
/*!40000 ALTER TABLE `funcao` DISABLE KEYS */;
INSERT INTO `funcao` VALUES ('0','owner'),('1','admin'),('2','common');
/*!40000 ALTER TABLE `funcao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grupo_nome_key` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitante`
--

DROP TABLE IF EXISTS `solicitante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitante` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mensagem` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `solicitante_email_key` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitante`
--

LOCK TABLES `solicitante` WRITE;
/*!40000 ALTER TABLE `solicitante` DISABLE KEYS */;
INSERT INTO `solicitante` VALUES ('5f496ccc-31a3-43f1-8491-9d9b39abeb18','Solicitante Example 2','sol2@example.com','123123','Lorem ipsum dolor sit amet consectetur adipisicing elit.','2026-02-10 15:06:30.784'),('63ffee38-2b35-4d3b-b9e8-824686246811','Solicitante Example 1','sol1@example.com','123123',NULL,'2026-02-10 15:10:12.784');
/*!40000 ALTER TABLE `solicitante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categoria`
--

DROP TABLE IF EXISTS `sub_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categoria` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_categoria` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub_categoria_nome_key` (`nome`),
  KEY `sub_categoria_id_categoria_fkey` (`id_categoria`),
  CONSTRAINT `sub_categoria_id_categoria_fkey` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categoria`
--

LOCK TABLES `sub_categoria` WRITE;
/*!40000 ALTER TABLE `sub_categoria` DISABLE KEYS */;
INSERT INTO `sub_categoria` VALUES ('1','Animais','1'),('2','Entrevistas','1'),('3','Rastreio de GPS','1'),('4','Veterinário','1'),('5','Exames e Análises','1'),('6','Animais Atropelados','2'),('7','Necrópsias','2'),('8','Resultados e Análises','2'),('9','Geral','3');
/*!40000 ALTER TABLE `sub_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_funcao` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2',
  `userPic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_email_key` (`email`),
  KEY `usuario_id_funcao_fkey` (`id_funcao`),
  CONSTRAINT `usuario_id_funcao_fkey` FOREIGN KEY (`id_funcao`) REFERENCES `funcao` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('84ca85ea-1347-4b64-9525-b59a12aaee56','Admin Example','admin@example.com','$2b$10$w1bn/sJozXeoX5JBOhc70ucRTk.Qb.6HTcw0ppTONOWqBRBHDG9sW','1',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-10 16:14:31
