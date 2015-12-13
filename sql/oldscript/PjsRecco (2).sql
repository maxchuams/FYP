-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 31, 2015 at 01:11 PM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `PjsRecco`
--

-- --------------------------------------------------------

--
-- Table structure for table `defect`
--

CREATE TABLE `defect` (
  `defectid` int(11) NOT NULL,
  `projectname` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `defect`
--

INSERT INTO `defect` (`defectid`, `projectname`, `description`) VALUES
(1, 'Recco', 'Login Issues'),
(2, 'Recco', 'Client complain lag');

-- --------------------------------------------------------

--
-- Table structure for table `developer`
--

CREATE TABLE `developer` (
  `username` varchar(25) NOT NULL,
  `employmentdate` date NOT NULL,
  `nationality` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `developer`
--

INSERT INTO `developer` (`username`, `employmentdate`, `nationality`) VALUES
('kianlam999', '2015-10-30', 'Singapore'),
('maxchuams', '2015-10-30', 'Singapore'),
('recom1', '2011-12-12', 'Thai'),
('recom2', '2012-12-12', 'Thai'),
('recom3', '2013-12-12', 'Thai');

-- --------------------------------------------------------

--
-- Table structure for table `developerskill`
--

CREATE TABLE `developerskill` (
  `username` varchar(25) NOT NULL,
  `skill` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `developerskill`
--

INSERT INTO `developerskill` (`username`, `skill`) VALUES
('kianlam999', 'Custom'),
('kianlam999', 'eCommerce'),
('kianlam999', 'Wordpress'),
('maxchuams', 'Custom'),
('maxchuams', 'eCommerce'),
('maxchuams', 'Wordpress'),
('recom1', 'custom'),
('recom1', 'ecommerce'),
('recom1', 'wordpress'),
('recom2', 'custom'),
('recom2', 'ecommerce'),
('recom2', 'wordpress'),
('recom3', 'ecommerce'),
('recom3', 'wordpress');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `projectname` varchar(25) NOT NULL,
  `trellokey` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `duedate` date NOT NULL,
  `priority` int(11) NOT NULL,
  `type` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`projectname`, `trellokey`, `description`, `duedate`, `priority`, `type`) VALUES
('Candy', '', 'nil', '2015-02-10', 3, 'ecommerce'),
('Fathership', '', 'nil', '2015-06-29', 3, 'wordpress'),
('LowPriority', '', 'nil', '2015-02-10', 1, 'ecommerce'),
('Recco', '', 'nil', '2015-06-10', 3, 'ecommerce'),
('test', '56137e7e470430f726e102f7', 'testing', '2015-11-02', 1, 'Wordpress'),
('test update', '56331c27fb42a2198aed0420', '', '2015-12-25', 1, 'Wordpress'),
('unassigned', '56325bd2561eeee2e39ee446', '', '2015-11-13', 1, 'Wordpress');

-- --------------------------------------------------------

--
-- Table structure for table `projectallocation`
--

CREATE TABLE `projectallocation` (
  `projectname` varchar(25) NOT NULL,
  `developerusername` varchar(25) NOT NULL,
  `dateallocated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projectallocation`
--

INSERT INTO `projectallocation` (`projectname`, `developerusername`, `dateallocated`) VALUES
('Fathership', 'recom1', '2015-06-12'),
('Candy', 'recom2', '2015-01-10'),
('Recco', 'recom2', '2015-05-10'),
('LowPriority', 'recom3', '2014-03-03');

-- --------------------------------------------------------

--
-- Table structure for table `projectfunction`
--

CREATE TABLE `projectfunction` (
  `projectname` varchar(25) NOT NULL,
  `function` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `type` varchar(1) NOT NULL,
  `trellokey` varchar(100) DEFAULT NULL,
  `trellotoken` varchar(100) DEFAULT NULL,
  `photo` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `type`, `trellokey`, `trellotoken`, `photo`) VALUES
('admin', 'admin', 's', NULL, NULL, ''),
('kaiwen12', '1234', 'p', '7e35111227918de8a37f8c20844ed555', '65095ea4469fc51399471d010e58e2f6a95b2f15c83b9ddea167940939534b0f', ''),
('kianlam999', '1234', 'c', '', '', ''),
('maxchuams', '1234', 'c', 'f806c2eb70886448614862e25802b8e6', 'a69f8bdf17d4a09cefde04ea4275b6b5d45005a74ec6cd2f5527932920537439', ''),
('recom1', 'test', 'c', '', '', ''),
('recom2', 'test', 'c', '', '', ''),
('recom3', 'test', 'c', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `defect`
--
ALTER TABLE `defect`
  ADD PRIMARY KEY (`projectname`,`defectid`);

--
-- Indexes for table `developer`
--
ALTER TABLE `developer`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `developerskill`
--
ALTER TABLE `developerskill`
  ADD PRIMARY KEY (`username`,`skill`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`projectname`);

--
-- Indexes for table `projectallocation`
--
ALTER TABLE `projectallocation`
  ADD PRIMARY KEY (`projectname`,`developerusername`,`dateallocated`),
  ADD KEY `pallo_fk2` (`developerusername`);

--
-- Indexes for table `projectfunction`
--
ALTER TABLE `projectfunction`
  ADD PRIMARY KEY (`projectname`,`function`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `defect`
--
ALTER TABLE `defect`
  ADD CONSTRAINT `defects_fk` FOREIGN KEY (`projectname`) REFERENCES `project` (`projectname`);

--
-- Constraints for table `developer`
--
ALTER TABLE `developer`
  ADD CONSTRAINT `developer_fk` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `developerskill`
--
ALTER TABLE `developerskill`
  ADD CONSTRAINT `dskill_fk` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `projectallocation`
--
ALTER TABLE `projectallocation`
  ADD CONSTRAINT `pallo_fk` FOREIGN KEY (`projectname`) REFERENCES `project` (`projectname`),
  ADD CONSTRAINT `pallo_fk2` FOREIGN KEY (`developerusername`) REFERENCES `developer` (`username`);

--
-- Constraints for table `projectfunction`
--
ALTER TABLE `projectfunction`
  ADD CONSTRAINT `pfunction_fk` FOREIGN KEY (`projectname`) REFERENCES `project` (`projectname`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
