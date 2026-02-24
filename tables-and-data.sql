CREATE DATABASE  IF NOT EXISTS `srf` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `srf`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: srf
-- ------------------------------------------------------
-- Server version	9.6.0

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
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('10b67c60-7c52-4f81-b75f-b7de44d2091a','e1d403024b0f6d53b33aad29a960d17d5ec6e9c65a28ac2f97d34bf60b59ed37','2026-02-10 15:57:54.097','20260209170928_role_and_group_separation',NULL,NULL,'2026-02-10 15:57:50',1),('135d6d07-8a9d-47e4-a78e-9e7f115957ab','e4156c3ce35c051698233f8cb9947ffd314564e6b2d92b6b30d6914d0c95896d','2026-02-10 15:57:49.846','20260202221002_undo_email_verified',NULL,NULL,'2026-02-10 15:57:49',1),('24360c53-5212-4de9-a27c-1bc385f6f179','a4f4c15ca74d926473c69706a973add35e2247aa2b05595d76f05587d538b137','2026-02-10 15:58:01.413','20260209181545_audit_log',NULL,NULL,'2026-02-10 15:57:58',1),('26fd93d5-9aad-400c-ac4a-2df1bb619a74','a97985d3f36dcb553fbc24ee78e051ebb7e7f129d92da5ce18e7ebae1cd4a4aa','2026-02-10 15:57:41.992','20260125123420_applicant',NULL,NULL,'2026-02-10 15:57:41',1),('31c7965b-fe4b-455c-8be6-4cbb7816a9a2','4cc88de0ab8e6c35b618511d2c603ec22a491bfc602b0ce1e94c6f3211472406','2026-02-10 15:57:45.110','20260129152057_category',NULL,NULL,'2026-02-10 15:57:42',1),('41363ef9-3388-4b7d-ae88-1a93d44e2e97','d96c39bb99e06675d2bffcc02c4f7be89b5f7119e6238ad952ec98e0330e94b9','2026-02-10 15:57:47.305','20260129154850_icons_and_picturies',NULL,NULL,'2026-02-10 15:57:45',1),('4479be5d-7faa-4a2f-99b4-12464c7a5e93','70c64f40248cfcca0c92a2a6dcbc9de8018b2fa2e27ac4467fcbca4bb65181b0','2026-02-10 15:57:37.963','20260122192613_role_user_link',NULL,NULL,'2026-02-10 15:57:37',1),('55cd2e13-a05a-4891-b3f2-1e063f859b83','8531ca082498f0f6a23f5af74af1a02615b175cc58251444c01920e6ed527438','2026-02-10 15:57:41.223','20260124165641_roleless',NULL,NULL,'2026-02-10 15:57:38',1),('613cfd8d-426a-4f2c-8346-ec01ea52eb13','766a5ea179bb15c6413fbeeaf5f6e390795ce4018aee49067c88e614dcb06d65','2026-02-10 18:01:43.471','20260210180142_datetime_to_applicants',NULL,NULL,'2026-02-10 18:01:43',1),('6bccc282-f383-475b-b3a9-d200effa1b11','73570be22366e92c5a03f2acb669f9b6b0379b228bd6933f55450adbad64e82d','2026-02-10 15:57:36.552','20260122180055_auth_system',NULL,NULL,'2026-02-10 15:57:28',1),('7c952663-7e7b-4a59-9d9d-a2122522db61','56d4d9cd5fb56f914d0101e89f6865e2d92977525650daa1a16785af14bc8a2a','2026-02-10 15:58:24.688','20260210155650_change_changelog_id_to_int',NULL,NULL,'2026-02-10 15:58:23',1),('84f64939-1083-4288-9c04-b70fcd51eb7d','f67465f79aa3f6aeaba95eed000baddb71dcd01f850d232c892d5b3f241817a4','2026-02-10 15:58:23.397','20260209235446_form_name_non_unique',NULL,NULL,'2026-02-10 15:58:23',1),('999cb079-5496-413a-b731-e83cd870fc5b','8a2df992e8a2762c76ecf500832f3d4876f4e4a9c7e5b47d3bbc75aa98bc2b22','2026-02-10 15:57:57.517','20260209171141_fix_mapping_names',NULL,NULL,'2026-02-10 15:57:54',1),('9dc3364d-437b-4da6-96f4-9617de9a0a7c','019cfb9a99874aebaa07dbc13fdf255dab839b03c906761ee3d5c3a473387746','2026-02-19 12:08:30.905','20260219120828_optional_access_level',NULL,NULL,'2026-02-19 12:08:28',1),('bb649624-4d3f-4cdf-98c1-1436bd36ee96','4270cdd1111649dbd739cac783b677a6e36eceedfefb4acdc7f6e240f5a9c861','2026-02-10 15:58:22.938','20260209223115_audit_log_v2',NULL,NULL,'2026-02-10 15:58:17',1),('c54a5270-130c-4646-877b-86326aa62d2e','844e0e9b2d3a8ab95b612cc7e7fddf8a3026a7a49b51d375fc7b1adeb44f68f5','2026-02-10 18:06:31.076','20260210180630_map_to_date',NULL,NULL,'2026-02-10 18:06:31',1),('d34ef417-1354-42ec-93d4-b5ed11e1fd5c','ede21ebf5ad6de9a86b4965a630fa46d6e358c308b0201ffaf3c78b39174e61a','2026-02-10 15:58:17.062','20260209195031_sub_category',NULL,NULL,'2026-02-10 15:58:01',1),('d661b356-2c2e-487c-a40c-6539ca01b5d1','d962626550d9bbb9238ad3219b486771ca2e8a3caa60cc7abf3c0d87c5c10d72','2026-02-10 15:57:58.121','20260209174255_new_acess_level',NULL,NULL,'2026-02-10 15:57:58',1),('ef220185-2cf3-4a74-91bc-3463d78d74df','43ee9d97b0890a6b193a59dea1bf8fa6af76205d8f4486f8bbdf475503f84267',NULL,'20260219121501_access_level_names','A migration failed to apply. New migrations cannot be applied before the error is recovered from. Read more about how to resolve migration issues in a production database: https://pris.ly/d/migrate-resolve\n\nMigration name: 20260219121501_access_level_names\n\nDatabase error code: 1265\n\nDatabase error:\nData truncated for column \'nivel_acesso\' at row 1\n\nPlease check the query number 1 from the migration file.\n\n   0: sql_schema_connector::apply_migration::apply_script\n           with migration_name=\"20260219121501_access_level_names\"\n             at schema-engine\\connectors\\sql-schema-connector\\src\\apply_migration.rs:113\n   1: schema_commands::commands::apply_migrations::Applying migration\n           with migration_name=\"20260219121501_access_level_names\"\n             at schema-engine\\commands\\src\\commands\\apply_migrations.rs:95\n   2: schema_core::state::ApplyMigrations\n             at schema-engine\\core\\src\\state.rs:246',NULL,'2026-02-19 12:15:02',0),('f8a35632-0c60-4ac1-b11f-4144bf2b1d12','6eb2e0604ad4883e5da68dae7411fe707f38223534e0d15b58483fd1a7cffbdc','2026-02-10 15:57:48.729','20260202205149_email_verified',NULL,NULL,'2026-02-10 15:57:47',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog`
--

DROP TABLE IF EXISTS `auditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditlog` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `acao` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_usuario` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_formulario` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_nivel_acesso` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_formulario` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_grupo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `autorizacao_grupo_id_formulario_fkey` (`id_formulario`),
  KEY `autorizacao_grupo_id_grupo_fkey` (`id_grupo`),
  KEY `autorizacao_grupo_id_nivel_acesso_fkey` (`id_nivel_acesso`),
  CONSTRAINT `autorizacao_grupo_id_formulario_fkey` FOREIGN KEY (`id_formulario`) REFERENCES `formulario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `autorizacao_grupo_id_grupo_fkey` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `autorizacao_grupo_id_nivel_acesso_fkey` FOREIGN KEY (`id_nivel_acesso`) REFERENCES `enum_nivel_acesso` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorizacao_grupo`
--

LOCK TABLES `autorizacao_grupo` WRITE;
/*!40000 ALTER TABLE `autorizacao_grupo` DISABLE KEYS */;
INSERT INTO `autorizacao_grupo` VALUES ('001','read','analiseectoparasitos-am','entr'),('002','read','analiseectoparasitos-av','entr'),('003','read','analisefezes','entr'),('004','read','analisehelmintos','entr'),('005','read','analisemolecular','entr'),('006','read','analiseovocistos','entr'),('007','read','animal-am','entr'),('008','edit','animal-av','entr'),('009','edit','entrevista','entr'),('010','edit','especiesanimaisvivosmortos','entr'),('011','read','necropsia','entr'),('012','edit','rastreiogps','entr'),('013','read','resultadoexame-am','entr'),('014','read','resultadoexame-av','entr'),('015','read','resultadosorologico','entr'),('016','edit','tutor','entr'),('017','read','vacina','entr'),('018','read','visitaveterinaria','entr'),('101','read','analiseectoparasitos-am','leg'),('102','read','analiseectoparasitos-av','leg'),('103','read','analisefezes','leg'),('104','edit','analisehelmintos','leg'),('105','read','analisemolecular','leg'),('106','read','analiseovocistos','leg'),('107','edit','animal-am','leg'),('108','read','animal-av','leg'),('109','read','entrevista','leg'),('110','edit','especiesanimaisvivosmortos','leg'),('111','edit','necropsia','leg'),('112','read','rastreiogps','leg'),('113','read','resultadoexame-am','leg'),('114','read','resultadoexame-av','leg'),('115','read','resultadosorologico','leg'),('116','read','tutor','leg'),('117','read','vacina','leg'),('118','read','visitaveterinaria','leg'),('201','edit','analiseectoparasitos-am','pesqecto'),('202','edit','analiseectoparasitos-av','pesqecto'),('203','read','analisefezes','pesqecto'),('204','read','analisehelmintos','pesqecto'),('205','read','analisemolecular','pesqecto'),('206','read','analiseovocistos','pesqecto'),('207','read','animal-am','pesqecto'),('208','read','animal-av','pesqecto'),('209','read','entrevista','pesqecto'),('210','read','especiesanimaisvivosmortos','pesqecto'),('211','read','necropsia','pesqecto'),('212','read','rastreiogps','pesqecto'),('213','read','resultadoexame-am','pesqecto'),('214','read','resultadoexame-av','pesqecto'),('215','read','resultadosorologico','pesqecto'),('216','read','tutor','pesqecto'),('217','read','vacina','pesqecto'),('218','read','visitaveterinaria','pesqecto'),('301','read','analiseectoparasitos-am','pesqfez'),('302','read','analiseectoparasitos-av','pesqfez'),('303','edit','analisefezes','pesqfez'),('304','read','analisehelmintos','pesqfez'),('305','edit','analisemolecular','pesqfez'),('306','edit','analiseovocistos','pesqfez'),('307','read','animal-am','pesqfez'),('308','read','animal-av','pesqfez'),('309','read','entrevista','pesqfez'),('310','read','especiesanimaisvivosmortos','pesqfez'),('311','read','necropsia','pesqfez'),('312','read','rastreiogps','pesqfez'),('313','read','resultadoexame-am','pesqfez'),('314','read','resultadoexame-av','pesqfez'),('315','read','resultadosorologico','pesqfez'),('316','read','tutor','pesqfez'),('317','read','vacina','pesqfez'),('318','read','visitaveterinaria','pesqfez'),('401','read','analiseectoparasitos-am','pesqhelm'),('402','read','analiseectoparasitos-av','pesqhelm'),('403','edit','analisefezes','pesqhelm'),('404','edit','analisehelmintos','pesqhelm'),('405','read','analisemolecular','pesqhelm'),('406','edit','analiseovocistos','pesqhelm'),('407','read','animal-am','pesqhelm'),('408','read','animal-av','pesqhelm'),('409','read','entrevista','pesqhelm'),('410','read','especiesanimaisvivosmortos','pesqhelm'),('411','read','necropsia','pesqhelm'),('412','read','rastreiogps','pesqhelm'),('413','read','resultadoexame-am','pesqhelm'),('414','read','resultadoexame-av','pesqhelm'),('415','read','resultadosorologico','pesqhelm'),('416','read','tutor','pesqhelm'),('417','read','vacina','pesqhelm'),('418','read','visitaveterinaria','pesqhelm'),('501','read','analiseectoparasitos-am','pesqsor'),('502','read','analiseectoparasitos-av','pesqsor'),('503','read','analisefezes','pesqsor'),('504','read','analisehelmintos','pesqsor'),('505','read','analisemolecular','pesqsor'),('506','read','analiseovocistos','pesqsor'),('507','read','animal-am','pesqsor'),('508','read','animal-av','pesqsor'),('509','read','entrevista','pesqsor'),('510','read','especiesanimaisvivosmortos','pesqsor'),('511','read','necropsia','pesqsor'),('512','read','rastreiogps','pesqsor'),('513','edit','resultadoexame-am','pesqsor'),('514','edit','resultadoexame-av','pesqsor'),('515','edit','resultadosorologico','pesqsor'),('516','read','tutor','pesqsor'),('517','read','vacina','pesqsor'),('518','read','visitaveterinaria','pesqsor'),('601','read','analiseectoparasitos-am','vet'),('602','read','analiseectoparasitos-av','vet'),('603','edit','analisefezes','vet'),('604','read','analisehelmintos','vet'),('605','edit','analisemolecular','vet'),('606','edit','analiseovocistos','vet'),('607','read','animal-am','vet'),('608','edit','animal-av','vet'),('609','read','entrevista','vet'),('610','edit','especiesanimaisvivosmortos','vet'),('611','read','necropsia','vet'),('612','read','rastreiogps','vet'),('613','read','resultadoexame-am','vet'),('614','read','resultadoexame-av','vet'),('615','read','resultadosorologico','vet'),('616','edit','tutor','vet'),('617','read','vacina','vet'),('618','read','visitaveterinaria','vet');
/*!40000 ALTER TABLE `autorizacao_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autorizacao_usuario`
--

DROP TABLE IF EXISTS `autorizacao_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autorizacao_usuario` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_nivel_acesso` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_formulario` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_usuario` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `autorizacao_usuario_id_usuario_fkey` (`id_usuario`),
  KEY `autorizacao_usuario_id_formulario_fkey` (`id_formulario`),
  KEY `autorizacao_usuario_id_nivel_acesso_fkey` (`id_nivel_acesso`),
  CONSTRAINT `autorizacao_usuario_id_formulario_fkey` FOREIGN KEY (`id_formulario`) REFERENCES `formulario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `autorizacao_usuario_id_nivel_acesso_fkey` FOREIGN KEY (`id_nivel_acesso`) REFERENCES `enum_nivel_acesso` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `autorizacao_usuario_id_usuario_fkey` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorizacao_usuario`
--

LOCK TABLES `autorizacao_usuario` WRITE;
/*!40000 ALTER TABLE `autorizacao_usuario` DISABLE KEYS */;
INSERT INTO `autorizacao_usuario` VALUES ('1b9ef3a6-97c1-4013-a521-ee37cbda5662','edit','animal-av','b5b7be60-4ded-4937-bad8-af5dbb611bdb'),('31c6c105-f12c-41a2-8f3a-5ed2827f4033','read','animal-am','b5b7be60-4ded-4937-bad8-af5dbb611bdb'),('4cf0232f-dbf8-4176-aad2-f7e8d64443d2','edit_unrestricted','tutor','b5b7be60-4ded-4937-bad8-af5dbb611bdb'),('aa58d1a4-488e-4fa8-a86c-16f08e0a0358','edit_unrestricted','analisehelmintos','b5b7be60-4ded-4937-bad8-af5dbb611bdb'),('c0a357e7-2acd-475b-8ce8-be8671869ad6','read','analisefezes','b5b7be60-4ded-4937-bad8-af5dbb611bdb'),('f9b999d7-867b-4be1-a279-a530a3db49b2','edit_unrestricted','resultadoexame-am','b5b7be60-4ded-4937-bad8-af5dbb611bdb'),('ff70f339-e0bd-4f29-aac4-5bf3147496c4','read','necropsia','b5b7be60-4ded-4937-bad8-af5dbb611bdb'),('ff9be46e-e2ed-4c9b-98b1-06af1fa8fe6d','edit_unrestricted','analisemolecular','b5b7be60-4ded-4937-bad8-af5dbb611bdb');
/*!40000 ALTER TABLE `autorizacao_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icone_categoria` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categoria_nome_key` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES ('0_animaisvivos','Animais Vivos','https://www.svgrepo.com/show/295893/pet-house-kennel.svg'),('1_animaismortos','Animais Mortos','https://www.svgrepo.com/show/493629/warning-triangle.svg'),('2_cadastrosbasicos','Cadastros Básicos','https://www.svgrepo.com/show/145158/form.svg');
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
  `id_auditlog` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tabela` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_registro` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_acao` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `enum_nivel_acesso`
--

DROP TABLE IF EXISTS `enum_nivel_acesso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_nivel_acesso` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` int NOT NULL,
  `nome` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_nivel_acesso`
--

LOCK TABLES `enum_nivel_acesso` WRITE;
/*!40000 ALTER TABLE `enum_nivel_acesso` DISABLE KEYS */;
INSERT INTO `enum_nivel_acesso` VALUES ('edit',2,'Editar'),('edit_unrestricted',3,'Editar sem restrições'),('read',1,'Ler');
/*!40000 ALTER TABLE `enum_nivel_acesso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formulario`
--

DROP TABLE IF EXISTS `formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formulario` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_sub_categoria` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `formulario` VALUES ('analiseectoparasitos-am','Análise de Ectoparasitos','resultadoseanalises'),('analiseectoparasitos-av','Análise de Ectoparasitos','exameseanalises'),('analisefezes','Análise de Fezes','exameseanalises'),('analisehelmintos','Análise de Helmintos','resultadoseanalises'),('analisemolecular','Análise Molecular','exameseanalises'),('analiseovocistos','Análise de Ovos/Cistos','exameseanalises'),('animal-am','Animal','animaisatropelados'),('animal-av','Animal','animais'),('entrevista','Entrevista','entrevistas'),('especiesanimaisvivosmortos','Espécies de Animais Vivos/Mortos','geral'),('necropsia','Necropsia','necropsias'),('rastreiogps','Rastreio de GPS','rastreiodegps'),('resultadoexame-am','Resultado de Exames','resultadoseanalises'),('resultadoexame-av','Resultado de Exames','exameseanalises'),('resultadosorologico','Resultado Sorológico','exameseanalises'),('tutor','Tutor','animais'),('vacina','Vacina','veterinario'),('visitaveterinaria','Visita Veterinária','veterinario');
/*!40000 ALTER TABLE `formulario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcao`
--

DROP TABLE IF EXISTS `funcao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcao` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grupo_nome_key` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES ('entr','Entrevistador'),('leg','Legista'),('pesqecto','Pesquisador de Ectoparasitos'),('pesqfez','Pesquisador de Fezes'),('pesqhelm','Pesquisador de Helmintos'),('pesqsor','Pesquisador de Sorológico'),('vet','Veterinário');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitante`
--

DROP TABLE IF EXISTS `solicitante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitante` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mensagem` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_categoria` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `sub_categoria` VALUES ('animais','Animais','0_animaisvivos'),('animaisatropelados','Animais Atropelados','1_animaismortos'),('entrevistas','Entrevistas','0_animaisvivos'),('exameseanalises','Exames e Análises','0_animaisvivos'),('geral','Geral','2_cadastrosbasicos'),('necropsias','Necrópsias','1_animaismortos'),('rastreiodegps','Rastreio de GPS','0_animaisvivos'),('resultadoseanalises','Resultados e Análises','1_animaismortos'),('veterinario','Veterinário','0_animaisvivos');
/*!40000 ALTER TABLE `sub_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_funcao` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2',
  `userPic` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `usuario` VALUES ('09af1365-644c-4dd7-8a4b-f00b57024c95','Usuário Dono Exemplo','dono@exemplo.com','$2b$10$.OBvQt/OnVzFkMrrZ37/BeCrIiqsn93Ww04pxiwZKfCVyE4dHI/o2','0',NULL),('84ca85ea-1347-4b64-9525-b59a12aaee56','Usuário Admin Exemplo','admin@exemplo.com','$2b$10$ejUBCtU3ZKXHC0ODvfqrpuR01ThBe5BASvxQGintbqNSyE/.iXnvm','1',NULL),('b5b7be60-4ded-4937-bad8-af5dbb611bdb','Usuário Comum Exemplo','comum@exemplo.com','$2b$10$0IO/gwsOSMDlafhTmPE6SuT7.HiAhbrwD96edrh2SPFyfVgv1Ydu2','2',NULL);
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

-- Dump completed on 2026-02-23 21:52:59
