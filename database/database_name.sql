-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2023 at 01:53 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_name`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `is_active`) VALUES
(1, 'Admin', 'Admin@gmail.com', '$2y$10$z/pJ64tXzP0gLXkqiVxpjOz48tL2EagiRT5wHnNxmXAESLL9L2WmG', '0');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Milk'),
(2, 'Sugur Free'),
(3, 'Gift'),
(4, 'Event'),
(5, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(12, 11, '::1', -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(2, 'Cackes'),
(3, 'Chocolate'),
(4, 'Candy'),
(5, 'Biscuits'),
(6, 'Traditional Sweets'),
(12, 'Snacks');

-- --------------------------------------------------------

--
-- Table structure for table `news_alerts`
--

CREATE TABLE `news_alerts` (
  `N_id` int(11) NOT NULL,
  `News_caption` varchar(255) NOT NULL,
  `News` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news_alerts`
--

INSERT INTO `news_alerts` (`N_id`, `News_caption`, `News`) VALUES
(1, 'Offer', 'Today 10% off'),
(2, 'Offer', 'Today 10% off');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 20, 11, 1, '4VA72034N46142722', 'Completed'),
(2, 17, 11, 1, '43M312529B2048438', 'Completed'),
(3, 17, 12, 2, '73J051624B3830737', 'Completed'),
(4, 21, 11, 1, '5TV577574B311952T', 'Completed'),
(5, 21, 11, 1, '88X56730HS348994P', 'Completed'),
(6, 22, 15, 1, '85Y33037MN1103547', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_qty`, `product_desc`, `product_image`, `product_keywords`) VALUES
(11, 2, 5, 'Chocolate cake', 105, 5, 'Chocolate cake or chocolate gâteau is a cake flavored with melted chocolate, cocoa powder, or both.', '1654406349_chocolate cake.jpg', 'cakes'),
(12, 2, 5, 'Stawbery cake', 120, 6, 'Cream cheese, sour cream, freeze dried strawberries, cake', '1654406471_fresh-strawberry-cake-3.jpg', 'strawberry'),
(13, 2, 5, 'vanila cake', 1250, 6, 'Made from scratch with only a handful of ingredients, ', '1654406597_vanila.jpg', 'vanila'),
(14, 3, 3, 'Kandos', 350, 20, 'A delightful blend of finest grade cocoa butter with no added sugar, dedicated to tantalize the health conscious chocolate ', '1654406708_kandos.jpeg', 'kandos'),
(15, 3, 2, 'kit kat', 420, 15, 'KitKat is the first global chocolate brand to use 100% sustainably sourced cocoa through the Nestlé Cocoa Plan', '1654406830_kit kat.jpg', 'kit kat'),
(16, 3, 3, 'Revello chocolate', 270, 100, 'Handcrafted individually by our very own Chocolatiers using the finest ingredients,', '1654407093_114293--1--1638985032.jpeg', 'revello'),
(17, 3, 5, 'Risberry', 30, 15, 'Dark chocolate bar filled with a raspberry ganache and pieces', '1654407177_risbarry.jpeg', 'risberry'),
(18, 4, 5, 'Double bubble', 150, 100, 'Candy Coated Dubble Bubble Gumballs are available in dozens of great flavors', '1654407292_Double Bubble.jpg', 'Double bubble'),
(19, 4, 5, 'Jelly belly', 120, 10, 'this is temporary description', '1654407398_jelly belly.jpg', 'jelly belly'),
(20, 4, 5, 'Pop Rocks', 35, 10, 'this is temporary description', '1654407448_pop-rocks-chocolate.jpg', 'Pop Rocks'),
(22, 6, 1, 'Rasgulla', 15, 100, 'this is temporary description', '1654407534_rasgulla.jpg', 'Rasgulla'),
(23, 6, 1, 'Misthi', 150, 100, 'this is temporary description', '1654407570_Mishti_Doi.jpg', 'Misthi'),
(24, 12, 5, 'Butter finger', 150, 100, 'Butterfinger.', '1654407752_butterfinger.jpg', 'butter finger'),
(25, 4, 5, 'Twix', 150, 100, ' Twix is chocolate bar', '1654407846_twix.jpg', 'twixs'),
(26, 5, 3, 'Oreo', 375, 100, 'Kraft Biscuit Oreo Chocolate Cream 133G.', '1654407973_OREO.jpg', 'oreo');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(17, 'Asiri', 'Shamika', 'shamikaasiri@gmail.com', 'bcfa947721405299da40c070b7e0dc4b', '0771968585', 'harshika', 'pannalawela'),
(18, 'asiri', 'test', 'asiritest@gmail.com', 'bcfa947721405299da40c070b7e0dc4b', '0769299990', 'harshika pannalawela', 'lunuwatte'),
(19, 'chamudi', 'test', 'chamuditest@gmail.com', 'bcfa947721405299da40c070b7e0dc4b', '0771932585', 'lunuwatte', 'welimada'),
(20, 'Asiri', 'Shamika', 'asirirathnayaka@gmail.com', 'bcfa947721405299da40c070b7e0dc4b', '0779299990', 'harshika', 'pannalawela'),
(21, 'Asiri', 'Rathnayaka', 'asiri12@gmail.com', '6cb9e1d17b5ade0908273a1f948c5430', '0779299990', 'harshika', 'pannalawela'),
(22, 'Asiri', 'Rathnayaka', 'asiri123@gmail.com', 'd8550397ee26d664072a0794751a1f10', '0779299990', 'harshika', 'pannalawela');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `news_alerts`
--
ALTER TABLE `news_alerts`
  ADD PRIMARY KEY (`N_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_cat` (`product_cat`),
  ADD KEY `fk_product_brand` (`product_brand`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `news_alerts`
--
ALTER TABLE `news_alerts`
  MODIFY `N_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `fk_product_cat` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
