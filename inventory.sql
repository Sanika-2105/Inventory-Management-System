-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2023 at 07:23 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`email`, `password`) VALUES
('admin123@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `logs_processed`
--

CREATE TABLE `logs_processed` (
  `issuer_id` int(20) NOT NULL,
  `issuer_name` varchar(250) NOT NULL,
  `item_id` int(20) NOT NULL,
  `item_name` varchar(250) NOT NULL,
  `quantity` int(150) NOT NULL,
  `date` date NOT NULL,
  `time` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs_processed`
--

INSERT INTO `logs_processed` (`issuer_id`, `issuer_name`, `item_id`, `item_name`, `quantity`, `date`, `time`) VALUES
(1, 'chaitali', 123, 'dinning table', 5, '2023-07-05', '15:36:00.000000'),
(2, 'Neha', 456, 'sofa', 7, '2023-07-06', '17:16:00.000000'),
(3, 'Madhavi', 123, 'dinning table', 5, '2023-01-10', '05:35:00.000000'),
(4, 'Shubhangi', 123, 'dinning table', 4, '2023-07-03', '04:45:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `logs_raw`
--

CREATE TABLE `logs_raw` (
  `issuer_id` int(20) NOT NULL,
  `issuer_name` varchar(250) NOT NULL,
  `item_id` int(20) NOT NULL,
  `item_name` varchar(250) NOT NULL,
  `quantity` int(250) NOT NULL,
  `date` date NOT NULL,
  `time` time(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs_raw`
--

INSERT INTO `logs_raw` (`issuer_id`, `issuer_name`, `item_id`, `item_name`, `quantity`, `date`, `time`) VALUES
(1, 'sanika joshi', 123, 'cotton', 5, '2023-07-12', '02:50:00.0000'),
(2, 'neha', 123, 'cotton', 5, '2023-05-23', '08:03:00.0000'),
(3, 'manasi', 342, 'fabric', 5, '2023-07-10', '17:52:00.0000'),
(4, 'naina', 541, 'timber', 3, '2023-07-03', '20:15:00.0000'),
(5, 'Pooja', 542, 'steel', 6, '2023-07-02', '10:35:00.0000'),
(6, 'kiran', 542, 'steel', 4, '2023-07-11', '20:37:00.0000'),
(7, 'Kaveri', 541, 'timber', 18, '2023-07-04', '22:18:00.0000'),
(9, 'Girish', 123, 'cotton', 10, '2023-07-03', '16:41:00.0000');

-- --------------------------------------------------------

--
-- Table structure for table `processed_item`
--

CREATE TABLE `processed_item` (
  `sr_no` int(20) NOT NULL,
  `id` int(50) NOT NULL,
  `pname` varchar(250) NOT NULL,
  `quantity` int(250) NOT NULL,
  `unit` varchar(250) NOT NULL,
  `cost_per_unit` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `processed_item`
--

INSERT INTO `processed_item` (`sr_no`, `id`, `pname`, `quantity`, `unit`, `cost_per_unit`) VALUES
(1, 123, 'Dinning Table', 10, 'kg', 50),
(3, 456, 'Sofa', 14, 'kg', 100),
(6, 789, 'coffee table', 7, 'kg', 2300);

-- --------------------------------------------------------

--
-- Table structure for table `raw_material`
--

CREATE TABLE `raw_material` (
  `sr_no` int(50) NOT NULL,
  `id` int(50) NOT NULL,
  `rname` varchar(100) NOT NULL,
  `quantity` int(50) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `costpu` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `raw_material`
--

INSERT INTO `raw_material` (`sr_no`, `id`, `rname`, `quantity`, `unit`, `costpu`) VALUES
(6, 541, 'timber', 56, 'kg', 500),
(7, 542, 'steel', 20, 'kg', 75),
(12, 123, 'Cotton', 0, 'kg', 500),
(17, 789, 'wood', 20, 'kg', 100);

-- --------------------------------------------------------

--
-- Table structure for table `superadminlogin`
--

CREATE TABLE `superadminlogin` (
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `superadminlogin`
--

INSERT INTO `superadminlogin` (`email`, `password`) VALUES
('superadmin@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `vapply_raw`
--

CREATE TABLE `vapply_raw` (
  `sr_no` int(50) NOT NULL,
  `vemail` varchar(250) NOT NULL,
  `vname` varchar(250) NOT NULL,
  `id` int(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(100) NOT NULL,
  `unit` varchar(250) NOT NULL,
  `cpu` int(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vapply_raw`
--

INSERT INTO `vapply_raw` (`sr_no`, `vemail`, `vname`, `id`, `name`, `quantity`, `unit`, `cpu`, `status`) VALUES
(1, 'vijay@gmail.com', 'vijay joshi', 123, 'Cotton', 10, 'kg', 500, 'Applied'),
(3, 'vijay@gmail.com', 'vijay joshi', 541, 'timber', 5, 'kg', 500, 'Applied'),
(4, 'vijay@gmail.com', 'vijay joshi', 541, 'timber', 10, 'kg', 500, 'Applied'),
(5, 'vijay@gmail.com', 'vijay joshi', 541, 'timber', 4, 'kg', 200, 'Applied'),
(6, 'neha@gmail.com', 'neha', 541, 'timber', 10, 'kg', 500, 'Applied'),
(7, 'neha@gmail.com', 'neha', 541, 'timber', 10, 'kg', 100, 'Applied'),
(8, 'neha@gmail.com', 'neha', 123, 'Cotton', 5, 'kg', 50, 'approved'),
(9, 'vijay@gmail.com', 'vijay joshi', 123, 'Cotton', 6, 'kg', 100, 'Applied'),
(10, 'vijay@gmail.com', 'vijay joshi', 541, 'timber', 10, 'kg', 150, 'Applied'),
(11, 'neha@gmail.com', 'neha', 541, 'timber', 10, 'kg', 50, 'Applied'),
(12, 'neha@gmail.com', 'neha', 123, 'Cotton', 12, 'kg', 20, 'approved'),
(13, 'chaitu@gmail.com', 'chaitali', 123, 'Cotton', 5, '15', 50, 'Applied'),
(14, 'chaitu@gmail.com', 'chaitali', 541, 'timber', 5, 'kg', 20, 'Applied'),
(15, 'neha@gmail.com', 'neha', 123, 'Cotton', 5, 'kg', 50, 'Applied'),
(16, 'chaitu@gmail.com', 'chaitali', 123, 'Cotton', 5, 'kg', 500, 'Applied'),
(17, 'chaitu@gmail.com', 'chaitali', 123, 'Cotton', 5, 'kg', 500, 'Applied');

-- --------------------------------------------------------

--
-- Table structure for table `vendorlogin`
--

CREATE TABLE `vendorlogin` (
  `vname` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendorlogin`
--

INSERT INTO `vendorlogin` (`vname`, `email`, `password`) VALUES
('vijay joshi', 'vijay@gmail.com', 'abcd'),
('neha', 'neha@gmail.com', '123'),
('chaitali', 'chaitu@gmail.com', 'pqrs');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `logs_processed`
--
ALTER TABLE `logs_processed`
  ADD PRIMARY KEY (`issuer_id`);

--
-- Indexes for table `logs_raw`
--
ALTER TABLE `logs_raw`
  ADD PRIMARY KEY (`issuer_id`);

--
-- Indexes for table `processed_item`
--
ALTER TABLE `processed_item`
  ADD PRIMARY KEY (`sr_no`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `raw_material`
--
ALTER TABLE `raw_material`
  ADD PRIMARY KEY (`sr_no`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `vapply_raw`
--
ALTER TABLE `vapply_raw`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `id` (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `logs_processed`
--
ALTER TABLE `logs_processed`
  MODIFY `issuer_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `logs_raw`
--
ALTER TABLE `logs_raw`
  MODIFY `issuer_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `processed_item`
--
ALTER TABLE `processed_item`
  MODIFY `sr_no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `raw_material`
--
ALTER TABLE `raw_material`
  MODIFY `sr_no` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `vapply_raw`
--
ALTER TABLE `vapply_raw`
  MODIFY `sr_no` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
