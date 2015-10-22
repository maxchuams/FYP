-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- Host: 127.10.27.2:3306
-- Generation Time: Oct 14, 2015 at 05:03 AM
-- Server version: 5.5.45
-- PHP Version: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `recco`
--

-- --------------------------------------------------------

--
-- Table structure for table `bug`
--

CREATE TABLE IF NOT EXISTS `bug` (
  `bugid` int(11) NOT NULL,
  `projectname` varchar(100) NOT NULL,
  `severity` int(11) NOT NULL,
  `flaggerusername` varchar(100) NOT NULL,
  `bugflagdate` date NOT NULL,
  `debuggerusername` varchar(100) DEFAULT NULL,
  `bugresolvedate` date DEFAULT NULL,
  `bugdescription` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`projectname`,`bugid`),
  KEY `bug_fk2` (`debuggerusername`),
  KEY `bug_fk3` (`flaggerusername`),
  KEY `bug_fk4` (`severity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bugcategory`
--

CREATE TABLE IF NOT EXISTS `bugcategory` (
  `severity` int(11) NOT NULL,
  `followupaction` varchar(200) NOT NULL,
  PRIMARY KEY (`severity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `developer`
--

CREATE TABLE IF NOT EXISTS `developer` (
  `username` varchar(100) NOT NULL,
  `employmentdate` date NOT NULL,
  `nationality` varchar(100) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `developer`
--

INSERT INTO `developer` (`username`, `employmentdate`, `nationality`) VALUES
('dev', '2013-06-11', 'Singaporean');

-- --------------------------------------------------------

--
-- Table structure for table `developerskill`
--

CREATE TABLE IF NOT EXISTS `developerskill` (
  `username` varchar(100) NOT NULL,
  `skill` varchar(100) NOT NULL,
  PRIMARY KEY (`username`,`skill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `developerskill`
--

INSERT INTO `developerskill` (`username`, `skill`) VALUES
('dev', 'java'),
('dev', 'mysql');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `projectname` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `projectdescription` varchar(100) NOT NULL,
  `duedate` date NOT NULL,
  `urgency` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`projectname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projectallocation`
--

CREATE TABLE IF NOT EXISTS `projectallocation` (
  `projectname` varchar(100) NOT NULL,
  `developerusername` varchar(100) NOT NULL,
  `dateallocated` date NOT NULL,
  PRIMARY KEY (`projectname`,`developerusername`,`dateallocated`),
  KEY `projectallocation_fk2` (`developerusername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(1) NOT NULL,
  `trellokey` varchar(100) NOT NULL,
  `token` varchar(100) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `type`, `trellokey`, `token`) VALUES
('desg', '1234', 'd', '', ''),
('dev', '1234', 'c', '', ''),
('kaiwen12', '1234', 'p', '7e35111227918de8a37f8c20844ed555', '65095ea4469fc51399471d010e58e2f6a95b2f15c83b9ddea167940939534b0f'),
('pm', '1234', 'p', '', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bug`
--
ALTER TABLE `bug`
  ADD CONSTRAINT `bug_fk` FOREIGN KEY (`projectname`) REFERENCES `project` (`projectname`),
  ADD CONSTRAINT `bug_fk2` FOREIGN KEY (`debuggerusername`) REFERENCES `developer` (`username`),
  ADD CONSTRAINT `bug_fk3` FOREIGN KEY (`flaggerusername`) REFERENCES `user` (`username`),
  ADD CONSTRAINT `bug_fk4` FOREIGN KEY (`severity`) REFERENCES `bugcategory` (`severity`);

--
-- Constraints for table `developer`
--
ALTER TABLE `developer`
  ADD CONSTRAINT `developer_fk` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `developerskill`
--
ALTER TABLE `developerskill`
  ADD CONSTRAINT `developerskill_fk` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `projectallocation`
--
ALTER TABLE `projectallocation`
  ADD CONSTRAINT `projectallocation_fk` FOREIGN KEY (`projectname`) REFERENCES `project` (`projectname`),
  ADD CONSTRAINT `projectallocation_fk2` FOREIGN KEY (`developerusername`) REFERENCES `developer` (`username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
