-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: bai2-th1
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `dat`
--

DROP TABLE IF EXISTS `dat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dat` (
  `So_don_hang` int NOT NULL AUTO_INCREMENT,
  `ngay_dat` date DEFAULT NULL,
  `so_Luong` int DEFAULT NULL,
  `maSoNguoiDat` int DEFAULT NULL,
  UNIQUE KEY `idDAT_UNIQUE` (`So_don_hang`),
  KEY `kfdat_idx` (`maSoNguoiDat`),
  CONSTRAINT `kfdat` FOREIGN KEY (`maSoNguoiDat`) REFERENCES `nguoi_dat` (`id_NGUOI_DAT`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dat`
--

LOCK TABLES `dat` WRITE;
/*!40000 ALTER TABLE `dat` DISABLE KEYS */;
INSERT INTO `dat` VALUES (1,'2022-10-31',15,1),(2,'2022-11-01',30,3),(3,'2023-12-05',45,2);
/*!40000 ALTER TABLE `dat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `don_vi_khach`
--

DROP TABLE IF EXISTS `don_vi_khach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `don_vi_khach` (
  `donHangId` int NOT NULL AUTO_INCREMENT,
  `tenDonHang` varchar(45) DEFAULT NULL,
  `dienThoai` varchar(45) DEFAULT NULL,
  `diaChi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`donHangId`),
  UNIQUE KEY `donHangId_UNIQUE` (`donHangId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `don_vi_khach`
--

LOCK TABLES `don_vi_khach` WRITE;
/*!40000 ALTER TABLE `don_vi_khach` DISABLE KEYS */;
INSERT INTO `don_vi_khach` VALUES (1,'doAnKho','0945692610','Giang biên vinh bảo hải phồng'),(2,'binhDan','0984088920','chợ râu thôn 1 xóm ông Kỉ'),(3,'Banhtrai','0942595229','đường 10 chợ dâu giang biên');
/*!40000 ALTER TABLE `don_vi_khach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giao`
--

DROP TABLE IF EXISTS `giao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giao` (
  `soPG` int NOT NULL AUTO_INCREMENT,
  `so_luong` varchar(45) DEFAULT NULL,
  `donGia` varchar(45) DEFAULT NULL,
  `ngay_giao` date DEFAULT NULL,
  `maSoNguoiNhan` int DEFAULT NULL,
  PRIMARY KEY (`soPG`),
  UNIQUE KEY `idgiao_UNIQUE` (`soPG`),
  KEY `fkgiao_idx` (`maSoNguoiNhan`),
  CONSTRAINT `fkgiao` FOREIGN KEY (`maSoNguoiNhan`) REFERENCES `nguoi_nhan` (`idnguoi_nhan`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giao`
--

LOCK TABLES `giao` WRITE;
/*!40000 ALTER TABLE `giao` DISABLE KEYS */;
INSERT INTO `giao` VALUES (1,'10','200','2022-07-29',5),(2,'15','500','2022-12-14',6),(3,'6','750','2010-06-03',8),(4,'5','1110','2011-12-11',7);
/*!40000 ALTER TABLE `giao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hang`
--

DROP TABLE IF EXISTS `hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hang` (
  `idHANG` int NOT NULL AUTO_INCREMENT,
  `tenHang` varchar(45) DEFAULT NULL,
  `don_Vi_Tinh` float DEFAULT NULL,
  `moTaHang` varchar(45) DEFAULT NULL,
  `so_Don_Hang` int DEFAULT NULL,
  `soDonHang` int DEFAULT NULL,
  `so_PG` int DEFAULT NULL,
  UNIQUE KEY `idHANG_UNIQUE` (`idHANG`),
  KEY `fk2_idx` (`soDonHang`),
  KEY `fkhang_idx` (`so_PG`),
  CONSTRAINT `fk2` FOREIGN KEY (`soDonHang`) REFERENCES `dat` (`So_don_hang`),
  CONSTRAINT `fkhang` FOREIGN KEY (`so_PG`) REFERENCES `giao` (`soPG`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hang`
--

LOCK TABLES `hang` WRITE;
/*!40000 ALTER TABLE `hang` DISABLE KEYS */;
INSERT INTO `hang` VALUES (1,'mỳ tôm',20,'khá bình dân và ngon',1,NULL,NULL),(2,'cơm trứng',15,'rẻ',3,NULL,NULL),(3,'thịt kho tàu',30,'ngon nhức nách',2,NULL,NULL);
/*!40000 ALTER TABLE `hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoi_dat`
--

DROP TABLE IF EXISTS `nguoi_dat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoi_dat` (
  `id_NGUOI_DAT` int NOT NULL AUTO_INCREMENT,
  `hoVaTen` varchar(45) DEFAULT NULL,
  `don_hang_id` int DEFAULT NULL,
  KEY `fk1_idx` (`id_NGUOI_DAT`,`don_hang_id`),
  KEY `fknguoidat_idx` (`don_hang_id`),
  CONSTRAINT `fknguoidat` FOREIGN KEY (`don_hang_id`) REFERENCES `don_vi_khach` (`donHangId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoi_dat`
--

LOCK TABLES `nguoi_dat` WRITE;
/*!40000 ALTER TABLE `nguoi_dat` DISABLE KEYS */;
INSERT INTO `nguoi_dat` VALUES (1,'nguyễn việt anh',2),(2,'phạm nhật vượng',3),(3,'trần đức bo',1);
/*!40000 ALTER TABLE `nguoi_dat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoi_giao`
--

DROP TABLE IF EXISTS `nguoi_giao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoi_giao` (
  `idnguoi_giao` int NOT NULL AUTO_INCREMENT,
  `ho_ten_full` varchar(45) DEFAULT NULL,
  `soPG_giao` int DEFAULT NULL,
  PRIMARY KEY (`idnguoi_giao`),
  UNIQUE KEY `idnguoi_giao_UNIQUE` (`idnguoi_giao`),
  KEY `fknguoi_giao_idx` (`soPG_giao`),
  CONSTRAINT `fknguoi_giao` FOREIGN KEY (`soPG_giao`) REFERENCES `giao` (`soPG`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoi_giao`
--

LOCK TABLES `nguoi_giao` WRITE;
/*!40000 ALTER TABLE `nguoi_giao` DISABLE KEYS */;
INSERT INTO `nguoi_giao` VALUES (1,'nguyn van taxi',1),(2,'nguyen van xe dap',4),(3,'tran nhu o to',2),(4,'pham thi may bay',3);
/*!40000 ALTER TABLE `nguoi_giao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoi_nhan`
--

DROP TABLE IF EXISTS `nguoi_nhan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoi_nhan` (
  `idnguoi_nhan` int NOT NULL AUTO_INCREMENT,
  `ho_ten_nguoi_nhan` varchar(45) DEFAULT NULL,
  `maDV` int DEFAULT NULL,
  UNIQUE KEY `idnguoi_nhan_UNIQUE` (`idnguoi_nhan`),
  KEY `fknguoinhan_idx` (`maDV`),
  CONSTRAINT `fknguoinhan` FOREIGN KEY (`maDV`) REFERENCES `don_vi_khach` (`donHangId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoi_nhan`
--

LOCK TABLES `nguoi_nhan` WRITE;
/*!40000 ALTER TABLE `nguoi_nhan` DISABLE KEYS */;
INSERT INTO `nguoi_nhan` VALUES (5,'nuicuong ',1),(6,'tiep an cut',3),(7,'viet dz',2),(8,'cuong',2);
/*!40000 ALTER TABLE `nguoi_nhan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noi_giao`
--

DROP TABLE IF EXISTS `noi_giao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `noi_giao` (
  `idnoi_giao` int NOT NULL AUTO_INCREMENT,
  `noi_giao` varchar(45) DEFAULT NULL,
  `so_PG` int DEFAULT NULL,
  PRIMARY KEY (`idnoi_giao`),
  UNIQUE KEY `idnoi_giao_UNIQUE` (`idnoi_giao`),
  KEY `fkgiaoo_idx` (`so_PG`),
  CONSTRAINT `fkgiaoo` FOREIGN KEY (`so_PG`) REFERENCES `giao` (`soPG`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noi_giao`
--

LOCK TABLES `noi_giao` WRITE;
/*!40000 ALTER TABLE `noi_giao` DISABLE KEYS */;
INSERT INTO `noi_giao` VALUES (1,'vinh bao hai phong',1),(2,'ha long ',3),(3,'ha noi nam tu liem',2),(4,'thanh hoa',4);
/*!40000 ALTER TABLE `noi_giao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-31 20:44:02
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: quanlydiemthi
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `bang_diem`
--

DROP TABLE IF EXISTS `bang_diem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bang_diem` (
  `maHS` varchar(20) NOT NULL,
  `maMH` varchar(20) NOT NULL,
  `diem_thi` int DEFAULT NULL,
  `ngayKT` date DEFAULT NULL,
  PRIMARY KEY (`maHS`,`maMH`),
  UNIQUE KEY `maHS_UNIQUE` (`maHS`),
  KEY `fk_maMH_idx` (`maMH`),
  CONSTRAINT `fk_maHS` FOREIGN KEY (`maHS`) REFERENCES `hoc_sinh` (`ma_HS`),
  CONSTRAINT `fk_maMH` FOREIGN KEY (`maMH`) REFERENCES `mon_hoc` (`maMH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bang_diem`
--

LOCK TABLES `bang_diem` WRITE;
/*!40000 ALTER TABLE `bang_diem` DISABLE KEYS */;
INSERT INTO `bang_diem` VALUES ('HS01','JV08',10,'2022-10-31'),('HS02','JS08',9,'2022-10-31');
/*!40000 ALTER TABLE `bang_diem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giao_vien`
--

DROP TABLE IF EXISTS `giao_vien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giao_vien` (
  `maGV` varchar(20) NOT NULL,
  `tenGV` varchar(20) DEFAULT NULL,
  `sdt` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`maGV`),
  UNIQUE KEY `maGV_UNIQUE` (`maGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giao_vien`
--

LOCK TABLES `giao_vien` WRITE;
/*!40000 ALTER TABLE `giao_vien` DISABLE KEYS */;
INSERT INTO `giao_vien` VALUES ('GVJAVA','hung','0945692610'),('GVJS','quang','0942595229');
/*!40000 ALTER TABLE `giao_vien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoc_sinh`
--

DROP TABLE IF EXISTS `hoc_sinh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoc_sinh` (
  `ma_HS` varchar(20) NOT NULL,
  `tenHS` varchar(45) DEFAULT NULL,
  `ngaySinh` date DEFAULT NULL,
  `lop` varchar(45) DEFAULT NULL,
  `GT` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ma_HS`),
  UNIQUE KEY `idhoc_sinh_UNIQUE` (`ma_HS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoc_sinh`
--

LOCK TABLES `hoc_sinh` WRITE;
/*!40000 ALTER TABLE `hoc_sinh` DISABLE KEYS */;
INSERT INTO `hoc_sinh` VALUES ('HS01','nguyen viet anh','1999-07-29','jav08','raast hay'),('HS02','pham chi thanh','1993-06-10','js05','rat ok');
/*!40000 ALTER TABLE `hoc_sinh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mon_hoc`
--

DROP TABLE IF EXISTS `mon_hoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mon_hoc` (
  `maMH` varchar(20) NOT NULL,
  `tenMH` varchar(45) DEFAULT NULL,
  `ma_GV` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`maMH`),
  UNIQUE KEY `idmon_hoc_UNIQUE` (`maMH`),
  KEY `fkmaGV_idx` (`ma_GV`),
  CONSTRAINT `fkmaGV` FOREIGN KEY (`ma_GV`) REFERENCES `giao_vien` (`maGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mon_hoc`
--

LOCK TABLES `mon_hoc` WRITE;
/*!40000 ALTER TABLE `mon_hoc` DISABLE KEYS */;
INSERT INTO `mon_hoc` VALUES ('JS08','hoc full stac','GVJAVA'),('JV08','hoc 6 thang','GVJS');
/*!40000 ALTER TABLE `mon_hoc` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-31 20:44:02
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: bai2-th3
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `idClass` int NOT NULL AUTO_INCREMENT,
  `ClassName` varchar(60) NOT NULL,
  `StartDate` date NOT NULL,
  `Status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idClass`),
  UNIQUE KEY `idClass_UNIQUE` (`idClass`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'lớp you','2022-07-29',_binary ''),(2,'loi','2021-01-21',_binary ''),(3,'lop 11','2012-12-28',_binary '\0'),(4,'lop dai hoc','2022-02-15',_binary '\0');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mark`
--

DROP TABLE IF EXISTS `mark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mark` (
  `idMark` int NOT NULL AUTO_INCREMENT,
  `SubID` int NOT NULL,
  `StudentID` int NOT NULL,
  `Mark` float DEFAULT '0',
  `ExamTimes` tinyint DEFAULT '1',
  UNIQUE KEY `idMark_UNIQUE` (`idMark`),
  KEY `fk_sub_idx` (`SubID`),
  KEY `fk_student` (`StudentID`),
  CONSTRAINT `fk_student` FOREIGN KEY (`StudentID`) REFERENCES `student` (`idStudent`),
  CONSTRAINT `fk_sub` FOREIGN KEY (`SubID`) REFERENCES `subject` (`idSubject`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mark`
--

LOCK TABLES `mark` WRITE;
/*!40000 ALTER TABLE `mark` DISABLE KEYS */;
INSERT INTO `mark` VALUES (1,1,1,10,1),(2,2,4,5,5),(3,3,3,1,3);
/*!40000 ALTER TABLE `mark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `idStudent` int NOT NULL AUTO_INCREMENT,
  `StudentName` varchar(30) DEFAULT NULL,
  `Adress` varchar(50) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Status` bit(1) DEFAULT NULL,
  `ClassId` int NOT NULL,
  PRIMARY KEY (`idStudent`),
  UNIQUE KEY `idStudent_UNIQUE` (`idStudent`),
  KEY `fk_idx` (`ClassId`),
  CONSTRAINT `fk` FOREIGN KEY (`ClassId`) REFERENCES `class` (`idClass`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'nguyen viet anh','giang binh vinh bao9 hai phong','0945692610',_binary '',1),(3,'dang tran tiep','ha noi ','0987654321',_binary '\0',4),(4,'phuong thao','hd','0984088920',_binary '\0',3);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `idSubject` int NOT NULL AUTO_INCREMENT,
  `SubjectName` varchar(30) NOT NULL,
  `Credit` int NOT NULL,
  `Status` bit(1) DEFAULT NULL,
  `Studenid` int NOT NULL,
  PRIMARY KEY (`idSubject`),
  UNIQUE KEY `idSubject_UNIQUE` (`idSubject`),
  KEY `fk2student_idx` (`Studenid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'chu de 1',2,NULL,0),(2,'chu de 2',4,_binary '',0),(3,'chu de 4',41,_binary '\0',0);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-31 20:44:02
