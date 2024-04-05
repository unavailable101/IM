-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2024 at 04:19 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbcatubigf2`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladminaccount`
--

CREATE TABLE `tbladminaccount` (
  `admin` int(5) NOT NULL,
  `organizationID` int(10) NOT NULL,
  `firstName` text NOT NULL,
  `lastName` text NOT NULL,
  `username` varchar(50) NOT NULL,
  `age` int(2) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbladminstatus`
--

CREATE TABLE `tbladminstatus` (
  `adminID` int(11) NOT NULL,
  `adminStatusID` int(11) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblorganization`
--

CREATE TABLE `tblorganization` (
  `organizationID` int(10) NOT NULL,
  `organizationName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbluseraccount`
--

CREATE TABLE `tbluseraccount` (
  `userID` int(5) NOT NULL,
  `firstName` text NOT NULL,
  `lastName` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `age` int(2) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladminaccount`
--
ALTER TABLE `tbladminaccount`
  ADD PRIMARY KEY (`admin`),
  ADD KEY `orgID` (`organizationID`);

--
-- Indexes for table `tbladminstatus`
--
ALTER TABLE `tbladminstatus`
  ADD PRIMARY KEY (`adminStatusID`);

--
-- Indexes for table `tblorganization`
--
ALTER TABLE `tblorganization`
  ADD PRIMARY KEY (`organizationID`);

--
-- Indexes for table `tbluseraccount`
--
ALTER TABLE `tbluseraccount`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladminaccount`
--
ALTER TABLE `tbladminaccount`
  MODIFY `admin` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbladminstatus`
--
ALTER TABLE `tbladminstatus`
  MODIFY `adminStatusID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblorganization`
--
ALTER TABLE `tblorganization`
  MODIFY `organizationID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbluseraccount`
--
ALTER TABLE `tbluseraccount`
  MODIFY `userID` int(5) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbladminaccount`
--
ALTER TABLE `tbladminaccount`
  ADD CONSTRAINT `orgID` FOREIGN KEY (`organizationID`) REFERENCES `tblorganization` (`organizationID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
