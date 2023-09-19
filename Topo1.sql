-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: TopoBd
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
  `IdAdmin` int(30) unsigned NOT NULL AUTO_INCREMENT,
  `NomAdmin` varchar(30) DEFAULT NULL,
  `ApeAdmin` varchar(30) DEFAULT NULL,
  `Telefono` int(30) DEFAULT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdAdmin`)
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
  `IdCargo` int(30) unsigned NOT NULL AUTO_INCREMENT,
  `NomCargo` varchar(30) DEFAULT NULL,
  `IdEmpleado` int(30) unsigned DEFAULT NULL,
  PRIMARY KEY (`IdCargo`),
  KEY `IdEmpleado` (`IdEmpleado`),
  CONSTRAINT `cargo_ibfk_1` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleados` (`IdEmpleado`)
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
  `IdCertificados` int(30) unsigned NOT NULL AUTO_INCREMENT,
  `IdEmpleado` int(30) unsigned DEFAULT NULL,
  `IdRecHum` int(30) unsigned DEFAULT NULL,
  `NumCertificado` int(30) DEFAULT NULL,
  PRIMARY KEY (`IdCertificados`),
  KEY `IdEmpleado` (`IdEmpleado`),
  KEY `IdRecHum` (`IdRecHum`),
  CONSTRAINT `certificados_ibfk_1` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleados` (`IdEmpleado`),
  CONSTRAINT `certificados_ibfk_2` FOREIGN KEY (`IdRecHum`) REFERENCES `gerenterechum` (`IdRecHum`)
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
-- Table structure for table `ciuedad`
--

DROP TABLE IF EXISTS `ciuedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciuedad` (
  `IdCiudad` int(30) unsigned NOT NULL AUTO_INCREMENT,
  `NomCiudad` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdCiudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciuedad`
--

