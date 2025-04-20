-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: raknummallshop
-- ------------------------------------------------------
-- Server version	9.0.0

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `productid` varchar(36) NOT NULL,
  `price` double NOT NULL,
  `type_product` varchar(50) NOT NULL,
  `description_product` text NOT NULL,
  `imageURL` text,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('b001',300,'กระเป๋า','กระเป๋าถักเปลือกหอยลายธรรมชาติ','assets/images/b001.png'),('b002',150,'กระเป๋า','กระเป๋าผ้าสีเทาเรียบหรู มีพู่ห้อยข้าง','assets/images/b002.png'),('b003',300,'กระเป๋า','กระเป๋าลายเรขาคณิต สีพาสเทลทันสมัย','assets/images/b003.png'),('b004',200,'กระเป๋า','กระเป๋าผ้าถักสีเบจพร้อมพู่ห้อย','assets/images/b004.png'),('b005',390,'กระเป๋า','กระเป๋าถักโทนหวาน ตกแต่งด้วยเชือกเปลือกหอย','assets/images/b005.png'),('b006',400,'กระเป๋า','กระเป๋าผ้าลายคลื่นสีน้ำทะเล','assets/images/b006.png'),('b007',450,'กระเป๋า','กระเป๋าทอลายซิกแซก สไตล์โบฮีเมียน','assets/images/b007.png'),('b008',500,'กระเป๋า','กระเป๋าถักโทนฟ้าอมเทา ดูหรูหรา','assets/images/b008.png'),('b009',550,'กระเป๋า','กระเป๋าทอลายเปลือกหอย ตกแต่งด้วยดาวทะเล','assets/images/b009.png'),('b010',200,'กระเป๋า','กระเป๋าผ้าทอลายเปลือกหอยทะเล','assets/images/b010.png'),('h001',100,'หมวก','หมวกถักแนวโบฮีเมียน ตกแต่งเปลือกหอย','assets/images/h001.png'),('h002',70,'หมวก','หมวกตาข่ายลายไขว้ สีเรียบเท่ห์','assets/images/h002.png'),('h003',200,'หมวก','หมวกทรงบักเก็ต ถักละเอียดพร้อมขนนก','assets/images/h003.png'),('h004',170,'หมวก','หมวกไหมพรมลายเปลือกหอย ทรงน่ารัก','assets/images/h004.png'),('h005',250,'หมวก','หมวกตาข่ายแต่งดอกไม้ทะเลและหินสี','assets/images/h005.png'),('h006',150,'หมวก','หมวกกีฬาแต่งลายคลื่นและสีเทา','assets/images/h006.png'),('h007',350,'หมวก','หมวกโชว์สุดแฟนซี ประดับเปลือกหอยทะเล','assets/images/h007.png'),('h008',65,'หมวก','หมวกเบสบอลผ้าตาข่ายใส่สบาย','assets/images/h008.png'),('h009',60,'หมวก','หมวกลายคลื่นพาสเทล สไตล์น่ารัก','assets/images/h009.png'),('h010',350,'หมวก','หมวกปีกกว้าง ประดับไข่มุกและดอกไม้ทะเล','assets/images/h010.png'),('p001',250,'เข็มกลัด','เข็มกลัดลายดอกไม้ทะเล ตกแต่งไข่มุกหรู','assets/images/p001.png'),('p002',200,'เข็มกลัด','เข็มกลัดกลมลายเปลือกหอย ผสมไม้และเชือกถัก','assets/images/p002.png'),('p003',250,'เข็มกลัด','เข็มกลัดสานลายทะเล ฟิวโบฮีเมียน','assets/images/p003.png'),('p004',150,'เข็มกลัด','เข็มกลัดกลมสไตล์มินิมอล แต่งหินอ่อนฟ้า','assets/images/p004.png'),('p005',350,'เข็มกลัด','เข็มกลัดลายขนนกหลากสี สะดุดตา','assets/images/p005.png'),('p006',310,'เข็มกลัด','เข็มกลัดหินสีฟ้ากับเปลือกหอย ดีไซน์วินเทจ','assets/images/p006.png'),('p007',150,'เข็มกลัด','เข็มกลัดทรงสี่เหลี่ยมเรียบหรู ตกแต่งหินเขียว','assets/images/p007.png'),('p008',500,'เข็มกลัด','เข็มกลัดแนวแฟนซีจัดเต็ม ลายดอกไม้+เปลือกหอย','assets/images/p008.png'),('p009',400,'เข็มกลัด','เข็มกลัดเส้นไขว้ประดับหินฟ้าและเปลือกหอย','assets/images/p009.png'),('p010',200,'เข็มกลัด','เข็มกลัดรูปทรงใบไม้ ถักเชือกผสมหินเขียว','assets/images/p010.png'),('r001',100,'แหวน','แหวนถักเปลือกหอยแต่งด้วยหินเขียวทะเล','assets/images/r001.png'),('r002',50,'แหวน','แหวนลายเกลียวคลื่นโทนเทาน้ำทะเล','assets/images/r002.png'),('r003',70,'แหวน','แหวนเรียบหรู ลายถักโทนฟ้าอ่อน','assets/images/r003.png'),('r004',200,'แหวน','แหวนถักสไตล์บาหลี ประดับเปลือกหอย','assets/images/r004.png'),('r005',150,'แหวน','แหวนลวดลายเรขาคณิต เข้ากับทุกลุค','assets/images/r005.png'),('r006',160,'แหวน','แหวนถักสายไขว้ ประดับหินทะเลสีฟ้า','assets/images/r006.png'),('r007',200,'แหวน','แหวนคู่น้ำทะเลพร้อมดีเทลเปลือกหอย','assets/images/r007.png'),('r008',150,'แหวน','แหวนสานแต่งลายคลื่นทะเล หรูแบบโบฮีเมียน','assets/images/r008.png'),('r009',150,'แหวน','แหวนสายหนังตกแต่งเปลือกหอยและหินฟ้า','assets/images/r009.png'),('r010',170,'แหวน','แหวนหินเขียวทรงเหลี่ยม ล้อมด้วยลายตาข่าย','assets/images/r010.png'),('u001',400,'ของใช้','ภาพติดฝาผนัง','assets/images/u001.png'),('u002',200,'ของใช้','พวงกุญแจจากยางรถ','assets/images/u002.png'),('u003',1500,'ของใช้','นาฬิกาหน้าปัดฟ้า','assets/images/u003.png');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-18  5:50:22
