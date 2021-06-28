-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 28, 2021 at 03:37 PM
-- Server version: 8.0.21
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_schema`
--

-- --------------------------------------------------------

--
-- Table structure for table `orderitems_table`
--

DROP TABLE IF EXISTS `orderitems_table`;
CREATE TABLE IF NOT EXISTS `orderitems_table` (
  `orderitem_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `variant_id` int NOT NULL,
  `count` int NOT NULL,
  PRIMARY KEY (`orderitem_id`),
  UNIQUE KEY `orderitems_table_orderitem_id_uindex` (`orderitem_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orderitems_table`
--

INSERT INTO `orderitems_table` (`orderitem_id`, `order_id`, `variant_id`, `count`) VALUES
(1, 2, 1, 2),
(2, 1, 3, 1),
(3, 3, 1, 1),
(4, 4, 1, 2),
(5, 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_table`
--

DROP TABLE IF EXISTS `order_table`;
CREATE TABLE IF NOT EXISTS `order_table` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `order_time` date NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_table_order_id_uindex` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_table`
--

INSERT INTO `order_table` (`order_id`, `user_id`, `order_time`) VALUES
(1, 2, '2021-06-01'),
(2, 3, '2021-06-26'),
(3, 2, '2020-10-01'),
(4, 1, '2021-06-27');

-- --------------------------------------------------------

--
-- Table structure for table `product_table`
--

DROP TABLE IF EXISTS `product_table`;
CREATE TABLE IF NOT EXISTS `product_table` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` text NOT NULL,
  `features` text,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_table_product_id_uindex` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_table`
--

INSERT INTO `product_table` (`product_id`, `product_name`, `features`) VALUES
(1, 'گوشی موبایل سامسونگ مدل Galaxy A51 SM-A515F/DSN', 'دو سیم کارت ظرفیت 128گیگابایت'),
(2, 'گوشی موبایل اپل مدل iPhone 12 A2404', 'دو سیم‌ کارت ظرفیت 128 گیگابایت'),
(3, 'گوشی موبایل شیائومی مدل POCO X3 Pro M2102J20SG', 'دو سیم‌ کارت ظرفیت 256 گیگابایت و 8 گیگابایت رم'),
(4, 'گوشی موبایل سامسونگ مدل Galaxy A21S SM-A217F/DS', 'دو سیم‌کارت ظرفیت 64 گیگابایت');

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
CREATE TABLE IF NOT EXISTS `user_table` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` text NOT NULL,
  `user_phone_num` int NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_table_id_uindex` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`user_id`, `user_name`, `user_phone_num`) VALUES
(1, 'فرزانه فخریان', 1234),
(2, 'کیانا اکبری', 3456),
(3, 'مریم باقری', 12345);

-- --------------------------------------------------------

--
-- Table structure for table `variant_table`
--

DROP TABLE IF EXISTS `variant_table`;
CREATE TABLE IF NOT EXISTS `variant_table` (
  `variant_id` int NOT NULL AUTO_INCREMENT,
  `variant_color` text NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`variant_id`),
  UNIQUE KEY `variant_table_variant_id_uindex` (`variant_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `variant_table`
--

INSERT INTO `variant_table` (`variant_id`, `variant_color`, `product_id`) VALUES
(1, 'آبی', 2),
(2, 'مشکی', 1),
(3, 'مشکی', 2),
(4, 'خاکستری', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
