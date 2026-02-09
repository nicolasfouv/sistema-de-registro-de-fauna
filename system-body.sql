CREATE DATABASE  IF NOT EXISTS `srf` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
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

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '1f3ce19b-f3da-11f0-8ce9-0250f71b524a:1-1207';

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
INSERT INTO `_prisma_migrations` VALUES ('1f1741b5-1f3a-470c-aebb-7ec9ce2f9d5b','ede21ebf5ad6de9a86b4965a630fa46d6e358c308b0201ffaf3c78b39174e61a','2026-02-09 19:50:46.646','20260209195031_sub_category',NULL,NULL,'2026-02-09 19:50:32.038',1),('29512ed6-e142-45d5-b780-728ad50a0d52','a4f4c15ca74d926473c69706a973add35e2247aa2b05595d76f05587d538b137','2026-02-09 18:15:48.485','20260209181545_audit_log',NULL,NULL,'2026-02-09 18:15:45.711',1),('3acd47e7-2d6b-4895-ad22-6b084a1e1013','6eb2e0604ad4883e5da68dae7411fe707f38223534e0d15b58483fd1a7cffbdc','2026-02-02 20:51:49.695','20260202205149_email_verified',NULL,NULL,'2026-02-02 20:51:49.183',1),('66d0ed44-82bc-450d-b61c-7e14469b4bdf','73570be22366e92c5a03f2acb669f9b6b0379b228bd6933f55450adbad64e82d','2026-01-22 18:01:01.384','20260122180055_auth_system',NULL,NULL,'2026-01-22 18:00:55.891',1),('6e45c15f-9370-4b30-96ad-a3a8e61e8337','4cc88de0ab8e6c35b618511d2c603ec22a491bfc602b0ce1e94c6f3211472406','2026-01-29 15:21:00.344','20260129152057_category',NULL,NULL,'2026-01-29 15:20:57.458',1),('9476e11c-d222-4abb-ac01-b1856a46930a','70c64f40248cfcca0c92a2a6dcbc9de8018b2fa2e27ac4467fcbca4bb65181b0','2026-01-22 19:26:15.223','20260122192613_role_user_link',NULL,NULL,'2026-01-22 19:26:13.819',1),('98d8a64a-c9bc-497a-b3de-cedb1611e4d9','e4156c3ce35c051698233f8cb9947ffd314564e6b2d92b6b30d6914d0c95896d','2026-02-02 22:10:03.231','20260202221002_undo_email_verified',NULL,NULL,'2026-02-02 22:10:02.677',1),('a3330be1-5885-42ff-b6f2-15c7d6d664ab','a97985d3f36dcb553fbc24ee78e051ebb7e7f129d92da5ce18e7ebae1cd4a4aa','2026-01-25 12:34:21.062','20260125123420_applicant',NULL,NULL,'2026-01-25 12:34:20.305',1),('c0957f06-aba4-43b8-b9e3-793665462696','d96c39bb99e06675d2bffcc02c4f7be89b5f7119e6238ad952ec98e0330e94b9','2026-01-29 15:48:51.459','20260129154850_icons_and_picturies',NULL,NULL,'2026-01-29 15:48:50.185',1),('cd10f2f6-df21-48ea-9af1-3ceac5898215','8531ca082498f0f6a23f5af74af1a02615b175cc58251444c01920e6ed527438','2026-01-24 16:56:43.920','20260124165641_roleless',NULL,NULL,'2026-01-24 16:56:41.510',1),('dec2c263-8958-4e28-8574-771eaed3cd00','8a2df992e8a2762c76ecf500832f3d4876f4e4a9c7e5b47d3bbc75aa98bc2b22','2026-02-09 17:11:45.417','20260209171141_fix_mapping_names',NULL,NULL,'2026-02-09 17:11:41.611',1),('f0feccb7-761d-4a97-aa78-d5bcc30d3e4f','d962626550d9bbb9238ad3219b486771ca2e8a3caa60cc7abf3c0d87c5c10d72','2026-02-09 17:42:55.634','20260209174255_new_acess_level',NULL,NULL,'2026-02-09 17:42:55.354',1),('fe3b1e06-04c6-4b17-a5e1-198ec4680570','e1d403024b0f6d53b33aad29a960d17d5ec6e9c65a28ac2f97d34bf60b59ed37','2026-02-09 17:09:31.334','20260209170928_role_and_group_separation',NULL,NULL,'2026-02-09 17:09:28.372',1);
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
  `formId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_usuario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auditLog_formId_fkey` (`formId`),
  CONSTRAINT `auditLog_formId_fkey` FOREIGN KEY (`formId`) REFERENCES `formulario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
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
  UNIQUE KEY `formulario_nome_key` (`nome`),
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
INSERT INTO `grupo` VALUES ('1','Entrevistador'),('3','Legista'),('6','Pesquisador de Ectoparasitos'),('4','Pesquisador de Fezes'),('7','Pesquisador de Helmintos'),('5','Pesquisador Sorologico'),('2','Veterinario');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `solicitante_email_key` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitante`
--

LOCK TABLES `solicitante` WRITE;
/*!40000 ALTER TABLE `solicitante` DISABLE KEYS */;
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
INSERT INTO `usuario` VALUES ('93454386-2550-48fb-ad00-d7b608972f24','Admin Exemple','admin@exemple.com','$2b$10$NGVRI5l6ue3zT566woN1D.SZ4wy5OmCLln/rZuuCgBW.dhWHl96B6','0',NULL),('b24b1b15-4fe4-42a1-a2d8-2723bafe910c','Teste Teste','teste@gmail.com','$2b$10$ZpOQeZckkbL4ihAbOm1WbORqQDYLCCbqesrugeYH/8okTwqH88ccG','2',NULL),('d2d7f6d3-34c0-4feb-8125-332da18949d1','Nicolas Ouverney Fagundes','nicolas@gmail.com','$2b$10$DWwwM5ZoYFh8YrrJ.bFZIu7ZieES/u6q8f1S9hWG8wKdt4k5ApWn6','0','https://i.pinimg.com/736x/0c/bf/89/0cbf89438d9280747d31cc71e2b7f7c8.jpg'),('e292d23c-f395-400b-a63e-f7ae29ec7f73','Roleless Exemple','roleless@exemple.com','$2b$10$1b1kh2.XqmVtSux9m1pdfulV6qBykkt/xIvfy0VA1xzaYggJuJaue','2',NULL);
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

-- Dump completed on 2026-02-09 17:17:02