LOCK TABLES `ciuedad` WRITE;
/*!40000 ALTER TABLE `ciuedad` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciuedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `IdCliente` int(30) unsigned NOT NULL AUTO_INCREMENT,
  `NomCliente` varchar(30) DEFAULT NULL,
  `ApeCliente` varchar(30) DEFAULT NULL,
  `Telefono` int(30) DEFAULT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdCliente`)
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
  `IdContratoEmp` int(30) unsigned NOT NULL AUTO_INCREMENT,
  `IdEmpleado` int(30) unsigned DEFAULT NULL,
  `IdAdmin` int(30) unsigned DEFAULT NULL,
  `IdRecHum` int(30) unsigned DEFAULT NULL,
  `TipoContrato` varchar(30) DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `Salario` int(30) DEFAULT NULL,
  `Banco` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdContratoEmp`),
  KEY `IdRecHum` (`IdRecHum`),
  KEY `IdEmpleado` (`IdEmpleado`),
  KEY `IdAdmin` (`IdAdmin`),
  CONSTRAINT `contratoemp_ibfk_1` FOREIGN KEY (`IdRecHum`) REFERENCES `gerenterechum` (`IdRecHum`),
  CONSTRAINT `contratoemp_ibfk_2` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleados` (`IdEmpleado`),
  CONSTRAINT `contratoemp_ibfk_3` FOREIGN KEY (`IdAdmin`) REFERENCES `administrador` (`IdAdmin`)
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
-- Table structure for table `contratoproyect`
--

DROP TABLE IF EXISTS `contratoproyect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratoproyect` (
  `IdContratoProyect` int(30) unsigned NOT NULL AUTO_INCREMENT,
  `IdEmpleado` int(30) unsigned DEFAULT NULL,
  `IdAdmin` int(30) unsigned DEFAULT NULL,
  `IdCliente` int(30) unsigned DEFAULT NULL,
  `FechaInicioCont` date DEFAULT NULL,
  `FechaFinCont` date DEFAULT NULL,
  `ValorProyecto` int(30) DEFAULT NULL,
  `Clausula` varchar(50) DEFAULT NULL,
  `IdRecHum` int(30) unsigned DEFAULT NULL,
  `IdCiudad` int(30) unsigned DEFAULT NULL,
  PRIMARY KEY (`IdContratoProyect`),
  KEY `IdEmpleado` (`IdEmpleado`),
  KEY `IdAdmin` (`IdAdmin`),
  KEY `IdCliente` (`IdCliente`),
  KEY `IdRecHum` (`IdRecHum`),
  KEY `IdCiudad` (`IdCiudad`),
  CONSTRAINT `contratoproyect_ibfk_1` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleados` (`IdEmpleado`),
  CONSTRAINT `contratoproyect_ibfk_2` FOREIGN KEY (`IdAdmin`) REFERENCES `administrador` (`IdAdmin`),
  CONSTRAINT `contratoproyect_ibfk_3` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`),
  CONSTRAINT `contratoproyect_ibfk_4` FOREIGN KEY (`IdRecHum`) REFERENCES `gerenterechum` (`IdRecHum`),
  CONSTRAINT `contratoproyect_ibfk_5` FOREIGN KEY (`IdCiudad`) REFERENCES `ciuedad` (`IdCiudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratoproyect`
--

LOCK TABLES `contratoproyect` WRITE;
/*!40000 ALTER TABLE `contratoproyect` DISABLE KEYS */;
/*!40000 ALTER TABLE `contratoproyect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `IdEmpleado` int(30) unsigned NOT NULL AUTO_INCREMENT,
  `NomEmpleado` varchar(30) DEFAULT NULL,
  `ApeEmpleado` varchar(30) DEFAULT NULL,
  `Edad` int(30) DEFAULT NULL,
  `Telefono` int(30) DEFAULT NULL,
  `IdEps` int(30) DEFAULT NULL,
  `IdCiudad` int(30) DEFAULT NULL,
  `IdCargo` int(30) DEFAULT NULL,
  `IdPermisos` int(30) DEFAULT NULL,
  `IdIncapacidades` int(30) DEFAULT NULL,
  `IdCertificados` int(30) DEFAULT NULL,
  PRIMARY KEY (`IdEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eps`
--

DROP TABLE IF EXISTS `eps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eps` (
  `IdEps` int(30) unsigned NOT NULL AUTO_INCREMENT,
  `IdEmpleado` int(30) unsigned DEFAULT NULL,
  `IdRecHum` int(30) DEFAULT NULL,
  PRIMARY KEY (`IdEps`),
  KEY `IdEmpleado` (`IdEmpleado`),
  CONSTRAINT `eps_ibfk_1` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleados` (`IdEmpleado`)
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
-- Table structure for table `gerenterechum`
--

DROP TABLE IF EXISTS `gerenterechum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gerenterechum` (
  `IdRecHum` int(30) unsigned NOT NULL AUTO_INCREMENT,
  `NomGerenteRecHum` varchar(30) DEFAULT NULL,
  `ApeGerenteRecHum` varchar(30) DEFAULT NULL,
  `Telefono` int(30) DEFAULT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdRecHum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gerenterechum`
--

LOCK TABLES `gerenterechum` WRITE;
/*!40000 ALTER TABLE `gerenterechum` DISABLE KEYS */;
/*!40000 ALTER TABLE `gerenterechum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incapacidades`
--

DROP TABLE IF EXISTS `incapacidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incapacidades` (
  `IdIncapacidad` int(30) unsigned NOT NULL AUTO_INCREMENT,
  `IdEmpleado` int(30) unsigned DEFAULT NULL,
  `IdRecHum` int(30) unsigned DEFAULT NULL,
  `FechaIncapacidad` date DEFAULT NULL,
  `NumIncapacidades` int(30) DEFAULT NULL,
  PRIMARY KEY (`IdIncapacidad`),
  KEY `IdRecHum` (`IdRecHum`),
  KEY `IdEmpleado` (`IdEmpleado`),
  CONSTRAINT `incapacidades_ibfk_1` FOREIGN KEY (`IdRecHum`) REFERENCES `gerenterechum` (`IdRecHum`),
  CONSTRAINT `incapacidades_ibfk_2` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleados` (`IdEmpleado`)
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
  `IdPermisos` int(30) unsigned NOT NULL AUTO_INCREMENT,
  `IdEmpleado` int(30) unsigned DEFAULT NULL,
  `IdRecHum` int(30) unsigned DEFAULT NULL,
  `NumPermiso` int(30) DEFAULT NULL,
  `DuracionPermiso` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdPermisos`),
  KEY `IdEmpleado` (`IdEmpleado`),
  KEY `IdRecHum` (`IdRecHum`),
  CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleados` (`IdEmpleado`),
  CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`IdRecHum`) REFERENCES `gerenterechum` (`IdRecHum`)
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
  `IdTipoProyecto` int(30) unsigned NOT NULL AUTO_INCREMENT,
  `IdContratoProyect` int(30) unsigned DEFAULT NULL,
  `NomProyecto` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdTipoProyecto`),
  KEY `IdContratoProyect` (`IdContratoProyect`),
  CONSTRAINT `tipoproyecto_ibfk_1` FOREIGN KEY (`IdContratoProyect`) REFERENCES `contratoproyect` (`IdContratoProyect`)
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
  `IdUsuarios` int(30) unsigned NOT NULL AUTO_INCREMENT,
  `IdEmpleado` int(30) unsigned DEFAULT NULL,
  `IdCliente` int(30) unsigned DEFAULT NULL,
  `IdAdmin` int(30) unsigned DEFAULT NULL,
  `IdRecHum` int(30) unsigned DEFAULT NULL,
  PRIMARY KEY (`IdUsuarios`),
  KEY `IdRecHum` (`IdRecHum`),
  KEY `IdAdmin` (`IdAdmin`),
  KEY `IdCliente` (`IdCliente`),
  KEY `IdEmpleado` (`IdEmpleado`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`IdRecHum`) REFERENCES `gerenterechum` (`IdRecHum`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`IdAdmin`) REFERENCES `administrador` (`IdAdmin`),
  CONSTRAINT `usuarios_ibfk_3` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`),
  CONSTRAINT `usuarios_ibfk_4` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleados` (`IdEmpleado`)
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

-- Dump completed on 2023-09-11 21:35:40
