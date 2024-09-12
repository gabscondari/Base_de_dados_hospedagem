CREATE DATABASE  IF NOT EXISTS `hospedar_bd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospedar_bd`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: hospedar_bd
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `academic_semester`
--

DROP TABLE IF EXISTS `academic_semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_semester` (
  `id_semester` int NOT NULL,
  `year_calendar` int NOT NULL,
  `term` varchar(128) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id_semester`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_semester`
--

LOCK TABLES `academic_semester` WRITE;
/*!40000 ALTER TABLE `academic_semester` DISABLE KEYS */;
/*!40000 ALTER TABLE `academic_semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefone` varchar(50) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Dark Silva','darksilva@gmail.com','4254195','123.456.789-00'),(2,'Pedrita Santos','pedritasantos@gmail.com','4250751','987.654.321-11'),(3,'Lola Andrade','lolaandrade@gmail.com','4251112','123.789.654-99');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AposDeletarCliente` AFTER DELETE ON `cliente` FOR EACH ROW BEGIN
    INSERT INTO LogExclusaoCliente (id_cliente, nome_cliente)
    VALUES (OLD.id_cliente, OLD.nome);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `course_edition`
--

DROP TABLE IF EXISTS `course_edition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_edition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_semester` int NOT NULL,
  `fk_professor` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_semester` (`fk_semester`),
  KEY `fk_professor` (`fk_professor`),
  CONSTRAINT `course_edition_ibfk_1` FOREIGN KEY (`fk_semester`) REFERENCES `academic_semester` (`id_semester`),
  CONSTRAINT `course_edition_ibfk_2` FOREIGN KEY (`fk_professor`) REFERENCES `professor` (`id_professor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_edition`
--

LOCK TABLES `course_edition` WRITE;
/*!40000 ALTER TABLE `course_edition` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_edition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospedagem`
--

DROP TABLE IF EXISTS `hospedagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospedagem` (
  `id_hospedagem` int NOT NULL,
  `id_hotel` int NOT NULL,
  `id_cliente` int NOT NULL,
  `id_quarto` int NOT NULL,
  `data_checkin` date NOT NULL,
  `data_checkout` date NOT NULL,
  `valor_total_hospedagem` float NOT NULL,
  `status_hospedagem` varchar(50) NOT NULL,
  `checkin_realizado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_hospedagem`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_quarto` (`id_quarto`),
  KEY `id_hotel` (`id_hotel`),
  CONSTRAINT `hospedagem_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `hospedagem_ibfk_2` FOREIGN KEY (`id_quarto`) REFERENCES `quarto` (`id_quarto`),
  CONSTRAINT `hospedagem_ibfk_3` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id_hotel`),
  CONSTRAINT `hospedagem_chk_1` CHECK ((`status_hospedagem` in (_utf8mb4'reserva',_utf8mb4'finalizada',_utf8mb4'hospedado',_utf8mb4'cancelada')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospedagem`
--

LOCK TABLES `hospedagem` WRITE;
/*!40000 ALTER TABLE `hospedagem` DISABLE KEYS */;
INSERT INTO `hospedagem` VALUES (11,1,1,10,'2024-06-07','2024-06-15',450,'finalizada',NULL),(12,2,2,20,'2024-06-08','2024-06-11',600,'reserva',NULL),(13,1,3,30,'2024-06-09','2024-06-10',750,'reserva',NULL),(14,2,1,40,'2024-06-11','2024-06-13',1000,'reserva',NULL),(15,1,2,50,'2024-06-07','2024-06-10',800,'reserva',NULL),(16,2,3,60,'2024-05-29','2024-05-31',600,'finalizada',NULL),(17,1,1,70,'2024-05-25','2024-05-29',800,'finalizada',NULL),(18,2,2,80,'2024-05-20','2024-05-28',1000,'finalizada',NULL),(19,1,3,90,'2024-05-20','2024-05-22',500,'finalizada',NULL),(21,2,1,100,'2024-05-21','2024-05-25',900,'finalizada',NULL),(22,1,2,10,'2024-05-24','2024-05-26',500,'cancelada',NULL),(23,2,3,20,'2024-05-19','2024-05-22',700,'cancelada',NULL),(24,1,1,30,'2024-05-21','2024-05-20',900,'cancelada',NULL),(25,2,2,40,'2024-06-01','2024-06-05',650,'cancelada',NULL),(26,1,3,50,'2024-06-03','2024-06-06',550,'cancelada',NULL),(27,2,1,60,'2024-05-05','2024-05-15',1000,'hospedado',NULL),(28,1,2,70,'2024-05-06','2024-05-13',1200,'hospedado',NULL),(29,2,3,80,'2024-05-05','2024-05-10',700,'hospedado',NULL),(31,1,1,90,'2024-05-07','2024-05-10',800,'hospedado',NULL),(32,2,2,100,'2024-05-01','2024-05-05',1200,'hospedado',NULL);
/*!40000 ALTER TABLE `hospedagem` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AntesDeInserirHospedagem` BEFORE INSERT ON `hospedagem` FOR EACH ROW BEGIN
    DECLARE quarto_ocupado INT;
    
    -- Verifica se o quarto está ocupado na data de check-in
    SELECT COUNT(*) INTO quarto_ocupado
    FROM Hospedagem
    WHERE id_quarto = NEW.id_quarto
      AND status_hospedagem IN ('reserva', 'hospedado')
      AND (NEW.data_checkin BETWEEN data_checkin AND data_checkout
           OR NEW.data_checkout BETWEEN data_checkin AND data_checkout
           OR (data_checkin BETWEEN NEW.data_checkin AND NEW.data_checkout)
           OR (data_checkout BETWEEN NEW.data_checkin AND NEW.data_checkout));
    
    -- Se o quarto estiver ocupado, cancela a inserção
    IF quarto_ocupado > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O quarto não está disponível na data de check-in especificada.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `id_hotel` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `uf` varchar(10) NOT NULL,
  `ratting` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_hotel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'Golden Park Internacional','Foz do Iguacu','PR','4'),(2,'Lider Palace Hotel','Foz do Iguacu','PR','3');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logexclusaocliente`
--

DROP TABLE IF EXISTS `logexclusaocliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logexclusaocliente` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `nome_cliente` varchar(50) NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logexclusaocliente`
--

LOCK TABLES `logexclusaocliente` WRITE;
/*!40000 ALTER TABLE `logexclusaocliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `logexclusaocliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `id_professor` int NOT NULL,
  `name_professor` varchar(128) NOT NULL,
  `surname_professor` varchar(128) NOT NULL,
  `degree` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  PRIMARY KEY (`id_professor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quarto`
--

DROP TABLE IF EXISTS `quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quarto` (
  `id_quarto` int NOT NULL,
  `id_hotel` int NOT NULL,
  `numero` int NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `preco_diaria` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_quarto`),
  KEY `id_hotel` (`id_hotel`),
  CONSTRAINT `quarto_ibfk_1` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id_hotel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quarto`
--

LOCK TABLES `quarto` WRITE;
/*!40000 ALTER TABLE `quarto` DISABLE KEYS */;
INSERT INTO `quarto` VALUES (1,1,101,'Standard',250),(2,1,102,'Master',300),(10,1,101,'Standard',250),(20,1,102,'Master',300),(30,1,103,'Deluxe',350),(40,1,104,'Standard',250),(50,1,105,'Deluxed',350),(60,2,201,'Casal',150),(70,2,202,'Solteiro',100),(80,2,203,'Familiar',250),(90,2,204,'Familiar',250),(100,2,205,'Casal',150);
/*!40000 ALTER TABLE `quarto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id_student` int NOT NULL AUTO_INCREMENT,
  `name_student` varchar(128) NOT NULL,
  `surname_student` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `birth_date` date NOT NULL,
  `start_date` date NOT NULL,
  PRIMARY KEY (`id_student`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hospedar_bd'
--

--
-- Dumping routines for database 'hospedar_bd'
--
/*!50003 DROP FUNCTION IF EXISTS `TotalHospedagensHotel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `TotalHospedagensHotel`(
    p_hotel_id INT
) RETURNS int
BEGIN
    DECLARE total_hospedagens INT;
    
    SELECT COUNT(*) 
    INTO total_hospedagens
    FROM Hospedagem
    WHERE id_hotel = p_hotel_id;
    
    RETURN total_hospedagens;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ValorMedioDiariasHotel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ValorMedioDiariasHotel`(p_hotel_id INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE v_valor_medio DECIMAL(10, 2);

    SELECT AVG(preco_diaria) INTO v_valor_medio
    FROM Quarto
    WHERE id_hotel = p_hotel_id;

    RETURN v_valor_medio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `VerificarDisponibilidadeQuarto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `VerificarDisponibilidadeQuarto`(p_quarto_id INT, p_data DATE) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE v_disponivel BOOLEAN;

    SELECT CASE
        WHEN EXISTS (
            SELECT 1
            FROM Hospedagem
            WHERE id_quarto = p_quarto_id 
              AND p_data BETWEEN data_checkin AND data_checkout
              AND status_hospedagem IN ('hospedado', 'reserva')
        ) THEN FALSE
        ELSE TRUE
    END INTO v_disponivel;

    RETURN v_disponivel;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CalcularTotalHospedagem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalcularTotalHospedagem`(
    IN p_hospedagem_id INT
)
BEGIN
    DECLARE v_data_checkin DATE;
    DECLARE v_data_checkout DATE;
    DECLARE v_preco_diaria DECIMAL(10, 2);
    DECLARE v_valor_total DECIMAL(10, 2);

    -- Obter as datas de check-in, check-out e o preço da diária
    SELECT data_checkin, data_checkout, preco_diaria
    INTO v_data_checkin, v_data_checkout, v_preco_diaria
    FROM Hospedagem h
    INNER JOIN Quarto q ON h.id_quarto = q.id_quarto
    WHERE h.id_hospedagem = p_hospedagem_id;

    -- Calcular a diferença de dias entre check-in e check-out
    SET v_valor_total = DATEDIFF(v_data_checkout, v_data_checkin) * v_preco_diaria;

    -- Atualizar o valor_total_hospedagem na tabela Hospedagem
    UPDATE Hospedagem
    SET valor_total_hospedagem = v_valor_total
    WHERE id_hospedagem = p_hospedagem_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarCheckIn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarCheckIn`(
    IN p_hospedagem_id INT,
    IN p_data_checkin DATE
)
BEGIN
    UPDATE Hospedagem
    SET data_checkin = p_data_checkin,
        status_hospedagem = 'hospedado'
    WHERE id_hospedagem = p_hospedagem_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarCheckout` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarCheckout`(
    IN p_hospedagem_id INT,
    IN p_data_checkout DATE
)
BEGIN
    -- Atualiza a data de checkout e o status da hospedagem
    UPDATE Hospedagem
    SET data_checkout = p_data_checkout,
        status_hospedagem = 'finalizada'
    WHERE id_hospedagem = p_hospedagem_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-12 10:56:41
