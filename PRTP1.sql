-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: topografiabd
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `idAdmin` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NomAdmin` varchar(25) DEFAULT NULL,
  `ApeAdmin` varchar(25) DEFAULT NULL,
  `Telefono` double DEFAULT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `idCargo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpleado` int(10) unsigned DEFAULT NULL,
  `NomCargo` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idCargo`),
  KEY `idEmpleado` (`idEmpleado`),
  CONSTRAINT `cargo_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificados`
--

DROP TABLE IF EXISTS `certificados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificados` (
  `idCertificado` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpleado` int(10) unsigned DEFAULT NULL,
  `NumCertificado` int(10) DEFAULT NULL,
  PRIMARY KEY (`idCertificado`),
  KEY `idEmpleado` (`idEmpleado`),
  CONSTRAINT `certificados_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificados`
--

LOCK TABLES `certificados` WRITE;
/*!40000 ALTER TABLE `certificados` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `idCiudad` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NomCiudad` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idCiudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NomCliente` varchar(25) DEFAULT NULL,
  `ApeCliente` varchar(25) DEFAULT NULL,
  `Telefono` double DEFAULT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratoemp`
--

DROP TABLE IF EXISTS `contratoemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratoemp` (
  `idContratoEmp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpleado` int(10) unsigned DEFAULT NULL,
  `idAdmin` int(10) unsigned DEFAULT NULL,
  `idRecHum` int(10) unsigned DEFAULT NULL,
  `TipoContrato` varchar(15) DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `Salario` double DEFAULT NULL,
  `Banco` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idContratoEmp`),
  KEY `idEmpleado` (`idEmpleado`),
  KEY `idAdmin` (`idAdmin`),
  KEY `idRecHum` (`idRecHum`),
  CONSTRAINT `contratoemp_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  CONSTRAINT `contratoemp_ibfk_2` FOREIGN KEY (`idAdmin`) REFERENCES `administrador` (`idAdmin`),
  CONSTRAINT `contratoemp_ibfk_3` FOREIGN KEY (`idRecHum`) REFERENCES `gerenterh` (`idRecHum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratoemp`
--

LOCK TABLES `contratoemp` WRITE;
/*!40000 ALTER TABLE `contratoemp` DISABLE KEYS */;
/*!40000 ALTER TABLE `contratoemp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratoproyecto`
--

DROP TABLE IF EXISTS `contratoproyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratoproyecto` (
  `idContratoProyecto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idAdmin` int(10) unsigned DEFAULT NULL,
  `idRecHum` int(10) unsigned DEFAULT NULL,
  `idEmpleado` int(10) unsigned DEFAULT NULL,
  `idCiudad` int(10) unsigned DEFAULT NULL,
  `idTipoProyecto` int(10) unsigned DEFAULT NULL,
  `idCliente` int(10) unsigned DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `Valor` double DEFAULT NULL,
  `Clausula` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`idContratoProyecto`),
  KEY `idEmpleado` (`idEmpleado`),
  KEY `idRecHum` (`idRecHum`),
  KEY `idAdmin` (`idAdmin`),
  KEY `idCiudad` (`idCiudad`),
  KEY `idTipoProyecto` (`idTipoProyecto`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `contratoproyecto_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  CONSTRAINT `contratoproyecto_ibfk_2` FOREIGN KEY (`idRecHum`) REFERENCES `gerenterh` (`idRecHum`),
  CONSTRAINT `contratoproyecto_ibfk_3` FOREIGN KEY (`idAdmin`) REFERENCES `administrador` (`idAdmin`),
  CONSTRAINT `contratoproyecto_ibfk_4` FOREIGN KEY (`idCiudad`) REFERENCES `ciudad` (`idCiudad`),
  CONSTRAINT `contratoproyecto_ibfk_5` FOREIGN KEY (`idTipoProyecto`) REFERENCES `tipoproyecto` (`idTipoProyecto`),
  CONSTRAINT `contratoproyecto_ibfk_6` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratoproyecto`
--

LOCK TABLES `contratoproyecto` WRITE;
/*!40000 ALTER TABLE `contratoproyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `contratoproyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `idEmpleado` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NomEmpleado` varchar(25) DEFAULT NULL,
  `ApeEmpleado` varchar(25) DEFAULT NULL,
  `Telefono` double DEFAULT NULL,
  `Edad` int(5) DEFAULT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eps`
--

DROP TABLE IF EXISTS `eps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eps` (
  `idEps` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpleado` int(10) unsigned DEFAULT NULL,
  `TipoEps` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idEps`),
  KEY `idEmpleado` (`idEmpleado`),
  CONSTRAINT `eps_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eps`
--

LOCK TABLES `eps` WRITE;
/*!40000 ALTER TABLE `eps` DISABLE KEYS */;
/*!40000 ALTER TABLE `eps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gerenterh`
--

DROP TABLE IF EXISTS `gerenterh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gerenterh` (
  `idRecHum` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NomGerente` varchar(25) DEFAULT NULL,
  `ApeGerente` varchar(25) DEFAULT NULL,
  `Telefono` double DEFAULT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idRecHum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gerenterh`
--

LOCK TABLES `gerenterh` WRITE;
/*!40000 ALTER TABLE `gerenterh` DISABLE KEYS */;
/*!40000 ALTER TABLE `gerenterh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incapacidades`
--

DROP TABLE IF EXISTS `incapacidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incapacidades` (
  `idIncapacidades` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpleado` int(10) unsigned DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `NumIncapacidades` int(10) DEFAULT NULL,
  `Duracion` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idIncapacidades`),
  KEY `idEmpleado` (`idEmpleado`),
  CONSTRAINT `incapacidades_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incapacidades`
--

LOCK TABLES `incapacidades` WRITE;
/*!40000 ALTER TABLE `incapacidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `incapacidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisos` (
  `idPermisos` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpleado` int(10) unsigned DEFAULT NULL,
  `NumPermiso` int(10) DEFAULT NULL,
  `Duracion` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idPermisos`),
  KEY `idEmpleado` (`idEmpleado`),
  CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoproyecto`
--

DROP TABLE IF EXISTS `tipoproyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoproyecto` (
  `idTipoProyecto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NomProyecto` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idTipoProyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoproyecto`
--

LOCK TABLES `tipoproyecto` WRITE;
/*!40000 ALTER TABLE `tipoproyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoproyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuarios` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idEmpleado` int(10) unsigned DEFAULT NULL,
  `idAdmin` int(10) unsigned DEFAULT NULL,
  `idCliente` int(10) unsigned DEFAULT NULL,
  `idRecHum` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idUsuarios`),
  KEY `idEmpleado` (`idEmpleado`),
  KEY `idAdmin` (`idAdmin`),
  KEY `idCliente` (`idCliente`),
  KEY `idRecHum` (`idRecHum`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`idAdmin`) REFERENCES `administrador` (`idAdmin`),
  CONSTRAINT `usuarios_ibfk_3` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `usuarios_ibfk_4` FOREIGN KEY (`idRecHum`) REFERENCES `gerenterh` (`idRecHum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-20 11:45:38
