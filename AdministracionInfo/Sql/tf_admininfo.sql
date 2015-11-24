CREATE DATABASE  IF NOT EXISTS `tf_admininfo` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tf_admininfo`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: tf_admininfo
-- ------------------------------------------------------
-- Server version	5.6.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `barra_principal`
--

DROP TABLE IF EXISTS `barra_principal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barra_principal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `codigo` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barra_principal`
--

LOCK TABLES `barra_principal` WRITE;
/*!40000 ALTER TABLE `barra_principal` DISABLE KEYS */;
INSERT INTO `barra_principal` VALUES (1,'Barra Euclid 6,3KV','T1'),(2,'Barra Siemens 6.3 KV','T2'),(3,'Barra Siemens 6.3 KV','T3');
/*!40000 ALTER TABLE `barra_principal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barra_secundaria`
--

DROP TABLE IF EXISTS `barra_secundaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barra_secundaria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `id_barra_principal` int(11) NOT NULL,
  `codigo` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `barra_principal_idx` (`id_barra_principal`),
  CONSTRAINT `barra_principal_secundaria` FOREIGN KEY (`id_barra_principal`) REFERENCES `barra_principal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barra_secundaria`
--

LOCK TABLES `barra_secundaria` WRITE;
/*!40000 ALTER TABLE `barra_secundaria` DISABLE KEYS */;
INSERT INTO `barra_secundaria` VALUES (1,'Barra sulzer 6,3 KV',1,'b1'),(2,'Barra turbina 1-2.3 KV',1,'b2'),(3,'Barra turbina 2 2.3 KV',1,'b3'),(4,'Barra planta cemento 6,7KV',2,'b4'),(5,'Barra Molino de Cemento',3,'b5');
/*!40000 ALTER TABLE `barra_secundaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centro_costo`
--

DROP TABLE IF EXISTS `centro_costo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centro_costo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_costo`
--

LOCK TABLES `centro_costo` WRITE;
/*!40000 ALTER TABLE `centro_costo` DISABLE KEYS */;
INSERT INTO `centro_costo` VALUES (1,'Consumo propio'),(2,'Auxiliares'),(3,'Molinos y trituradores'),(4,'Talleres'),(5,'Hornos y calderos'),(6,'Embolsadoras');
/*!40000 ALTER TABLE `centro_costo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `circuito`
--

DROP TABLE IF EXISTS `circuito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `circuito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `id_barra_principal` int(11) NOT NULL,
  `id_barra_secundaria` int(11) NOT NULL,
  `nivel` int(11) NOT NULL,
  `id_centro_costo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `barra_principal_idx` (`id_barra_principal`),
  KEY `barra_secundaria_idx` (`id_barra_secundaria`),
  CONSTRAINT `barra_principal` FOREIGN KEY (`id_barra_principal`) REFERENCES `barra_principal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `barra_secundaria` FOREIGN KEY (`id_barra_secundaria`) REFERENCES `barra_secundaria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circuito`
--

LOCK TABLES `circuito` WRITE;
/*!40000 ALTER TABLE `circuito` DISABLE KEYS */;
INSERT INTO `circuito` VALUES (1,1,'Salida - Servicio Auxiliares de Planta 440V (trafo Consumo Propio)','ME64.13',1,1,1,2),(2,2,'Servicio Auxiliares Planta 440V (lado baja de trafo)','ME67.01',1,1,2,2),(3,3,'Servicio Auxiliares Planta','ME67.03',1,1,2,2),(4,4,'Compresoras Ingersoll Rand','ME67.06',1,1,2,4),(5,5,'Salida - Motor Chancadora Molino Crudo 2.','MV64.03',1,1,1,3),(6,6,'Salida - Motor Molino Crudo 2.','ME64.14',1,1,1,3),(7,7,'Salida - Auxiliares Molino Crudo 2.(Trafo 1.6 MVA)','ME64.16',1,1,1,3),(8,8,'Salida - Silo de Homogenización 2 ( Trafo 1.6 MVA )','ME64.18',1,1,1,2),(9,9,'Taller de Transportes','ME64.19',1,1,2,4),(10,10,'Laboratorio QCX','ME67.16',1,1,2,4),(11,11,'Auxiliares Homogenización No.2','ME67.13',1,1,2,2),(12,12,'Salida - Motor Molino de Crudo  5 ( Ex Cemento 5 ).','ME67.14',1,1,1,3),(13,13,'CELDA HORNOS VERTICALES 5 Y 6 (TRAFO 2.5 MVA)','ME67.12',1,1,1,5),(14,14,'Hornos Verticales Clinker 5 Y 6 (Lado baja del trafo  440 V)','ME64.20',1,1,2,5),(15,15,'Horno Vertical No.5','ME62.07',1,1,2,5),(16,16,'Horno Vertical No.6','ME62.03',1,1,2,5),(17,17,'Compresoras','ME62.04',1,1,2,4),(18,18,'Salida - Motor ID FAN Horno 3.','ME62.05',1,1,1,5),(19,19,'Salida - Servicio Auxiliares de Planta 440V (trafo Consumo Propio)','ME64.13',1,1,1,5),(20,20,'Motor DC Principal Horno 3 ( SIMOREG)','ME67.01',1,1,2,5),(21,21,'Laboratorio Físico y Químico','ME67.03',1,1,2,4),(22,22,'Carbón Fino','ME67.06',1,1,2,2),(23,23,'Auxiliares S.E. Horno 3','MV64.03',1,1,2,2),(24,24,'Salida - Auxiliares Enfriador Horno 3 (Trafo 1.25 MVA)','ME64.14',1,1,1,5),(25,25,'Salida- Auxiliares Molino Cemento 4 (Trafo 1 MVA)','ME64.16',1,1,1,5),(26,26,'Salida- Motor Separador Molino Crudo 2.','ME64.18',1,1,1,3),(27,27,'CELDA SE MOLINO DE CARBÓN MIAG 1 Y 2. (TRAFO 1.6 MVA)','ME64.19',1,1,1,3),(28,28,'Medicion General Lado baja del Trafo 440 v','ME67.16',1,1,2,2),(29,29,'MCC1 - Miag 2  (carbón grueso)','ME67.13',1,1,2,3),(30,30,'MCC2 - Miag 2 (carbón grueso)','ME67.14',1,1,2,3),(31,31,'Auxiliares Miag 1 (carbón grueso)','ME67.12',1,1,2,2),(32,32,'CELDA SE HORNOS VERTICALES CLINKER 1,2,3,4 (TRAFO 2.5 MVA)	','ME64.20',1,1,1,5),(33,33,'MCC2 Transporte de Crudo Silo Homogenización No.3','ME62.07',1,1,2,5),(34,34,'MCC3 Horno Vertical No.1','ME62.03',1,1,2,5),(35,35,'MCC3 Horno Vertical No.2','ME62.04',1,1,2,5),(36,36,'MCC3 Horno Vertical No.3','ME62.05',1,1,2,5),(37,37,'MCC3 Horno Vertical No.4','ME62.06',1,1,2,5),(38,38,'CELDA SE MOLINO 3','ME66.13',1,2,1,3),(39,39,'Recepción y Almacenamiento de Crudo Negro','ME69.05',1,2,1,2),(40,40,'Auxiliares del Molino de Crudo No.3','MV66.01',1,2,1,2),(41,41,'Salida - Motor O-SEPA Molino de Cemento 4.','ME65.01',1,2,1,3),(42,42,'Salida - Motor Molino de Carbón MIAG 1.','ME65.03',1,2,1,3),(43,43,'Salida  - Motor Molino de Carbón MIAG 2.','ME65.02',1,2,1,3),(44,44,'Salida- Compresoras de aire (Trafo 1.25 MVA)','ME65.06',1,2,1,2),(45,45,'Barra 440V  - Servicios Auxiliares (Trafo I de 1000 KVA)','ME65.05',1,2,1,2),(46,46,'Barra 440V  - Servicios Auxiliares (Trafo II de 1000 KVA)','ME65.04',1,2,1,2),(47,47,'Transformador Alumbrado Planta Antigua','ME65.15',1,2,1,1),(48,48,'Pozos de Agua 5,6,8','ME65.13',1,2,2,2),(49,49,'S.E. Horno 1','ME 65.07',1,2,2,5),(50,50,'Dptos. Eléctrico y Electrónico','ME65.18',1,2,2,1),(51,51,'Planta Cal Virgen','ME65.19',1,2,2,1),(52,52,'Grua Puente y Chancadora de Yeso','ME65.12',1,2,2,2),(53,53,'Embolsadura 3 y 6 ( Medicion General)','ME65.08',1,2,2,6),(54,54,'Chancadora de Arcilla-Hierro y Pigmentos','ME65.09',1,2,2,2),(55,55,'Auxiliares Filtro Horno 1','ME65.20',1,2,2,5),(56,56,'Planta de Ablandamiento','ME65.14',1,2,2,2),(57,57,'Residencia','ME65.11',1,2,2,1),(58,58,'Dpto. Mecánico','ME65.17',1,2,2,1),(59,59,'Torre de Enfriamiento ( Marley - Sicrea )','ME 65.16',1,2,2,2),(60,60,'Transformadores Edificios Administrativos','ME66.09',1,2,2,2),(61,61,'Salida  - Cargas PLANTA BLOQUES - DINO (Trafo 800 KVA)','ME66.03',1,2,1,1),(62,62,'DINO 220V','ME70.06',1,2,2,1),(63,63,'Prímetro Alumbrado 220v','ME70.07',1,2,2,1),(64,64,'Planta Bloques','ME70.03',1,2,2,1),(65,65,'Dino Comercial','ME70.05',1,2,2,1),(66,66,'Molino de Cal Vertical ','ME70.02',1,2,2,1),(67,67,'Planta Piloto Bongara','ME70.04',1,2,2,1),(68,68,'Salida - Homogenización 1 (Trafo 1000 KVA)','ME66.06',1,2,1,5),(69,69,'S.E. Cancha de Materiales','ME67.04',1,2,2,NULL),(70,70,'Auxiliares S.E. Homogenización No.1','MV66.07',1,2,2,5),(71,71,'Salida  - Auxiliares Horno 2 - ID-FAN (Trafo 2 MVA)','ME66.04',1,2,1,5),(72,72,'Salida - Auxiliares Crudo No.5','ME66.02',1,3,1,5),(73,73,'Salida - Embolsadura No.4 y 5','ME66.01',1,3,1,5),(74,74,'Embolsadura No.4 y 5 (después del Transformador)','ME62.10',1,3,2,5),(75,75,'Silo Cemento No.6 y 7','ME62.11',1,3,2,5),(76,76,'Embolsadura No.4','ME62.08',1,3,2,5),(77,77,'Embolsadura No.5','ME62.09',1,3,2,5),(78,78,'Nuevo Acceso','ME 62.12',1,3,2,5),(79,79,'Salida - Molino de Crudo No.1','ME 66.07',1,3,1,5),(80,80,'Salida - Auxiliares Molino Crudo No.1','ME 66.05',1,3,1,5),(81,81,'Salida - Motor Molino de Cemento No.6','ME62.13',2,4,1,5),(82,82,'Salida - ID-FAN Molino Cemento No.6','ME62.14',2,4,1,5),(83,83,'Salida - Auxiliares Molino Cemento No.6','ME62.16',2,4,1,5),(84,84,'S.E. Tanques de Petróleo','ME62.15',2,4,2,5),(85,85,'Bombas de Petróleo','MV62.01',2,4,2,5),(86,86,'Pozo Agua No.9','ME62.22',2,4,2,5),(87,87,'Salida - Planta de Cal ex Bongara','ME63.04',2,4,1,5),(88,88,'Nueva Planta de Chancado','ME70.01',2,4,2,5),(89,89,'Planta de Cal  (Horno Waelz)','MV63.01',2,4,2,5),(90,90,'Salida - Circuito 39 Motor Molino Cemento No.4','ME63.05',2,4,1,5),(91,91,' Salida - Motor Molino de Cemento No.7','ME69.01',3,5,1,5),(92,92,'Salida - ID-FAN Molino Cemento No.7','ME69.02',3,5,1,5),(93,93,'Salida - Auxiliares Molino Cemento No.7','ME69.03',3,5,1,5);
/*!40000 ALTER TABLE `circuito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `circuito_por_minuto`
--

DROP TABLE IF EXISTS `circuito_por_minuto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `circuito_por_minuto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nro_circuito` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `codigo_medidor` varchar(15) NOT NULL,
  `consumo_kwh` int(11) NOT NULL,
  `porcentaje_perdida_consumo` decimal(12,2) NOT NULL,
  `id_barra_principal` int(11) NOT NULL,
  `id_barra_secundaria` int(11) NOT NULL,
  `id_centro_costo` int(11) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circuito_por_minuto`
--

LOCK TABLES `circuito_por_minuto` WRITE;
/*!40000 ALTER TABLE `circuito_por_minuto` DISABLE KEYS */;
INSERT INTO `circuito_por_minuto` VALUES (1,1,'demo','aa',45,0.06,1,1,1,'2015-11-22 20:18:30'),(2,2,'demo 2','aaa ',40,0.45,1,1,1,'2015-11-22 21:27:49'),(3,3,'demo 5','bbb',80,0.67,2,2,2,'2015-11-22 21:27:49'),(4,4,'hola','jkkjhhj',120,0.89,2,2,2,'2015-11-22 21:27:49'),(5,5,'ccc','ssd',25,0.45,2,2,2,'2015-11-22 21:27:49');
/*!40000 ALTER TABLE `circuito_por_minuto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-23 23:35:52
