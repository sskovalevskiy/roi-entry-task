-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: products
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` INT(11)     NOT NULL AUTO_INCREMENT,
  `category`    VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories`
  DISABLE KEYS */;
INSERT INTO `categories` VALUES (1, 'Java'), (2, 'Java EE'), (3, 'Hibernate'), (4, 'Spring'), (5, 'C++');
/*!40000 ALTER TABLE `categories`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_categories` (
  `product_id`  INT(11) NOT NULL,
  `category_id` INT(11) NOT NULL,
  PRIMARY KEY (`product_id`, `category_id`),
  KEY `category_fk_idx` (`category_id`),
  CONSTRAINT `category_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories`
  DISABLE KEYS */;
INSERT INTO `product_categories`
VALUES (1, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1),
  (8, 2), (11, 2), (13, 2), (5, 3), (2, 4), (15, 5), (16, 5);
/*!40000 ALTER TABLE `product_categories`
  ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `product_id`  INT(11)      NOT NULL,
  `title`       VARCHAR(200) NOT NULL,
  `description` VARCHAR(1000) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products`
  DISABLE KEYS */;
INSERT INTO `products` VALUES (1, 'Шилдт Г. \"Java. Полное руководство\"', 'ISBN: 978-5-6040043-6-4 Год издания: 2018'),
  (2, 'Уоллс Крейг \"Spring в действии\"', 'ISBN: 978-5-94074-568-6 Год издания: 2015'),
  (3, 'Коузен К. \"Современный Java: Рецепты программирования\"', 'ISBN: 978-5-97060-134-1\r Год издания: 2018'),
  (4, 'Элегантные объекты. Java Edition', 'ISBN: 978-5-4461-0801-5 Год издания: 2018'),
  (5, 'Кинг Г., Бауэр К. \"Java Persistence API и Hibernate\"', 'ISBN: 978-5-97060-180-8 Год издания: 2017'),
  (6, 'Блох Джошуа \"Java. Эффективное программирование\"', 'ISBN: 978-5-85582-347-9 Год издания: 2014'),
  (7, 'Дэвид Флэнаган \"Дэвид Флэнаган Java в примерах. Справочник\"', 'ISBN: 5-93286-042-1 Год издания: 2003'),
  (8, 'Энтони Гонсалвес \"Изучаем Java EE 7\"', 'ISBN: 978-5-496-00942-3 Год издания: 2014'),
  (9, 'Бэзинс Б. \"Java для начинающих. Объектно-ориентированный подход\"', 'ISBN: 978-5-496-02402-0\r Год издания: 2018'),
  (10, 'Хорстманн К.С. \"Java. Библиотека профессионала. Руководство. Том 1: Основы\"', 'ISBN: 978-5-8459-2084-3 Год издания: 2018'),
  (11, 'Дашнер С. \"Изучаем Java EE. Современное программирование для больших предприятий\"', 'ISBN: 978-5-4461-0774-2 Год издания: 2018'),
  (12, 'Хорстманн Кей С. Java. Библиотека профессионала. Руководство. Том 2: Расширенные средства программирования', 'ISBN: 978-5-9909445-0-3 Год издания: 2018'),
  (13, 'Хеффельфингер Дэвид \"Java EE 7 и сервер приложений GlassFish 4. Руководство\"', 'ISBN: 978-5-97060-332-1 Год издания: 2016'),
  (14, 'Обработка естественного языка на Java. Исследование разных подходов к организации и извлечению полезной текстовой информации из неструктурированных данных с использованием Java', 'ISBN: 978-5-97060-331-4 Год издания: 2016'),
  (15, 'Шилдт Герберт \"C++. Полное руководство\"', 'ISBN: 978-5-8459-2140-6 Год издания: 2018'),
  (16, 'Страуструп Б. \"Язык программирования C++. Специальное издание\"', 'ISBN: 5-7989-0223-4 Год издания: 2017');
/*!40000 ALTER TABLE `products`
  ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2018-08-14 16:12:58
