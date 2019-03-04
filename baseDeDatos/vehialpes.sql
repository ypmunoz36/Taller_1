CREATE DATABASE  IF NOT EXISTS `vehialpes` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `vehialpes`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: vehialpes
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cargo` (
  `idcargo` int(11) NOT NULL AUTO_INCREMENT,
  `car_nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `car_fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idcargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ciudad` (
  `idciudad` int(11) NOT NULL AUTO_INCREMENT,
  `ciu_nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ciu_fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Bogotá','2019-02-22 22:06:39');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cliente` (
  `cli_identificacion` int(11) NOT NULL,
  `cli_nombres` varchar(145) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cli_apellidos` varchar(145) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cli_direccion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cli_ciudad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cli_telefono` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cli_celular` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cli_tipo` int(11) DEFAULT NULL COMMENT '1 cliente\n2 prospecto\n',
  `cli_fecha_nac` date DEFAULT NULL,
  `cli_correo` varchar(145) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cli_descripcion` varchar(145) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cli_fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cli_identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (102567990,'Jose Yovanni ','Ibanez','Carrera 7 b #9 04 sur','1','4758920','3057865283',0,'1992-01-12','jj@n.com','El cliente pregunta por un Auto 4 puertas ','2019-02-27 17:01:45'),(1024545516,'Yury Paola','MuÃ±oz Reina','Cra 11 n4 03','1','3784633','3128763526',0,'1993-10-27','ymunoz@gmail.com','Interezada en automovil convertible ac','2019-02-22 22:09:00');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concesionario`
--

DROP TABLE IF EXISTS `concesionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `concesionario` (
  `idconcesionario` int(11) NOT NULL AUTO_INCREMENT,
  `con_nombre` varchar(145) COLLATE utf8_spanish_ci DEFAULT NULL,
  `con_direccion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `con_telefono_fijo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `con_celular` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `con_id_ciudad` int(11) NOT NULL,
  `con_fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idconcesionario`),
  KEY `fk_concesionario_ciudad1_idx` (`con_id_ciudad`),
  CONSTRAINT `fk_concesionario_ciudad1` FOREIGN KEY (`con_id_ciudad`) REFERENCES `ciudad` (`idciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concesionario`
--

LOCK TABLES `concesionario` WRITE;
/*!40000 ALTER TABLE `concesionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `concesionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_garantia`
--

DROP TABLE IF EXISTS `detalle_garantia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `detalle_garantia` (
  `iddetalle_garantia` int(11) NOT NULL AUTO_INCREMENT,
  `det_idgarantia` int(11) NOT NULL,
  `repuesto_idrepuesto` int(11) NOT NULL,
  PRIMARY KEY (`iddetalle_garantia`),
  KEY `fk_detalle_garantia_garantia1_idx` (`det_idgarantia`),
  KEY `fk_detalle_garantia_repuesto1_idx` (`repuesto_idrepuesto`),
  CONSTRAINT `fk_detalle_garantia_garantia1` FOREIGN KEY (`det_idgarantia`) REFERENCES `garantia` (`idgarantia`),
  CONSTRAINT `fk_detalle_garantia_repuesto1` FOREIGN KEY (`repuesto_idrepuesto`) REFERENCES `repuesto` (`idrepuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_garantia`
--

LOCK TABLES `detalle_garantia` WRITE;
/*!40000 ALTER TABLE `detalle_garantia` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_garantia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garantia`
--

DROP TABLE IF EXISTS `garantia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `garantia` (
  `idgarantia` int(11) NOT NULL AUTO_INCREMENT,
  `gar_vehiculo_vin` varchar(17) COLLATE utf8_spanish_ci NOT NULL,
  `gar_cliente_cli_identificacion` int(11) NOT NULL,
  `gar_fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `gar_llamada_verificacion` int(11) DEFAULT NULL COMMENT '0. Mto realizado\n1. Mto no realizado',
  PRIMARY KEY (`idgarantia`),
  KEY `fk_garantia_vehiculo1_idx` (`gar_vehiculo_vin`),
  KEY `fk_garantia_cliente1_idx` (`gar_cliente_cli_identificacion`),
  CONSTRAINT `fk_garantia_cliente1` FOREIGN KEY (`gar_cliente_cli_identificacion`) REFERENCES `cliente` (`cli_identificacion`),
  CONSTRAINT `fk_garantia_vehiculo1` FOREIGN KEY (`gar_vehiculo_vin`) REFERENCES `vehiculo` (`vin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garantia`
--

LOCK TABLES `garantia` WRITE;
/*!40000 ALTER TABLE `garantia` DISABLE KEYS */;
/*!40000 ALTER TABLE `garantia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca_vehiculo`
--

DROP TABLE IF EXISTS `marca_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `marca_vehiculo` (
  `idmarcas_carro` int(11) NOT NULL AUTO_INCREMENT,
  `mar_nombre_marca` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `mar_fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idmarcas_carro`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca_vehiculo`
--

LOCK TABLES `marca_vehiculo` WRITE;
/*!40000 ALTER TABLE `marca_vehiculo` DISABLE KEYS */;
INSERT INTO `marca_vehiculo` VALUES (1,'x','2019-02-26 01:13:18');
/*!40000 ALTER TABLE `marca_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pqrs`
--

DROP TABLE IF EXISTS `pqrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pqrs` (
  `idpqrs` int(11) NOT NULL AUTO_INCREMENT,
  `pqr_tipo` int(11) DEFAULT NULL COMMENT '1. peticion\n2. queja\n3. reclamo\n4 . solicitud\n',
  `pqr_tipo_llamada` int(11) DEFAULT NULL COMMENT '1. seguimiento preventa\n2. pqrs\n3. seguimiento postventa\n',
  `pqr_descripcion` varchar(145) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pqr_fecha` date DEFAULT NULL,
  `pqr_hora` time DEFAULT NULL,
  `pqr_fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_idusuario` int(11) NOT NULL,
  `cliente_cli_identificacion` int(11) NOT NULL,
  PRIMARY KEY (`idpqrs`),
  KEY `fk_pqrs_usuario1_idx` (`usuario_idusuario`),
  KEY `fk_pqrs_cliente1_idx` (`cliente_cli_identificacion`),
  CONSTRAINT `fk_pqrs_cliente1` FOREIGN KEY (`cliente_cli_identificacion`) REFERENCES `cliente` (`cli_identificacion`),
  CONSTRAINT `fk_pqrs_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pqrs`
--

LOCK TABLES `pqrs` WRITE;
/*!40000 ALTER TABLE `pqrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pqrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repuesto`
--

DROP TABLE IF EXISTS `repuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `repuesto` (
  `idrepuesto` int(11) NOT NULL AUTO_INCREMENT,
  `rep_serial` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `rep_nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `rep_fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idrepuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repuesto`
--

LOCK TABLES `repuesto` WRITE;
/*!40000 ALTER TABLE `repuesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `repuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taller`
--

DROP TABLE IF EXISTS `taller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `taller` (
  `idtaller` int(11) NOT NULL AUTO_INCREMENT,
  `tal_nombre` varchar(145) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tal_id_concesionario` int(11) NOT NULL,
  `tal_fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idtaller`),
  KEY `fk_taller_concesionario1_idx` (`tal_id_concesionario`),
  CONSTRAINT `fk_taller_concesionario1` FOREIGN KEY (`tal_id_concesionario`) REFERENCES `concesionario` (`idconcesionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taller`
--

LOCK TABLES `taller` WRITE;
/*!40000 ALTER TABLE `taller` DISABLE KEYS */;
/*!40000 ALTER TABLE `taller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_combustible`
--

DROP TABLE IF EXISTS `tipo_combustible`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tipo_combustible` (
  `idtipo_combustible` int(11) NOT NULL AUTO_INCREMENT,
  `com_nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idtipo_combustible`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_combustible`
--

LOCK TABLES `tipo_combustible` WRITE;
/*!40000 ALTER TABLE `tipo_combustible` DISABLE KEYS */;
INSERT INTO `tipo_combustible` VALUES (1,'Gasolina'),(2,'Diesel'),(3,'Gas natural');
/*!40000 ALTER TABLE `tipo_combustible` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_vehiculo`
--

DROP TABLE IF EXISTS `tipo_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tipo_vehiculo` (
  `idtipo_automovil` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idtipo_automovil`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_vehiculo`
--

LOCK TABLES `tipo_vehiculo` WRITE;
/*!40000 ALTER TABLE `tipo_vehiculo` DISABLE KEYS */;
INSERT INTO `tipo_vehiculo` VALUES (1,'Automovil (4x2)','2019-02-25 22:07:01'),(2,'SUVs (4x4)','2019-02-25 22:07:01');
/*!40000 ALTER TABLE `tipo_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `usu_nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usu_apellido` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usu_nombre_usuario` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usu_contrasenia` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usu_estado` int(11) DEFAULT NULL,
  `usu_cargo_idcargo` int(11) NOT NULL,
  `usu_fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idusuario`),
  KEY `fk_usuario_cargo1_idx` (`usu_cargo_idcargo`),
  CONSTRAINT `fk_usuario_cargo1` FOREIGN KEY (`usu_cargo_idcargo`) REFERENCES `cargo` (`idcargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vehiculo` (
  `vin` varchar(17) COLLATE utf8_spanish_ci NOT NULL,
  `matricula` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `anio_fabricacion` int(11) DEFAULT NULL,
  `cilindraje` int(11) DEFAULT NULL,
  `id_tipo_combustible` int(11) DEFAULT NULL,
  `modelo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `color` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `numero_sillas` int(11) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_marca` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL COMMENT 'automóvil (4x2) y SUVs (4x4)',
  `pais_fabricacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `costo` int(11) DEFAULT NULL,
  `precio_venta` int(11) DEFAULT NULL,
  `nombre` varchar(145) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`vin`),
  KEY `fk_carro_marcas_carro_idx` (`id_marca`),
  KEY `fk_carro_tipo_automovil1_idx` (`id_tipo`),
  CONSTRAINT `fk_carro_marcas_carro` FOREIGN KEY (`id_marca`) REFERENCES `marca_vehiculo` (`idmarcas_carro`),
  CONSTRAINT `fk_carro_tipo_automovil1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_vehiculo` (`idtipo_automovil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES ('JMZMAP2668790809','EFQWE7687I',2011,4100,1,'CRUZE','NEGRO',2,'2019-02-26 01:13:23',1,1,'COLOMBIA',20000000,26000000,'Chevrolet Cruze '),('JMZMAP2668790810','EFQWE76871',2012,4100,1,'CRUZE','NEGRO',2,'2019-02-26 01:14:18',1,1,'COLOMBIA',20000000,26000000,'Chevrolet Cruze ');
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_cli_identificacion` int(11) NOT NULL,
  `vehiculo_idcarro` varchar(17) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ven_fecha` date DEFAULT NULL,
  `ven_precio` int(11) DEFAULT NULL,
  `usuario_asesor` varchar(145) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ven_fecha_registra` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idventa`),
  KEY `fk_venta_cliente1_idx` (`cliente_cli_identificacion`),
  CONSTRAINT `fk_venta_cliente1` FOREIGN KEY (`cliente_cli_identificacion`) REFERENCES `cliente` (`cli_identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,1024545516,'JMZMAP2668790810','2019-02-19',25000000,'Juan Perez','2019-02-27 16:59:16'),(2,102567990,'JMZMAP2668790809','2019-02-26',24000000,'Juan Perez','2019-02-27 17:03:41');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'vehialpes'
--

--
-- Dumping routines for database 'vehialpes'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-27 19:31:58
