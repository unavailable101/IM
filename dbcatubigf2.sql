-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2024 at 06:10 PM
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
-- Database: `dbcatubigf2`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblaccount`
--

CREATE TABLE `tblaccount` (
  `accountID` int(10) NOT NULL,
  `firstName` text NOT NULL,
  `lastName` text NOT NULL,
  `username` varchar(30) NOT NULL,
  `age` int(2) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblaccount`
--

INSERT INTO `tblaccount` (`accountID`, `firstName`, `lastName`, `username`, `age`, `gender`, `email`, `password`) VALUES
(1, 'test', 'test', 'ninz', 20, 'MALE', 'marga18nins@gmail.com', '$2y$10$QkDJjjl8XHDC4uqHYqpA2ew1YYgnbRBzbkdUWoRlffrPcLOE7omdO'),
(2, 'test', 'test', 'rozy', 20, 'MALE', 'maku@gmail.com', '$2y$10$rw.Ff1m.DgasfN1G8b7cXOIe6P7nORT/oHa0TjyTQ7ecgH7/vze96');

-- --------------------------------------------------------

--
-- Table structure for table `tbladminaccount`
--

CREATE TABLE `tbladminaccount` (
  `adminID` int(5) NOT NULL,
  `organizationID` int(5) NOT NULL,
  `accountID` int(10) NOT NULL,
  `adminStatusID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbladminaccount`
--

INSERT INTO `tbladminaccount` (`adminID`, `organizationID`, `accountID`, `adminStatusID`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbladminstatus`
--

CREATE TABLE `tbladminstatus` (
  `adminStatusID` int(100) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  `accountID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbladminstatus`
--

INSERT INTO `tbladminstatus` (`adminStatusID`, `isAdmin`, `accountID`) VALUES
(1, 1, 1),
(2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblevents`
--

CREATE TABLE `tblevents` (
  `eventID` int(10) NOT NULL,
  `eventName` text NOT NULL,
  `eventType` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `venue` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=REDUNDANT;

--
-- Dumping data for table `tblevents`
--

INSERT INTO `tblevents` (`eventID`, `eventName`, `eventType`, `date`, `time`, `venue`) VALUES
(1, ' test ', ' test ', '2024-04-13', '16:45:00', ' testing lng ka dae, basta naa ka dire'),
(2, '  ', '  ', '0000-00-00', '00:00:00', ' '),
(3, ' hi ', ' hello ', '2020-02-20', '00:00:00', ' ');

-- --------------------------------------------------------

--
-- Table structure for table `tblorganization`
--

CREATE TABLE `tblorganization` (
  `organizationID` int(5) NOT NULL,
  `organizationName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblorganization`
--

INSERT INTO `tblorganization` (`organizationID`, `organizationName`) VALUES
(1, 'mahalq'),
(2, 'asd');

-- --------------------------------------------------------

--
-- Table structure for table `tbluseraccount`
--

CREATE TABLE `tbluseraccount` (
  `userID` int(5) NOT NULL,
  `accountID` int(10) NOT NULL,
  `adminStatusID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbluseraccount`
--

INSERT INTO `tbluseraccount` (`userID`, `accountID`, `adminStatusID`) VALUES
(1, 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblaccount`
--
ALTER TABLE `tblaccount`
  ADD PRIMARY KEY (`accountID`);

--
-- Indexes for table `tbladminaccount`
--
ALTER TABLE `tbladminaccount`
  ADD PRIMARY KEY (`adminID`),
  ADD KEY `deleting_accnt` (`accountID`),
  ADD KEY `delete_organization` (`organizationID`),
  ADD KEY `delete_adminStatus` (`adminStatusID`);

--
-- Indexes for table `tbladminstatus`
--
ALTER TABLE `tbladminstatus`
  ADD PRIMARY KEY (`adminStatusID`);

--
-- Indexes for table `tblevents`
--
ALTER TABLE `tblevents`
  ADD PRIMARY KEY (`eventID`);

--
-- Indexes for table `tblorganization`
--
ALTER TABLE `tblorganization`
  ADD PRIMARY KEY (`organizationID`);

--
-- Indexes for table `tbluseraccount`
--
ALTER TABLE `tbluseraccount`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `deleting_user-accnt` (`accountID`),
  ADD KEY `delete_userStatus` (`adminStatusID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblaccount`
--
ALTER TABLE `tblaccount`
  MODIFY `accountID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbladminaccount`
--
ALTER TABLE `tbladminaccount`
  MODIFY `adminID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbladminstatus`
--
ALTER TABLE `tbladminstatus`
  MODIFY `adminStatusID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblevents`
--
ALTER TABLE `tblevents`
  MODIFY `eventID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblorganization`
--
ALTER TABLE `tblorganization`
  MODIFY `organizationID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbluseraccount`
--
ALTER TABLE `tbluseraccount`
  MODIFY `userID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbladminaccount`
--
ALTER TABLE `tbladminaccount`
  ADD CONSTRAINT `delete_organization` FOREIGN KEY (`organizationID`) REFERENCES `tblorganization` (`organizationID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `deleting_accnt` FOREIGN KEY (`accountID`) REFERENCES `tblaccount` (`accountID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbluseraccount`
--
ALTER TABLE `tbluseraccount`
  ADD CONSTRAINT `deleting_user-accnt` FOREIGN KEY (`accountID`) REFERENCES `tblaccount` (`accountID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
