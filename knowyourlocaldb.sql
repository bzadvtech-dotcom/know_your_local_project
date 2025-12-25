-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2025 at 09:05 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `knowyourlocaldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `CommentID` int(5) NOT NULL,
  `commenttext` varchar(256) NOT NULL,
  `createdat` varchar(256) NOT NULL,
  `purpose` varchar(256) NOT NULL,
  `placeID` int(5) NOT NULL,
  `CustomerID` int(5) NOT NULL,
  `likeID` int(5) NOT NULL,
  `logID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(5) NOT NULL,
  `name` varchar(56) NOT NULL,
  `neighbourhood` varchar(256) NOT NULL,
  `pic` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `name`, `neighbourhood`, `pic`) VALUES
(0, 'Jerry', 'Mt Edward', 'https://wallpapercave.com/wp/wp2162055.jpg'),
(2, 'Josh', 'Mt Wellington', 'https://images4.alphacoders.com/139/thumb-1920-1390092.jpg'),
(6, 'Summer', 'Epsom', 'https://tse3.mm.bing.net/th/id/OIP.DC7mwlxVn8QegdrsIqm3xgHaKw?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3'),
(7, 'Auther', 'Central Auckland', 'https://tse1.mm.bing.net/th/id/OIP.jMBvY815E6bsXFRjdSzxFQHaEp?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3'),
(8, 'John', 'Wellington', 'https://tse1.mm.bing.net/th/id/OIP._a9YQ8RQGypGg9uuoCwzrAHaE7?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3'),
(9, 'Mo', 'Wellington', 'https://i.pinimg.com/736x/31/d3/95/31d3950a260e8323825c35efc8772a5c.jpg'),
(10, 'Jack', 'Mt Eden', 'https://tse4.mm.bing.net/th/id/OIF.3zchdXQTB0a49XyqcZtznw?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3'),
(11, 'Shaw', 'Auckland', 'https://tse1.mm.bing.net/th/id/OIF.lwfs5wn98lHquoU6e24y0g?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3'),
(12, 'Kylie', 'Avondale', 'https://sailawaymagazine.com/wp-content/uploads/2025/02/celebrity-beyond-kate.jpg'),
(999, 'Mat', 'Wellington', 'https://www.siia.net/wp-content/uploads/2022/10/Matt-Person_Graded-7-of-11-2-scaled.jpg'),
(1001, 'Kate', 'Auckland', 'https://tse2.mm.bing.net/th/id/OIP.4RpE4fKUk2KYwMLdpSP73AHaLH?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3'),
(156789, 'Julia', 'Mt Eden', 'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1RIhcN.img?w=768&h=455&m=6&x=435&y=118&s=175&d=175'),
(2147483647, 'Luxon', 'Botany', 'https://tse3.mm.bing.net/th/id/OIP.6tswY8bohZJaNRtfQpkdmAHaG7?cb=ucfimg2&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3');

-- --------------------------------------------------------

--
-- Table structure for table `moderationlog`
--

CREATE TABLE `moderationlog` (
  `logID` int(5) NOT NULL,
  `timestamp` varchar(56) NOT NULL,
  `placeID` int(5) NOT NULL,
  `adminID` int(5) NOT NULL,
  `actiontaken` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `placeID` int(5) NOT NULL,
  `name` varchar(56) NOT NULL,
  `reason` varchar(256) NOT NULL,
  `CustomerID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`placeID`, `name`, `reason`, `CustomerID`) VALUES
(1001, 'Sydney', 'A great place', 1),
(1256, 'Auckland', 'A lot of fun', 0),
(5465, 'Melbourne', 'I like this place', 0);

-- --------------------------------------------------------

--
-- Table structure for table `reactions`
--

CREATE TABLE `reactions` (
  `likeID` int(5) NOT NULL,
  `reaction` varchar(526) NOT NULL,
  `CustomerID` int(5) NOT NULL,
  `placeName` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reactions`
--

INSERT INTO `reactions` (`likeID`, `reaction`, `CustomerID`, `placeName`) VALUES
(1, 'Super enjoy', 0, 'Auckland'),
(2, 'Super enjoy', 1, 'Sydney'),
(3, 'lovely', 0, 'Wellington');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `name` varchar(56) NOT NULL,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`) VALUES
(0, 'Tom', '1234'),
(1001, 'Tom', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`CommentID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `moderationlog`
--
ALTER TABLE `moderationlog`
  ADD PRIMARY KEY (`logID`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`placeID`);

--
-- Indexes for table `reactions`
--
ALTER TABLE `reactions`
  ADD PRIMARY KEY (`likeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
