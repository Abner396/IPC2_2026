-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: Tech_Suply
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

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
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(125) NOT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `tipoCliente` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (1,'Pedro Perez','15-25 Zona 7','Individual'),(2,'Lucia Juarez','25-98 zona 5','Indidual'),(3,'Stark industires','nueva york','Corporatico');
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleados`
--

DROP TABLE IF EXISTS `Empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleados` (
  `idEmpleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `idSucursal` int DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `idSucursal` (`idSucursal`),
  CONSTRAINT `Empleados_ibfk_1` FOREIGN KEY (`idSucursal`) REFERENCES `Sucursales` (`idSucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleados`
--

LOCK TABLES `Empleados` WRITE;
/*!40000 ALTER TABLE `Empleados` DISABLE KEYS */;
INSERT INTO `Empleados` VALUES (1,'Stefany Garcia','Gerente Regional',1),(2,'Astrid Merida','Supervisora',1),(3,'David Santos','Cajero',2),(4,'Abigail Perez','Atencion al cliente',2),(5,'Elias Lopez','Tecnico',3),(6,'Cesar Ochoa','Conserje',4),(7,'Jimena Gonzales','Cajera',4);
/*!40000 ALTER TABLE `Empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facturas`
--

DROP TABLE IF EXISTS `Facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Facturas` (
  `NoFactura` int NOT NULL,
  `fechaFactura` date NOT NULL,
  `monto` double NOT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `NoPedido` int DEFAULT NULL,
  `idCliente` int DEFAULT NULL,
  PRIMARY KEY (`NoFactura`),
  KEY `NoPedido` (`NoPedido`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `Facturas_ibfk_1` FOREIGN KEY (`NoPedido`) REFERENCES `Pedidos` (`NoPedido`),
  CONSTRAINT `Facturas_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `Clientes` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facturas`
--

LOCK TABLES `Facturas` WRITE;
/*!40000 ALTER TABLE `Facturas` DISABLE KEYS */;
INSERT INTO `Facturas` VALUES (120,'2026-02-02',450.5,'pagado',260,1),(121,'2026-03-03',120,'pendiente',150,2);
/*!40000 ALTER TABLE `Facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ListaProductos`
--

DROP TABLE IF EXISTS `ListaProductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ListaProductos` (
  `NoPedido` int NOT NULL,
  `codigoProducto` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`NoPedido`,`codigoProducto`),
  KEY `codigoProducto` (`codigoProducto`),
  CONSTRAINT `ListaProductos_ibfk_1` FOREIGN KEY (`NoPedido`) REFERENCES `Pedidos` (`NoPedido`),
  CONSTRAINT `ListaProductos_ibfk_2` FOREIGN KEY (`codigoProducto`) REFERENCES `Productos` (`codigoProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ListaProductos`
--

LOCK TABLES `ListaProductos` WRITE;
/*!40000 ALTER TABLE `ListaProductos` DISABLE KEYS */;
INSERT INTO `ListaProductos` VALUES (150,201,2);
/*!40000 ALTER TABLE `ListaProductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pedidos`
--

DROP TABLE IF EXISTS `Pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pedidos` (
  `NoPedido` int NOT NULL,
  `idCliente` int DEFAULT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`NoPedido`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `Pedidos_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `Clientes` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedidos`
--

LOCK TABLES `Pedidos` WRITE;
/*!40000 ALTER TABLE `Pedidos` DISABLE KEYS */;
INSERT INTO `Pedidos` VALUES (150,1,'2026-02-10'),(201,2,'2026-05-06'),(260,3,'2026-03-04');
/*!40000 ALTER TABLE `Pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PrductosComprados`
--

DROP TABLE IF EXISTS `PrductosComprados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PrductosComprados` (
  `idProveedor` int NOT NULL,
  `codigoProducto` int NOT NULL,
  PRIMARY KEY (`idProveedor`,`codigoProducto`),
  KEY `codigoProducto` (`codigoProducto`),
  CONSTRAINT `PrductosComprados_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `Proveedores` (`idProveedor`),
  CONSTRAINT `PrductosComprados_ibfk_2` FOREIGN KEY (`codigoProducto`) REFERENCES `Productos` (`codigoProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PrductosComprados`
--

LOCK TABLES `PrductosComprados` WRITE;
/*!40000 ALTER TABLE `PrductosComprados` DISABLE KEYS */;
INSERT INTO `PrductosComprados` VALUES (1,201);
/*!40000 ALTER TABLE `PrductosComprados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Productos`
--

DROP TABLE IF EXISTS `Productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Productos` (
  `codigoProducto` int NOT NULL,
  `nombreProducto` varchar(100) NOT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `precio` double(5,2) NOT NULL,
  `stock` int DEFAULT NULL,
  PRIMARY KEY (`codigoProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productos`
--

LOCK TABLES `Productos` WRITE;
/*!40000 ALTER TABLE `Productos` DISABLE KEYS */;
INSERT INTO `Productos` VALUES (201,'Laptop Zbook','procesador i7 32 ram 1tera',150.00,25);
/*!40000 ALTER TABLE `Productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proveedores`
--

DROP TABLE IF EXISTS `Proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proveedores` (
  `idProveedor` int NOT NULL AUTO_INCREMENT,
  `nombreProveedor` varchar(125) NOT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `contacto` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveedores`
--

LOCK TABLES `Proveedores` WRITE;
/*!40000 ALTER TABLE `Proveedores` DISABLE KEYS */;
INSERT INTO `Proveedores` VALUES (1,'Intelaf','12 avenida','Jose'),(2,'Global Tech','6ta calle','Daniela'),(3,'TEMU','china','Gabriel');
/*!40000 ALTER TABLE `Proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sucursales`
--

DROP TABLE IF EXISTS `Sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sucursales` (
  `idSucursal` int NOT NULL AUTO_INCREMENT,
  `ubicacion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idSucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sucursales`
--

LOCK TABLES `Sucursales` WRITE;
/*!40000 ALTER TABLE `Sucursales` DISABLE KEYS */;
INSERT INTO `Sucursales` VALUES (1,'Quetzaltenango Zona 7'),(2,'Guatemala Zona 2'),(3,'San Marcos Zona 5'),(4,'Peten zona 1');
/*!40000 ALTER TABLE `Sucursales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18  4:29:08
