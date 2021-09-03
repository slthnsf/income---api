CREATE DATABASE  IF NOT EXISTS `db_budget` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_budget`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_budget
-- ------------------------------------------------------
-- Server version	8.0.22

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

--
-- Table structure for table `tb_product`
--

DROP TABLE IF EXISTS `tb_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_product` (
  `idproduct` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) NOT NULL,
  `idstatus` int NOT NULL,
  `stok` int NOT NULL,
  `harga_beli` int NOT NULL,
  `harga_jual` int NOT NULL,
  `img` varchar(150) NOT NULL,
  PRIMARY KEY (`idproduct`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product`
--

LOCK TABLES `tb_product` WRITE;
/*!40000 ALTER TABLE `tb_product` DISABLE KEYS */;
INSERT INTO `tb_product` VALUES (1,'Hershey Chocolate Kisses Milk Almoond',1,15,50000,60000,'https://images.tokopedia.net/img/cache/500-square/product-1/2019/5/19/5744803/5744803_254365e1-824a-4ffd-986e-559f238b3833_479_479.jpg.webp'),(2,'Nutella B-Ready',1,12,65000,75000,'https://cf.shopee.co.id/file/25c619b26146135f5f6f20774e77a377'),(3,'Cheetos Flamin Hot 226 gr',1,18,75000,80000,'https://s0.bukalapak.com/img/0214657472/large/aHR0cHM6Ly9lY3M3LnRva29wZWRpYS5uZXQvaW1nL3Byb2R1Y3QtMS8yMDE4.jpg'),(4,'Chupa Chups Soda Drink 250 ml',1,12,30000,40000,'https://cf.shopee.co.id/file/80ca69bbd4d15386c07110e1714ced6b'),(5,'Binggrae Banana Milk 200 ml',1,15,15000,26000,'https://images.tokopedia.net/img/cache/700/VqbcmM/2021/5/20/042c8807-d68d-4936-86c2-bcb4ae07af31.jpg'),(6,'Chilsung Cider 250 ml',1,13,38000,45000,'https://images.tokopedia.net/img/cache/500-square/product-1/2020/6/16/11055071/11055071_1a713437-1058-4ce6-ab51-bc660fd9ad8d_1024_1024.webp'),(7,'Coca Cola Coffe 250 ml',1,15,30000,38000,'https://i.ebayimg.com/images/g/C9oAAOSw9J9cwuPs/s-l400.jpg'),(8,'Caprisun Alaska Ice 200 ml',1,15,20000,30000,'https://www.capri-sun.com/cz/wp-content/uploads/sites/14/2020/05/Capri-Sun_200ml_Ice_Tea_Peach_Pouch_CZ.png'),(9,'Pringles Honey Mustard Crisps 156 gr',1,22,48000,60000,'https://storage.googleapis.com/images-sof-prd-9fa6b8b.sof.prd.v8.commerce.mi9cloud.com/product-images/zoom/00064100137752.jpg'),(10,'Hanuta Minis Wafer 280 gr',1,16,80000,90000,'https://images.tokopedia.net/img/cache/500-square/product-1/2019/4/27/36731520/36731520_6a2142e8-c755-4bc8-a200-73974dd0db8c_700_700.jpg');
/*!40000 ALTER TABLE `tb_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_status`
--

DROP TABLE IF EXISTS `tb_product_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_product_status` (
  `idproduct_status` int NOT NULL AUTO_INCREMENT,
  `product_status` varchar(45) NOT NULL,
  PRIMARY KEY (`idproduct_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_status`
--

LOCK TABLES `tb_product_status` WRITE;
/*!40000 ALTER TABLE `tb_product_status` DISABLE KEYS */;
INSERT INTO `tb_product_status` VALUES (1,'Available'),(2,'Non-Available');
/*!40000 ALTER TABLE `tb_product_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_restock_product`
--

DROP TABLE IF EXISTS `tb_restock_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_restock_product` (
  `idrestock_product` int NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `idproduct` int NOT NULL,
  `nama` varchar(45) NOT NULL,
  `kuantity` int NOT NULL,
  `harga_beli` int NOT NULL,
  `total` int NOT NULL,
  PRIMARY KEY (`idrestock_product`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_restock_product`
--

LOCK TABLES `tb_restock_product` WRITE;
/*!40000 ALTER TABLE `tb_restock_product` DISABLE KEYS */;
INSERT INTO `tb_restock_product` VALUES (1,'2021-08-12 15:12:45',7,'Coca Cola Coffe 250 ml',3,30000,90000),(2,'2021-08-14 15:12:45',8,'Caprisun Alaska Ice 200 ml',2,20000,40000),(3,'2021-09-01 07:30:34',5,'Binggrae Banana Milk 200 ml',4,15000,60000);
/*!40000 ALTER TABLE `tb_restock_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role`
--

DROP TABLE IF EXISTS `tb_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_role` (
  `idrole` int NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`idrole`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role`
--

LOCK TABLES `tb_role` WRITE;
/*!40000 ALTER TABLE `tb_role` DISABLE KEYS */;
INSERT INTO `tb_role` VALUES (1,'Admin'),(2,'User');
/*!40000 ALTER TABLE `tb_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_transaction`
--

DROP TABLE IF EXISTS `tb_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_transaction` (
  `idtransaction` int NOT NULL AUTO_INCREMENT,
  `invoice` varchar(45) NOT NULL,
  `date_transaction` datetime NOT NULL,
  `iduser` varchar(45) NOT NULL,
  `subtotal_harga_jual` varchar(45) NOT NULL,
  `subtotal_harga_beli` varchar(45) NOT NULL,
  PRIMARY KEY (`idtransaction`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_transaction`
--

LOCK TABLES `tb_transaction` WRITE;
/*!40000 ALTER TABLE `tb_transaction` DISABLE KEYS */;
INSERT INTO `tb_transaction` VALUES (1,'#PP/16285221','2021-08-09 22:15:49','2','120000','100000'),(2,'#PP/16285227','2021-08-10 22:25:32','3','120000','105000'),(3,'#PP/16285829','2021-08-10 15:08:36','4','83000','68000'),(4,'#PP/16285831','2021-08-12 15:12:45','5','90000','80000'),(5,'#PP/16274482','2021-08-20 15:12:45','3','118000','105000'),(6,'#PP/16274483','2021-08-21 15:08:36','5','225000','195000'),(7,'#PP/16274484','2021-08-21 15:12:36','2','120000','90000'),(8,'#PP/16274485','2021-08-22 15:12:36','2','52000','30000'),(9,'#PP/16274486','2021-08-24 15:12:36','4','280000','246000'),(10,'#PP/16289896','2021-09-01 07:30:34','4','490000','410000'),(11,'#PP/16284937','2021-09-01 07:31:15','4','240000','192000');
/*!40000 ALTER TABLE `tb_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_transaction_detail`
--

DROP TABLE IF EXISTS `tb_transaction_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_transaction_detail` (
  `idtransaction_detail` int NOT NULL AUTO_INCREMENT,
  `idtransaction` int NOT NULL,
  `idproduct` int NOT NULL,
  `kuantity` int NOT NULL,
  PRIMARY KEY (`idtransaction_detail`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_transaction_detail`
--

LOCK TABLES `tb_transaction_detail` WRITE;
/*!40000 ALTER TABLE `tb_transaction_detail` DISABLE KEYS */;
INSERT INTO `tb_transaction_detail` VALUES (1,1,1,2),(2,2,3,1),(3,2,4,1),(4,3,6,1),(5,3,7,1),(6,4,10,1),(9,5,3,1),(10,5,7,1),(11,6,2,3),(12,7,9,1),(13,7,8,2),(14,8,5,2),(15,9,3,2),(16,9,9,2),(17,10,10,2),(18,10,2,2),(19,10,4,4),(20,11,9,4);
/*!40000 ALTER TABLE `tb_transaction_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `fullname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `idstatus` int NOT NULL,
  `idrole` int NOT NULL,
  `otp` varchar(45) NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'admin','Admin','admin@mail.com','admin123',1,1,'axYbc'),(2,'safina','Sulthana Safina','hi.itsafi@gmail.com','afi1234',1,2,'cXYbz'),(3,'abelk','Abel K','abel@mail.com','abel123',1,2,'BzxCy'),(4,'amara','Amara Nibiru','nibiru.amara@mail.com','amara001',1,2,'cbyTR'),(5,'naraja','Naraja','nar.aja@mail.com','nara123',1,2,'ByZOp');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_status`
--

DROP TABLE IF EXISTS `tb_user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user_status` (
  `iduser_status` int NOT NULL AUTO_INCREMENT,
  `user_status` varchar(45) NOT NULL,
  PRIMARY KEY (`iduser_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_status`
--

LOCK TABLES `tb_user_status` WRITE;
/*!40000 ALTER TABLE `tb_user_status` DISABLE KEYS */;
INSERT INTO `tb_user_status` VALUES (1,'Active'),(2,'Deactive');
/*!40000 ALTER TABLE `tb_user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_budget'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-03 14:28:46
