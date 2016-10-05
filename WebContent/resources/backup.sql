-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: pia
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Temporary view structure for view `cc`
--

DROP TABLE IF EXISTS `cc`;
/*!50001 DROP VIEW IF EXISTS `cc`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `cc` AS SELECT 
 1 AS `playDate`,
 1 AS `taiNo`,
 1 AS `rate`,
 1 AS `bonusCount`,
 1 AS `ballOutput`,
 1 AS `ballinputs`,
 1 AS `totalOut`,
 1 AS `totalOutBefore`,
 1 AS `rateN`,
 1 AS `bonusCountN`,
 1 AS `ballOutputN`,
 1 AS `playDateN`,
 1 AS `totalOutN`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `piainfo`
--

DROP TABLE IF EXISTS `piainfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piainfo` (
  `playDate` int(11) NOT NULL,
  `taiNo` int(11) NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `bonusCount` int(11) DEFAULT NULL,
  `ballOutput` int(11) DEFAULT NULL,
  PRIMARY KEY (`playDate`,`taiNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piainfo`
--

LOCK TABLES `piainfo` WRITE;
/*!40000 ALTER TABLE `piainfo` DISABLE KEYS */;
INSERT INTO `piainfo` VALUES (20160903,557,121,14,4000),(20160903,558,150,9,1000),(20160903,559,89,21,21000),(20160903,560,74,33,36000),(20160903,561,134,6,0),(20160903,562,95,17,17000),(20160903,563,313,7,-18000),(20160903,564,255,9,-17000),(20160903,565,145,14,-6000),(20160903,566,261,5,-10000),(20160903,567,114,13,8000),(20160903,568,999,1,-30000),(20160903,569,964,1,-14000),(20160903,570,666,2,-18000),(20160903,571,191,10,-5000),(20160903,572,197,4,-7000),(20160903,573,569,1,-8000),(20160903,574,81,26,27000),(20160903,575,189,9,-6000),(20160903,576,122,8,4000),(20160903,577,296,7,-17000),(20160903,578,999,2,-42000),(20160903,579,195,15,-8000),(20160903,580,0,0,-8000),(20160903,581,113,18,13000),(20160903,582,115,7,7000),(20160903,583,0,0,-21000),(20160903,584,119,23,16000),(20160904,557,329,3,-8500),(20160904,558,189,5,-4000),(20160904,559,665,1,-8000),(20160904,560,115,11,9000),(20160904,561,407,2,-9000),(20160904,562,0,0,-16000),(20160904,563,158,15,-4000),(20160904,564,213,13,-14000),(20160904,565,265,5,-10000),(20160904,566,437,2,-10000),(20160904,567,252,6,-7000),(20160904,568,211,9,-10000),(20160904,569,127,13,6000),(20160904,570,105,20,-10000),(20160904,571,167,13,-3000),(20160904,572,0,0,-11000),(20160904,573,250,5,-10000),(20160904,574,149,8,3000),(20160904,575,128,10,5000),(20160904,576,103,20,9000),(20160904,577,438,1,-5000),(20160904,578,84,35,38000),(20160904,579,466,3,-13000),(20160904,580,374,2,-8000),(20160904,581,0,0,-18000),(20160904,582,0,0,-7000),(20160904,583,148,16,2000),(20160904,584,95,14,14000),(20160905,557,171,14,-7000),(20160905,558,300,5,-13000),(20160905,559,699,1,-8000),(20160905,560,261,5,-10000),(20160905,561,116,8,3000),(20160905,562,0,0,-6000),(20160905,563,71,58,80000),(20160905,564,95,37,36000),(20160905,565,0,0,-4000),(20160905,566,251,12,-10000),(20160905,567,0,0,-10000),(20160905,568,433,2,-10000),(20160905,569,131,18,6000),(20160905,570,308,1,-2000),(20160905,571,222,9,-10000),(20160905,572,279,6,-13000),(20160905,573,982,2,-28000),(20160905,574,0,0,-9000),(20160905,575,141,19,5000),(20160905,576,197,4,-2000),(20160905,577,162,9,-3000),(20160905,578,98,9,3000),(20160905,579,153,19,7000),(20160905,580,89,39,43000),(20160905,581,667,1,-9000),(20160905,582,172,13,-5000),(20160905,583,105,11,9000),(20160905,584,101,22,18000),(20160906,557,0,0,-12000),(20160906,558,162,10,-4000),(20160906,559,0,0,-4000),(20160906,560,91,28,23000),(20160906,561,0,0,-1000),(20160906,562,529,1,-7000),(20160906,563,231,15,-12000),(20160906,564,557,5,-26000),(20160906,565,0,0,-300),(20160906,566,166,22,4000),(20160906,567,0,0,-300),(20160906,568,249,6,-10000),(20160906,569,834,1,-11000),(20160906,570,247,5,-6000),(20160906,571,135,10,0),(20160906,572,128,11,3000),(20160906,573,445,1,-4500),(20160906,574,70,23,26000),(20160906,575,0,0,-3000),(20160906,576,0,0,0),(20160906,577,86,21,24000),(20160906,578,76,8,4000),(20160906,579,198,18,-1000),(20160906,580,151,24,12000),(20160906,581,0,0,-4000),(20160906,582,105,14,12000),(20160906,583,384,1,-3000),(20160906,584,788,1,-11000),(20160907,557,254,4,-8000),(20160907,558,74,17,23000),(20160907,559,438,2,-9000),(20160907,560,866,1,-12000),(20160907,561,0,0,-4000),(20160907,562,236,3,-6000),(20160907,563,991,3,-33000),(20160907,564,98,44,35500),(20160907,565,87,10,3500),(20160907,566,140,25,12000),(20160907,567,0,0,-300),(20160907,568,887,1,-11000),(20160907,569,170,5,0),(20160907,570,999,1,-24000),(20160907,571,125,17,5500),(20160907,572,0,0,-2000),(20160907,573,198,16,-9000),(20160907,574,0,0,-1000),(20160907,575,0,0,-11000),(20160907,576,664,2,-19000),(20160907,577,152,7,2000),(20160907,578,0,0,-3000),(20160907,579,76,43,36000),(20160907,580,0,0,-1000),(20160907,581,172,4,0),(20160907,582,378,3,-12000),(20160907,583,574,1,-8000),(20160907,584,119,20,16000),(20160908,557,208,5,-5000),(20160908,558,0,0,-10000),(20160908,559,301,2,-8000),(20160908,560,122,13,9500),(20160908,561,110,17,13000),(20160908,562,0,0,-4000),(20160908,563,132,29,16000),(20160908,564,206,15,-8000),(20160908,565,0,0,-2500),(20160908,566,147,10,-3500),(20160908,567,457,5,-21000),(20160908,568,120,17,10000),(20160908,569,0,0,-12000),(20160908,570,323,4,-12000),(20160908,571,97,16,15000),(20160908,572,0,0,-9000),(20160908,573,119,31,22000),(20160908,574,0,0,0),(20160908,575,141,9,6000),(20160908,576,153,13,-1000),(20160908,577,327,4,-11000),(20160908,578,0,0,-1000),(20160908,579,105,37,34000),(20160908,580,84,11,12000),(20160908,581,0,0,10000),(20160908,582,364,4,-15000),(20160908,583,196,6,-5000),(20160908,584,231,3,-7000),(20160909,557,129,19,8000),(20160909,558,0,0,-13000),(20160909,559,159,23,-1000),(20160909,560,372,2,-7000),(20160909,561,685,3,-21000),(20160909,562,0,0,-8000),(20160909,563,171,21,5000),(20160909,564,174,18,0),(20160909,565,170,10,-3000),(20160909,566,142,13,-3500),(20160909,567,128,23,15000),(20160909,568,185,12,-3000),(20160909,569,246,9,-10000),(20160909,570,890,2,-26000),(20160909,571,382,4,-18000),(20160909,572,525,14,-20000),(20160909,573,148,15,7000),(20160909,574,334,6,-20000),(20160909,575,643,2,-20000),(20160909,576,140,25,10000),(20160909,577,111,17,11000),(20160909,578,267,12,-13000),(20160909,579,159,14,4000),(20160909,580,124,24,14000),(20160909,581,93,19,17000),(20160909,582,112,15,10000),(20160909,583,117,33,27000),(20160909,584,148,7,-7000),(20160910,557,389,3,-11000),(20160910,558,166,9,-3000),(20160910,559,184,8,-2000),(20160910,560,999,1,-26000),(20160910,561,190,5,-2000),(20160910,562,999,1,-22000),(20160910,563,426,3,-13000),(20160910,564,103,39,33000),(20160910,565,317,1,-3500),(20160910,566,555,2,-12000),(20160910,567,311,1,-2500),(20160910,568,206,6,-5000),(20160910,569,163,21,8000),(20160910,570,295,6,-13000),(20160910,571,0,0,-3500),(20160910,572,186,19,2000),(20160910,573,248,7,-11000),(20160910,574,113,20,10000),(20160910,575,366,2,-5000),(20160910,576,173,10,-4000),(20160910,577,209,7,-8000),(20160910,578,105,26,15000),(20160910,579,89,20,18000),(20160910,580,152,9,0),(20160910,581,153,6,-2000),(20160910,582,315,5,-17000),(20160910,583,169,7,-3000),(20160910,584,128,18,10000),(20160911,557,126,24,15000),(20160911,558,120,24,14000),(20160911,559,99,27,26000),(20160911,560,126,31,18000),(20160911,561,171,22,8000),(20160911,562,184,18,0),(20160911,563,647,3,-26000),(20160911,564,132,31,12000),(20160911,565,0,0,-8000),(20160911,566,121,22,6000),(20160911,567,139,20,5000),(20160911,568,204,12,-7000),(20160911,569,114,34,30000),(20160911,570,242,10,-19000),(20160911,571,85,37,33000),(20160911,572,134,20,4000),(20160911,573,87,37,39000),(20160911,574,327,4,-13000),(20160911,575,156,26,10000),(20160911,576,588,2,-13000),(20160911,577,201,19,-5000),(20160911,578,134,16,0),(20160911,579,82,52,58000),(20160911,580,325,3,-8000),(20160911,581,357,3,-10000),(20160911,582,187,16,-3000),(20160911,583,141,20,-1000),(20160911,584,985,3,-30000),(20160912,557,570,2,-12000),(20160912,558,105,20,12000),(20160912,559,0,0,-2000),(20160912,560,226,14,-8000),(20160912,561,176,15,-2000),(20160912,562,116,31,26000),(20160912,563,0,0,-12000),(20160912,564,999,1,-30000),(20160912,565,198,5,-5000),(20160912,566,276,8,-16000),(20160912,567,977,1,-14000),(20160912,568,641,2,-17000),(20160912,569,160,11,-1000),(20160912,570,127,16,10000),(20160912,571,195,8,-6000),(20160912,572,73,44,45000),(20160912,573,173,9,-4000),(20160912,574,833,1,-12000),(20160912,575,132,21,9000),(20160912,576,174,7,3000),(20160912,577,79,46,60000),(20160912,578,80,24,26000),(20160912,579,0,0,-6000),(20160912,580,165,15,-6000),(20160912,581,381,1,-6000),(20160912,582,195,15,-4000),(20160912,583,0,0,-2000),(20160912,584,99,33,36000),(20160913,557,0,0,-6000),(20160913,558,122,6,0),(20160913,559,0,0,-2000),(20160913,560,207,15,-7000),(20160913,561,62,19,27000),(20160913,562,0,0,-7000),(20160913,563,123,22,8000),(20160913,564,112,18,14000),(20160913,565,276,2,-4000),(20160913,566,148,8,2500),(20160913,567,0,0,-5000),(20160913,568,153,26,17000),(20160913,569,240,1,-1000),(20160913,570,132,17,0),(20160913,571,344,5,-18000),(20160913,572,196,6,-3000),(20160913,573,112,10,3000),(20160913,574,0,0,-19000),(20160913,575,79,23,26000),(20160913,576,103,20,10000),(20160913,577,78,7,7000),(20160913,578,303,4,-10000),(20160913,579,277,3,-4000),(20160913,580,230,4,-7000),(20160913,581,0,0,-4000),(20160913,582,264,12,-19000),(20160913,583,0,0,-3000),(20160913,584,113,11,6000),(20160914,557,233,6,-13000),(20160914,558,90,7,4000),(20160914,559,84,11,11000),(20160914,560,127,14,6000),(20160914,561,91,9,9000),(20160914,562,0,0,-1000),(20160914,563,134,7,5000),(20160914,564,207,6,-7000),(20160914,565,311,1,-2000),(20160914,566,190,9,-3000),(20160914,567,106,5,3000),(20160914,568,674,1,-8000),(20160914,569,0,0,-2000),(20160914,570,111,19,14000),(20160914,571,192,12,-14000),(20160914,572,0,0,-1000),(20160914,573,0,0,-1000),(20160914,574,110,15,6000),(20160914,575,203,4,-7000),(20160914,576,0,0,-5000),(20160914,577,0,0,-8000),(20160914,578,131,11,7000),(20160914,579,68,18,20000),(20160914,580,0,0,-1000),(20160914,581,0,0,-1000),(20160914,582,197,8,-10000),(20160914,583,242,3,-5000),(20160914,584,96,14,15000),(20160915,557,566,3,-21000),(20160915,558,0,0,-8000),(20160915,559,252,3,-4000),(20160915,560,570,1,-7000),(20160915,561,817,1,-11000),(20160915,562,73,15,17000),(20160915,563,320,8,-26000),(20160915,564,215,3,-5000),(20160915,565,441,2,-10000),(20160915,566,185,7,-2000),(20160915,567,313,3,-9000),(20160915,568,113,17,10000),(20160915,569,338,2,-9000),(20160915,570,150,13,0),(20160915,571,323,6,-18000),(20160915,572,0,0,-4000),(20160915,573,249,6,-10000),(20160915,574,111,13,10000),(20160915,575,722,1,-10000),(20160915,576,418,1,-5000),(20160915,577,88,24,24000),(20160915,578,0,0,-17000),(20160915,579,0,0,-5000),(20160915,580,0,0,-16000),(20160915,581,158,5,-3000),(20160915,582,159,16,-7000),(20160915,583,173,5,-2000),(20160915,584,503,3,-17000),(20160916,557,0,0,-20000),(20160916,558,118,30,30000),(20160916,559,229,2,-3000),(20160916,560,0,0,-2000),(20160916,561,69,61,76000),(20160916,562,0,0,-3000),(20160916,563,310,5,-17000),(20160916,564,163,13,0),(20160916,565,105,15,10000),(20160916,566,182,6,-4000),(20160916,567,253,6,-13000),(20160916,568,187,6,-7000),(20160916,569,96,21,21000),(20160916,570,126,10,-1000),(20160916,571,115,20,8000),(20160916,572,0,0,-9000),(20160916,573,283,5,-12000),(20160916,574,96,9,7000),(20160916,575,0,0,-18000),(20160916,576,181,8,-2000),(20160916,577,211,14,-16000),(20160916,578,650,3,-24000),(20160916,579,793,1,-11000),(20160916,580,236,3,-6000),(20160916,581,89,20,17000),(20160916,582,257,5,-10000),(20160916,583,0,0,-12000),(20160916,584,156,9,-3000),(20160917,557,856,1,-13000),(20160917,558,0,0,-4000),(20160917,559,0,0,-3000),(20160917,560,114,19,12000),(20160917,561,0,0,-5000),(20160917,562,999,1,-14000),(20160917,563,202,6,-6000),(20160917,564,687,2,-20000),(20160917,565,229,3,-3000),(20160917,566,0,0,-17000),(20160917,567,0,0,-3000),(20160917,568,126,30,10000),(20160917,569,0,0,-1000),(20160917,570,999,1,-30000),(20160917,571,94,1,-13000),(20160917,572,0,0,-6000),(20160917,573,193,10,-6000),(20160917,574,0,0,-5000),(20160917,575,177,15,-9000),(20160917,576,387,1,-4000),(20160917,577,0,0,-18000),(20160917,578,999,1,-21000),(20160917,579,690,1,-9000),(20160917,580,0,0,-10000),(20160917,581,115,4,3000),(20160917,582,637,2,-17000),(20160917,583,214,4,-4000),(20160917,584,92,10,8000),(20160918,557,144,24,5000),(20160918,558,0,0,-4000),(20160918,559,147,10,1500),(20160918,560,702,1,-10000),(20160918,561,64,37,52000),(20160918,562,568,1,-7000),(20160918,563,999,1,-24000),(20160918,564,999,1,-15000),(20160918,565,138,22,10000),(20160918,566,299,6,-20000),(20160918,567,635,1,-9000),(20160918,568,92,31,30000),(20160918,569,94,8,9000),(20160918,570,194,9,-6000),(20160918,571,102,20,15000),(20160918,572,207,6,-9000),(20160918,573,225,6,-7000),(20160918,574,421,2,-11000),(20160918,575,111,11,7000),(20160918,576,86,33,32000),(20160918,577,318,6,-15000),(20160918,578,115,14,6000),(20160918,579,171,14,-7000),(20160918,580,176,6,-4000),(20160918,581,0,0,-10000),(20160918,582,379,3,-13000),(20160918,583,201,14,13000),(20160918,584,244,6,-11000),(20160919,557,79,53,65000),(20160919,558,280,3,-11000),(20160919,559,0,0,-9000),(20160919,560,153,15,2000),(20160919,561,439,1,-4000),(20160919,562,258,6,-13000),(20160919,563,336,4,-13000),(20160919,564,639,2,-16000),(20160919,565,219,6,-8000),(20160919,566,99,21,14000),(20160919,567,999,2,-34000),(20160919,568,108,21,17000),(20160919,569,278,8,-19000),(20160919,570,203,8,-10000),(20160919,571,198,14,-10000),(20160919,572,88,22,22000),(20160919,573,0,0,-15000),(20160919,574,0,0,-18000),(20160919,575,97,15,12000),(20160919,576,108,12,6500),(20160919,577,999,1,-16500),(20160919,578,159,9,-1000),(20160919,579,0,0,-10000),(20160919,580,94,11,10000),(20160919,581,0,0,-12000),(20160919,582,109,23,11000),(20160919,583,0,0,-1500),(20160919,584,77,34,38500),(20160920,557,367,1,-3000),(20160920,558,237,7,-6000),(20160920,559,389,1,-4000),(20160920,560,459,1,-5000),(20160920,561,659,1,-9000),(20160920,562,0,0,-8000),(20160920,563,164,17,2000),(20160920,564,162,18,1500),(20160920,565,0,0,-500),(20160920,566,0,0,-1000),(20160920,567,999,1,-22000),(20160920,568,70,13,16000),(20160920,569,516,1,-5500),(20160920,570,203,9,-7000),(20160920,571,89,25,18000),(20160920,572,0,0,0),(20160920,573,93,39,41000),(20160920,574,139,14,5000),(20160920,575,0,0,-250),(20160920,576,225,3,-2000),(20160920,577,90,24,26000),(20160920,578,0,0,-16000),(20160920,579,0,0,-3000),(20160920,580,615,2,-16000),(20160920,581,95,19,16000),(20160920,582,0,0,-6000),(20160920,583,163,9,-5000),(20160920,584,577,1,-7000),(20160921,557,491,2,-11000),(20160921,558,112,6,7000),(20160921,559,75,52,70000),(20160921,560,86,11,6500),(20160921,561,471,1,-5000),(20160921,562,197,18,-2000),(20160921,563,0,0,-7000),(20160921,564,110,9,6000),(20160921,565,121,29,18000),(20160921,566,401,1,-4000),(20160921,567,75,53,58000),(20160921,568,99,10,6000),(20160921,569,165,11,-8000),(20160921,570,104,22,12000),(20160921,571,999,1,-25000),(20160921,572,100,24,11500),(20160921,573,0,0,-2500),(20160921,574,268,12,-21000),(20160921,575,235,4,-5000),(20160921,576,75,45,54000),(20160921,577,133,14,1000),(20160921,578,255,12,-14000),(20160921,579,221,17,-7500),(20160921,580,145,13,-1000),(20160921,581,203,8,-5500),(20160921,582,349,4,-11000),(20160921,583,397,7,-30000),(20160921,584,204,12,-13000),(20160922,557,193,10,-9000),(20160922,558,101,17,10000),(20160922,559,531,3,-16000),(20160922,560,671,2,-17500),(20160922,561,143,26,13000),(20160922,562,299,11,-15000),(20160922,563,101,31,20000),(20160922,564,120,25,15000),(20160922,565,216,12,-8000),(20160922,566,116,28,16000),(20160922,567,171,10,-5000),(20160922,568,154,13,-4000),(20160922,569,74,33,37000),(20160922,570,129,21,8000),(20160922,571,103,26,16000),(20160922,572,388,4,-15000),(20160922,573,117,30,16000),(20160922,574,227,9,-6500),(20160922,575,130,33,19000),(20160922,576,99,18,18000),(20160922,577,173,16,-2000),(20160922,578,194,17,-1000),(20160922,579,444,7,-25000),(20160922,580,343,5,-16000),(20160922,581,123,21,10000),(20160922,582,161,18,-1500),(20160922,583,162,17,-2000),(20160922,584,595,3,-21000),(20160923,557,859,2,-25000),(20160923,558,79,16,20000),(20160923,559,257,13,-16000),(20160923,560,134,21,6500),(20160923,561,0,0,-8000),(20160923,562,110,36,32000),(20160923,563,88,12,12000),(20160923,564,999,1,-18000),(20160923,565,139,20,10000),(20160923,566,172,5,-3000),(20160923,567,132,19,10000),(20160923,568,499,4,-22000),(20160923,569,98,26,16000),(20160923,570,999,2,-31000),(20160923,571,324,4,-14000),(20160923,572,135,21,-1000),(20160923,573,805,1,-11500),(20160923,574,200,23,-6500),(20160923,575,144,15,-1500),(20160923,576,0,0,-25000),(20160923,577,253,8,-15000),(20160923,578,239,14,-11000),(20160923,579,486,4,-20500),(20160923,580,79,37,42000),(20160923,581,155,4,0),(20160923,582,218,14,-10000),(20160923,583,85,36,40000),(20160923,584,129,24,4500),(20160924,557,118,24,13000),(20160924,558,0,0,-3000),(20160924,559,76,41,53000),(20160924,560,106,6,2500),(20160924,561,184,24,25000),(20160924,562,0,0,-10000),(20160924,563,209,14,-12000),(20160924,564,225,6,-9000),(20160924,565,134,6,0),(20160924,566,121,26,9000),(20160924,567,328,2,-7000),(20160924,568,261,9,-20000),(20160924,569,630,1,-8000),(20160924,570,180,10,-10000),(20160924,571,106,32,26000),(20160924,572,247,4,-7000),(20160924,573,168,7,0),(20160924,574,106,28,21500),(20160924,575,0,0,-3000),(20160924,576,312,7,-20000),(20160924,577,914,2,-27000),(20160924,578,93,26,18500),(20160924,579,264,11,-20000),(20160924,580,0,0,-16000),(20160924,581,378,3,-10000),(20160924,582,115,29,22000),(20160924,583,954,1,-14000),(20160924,584,205,9,-7500),(20160925,557,128,10,0),(20160925,558,98,11,11000),(20160925,559,101,16,10000),(20160925,560,309,4,-10000),(20160925,561,99,18,12000),(20160925,562,549,1,-7000),(20160925,563,329,5,-12000),(20160925,564,88,19,20000),(20160925,565,231,7,-11000),(20160925,566,174,11,-2000),(20160925,567,92,10,10000),(20160925,568,999,1,-15500),(20160925,569,97,19,16000),(20160925,570,358,4,-14000),(20160925,571,129,17,9500),(20160925,572,0,0,-19000),(20160925,573,168,7,0),(20160925,574,177,8,-2000),(20160925,575,103,17,17000),(20160925,576,0,0,-24000),(20160925,577,290,5,-10000),(20160925,578,209,7,-6000),(20160925,579,234,7,-8500),(20160925,580,562,4,-30000),(20160925,581,0,0,-9500),(20160925,582,97,11,10000),(20160925,583,272,3,-9000),(20160925,584,249,5,-9000),(20160926,557,172,6,-1500),(20160926,558,99,25,13000),(20160926,559,121,11,5000),(20160926,560,921,1,-13000),(20160926,561,170,7,-6000),(20160926,562,144,24,9500),(20160926,563,999,1,-18000),(20160926,564,111,25,7000),(20160926,565,201,6,-6500),(20160926,566,190,7,-2500),(20160926,567,306,3,-8000),(20160926,568,244,13,-11000),(20160926,569,117,15,7000),(20160926,570,115,9,3000),(20160926,571,74,9,11000),(20160926,572,332,10,-21000),(20160926,573,391,2,-9000),(20160926,574,129,11,2500),(20160926,575,145,13,-1500),(20160926,576,0,0,-8000),(20160926,577,151,25,11000),(20160926,578,0,0,-8000),(20160926,579,118,10,3500),(20160926,580,253,14,-15000),(20160926,581,302,2,-5000),(20160926,582,0,0,-9500),(20160926,583,999,1,-18000),(20160926,584,91,22,18000),(20160927,557,96,35,31500),(20160927,558,0,0,-4000),(20160927,559,0,0,-15000),(20160927,560,123,16,10000),(20160927,561,0,0,-19000),(20160927,562,156,25,9000),(20160927,563,362,3,-10000),(20160927,564,254,9,-20000),(20160927,565,236,6,-7000),(20160927,566,999,1,-21000),(20160927,567,582,3,-22000),(20160927,568,261,15,-14000),(20160927,569,90,14,15000),(20160927,570,208,12,-14000),(20160927,571,274,5,-11000),(20160927,572,153,28,10000),(20160927,573,0,0,-5000),(20160927,574,123,21,11500),(20160927,575,241,8,-10000),(20160927,576,100,12,7000),(20160927,577,146,26,10500),(20160927,578,228,9,-11000),(20160927,579,111,7,2000),(20160927,580,138,26,16000),(20160927,581,72,28,37000),(20160927,582,999,1,-15000),(20160927,583,672,2,-18000),(20160927,584,178,11,-3500),(20160928,557,86,36,34000),(20160928,558,0,0,-11500),(20160928,559,656,1,-8500),(20160928,560,0,0,-8500),(20160928,561,741,4,-30000),(20160928,562,108,11,9500),(20160928,563,149,17,-3000),(20160928,564,366,4,-13000),(20160928,565,125,24,12500),(20160928,566,317,5,-20000),(20160928,567,166,6,-3000),(20160928,568,169,20,7500),(20160928,569,169,3,0),(20160928,570,225,12,-16000),(20160928,571,461,3,-18000),(20160928,572,174,22,5500),(20160928,573,102,22,18500),(20160928,574,261,3,-5500),(20160928,575,124,22,11500),(20160928,576,562,2,-15000),(20160928,577,0,0,-17000),(20160928,578,377,3,-13000),(20160928,579,132,17,4500),(20160928,580,137,24,15000),(20160928,581,0,0,-1500),(20160928,582,73,64,85000),(20160928,583,148,23,7000),(20160928,584,109,22,17000),(20160929,557,115,20,11000),(20160929,558,181,6,-3000),(20160929,559,66,35,45000),(20160929,560,0,0,-11000),(20160929,561,358,5,-11000),(20160929,562,159,17,-1000),(20160929,563,215,7,-8000),(20160929,564,999,1,-21000),(20160929,565,0,0,-8000),(20160929,566,95,26,23000),(20160929,567,0,0,-500),(20160929,568,171,21,8000),(20160929,569,0,0,-500),(20160929,570,93,38,38000),(20160929,571,98,18,13000),(20160929,572,417,8,-25000),(20160929,573,120,5,2000),(20160929,574,133,17,2500),(20160929,575,154,12,0),(20160929,576,737,2,-24000),(20160929,577,141,14,3000),(20160929,578,238,5,-1000),(20160929,579,110,8,3000),(20160929,580,112,38,31000),(20160929,581,0,0,-500),(20160929,582,0,0,-3000),(20160929,583,142,28,16000),(20160929,584,185,6,-3000),(20160930,557,453,1,-5000),(20160930,558,147,12,-9000),(20160930,559,0,0,-500),(20160930,560,104,26,21000),(20160930,561,274,4,-8000),(20160930,562,82,17,21000),(20160930,563,359,5,-18000),(20160930,564,102,26,22000),(20160930,565,0,0,-12000),(20160930,566,0,0,-9000),(20160930,567,822,1,-13000),(20160930,568,783,1,-9000),(20160930,569,999,1,-28000),(20160930,570,0,0,-9000),(20160930,571,94,19,13000),(20160930,572,117,12,9000),(20160930,573,111,9,5000),(20160930,574,82,25,20000),(20160930,575,0,0,-2500),(20160930,576,216,7,-9000),(20160930,577,73,29,36000),(20160930,578,510,3,-20000),(20160930,579,892,1,-11000),(20160930,580,0,0,-500),(20160930,581,0,0,-11000),(20160930,582,147,6,3000),(20160930,583,95,15,14000),(20160930,584,124,7,1000),(20161001,557,394,4,-26000),(20161001,558,225,5,-7000),(20161001,559,193,7,-4000),(20161001,560,0,0,-10000),(20161001,561,999,1,-19000),(20161001,562,292,4,-11000),(20161001,563,204,9,-9000),(20161001,564,319,4,-12000),(20161001,565,642,2,-20000),(20161001,566,81,26,31500),(20161001,567,76,17,14000),(20161001,568,479,3,-15000),(20161001,569,0,0,-21000),(20161001,570,70,58,70000),(20161001,571,204,10,-5000),(20161001,572,93,45,46000),(20161001,573,0,0,-9000),(20161001,574,0,0,-5000),(20161001,575,91,33,30000),(20161001,576,126,14,7000),(20161001,577,439,5,-26000),(20161001,578,153,11,-3000),(20161001,579,351,6,-22000),(20161001,580,127,14,7000),(20161001,581,132,21,10000),(20161001,582,163,18,-3000),(20161001,583,0,0,-4000),(20161001,584,848,2,-24000),(20161002,557,444,3,-15000),(20161002,558,232,4,-9000),(20161002,559,382,3,-10000),(20161002,560,123,11,8000),(20161002,561,88,38,41000),(20161002,562,207,4,-3000),(20161002,563,122,19,6000),(20161002,564,869,1,-12000),(20161002,565,95,21,20000),(20161002,566,122,11,6000),(20161002,567,151,10,-7000),(20161002,568,0,0,-25000),(20161002,569,348,6,-18000),(20161002,570,248,5,-9000),(20161002,571,410,7,-33000),(20161002,572,127,19,7000),(20161002,573,122,12,7000),(20161002,574,310,5,-13000),(20161002,575,274,4,-9000),(20161002,576,88,20,11000),(20161002,577,451,5,-27000),(20161002,578,127,10,7000),(20161002,579,275,4,-10000),(20161002,580,158,15,0),(20161002,581,239,5,-9000),(20161002,582,175,10,-4000),(20161002,583,143,13,3000),(20161002,584,252,10,-14000),(20161003,557,569,1,-8000),(20161003,558,184,17,0),(20161003,559,0,0,-8000),(20161003,560,465,2,-10000),(20161003,561,0,0,-19000),(20161003,562,158,7,-2000),(20161003,563,159,18,6000),(20161003,564,101,26,20000),(20161003,565,98,17,11000),(20161003,566,236,6,-8000),(20161003,567,344,2,-7000),(20161003,568,154,21,5000),(20161003,569,184,8,-5000),(20161003,570,519,3,-20000),(20161003,571,479,4,-25000),(20161003,572,714,1,-9000),(20161003,573,763,1,-10000),(20161003,574,293,7,-12000),(20161003,575,217,4,-4000),(20161003,576,0,0,-2000),(20161003,577,142,22,13000),(20161003,578,400,2,-9000),(20161003,579,88,37,30000),(20161003,580,128,15,9000),(20161003,581,0,0,-9000),(20161003,582,228,5,-5000),(20161003,583,790,2,-20000),(20161003,584,0,0,-22000);
/*!40000 ALTER TABLE `piainfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piainfoforeva`
--

DROP TABLE IF EXISTS `piainfoforeva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piainfoforeva` (
  `playDate` int(11) NOT NULL,
  `taiNo` int(11) NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `bonusCount` int(11) DEFAULT NULL,
  `ballOutput` int(11) DEFAULT NULL,
  PRIMARY KEY (`playDate`,`taiNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piainfoforeva`
--

LOCK TABLES `piainfoforeva` WRITE;
/*!40000 ALTER TABLE `piainfoforeva` DISABLE KEYS */;
/*!40000 ALTER TABLE `piainfoforeva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taino`
--

DROP TABLE IF EXISTS `taino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taino` (
  `taiNo` int(11) NOT NULL,
  `groupName` text,
  PRIMARY KEY (`taiNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taino`
--

LOCK TABLES `taino` WRITE;
/*!40000 ALTER TABLE `taino` DISABLE KEYS */;
INSERT INTO `taino` VALUES (557,'A'),(558,'A'),(559,'A'),(560,'A'),(561,'A'),(562,'A'),(563,'A'),(564,'B'),(565,'B'),(566,'B'),(567,'B'),(568,'B'),(569,'B'),(570,'B'),(571,'C'),(572,'C'),(573,'C'),(574,'C'),(575,'C'),(576,'C'),(577,'C'),(578,'D'),(579,'D'),(580,'D'),(581,'D'),(582,'D'),(583,'D'),(584,'D');
/*!40000 ALTER TABLE `taino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_satama_all_tai`
--

DROP TABLE IF EXISTS `v_satama_all_tai`;
/*!50001 DROP VIEW IF EXISTS `v_satama_all_tai`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_satama_all_tai` AS SELECT 
 1 AS `playdate`,
 1 AS `totalOutBefore`,
 1 AS `totalOut`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_satama_by_d_t`
--

DROP TABLE IF EXISTS `v_satama_by_d_t`;
/*!50001 DROP VIEW IF EXISTS `v_satama_by_d_t`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_satama_by_d_t` AS SELECT 
 1 AS `playDate`,
 1 AS `taiNo`,
 1 AS `bonusCount`,
 1 AS `rate`,
 1 AS `ballOutput`,
 1 AS `ballInput`,
 1 AS `totalOut`,
 1 AS `totalOutBefore`,
 1 AS `rateN`,
 1 AS `bonusCountN`,
 1 AS `ballOutputN`,
 1 AS `playDateN`,
 1 AS `totalOutN`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_satama_by_playdate`
--

DROP TABLE IF EXISTS `v_satama_by_playdate`;
/*!50001 DROP VIEW IF EXISTS `v_satama_by_playdate`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_satama_by_playdate` AS SELECT 
 1 AS `playDate`,
 1 AS `addday`,
 1 AS `unaddday`,
 1 AS `totalout`,
 1 AS `rateday`,
 1 AS `addtime`,
 1 AS `unaddtime`,
 1 AS `ratetime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_satama_by_taino`
--

DROP TABLE IF EXISTS `v_satama_by_taino`;
/*!50001 DROP VIEW IF EXISTS `v_satama_by_taino`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_satama_by_taino` AS SELECT 
 1 AS `taiNo`,
 1 AS `addball`,
 1 AS `unaddball`,
 1 AS `totalout`,
 1 AS `rateball`,
 1 AS `addtime`,
 1 AS `unaddtime`,
 1 AS `ratetime`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'pia'
--
/*!50003 DROP FUNCTION IF EXISTS `adddays` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `adddays`(intDay INT,adds INT) RETURNS int(11)
BEGIN
	declare result INTEGER;
SELECT 
    DATE_FORMAT(ADDDATE(STR_TO_DATE(intDay, '%Y%m%d'),
                INTERVAL adds DAY),
            '%Y%m%d')
INTO result;
    
RETURN result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `cc`
--

/*!50001 DROP VIEW IF EXISTS `cc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cc` AS select `v`.`playDate` AS `playDate`,`v`.`taiNo` AS `taiNo`,`v`.`rate` AS `rate`,`v`.`bonusCount` AS `bonusCount`,`v`.`ballOutput` AS `ballOutput`,cast(if((`v`.`rate` <> 0),(`v`.`bonusCount` * `v`.`rate`),abs((((`v`.`ballOutput` * 4) / 1000) * 14))) as unsigned) AS `ballinputs`,(select sum(`p`.`ballOutput`) from `piainfo` `p` where ((`v`.`playDate` >= `p`.`playDate`) and (`p`.`taiNo` = `v`.`taiNo`))) AS `totalOut`,ifnull((select sum(`p`.`ballOutput`) from `piainfo` `p` where ((`v`.`playDate` > `p`.`playDate`) and (`p`.`taiNo` = `v`.`taiNo`))),0) AS `totalOutBefore`,format(if((`v`.`rate` = 0),0,(10000 / `v`.`rate`)),0) AS `rateN`,(`v`.`bonusCount` * 10) AS `bonusCountN`,cast((`v`.`ballOutput` / 100) as signed) AS `ballOutputN`,substr(`v`.`playDate`,5) AS `playDateN`,cast(((select sum(`p`.`ballOutput`) from `piainfo` `p` where ((`v`.`playDate` >= `p`.`playDate`) and (`p`.`taiNo` = `v`.`taiNo`))) / 100) as signed) AS `totalOutN` from `piainfo` `v` group by `v`.`taiNo`,`v`.`playDate` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_satama_all_tai`
--

/*!50001 DROP VIEW IF EXISTS `v_satama_all_tai`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_satama_all_tai` AS select distinct `v`.`playDate` AS `playdate`,ifnull((select sum(`p`.`ballOutput`) from `piainfo` `p` where (`p`.`playDate` <= `v`.`playDate`)),0) AS `totalOutBefore`,(select sum(`p`.`ballOutput`) from `piainfo` `p` where (`p`.`playDate` = `v`.`playDate`)) AS `totalOut` from `piainfo` `v` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_satama_by_d_t`
--

/*!50001 DROP VIEW IF EXISTS `v_satama_by_d_t`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_satama_by_d_t` AS select `v`.`playDate` AS `playDate`,`v`.`taiNo` AS `taiNo`,`v`.`bonusCount` AS `bonusCount`,`v`.`rate` AS `rate`,`v`.`ballOutput` AS `ballOutput`,cast(if((`v`.`rate` <> 0),(`v`.`bonusCount` * `v`.`rate`),abs((((`v`.`ballOutput` * 4) / 1000) * 14))) as unsigned) AS `ballInput`,(select sum(`p`.`ballOutput`) from `piainfo` `p` where ((`v`.`playDate` >= `p`.`playDate`) and (`p`.`taiNo` = `v`.`taiNo`))) AS `totalOut`,ifnull((select sum(`p`.`ballOutput`) from `piainfo` `p` where ((`v`.`playDate` > `p`.`playDate`) and (`p`.`taiNo` = `v`.`taiNo`))),0) AS `totalOutBefore`,format(if((`v`.`rate` = 0),0,(10000 / `v`.`rate`)),0) AS `rateN`,(`v`.`bonusCount` * 10) AS `bonusCountN`,cast((`v`.`ballOutput` / 100) as signed) AS `ballOutputN`,substr(`v`.`playDate`,5) AS `playDateN`,cast(((select sum(`p`.`ballOutput`) from `piainfo` `p` where ((`v`.`playDate` >= `p`.`playDate`) and (`p`.`taiNo` = `v`.`taiNo`))) / 100) as signed) AS `totalOutN` from `piainfo` `v` group by `v`.`taiNo`,`v`.`playDate` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_satama_by_playdate`
--

/*!50001 DROP VIEW IF EXISTS `v_satama_by_playdate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_satama_by_playdate` AS select `piainfo`.`playDate` AS `playDate`,sum(if((`piainfo`.`ballOutput` >= 0),`piainfo`.`ballOutput`,0)) AS `addday`,sum(if((`piainfo`.`ballOutput` < 0),`piainfo`.`ballOutput`,0)) AS `unaddday`,sum(`piainfo`.`ballOutput`) AS `totalout`,format((abs((sum(if((`piainfo`.`ballOutput` >= 0),`piainfo`.`ballOutput`,0)) / sum(if((`piainfo`.`ballOutput` < 0),`piainfo`.`ballOutput`,0)))) * 100),0) AS `rateday`,sum(if((`piainfo`.`ballOutput` >= 0),1,0)) AS `addtime`,sum(if((`piainfo`.`ballOutput` < 0),1,0)) AS `unaddtime`,format(((sum(if((`piainfo`.`ballOutput` >= 0),1,0)) / count(`piainfo`.`taiNo`)) * 100),0) AS `ratetime` from `piainfo` group by `piainfo`.`playDate` order by `totalout` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_satama_by_taino`
--

/*!50001 DROP VIEW IF EXISTS `v_satama_by_taino`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_satama_by_taino` AS select `piainfo`.`taiNo` AS `taiNo`,sum(if((`piainfo`.`ballOutput` >= 0),`piainfo`.`ballOutput`,0)) AS `addball`,sum(if((`piainfo`.`ballOutput` < 0),`piainfo`.`ballOutput`,0)) AS `unaddball`,sum(`piainfo`.`ballOutput`) AS `totalout`,format((abs((sum(if((`piainfo`.`ballOutput` >= 0),`piainfo`.`ballOutput`,0)) / sum(if((`piainfo`.`ballOutput` < 0),`piainfo`.`ballOutput`,0)))) * 100),0) AS `rateball`,sum(if((`piainfo`.`ballOutput` >= 0),1,0)) AS `addtime`,sum(if((`piainfo`.`ballOutput` < 0),1,0)) AS `unaddtime`,format(((sum(if((`piainfo`.`ballOutput` >= 0),1,0)) / count(`piainfo`.`taiNo`)) * 100),0) AS `ratetime` from `piainfo` group by `piainfo`.`taiNo` order by `totalout` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-05 10:57:49
