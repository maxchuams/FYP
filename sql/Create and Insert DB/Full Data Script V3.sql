drop schema if exists PjsRecco ;
create schema PjsRecco;
use PjsRecco;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+08:00";

--
-- Database: `PjsRecco`
--

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `color` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`id`, `color`) VALUES
(0, '#878BB6'),
(1, '#4ACAB4'),
(2, '#FF8153'),
(3, '#B6B6B4'),
(4, '#98AFC7'),
(5, '#EDE275'),
(6, '#C58917'),
(7, '#C12267'),
(8, '#E55451'),
(9, '#E56E94'),
(10, '#E0B0FF'),
(11, '#FFEA88'),
(12, '#FF7F50'),
(13, '#7D0552'),
(14, '#FFF5EE'),
(15, '#E9CFEC');

-- --------------------------------------------------------

--
-- Table structure for table `cron`
--

CREATE TABLE `cron` (
  `cronid` int(11) NOT NULL,
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cron`
--

INSERT INTO `cron` (`cronid`, `updatetime`, `state`) VALUES
(1, '2016-04-07 14:18:30', 1),
(2, '2016-04-07 18:52:23', 1),
(3, '2016-04-07 18:54:21', 1),
(4, '2016-04-07 18:56:21', 1),
(5, '2016-04-07 18:58:20', 1),
(6, '2016-04-07 19:00:30', 1),
(7, '2016-04-07 19:02:20', 1),
(8, '2016-04-07 19:04:20', 1),
(9, '2016-04-07 19:06:20', 1),
(10, '2016-04-07 19:08:19', 1),
(11, '2016-04-07 19:10:31', 1),
(12, '2016-04-07 19:12:21', 1),
(13, '2016-04-07 19:14:18', 1),
(14, '2016-04-07 19:16:19', 1),
(15, '2016-04-07 19:18:20', 1),
(16, '2016-04-07 19:20:25', 1),
(17, '2016-04-07 19:22:21', 1),
(18, '2016-04-07 19:24:21', 1),
(19, '2016-04-07 19:26:20', 1),
(20, '2016-04-07 19:28:19', 1),
(21, '2016-04-07 19:30:26', 1),
(22, '2016-04-07 19:32:19', 1),
(23, '2016-04-07 19:34:19', 1),
(24, '2016-04-07 19:36:20', 1),
(25, '2016-04-07 19:38:19', 1),
(26, '2016-04-07 19:40:26', 1),
(27, '2016-04-07 19:42:21', 1),
(28, '2016-04-07 19:44:22', 1),
(29, '2016-04-07 19:46:19', 1),
(30, '2016-04-07 19:48:23', 1),
(31, '2016-04-07 19:50:26', 1),
(32, '2016-04-07 19:52:21', 1),
(33, '2016-04-07 19:54:23', 1),
(34, '2016-04-07 19:56:25', 1),
(35, '2016-04-07 19:58:28', 1),
(36, '2016-04-07 20:00:41', 1),
(37, '2016-04-07 20:02:39', 1),
(38, '2016-04-07 20:04:23', 1),
(39, '2016-04-07 20:06:26', 1),
(40, '2016-04-07 20:08:20', 1),
(41, '2016-04-07 20:10:30', 1),
(42, '2016-04-07 20:12:21', 1),
(43, '2016-04-07 20:14:20', 1),
(44, '2016-04-07 20:16:20', 1),
(45, '2016-04-07 20:18:22', 1),
(46, '2016-04-07 20:20:27', 1),
(47, '2016-04-07 20:22:23', 1),
(48, '2016-04-07 20:24:22', 1),
(49, '2016-04-07 20:26:20', 1),
(50, '2016-04-07 20:28:22', 1),
(51, '2016-04-07 20:30:29', 1),
(52, '2016-04-07 20:32:21', 1),
(53, '2016-04-07 20:34:19', 1),
(54, '2016-04-07 20:36:19', 1),
(55, '2016-04-07 20:38:19', 1),
(56, '2016-04-07 20:40:26', 1),
(57, '2016-04-07 20:42:23', 1),
(58, '2016-04-07 20:44:22', 1),
(59, '2016-04-07 20:46:25', 1),
(60, '2016-04-07 20:48:26', 1),
(61, '2016-04-07 20:50:38', 1),
(62, '2016-04-07 20:52:22', 1),
(63, '2016-04-07 20:54:20', 1),
(64, '2016-04-07 20:56:21', 1),
(65, '2016-04-07 20:58:20', 1),
(66, '2016-04-07 21:00:31', 1),
(67, '2016-04-07 21:02:24', 1),
(68, '2016-04-07 21:04:18', 1),
(69, '2016-04-07 21:06:20', 1),
(70, '2016-04-07 21:08:18', 1),
(71, '2016-04-07 21:10:34', 1),
(72, '2016-04-07 21:12:20', 1),
(73, '2016-04-07 21:14:19', 1),
(74, '2016-04-07 21:16:19', 1),
(75, '2016-04-07 21:18:21', 1),
(76, '2016-04-07 21:20:24', 1),
(77, '2016-04-07 21:22:25', 1),
(78, '2016-04-07 21:24:21', 1),
(79, '2016-04-07 21:26:19', 1),
(80, '2016-04-07 21:28:19', 1),
(81, '2016-04-07 21:30:26', 1),
(82, '2016-04-07 21:32:19', 1),
(83, '2016-04-07 21:34:22', 1),
(84, '2016-04-07 21:36:21', 1),
(85, '2016-04-07 21:38:19', 1),
(86, '2016-04-07 21:40:25', 1),
(87, '2016-04-07 21:42:22', 1),
(88, '2016-04-07 21:44:20', 1),
(89, '2016-04-07 21:46:19', 1),
(90, '2016-04-07 21:48:19', 1),
(91, '2016-04-07 21:50:25', 1),
(92, '2016-04-07 21:52:19', 1),
(93, '2016-04-07 21:54:20', 1),
(94, '2016-04-07 21:56:19', 1),
(95, '2016-04-07 21:58:20', 1),
(96, '2016-04-07 22:00:30', 1),
(97, '2016-04-07 22:02:21', 1),
(98, '2016-04-07 22:04:21', 1),
(99, '2016-04-07 22:06:21', 1),
(100, '2016-04-07 22:08:32', 1),
(101, '2016-04-07 22:10:34', 1),
(102, '2016-04-07 22:12:24', 1),
(103, '2016-04-07 22:14:20', 1),
(104, '2016-04-07 22:16:18', 1),
(105, '2016-04-07 22:18:19', 1),
(106, '2016-04-07 22:20:25', 1),
(107, '2016-04-07 22:22:20', 1),
(108, '2016-04-07 22:24:21', 1),
(109, '2016-04-07 22:26:19', 1),
(110, '2016-04-07 22:28:20', 1),
(111, '2016-04-07 22:30:27', 1),
(112, '2016-04-07 22:32:21', 1),
(113, '2016-04-07 22:34:19', 1),
(114, '2016-04-07 22:36:21', 1),
(115, '2016-04-07 22:38:19', 1),
(116, '2016-04-07 22:40:25', 1),
(117, '2016-04-07 22:42:21', 1),
(118, '2016-04-07 22:44:21', 1),
(119, '2016-04-07 22:46:18', 1),
(120, '2016-04-07 22:48:21', 1),
(121, '2016-04-07 22:50:24', 1),
(122, '2016-04-07 22:52:20', 1),
(123, '2016-04-07 22:54:19', 1),
(124, '2016-04-07 22:56:19', 1),
(125, '2016-04-07 22:58:20', 1),
(126, '2016-04-07 23:00:29', 1),
(127, '2016-04-07 23:02:20', 1),
(128, '2016-04-07 23:04:18', 1),
(129, '2016-04-07 23:06:22', 1),
(130, '2016-04-07 23:08:21', 1),
(131, '2016-04-07 23:10:53', 1),
(132, '2016-04-07 23:12:31', 1),
(133, '2016-04-07 23:14:19', 1),
(134, '2016-04-07 23:16:20', 1),
(135, '2016-04-07 23:18:21', 1),
(136, '2016-04-07 23:20:25', 1),
(137, '2016-04-07 23:22:24', 1),
(138, '2016-04-07 23:24:23', 1),
(139, '2016-04-07 23:26:19', 1),
(140, '2016-04-07 23:28:21', 1),
(141, '2016-04-07 23:30:29', 1),
(142, '2016-04-07 23:32:20', 1),
(143, '2016-04-07 23:34:22', 1),
(144, '2016-04-07 23:36:21', 1),
(145, '2016-04-07 23:38:20', 1),
(146, '2016-04-07 23:40:26', 1),
(147, '2016-04-07 23:42:23', 1),
(148, '2016-04-07 23:44:22', 1),
(149, '2016-04-07 23:46:19', 1),
(150, '2016-04-07 23:48:21', 1),
(151, '2016-04-07 23:50:25', 1),
(152, '2016-04-07 23:52:21', 1),
(153, '2016-04-07 23:54:20', 1),
(154, '2016-04-07 23:56:19', 1),
(155, '2016-04-07 23:58:20', 1),
(156, '2016-04-14 00:01:24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `defect`
--

CREATE TABLE `defect` (
  `defectid` int(11) NOT NULL,
  `projectname` varchar(500) NOT NULL,
  `defectname` varchar(500) NOT NULL,
  `description` varchar(8000) DEFAULT NULL,
  `reportby` varchar(200) NOT NULL,
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `iscomplete` int(11) NOT NULL DEFAULT '0',
  `severity` int(11) NOT NULL DEFAULT '2',
  `duedate` date NOT NULL,
  `assignto` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `defect`
--

INSERT INTO `defect` (`defectid`, `projectname`, `defectname`, `description`, `reportby`, `updatetime`, `iscomplete`, `severity`, `duedate`, `assignto`) VALUES
(1, '(2) Association of Funeral Directors (AFDS)', 'Invalid Form Validation', 'Pls check ss', 'kaiwen12', '2016-04-07 15:24:39', 1, 1, '2016-02-26', 'alexadayandayan'),
(2, 'Full Black Heels [E-Commerce]', 'Form Nav Bar Tpe', 'Typo for "Contract me".', 'kaiwen12', '2016-02-22 09:24:19', 1, 2, '2016-03-02', 'debe2'),
(3, 'Fashmob (E-Commerce)', 'Form Mismatch Requirement', 'Pls check ss', 'kaiwen12', '2016-04-07 15:24:39', 1, 1, '2016-02-26', 'alexadayandayan'),
(4, 'Agape Methodist Church (Template + CMS Integration)', 'Validation Error', 'Error on date input validation', 'kaiwen12', '2016-04-07 15:24:39', 1, 2, '2016-02-27', 'marsd'),
(5, '(2) My Singapore Food [CMS]', 'Deadline404 error on ThaiFood.html on right nav', '404 error on ThaiFood.html on right nav', 'markconderw', '2016-04-07 15:24:39', 1, 2, '2016-03-10', 'bahri_ripplewerkz'),
(6, '(2) My Singapore Food [CMS]', 'Error Messages not clear', 'Client requires more specific error messages for their users. Also, some error messages are not showing', 'markconderw', '2016-04-07 15:24:39', 1, 3, '2016-02-26', 'debe2'),
(7, '(2) Association of Funeral Directors (AFDS)', 'Wordpress plugin out of date,', 'Please update wordpress plugin', 'markconderw', '2016-04-07 15:24:39', 1, 2, '2016-02-26', 'debe2'),
(8, 'SeaCAD [Responsive + CMS + Event Espresso (Training Courses) + E-Commerce]', 'Inventory not updating', 'Inventory not updating, Inventory in the commerce store does not update when it runs out of stock', 'markconderw', '2016-04-07 15:24:39', 1, 1, '2016-04-18', 'chaisiri1'),
(9, '1036liveseafood.com [Design only]', 'Image Transparency', 'Image Transparency, Support for transparent image for project view', 'markconderw', '2016-04-07 15:24:39', 1, 2, '2016-02-28', 'zripplewerkz'),
(10, 'First Energy [CMS]', 'Issue Key', 'New UI makes issue key very hard to select and copy paste', 'markconderw', '2016-02-22 09:30:48', 1, 1, '2016-03-25', 'debe2'),
(11, 'Purely Adoption [CMS]', 'CAPTCHA image link not working', 'CAPTCHA image link not working', 'markconderw', '2016-04-07 15:24:39', 1, 2, '2016-03-29', 'benjo12'),
(12, 'ENVI (eComm)', 'Google Translate API', 'Google Translate API, The api code broke down, Please update. Client needs the translation for website to perform business function', 'markconderw', '2016-04-07 15:24:39', 1, 2, '2016-03-22', 'debe2'),
(13, 'Flave - Vanitytriad [E-Commerce]', 'Image Thumbnail Issue', 'Image Thumbnail Issue, Thumbnail in JPEG break transparency in PNG/GIF', 'markconderw', '2016-02-22 09:33:03', 1, 2, '2016-03-18', 'zripplewerkz'),
(14, 'Agape Methodist Church (Template + CMS Integration)', 'Animation not showing', 'Animation not showing, Home page animation has broke, please check with slicing department before integrating', 'markconderw', '2016-04-07 15:24:39', 1, 1, '2016-04-15', 'marsd'),
(15, 'Fashmob (E-Commerce)', 'API Issue', 'API Issue, AXAA restful API  is  not stable', 'markconderw', '2016-02-22 09:35:34', 1, 2, '2016-04-14', 'pukpik'),
(16, 'Flave - Vanitytriad [E-Commerce]', 'JSON from hotel API', 'Bad JSON data coming back from hotel API', 'markconderw', '2016-04-07 15:24:39', 1, 2, '2016-04-12', 'zripplewerkz'),
(17, 'MINERVA - INTRA', 'Server config issue', 'After 10000 request, server will die', 'markconderw', '2016-04-07 15:24:39', 1, 2, '2016-04-14', 'debe2'),
(18, '(2) Association of Funeral Directors (AFDS)', 'Missing vote count,', 'Up voting counts should be displayed on the side', 'markconderw', '2016-04-07 15:24:39', 1, 2, '2016-02-29', 'pukpik'),
(19, 'Nachuraru [E-Commerce + CMS + Responsive]', 'Discount not showing', 'Customer tried to set discount but the discount is not shown', 'markconderw', '2016-04-07 15:24:39', 1, 2, '2016-03-08', 'roy1'),
(20, 'Full Black Heels [E-Commerce]', 'Inventory mixup', 'SKU and inventory ID does not match', 'markconderw', '2016-02-22 09:53:27', 1, 3, '2016-03-11', 'debe2'),
(21, 'ENVI (eComm)', 'Inventory image', 'Display pic for inventory not showing full size image', 'markconderw', '2016-04-07 15:24:39', 1, 1, '2016-03-19', 'debe2'),
(22, 'HafBox', 'Catalog', 'Catalog upload function not working', 'markconderw', '2016-04-07 15:24:39', 1, 3, '2016-03-17', 'pukpik'),
(23, 'Maven [CMS Integration]', 'Analytics Dashboard', 'Dashboard not displaying latest updates', 'markconderw', '2016-04-07 15:24:39', 1, 3, '2016-03-26', 'marsd'),
(24, '1036liveseafood.com [Design only]', 'Wordpress theme needs update', 'Please update wordpress plugins and themes for client as the old theme has errors in the UI', 'markconderw', '2016-04-07 15:24:39', 1, 3, '2016-03-26', 'zripplewerkz'),
(25, '(2) Association of Funeral Directors (AFDS)', 'Image Transparency', 'Support for transparent image for project view', 'markconderw', '2016-04-07 15:24:39', 1, 1, '2016-03-16', 'debe2'),
(26, 'Branslord [CMS]', 'Unable to login', 'Client is unable to login into the system, password that are reset will still be wrong.', 'kaiwen12', '2016-04-07 17:31:38', 0, 2, '2016-04-11', 'chaisiri1'),
(27, '25 HOURS TIME INTERNATIONAL PTE LTD', 'Manage User page issue', '-', 'kaiwen12', '2016-04-07 18:24:23', 0, 2, '2018-12-12', 'bahri_ripplewerkz'),
(28, 'Procter and Gamble', 'Client unhappy with login', '4', 'kaiwen12', '2016-04-07 20:08:51', 0, 3, '2020-12-12', 'roy1'),
(29, 'Procter and Gamble', 'checkout function issue', '3', 'kaiwen12', '2016-04-07 20:09:18', 0, 3, '2020-02-02', 'roy1'),
(30, 'TAHAN CAPITAL MANAGEMENT PTE LTD', 'login', '-', 'kaiwen12', '2016-04-07 20:09:52', 0, 2, '2020-12-02', 'marsd'),
(32, 'TAHAN CAPITAL MANAGEMENT PTE LTD', 'transaction issue', '3', 'kaiwen12', '2016-04-07 20:11:59', 0, 2, '2020-05-03', 'marsd'),
(33, 'TAG TEAM INC. PTE LTD', 'transaction issue', '-', 'kaiwen12', '2016-04-07 21:14:45', 0, 3, '2019-03-05', 'lesterjester'),
(34, 'TAG TEAM INC. PTE LTD', 'final submission page issue', '-', 'kaiwen12', '2016-04-07 21:16:07', 0, 1, '2017-05-03', 'lesterjester'),
(35, 'Decendents of the Sky [Responsive]', 'Nav Bar needs to have more menu items', 'Add a few more menu items into the nav bar', 'peterripplewerkz', '2016-04-07 21:36:39', 0, 1, '2016-04-11', 'lesterjester'),
(36, 'TaeBak Media [Responsive]', 'UI issues', 'The UI is a bit blur. Please ensure client gets top quality resolution', 'peterripplewerkz', '2016-04-07 22:06:59', 0, 2, '2016-04-28', 'sirachon'),
(37, 'Wolf Pte Ltd [CMS]', 'Logic issue', 'Please check the logic for the CMS', 'peterripplewerkz', '2016-04-07 22:49:55', 0, 2, '2016-04-16', 'debe2');

-- --------------------------------------------------------

--
-- Table structure for table `defectcommitby`
--

CREATE TABLE `defectcommitby` (
  `defectid` int(11) NOT NULL,
  `committedby` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `defectcommitby`
--

INSERT INTO `defectcommitby` (`defectid`, `committedby`) VALUES
(1, 'alexadayandayan'),
(3, 'alexadayandayan'),
(5, 'bahri_ripplewerkz'),
(11, 'benjo12'),
(8, 'chaisiri1'),
(2, 'debe2'),
(6, 'debe2'),
(7, 'debe2'),
(10, 'debe2'),
(12, 'debe2'),
(17, 'debe2'),
(20, 'debe2'),
(21, 'debe2'),
(24, 'debe2'),
(25, 'debe2'),
(37, 'debe2'),
(26, 'lesterjester'),
(27, 'lesterjester'),
(33, 'lesterjester'),
(34, 'lesterjester'),
(35, 'lesterjester'),
(4, 'marsd'),
(14, 'marsd'),
(23, 'marsd'),
(30, 'marsd'),
(32, 'marsd'),
(15, 'pukpik'),
(18, 'pukpik'),
(22, 'pukpik'),
(19, 'roy1'),
(28, 'roy1'),
(29, 'roy1'),
(36, 'sirachon'),
(9, 'zripplewerkz'),
(13, 'zripplewerkz'),
(16, 'zripplewerkz'),
(24, 'zripplewerkz');

-- --------------------------------------------------------

--
-- Table structure for table `defectscreenshot`
--

CREATE TABLE `defectscreenshot` (
  `defectid` int(11) NOT NULL,
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `photo` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `developer`
--

CREATE TABLE `developer` (
  `username` varchar(200) NOT NULL,
  `employmentdate` date NOT NULL,
  `nationality` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `developer`
--

INSERT INTO `developer` (`username`, `employmentdate`, `nationality`) VALUES
('alexadayandayan', '2014-10-30', 'Philippines'),
('bahri_ripplewerkz', '2014-10-30', 'Indonesia'),
('ballalist', '2014-10-30', 'Thailand'),
('benjo12', '2014-10-30', 'Philippines'),
('chaisiri1', '2014-10-30', 'Thailand'),
('debe2', '2014-10-30', 'Indonesia'),
('john_pajarillo', '2014-10-30', 'Philippines'),
('lesterjester', '2014-10-30', 'Philippines'),
('marsd', '2014-10-30', 'Singapore'),
('pukpik', '2014-10-30', 'Thailand'),
('roy1', '2014-10-30', 'Singapore'),
('sirachon', '2014-10-30', 'Thailand'),
('vandavedecio', '2014-10-30', 'Philippines'),
('zripplewerkz', '2014-10-30', 'Philippines');

-- --------------------------------------------------------

--
-- Table structure for table `developerskill`
--

CREATE TABLE `developerskill` (
  `username` varchar(200) NOT NULL,
  `skill` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `developerskill`
--

INSERT INTO `developerskill` (`username`, `skill`) VALUES
('alexadayandayan', 'wordpress'),
('bahri_ripplewerkz', 'wordpress'),
('ballalist', 'custom'),
('ballalist', 'wordpress'),
('benjo12', 'wordpress'),
('chaisiri1', 'wordpress'),
('debe2', 'ecommerce'),
('debe2', 'wordpress'),
('john_pajarillo', 'wordpress'),
('lesterjester', 'custom'),
('lesterjester', 'wordpress'),
('marsd', 'custom'),
('marsd', 'wordpress'),
('pukpik', 'wordpress'),
('roy1', 'ecommerce'),
('roy1', 'wordpress'),
('sirachon', 'wordpress'),
('vandavedecio', 'wordpress'),
('zripplewerkz', 'ecommerce'),
('zripplewerkz', 'wordpress');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notificationid` int(11) NOT NULL,
  `username` varchar(200) DEFAULT NULL,
  `notificationtype` varchar(200) DEFAULT NULL,
  `projectname` varchar(200) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `dateandtime` timestamp NULL DEFAULT NULL,
  `archived` char(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notificationid`, `username`, `notificationtype`, `projectname`, `status`, `dateandtime`, `archived`) VALUES
(1, 'pukpik', 'assignedProject', 'Facebook Virtual', 'F', '2016-04-07 21:12:55', 'T'),
(2, 'lesterjester', 'assignedProject', 'Twitter Blogging', 'F', '2016-04-07 21:14:38', 'T'),
(3, 'pukpik', 'assignedProject', 'Twitter Blogging', 'F', '2016-04-07 21:14:38', 'T'),
(4, 'pukpik', 'assignedProject', 'Starbucks Mobile', 'F', '2016-04-07 21:19:49', 'T'),
(5, 'roy1', 'assignedProject', 'Monster Beverage', 'F', '2016-04-07 21:20:24', 'T'),
(6, 'marsd', 'assignedProject', 'Kraft Foods', 'F', '2016-04-07 21:21:12', 'T'),
(7, 'zripplewerkz', 'assignedProject', 'Petronas Web', 'F', '2016-04-07 21:21:45', 'T'),
(8, 'zripplewerkz', 'assignedProject', 'Liberty Media [3 Page Static]', 'F', '2016-04-07 21:22:52', 'T'),
(9, 'lesterjester', 'assignedProject', 'BA Foods [Responsive]', 'F', '2016-04-07 21:23:25', 'T'),
(10, 'ballalist', 'assignedProject', 'BA Foods [Responsive]', 'F', '2016-04-07 21:23:25', 'T'),
(11, 'marsd', 'assignedProject', 'Hubort Management [CMS + Responsive]', 'F', '2016-04-07 21:23:59', 'T'),
(12, 'ballalist', 'assignedProject', 'Hubort Management [CMS + Responsive]', 'F', '2016-04-07 21:23:59', 'T'),
(13, 'marsd', 'assignedProject', 'Hubort Management [CMS + Responsive]', 'F', '2016-04-07 21:26:01', 'T'),
(14, 'ballalist', 'assignedProject', 'Hubort Management [CMS + Responsive]', 'F', '2016-04-07 21:26:01', 'T'),
(15, 'lesterjester', 'assignedProject', 'Hubort Management [CMS + Responsive]', 'F', '2016-04-07 21:26:07', 'T'),
(16, 'marsd', 'assignedProject', 'Hubort Management [CMS + Responsive]', 'F', '2016-04-07 21:26:07', 'T'),
(17, 'lesterjester', 'assignedProject', 'Branslord [CMS]', 'F', '2016-04-07 21:30:07', 'T'),
(18, 'pukpik', 'assignedProject', 'Branslord [CMS]', 'F', '2016-04-07 21:30:07', 'T'),
(19, 'sirachon', 'assignedProject', 'Branslord [CMS]', 'F', '2016-04-07 21:30:07', 'T'),
(20, 'chaisiri1', 'assignedDefect26', 'Branslord [CMS]', 'F', '2016-04-07 21:31:38', 'T'),
(21, 'roy1', 'assignedProject', 'Procter and Gamble', 'F', '2016-04-07 22:11:31', 'T'),
(22, 'lesterjester', 'assignedProject', '25 HOURS TIME INTERNATIONAL PTE LTD', 'F', '2016-04-07 22:12:35', 'T'),
(23, 'pukpik', 'assignedProject', '25 HOURS TIME INTERNATIONAL PTE LTD', 'F', '2016-04-07 22:12:35', 'T'),
(24, 'roy1', 'assignedProject', '3 DEGREES ASSET MANAGEMENT PTE LTD', 'F', '2016-04-07 22:13:27', 'T'),
(25, 'lesterjester', 'assignedProject', '3 DEGREES ASSET MANAGEMENT PTE LTD', 'F', '2016-04-07 22:13:27', 'T'),
(26, 'pukpik', 'assignedProject', '3 DEGREES HOSPITALITY PTE LTD', 'F', '2016-04-07 22:14:24', 'T'),
(28, 'lesterjester', 'assignedProject', 'L-Intelligent Eduhub Pte. Ltd', 'F', '2016-04-07 22:16:11', 'T'),
(29, 'zripplewerkz', 'assignedProject', 'L.D. WAXSON (S) PTE LTD', 'F', '2016-04-07 22:16:56', 'T'),
(30, 'lesterjester', 'assignedProject', 'TAG TEAM INC. PTE LTD', 'F', '2016-04-07 22:17:19', 'T'),
(31, 'pukpik', 'assignedProject', 'TAGIT PTE LTD', 'F', '2016-04-07 22:17:49', 'T'),
(32, 'marsd', 'assignedProject', 'TAHAN CAPITAL MANAGEMENT PTE LTD', 'F', '2016-04-07 22:18:15', 'T'),
(33, 'bahri_ripplewerkz', 'assignedDefect27', '25 HOURS TIME INTERNATIONAL PTE LTD', 'F', '2016-04-07 22:24:23', 'T'),
(34, 'roy1', 'assignedDefect28', 'Procter and Gamble', 'F', '2016-04-08 00:08:51', 'T'),
(35, 'roy1', 'assignedDefect29', 'Procter and Gamble', 'F', '2016-04-08 00:09:18', 'T'),
(36, 'marsd', 'assignedDefect30', 'TAHAN CAPITAL MANAGEMENT PTE LTD', 'F', '2016-04-08 00:09:52', 'T'),
(38, 'marsd', 'assignedDefect32', 'TAHAN CAPITAL MANAGEMENT PTE LTD', 'F', '2016-04-08 00:11:59', 'T'),
(39, 'lesterjester', 'assignedDefect33', 'TAG TEAM INC. PTE LTD', 'F', '2016-04-08 01:14:45', 'T'),
(40, 'lesterjester', 'assignedDefect34', 'TAG TEAM INC. PTE LTD', 'F', '2016-04-08 01:16:07', 'T'),
(41, 'lesterjester', 'assignedProject', 'Decendents of the Sky [Responsive]', 'F', '2016-04-08 01:35:06', 'T'),
(42, 'pukpik', 'assignedProject', 'Decendents of the Sky [Responsive]', 'F', '2016-04-08 01:35:06', 'T'),
(43, 'lesterjester', 'assignedDefect35', 'Decendents of the Sky [Responsive]', 'F', '2016-04-08 01:36:39', 'T'),
(44, 'debe2', 'assignedProject', 'Wolf Pte Ltd [CMS]', 'F', '2016-04-08 01:38:41', 'T'),
(45, 'lesterjester', 'assignedProject', 'Piccolo Pottery Co. (CMS + Responsive + Parallax)', 'F', '2016-04-08 01:41:16', 'T'),
(46, 'ballalist', 'assignedProject', 'Big Beauty Boss Pte Ltd [Static + HTML + Responsive + CMS]', 'F', '2016-04-08 01:49:05', 'T'),
(47, 'pukpik', 'assignedProject', 'Snoopy Electric Components [CMS + Responsive]', 'F', '2016-04-08 01:53:14', 'T'),
(48, 'zripplewerkz', 'assignedProject', 'Doves Supplies [E-commerce + CMS + responsive]', 'F', '2016-04-08 01:54:50', 'T'),
(49, 'zripplewerkz', 'assignedProject', 'Doves Supplies [E-commerce + CMS + responsive]', 'F', '2016-04-08 01:55:03', 'T'),
(50, 'zripplewerkz', 'assignedProject', 'Urk Market Supllies [E-commerce]', 'F', '2016-04-08 01:57:41', 'T'),
(51, 'sirachon', 'assignedProject', 'TaeBak Media [Responsive]', 'F', '2016-04-08 01:59:09', 'T'),
(52, 'lesterjester', 'assignedProject', 'Pluto Fried Rice [CMS]', 'F', '2016-04-08 02:01:37', 'T'),
(53, 'roy1', 'assignedProject', 'North Star Engineering [E-commerce + Responsive]', 'F', '2016-04-08 02:02:51', 'T'),
(54, 'sirachon', 'assignedDefect36', 'TaeBak Media [Responsive]', 'F', '2016-04-08 02:06:59', 'T'),
(55, 'debe2', 'assignedDefect37', 'Wolf Pte Ltd [CMS]', 'F', '2016-04-08 02:49:55', 'T'),
(56, 'roy1', 'assignedProject', 'Mars Bar Pte Ltd [CMS]', 'F', '2016-04-08 04:25:18', 'T'),
(57, 'lesterjester', 'assignedProject', 'Hopscotch Bar [E-commerce]', 'F', '2016-04-08 04:26:19', 'T'),
(58, 'pukpik', 'assignedProject', 'Hopscotch Bar [E-commerce]', 'F', '2016-04-08 04:26:19', 'T'),
(59, 'pukpik', 'assignedProject', 'Kim Keat Hokkiean Mee [CMS]', 'F', '2016-04-08 04:27:04', 'T'),
(60, 'lesterjester', 'assignedProject', 'AtonHouse Kindergarten [CMS + Responsive]', 'F', '2016-04-08 18:30:39', 'T');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `projectname` varchar(200) NOT NULL,
  `trellokey` varchar(100) NOT NULL,
  `description` varchar(8000) NOT NULL,
  `assignby` varchar(100) NOT NULL,
  `duedate` date NOT NULL,
  `priority` int(11) NOT NULL,
  `iscomplete` int(11) NOT NULL DEFAULT '0',
  `type` varchar(100) NOT NULL,
  `psize` int(11) NOT NULL DEFAULT '1',
  `trellophoto` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`projectname`, `trellokey`, `description`, `assignby`, `duedate`, `priority`, `iscomplete`, `type`, `psize`, `trellophoto`) VALUES
('(1) Klarity', '56b175985eaeb240978870f8', '', 'lionelchin', '2015-07-31', 2, 0, 'to be updated', 30, NULL),
('(2) Association of Funeral Directors (AFDS)', '56b175985eaeb24097886f87', 'Project Type: CMS w/ Responsive Design and Members Login module\r\nDesigner:\r\nDeveloper:\r\nURL: \r\nPDC:\r\nClie', 'markconderw', '2015-07-27', 0, 1, 'ecommerce', 20, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886f87/x/257ed62625fb711f2340ca46de9dab6f/AFD_Logo.ai'),
('(2) My Singapore Food [CMS]', '56b175985eaeb24097886f2a', 'community page \r\n- Only contribute by Singapore Home Cooks (Top 100 recipe out of their current 1000+', 'markconderw', '2015-07-27', 1, 1, 'wordpress', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886f2a/x/851c1d8f6804f116634b524dd4bac830/Main-Logo.png'),
('(8) MegaPOS [CMS + Responsive] - New Design', '56b175985eaeb24097886e6b', 'Revamp of http://www.megapos.com.sg | Please provide 2 concept drafts to client.', 'markconderw', '2015-09-25', 2, 0, 'to be updated', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886e6b/x/8b89b603b857b7bb6fba0688f66c5efe/megapos_cover.jpg'),
('1036liveseafood.com [Design only]', '56b175985eaeb24097886fb2', 'Project Type: Design only (pass PSDs to client once completed)\r\nDesigner:\r\nDeveloper:\r\nURL: http://www.', 'markconderw', '2015-04-21', 1, 1, 'wordpress', 33, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886fb2/x/7cc1efb718adfcd9be23217d5443d279/1036_Live_Seafood.png'),
('25 HOURS TIME INTERNATIONAL PTE LTD', '5707831afcda1b280dac9614', '', 'markconderw', '2016-04-08', 0, 1, 'wordpress', 12, NULL),
('3 DEGREES ASSET MANAGEMENT PTE LTD', '570783213e3c8a82fef4d57a', '', 'markconderw', '2016-04-08', 1, 0, 'wordpress', 3, NULL),
('3 DEGREES HOSPITALITY PTE LTD', '57078328a176a3a0bbadfc85', '', 'markconderw', '2016-04-08', 0, 0, 'wordpress', 3, NULL),
('456', '56cf0cd58175f38971eb64bb', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('Abex Engineering [non-responsive CMS]', '56b175985eaeb24097886f5f', 'Project Type: Revamp + CMS (non-responsive)\r\nDesigner: \r\nDeveloper:\r\nURL: http://ww1.abex-engrg.com/ (c', 'markconderw', '2016-02-22', 1, 1, 'custom', 34, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886f5f/x/8535033b76aaf8d31d1560f7649414df/Abex_logo.png'),
('add here', '56cf0e0b91a19e4659514689', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('Agape 2', '56cbb80638904904311d6333', '', 'peterripplewerkz', '2016-04-06', 2, 0, 'wordpress', 30, 'https://trello-attachments.s3.amazonaws.com/56cbb80638904904311d6333/317x249/5d7638a2378ea4ca388a68a0b3d6083e/upload_2_23_2016_at_9_38_58_AM.png'),
('Agape Methodist Church (Template + CMS Integration)', '56b175985eaeb24097887005', 'Project Type: Template Design + CMS Integration\r\nTemplate (chosen by client): http://themeforest.net/', 'markconderw', '2016-02-22', 1, 1, 'custom', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097887005/x/b5e3ed17e11074975b6227740f1f1ca2/Agape_Logo.png'),
('All That Jazz [CMS]', '56b175985eaeb24097886efc', 'Project Type: CMS (Responsive Site)\r\nDesigner: Simin\r\nDeveloper:\r\nURL: http://allthatjazz.com.sg (curre', 'markconderw', '2015-08-09', 1, 1, 'wordpress', 36, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886efc/x/150e3e57a1bd1ef79ba28adc15baf3b7/All_That_Jazz_logo.png'),
('amelia tan', '56e24d060ca39471ab750d08', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('AtonHouse Kindergarten [CMS + Responsive]', '5707d966b5ef2e3824c4cd7f', '', 'lionelchin', '2016-04-09', 1, 0, 'custom', 15, NULL),
('BA Foods [Responsive]', '5707756f32320475b78ce858', '', 'markconderw', '2016-04-08', 0, 0, 'custom', 22, NULL),
('Big Beauty Boss Pte Ltd [Static + HTML + Responsive + CMS]', '5707a9f994dd1a44f50508f5', '', 'peterripplewerkz', '2016-06-20', 0, 0, 'custom', 20, 'https://trello-attachments.s3.amazonaws.com/5707a9f994dd1a44f50508f5/800x450/ff8ebd037d14918050358302b9860560/upload_4_8_2016_at_9_05_22_PM.png'),
('Boon East Ki Chicken Rice [CMS + Responsive]', '5707d4a68af73e8d3cadd0e9', '', 'lionelchin', '2016-04-13', 2, 0, 'to be updated', 30, 'https://trello-attachments.s3.amazonaws.com/5707d4a68af73e8d3cadd0e9/500x333/37851726bbb55f3f173b5b16d24785f7/hainanese-chicken-86.jpg'),
('Bottles & Bone [CMS and Responsive]', '56b175995eaeb240978871e2', '', 'peterripplewerkz', '2016-04-08', 2, 0, 'wordpress', 30, NULL),
('Branslord [CMS]', '57077590a9fa89e304dc7006', '', 'markconderw', '2016-04-08', 0, 0, 'wordpress', 22, NULL),
('Broco Kitchen (Static HTML)', '56b175985eaeb24097886e63', 'Project Type: Static HTML\nDesigner: -\nDeveloper:\nURL: http://brocokitchen.com (current website)\nPDC:\nClient''s Name: Peggy\nClient''s Contact Email: peggy@morrisschaefer.com / morrisschaefer88@gmail.com\nClient''s Contact Number: 6285 0056\n\n---\n\nCD with all images will be provided.\n\n---\n\n\nReferences:\nwww.ernestomeda.com\nwww.poggenpohl.com\nwww.boffi.com\n ', 'markconderw', '2015-09-25', 2, 0, 'wordpress', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886e63/x/250bedbb25ecfdf1e438cf88fe18695a/Broco_Kitchen_logo.png'),
('CE Engineering [CMS]', '56b175995eaeb24097887163', '', 'lionelchin', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('CIMS', '56b175985eaeb24097887126', '', 'lionelchin', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('Claymore Mall', '56b175985eaeb24097887103', '', 'lionelchin', '2015-08-06', 2, 0, 'to be updated', 30, NULL),
('Collate Mobile', '56b175985eaeb24097887102', '', 'lionelchin', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('Concorde Security [CMS + Responsive]', '56b175995eaeb2409788714a', 'Project Type: CMS + Responsive\nDesigner: -\nDeveloper:\nURL: http://concorde.com.sg (current website) \nPDC:\nClient''s Name: Sarah\nClient''s Contact Email: \nClient''s Contact Number:  \n\n---\n\nClient is in the technological integrations business, specifically security and monitoring systems. The website must be able to translate trust, professionalism and sense of security to users. \n\nNote: 2 concept drafts for Home page is required. Refer to the references below\n\nImages link\n\nhttps://drive.google.com/folderview?id=0B8cNZhWAd_ElcDdYVkNkSFM2eFE&usp=sharing', 'markconderw', '2016-04-14', 2, 0, 'to be updated', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175995eaeb2409788714a/x/941f10dba35b3eb2410563f6e511b9aa/Concorde_Security_logo.png'),
('d', '56cdfe9f8123f9a9b7cd0cff', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('Decendents of the Sky [Responsive]', '5707a98c1c93954ffb7c1a27', 'Military Information shop', 'peterripplewerkz', '2016-05-12', 0, 0, 'wordpress', 12, 'https://trello-attachments.s3.amazonaws.com/5707a98c1c93954ffb7c1a27/780x520/c3f31734fa5818e4baa75928539d4181/upload_4_8_2016_at_9_01_36_PM.png'),
('Doves Supplies [E-commerce + CMS + responsive]', '5707aa45e39799400187762d', '', 'peterripplewerkz', '2016-08-23', 0, 0, 'ecommerce', 40, 'https://trello-attachments.s3.amazonaws.com/5707aa45e39799400187762d/400x320/c203ba816dbceaadbce6aacb9a271b21/upload_4_8_2016_at_9_06_36_PM.png'),
('Eastern Holiday Singapore', '56b175985eaeb24097886f96', 'contact no. \n6534 6168\n\nHP:91996133', 'peterripplewerkz', '2016-04-14', 2, 0, 'to be updated', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886f96/x/55e5dea9d83f59e347af44de9b9cae64/Official_Quotation_for_Mrs_Yang1.pdf'),
('ENVI (eComm)', '56b175975eaeb24097886cf4', '', 'markconderw', '2016-02-23', 1, 1, 'ecommerce', 32, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175975eaeb24097886cf4/x/5b113e076a997d096253ca1b085a52c7/envi_trello_coverphoto.jpg'),
('Eye Trendy Responsive', '56b175995eaeb240978871ea', '', 'peterripplewerkz', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('Facebook Virtual', '57077504ad70d033dc47cdd7', '', 'markconderw', '2016-04-08', 0, 0, 'wordpress', 25, NULL),
('Fashmob (E-Commerce)', '56b175985eaeb24097886f49', 'Project Type: E-Commerce (Revamp) w/ Responsive and Gift Card module\r\nDesigner:\r\nDeveloper:\r\nURL: http:', 'markconderw', '2015-04-03', 1, 1, 'wordpress', 12, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886f49/x/70ebd29adef3cee110243a35efc179f9/FASHMOB_Logo.png'),
('Fevrier Designs', '56b175985eaeb24097887101', '', 'lionelchin', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('Fevrier Designs [Add ons]', '56b175985eaeb2409788710d', 'Website: http://www.fevrierdesigns.com\nPDC: https://docs.google.com/spreadsheets/d/1x5o2IVUzVxhjddsH7wcwlpS6LyV_dLS0azC3J4oaGlQ/edit?usp=drive_web', 'lionelchin', '2016-04-14', 2, 0, 'to be updated', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb2409788710d/x/45a399b5b9c0e55b389707ba75ebbf99/change1.jpg'),
('First Energy [CMS]', '56b175975eaeb24097886ce0', 'Integration Document: https://docs.google.com/document/d/1nex1rKS4g6QLf19BdepETUvZUG34MI2Mc1n6o5n5xU', 'markconderw', '2014-10-24', 1, 1, 'ecommerce', 17, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175975eaeb24097886ce0/x/8b6a0149eed2a9a8e2ad9c407728f812/First_Energy_Project_Brief.pdf'),
('Flave - Vanitytriad [E-Commerce]', '56b175985eaeb24097886d08', 'Project Type: E-Commerce\r\nDesigner:\r\nDeveloper:\r\nURL: \r\nPDC:\r\nClient', 'markconderw', '2015-08-05', 0, 1, 'wordpress', 17, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886d08/x/95d0f1c50f0c80297e6ae0d8a1095d97/Shau_Fun_(Project_Brief).pdf'),
('Full Black Heels [E-Commerce]', '56b175975eaeb24097886c6b', '', 'markconderw', '2016-02-23', 1, 1, 'ecommerce', 32, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175975eaeb24097886c6b/x/6d1b700e4dd9f97d8137c275ab8002ca/Project_Brief.pdf'),
('Gadgets Glossary', '56b175985eaeb24097886e12', '', 'markconderw', '2015-08-31', 2, 0, 'to be updated', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886e12/x/1aa0de50bfc2cb48e0da46504cf8eaca/gadgetsglossary29juneforbossdebe_(2).docx'),
('GAT [CMS + Responsive]', '56b175985eaeb24097886e6e', 'Project Type: CMS + Responsive\r\nDesigner: -\r\nDeveloper:\r\nURL: -\r\nPDC:\r\nClient', 'markconderw', '2016-02-23', 0, 1, 'wordpress', 23, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886e6e/x/7bf74d24cbbe8ba16f3c31d71e185dd9/Google_Map_example_(pin_w__details).png'),
('Grapevine (Custom + Responsive + Logo)', '56b175985eaeb24097886dec', 'Project Type: Custom + Responsive + Logo\nDesigner: Sandy\nDeveloper:\nURL:\nPDC:\nClient''s Name: Jian Rong\nClient''s Contact Email: \nClient''s Contact Number: 9296 3735', 'markconderw', '2016-04-14', 2, 0, 'to be updated', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886dec/x/0328c4d54805e59d2188a85b3f336c3f/Timeline_for_LNF_Services_(V2).pdf'),
('Great Skin FX', '56b175985eaeb240978870f7', '', 'lionelchin', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('Green Waste Recycling [CMS + Responsive]', '56b175995eaeb24097887187', 'Project Type: CMS + Responsive \r\nDesigner: -\r\nDeveloper:\r\nURL: \r\nPDC:\r\nClient', 'markconderw', '2016-02-23', 0, 1, 'wordpress', 23, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175995eaeb24097887187/x/30576844c363e636e64526320d603877/Logos_PSDs.zip'),
('HafBox', '56b175985eaeb24097886fdb', 'Eugenia Yeo (Mrs) |\r\nHaf Box Pte Ltd\r\nT +65 6235 4560 | M +65 9627 8079\r\n\r\nurl: http://inspiramedia.com/', 'markconderw', '2015-08-27', 0, 1, 'wordpress', 43, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886fdb/x/5a49f632f985f42e5933bffef5c57d14/store_logo.png'),
('Hopscotch Bar [E-commerce]', '5707d3d9b6723f404975b6e4', '', 'lionelchin', '2016-04-11', 0, 1, 'wordpress', 40, NULL),
('Hubb Records Butler', '56f7eb5648f99c0d3abfe454', '', 'markconderw', '2016-04-08', 2, 0, 'wordpress', 30, NULL),
('Hubort Management [CMS + Responsive]', '57077582590bc5faf0d46d4e', '', 'markconderw', '2016-04-08', 0, 0, 'custom', 30, NULL),
('iFix,iBuy,iSell mobilephone [E-commerce]', '5707d6acf69ff280f8c458c1', '', 'kaiwen12', '2016-04-25', 2, 0, 'to be updated', 30, 'https://trello-attachments.s3.amazonaws.com/5707d6acf69ff280f8c458c1/219x160/48de343985c73747d40181d828395cb2/mobile_phone.png'),
('Innovez One [CMS + Responsive]', '56b175995eaeb24097887170', 'Project Type: CMS + Responsive\r\nDesigner: -\r\nDeveloper:\r\nURL: http://innovez-one.com (current website) ', 'markconderw', '2016-02-23', 0, 1, 'wordpress', 20, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175995eaeb24097887170/x/77e831e4343e094872a0c29356c50231/innovez_logo.png'),
('Jemsa Multistore', '56b175985eaeb240978870fd', '', 'lionelchin', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('JMT Leather [CMS]', '56b175975eaeb24097886c58', 'Website revamp: http://www.jmtleather.com/en/\r\nTarget Audience: Architects/Interior Designers\r\n\r\n------', 'markconderw', '2016-02-22', 1, 1, 'wordpress', 20, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175975eaeb24097886c58/x/a2177219e40ebfcdf91a2b2dce1e9e7b/JMT_Logo.png'),
('Jurlesquez (eComm)', '56b175985eaeb24097886d42', '__Note:__ Choi Yee will be helping to manage this as they might just want to meet up.\n\nteoalicia827@gmail.com', 'markconderw', '2016-04-14', 2, 0, 'to be updated', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886d42/x/77d851b1d2d7e8842894f53fd08751fa/jurlesquesz_trello_coverphoto.jpg'),
('Kaiwen Test 2', '56cddab1e7699512072bb212', '', 'kaiwen12', '2016-04-15', 2, 0, 'to be updated', 30, NULL),
('kaiwen.16mar', '56e90007a8b38fd6b7d07505', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('kaiwen.16mar.2', '56e9026e946a1074f62b5c6c', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('kaiwen.16mar.3', '56e923b8fe5192550a3db693', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('kaiwen.16mar.4', '56e923f863f6e0ac3e22f03e', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('kaiwen.16mar.5', '56e924e68854e7916c712ebf', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('kaiwen.18mar', '56eb892ea37ca8f0ae7d4680', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('kaiwen.21mar', '56eeca1ba27d545ac4c5fade', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('kaiwen.21mar.1', '56eecb75baa797f608062aa3', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('Kajima Overseas Asia (CMS)', '56b175975eaeb24097886bf5', 'To help you better understand the flowchart:\n\n- Blue represents what we are currently working on (which is now put on-hold because of the new website structure)\n- Grey highlights the connecting sites (which we refer to as a multi-site installation)\n- Orange highlights the individual CMS system setup for Construction, Development and Design sections\n- Green highlights shared control for Project Gallery (for Construction site)\n- Yellow highlights shared control for Project Gallery (for Development site)\n- Purple highlights separate CMS control for the respective Admin for HR and News\n', 'markconderw', '2016-04-14', 2, 0, 'to be updated', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175975eaeb24097886bf5/x/baf23fa4575cf6a8e3afad09d202296c/kajima_trello_coverphoto.jpg'),
('Kantar Media (DTAM) [CMS + Responsive]', '56b175985eaeb24097886ed9', 'Project Type: CMS + Responsive + Custom Plugin\nDesigner: -\nDeveloper: -\nURL: -\nPDC: -\nClient''s Name: Darick Loo / Steven Lau \nClient''s Contact Email: Darick.loo@kantarmedia.com / Steven.lau@kantarmedia.com\nClient''s Contact Number:  6634 6310 / 9745 1058\n\n67 Ubi Avenue 1\n06-04 StarHub Green\nSingapore 408942\n\n---\n\n2nd draft by 14 July 2015 ( Before noon ) \nThurs (Friday - Before Noon) - HTML \n\n\nSliced version: \nhttp://inspiramedia.com/anthony/dynamic_tam/\nhttp://inspiramedia.com/anthony/dynamic_tam/about_us.html\nhttp://inspiramedia.com/anthony/dynamic_tam/faq.html\nhttp://inspiramedia.com/anthony/dynamic_tam/coming_soon.html\nhttp://inspiramedia.com/anthony/dynamic_tam/toturials.html\n\n\nGoogle Drive : \nhttps://drive.google.com/folderview?id=0B6fia60qRAkwblVNWUVXVkpGLUU&usp=sharing\n\nsite : http://www.dtammalaysia.com/\n\n\nMailchimp: Please login with the following credentials:\nUsername: dtamsupport\nPassword: Jycp4@kantar', 'peterripplewerkz', '2015-07-27', 2, 0, 'to be updated', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886ed9/x/857835593531de4781d3f17bda80c41a/DTAM_V3_Light_Mockups.zip'),
('kesmeen.tan.2013', '56e0283f84d6f26312fd413b', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('kestestcron2', '570798c49334628f9e9d1c97', '', 'markconderw', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('kestestcronjob', '57078d3cbf557f26b13b0ea0', '', 'markconderw', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('KHG Collections', '56b175985eaeb24097886d8b', '', 'markconderw', '2016-02-23', 1, 1, 'wordpress', 12, NULL),
('Kim Keat Hokkiean Mee [CMS]', '5707d5f6504e004a46b47e23', '', 'lionelchin', '2016-04-20', 1, 0, 'wordpress', 27, 'https://trello-attachments.s3.amazonaws.com/5707d5f6504e004a46b47e23/640x640/772edf149ceb71cbce00fbceea939850/hokkiean_mee.jpg'),
('KL Test 1', '5705461ff64383d70eeaf8a6', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('KL Test 2', '570546230708dbafd1628e74', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('KL Test 3', '570546276bdd84b0d1966cd8', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('KLT2', '5706a3fceaeff673e7868022', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('KLT6', '5706a404f9b963b46a9741c5', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('Kraft Foods', '570775539bb4b2ec02209647', '', 'markconderw', '2016-04-08', 0, 0, 'custom', 23, NULL),
('KW Test 1', '570673a048fe5a4febd5735b', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('L''OREAL Singapore', '5707832d840baff7fa6111d6', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('L-Intelligent Eduhub Pte. Ltd', '5707833222cf4e2cbb86f1a4', '', 'markconderw', '2016-04-08', 0, 0, 'custom', 15, NULL),
('L.D. WAXSON (S) PTE LTD', '57078336fda892c666ffa3a6', '', 'markconderw', '2016-04-08', 0, 0, 'ecommerce', 17, NULL),
('LBK', '56b175985eaeb24097886dc7', 'Mobile development is on hold to prioritise fixing the issues in the issue list\n\nIssue List:  [Click here](https://docs.google.com/spreadsheets/d/1njoHa_MxU-M0KQrR9BK1fKHY6pvAkXGWbxArBSuEt7s/edit#gid=0)\n\nPDC: [Click here](https://docs.google.com/spreadsheet/ccc?key=0AkIGnNSUYxyndFB5QnJoVWR3MGoyeWV2WXhIMjVoOHc&usp=sharing)', 'markconderw', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('Liberty Media [3 Page Static]', '570775651ad8b6ac7ca809e9', '', 'markconderw', '2016-04-08', 0, 0, 'ecommerce', 23, NULL),
('Lifebuilders', '56b175995eaeb240978871e3', 'Current site : nope\nTemplate : creativo - 5-0-ultra - responsive\n\nJust change the code , make use of the HTML pages to re-integrate the project.\n\n\nhttps://docs.google.com/document/d/1oIZLkT6G2iGOx5f-sKji1hIKBz1NW7s4h2oYisz4hxA/edit', 'markconderw', '2016-04-14', 2, 0, 'wordpress', 30, NULL),
('Mars Bar Pte Ltd [CMS]', '5707d2bdbab487fcf0aa2013', '', 'lionelchin', '2016-04-10', 1, 1, 'wordpress', 20, 'https://trello-attachments.s3.amazonaws.com/5707d2bdbab487fcf0aa2013/225x238/f73042bf0c9a2361b8dbde94ed9d1861/photo_2016-04-08_23-53-49.jpg'),
('Maven [CMS Integration]', '56b175985eaeb24097886fc3', 'CMS integration only. Designs will be provided by the client in PSD format. Please note that there i', 'markconderw', '2015-03-31', 0, 1, 'custom', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886fc3/x/2090eb8009a3599b143773826650480b/Maven_Project_Brief.pdf'),
('MAX TEST', '56eebf5f643b2951281c8e1e', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('MAX TEST 2', '56eecfdac61580fb0df1fab4', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('MINERVA - INTRA', '56b175985eaeb24097886ec0', '+656848 5155\r\n\r\nHp: \r\n98636095\r\n\r\nResponsive website\r\n\r\n2 Mockup for Homepage\r\n\r\nallow print page \r\n\r\nSEO frien', 'markconderw', '2015-09-23', 0, 1, 'ecommerce', 17, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886ec0/x/02eda8e2d6d77874316415d33f7c28c3/logo.png'),
('Monster Beverage', '570775474cd5a7d7fe73628e', '', 'markconderw', '2016-04-08', 0, 0, 'wordpress', 33, NULL),
('Mothership Can or Not', '56b175985eaeb240978870ff', '', 'lionelchin', '2015-07-17', 2, 0, 'to be updated', 30, NULL),
('Mothership Mobile App', '56b175985eaeb240978870f6', '', 'lionelchin', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('My Drum School - Responsive', '56b175985eaeb24097886e7b', 'Site Test Account: Lionel / R1ppl3!!', 'markconderw', '2016-02-22', 1, 1, 'wordpress', 21, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886e7b/x/64be301dbd31da73393687e0c8768a6a/mds-logo.png'),
('Nachuraru [E-Commerce + CMS + Responsive]', '56b175985eaeb24097886e81', 'Project Type: E-Commerce + CMS (Responsive Site)\r\nDesigner: Simin\r\nDeveloper:\r\nURL: \r\nPDC:\r\nClient', 'markconderw', '2015-08-04', 0, 1, 'ecommerce', 21, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886e81/x/3b68df07ed6689502e7e5d9e73d7c05f/Nachuraru_Project_Brief.pdf'),
('North Star Engineering [E-commerce + Responsive]', '5707ab63b246e35b15fbdc89', '', 'peterripplewerkz', '2016-08-10', 0, 0, 'ecommerce', 12, 'https://trello-attachments.s3.amazonaws.com/5707ab63b246e35b15fbdc89/500x500/3d15b14c7e0dcc9aa6b26f73e7e2d535/upload_4_8_2016_at_9_09_09_PM.png'),
('Pacific Conferences', '56e41b489a44c1e195aeea8c', '', 'markconderw', '2016-04-08', 2, 0, 'wordpress', 30, NULL),
('Petronas Web', '57077559ab49892a030499de', '', 'markconderw', '2016-04-08', 0, 0, 'ecommerce', 31, NULL),
('Piccolo Pottery Co. (CMS + Responsive + Parallax)', '5707a9c2080ecf0524d635d0', '', 'peterripplewerkz', '2016-06-22', 1, 0, 'custom', 26, 'https://trello-attachments.s3.amazonaws.com/5707a9c2080ecf0524d635d0/720x480/0244a6bc186ae5b1748e022cf6e016ff/upload_4_8_2016_at_9_03_21_PM.png'),
('pleasework2', '56cf460242791c4be98870d2', '', 'markconderw', '2016-04-08', 2, 1, 'wordpress', 30, NULL),
('Pluto Fried Rice [CMS]', '5707ab5027afec5ebba5436e', '', 'peterripplewerkz', '2016-08-18', 0, 0, 'wordpress', 35, 'https://trello-attachments.s3.amazonaws.com/5707ab5027afec5ebba5436e/600x338/b847f45d9182666bf1c6cab5405878ed/upload_4_8_2016_at_9_08_42_PM.png'),
('Procter and Gamble', '57078148a4fdf4df23aa5b2a', '', 'markconderw', '2016-04-08', 0, 0, 'ecommerce', 23, NULL),
('prof lee', '56d570a2d4084669966597a1', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('prof yeow leong', '56d572b44949df89a9f69bf7', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('Purely Adoption [CMS]', '56b175985eaeb24097886f1e', 'http://www.spca.org.sg/\r\n\r\nTemplate : http://www.templatemonster.com/demo/52176.html\r\n\r\nhttps://www.drop', 'markconderw', '2015-09-25', 1, 1, 'wordpress', 23, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886f1e/x/66f9811934f5a39085c3f26db114d813/logo.jpg'),
('Renaissance Design Group [CMS]', '56b175975eaeb24097886c5d', 'Revamp http://www.renaidesigngroup.com\r\n\r\n*\r\n\r\n Looking to launch by 3rd week of April. ', 'markconderw', '2016-02-22', 0, 1, 'wordpress', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175975eaeb24097886c5d/x/600d159696c1b23162544e1521e79357/Renaissance_Logo.png'),
('Robert Yam & Co [Logo Tracing + CMS + Responsive]', '56b175995eaeb24097887159', 'Project Type: CMS + Responsive\r\nDesigner: -\r\nDeveloper:\r\nURL: http://robertyamco.com.sg (current websit', 'markconderw', '2016-02-23', 1, 1, 'wordpress', 12, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175995eaeb24097887159/x/db895a2f165cc10ab5c71f0d16bde1b8/Robert_Yam__26_Co_logo.png'),
('same name', '56cf30b707a5dafd5855b47c', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('SeaCAD [Responsive + CMS + Event Espresso (Training Courses) + E-Commerce]', '56b175995eaeb24097887164', 'Project Type: CMS + Responsive + Event Espresso + E-Commerce\r\nDesigner: -\r\nDeveloper:\r\nURL: http://www.', 'markconderw', '2016-02-23', 1, 1, 'ecommerce', 20, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175995eaeb24097887164/x/ea4aa5b60107c0d73fbd25e7a0e3a44b/SEACAD_-_Logo_-_TransparentBg_-_RGB_-_Big.png'),
('Sgwinecellar', '56b175995eaeb24097887138', '', 'markconderw', '2015-09-03', 0, 1, 'wordpress', 23, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175995eaeb24097887138/x/f80f69ac7d26c111f02ef50d76c1c4ec/upload_11_25_2015_at_11_38_07_AM.png'),
('Snoopy Electric Components [CMS + Responsive]', '5707aa24f7599fff790683e9', '', 'peterripplewerkz', '2016-07-21', 0, 0, 'wordpress', 16, 'https://trello-attachments.s3.amazonaws.com/5707aa24f7599fff790683e9/300x300/0e62687a841f9243d9a9ff10c6df074b/upload_4_8_2016_at_9_05_49_PM.png'),
('Starbucks Mobile', '57077532806dd7ebf4792fdf', '', 'markconderw', '2016-04-08', 0, 0, 'wordpress', 30, NULL),
('TaeBak Media [Responsive]', '5707aa7ead1b2550b79d5b41', '', 'peterripplewerkz', '2016-08-09', 0, 0, 'wordpress', 12, 'https://trello-attachments.s3.amazonaws.com/5707aa7ead1b2550b79d5b41/452x302/c119d2efc6acd46aae3abb97688ce147/upload_4_8_2016_at_9_08_10_PM.png'),
('TAG TEAM INC. PTE LTD', '5707833ae30ff3bd66946904', '', 'markconderw', '2016-04-08', 0, 0, 'wordpress', 32, NULL),
('TAGIT PTE LTD', '57078341e602dea2490b8851', '', 'markconderw', '2016-04-08', 1, 0, 'wordpress', 31, NULL),
('TAHAN CAPITAL MANAGEMENT PTE LTD', '5707834a93a5bbcf54003728', '', 'markconderw', '2016-04-08', 1, 0, 'wordpress', 5, NULL),
('test notif', '56dfe37235951f452f6c4c7f', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('testnow', '56d5790a3092b5f267fef326', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('The Rad Label [E-commerce + Responsive]', '56b175995eaeb2409788717c', 'Project Type: E-Commerce/Responsive\n\nDesigner: Name and @trelloid\n\nDeveloper: Pukpik and Chawin\n\nURL: <If there is a current website, then the url>\n\nPDC: <If there is a PDC created, if not, then PM will create one>\n\nClient''s Name: <Adeline/Ruth>\n\nClient''s Contact Email: <ayla2004@singnet.com.sg/ruthleongnc@gmail.com>\n\nClient''s Contact Number: < 6341 7339/ 82999700>', 'markconderw', '2016-04-14', 2, 0, 'to be updated', 30, 'https://www.dropbox.com/s/i4w9a85dili46rz/homepage-popupicon.psd?dl=0'),
('tiffanyg.2013', '56e11992bdfbd28f044ca36c', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('Twitter Blogging', '5707752ac9559683bb0cca0b', '', 'markconderw', '2016-04-08', 0, 0, 'wordpress', 20, NULL),
('Unseason', '56b175995eaeb24097887136', '', 'markconderw', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('Urk Market Supllies [E-commerce]', '5707aa677b1389410161afdb', '', 'peterripplewerkz', '2016-08-23', 0, 1, 'ecommerce', 29, 'https://trello-attachments.s3.amazonaws.com/5707aa677b1389410161afdb/640x447/4c1f674a599e2a5781d908136c2d5638/upload_4_8_2016_at_9_07_22_PM.png'),
('Vlosophy (eComm)', '56b175975eaeb24097886c26', '', 'markconderw', '2016-02-22', 0, 1, 'custom', 50, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175975eaeb24097886c26/x/d51f278b4edb269c868b24e903a0b5ca/vlsophy_trello_coverphoto.jpg'),
('weijun.loh.2013', '56e11a82fafa797b2c020081', '', 'kaiwen12', '2016-04-14', 2, 0, 'to be updated', 30, NULL),
('Wolf Pte Ltd [CMS]', '5707a99b13c2c5bc924b64f7', 'Artic supplies company', 'peterripplewerkz', '2016-06-10', 0, 0, 'wordpress', 12, 'https://trello-attachments.s3.amazonaws.com/5707a99b13c2c5bc924b64f7/620x372/77e6d31bc70a02472d46796fdd49ff16/upload_4_8_2016_at_9_02_36_PM.png'),
('WSTAR', '56b175985eaeb24097886ee4', 'These are the website we send client for sample and they like them:\r\n\r\nhttp://sgwinecellar.com/\r\nhttp:/', 'markconderw', '2016-02-23', 1, 1, 'wordpress', 14, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886ee4/x/a36cda414897073dec83d70a9ba958b5/upload_2015-05-12_at_10.18.53_am.png'),
('[Kayamila]', '56b175995eaeb24097887192', '', 'markconderw', '2016-02-23', 0, 1, 'custom', 23, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175995eaeb24097887192/x/0a34320f00d1e6c19a4a2c5a1856ff8d/FY1862_WEBSITE_Look_and_Feel.jpg'),
('[SoonChow]', '56b175995eaeb240978871ec', '', 'markconderw', '2016-04-08', 2, 0, 'wordpress', 30, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projectallocation`
--

CREATE TABLE `projectallocation` (
  `projectname` varchar(200) NOT NULL,
  `developerusername` varchar(200) NOT NULL,
  `dateallocated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `planstart` date DEFAULT NULL,
  `planend` date DEFAULT NULL,
  `actualstart` date DEFAULT NULL,
  `actualend` date DEFAULT NULL,
  `iscomplete` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projectallocation`
--

INSERT INTO `projectallocation` (`projectname`, `developerusername`, `dateallocated`, `planstart`, `planend`, `actualstart`, `actualend`, `iscomplete`) VALUES
('(1) Klarity', 'alexadayandayan', '2016-04-14 00:01:03', NULL, NULL, NULL, NULL, 0),
('(2) Association of Funeral Directors (AFDS)', 'debe2', '2016-02-22 04:55:48', '2016-02-08', '2016-04-04', '2016-03-07', '2016-04-04', 1),
('(2) My Singapore Food [CMS]', 'bahri_ripplewerkz', '2016-02-22 04:57:45', '2016-03-24', '2016-05-05', '2016-03-24', NULL, 0),
('(8) MegaPOS [CMS + Responsive] - New Design', 'vandavedecio', '2016-04-14 00:00:55', NULL, NULL, NULL, NULL, 0),
('1036liveseafood.com [Design only]', 'zripplewerkz', '2016-02-22 04:58:48', '2016-03-14', '2016-04-29', '2016-03-14', '2016-06-14', 1),
('25 HOURS TIME INTERNATIONAL PTE LTD', 'alexadayandayan', '2016-04-07 18:12:35', '2016-09-12', '2016-11-07', NULL, NULL, 0),
('25 HOURS TIME INTERNATIONAL PTE LTD', 'pukpik', '2016-04-07 18:12:35', '2016-09-18', '2016-11-13', NULL, NULL, 0),
('3 DEGREES ASSET MANAGEMENT PTE LTD', 'alexadayandayan', '2016-04-07 18:13:27', '2016-07-08', '2016-09-02', NULL, NULL, 0),
('3 DEGREES ASSET MANAGEMENT PTE LTD', 'roy1', '2016-04-07 18:13:27', '2016-07-10', '2016-09-04', NULL, NULL, 0),
('3 DEGREES HOSPITALITY PTE LTD', 'chaisiri1', '2016-04-07 18:14:24', '2016-05-02', '2016-06-27', NULL, NULL, 0),
('456', 'alexadayandayan', '2016-04-14 00:01:07', NULL, NULL, NULL, NULL, 0),
('456', 'zripplewerkz', '2016-04-14 00:01:07', NULL, NULL, NULL, NULL, 0),
('Abex Engineering [non-responsive CMS]', 'lesterjester', '2016-02-22 04:59:52', '2016-03-17', '2016-05-03', '2016-03-17', NULL, 0),
('add here', 'roy1', '2016-04-14 00:01:08', NULL, NULL, NULL, NULL, 0),
('Agape 2', 'debe2', '2016-04-07 18:52:02', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Agape Methodist Church (Template + CMS Integration)', 'marsd', '2016-02-22 04:56:29', '2016-03-09', '2016-04-20', '2016-03-09', NULL, 0),
('All That Jazz [CMS]', 'pukpik', '2016-02-22 05:05:28', '2016-03-20', '2016-05-09', '2016-03-20', '2016-06-20', 1),
('amelia tan', 'john_pajarillo', '2016-04-14 00:01:13', NULL, NULL, NULL, NULL, 0),
('AtonHouse Kindergarten [CMS + Responsive]', 'lesterjester', '2016-04-08 14:30:39', '2016-02-21', '2016-04-17', '2016-02-21', NULL, 0),
('BA Foods [Responsive]', 'ballalist', '2016-04-07 17:23:25', '2016-03-07', '2016-05-02', '2016-03-07', NULL, 0),
('BA Foods [Responsive]', 'lesterjester', '2016-04-07 17:23:25', '2016-02-05', '2016-04-01', '2016-02-05', NULL, 0),
('Big Beauty Boss Pte Ltd [Static + HTML + Responsive + CMS]', 'ballalist', '2016-04-07 21:49:04', '2016-04-17', '2016-06-12', NULL, NULL, 0),
('Boon East Ki Chicken Rice [CMS + Responsive]', 'pukpik', '2016-04-14 00:01:23', NULL, NULL, NULL, NULL, 0),
('Bottles & Bone [CMS and Responsive]', 'debe2', '2016-04-07 18:52:08', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Bottles & Bone [CMS and Responsive]', 'roy1', '2016-04-07 18:52:08', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Branslord [CMS]', 'lesterjester', '2016-04-07 17:30:07', '2015-12-24', '2016-02-18', '2015-12-24', NULL, 0),
('Branslord [CMS]', 'pukpik', '2016-04-07 17:30:07', '2016-01-06', '2016-03-02', '2016-01-06', NULL, 0),
('Branslord [CMS]', 'sirachon', '2016-04-07 17:30:07', '2016-01-18', '2016-03-14', '2016-01-18', NULL, 0),
('Broco Kitchen (Static HTML)', 'debe2', '2016-04-07 18:52:04', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('CE Engineering [CMS]', 'pukpik', '2016-04-14 00:01:05', NULL, NULL, NULL, NULL, 0),
('CIMS', 'lesterjester', '2016-04-14 00:01:03', NULL, NULL, NULL, NULL, 0),
('Claymore Mall', 'alexadayandayan', '2016-04-14 00:00:58', NULL, NULL, NULL, NULL, 0),
('Collate Mobile', 'debe2', '2016-04-14 00:01:02', NULL, NULL, NULL, NULL, 0),
('Concorde Security [CMS + Responsive]', 'alexadayandayan', '2016-04-14 00:01:05', NULL, NULL, NULL, NULL, 0),
('Concorde Security [CMS + Responsive]', 'marsd', '2016-04-14 00:01:05', NULL, NULL, NULL, NULL, 0),
('d', 'marsd', '2016-04-14 00:01:06', NULL, NULL, NULL, NULL, 0),
('Decendents of the Sky [Responsive]', 'john_pajarillo', '2016-04-07 21:35:06', '2016-01-29', '2016-03-25', '2016-01-29', NULL, 0),
('Decendents of the Sky [Responsive]', 'vandavedecio', '2016-04-07 21:35:06', '2016-01-23', '2016-03-19', '2016-01-23', NULL, 0),
('Doves Supplies [E-commerce + CMS + responsive]', 'zripplewerkz', '2016-04-07 21:54:49', '2015-08-16', '2015-10-16', '2015-08-16', NULL, 0),
('Doves Supplies [E-commerce + CMS + responsive]', 'zripplewerkz', '2016-04-07 21:55:02', '2015-08-16', '2015-10-16', '2015-08-16', NULL, 0),
('Eastern Holiday Singapore', 'alexadayandayan', '2016-04-14 00:01:04', NULL, NULL, NULL, NULL, 0),
('ENVI (eComm)', 'debe2', '2016-02-22 05:18:51', '2016-04-04', '2016-05-18', '2016-04-04', NULL, 0),
('Eye Trendy Responsive', 'vandavedecio', '2016-04-14 00:00:56', NULL, NULL, NULL, NULL, 0),
('Facebook Virtual', 'john_pajarillo', '2016-04-07 17:12:55', '2015-12-30', '2016-02-24', '2015-12-30', NULL, 0),
('Fashmob (E-Commerce)', 'john_pajarillo', '2016-02-22 05:06:16', '2016-02-09', '2016-04-05', '2016-03-20', '2016-04-10', 1),
('Fevrier Designs', 'alexadayandayan', '2016-04-14 00:01:02', NULL, NULL, NULL, NULL, 0),
('Fevrier Designs', 'zripplewerkz', '2016-04-14 00:01:02', NULL, NULL, NULL, NULL, 0),
('Fevrier Designs [Add ons]', 'pukpik', '2016-04-14 00:00:59', NULL, NULL, NULL, NULL, 0),
('First Energy [CMS]', 'debe2', '2016-02-22 05:22:43', '2016-03-02', '2016-04-27', '2016-04-04', NULL, 0),
('Flave - Vanitytriad [E-Commerce]', 'zripplewerkz', '2016-02-22 04:54:13', '2016-01-30', '2016-03-26', '2016-03-03', '2016-03-26', 1),
('Full Black Heels [E-Commerce]', 'benjo12', '2016-02-22 05:17:17', '2016-02-29', '2016-04-13', '2016-02-29', '2016-05-30', 1),
('Full Black Heels [E-Commerce]', 'vandavedecio', '2016-02-22 05:14:50', '2016-02-29', '2016-04-13', '2016-02-29', '2016-05-30', 1),
('Gadgets Glossary', 'debe2', '2016-04-14 00:00:57', NULL, NULL, NULL, NULL, 0),
('GAT [CMS + Responsive]', 'roy1', '2016-02-22 05:39:53', '2016-03-07', '2016-04-08', '2016-03-07', '2016-06-07', 1),
('Grapevine (Custom + Responsive + Logo)', 'ballalist', '2016-04-14 00:00:59', NULL, NULL, NULL, NULL, 0),
('Grapevine (Custom + Responsive + Logo)', 'marsd', '2016-04-14 00:00:59', NULL, NULL, NULL, NULL, 0),
('Great Skin FX', 'debe2', '2016-04-14 00:01:00', NULL, NULL, NULL, NULL, 0),
('Green Waste Recycling [CMS + Responsive]', 'bahri_ripplewerkz', '2016-02-22 05:35:37', '2016-03-07', '2016-04-08', '2016-03-07', '2016-06-07', 1),
('Green Waste Recycling [CMS + Responsive]', 'sirachon', '2016-02-22 05:35:49', '2016-03-06', '2016-04-07', '2016-03-06', '2016-06-06', 1),
('HafBox', 'john_pajarillo', '2016-02-22 05:00:42', '2016-03-19', '2016-05-18', '2016-03-19', NULL, 0),
('Hopscotch Bar [E-commerce]', 'pukpik', '2016-04-08 00:26:19', '2015-12-06', '2016-01-31', '2015-12-06', NULL, 0),
('Hopscotch Bar [E-commerce]', 'vandavedecio', '2016-04-08 00:26:19', '2015-12-02', '2016-01-27', '2015-12-02', NULL, 0),
('Hubb Records Butler', 'alexadayandayan', '2016-04-07 18:52:20', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Hubb Records Butler', 'ballalist', '2016-04-07 18:52:20', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Hubb Records Butler', 'benjo12', '2016-04-07 18:52:20', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Hubb Records Butler', 'chaisiri1', '2016-04-07 18:52:20', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Hubort Management [CMS + Responsive]', 'ballalist', '2016-04-07 17:23:59', '2016-03-30', '2016-05-25', '2016-03-30', NULL, 0),
('Hubort Management [CMS + Responsive]', 'ballalist', '2016-04-07 17:26:01', '2016-03-30', '2016-05-25', '2016-03-30', NULL, 0),
('Hubort Management [CMS + Responsive]', 'lesterjester', '2016-04-07 17:26:06', '2016-02-01', '2016-03-28', '2016-02-01', NULL, 0),
('Hubort Management [CMS + Responsive]', 'marsd', '2016-04-07 17:23:59', '2016-02-28', '2016-04-24', '2016-02-28', NULL, 0),
('Hubort Management [CMS + Responsive]', 'marsd', '2016-04-07 17:26:01', '2016-02-28', '2016-04-24', '2016-02-28', NULL, 0),
('Hubort Management [CMS + Responsive]', 'vandavedecio', '2016-04-07 17:26:06', '2016-02-28', '2016-04-24', '2016-02-28', NULL, 0),
('iFix,iBuy,iSell mobilephone [E-commerce]', 'zripplewerkz', '2016-04-14 00:01:23', NULL, NULL, NULL, NULL, 0),
('Innovez One [CMS + Responsive]', 'vandavedecio', '2016-02-22 05:34:01', '2016-02-07', '2016-04-03', '2016-03-06', '2016-06-06', 1),
('Jemsa Multistore', 'roy1', '2016-04-14 00:01:01', NULL, NULL, NULL, NULL, 0),
('JMT Leather [CMS]', 'vandavedecio', '2016-02-22 04:54:57', '2016-03-04', '2016-04-29', '2016-04-01', NULL, 0),
('Jurlesquez (eComm)', 'alexadayandayan', '2016-04-14 00:00:55', NULL, NULL, NULL, NULL, 0),
('Kaiwen Test 2', 'alexadayandayan', '2016-04-14 00:01:06', NULL, NULL, NULL, NULL, 0),
('Kaiwen Test 2', 'lesterjester', '2016-04-14 00:01:06', NULL, NULL, NULL, NULL, 0),
('Kaiwen Test 2', 'zripplewerkz', '2016-04-14 00:01:06', NULL, NULL, NULL, NULL, 0),
('kaiwen.16mar', 'benjo12', '2016-04-14 00:01:14', NULL, NULL, NULL, NULL, 0),
('kaiwen.16mar', 'chaisiri1', '2016-04-14 00:01:14', NULL, NULL, NULL, NULL, 0),
('kaiwen.16mar', 'sirachon', '2016-04-14 00:01:14', NULL, NULL, NULL, NULL, 0),
('kaiwen.16mar.2', 'benjo12', '2016-04-14 00:01:14', NULL, NULL, NULL, NULL, 0),
('kaiwen.16mar.2', 'john_pajarillo', '2016-04-14 00:01:14', NULL, NULL, NULL, NULL, 0),
('kaiwen.16mar.2', 'sirachon', '2016-04-14 00:01:14', NULL, NULL, NULL, NULL, 0),
('kaiwen.16mar.3', 'roy1', '2016-04-14 00:01:15', NULL, NULL, NULL, NULL, 0),
('kaiwen.16mar.4', 'benjo12', '2016-04-14 00:01:15', NULL, NULL, NULL, NULL, 0),
('kaiwen.16mar.5', 'sirachon', '2016-04-14 00:01:14', NULL, NULL, NULL, NULL, 0),
('kaiwen.16mar.5', 'vandavedecio', '2016-04-14 00:01:14', NULL, NULL, NULL, NULL, 0),
('kaiwen.18mar', 'marsd', '2016-04-14 00:01:16', NULL, NULL, NULL, NULL, 0),
('kaiwen.21mar', 'roy1', '2016-04-14 00:01:16', NULL, NULL, NULL, NULL, 0),
('kaiwen.21mar.1', 'benjo12', '2016-04-14 00:01:17', NULL, NULL, NULL, NULL, 0),
('kaiwen.21mar.1', 'debe2', '2016-04-14 00:01:17', NULL, NULL, NULL, NULL, 0),
('kaiwen.21mar.1', 'john_pajarillo', '2016-04-14 00:01:17', NULL, NULL, NULL, NULL, 0),
('Kajima Overseas Asia (CMS)', 'pukpik', '2016-04-14 00:00:58', NULL, NULL, NULL, NULL, 0),
('Kantar Media (DTAM) [CMS + Responsive]', 'benjo12', '2016-04-14 00:01:03', NULL, NULL, NULL, NULL, 0),
('kesmeen.tan.2013', 'alexadayandayan', '2016-04-14 00:01:10', NULL, NULL, NULL, NULL, 0),
('kesmeen.tan.2013', 'zripplewerkz', '2016-04-14 00:01:10', NULL, NULL, NULL, NULL, 0),
('kestestcron2', 'debe2', '2016-04-14 00:01:22', NULL, NULL, NULL, NULL, 0),
('kestestcronjob', 'alexadayandayan', '2016-04-14 00:01:21', NULL, NULL, NULL, NULL, 0),
('KHG Collections', 'marsd', '2016-02-22 05:20:48', '2016-01-12', '2016-03-08', '2016-02-21', '2016-04-08', 1),
('Kim Keat Hokkiean Mee [CMS]', 'pukpik', '2016-04-08 00:27:04', '2015-12-28', '2016-02-22', '2015-12-28', NULL, 0),
('KL Test 1', 'roy1', '2016-04-14 00:01:18', NULL, NULL, NULL, NULL, 0),
('KL Test 2', 'alexadayandayan', '2016-04-14 00:01:18', NULL, NULL, NULL, NULL, 0),
('KL Test 2', 'debe2', '2016-04-14 00:01:18', NULL, NULL, NULL, NULL, 0),
('KL Test 2', 'marsd', '2016-04-14 00:01:18', NULL, NULL, NULL, NULL, 0),
('KL Test 3', 'alexadayandayan', '2016-04-14 00:01:18', NULL, NULL, NULL, NULL, 0),
('KL Test 3', 'lesterjester', '2016-04-14 00:01:18', NULL, NULL, NULL, NULL, 0),
('KL Test 3', 'vandavedecio', '2016-04-14 00:01:18', NULL, NULL, NULL, NULL, 0),
('KL Test 3', 'zripplewerkz', '2016-04-14 00:01:18', NULL, NULL, NULL, NULL, 0),
('KLT2', 'marsd', '2016-04-14 00:01:19', NULL, NULL, NULL, NULL, 0),
('KLT6', 'ballalist', '2016-04-14 00:01:20', NULL, NULL, NULL, NULL, 0),
('KLT6', 'lesterjester', '2016-04-14 00:01:20', NULL, NULL, NULL, NULL, 0),
('KLT6', 'marsd', '2016-04-14 00:01:20', NULL, NULL, NULL, NULL, 0),
('Kraft Foods', 'marsd', '2016-04-07 17:21:12', '2016-02-19', '2016-04-15', '2016-02-19', NULL, 0),
('KW Test 1', 'bahri_ripplewerkz', '2016-04-14 00:01:19', NULL, NULL, NULL, NULL, 0),
('KW Test 1', 'debe2', '2016-04-14 00:01:19', NULL, NULL, NULL, NULL, 0),
('KW Test 1', 'john_pajarillo', '2016-04-14 00:01:19', NULL, NULL, NULL, NULL, 0),
('KW Test 1', 'lesterjester', '2016-04-14 00:01:19', NULL, NULL, NULL, NULL, 0),
('KW Test 1', 'sirachon', '2016-04-14 00:01:19', NULL, NULL, NULL, NULL, 0),
('KW Test 1', 'vandavedecio', '2016-04-14 00:01:19', NULL, NULL, NULL, NULL, 0),
('KW Test 1', 'zripplewerkz', '2016-04-14 00:01:19', NULL, NULL, NULL, NULL, 0),
('L''OREAL Singapore', 'roy1', '2016-04-14 00:01:21', NULL, NULL, NULL, NULL, 0),
('L-Intelligent Eduhub Pte. Ltd', 'bahri_ripplewerkz', '2016-04-07 18:16:10', '2016-02-19', '2016-04-15', '2016-02-19', NULL, 0),
('L.D. WAXSON (S) PTE LTD', 'zripplewerkz', '2016-04-07 18:16:55', '2015-12-23', '2016-02-17', '2015-12-23', NULL, 0),
('LBK', 'zripplewerkz', '2016-04-14 00:01:04', NULL, NULL, NULL, NULL, 0),
('Liberty Media [3 Page Static]', 'zripplewerkz', '2016-04-07 17:22:52', '2015-11-01', '2015-12-27', '2015-11-01', NULL, 0),
('Lifebuilders', 'debe2', '2016-04-07 18:52:03', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Mars Bar Pte Ltd [CMS]', 'chaisiri1', '2016-04-08 00:25:18', '2016-01-21', '2016-03-17', '2016-01-21', NULL, 0),
('Maven [CMS Integration]', 'marsd', '2016-02-22 05:04:38', '2016-02-21', '2016-04-03', '2016-02-21', '2016-04-10', 1),
('MAX TEST', 'ballalist', '2016-04-14 00:01:16', NULL, NULL, NULL, NULL, 0),
('MAX TEST 2', 'debe2', '2016-04-14 00:01:17', NULL, NULL, NULL, NULL, 0),
('MINERVA - INTRA', 'debe2', '2016-02-22 05:03:23', '2016-03-03', '2016-04-28', '2016-04-05', NULL, 0),
('Monster Beverage', 'roy1', '2016-04-07 17:20:24', '2015-12-23', '2016-02-17', '2015-12-23', NULL, 0),
('Mothership Can or Not', 'ballalist', '2016-04-14 00:01:01', NULL, NULL, NULL, NULL, 0),
('Mothership Mobile App', 'alexadayandayan', '2016-04-14 00:01:00', NULL, NULL, NULL, NULL, 0),
('Mothership Mobile App', 'bahri_ripplewerkz', '2016-04-14 00:01:00', NULL, NULL, NULL, NULL, 0),
('My Drum School - Responsive', 'bahri_ripplewerkz', '2016-02-22 04:42:29', '2015-11-23', '2016-02-23', '2015-11-23', '2016-02-23', 1),
('Nachuraru [E-Commerce + CMS + Responsive]', 'bahri_ripplewerkz', '2016-02-22 05:01:48', '2016-02-23', '2016-04-19', '2016-03-21', NULL, 0),
('Nachuraru [E-Commerce + CMS + Responsive]', 'roy1', '2016-02-22 05:01:25', '2016-02-23', '2016-04-19', '2016-03-21', NULL, 0),
('North Star Engineering [E-commerce + Responsive]', 'roy1', '2016-04-07 22:02:50', '2016-02-22', '2016-04-18', '2016-02-22', NULL, 0),
('Pacific Conferences', 'benjo12', '2016-04-07 18:52:18', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Pacific Conferences', 'sirachon', '2016-04-07 18:52:18', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Petronas Web', 'zripplewerkz', '2016-04-07 17:21:45', '2015-09-26', '2015-11-21', '2015-09-26', NULL, 0),
('Piccolo Pottery Co. (CMS + Responsive + Parallax)', 'lesterjester', '2016-04-07 21:41:16', '2016-02-15', '2016-04-11', '2016-02-15', NULL, 0),
('pleasework2', 'john_pajarillo', '2016-04-07 18:52:13', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Pluto Fried Rice [CMS]', 'lesterjester', '2016-04-07 22:01:36', '2015-12-09', '2016-02-03', '2015-12-09', NULL, 0),
('Procter and Gamble', 'roy1', '2016-04-07 18:11:31', '2017-10-28', '2017-12-23', NULL, NULL, 0),
('prof lee', 'roy1', '2016-04-14 00:01:09', NULL, NULL, NULL, NULL, 0),
('prof yeow leong', 'vandavedecio', '2016-04-14 00:01:09', NULL, NULL, NULL, NULL, 0),
('Purely Adoption [CMS]', 'benjo12', '2016-02-22 05:14:19', '2016-02-16', '2016-03-19', '2016-02-16', '2016-04-10', 1),
('Renaissance Design Group [CMS]', 'zripplewerkz', '2016-02-22 04:53:15', '2016-03-31', '2016-05-12', '2016-03-31', NULL, 0),
('Robert Yam & Co [Logo Tracing + CMS + Responsive]', 'lesterjester', '2016-02-22 05:31:46', '2016-01-25', '2016-03-21', '2016-03-05', '2016-06-05', 1),
('same name', 'ballalist', '2016-04-14 00:01:08', NULL, NULL, NULL, NULL, 0),
('SeaCAD [Responsive + CMS + Event Espresso (Training Courses) + E-Commerce]', 'zripplewerkz', '2016-02-22 05:41:03', '2016-03-31', '2016-05-26', NULL, NULL, 0),
('Sgwinecellar', 'chaisiri1', '2016-02-22 05:11:03', '2016-04-07', '2016-05-09', '2016-04-07', NULL, 0),
('Sgwinecellar', 'pukpik', '2016-02-22 05:13:06', '2016-02-21', '2016-04-17', '2016-02-21', NULL, 0),
('Snoopy Electric Components [CMS + Responsive]', 'bahri_ripplewerkz', '2016-04-07 21:53:14', '2016-01-22', '2016-03-18', '2016-01-22', NULL, 0),
('Starbucks Mobile', 'sirachon', '2016-04-07 17:19:49', '2015-12-23', '2016-02-17', '2015-12-23', NULL, 0),
('TaeBak Media [Responsive]', 'sirachon', '2016-04-07 21:59:09', '2016-01-29', '2016-03-25', '2016-01-29', NULL, 0),
('TAG TEAM INC. PTE LTD', 'lesterjester', '2016-04-07 18:17:18', '2016-04-23', '2016-07-12', NULL, NULL, 0),
('TAGIT PTE LTD', 'pukpik', '2016-04-07 18:17:49', '2016-09-12', '2016-11-07', NULL, NULL, 0),
('TAHAN CAPITAL MANAGEMENT PTE LTD', 'marsd', '2016-04-07 18:18:15', '2016-03-04', '2016-04-29', '2016-03-04', NULL, 0),
('test notif', 'marsd', '2016-04-14 00:01:10', NULL, NULL, NULL, NULL, 0),
('testnow', 'benjo12', '2016-04-14 00:01:09', NULL, NULL, NULL, NULL, 0),
('The Rad Label [E-commerce + Responsive]', 'pukpik', '2016-04-14 00:00:56', NULL, NULL, NULL, NULL, 0),
('tiffanyg.2013', 'alexadayandayan', '2016-04-14 00:01:12', NULL, NULL, NULL, NULL, 0),
('tiffanyg.2013', 'marsd', '2016-04-14 00:01:12', NULL, NULL, NULL, NULL, 0),
('tiffanyg.2013', 'zripplewerkz', '2016-04-14 00:01:12', NULL, NULL, NULL, NULL, 0),
('Twitter Blogging', 'lesterjester', '2016-04-07 17:14:38', '2015-12-30', '2016-02-24', '2015-12-30', NULL, 0),
('Twitter Blogging', 'pukpik', '2016-04-07 17:14:38', '2016-01-08', '2016-03-04', '2016-01-08', NULL, 0),
('Unseason', 'debe2', '2016-04-14 00:00:57', NULL, NULL, NULL, NULL, 0),
('Urk Market Supllies [E-commerce]', 'zripplewerkz', '2016-04-07 21:57:41', '2015-10-05', '2015-11-30', '2015-10-05', NULL, 0),
('Vlosophy (eComm)', 'ballalist', '2016-02-22 04:52:15', '2016-02-29', '2016-05-09', '2016-02-29', NULL, 0),
('weijun.loh.2013', 'benjo12', '2016-04-14 00:01:13', NULL, NULL, NULL, NULL, 0),
('Wolf Pte Ltd [CMS]', 'benjo12', '2016-04-07 21:38:41', '2016-02-28', '2016-04-24', '2016-02-28', NULL, 0),
('WSTAR', 'sirachon', '2016-02-22 05:02:41', '2016-02-12', '2016-04-08', '2016-03-20', '2016-04-08', 1),
('[Kayamila]', 'lesterjester', '2016-02-22 05:38:51', '2016-03-22', '2016-04-23', '2016-03-22', '2016-04-22', 1),
('[SoonChow]', 'ballalist', '2016-04-07 18:52:11', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `projectfunction`
--

CREATE TABLE `projectfunction` (
  `projectname` varchar(200) NOT NULL,
  `function` varchar(100) NOT NULL,
  `manday` int(11) NOT NULL DEFAULT '1',
  `description` varchar(8000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recommendationlog`
--

CREATE TABLE `recommendationlog` (
  `id` int(11) NOT NULL,
  `generated` varchar(8000) DEFAULT NULL,
  `selected` varchar(8000) DEFAULT NULL,
  `projectname` varchar(1000) DEFAULT NULL,
  `choice` int(11) DEFAULT '0',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recommendationlog`
--

INSERT INTO `recommendationlog` (`id`, `generated`, `selected`, `projectname`, `choice`, `updated`) VALUES
(2, '[[{"username":"bahri_ripplewerkz","nationality":"Indonesia","currentprojectcount":0,"earlieststart":"Feb 23, 2016","estimateworkingday":21,"estimateday":29,"scheduleperformance":1.0,"estimatecompletion":"Mar 23, 2016","idealcompletion":"Mar 23, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Feb 23, 2016","estimateworkingday":21,"estimateday":29,"scheduleperformance":1.0,"estimatecompletion":"Mar 23, 2016","idealcompletion":"Mar 23, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Feb 23, 2016","estimateworkingday":21,"estimateday":29,"scheduleperformance":1.0,"estimatecompletion":"Mar 23, 2016","idealcompletion":"Mar 23, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Feb 23, 2016","estimateworkingday":21,"estimateday":29,"scheduleperformance":1.0,"estimatecompletion":"Mar 23, 2016","idealcompletion":"Mar 23, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', 'My Drum School - Responsive', 1, '2016-02-22 04:42:30'),
(5, '[[{"username":"alexadayandayan","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Feb 25, 2016","estimateworkingday":200,"estimateday":280,"scheduleperformance":1.0,"estimatecompletion":"Dec 1, 2016","idealcompletion":"Dec 1, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Feb 25, 2016","estimateworkingday":200,"estimateday":280,"scheduleperformance":1.0,"estimatecompletion":"Dec 1, 2016","idealcompletion":"Dec 1, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Feb 25, 2016","estimateworkingday":200,"estimateday":280,"scheduleperformance":1.0,"estimatecompletion":"Dec 1, 2016","idealcompletion":"Dec 1, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Feb 25, 2016","estimateworkingday":200,"estimateday":280,"scheduleperformance":1.0,"estimatecompletion":"Dec 1, 2016","idealcompletion":"Dec 1, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', 'Jurlesquez (eComm)', 1, '2016-02-22 04:50:39'),
(6, '[[{"username":"ballalist","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Feb 29, 2016","estimateworkingday":50,"estimateday":70,"scheduleperformance":1.0,"estimatecompletion":"May 9, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Feb 29, 2016","estimateworkingday":50,"estimateday":70,"scheduleperformance":1.0,"estimatecompletion":"May 9, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Feb 29, 2016","estimateworkingday":50,"estimateday":70,"scheduleperformance":1.0,"estimatecompletion":"May 9, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Feb 29, 2016","estimateworkingday":50,"estimateday":70,"scheduleperformance":1.0,"estimatecompletion":"May 9, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', 'Vlosophy (eComm)', 1, '2016-02-22 04:52:16'),
(7, '[[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 31, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"May 12, 2016","idealcompletion":"May 12, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 31, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"May 12, 2016","idealcompletion":"May 12, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"bahri_ripplewerkz","nationality":"Indonesia","currentprojectcount":0,"earlieststart":"Mar 31, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"May 12, 2016","idealcompletion":"May 12, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 31, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"May 12, 2016","idealcompletion":"May 12, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', 'Renaissance Design Group [CMS]', 1, '2016-02-22 04:53:16'),
(8, '[[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 3, 2016","estimateworkingday":17,"estimateday":23,"scheduleperformance":1.0,"estimatecompletion":"Mar 26, 2016","idealcompletion":"Mar 26, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 3, 2016","estimateworkingday":17,"estimateday":23,"scheduleperformance":1.0,"estimatecompletion":"Mar 26, 2016","idealcompletion":"Mar 26, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Mar 3, 2016","estimateworkingday":17,"estimateday":23,"scheduleperformance":1.0,"estimatecompletion":"Mar 26, 2016","idealcompletion":"Mar 26, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 3, 2016","estimateworkingday":17,"estimateday":23,"scheduleperformance":1.0,"estimatecompletion":"Mar 26, 2016","idealcompletion":"Mar 26, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', 'Flave - Vanitytriad [E-Commerce]', 1, '2016-02-22 04:54:13'),
(9, '[[{"username":"vandavedecio","nationality":"Philippines","currentprojectcount":1,"earlieststart":"Apr 1, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Apr 29, 2016","idealcompletion":"Apr 29, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"john_pajarillo","nationality":"Philippines","currentprojectcount":1,"earlieststart":"May 6, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Jun 3, 2016","idealcompletion":"Jun 3, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":1,"earlieststart":"Mar 27, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Apr 24, 2016","idealcompletion":"Apr 24, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"john_pajarillo","nationality":"Philippines","currentprojectcount":1,"earlieststart":"May 6, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Jun 3, 2016","idealcompletion":"Jun 3, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', 'JMT Leather [CMS]', 1, '2016-02-22 04:54:57'),
(10, '[[{"username":"debe2","nationality":"Indonesia","currentprojectcount":0,"earlieststart":"Mar 7, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Apr 4, 2016","idealcompletion":"Apr 4, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Mar 7, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Apr 4, 2016","idealcompletion":"Apr 4, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":1,"earlieststart":"Mar 27, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Apr 24, 2016","idealcompletion":"Apr 24, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Mar 7, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Apr 4, 2016","idealcompletion":"Apr 4, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', '(2) Association of Funeral Directors (AFDS)', 1, '2016-02-22 04:55:48'),
(12, '[[{"username":"bahri_ripplewerkz","nationality":"Indonesia","currentprojectcount":1,"earlieststart":"Mar 24, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"May 5, 2016","idealcompletion":"May 5, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":1,"earlieststart":"Apr 21, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"Jun 2, 2016","idealcompletion":"Jun 2, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 10, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"Jun 21, 2016","idealcompletion":"Jun 21, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"marsd","nationality":"Singapore","currentprojectcount":1,"earlieststart":"Apr 21, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"Jun 2, 2016","idealcompletion":"Jun 2, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', '(2) My Singapore Food [CMS]', 1, '2016-02-22 04:57:46'),
(13, '[[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":2,"earlieststart":"May 13, 2016","estimateworkingday":33,"estimateday":46,"scheduleperformance":1.0,"estimatecompletion":"Jun 28, 2016","idealcompletion":"Jun 28, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 12, 2016","estimateworkingday":33,"estimateday":46,"scheduleperformance":1.0,"estimatecompletion":"Apr 27, 2016","idealcompletion":"Apr 27, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"bahri_ripplewerkz","nationality":"Indonesia","currentprojectcount":2,"earlieststart":"May 6, 2016","estimateworkingday":33,"estimateday":46,"scheduleperformance":1.0,"estimatecompletion":"Jun 21, 2016","idealcompletion":"Jun 21, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 12, 2016","estimateworkingday":33,"estimateday":46,"scheduleperformance":1.0,"estimatecompletion":"Apr 27, 2016","idealcompletion":"Apr 27, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', '1036liveseafood.com [Design only]', 1, '2016-02-22 04:58:49'),
(14, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 17, 2016","estimateworkingday":34,"estimateday":47,"scheduleperformance":1.0,"estimatecompletion":"May 3, 2016","idealcompletion":"May 3, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":1,"earlieststart":"Apr 21, 2016","estimateworkingday":34,"estimateday":47,"scheduleperformance":1.0,"estimatecompletion":"Jun 7, 2016","idealcompletion":"Jun 7, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 10, 2016","estimateworkingday":34,"estimateday":47,"scheduleperformance":1.0,"estimatecompletion":"Jun 26, 2016","idealcompletion":"Jun 26, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"marsd","nationality":"Singapore","currentprojectcount":1,"earlieststart":"Apr 21, 2016","estimateworkingday":34,"estimateday":47,"scheduleperformance":1.0,"estimatecompletion":"Jun 7, 2016","idealcompletion":"Jun 7, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', 'Abex Engineering [non-responsive CMS]', 1, '2016-02-22 04:59:53'),
(15, '[[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Mar 19, 2016","estimateworkingday":43,"estimateday":60,"scheduleperformance":1.0,"estimatecompletion":"May 18, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"benjo12","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 19, 2016","estimateworkingday":43,"estimateday":60,"scheduleperformance":1.0,"estimatecompletion":"May 18, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Mar 19, 2016","estimateworkingday":43,"estimateday":60,"scheduleperformance":1.0,"estimatecompletion":"May 18, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"benjo12","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 19, 2016","estimateworkingday":43,"estimateday":60,"scheduleperformance":1.0,"estimatecompletion":"May 18, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', 'HafBox', 1, '2016-02-22 05:00:42'),
(17, '[[{"username":"pukpik","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 19, 2016","estimateworkingday":14,"estimateday":19,"scheduleperformance":1.0,"estimatecompletion":"Jun 7, 2016","idealcompletion":"Jun 7, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"benjo12","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 23, 2016","estimateworkingday":14,"estimateday":19,"scheduleperformance":1.0,"estimatecompletion":"Apr 11, 2016","idealcompletion":"Apr 11, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 20, 2016","estimateworkingday":14,"estimateday":19,"scheduleperformance":1.0,"estimatecompletion":"May 9, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"benjo12","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 23, 2016","estimateworkingday":14,"estimateday":19,"scheduleperformance":1.0,"estimatecompletion":"Apr 11, 2016","idealcompletion":"Apr 11, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', 'WSTAR', 1, '2016-02-22 05:02:42'),
(18, '[[{"username":"debe2","nationality":"Indonesia","currentprojectcount":1,"earlieststart":"Apr 5, 2016","estimateworkingday":17,"estimateday":23,"scheduleperformance":1.0,"estimatecompletion":"Apr 28, 2016","idealcompletion":"Apr 28, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 20, 2016","estimateworkingday":17,"estimateday":23,"scheduleperformance":1.0,"estimatecompletion":"May 13, 2016","idealcompletion":"May 13, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":1,"earlieststart":"May 13, 2016","estimateworkingday":17,"estimateday":23,"scheduleperformance":1.0,"estimatecompletion":"Jun 5, 2016","idealcompletion":"Jun 5, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 20, 2016","estimateworkingday":17,"estimateday":23,"scheduleperformance":1.0,"estimatecompletion":"May 13, 2016","idealcompletion":"May 13, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', 'MINERVA - INTRA', 1, '2016-02-22 05:03:24'),
(19, '[[{"username":"marsd","nationality":"Singapore","currentprojectcount":1,"earlieststart":"Apr 21, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"Jun 2, 2016","idealcompletion":"Jun 2, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":1,"earlieststart":"May 4, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"Jun 15, 2016","idealcompletion":"Jun 15, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 10, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"Jun 21, 2016","idealcompletion":"Jun 21, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":1,"earlieststart":"May 4, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"Jun 15, 2016","idealcompletion":"Jun 15, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', 'Maven [CMS Integration]', 1, '2016-02-22 05:04:39'),
(20, '[[{"username":"pukpik","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 19, 2016","estimateworkingday":36,"estimateday":50,"scheduleperformance":1.0,"estimatecompletion":"Jul 8, 2016","idealcompletion":"Jul 8, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"benjo12","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 1, 2016","estimateworkingday":36,"estimateday":50,"scheduleperformance":1.0,"estimatecompletion":"May 21, 2016","idealcompletion":"May 21, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 20, 2016","estimateworkingday":36,"estimateday":50,"scheduleperformance":1.0,"estimatecompletion":"Jun 9, 2016","idealcompletion":"Jun 9, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"benjo12","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 1, 2016","estimateworkingday":36,"estimateday":50,"scheduleperformance":1.0,"estimatecompletion":"May 21, 2016","idealcompletion":"May 21, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', 'All That Jazz [CMS]', 1, '2016-02-22 05:05:29'),
(21, '[[{"username":"pukpik","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 19, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"Jun 4, 2016","idealcompletion":"Jun 4, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"benjo12","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 4, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"Apr 20, 2016","idealcompletion":"Apr 20, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 20, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"May 6, 2016","idealcompletion":"May 6, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"benjo12","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 4, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"Apr 20, 2016","idealcompletion":"Apr 20, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', 'Fashmob (E-Commerce)', 1, '2016-02-22 05:06:16'),
(22, '[[{"username":"benjo12","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 7, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"May 9, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"chaisiri1","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 7, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"May 9, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 7, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"May 9, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 7, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"May 9, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', 'Sgwinecellar', 2, '2016-02-22 05:11:04'),
(23, '[[{"username":"pukpik","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 19, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"Jun 20, 2016","idealcompletion":"Jun 20, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"benjo12","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"May 18, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 20, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"May 22, 2016","idealcompletion":"May 22, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 20, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"May 22, 2016","idealcompletion":"May 22, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', 'Purely Adoption [CMS]', 2, '2016-02-22 05:14:20'),
(24, '[[{"username":"bahri_ripplewerkz","nationality":"Indonesia","currentprojectcount":1,"earlieststart":"May 6, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"May 22, 2016","idealcompletion":"May 22, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":1,"earlieststart":"Apr 21, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"May 7, 2016","idealcompletion":"May 7, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 10, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"May 26, 2016","idealcompletion":"May 26, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 10, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"May 26, 2016","idealcompletion":"May 26, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', 'KHG Collections', 2, '2016-02-22 05:20:49'),
(25, '[[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":1,"earlieststart":"May 13, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"May 29, 2016","idealcompletion":"May 29, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":1,"earlieststart":"May 4, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"May 20, 2016","idealcompletion":"May 20, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"bahri_ripplewerkz","nationality":"Indonesia","currentprojectcount":1,"earlieststart":"May 6, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"May 22, 2016","idealcompletion":"May 22, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"bahri_ripplewerkz","nationality":"Indonesia","currentprojectcount":1,"earlieststart":"May 6, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"May 22, 2016","idealcompletion":"May 22, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', 'Robert Yam & Co [Logo Tracing + CMS + Responsive]', 2, '2016-02-22 05:31:46'),
(26, '[[{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 10, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"Jun 11, 2016","idealcompletion":"Jun 11, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":1,"earlieststart":"May 21, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"Jun 22, 2016","idealcompletion":"Jun 22, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Jun 3, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"Jul 5, 2016","idealcompletion":"Jul 5, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"marsd","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Jun 3, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"Jul 5, 2016","idealcompletion":"Jul 5, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', '[Kayamila]', 2, '2016-02-22 05:38:52'),
(27, '[[{"username":"john_pajarillo","nationality":"Philippines","currentprojectcount":0,"earlieststart":"May 6, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"Jun 7, 2016","idealcompletion":"Jun 7, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"May 6, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"Jun 7, 2016","idealcompletion":"Jun 7, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 10, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"Jun 11, 2016","idealcompletion":"Jun 11, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 10, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"Jun 11, 2016","idealcompletion":"Jun 11, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', 'GAT [CMS + Responsive]', 2, '2016-02-22 05:39:54'),
(28, '[[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Jul 7, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Aug 4, 2016","idealcompletion":"Aug 4, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Jul 7, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Aug 4, 2016","idealcompletion":"Aug 4, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"debe2","nationality":"Indonesia","currentprojectcount":1,"earlieststart":"Jul 28, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Aug 25, 2016","idealcompletion":"Aug 25, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"debe2","nationality":"Indonesia","currentprojectcount":1,"earlieststart":"Jul 28, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Aug 25, 2016","idealcompletion":"Aug 25, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', 'SeaCAD [Responsive + CMS + Event Espresso (Training Courses) + E-Commerce]', 2, '2016-02-22 05:41:04'),
(29, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-41,"estimateday":-57,"scheduleperformance":-1.625,"estimatecompletion":"Feb 12, 2016","idealcompletion":"May 14, 2016","defectlessfactor":0.8413,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4894,"sorting":0}],[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-32,"estimateday":-45,"scheduleperformance":-1.261053333333,"estimatecompletion":"Feb 24, 2016","idealcompletion":"May 14, 2016","defectlessfactor":0.2578,"schedulefactor":0.898,"avgdefectperproject":0.4,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.449,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-29,"estimateday":-40,"scheduleperformance":-1.1307,"estimatecompletion":"Feb 29, 2016","idealcompletion":"May 14, 2016","defectlessfactor":0.8413,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.4782,"sorting":0}]]', '[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-32,"estimateday":-45,"scheduleperformance":-1.261053333333,"estimatecompletion":"Feb 24, 2016","idealcompletion":"May 14, 2016","defectlessfactor":0.2578,"schedulefactor":0.898,"avgdefectperproject":0.4,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.449,"sorting":0}]', 'Facebook Virtual', 1, '2016-04-07 17:12:55'),
(30, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-33,"estimateday":-46,"scheduleperformance":-1.625,"estimatecompletion":"Feb 24, 2016","idealcompletion":"May 7, 2016","defectlessfactor":0.834,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6172,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-26,"estimateday":-36,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 4, 2016","idealcompletion":"May 7, 2016","defectlessfactor":0.3446,"schedulefactor":0.898,"avgdefectperproject":0.3333,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5157,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-33,"estimateday":-46,"scheduleperformance":-1.625,"estimatecompletion":"Feb 24, 2016","idealcompletion":"May 7, 2016","defectlessfactor":0.834,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6172,"sorting":0},{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-23,"estimateday":-32,"scheduleperformance":-1.1307,"estimatecompletion":"Mar 9, 2016","idealcompletion":"May 7, 2016","defectlessfactor":0.834,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5892,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-33,"estimateday":-46,"scheduleperformance":-1.625,"estimatecompletion":"Feb 24, 2016","idealcompletion":"May 7, 2016","defectlessfactor":0.834,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6172,"sorting":0},{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-17,"estimateday":-24,"scheduleperformance":-0.8438,"estimatecompletion":"Mar 16, 2016","idealcompletion":"May 7, 2016","defectlessfactor":0.834,"schedulefactor":0.6985,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.5189,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-33,"estimateday":-46,"scheduleperformance":-1.625,"estimatecompletion":"Feb 24, 2016","idealcompletion":"May 7, 2016","defectlessfactor":0.834,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6172,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-26,"estimateday":-36,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 4, 2016","idealcompletion":"May 7, 2016","defectlessfactor":0.3446,"schedulefactor":0.898,"avgdefectperproject":0.3333,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5157,"sorting":0}]', 'Twitter Blogging', 1, '2016-04-07 17:14:38'),
(31, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-49,"estimateday":-69,"scheduleperformance":-1.625,"estimatecompletion":"Jan 31, 2016","idealcompletion":"May 21, 2016","defectlessfactor":0.8315,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6749,"sorting":0}],[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-38,"estimateday":-53,"scheduleperformance":-1.261053333333,"estimatecompletion":"Feb 17, 2016","idealcompletion":"May 21, 2016","defectlessfactor":0.4129,"schedulefactor":0.898,"avgdefectperproject":0.2857,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.511,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-34,"estimateday":-48,"scheduleperformance":-1.1307,"estimatecompletion":"Feb 21, 2016","idealcompletion":"May 21, 2016","defectlessfactor":0.8315,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6536,"sorting":0}]]', '[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-38,"estimateday":-53,"scheduleperformance":-1.261053333333,"estimatecompletion":"Feb 17, 2016","idealcompletion":"May 21, 2016","defectlessfactor":0.4129,"schedulefactor":0.898,"avgdefectperproject":0.2857,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.511,"sorting":0}]', 'Starbucks Mobile', 1, '2016-04-07 17:19:49'),
(32, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-54,"estimateday":-76,"scheduleperformance":-1.625,"estimatecompletion":"Jan 24, 2016","idealcompletion":"May 25, 2016","defectlessfactor":0.8264,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6147,"sorting":0}],[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-42,"estimateday":-59,"scheduleperformance":-1.261053333333,"estimatecompletion":"Feb 10, 2016","idealcompletion":"May 25, 2016","defectlessfactor":0.4641,"schedulefactor":0.898,"avgdefectperproject":0.25,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5551,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-38,"estimateday":-53,"scheduleperformance":-1.1307,"estimatecompletion":"Feb 17, 2016","idealcompletion":"May 25, 2016","defectlessfactor":0.8264,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5867,"sorting":0}]]', '[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-38,"estimateday":-53,"scheduleperformance":-1.1307,"estimatecompletion":"Feb 17, 2016","idealcompletion":"May 25, 2016","defectlessfactor":0.8264,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5867,"sorting":0}]', 'Monster Beverage', 2, '2016-04-07 17:20:24'),
(33, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-11,"estimateday":-15,"scheduleperformance":-0.43785,"estimatecompletion":"Mar 25, 2016","idealcompletion":"May 11, 2016","defectlessfactor":0.9207,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6426,"sorting":0}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":4,"estimateday":6,"scheduleperformance":0.2024,"estimatecompletion":"Apr 15, 2016","idealcompletion":"May 11, 2016","defectlessfactor":0.0023,"schedulefactor":0.409,"avgdefectperproject":1.5,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.1753,"sorting":0}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":12,"estimateday":17,"scheduleperformance":0.5571,"estimatecompletion":"Apr 27, 2016","idealcompletion":"May 11, 2016","defectlessfactor":0.9207,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.3625,"sorting":0}]]', '[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":4,"estimateday":6,"scheduleperformance":0.2024,"estimatecompletion":"Apr 15, 2016","idealcompletion":"May 11, 2016","defectlessfactor":0.0023,"schedulefactor":0.409,"avgdefectperproject":1.5,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.1753,"sorting":0}]', 'Kraft Foods', 1, '2016-04-07 17:21:12'),
(34, '[[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-100,"estimateday":-140,"scheduleperformance":-3.2143,"estimatecompletion":"Nov 21, 2015","idealcompletion":"May 22, 2016","defectlessfactor":0.9713,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6466,"sorting":0}],[{"username":"debe2","nationality":"Indonesia","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-23,"estimateday":-33,"scheduleperformance":-0.737883333333,"estimatecompletion":"Mar 7, 2016","idealcompletion":"May 22, 2016","defectlessfactor":0.0778,"schedulefactor":0.3974,"avgdefectperproject":1.6,"experiencefactor":0.4,"projectexperiencecount":6,"zainessscore":0.2888,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":19,"estimateday":26,"scheduleperformance":0.6207,"estimatecompletion":"May 5, 2016","idealcompletion":"May 22, 2016","defectlessfactor":0.3192,"schedulefactor":0.1423,"avgdefectperproject":1.0,"experiencefactor":0.08,"projectexperiencecount":2,"zainessscore":0.1787,"sorting":0}]]', '[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-100,"estimateday":-140,"scheduleperformance":-3.2143,"estimatecompletion":"Nov 21, 2015","idealcompletion":"May 22, 2016","defectlessfactor":0.9713,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6466,"sorting":0}]', 'Petronas Web', 3, '2016-04-07 17:21:45');
INSERT INTO `recommendationlog` (`id`, `generated`, `selected`, `projectname`, `choice`, `updated`) VALUES
(35, '[[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-74,"estimateday":-104,"scheduleperformance":-3.2143,"estimatecompletion":"Dec 27, 2015","idealcompletion":"May 11, 2016","defectlessfactor":0.9713,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6466,"sorting":0}],[{"username":"debe2","nationality":"Indonesia","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-17,"estimateday":-24,"scheduleperformance":-0.737883333333,"estimatecompletion":"Mar 16, 2016","idealcompletion":"May 11, 2016","defectlessfactor":0.0778,"schedulefactor":0.3974,"avgdefectperproject":1.6,"experiencefactor":0.4,"projectexperiencecount":6,"zainessscore":0.2888,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":14,"estimateday":19,"scheduleperformance":0.6207,"estimatecompletion":"Apr 28, 2016","idealcompletion":"May 11, 2016","defectlessfactor":0.3192,"schedulefactor":0.1423,"avgdefectperproject":1.0,"experiencefactor":0.08,"projectexperiencecount":2,"zainessscore":0.1787,"sorting":0}]]', '[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-74,"estimateday":-104,"scheduleperformance":-3.2143,"estimatecompletion":"Dec 27, 2015","idealcompletion":"May 11, 2016","defectlessfactor":0.9713,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6466,"sorting":0}]', 'Liberty Media [3 Page Static]', 0, '2016-04-07 17:22:52'),
(36, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 15, 2016","estimateworkingday":-10,"estimateday":-14,"scheduleperformance":-0.43785,"estimatecompletion":"Apr 1, 2016","idealcompletion":"May 15, 2016","defectlessfactor":0.983,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.7482,"sorting":0},{"username":"marsd","nationality":"Singapore","currentprojectcount":1,"earlieststart":"Apr 18, 2016","estimateworkingday":4,"estimateday":6,"scheduleperformance":0.2024,"estimatecompletion":"Apr 24, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.0,"schedulefactor":0.409,"avgdefectperproject":1.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.1322,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 15, 2016","estimateworkingday":-10,"estimateday":-14,"scheduleperformance":-0.43785,"estimatecompletion":"Apr 1, 2016","idealcompletion":"May 15, 2016","defectlessfactor":0.983,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.7482,"sorting":0},{"username":"ballalist","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 15, 2016","estimateworkingday":12,"estimateday":17,"scheduleperformance":0.5571,"estimatecompletion":"May 2, 2016","idealcompletion":"May 15, 2016","defectlessfactor":0.983,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.536,"sorting":0}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":1,"earlieststart":"Apr 18, 2016","estimateworkingday":4,"estimateday":6,"scheduleperformance":0.2024,"estimatecompletion":"Apr 24, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.0,"schedulefactor":0.409,"avgdefectperproject":1.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.1322,"sorting":0},{"username":"ballalist","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 15, 2016","estimateworkingday":12,"estimateday":17,"scheduleperformance":0.5571,"estimatecompletion":"May 2, 2016","idealcompletion":"May 15, 2016","defectlessfactor":0.983,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.536,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 15, 2016","estimateworkingday":-10,"estimateday":-14,"scheduleperformance":-0.43785,"estimatecompletion":"Apr 1, 2016","idealcompletion":"May 15, 2016","defectlessfactor":0.983,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.7482,"sorting":0},{"username":"ballalist","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 15, 2016","estimateworkingday":12,"estimateday":17,"scheduleperformance":0.5571,"estimatecompletion":"May 2, 2016","idealcompletion":"May 15, 2016","defectlessfactor":0.983,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.536,"sorting":0}]', 'BA Foods [Responsive]', 1, '2016-04-07 17:23:25'),
(37, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-14,"estimateday":-19,"scheduleperformance":-0.43785,"estimatecompletion":"Mar 28, 2016","idealcompletion":"May 28, 2016","defectlessfactor":0.983,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6632,"sorting":0},{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":6,"estimateday":8,"scheduleperformance":0.2024,"estimatecompletion":"Apr 24, 2016","idealcompletion":"May 28, 2016","defectlessfactor":0.0,"schedulefactor":0.409,"avgdefectperproject":1.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.1746,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-14,"estimateday":-19,"scheduleperformance":-0.43785,"estimatecompletion":"Mar 28, 2016","idealcompletion":"May 28, 2016","defectlessfactor":0.983,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6632,"sorting":0},{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 2, 2016","estimateworkingday":16,"estimateday":23,"scheduleperformance":0.5571,"estimatecompletion":"May 25, 2016","idealcompletion":"Jun 13, 2016","defectlessfactor":0.983,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.3831,"sorting":0}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":6,"estimateday":8,"scheduleperformance":0.2024,"estimatecompletion":"Apr 24, 2016","idealcompletion":"May 28, 2016","defectlessfactor":0.0,"schedulefactor":0.409,"avgdefectperproject":1.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.1746,"sorting":0},{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 2, 2016","estimateworkingday":16,"estimateday":23,"scheduleperformance":0.5571,"estimatecompletion":"May 25, 2016","idealcompletion":"Jun 13, 2016","defectlessfactor":0.983,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.3831,"sorting":0}]]', '[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":6,"estimateday":8,"scheduleperformance":0.2024,"estimatecompletion":"Apr 24, 2016","idealcompletion":"May 28, 2016","defectlessfactor":0.0,"schedulefactor":0.409,"avgdefectperproject":1.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.1746,"sorting":0},{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 2, 2016","estimateworkingday":16,"estimateday":23,"scheduleperformance":0.5571,"estimatecompletion":"May 25, 2016","idealcompletion":"Jun 13, 2016","defectlessfactor":0.983,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.3831,"sorting":0}]', 'Hubort Management [CMS + Responsive]', 2, '2016-04-07 17:23:59'),
(38, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-36,"estimateday":-51,"scheduleperformance":-1.625,"estimatecompletion":"Feb 18, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.8264,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6147,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-28,"estimateday":-39,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 2, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.4641,"schedulefactor":0.898,"avgdefectperproject":0.25,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5551,"sorting":0},{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-25,"estimateday":-35,"scheduleperformance":-1.1307,"estimatecompletion":"Mar 5, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.8264,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5867,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-36,"estimateday":-51,"scheduleperformance":-1.625,"estimatecompletion":"Feb 18, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.8264,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6147,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-28,"estimateday":-39,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 2, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.4641,"schedulefactor":0.898,"avgdefectperproject":0.25,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5551,"sorting":0},{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-19,"estimateday":-26,"scheduleperformance":-0.8438,"estimatecompletion":"Mar 14, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.8264,"schedulefactor":0.6985,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.5164,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-36,"estimateday":-51,"scheduleperformance":-1.625,"estimatecompletion":"Feb 18, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.8264,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6147,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-28,"estimateday":-39,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 2, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.4641,"schedulefactor":0.898,"avgdefectperproject":0.25,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5551,"sorting":0},{"username":"vandavedecio","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-8,"estimateday":-12,"scheduleperformance":-0.35715,"estimatecompletion":"Mar 28, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.8264,"schedulefactor":0.4129,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.4486,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-36,"estimateday":-51,"scheduleperformance":-1.625,"estimatecompletion":"Feb 18, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.8264,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6147,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-28,"estimateday":-39,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 2, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.4641,"schedulefactor":0.898,"avgdefectperproject":0.25,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5551,"sorting":0},{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-19,"estimateday":-26,"scheduleperformance":-0.8438,"estimatecompletion":"Mar 14, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.8264,"schedulefactor":0.6985,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.5164,"sorting":0}]', 'Branslord [CMS]', 1, '2016-04-07 17:30:08'),
(39, '[[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Dec 4, 2017","estimateworkingday":-74,"estimateday":-104,"scheduleperformance":-3.2143,"estimatecompletion":"Aug 23, 2017","idealcompletion":"Jan 5, 2018","defectlessfactor":0.9713,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6466,"sorting":0}],[{"username":"debe2","nationality":"Indonesia","currentprojectcount":0,"earlieststart":"Dec 4, 2017","estimateworkingday":-17,"estimateday":-24,"scheduleperformance":-0.737883333333,"estimatecompletion":"Nov 10, 2017","idealcompletion":"Jan 5, 2018","defectlessfactor":0.0778,"schedulefactor":0.3974,"avgdefectperproject":1.6,"experiencefactor":0.4,"projectexperiencecount":6,"zainessscore":0.2888,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Dec 4, 2017","estimateworkingday":14,"estimateday":19,"scheduleperformance":0.6207,"estimatecompletion":"Dec 23, 2017","idealcompletion":"Jan 5, 2018","defectlessfactor":0.3192,"schedulefactor":0.1423,"avgdefectperproject":1.0,"experiencefactor":0.08,"projectexperiencecount":2,"zainessscore":0.1787,"sorting":0}]]', '[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Dec 4, 2017","estimateworkingday":14,"estimateday":19,"scheduleperformance":0.6207,"estimatecompletion":"Dec 23, 2017","idealcompletion":"Jan 5, 2018","defectlessfactor":0.3192,"schedulefactor":0.1423,"avgdefectperproject":1.0,"experiencefactor":0.08,"projectexperiencecount":2,"zainessscore":0.1787,"sorting":0}]', 'Procter and Gamble', 2, '2016-04-07 18:11:31'),
(40, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Dec 5, 2016","estimateworkingday":-20,"estimateday":-28,"scheduleperformance":-1.625,"estimatecompletion":"Nov 7, 2016","idealcompletion":"Dec 21, 2016","defectlessfactor":0.4721,"schedulefactor":0.9564,"avgdefectperproject":0.3333,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4978,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Dec 5, 2016","estimateworkingday":-16,"estimateday":-22,"scheduleperformance":-1.261053333333,"estimatecompletion":"Nov 13, 2016","idealcompletion":"Dec 21, 2016","defectlessfactor":0.5478,"schedulefactor":0.898,"avgdefectperproject":0.2222,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5827,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Dec 5, 2016","estimateworkingday":-20,"estimateday":-28,"scheduleperformance":-1.625,"estimatecompletion":"Nov 7, 2016","idealcompletion":"Dec 21, 2016","defectlessfactor":0.4721,"schedulefactor":0.9564,"avgdefectperproject":0.3333,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4978,"sorting":0},{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Dec 5, 2016","estimateworkingday":-14,"estimateday":-19,"scheduleperformance":-1.1307,"estimatecompletion":"Nov 16, 2016","idealcompletion":"Dec 21, 2016","defectlessfactor":0.8508,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5948,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Dec 5, 2016","estimateworkingday":-20,"estimateday":-28,"scheduleperformance":-1.625,"estimatecompletion":"Nov 7, 2016","idealcompletion":"Dec 21, 2016","defectlessfactor":0.4721,"schedulefactor":0.9564,"avgdefectperproject":0.3333,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4978,"sorting":0},{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Dec 5, 2016","estimateworkingday":-11,"estimateday":-15,"scheduleperformance":-0.8438,"estimatecompletion":"Nov 20, 2016","idealcompletion":"Dec 21, 2016","defectlessfactor":0.8508,"schedulefactor":0.6985,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.5245,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Dec 5, 2016","estimateworkingday":-20,"estimateday":-28,"scheduleperformance":-1.625,"estimatecompletion":"Nov 7, 2016","idealcompletion":"Dec 21, 2016","defectlessfactor":0.4721,"schedulefactor":0.9564,"avgdefectperproject":0.3333,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4978,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Dec 5, 2016","estimateworkingday":-16,"estimateday":-22,"scheduleperformance":-1.261053333333,"estimatecompletion":"Nov 13, 2016","idealcompletion":"Dec 21, 2016","defectlessfactor":0.5478,"schedulefactor":0.898,"avgdefectperproject":0.2222,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5827,"sorting":0}]', '25 HOURS TIME INTERNATIONAL PTE LTD', 0, '2016-04-07 18:12:35'),
(41, '[[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Sep 9, 2016","estimateworkingday":-4,"estimateday":-5,"scheduleperformance":-1.1307,"estimatecompletion":"Sep 4, 2016","idealcompletion":"Sep 14, 2016","defectlessfactor":0.8413,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5916,"sorting":1},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Sep 9, 2016","estimateworkingday":-4,"estimateday":-6,"scheduleperformance":-1.261053333333,"estimatecompletion":"Sep 3, 2016","idealcompletion":"Sep 14, 2016","defectlessfactor":0.5714,"schedulefactor":0.898,"avgdefectperproject":0.2,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5905,"sorting":1}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Sep 9, 2016","estimateworkingday":-4,"estimateday":-5,"scheduleperformance":-1.1307,"estimatecompletion":"Sep 4, 2016","idealcompletion":"Sep 14, 2016","defectlessfactor":0.8413,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5916,"sorting":1},{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Sep 9, 2016","estimateworkingday":-5,"estimateday":-7,"scheduleperformance":-1.625,"estimatecompletion":"Sep 2, 2016","idealcompletion":"Sep 14, 2016","defectlessfactor":0.5714,"schedulefactor":0.9564,"avgdefectperproject":0.25,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.5306,"sorting":1}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Sep 9, 2016","estimateworkingday":-4,"estimateday":-5,"scheduleperformance":-1.1307,"estimatecompletion":"Sep 4, 2016","idealcompletion":"Sep 14, 2016","defectlessfactor":0.8413,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5916,"sorting":1},{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Sep 9, 2016","estimateworkingday":-3,"estimateday":-4,"scheduleperformance":-0.8125,"estimatecompletion":"Sep 5, 2016","idealcompletion":"Sep 14, 2016","defectlessfactor":0.8413,"schedulefactor":0.6844,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.5299,"sorting":1}]]', '[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Sep 9, 2016","estimateworkingday":-4,"estimateday":-5,"scheduleperformance":-1.1307,"estimatecompletion":"Sep 4, 2016","idealcompletion":"Sep 14, 2016","defectlessfactor":0.8413,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5916,"sorting":1},{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Sep 9, 2016","estimateworkingday":-5,"estimateday":-7,"scheduleperformance":-1.625,"estimatecompletion":"Sep 2, 2016","idealcompletion":"Sep 14, 2016","defectlessfactor":0.5714,"schedulefactor":0.9564,"avgdefectperproject":0.25,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.5306,"sorting":1}]', '3 DEGREES ASSET MANAGEMENT PTE LTD', 1, '2016-04-07 18:13:27'),
(42, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Jul 3, 2016","estimateworkingday":-5,"estimateday":-7,"scheduleperformance":-1.625,"estimatecompletion":"Jun 26, 2016","idealcompletion":"Jul 7, 2016","defectlessfactor":0.6293,"schedulefactor":0.9564,"avgdefectperproject":0.2,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4364,"sorting":0}],[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Jul 3, 2016","estimateworkingday":-4,"estimateday":-6,"scheduleperformance":-1.261053333333,"estimatecompletion":"Jun 27, 2016","idealcompletion":"Jul 7, 2016","defectlessfactor":0.5636,"schedulefactor":0.898,"avgdefectperproject":0.2,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5254,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Jul 3, 2016","estimateworkingday":-4,"estimateday":-5,"scheduleperformance":-1.1307,"estimatecompletion":"Jun 29, 2016","idealcompletion":"Jul 7, 2016","defectlessfactor":0.8389,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.4776,"sorting":0}]]', '[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Jul 3, 2016","estimateworkingday":-4,"estimateday":-6,"scheduleperformance":-1.261053333333,"estimatecompletion":"Jun 27, 2016","idealcompletion":"Jul 7, 2016","defectlessfactor":0.5636,"schedulefactor":0.898,"avgdefectperproject":0.2,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5254,"sorting":0}]', '3 DEGREES HOSPITALITY PTE LTD', 1, '2016-04-07 18:14:24'),
(43, '[[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 29, 2016","estimateworkingday":-13,"estimateday":-18,"scheduleperformance":-1.1307,"estimatecompletion":"Apr 11, 2016","idealcompletion":"May 14, 2016","defectlessfactor":0.8365,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6561,"sorting":1}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 29, 2016","estimateworkingday":-9,"estimateday":-13,"scheduleperformance":-0.8125,"estimatecompletion":"Apr 16, 2016","idealcompletion":"May 14, 2016","defectlessfactor":0.8365,"schedulefactor":0.6844,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6094,"sorting":1}],[{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 29, 2016","estimateworkingday":-10,"estimateday":-13,"scheduleperformance":-0.8438,"estimatecompletion":"Apr 16, 2016","idealcompletion":"May 14, 2016","defectlessfactor":0.8365,"schedulefactor":0.6985,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.6029,"sorting":1}]]', '[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 29, 2016","estimateworkingday":-13,"estimateday":-18,"scheduleperformance":-1.1307,"estimatecompletion":"Apr 11, 2016","idealcompletion":"May 14, 2016","defectlessfactor":0.8365,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6561,"sorting":1}]', 'L', NULL, '2016-04-07 18:15:41'),
(44, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 25, 2016","estimateworkingday":-7,"estimateday":-10,"scheduleperformance":-0.43785,"estimatecompletion":"Apr 15, 2016","idealcompletion":"May 16, 2016","defectlessfactor":0.9977,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5361,"sorting":0}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 25, 2016","estimateworkingday":3,"estimateday":4,"scheduleperformance":0.2024,"estimatecompletion":"Apr 29, 2016","idealcompletion":"May 16, 2016","defectlessfactor":0.0,"schedulefactor":0.409,"avgdefectperproject":0.75,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.1622,"sorting":0}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":3,"earlieststart":"May 28, 2016","estimateworkingday":8,"estimateday":11,"scheduleperformance":0.5571,"estimatecompletion":"Jun 8, 2016","idealcompletion":"Jun 18, 2016","defectlessfactor":0.9977,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.3039,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 25, 2016","estimateworkingday":-7,"estimateday":-10,"scheduleperformance":-0.43785,"estimatecompletion":"Apr 15, 2016","idealcompletion":"May 16, 2016","defectlessfactor":0.9977,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5361,"sorting":0}]', 'L-Intelligent Eduhub Pte. Ltd', 1, '2016-04-07 18:16:11'),
(45, '[[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"May 3, 2016","estimateworkingday":-55,"estimateday":-77,"scheduleperformance":-3.2143,"estimatecompletion":"Feb 17, 2016","idealcompletion":"May 26, 2016","defectlessfactor":1.0,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6561,"sorting":0}],[{"username":"debe2","nationality":"Indonesia","currentprojectcount":0,"earlieststart":"May 3, 2016","estimateworkingday":-13,"estimateday":-18,"scheduleperformance":-0.737883333333,"estimatecompletion":"Apr 15, 2016","idealcompletion":"May 26, 2016","defectlessfactor":0.0,"schedulefactor":0.3974,"avgdefectperproject":1.6,"experiencefactor":0.4,"projectexperiencecount":6,"zainessscore":0.2631,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"May 3, 2016","estimateworkingday":10,"estimateday":14,"scheduleperformance":0.6207,"estimatecompletion":"May 18, 2016","idealcompletion":"May 26, 2016","defectlessfactor":0.8554,"schedulefactor":0.1423,"avgdefectperproject":0.5,"experiencefactor":0.08,"projectexperiencecount":2,"zainessscore":0.3556,"sorting":0}]]', '[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"May 3, 2016","estimateworkingday":-55,"estimateday":-77,"scheduleperformance":-3.2143,"estimatecompletion":"Feb 17, 2016","idealcompletion":"May 26, 2016","defectlessfactor":1.0,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6561,"sorting":0}]', 'L.D. WAXSON (S) PTE LTD', 0, '2016-04-07 18:16:56'),
(46, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Dec 2, 2019","estimateworkingday":-52,"estimateday":-73,"scheduleperformance":-1.625,"estimatecompletion":"Sep 20, 2019","idealcompletion":"Jan 15, 2020","defectlessfactor":0.6255,"schedulefactor":0.9564,"avgdefectperproject":0.2,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.5484,"sorting":0}],[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Dec 2, 2019","estimateworkingday":-41,"estimateday":-57,"scheduleperformance":-1.261053333333,"estimatecompletion":"Oct 6, 2019","idealcompletion":"Jan 15, 2020","defectlessfactor":0.591,"schedulefactor":0.898,"avgdefectperproject":0.1818,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.597,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Dec 2, 2019","estimateworkingday":-37,"estimateday":-51,"scheduleperformance":-1.1307,"estimatecompletion":"Oct 12, 2019","idealcompletion":"Jan 15, 2020","defectlessfactor":0.8365,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.59,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Dec 2, 2019","estimateworkingday":-52,"estimateday":-73,"scheduleperformance":-1.625,"estimatecompletion":"Sep 20, 2019","idealcompletion":"Jan 15, 2020","defectlessfactor":0.6255,"schedulefactor":0.9564,"avgdefectperproject":0.2,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.5484,"sorting":0}]', 'TAG TEAM INC. PTE LTD', 1, '2016-04-07 18:17:19'),
(47, '[[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Jan 1, 2017","estimateworkingday":-40,"estimateday":-55,"scheduleperformance":-1.261053333333,"estimatecompletion":"Nov 7, 2016","idealcompletion":"Feb 13, 2017","defectlessfactor":0.5871,"schedulefactor":0.898,"avgdefectperproject":0.1818,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5313,"sorting":1}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Jan 1, 2017","estimateworkingday":-36,"estimateday":-50,"scheduleperformance":-1.1307,"estimatecompletion":"Nov 12, 2016","idealcompletion":"Feb 13, 2017","defectlessfactor":0.834,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.4764,"sorting":1}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Jan 1, 2017","estimateworkingday":-51,"estimateday":-71,"scheduleperformance":-1.625,"estimatecompletion":"Oct 22, 2016","idealcompletion":"Feb 13, 2017","defectlessfactor":0.6628,"schedulefactor":0.9564,"avgdefectperproject":0.1667,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4448,"sorting":1}]]', '[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Jan 1, 2017","estimateworkingday":-40,"estimateday":-55,"scheduleperformance":-1.261053333333,"estimatecompletion":"Nov 7, 2016","idealcompletion":"Feb 13, 2017","defectlessfactor":0.5871,"schedulefactor":0.898,"avgdefectperproject":0.1818,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5313,"sorting":1}]', 'TAGIT PTE LTD', 0, '2016-04-07 18:17:49'),
(48, '[[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"May 5, 2016","estimateworkingday":-6,"estimateday":-8,"scheduleperformance":-1.1307,"estimatecompletion":"Apr 27, 2016","idealcompletion":"May 12, 2016","defectlessfactor":0.8315,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6536,"sorting":1}],[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"May 5, 2016","estimateworkingday":-7,"estimateday":-9,"scheduleperformance":-1.261053333333,"estimatecompletion":"Apr 27, 2016","idealcompletion":"May 12, 2016","defectlessfactor":0.6064,"schedulefactor":0.898,"avgdefectperproject":0.1667,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.6077,"sorting":1}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"May 5, 2016","estimateworkingday":-5,"estimateday":-6,"scheduleperformance":-0.8125,"estimatecompletion":"Apr 29, 2016","idealcompletion":"May 12, 2016","defectlessfactor":0.8315,"schedulefactor":0.6844,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6068,"sorting":1}]]', '[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"May 5, 2016","estimateworkingday":-5,"estimateday":-6,"scheduleperformance":-0.8125,"estimatecompletion":"Apr 29, 2016","idealcompletion":"May 12, 2016","defectlessfactor":0.8315,"schedulefactor":0.6844,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6068,"sorting":1}]', 'TAHAN CAPITAL MANAGEMENT PTE LTD', 2, '2016-04-07 18:18:15'),
(49, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-20,"estimateday":-28,"scheduleperformance":-1.625,"estimatecompletion":"Mar 19, 2016","idealcompletion":"May 2, 2016","defectlessfactor":0.2206,"schedulefactor":0.9564,"avgdefectperproject":0.6667,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.3342,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-16,"estimateday":-22,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 25, 2016","idealcompletion":"May 2, 2016","defectlessfactor":0.758,"schedulefactor":0.898,"avgdefectperproject":0.1667,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.574,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-20,"estimateday":-28,"scheduleperformance":-1.625,"estimatecompletion":"Mar 19, 2016","idealcompletion":"May 2, 2016","defectlessfactor":0.2206,"schedulefactor":0.9564,"avgdefectperproject":0.6667,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.3342,"sorting":0},{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-14,"estimateday":-19,"scheduleperformance":-1.1307,"estimatecompletion":"Mar 28, 2016","idealcompletion":"May 2, 2016","defectlessfactor":0.9147,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.4966,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-20,"estimateday":-28,"scheduleperformance":-1.625,"estimatecompletion":"Mar 19, 2016","idealcompletion":"May 2, 2016","defectlessfactor":0.2206,"schedulefactor":0.9564,"avgdefectperproject":0.6667,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.3342,"sorting":0},{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-11,"estimateday":-15,"scheduleperformance":-0.8438,"estimatecompletion":"Apr 1, 2016","idealcompletion":"May 2, 2016","defectlessfactor":0.9147,"schedulefactor":0.6985,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.4233,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-20,"estimateday":-28,"scheduleperformance":-1.625,"estimatecompletion":"Mar 19, 2016","idealcompletion":"May 2, 2016","defectlessfactor":0.2206,"schedulefactor":0.9564,"avgdefectperproject":0.6667,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.3342,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-16,"estimateday":-22,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 25, 2016","idealcompletion":"May 2, 2016","defectlessfactor":0.758,"schedulefactor":0.898,"avgdefectperproject":0.1667,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.574,"sorting":0}]', 'Decendents of the Sky [Responsive]', 0, '2016-04-07 21:35:06'),
(50, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":1,"earlieststart":"Apr 27, 2016","estimateworkingday":-12,"estimateday":-16,"scheduleperformance":-0.43785,"estimatecompletion":"Apr 11, 2016","idealcompletion":"Jun 2, 2016","defectlessfactor":0.9977,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5361,"sorting":1}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":3,"earlieststart":"May 28, 2016","estimateworkingday":14,"estimateday":20,"scheduleperformance":0.5571,"estimatecompletion":"Jun 17, 2016","idealcompletion":"Jul 3, 2016","defectlessfactor":0.9977,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.3039,"sorting":1}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":5,"earlieststart":"May 8, 2016","estimateworkingday":5,"estimateday":7,"scheduleperformance":0.2024,"estimatecompletion":"May 15, 2016","idealcompletion":"Jun 13, 2016","defectlessfactor":0.0,"schedulefactor":0.409,"avgdefectperproject":0.75,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.1622,"sorting":1}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":1,"earlieststart":"Apr 27, 2016","estimateworkingday":-12,"estimateday":-16,"scheduleperformance":-0.43785,"estimatecompletion":"Apr 11, 2016","idealcompletion":"Jun 2, 2016","defectlessfactor":0.9977,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5361,"sorting":1}]', 'Piccolo Pottery Co. (CMS + Responsive + Parallax)', 0, '2016-04-07 21:41:16'),
(51, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":2,"earlieststart":"Apr 27, 2016","estimateworkingday":-9,"estimateday":-13,"scheduleperformance":-0.43785,"estimatecompletion":"Apr 14, 2016","idealcompletion":"May 25, 2016","defectlessfactor":0.9977,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.7327,"sorting":0}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":5,"earlieststart":"May 8, 2016","estimateworkingday":4,"estimateday":5,"scheduleperformance":0.2024,"estimatecompletion":"May 13, 2016","idealcompletion":"Jun 5, 2016","defectlessfactor":0.0,"schedulefactor":0.409,"avgdefectperproject":0.75,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.2345,"sorting":0}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":3,"earlieststart":"May 28, 2016","estimateworkingday":11,"estimateday":15,"scheduleperformance":0.5571,"estimatecompletion":"Jun 12, 2016","idealcompletion":"Jun 25, 2016","defectlessfactor":0.9977,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.3284,"sorting":0}]]', '[{"username":"ballalist","nationality":"Thailand","currentprojectcount":3,"earlieststart":"May 28, 2016","estimateworkingday":11,"estimateday":15,"scheduleperformance":0.5571,"estimatecompletion":"Jun 12, 2016","idealcompletion":"Jun 25, 2016","defectlessfactor":0.9977,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.3284,"sorting":0}]', 'Big Beauty Boss Pte Ltd [Static + HTML + Responsive + CMS]', 2, '2016-04-07 21:49:05'),
(52, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-26,"estimateday":-37,"scheduleperformance":-1.625,"estimatecompletion":"Mar 10, 2016","idealcompletion":"May 8, 2016","defectlessfactor":0.2033,"schedulefactor":0.9564,"avgdefectperproject":0.7143,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.3299,"sorting":0}],[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-21,"estimateday":-29,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 18, 2016","idealcompletion":"May 8, 2016","defectlessfactor":0.7422,"schedulefactor":0.898,"avgdefectperproject":0.1538,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5701,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-19,"estimateday":-26,"scheduleperformance":-1.1307,"estimatecompletion":"Mar 21, 2016","idealcompletion":"May 8, 2016","defectlessfactor":0.8997,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.4928,"sorting":0}]]', '[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-21,"estimateday":-29,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 18, 2016","idealcompletion":"May 8, 2016","defectlessfactor":0.7422,"schedulefactor":0.898,"avgdefectperproject":0.1538,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5701,"sorting":0}]', 'Snoopy Electric Components [CMS + Responsive]', 1, '2016-04-07 21:53:14'),
(53, '[[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 14, 2016","estimateworkingday":-129,"estimateday":-181,"scheduleperformance":-3.2143,"estimatecompletion":"Oct 16, 2015","idealcompletion":"Jun 9, 2016","defectlessfactor":0.9964,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6549,"sorting":0}],[{"username":"debe2","nationality":"Indonesia","currentprojectcount":1,"earlieststart":"Apr 23, 2016","estimateworkingday":-30,"estimateday":-42,"scheduleperformance":-0.737883333333,"estimatecompletion":"Mar 12, 2016","idealcompletion":"Jun 18, 2016","defectlessfactor":0.2643,"schedulefactor":0.3974,"avgdefectperproject":1.6,"experiencefactor":0.4,"projectexperiencecount":6,"zainessscore":0.3504,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 14, 2016","estimateworkingday":24,"estimateday":34,"scheduleperformance":0.6207,"estimatecompletion":"May 18, 2016","idealcompletion":"Jun 9, 2016","defectlessfactor":0.0197,"schedulefactor":0.1423,"avgdefectperproject":1.5,"experiencefactor":0.08,"projectexperiencecount":2,"zainessscore":0.0799,"sorting":0}]]', '[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 14, 2016","estimateworkingday":-129,"estimateday":-181,"scheduleperformance":-3.2143,"estimatecompletion":"Oct 16, 2015","idealcompletion":"Jun 9, 2016","defectlessfactor":0.9964,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6549,"sorting":0}]', 'Doves Supplies [E-commerce + CMS + responsive]', 1, '2016-04-07 21:54:50'),
(54, '[[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-94,"estimateday":-131,"scheduleperformance":-3.2143,"estimatecompletion":"Nov 30, 2015","idealcompletion":"May 19, 2016","defectlessfactor":0.9964,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6549,"sorting":0}],[{"username":"debe2","nationality":"Indonesia","currentprojectcount":1,"earlieststart":"Apr 23, 2016","estimateworkingday":-22,"estimateday":-30,"scheduleperformance":-0.737883333333,"estimatecompletion":"Mar 24, 2016","idealcompletion":"Jun 2, 2016","defectlessfactor":0.2643,"schedulefactor":0.3974,"avgdefectperproject":1.6,"experiencefactor":0.4,"projectexperiencecount":6,"zainessscore":0.3504,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":1,"earlieststart":"Apr 18, 2016","estimateworkingday":18,"estimateday":25,"scheduleperformance":0.6207,"estimatecompletion":"May 13, 2016","idealcompletion":"May 28, 2016","defectlessfactor":0.0197,"schedulefactor":0.1423,"avgdefectperproject":1.5,"experiencefactor":0.08,"projectexperiencecount":2,"zainessscore":0.0799,"sorting":0}]]', '[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-94,"estimateday":-131,"scheduleperformance":-3.2143,"estimatecompletion":"Nov 30, 2015","idealcompletion":"May 19, 2016","defectlessfactor":0.9964,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6549,"sorting":0}]', 'Urk Market Supllies [E-commerce]', 0, '2016-04-07 21:57:41'),
(55, '[[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-16,"estimateday":-22,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 18, 2016","idealcompletion":"Apr 25, 2016","defectlessfactor":0.7549,"schedulefactor":0.898,"avgdefectperproject":0.1429,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.6511,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-14,"estimateday":-19,"scheduleperformance":-1.1307,"estimatecompletion":"Mar 21, 2016","idealcompletion":"Apr 25, 2016","defectlessfactor":0.898,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6103,"sorting":0}],[{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-11,"estimateday":-15,"scheduleperformance":-0.8438,"estimatecompletion":"Mar 25, 2016","idealcompletion":"Apr 25, 2016","defectlessfactor":0.898,"schedulefactor":0.6985,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.54,"sorting":0}]]', '[{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-11,"estimateday":-15,"scheduleperformance":-0.8438,"estimatecompletion":"Mar 25, 2016","idealcompletion":"Apr 25, 2016","defectlessfactor":0.898,"schedulefactor":0.6985,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.54,"sorting":0}]', 'TaeBak Media [Responsive]', 2, '2016-04-07 21:59:09'),
(56, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 22, 2016","estimateworkingday":-57,"estimateday":-80,"scheduleperformance":-1.625,"estimatecompletion":"Feb 3, 2016","idealcompletion":"Jun 10, 2016","defectlessfactor":0.2005,"schedulefactor":0.9564,"avgdefectperproject":0.7143,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4082,"sorting":0}],[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 22, 2016","estimateworkingday":-45,"estimateday":-62,"scheduleperformance":-1.261053333333,"estimatecompletion":"Feb 20, 2016","idealcompletion":"Jun 10, 2016","defectlessfactor":0.7549,"schedulefactor":0.898,"avgdefectperproject":0.1429,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.6511,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 22, 2016","estimateworkingday":-40,"estimateday":-56,"scheduleperformance":-1.1307,"estimatecompletion":"Feb 26, 2016","idealcompletion":"Jun 10, 2016","defectlessfactor":0.898,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6103,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 22, 2016","estimateworkingday":-57,"estimateday":-80,"scheduleperformance":-1.625,"estimatecompletion":"Feb 3, 2016","idealcompletion":"Jun 10, 2016","defectlessfactor":0.2005,"schedulefactor":0.9564,"avgdefectperproject":0.7143,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4082,"sorting":0}]', 'Pluto Fried Rice [CMS]', 1, '2016-04-07 22:01:37');
INSERT INTO `recommendationlog` (`id`, `generated`, `selected`, `projectname`, `choice`, `updated`) VALUES
(57, '[[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 10, 2016","estimateworkingday":-26,"estimateday":-36,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 5, 2016","idealcompletion":"May 8, 2016","defectlessfactor":0.8023,"schedulefactor":0.898,"avgdefectperproject":0.1429,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5851,"sorting":1}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 18, 2016","estimateworkingday":-23,"estimateday":-32,"scheduleperformance":-1.1307,"estimatecompletion":"Mar 17, 2016","idealcompletion":"May 16, 2016","defectlessfactor":0.9099,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.4954,"sorting":1}],[{"username":"vandavedecio","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 10, 2016","estimateworkingday":-8,"estimateday":-11,"scheduleperformance":-0.35715,"estimatecompletion":"Mar 30, 2016","idealcompletion":"May 8, 2016","defectlessfactor":0.9099,"schedulefactor":0.4129,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.3907,"sorting":1}]]', '[{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 18, 2016","estimateworkingday":-23,"estimateday":-32,"scheduleperformance":-1.1307,"estimatecompletion":"Mar 17, 2016","idealcompletion":"May 16, 2016","defectlessfactor":0.9099,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.4954,"sorting":1}]', 'Mars Bar Pte Ltd [CMS]', 1, '2016-04-08 00:25:18'),
(58, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":2,"earlieststart":"Apr 27, 2016","estimateworkingday":-65,"estimateday":-92,"scheduleperformance":-1.625,"estimatecompletion":"Jan 27, 2016","idealcompletion":"Jun 22, 2016","defectlessfactor":0.4247,"schedulefactor":0.9564,"avgdefectperproject":0.625,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4822,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 11, 2016","estimateworkingday":-51,"estimateday":-71,"scheduleperformance":-1.261053333333,"estimatecompletion":"Jan 31, 2016","idealcompletion":"Jun 6, 2016","defectlessfactor":0.8023,"schedulefactor":0.898,"avgdefectperproject":0.1429,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.6667,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":2,"earlieststart":"Apr 27, 2016","estimateworkingday":-65,"estimateday":-92,"scheduleperformance":-1.625,"estimatecompletion":"Jan 27, 2016","idealcompletion":"Jun 22, 2016","defectlessfactor":0.4247,"schedulefactor":0.9564,"avgdefectperproject":0.625,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4822,"sorting":0},{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 18, 2016","estimateworkingday":-46,"estimateday":-64,"scheduleperformance":-1.1307,"estimatecompletion":"Feb 14, 2016","idealcompletion":"Jun 13, 2016","defectlessfactor":0.9099,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6143,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":2,"earlieststart":"Apr 27, 2016","estimateworkingday":-65,"estimateday":-92,"scheduleperformance":-1.625,"estimatecompletion":"Jan 27, 2016","idealcompletion":"Jun 22, 2016","defectlessfactor":0.4247,"schedulefactor":0.9564,"avgdefectperproject":0.625,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4822,"sorting":0},{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 11, 2016","estimateworkingday":-34,"estimateday":-48,"scheduleperformance":-0.8438,"estimatecompletion":"Feb 24, 2016","idealcompletion":"Jun 6, 2016","defectlessfactor":0.6664,"schedulefactor":0.6985,"avgdefectperproject":0.3333,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.4636,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":2,"earlieststart":"Apr 27, 2016","estimateworkingday":-65,"estimateday":-92,"scheduleperformance":-1.625,"estimatecompletion":"Jan 27, 2016","idealcompletion":"Jun 22, 2016","defectlessfactor":0.4247,"schedulefactor":0.9564,"avgdefectperproject":0.625,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4822,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 11, 2016","estimateworkingday":-51,"estimateday":-71,"scheduleperformance":-1.261053333333,"estimatecompletion":"Jan 31, 2016","idealcompletion":"Jun 6, 2016","defectlessfactor":0.8023,"schedulefactor":0.898,"avgdefectperproject":0.1429,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.6667,"sorting":0}]', 'Hopscotch Bar [E-commerce]', 1, '2016-04-08 00:26:19'),
(59, '[[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 10, 2016","estimateworkingday":-35,"estimateday":-48,"scheduleperformance":-1.261053333333,"estimatecompletion":"Feb 22, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.8078,"schedulefactor":0.898,"avgdefectperproject":0.1333,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.7084,"sorting":1}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 18, 2016","estimateworkingday":-31,"estimateday":-43,"scheduleperformance":-1.1307,"estimatecompletion":"Mar 6, 2016","idealcompletion":"May 25, 2016","defectlessfactor":0.9066,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6912,"sorting":1}],[{"username":"vandavedecio","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 10, 2016","estimateworkingday":-10,"estimateday":-14,"scheduleperformance":-0.35715,"estimatecompletion":"Mar 27, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.9066,"schedulefactor":0.4129,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5865,"sorting":1}]]', '[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 10, 2016","estimateworkingday":-35,"estimateday":-48,"scheduleperformance":-1.261053333333,"estimatecompletion":"Feb 22, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.8078,"schedulefactor":0.898,"avgdefectperproject":0.1333,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.7084,"sorting":1}]', 'Kim Keat Hokkiean Mee [CMS]', 1, '2016-04-08 00:27:04'),
(60, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":2,"earlieststart":"Apr 27, 2016","estimateworkingday":-7,"estimateday":-10,"scheduleperformance":-0.43785,"estimatecompletion":"Apr 17, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.9977,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.7327,"sorting":1}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 2, 2016","estimateworkingday":8,"estimateday":11,"scheduleperformance":0.5571,"estimatecompletion":"May 13, 2016","idealcompletion":"May 23, 2016","defectlessfactor":0.9977,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.3284,"sorting":1}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":4,"earlieststart":"Apr 24, 2016","estimateworkingday":3,"estimateday":4,"scheduleperformance":0.2024,"estimatecompletion":"Apr 28, 2016","idealcompletion":"May 15, 2016","defectlessfactor":0.0,"schedulefactor":0.409,"avgdefectperproject":0.75,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.2345,"sorting":1}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":2,"earlieststart":"Apr 27, 2016","estimateworkingday":-7,"estimateday":-10,"scheduleperformance":-0.43785,"estimatecompletion":"Apr 17, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.9977,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.7327,"sorting":1}]', 'AtonHouse Kindergarten [CMS + Responsive]', 1, '2016-04-08 14:30:39');

-- --------------------------------------------------------

--
-- Table structure for table `trelloconfig`
--

CREATE TABLE `trelloconfig` (
  `mainboard` varchar(100) NOT NULL,
  `developmentlist` varchar(100) NOT NULL,
  `postdevlist` varchar(100) NOT NULL,
  `admin` varchar(200) NOT NULL,
  `cronpause` int(1) NOT NULL,
  `crondetails` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trelloconfig`
--

INSERT INTO `trelloconfig` (`mainboard`, `developmentlist`, `postdevlist`, `admin`, `cronpause`, `crondetails`) VALUES
('Recco Master Board', 'Development', 'UAT', 'teampjsudo', 0, 'Cron job is scheduled at every 2 minute(s).');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(1) NOT NULL,
  `trellokey` varchar(100) DEFAULT NULL,
  `trellotoken` varchar(100) DEFAULT NULL,
  `photo` longblob,
  `trelloId` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `type`, `trellokey`, `trellotoken`, `photo`, `trelloId`) VALUES
('alexadayandayan', '81dc9bdb52d04dc20036dbd8313ed055', 'c', 'aafd6e4eeafed1934133730d1a2c2028', '7ee566e279ebc076d9ce21f87c5ca3e93b810e19fdd62809cdf61cf5a4c1edf3', NULL, '5448b7207765b5050c49acf7'),
('bahri_ripplewerkz', '81dc9bdb52d04dc20036dbd8313ed055', 'c', 'aafd6e4eeafed1934133730d1a2c2028', '460a795e33d980e3ebb9240d401a3ed35fe240c6a2c2bd6e7c795d48d298c6c5', NULL, '568a0c10b7786df4782d3d9c'),
('ballalist', '81dc9bdb52d04dc20036dbd8313ed055', 'c', 'aafd6e4eeafed1934133730d1a2c2028', '90f5234ca69445a47c296e1a4f703b308f3844f2f88463cb121f05a27586f6af', NULL, '5362feab74c0fe7c5590cf86'),
('benjo12', '81dc9bdb52d04dc20036dbd8313ed055', 'c', 'aafd6e4eeafed1934133730d1a2c2028', 'c044b9e62a38270002b8dcc408c05b205ca94ab5b0022fffb4e9b35ff7087424', NULL, '5652e34528369d6bde94f4b6'),
('chaisiri1', '81dc9bdb52d04dc20036dbd8313ed055', 'c', 'aafd6e4eeafed1934133730d1a2c2028', '3613c2898ebf187f213331de6af3f1ff3a768e0b19075bbbaa0d616a5e2171d', NULL, '569c544609732be1094f0b40'),
('debe2', '81dc9bdb52d04dc20036dbd8313ed055', 'c', 'aafd6e4eeafed1934133730d1a2c2028', 'a279d6cfd9f044325f7e3ca25f8ff73a5db3324b673215fd9b9c9dda0650195d', NULL, '546ace6eba7931dc4a48c670'),
('john_pajarillo', '81dc9bdb52d04dc20036dbd8313ed055', 'c', 'aafd6e4eeafed1934133730d1a2c2028', 'da036a32019eaa98e550dd41ce6de3245bdaba005f0e93642a0b936a1ebe2a05', NULL, '54bf1e400f6bfbc8b4db4b19'),
('kaiwen12', '81dc9bdb52d04dc20036dbd8313ed055', 'p', '7e35111227918de8a37f8c20844ed555', '88fef47ee6302c833ecd52a3805eb7e6ad4490fbd584cc4f684a0335d7ad461d', NULL, '560e3108454da24c59d0297b'),
('lesterjester', '81dc9bdb52d04dc20036dbd8313ed055', 'c', 'aafd6e4eeafed1934133730d1a2c2028', 'e5f34f65a4abe3deb68653c7420a0a839c80a6844290f874720a6e050efcad25', NULL, '53db35212a59eb4eb1a3b824'),
('lionelchin', '81dc9bdb52d04dc20036dbd8313ed055', 'p', 'aafd6e4eeafed1934133730d1a2c2028', '3d8a7eb637f022b3225fff07d676f5a2bf48dc8147f71f0a248a82eb472fe4d7', NULL, '4fb225d95610ded13a117bcd'),
('markconderw', '81dc9bdb52d04dc20036dbd8313ed055', 'p', 'aafd6e4eeafed1934133730d1a2c2028', '1e081824a637bc72e128d1a2fb49c7c5003b2457bf1abae3c96f8c5b6fdcfff1', NULL, '5087b936bba877566a00348b'),
('marsd', '81dc9bdb52d04dc20036dbd8313ed055', 'c', 'aafd6e4eeafed1934133730d1a2c2028', '32a9504ea51a3903dbd41f304c92f7691d73c6405460ed4fc8feebcfee67f5bc', NULL, '52a7c954223c4578300244a5'),
('peterripplewerkz', '81dc9bdb52d04dc20036dbd8313ed055', 'p', 'aafd6e4eeafed1934133730d1a2c2028', 'e52a50b7c881f19404197f4302f64b6e26785248c5626009fe617c19605ab863', NULL, '5428d9067e629788282971cb'),
('pukpik', '81dc9bdb52d04dc20036dbd8313ed055', 'c', 'aafd6e4eeafed1934133730d1a2c2028', '2cc0ec43ef3fb29ab06c123e32a42a63d02b34a9d79fc81cf7e8b4c87c3584e4', NULL, '553468671db66cd55f10b7ec'),
('rain76', '81dc9bdb52d04dc20036dbd8313ed055', 't', 'aafd6e4eeafed1934133730d1a2c2028', '7cdb24794e2ff895caaa6d067ab06ec86c056bbc22f73d048e2a66f972c2b590', NULL, '54eda3c433e5f3c6c1bc0aa6'),
('roy1', '81dc9bdb52d04dc20036dbd8313ed055', 'c', 'aafd6e4eeafed1934133730d1a2c2028', '9421c9e1afb605cac0c63dc4d5599ee5b201c4afb20585e00346bb401c95b729', NULL, '50481b54efc683da1b37ff0e'),
('sirachon', '81dc9bdb52d04dc20036dbd8313ed055', 'c', 'aafd6e4eeafed1934133730d1a2c2028', 'f15c1f0cff793b571dee4ea28e2ececc3023878bd51cafdfcd4a438d7b82407c', NULL, '5689f448bfa976c52278f779'),
('teampjsudo', '81dc9bdb52d04dc20036dbd8313ed055', 's', 'aafd6e4eeafed1934133730d1a2c2028', '2cf8018d2c8e43ea41ba9c369ae2babb84a5b70364b96e0c719089d1ad0b8370\r\n', NULL, '56c56b26bb1bccc0cb5334c9'),
('vandavedecio', '81dc9bdb52d04dc20036dbd8313ed055', 'c', 'aafd6e4eeafed1934133730d1a2c2028', '1db5106c8388fa0ee71ad3591ca752d8e7f6734c8d6b09f75bc48325b5b3ce90', NULL, '510b29cbf3364c7f0c005c04'),
('zripplewerkz', '81dc9bdb52d04dc20036dbd8313ed055', 'c', 'aafd6e4eeafed1934133730d1a2c2028', '61e75700a541de7b58ffce02df3a0f1787073e595baf071c6be0c1ce47ad0fc6', NULL, '532fce6240ccdafb19a43670');

-- --------------------------------------------------------

--
-- Table structure for table `ztable`
--

CREATE TABLE `ztable` (
  `zvalue` decimal(14,2) NOT NULL,
  `pvalue` decimal(14,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ztable`
--

INSERT INTO `ztable` (`zvalue`, `pvalue`) VALUES
('-3.49', '0.0002'),
('-3.48', '0.0003'),
('-3.47', '0.0003'),
('-3.46', '0.0003'),
('-3.45', '0.0003'),
('-3.44', '0.0003'),
('-3.43', '0.0003'),
('-3.42', '0.0003'),
('-3.41', '0.0003'),
('-3.40', '0.0003'),
('-3.39', '0.0003'),
('-3.38', '0.0004'),
('-3.37', '0.0004'),
('-3.36', '0.0004'),
('-3.35', '0.0004'),
('-3.34', '0.0004'),
('-3.33', '0.0004'),
('-3.32', '0.0005'),
('-3.31', '0.0005'),
('-3.30', '0.0005'),
('-3.29', '0.0005'),
('-3.28', '0.0005'),
('-3.27', '0.0005'),
('-3.26', '0.0006'),
('-3.25', '0.0006'),
('-3.24', '0.0006'),
('-3.23', '0.0006'),
('-3.22', '0.0006'),
('-3.21', '0.0007'),
('-3.20', '0.0007'),
('-3.19', '0.0007'),
('-3.18', '0.0007'),
('-3.17', '0.0008'),
('-3.16', '0.0008'),
('-3.15', '0.0008'),
('-3.14', '0.0008'),
('-3.13', '0.0009'),
('-3.12', '0.0009'),
('-3.11', '0.0009'),
('-3.10', '0.0010'),
('-3.09', '0.0010'),
('-3.08', '0.0010'),
('-3.07', '0.0011'),
('-3.06', '0.0011'),
('-3.05', '0.0011'),
('-3.04', '0.0012'),
('-3.03', '0.0012'),
('-3.02', '0.0013'),
('-3.01', '0.0013'),
('-3.00', '0.0013'),
('-2.99', '0.0014'),
('-2.98', '0.0014'),
('-2.97', '0.0015'),
('-2.96', '0.0015'),
('-2.95', '0.0016'),
('-2.94', '0.0016'),
('-2.93', '0.0017'),
('-2.92', '0.0018'),
('-2.91', '0.0018'),
('-2.90', '0.0019'),
('-2.89', '0.0019'),
('-2.88', '0.0020'),
('-2.87', '0.0021'),
('-2.86', '0.0021'),
('-2.85', '0.0022'),
('-2.84', '0.0023'),
('-2.83', '0.0023'),
('-2.82', '0.0024'),
('-2.81', '0.0025'),
('-2.80', '0.0026'),
('-2.79', '0.0026'),
('-2.78', '0.0027'),
('-2.77', '0.0028'),
('-2.76', '0.0029'),
('-2.75', '0.0030'),
('-2.74', '0.0031'),
('-2.73', '0.0032'),
('-2.72', '0.0033'),
('-2.71', '0.0034'),
('-2.70', '0.0035'),
('-2.69', '0.0036'),
('-2.68', '0.0037'),
('-2.67', '0.0038'),
('-2.66', '0.0039'),
('-2.65', '0.0040'),
('-2.64', '0.0041'),
('-2.63', '0.0043'),
('-2.62', '0.0044'),
('-2.61', '0.0045'),
('-2.60', '0.0047'),
('-2.59', '0.0048'),
('-2.58', '0.0049'),
('-2.57', '0.0051'),
('-2.56', '0.0052'),
('-2.55', '0.0054'),
('-2.54', '0.0055'),
('-2.53', '0.0057'),
('-2.52', '0.0059'),
('-2.51', '0.0060'),
('-2.50', '0.0062'),
('-2.49', '0.0064'),
('-2.48', '0.0066'),
('-2.47', '0.0068'),
('-2.46', '0.0069'),
('-2.45', '0.0071'),
('-2.44', '0.0073'),
('-2.43', '0.0075'),
('-2.42', '0.0078'),
('-2.41', '0.0080'),
('-2.40', '0.0082'),
('-2.39', '0.0084'),
('-2.38', '0.0087'),
('-2.37', '0.0089'),
('-2.36', '0.0091'),
('-2.35', '0.0094'),
('-2.34', '0.0096'),
('-2.33', '0.0099'),
('-2.32', '0.0102'),
('-2.31', '0.0104'),
('-2.30', '0.0107'),
('-2.29', '0.0110'),
('-2.28', '0.0113'),
('-2.27', '0.0116'),
('-2.26', '0.0119'),
('-2.25', '0.0122'),
('-2.24', '0.0125'),
('-2.23', '0.0129'),
('-2.22', '0.0132'),
('-2.21', '0.0136'),
('-2.20', '0.0139'),
('-2.19', '0.0143'),
('-2.18', '0.0146'),
('-2.17', '0.0150'),
('-2.16', '0.0154'),
('-2.15', '0.0158'),
('-2.14', '0.0162'),
('-2.13', '0.0166'),
('-2.12', '0.0170'),
('-2.11', '0.0174'),
('-2.10', '0.0179'),
('-2.09', '0.0183'),
('-2.08', '0.0188'),
('-2.07', '0.0192'),
('-2.06', '0.0197'),
('-2.05', '0.0202'),
('-2.04', '0.0207'),
('-2.03', '0.0212'),
('-2.02', '0.0217'),
('-2.01', '0.0222'),
('-2.00', '0.0228'),
('-1.99', '0.0233'),
('-1.98', '0.0239'),
('-1.97', '0.0244'),
('-1.96', '0.0250'),
('-1.95', '0.0256'),
('-1.94', '0.0262'),
('-1.93', '0.0268'),
('-1.92', '0.0274'),
('-1.91', '0.0281'),
('-1.90', '0.0287'),
('-1.89', '0.0294'),
('-1.88', '0.0301'),
('-1.87', '0.0307'),
('-1.86', '0.0314'),
('-1.85', '0.0322'),
('-1.84', '0.0329'),
('-1.83', '0.0336'),
('-1.82', '0.0344'),
('-1.81', '0.0351'),
('-1.80', '0.0359'),
('-1.79', '0.0367'),
('-1.78', '0.0375'),
('-1.77', '0.0384'),
('-1.76', '0.0392'),
('-1.75', '0.0401'),
('-1.74', '0.0409'),
('-1.73', '0.0418'),
('-1.72', '0.0427'),
('-1.71', '0.0436'),
('-1.70', '0.0446'),
('-1.69', '0.0455'),
('-1.68', '0.0465'),
('-1.67', '0.0475'),
('-1.66', '0.0485'),
('-1.65', '0.0495'),
('-1.64', '0.0505'),
('-1.63', '0.0516'),
('-1.62', '0.0526'),
('-1.61', '0.0537'),
('-1.60', '0.0548'),
('-1.59', '0.0559'),
('-1.58', '0.0571'),
('-1.57', '0.0582'),
('-1.56', '0.0594'),
('-1.55', '0.0606'),
('-1.54', '0.0618'),
('-1.53', '0.0630'),
('-1.52', '0.0643'),
('-1.51', '0.0655'),
('-1.50', '0.0668'),
('-1.49', '0.0681'),
('-1.48', '0.0694'),
('-1.47', '0.0708'),
('-1.46', '0.0721'),
('-1.45', '0.0735'),
('-1.44', '0.0749'),
('-1.43', '0.0764'),
('-1.42', '0.0778'),
('-1.41', '0.0793'),
('-1.40', '0.0808'),
('-1.39', '0.0823'),
('-1.38', '0.0838'),
('-1.37', '0.0853'),
('-1.36', '0.0869'),
('-1.35', '0.0885'),
('-1.34', '0.0901'),
('-1.33', '0.0918'),
('-1.32', '0.0934'),
('-1.31', '0.0951'),
('-1.30', '0.0968'),
('-1.29', '0.0985'),
('-1.28', '0.1003'),
('-1.27', '0.1020'),
('-1.26', '0.1038'),
('-1.25', '0.1056'),
('-1.24', '0.1075'),
('-1.23', '0.1093'),
('-1.22', '0.1112'),
('-1.21', '0.1131'),
('-1.20', '0.1151'),
('-1.19', '0.1170'),
('-1.18', '0.1190'),
('-1.17', '0.1210'),
('-1.16', '0.1230'),
('-1.15', '0.1251'),
('-1.14', '0.1271'),
('-1.13', '0.1292'),
('-1.12', '0.1314'),
('-1.11', '0.1335'),
('-1.10', '0.1357'),
('-1.09', '0.1379'),
('-1.08', '0.1401'),
('-1.07', '0.1423'),
('-1.06', '0.1446'),
('-1.05', '0.1469'),
('-1.04', '0.1492'),
('-1.03', '0.1515'),
('-1.02', '0.1539'),
('-1.01', '0.1562'),
('-1.00', '0.1587'),
('-0.99', '0.1611'),
('-0.98', '0.1635'),
('-0.97', '0.1660'),
('-0.96', '0.1685'),
('-0.95', '0.1711'),
('-0.94', '0.1736'),
('-0.93', '0.1762'),
('-0.92', '0.1788'),
('-0.91', '0.1814'),
('-0.90', '0.1841'),
('-0.89', '0.1867'),
('-0.88', '0.1894'),
('-0.87', '0.1922'),
('-0.86', '0.1949'),
('-0.85', '0.1977'),
('-0.84', '0.2005'),
('-0.83', '0.2033'),
('-0.82', '0.2061'),
('-0.81', '0.2090'),
('-0.80', '0.2119'),
('-0.79', '0.2148'),
('-0.78', '0.2177'),
('-0.77', '0.2206'),
('-0.76', '0.2236'),
('-0.75', '0.2266'),
('-0.74', '0.2296'),
('-0.73', '0.2327'),
('-0.72', '0.2358'),
('-0.71', '0.2389'),
('-0.70', '0.2420'),
('-0.69', '0.2451'),
('-0.68', '0.2483'),
('-0.67', '0.2514'),
('-0.66', '0.2546'),
('-0.65', '0.2578'),
('-0.64', '0.2611'),
('-0.63', '0.2643'),
('-0.62', '0.2676'),
('-0.61', '0.2709'),
('-0.60', '0.2743'),
('-0.59', '0.2776'),
('-0.58', '0.2810'),
('-0.57', '0.2843'),
('-0.56', '0.2877'),
('-0.55', '0.2912'),
('-0.54', '0.2946'),
('-0.53', '0.2981'),
('-0.52', '0.3015'),
('-0.51', '0.3050'),
('-0.50', '0.3085'),
('-0.49', '0.3121'),
('-0.48', '0.3156'),
('-0.47', '0.3192'),
('-0.46', '0.3228'),
('-0.45', '0.3264'),
('-0.44', '0.3300'),
('-0.43', '0.3336'),
('-0.42', '0.3372'),
('-0.41', '0.3409'),
('-0.40', '0.3446'),
('-0.39', '0.3483'),
('-0.38', '0.3520'),
('-0.37', '0.3557'),
('-0.36', '0.3594'),
('-0.35', '0.3632'),
('-0.34', '0.3669'),
('-0.33', '0.3707'),
('-0.32', '0.3745'),
('-0.31', '0.3783'),
('-0.30', '0.3821'),
('-0.29', '0.3829'),
('-0.28', '0.3897'),
('-0.27', '0.3936'),
('-0.26', '0.3974'),
('-0.25', '0.4013'),
('-0.24', '0.4052'),
('-0.23', '0.4090'),
('-0.22', '0.4129'),
('-0.21', '0.4168'),
('-0.20', '0.4207'),
('-0.19', '0.4247'),
('-0.18', '0.4286'),
('-0.17', '0.4325'),
('-0.16', '0.4364'),
('-0.15', '0.4404'),
('-0.14', '0.4443'),
('-0.13', '0.4483'),
('-0.12', '0.4522'),
('-0.11', '0.4562'),
('-0.10', '0.4602'),
('-0.09', '0.4641'),
('-0.08', '0.4681'),
('-0.07', '0.4721'),
('-0.06', '0.4761'),
('-0.05', '0.4801'),
('-0.04', '0.4840'),
('-0.03', '0.4880'),
('-0.02', '0.4920'),
('-0.01', '0.4960'),
('0.00', '0.5000'),
('0.01', '0.5040'),
('0.02', '0.5080'),
('0.03', '0.5120'),
('0.04', '0.5160'),
('0.05', '0.5199'),
('0.06', '0.5239'),
('0.07', '0.5279'),
('0.08', '0.5319'),
('0.09', '0.5359'),
('0.10', '0.5398'),
('0.11', '0.5438'),
('0.12', '0.5478'),
('0.13', '0.5517'),
('0.14', '0.5557'),
('0.15', '0.5596'),
('0.16', '0.5636'),
('0.17', '0.5675'),
('0.18', '0.5714'),
('0.19', '0.5753'),
('0.20', '0.5793'),
('0.21', '0.5832'),
('0.22', '0.5871'),
('0.23', '0.5910'),
('0.24', '0.5948'),
('0.25', '0.5987'),
('0.26', '0.6026'),
('0.27', '0.6064'),
('0.28', '0.6103'),
('0.29', '0.6141'),
('0.30', '0.6179'),
('0.31', '0.6217'),
('0.32', '0.6255'),
('0.33', '0.6293'),
('0.34', '0.6331'),
('0.35', '0.6368'),
('0.36', '0.6406'),
('0.37', '0.6443'),
('0.38', '0.6480'),
('0.39', '0.6517'),
('0.40', '0.6554'),
('0.41', '0.6591'),
('0.42', '0.6628'),
('0.43', '0.6664'),
('0.44', '0.6700'),
('0.45', '0.6736'),
('0.46', '0.6772'),
('0.47', '0.6808'),
('0.48', '0.6844'),
('0.49', '0.6879'),
('0.50', '0.6915'),
('0.51', '0.6950'),
('0.52', '0.6985'),
('0.53', '0.7019'),
('0.54', '0.7054'),
('0.55', '0.7088'),
('0.56', '0.7123'),
('0.57', '0.7157'),
('0.58', '0.7190'),
('0.59', '0.7224'),
('0.60', '0.7257'),
('0.61', '0.7291'),
('0.62', '0.7324'),
('0.63', '0.7357'),
('0.64', '0.7389'),
('0.65', '0.7422'),
('0.66', '0.7454'),
('0.67', '0.7486'),
('0.68', '0.7517'),
('0.69', '0.7549'),
('0.70', '0.7580'),
('0.71', '0.7611'),
('0.72', '0.7642'),
('0.73', '0.7673'),
('0.74', '0.7704'),
('0.75', '0.7734'),
('0.76', '0.7764'),
('0.77', '0.7794'),
('0.78', '0.7823'),
('0.79', '0.7852'),
('0.80', '0.7881'),
('0.81', '0.7910'),
('0.82', '0.7939'),
('0.83', '0.7967'),
('0.84', '0.7995'),
('0.85', '0.8023'),
('0.86', '0.8051'),
('0.87', '0.8078'),
('0.88', '0.8106'),
('0.89', '0.8133'),
('0.90', '0.8159'),
('0.91', '0.8186'),
('0.92', '0.8212'),
('0.93', '0.8238'),
('0.94', '0.8264'),
('0.95', '0.8289'),
('0.96', '0.8315'),
('0.97', '0.8340'),
('0.98', '0.8365'),
('0.99', '0.8389'),
('1.00', '0.8413'),
('1.01', '0.8438'),
('1.02', '0.8461'),
('1.03', '0.8485'),
('1.04', '0.8508'),
('1.05', '0.8531'),
('1.06', '0.8554'),
('1.07', '0.8577'),
('1.08', '0.8599'),
('1.09', '0.8621'),
('1.10', '0.8643'),
('1.11', '0.8665'),
('1.12', '0.8686'),
('1.13', '0.8708'),
('1.14', '0.8729'),
('1.15', '0.8749'),
('1.16', '0.8770'),
('1.17', '0.8790'),
('1.18', '0.8810'),
('1.19', '0.8830'),
('1.20', '0.8849'),
('1.21', '0.8869'),
('1.22', '0.8888'),
('1.23', '0.8907'),
('1.24', '0.8925'),
('1.25', '0.8944'),
('1.26', '0.8962'),
('1.27', '0.8980'),
('1.28', '0.8997'),
('1.29', '0.9015'),
('1.30', '0.9032'),
('1.31', '0.9049'),
('1.32', '0.9066'),
('1.33', '0.9082'),
('1.34', '0.9099'),
('1.35', '0.9115'),
('1.36', '0.9131'),
('1.37', '0.9147'),
('1.38', '0.9162'),
('1.39', '0.9177'),
('1.40', '0.9192'),
('1.41', '0.9207'),
('1.42', '0.9222'),
('1.43', '0.9236'),
('1.44', '0.9251'),
('1.45', '0.9265'),
('1.46', '0.9279'),
('1.47', '0.9292'),
('1.48', '0.9306'),
('1.49', '0.9319'),
('1.50', '0.9332'),
('1.51', '0.9345'),
('1.52', '0.9357'),
('1.53', '0.9370'),
('1.54', '0.9382'),
('1.55', '0.9394'),
('1.56', '0.9406'),
('1.57', '0.9418'),
('1.58', '0.9429'),
('1.59', '0.9441'),
('1.60', '0.9452'),
('1.61', '0.9463'),
('1.62', '0.9474'),
('1.63', '0.9484'),
('1.64', '0.9495'),
('1.65', '0.9505'),
('1.66', '0.9515'),
('1.67', '0.9525'),
('1.68', '0.9535'),
('1.69', '0.9545'),
('1.70', '0.9554'),
('1.71', '0.9564'),
('1.72', '0.9573'),
('1.73', '0.9582'),
('1.74', '0.9591'),
('1.75', '0.9599'),
('1.76', '0.9608'),
('1.77', '0.9616'),
('1.78', '0.9625'),
('1.79', '0.9633'),
('1.80', '0.9641'),
('1.81', '0.9649'),
('1.82', '0.9656'),
('1.83', '0.9664'),
('1.84', '0.9671'),
('1.85', '0.9678'),
('1.86', '0.9686'),
('1.87', '0.9693'),
('1.88', '0.9699'),
('1.89', '0.9706'),
('1.90', '0.9713'),
('1.91', '0.9719'),
('1.92', '0.9726'),
('1.93', '0.9732'),
('1.94', '0.9738'),
('1.95', '0.9744'),
('1.96', '0.9750'),
('1.97', '0.9756'),
('1.98', '0.9761'),
('1.99', '0.9767'),
('2.00', '0.9772'),
('2.01', '0.9778'),
('2.02', '0.9783'),
('2.03', '0.9788'),
('2.04', '0.9793'),
('2.05', '0.9798'),
('2.06', '0.9803'),
('2.07', '0.9808'),
('2.08', '0.9812'),
('2.09', '0.9817'),
('2.10', '0.9821'),
('2.11', '0.9826'),
('2.12', '0.9830'),
('2.13', '0.9834'),
('2.14', '0.9838'),
('2.15', '0.9842'),
('2.16', '0.9846'),
('2.17', '0.9850'),
('2.18', '0.9854'),
('2.19', '0.9857'),
('2.20', '0.9861'),
('2.21', '0.9864'),
('2.22', '0.9868'),
('2.23', '0.9871'),
('2.24', '0.9875'),
('2.25', '0.9878'),
('2.26', '0.9881'),
('2.27', '0.9884'),
('2.28', '0.9887'),
('2.29', '0.9890'),
('2.30', '0.9893'),
('2.31', '0.9896'),
('2.32', '0.9898'),
('2.33', '0.9901'),
('2.34', '0.9904'),
('2.35', '0.9906'),
('2.36', '0.9909'),
('2.37', '0.9911'),
('2.38', '0.9913'),
('2.39', '0.9916'),
('2.40', '0.9918'),
('2.41', '0.9920'),
('2.42', '0.9922'),
('2.43', '0.9925'),
('2.44', '0.9927'),
('2.45', '0.9929'),
('2.46', '0.9931'),
('2.47', '0.9932'),
('2.48', '0.9934'),
('2.49', '0.9936'),
('2.50', '0.9938'),
('2.51', '0.9940'),
('2.52', '0.9941'),
('2.53', '0.9943'),
('2.54', '0.9945'),
('2.55', '0.9946'),
('2.56', '0.9948'),
('2.57', '0.9949'),
('2.58', '0.9951'),
('2.59', '0.9952'),
('2.60', '0.9953'),
('2.61', '0.9955'),
('2.62', '0.9956'),
('2.63', '0.9957'),
('2.64', '0.9959'),
('2.65', '0.9960'),
('2.66', '0.9961'),
('2.67', '0.9962'),
('2.68', '0.9963'),
('2.69', '0.9964'),
('2.70', '0.9965'),
('2.71', '0.9966'),
('2.72', '0.9967'),
('2.73', '0.9968'),
('2.74', '0.9969'),
('2.75', '0.9970'),
('2.76', '0.9971'),
('2.77', '0.9972'),
('2.78', '0.9973'),
('2.79', '0.9974'),
('2.80', '0.9974'),
('2.81', '0.9975'),
('2.82', '0.9976'),
('2.83', '0.9977'),
('2.84', '0.9977'),
('2.85', '0.9978'),
('2.86', '0.9979'),
('2.87', '0.9979'),
('2.88', '0.9980'),
('2.89', '0.9981'),
('2.90', '0.9981'),
('2.91', '0.9982'),
('2.92', '0.9982'),
('2.93', '0.9983'),
('2.94', '0.9984'),
('2.95', '0.9984'),
('2.96', '0.9985'),
('2.97', '0.9985'),
('2.98', '0.9986'),
('2.99', '0.9986'),
('3.00', '0.9987'),
('3.01', '0.9987'),
('3.02', '0.9987'),
('3.03', '0.9988'),
('3.04', '0.9988'),
('3.05', '0.9989'),
('3.06', '0.9989'),
('3.07', '0.9989'),
('3.08', '0.9990'),
('3.09', '0.9990'),
('3.10', '0.9990'),
('3.11', '0.9991'),
('3.12', '0.9991'),
('3.13', '0.9991'),
('3.14', '0.9992'),
('3.15', '0.9992'),
('3.16', '0.9992'),
('3.17', '0.9992'),
('3.18', '0.9993'),
('3.19', '0.9993'),
('3.20', '0.9993'),
('3.21', '0.9993'),
('3.22', '0.9994'),
('3.23', '0.9994'),
('3.24', '0.9994'),
('3.25', '0.9994'),
('3.26', '0.9994'),
('3.27', '0.9995'),
('3.28', '0.9995'),
('3.29', '0.9995'),
('3.30', '0.9995'),
('3.31', '0.9995'),
('3.32', '0.9995'),
('3.33', '0.9996'),
('3.34', '0.9996'),
('3.35', '0.9996'),
('3.36', '0.9996'),
('3.37', '0.9996'),
('3.38', '0.9996'),
('3.39', '0.9997'),
('3.40', '0.9997'),
('3.41', '0.9997'),
('3.42', '0.9997'),
('3.43', '0.9997'),
('3.44', '0.9997'),
('3.45', '0.9997'),
('3.46', '0.9997'),
('3.47', '0.9997'),
('3.48', '0.9997'),
('3.49', '0.9998'),
('3.50', '1.0000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cron`
--
ALTER TABLE `cron`
  ADD PRIMARY KEY (`cronid`);

--
-- Indexes for table `defect`
--
ALTER TABLE `defect`
  ADD PRIMARY KEY (`defectid`),
  ADD KEY `defect_fk1` (`projectname`),
  ADD KEY `defect_fk2` (`reportby`),
  ADD KEY `defect_fk3` (`assignto`);

--
-- Indexes for table `defectcommitby`
--
ALTER TABLE `defectcommitby`
  ADD PRIMARY KEY (`defectid`,`committedby`),
  ADD KEY `defectc_fk2` (`committedby`);

--
-- Indexes for table `defectscreenshot`
--
ALTER TABLE `defectscreenshot`
  ADD PRIMARY KEY (`defectid`,`updatetime`);

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
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notificationid`),
  ADD KEY `notifications_fk` (`username`),
  ADD KEY `notifications_fk2` (`projectname`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`projectname`),
  ADD KEY `project_fk` (`assignby`);

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
-- Indexes for table `recommendationlog`
--
ALTER TABLE `recommendationlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trelloconfig`
--
ALTER TABLE `trelloconfig`
  ADD PRIMARY KEY (`mainboard`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `ztable`
--
ALTER TABLE `ztable`
  ADD PRIMARY KEY (`zvalue`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cron`
--
ALTER TABLE `cron`
  MODIFY `cronid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=157;
--
-- AUTO_INCREMENT for table `defect`
--
ALTER TABLE `defect`
  MODIFY `defectid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notificationid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `recommendationlog`
--
ALTER TABLE `recommendationlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `defect`
--
ALTER TABLE `defect`
  ADD CONSTRAINT `defect_fk1` FOREIGN KEY (`projectname`) REFERENCES `project` (`projectname`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `defect_fk2` FOREIGN KEY (`reportby`) REFERENCES `user` (`username`),
  ADD CONSTRAINT `defect_fk3` FOREIGN KEY (`assignto`) REFERENCES `user` (`username`);

--
-- Constraints for table `defectcommitby`
--
ALTER TABLE `defectcommitby`
  ADD CONSTRAINT `defectc_fk` FOREIGN KEY (`defectid`) REFERENCES `defect` (`defectid`) ON DELETE CASCADE,
  ADD CONSTRAINT `defectc_fk2` FOREIGN KEY (`committedby`) REFERENCES `user` (`username`);

--
-- Constraints for table `defectscreenshot`
--
ALTER TABLE `defectscreenshot`
  ADD CONSTRAINT `defects_fk` FOREIGN KEY (`defectid`) REFERENCES `defect` (`defectid`) ON DELETE CASCADE;

--
-- Constraints for table `developer`
--
ALTER TABLE `developer`
  ADD CONSTRAINT `developer_fk` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `developerskill`
--
ALTER TABLE `developerskill`
  ADD CONSTRAINT `dskill_fk` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_fk` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_fk2` FOREIGN KEY (`projectname`) REFERENCES `project` (`projectname`) ON DELETE CASCADE;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_fk` FOREIGN KEY (`assignby`) REFERENCES `user` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `projectallocation`
--
ALTER TABLE `projectallocation`
  ADD CONSTRAINT `pallo_fk` FOREIGN KEY (`projectname`) REFERENCES `project` (`projectname`) ON DELETE CASCADE,
  ADD CONSTRAINT `pallo_fk2` FOREIGN KEY (`developerusername`) REFERENCES `developer` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `projectfunction`
--
ALTER TABLE `projectfunction`
  ADD CONSTRAINT `pfunction_fk` FOREIGN KEY (`projectname`) REFERENCES `project` (`projectname`) ON DELETE CASCADE;
--
-- Database: `dropinn`
--

-- --------------------------------------------------------

--
-- Table structure for table `accept_pay`
--

CREATE TABLE `accept_pay` (
  `id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `transaction_id` varchar(50) NOT NULL,
  `amount` float NOT NULL,
  `currency` varchar(25) NOT NULL,
  `status` int(1) NOT NULL,
  `created` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin_key`
--

CREATE TABLE `admin_key` (
  `id` int(10) NOT NULL,
  `page_refer` varchar(150) NOT NULL,
  `page_key` varchar(150) NOT NULL,
  `created` varchar(150) NOT NULL,
  `status` int(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_key`
--

INSERT INTO `admin_key` (`id`, `page_refer`, `page_key`, `created`, `status`) VALUES
(1, '0', 'Book Your Accommodation', '1375281419', 0);

-- --------------------------------------------------------

--
-- Table structure for table `amnities`
--

CREATE TABLE `amnities` (
  `id` smallint(6) NOT NULL,
  `name` varchar(111) NOT NULL,
  `description` varchar(333) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `amnities`
--

INSERT INTO `amnities` (`id`, `name`, `description`) VALUES
(1, 'Smoking Allowed ', 'Smoking is allowed '),
(2, 'Pets Allowed', 'Pets is allowed'),
(4, 'Cable TV ', 'Cable TV  is available'),
(6, 'Wireless Internet', 'A wireless router that guests can access 24/7.'),
(7, 'Air Conditioning', 'Air Conditioning is available'),
(8, 'Heating', 'Heating is available'),
(9, 'Elevator in Building ', 'Elevator is available in the building '),
(10, 'Handicap Accessible', 'The property is easily accessible.  Guests should communicate about individual needs.'),
(11, 'Pool', 'A private swimming pool'),
(12, 'Kitchen', 'Kitchen is available for guest use'),
(13, 'Parking Included', 'Parking Included'),
(14, 'Washer / Dryer', 'Washer / Dryer'),
(15, 'Doorman', 'Doorman'),
(16, 'Gym', 'Gym'),
(17, 'Hot Tub', 'Hot Tub'),
(18, 'Indoor Fireplace', 'Indoor Fireplace'),
(19, 'Buzzer/Wireless Intercom ', 'Buzzer/Wireless Intercom '),
(20, 'Breakfast', 'Breakfast is provided.'),
(21, 'Family/Kid Friendly', 'The property is suitable for hosting families with children.'),
(22, 'Suitable for Events', 'The property can accommodate a gathering of 25 or more attendees.'),
(24, 'Swimming', 'Swimming pool');

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

CREATE TABLE `calendar` (
  `id` bigint(20) NOT NULL,
  `list_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `availability` varchar(31) NOT NULL,
  `value` varchar(30) NOT NULL,
  `currency` varchar(7) NOT NULL,
  `notes` text NOT NULL,
  `style` varchar(11) NOT NULL,
  `booked_using` varchar(30) NOT NULL,
  `booked_days` int(31) NOT NULL,
  `created` int(31) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cancel_my_account_details`
--

CREATE TABLE `cancel_my_account_details` (
  `clientid` int(11) NOT NULL,
  `tell_why_your_leaving` varchar(255) NOT NULL,
  `comment` int(255) NOT NULL,
  `contact_ok` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cancellation_policy`
--

CREATE TABLE `cancellation_policy` (
  `id` int(25) NOT NULL,
  `name` varchar(155) NOT NULL,
  `cancellation_title` varchar(155) NOT NULL,
  `cancellation_content` text NOT NULL,
  `cleaning_status` int(1) NOT NULL,
  `security_status` int(1) NOT NULL,
  `additional_status` int(1) NOT NULL,
  `list_days_prior_status` int(1) NOT NULL,
  `list_days_prior_days` int(2) NOT NULL,
  `list_days_prior_percentage` int(3) NOT NULL,
  `list_before_status` int(1) NOT NULL,
  `list_before_days` int(2) NOT NULL,
  `list_before_percentage` int(2) NOT NULL,
  `list_non_refundable_nights` int(2) NOT NULL,
  `list_after_status` int(1) NOT NULL,
  `list_after_days` int(2) NOT NULL,
  `list_after_percentage` int(2) NOT NULL,
  `is_standard` enum('0','1') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cancellation_policy`
--

INSERT INTO `cancellation_policy` (`id`, `name`, `cancellation_title`, `cancellation_content`, `cleaning_status`, `security_status`, `additional_status`, `list_days_prior_status`, `list_days_prior_days`, `list_days_prior_percentage`, `list_before_status`, `list_before_days`, `list_before_percentage`, `list_non_refundable_nights`, `list_after_status`, `list_after_days`, `list_after_percentage`, `is_standard`) VALUES
(1, 'Flexible', 'Flexible: {percentage} refund {day} prior to arrival, except fees', '<ul>\n<li>Cleaning fees, Security fees and Additional Guest fees are always refunded if the guest did not check in.</li>\n<li>The {site_title} service fee is non-refundable.</li>\n<li>If there is a complaint from either party, notice must be given to&nbsp;{site_title} within 24 hours of check-in.</li>\n<li>{site_title}&nbsp;will mediate when necessary, and has the final say in all disputes.</li>\n<li>A reservation is officially cancelled when the guest clicks the cancellation button on the cancellation confirmation page, which they can find in Dashboard &gt; Your Trips &gt; Cancel.</li>\n<li>Cancellation policies may be superseded by the Guest Refund Policy, safety cancellations, or extenuating circumstances. Please review these exceptions.</li>\n<li>Applicable taxes will be retained and remitted.</li>\n</ul>', 0, 0, 0, 1, 1, 100, 1, 1, 100, 1, 1, 1, 100, '1'),
(2, 'Moderate', 'Moderate: Full refund {day} prior to arrival, except fees', '<ul>\n<li>Cleaning fees, Security fees and Additional Guest fees are always refunded if the guest did not check in.</li>\n<li>The {site_title} service fee is non-refundable.</li>\n<li>If there is a complaint from either party, notice must be given to&nbsp;{site_title} within 24 hours of check-in.</li>\n<li>{site_title}&nbsp;will mediate when necessary, and has the final say in all disputes.</li>\n<li>A reservation is officially cancelled when the guest clicks the cancellation button on the cancellation confirmation page, which they can find in Dashboard &gt; Your Trips &gt; Cancel.</li>\n<li>Cancellation policies may be superseded by the Guest Refund Policy, safety cancellations, or extenuating circumstances. Please review these exceptions.</li>\n<li>Applicable taxes will be retained and remitted.</li>\n</ul>', 0, 0, 0, 1, 5, 100, 1, 5, 100, 1, 1, 1, 50, '1'),
(3, 'Strict', 'Strict: {percentage} refund up until {day} prior to arrival, except fees', '<ul>\n<li>Cleaning fees, Security fees and Additional Guest fees are always refunded if the guest did not check in.</li>\n<li>The {site_title} service fee is non-refundable.</li>\n<li>If there is a complaint from either party, notice must be given to&nbsp;{site_title} within 24 hours of check-in.</li>\n<li>{site_title}&nbsp;will mediate when necessary, and has the final say in all disputes.</li>\n<li>A reservation is officially cancelled when the guest clicks the cancellation button on the cancellation confirmation page, which they can find in Dashboard &gt; Your Trips &gt; Cancel.</li>\n<li>Cancellation policies may be superseded by the Guest Refund Policy, safety cancellations, or extenuating circumstances. Please review these exceptions.</li>\n<li>Applicable taxes will be retained and remitted.</li>\n</ul>', 0, 0, 0, 1, 7, 50, 0, 7, 50, 1, 0, 1, 0, '1'),
(4, 'Super Strict', 'Super Strict: {percentage} refund up until {day} prior to arrival, except fees', '<ul>\n<li>Cleaning fees, Security fees and Additional Guest fees are always refunded if the guest did not check in.</li>\n<li>The {site_title} service fee is non-refundable.</li>\n<li>If there is a complaint from either party, notice must be given to&nbsp;{site_title} within 24 hours of check-in.</li>\n<li>{site_title}&nbsp;will mediate when necessary, and has the final say in all disputes.</li>\n<li>A reservation is officially cancelled when the guest clicks the cancellation button on the cancellation confirmation page, which they can find in Dashboard &gt; Your Trips &gt; Cancel.</li>\n<li>Cancellation policies may be superseded by the Guest Refund Policy, safety cancellations, or extenuating circumstances. Please review these exceptions.</li>\n<li>Applicable taxes will be retained and remitted.</li>\n</ul>', 0, 0, 0, 1, 30, 50, 0, 30, 50, 1, 0, 1, 0, '0'),
(5, 'Long Term', 'Long Term: First month down payment, {day} notice for lease, termination', '<ul>\n<li>Cleaning fees, Security fees and Additional Guest fees are always refunded if the guest did not check in.</li>\n<li>The {site_title} service fee is non-refundable.</li>\n<li>If there is a complaint from either party, notice must be given to&nbsp;{site_title} within 24 hours of check-in.</li>\n<li>{site_title}&nbsp;will mediate when necessary, and has the final say in all disputes.</li>\n<li>A reservation is officially cancelled when the guest clicks the cancellation button on the cancellation confirmation page, which they can find in Dashboard &gt; Your Trips &gt; Cancel.</li>\n<li>Cancellation policies may be superseded by the Guest Refund Policy, safety cancellations, or extenuating circumstances. Please review these exceptions.</li>\n<li>Applicable taxes will be retained and remitted.</li>\n</ul>', 0, 0, 0, 0, 1, 10, 1, 30, 100, 1, 0, 30, 12, '0');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ip_address` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `user_agent` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('714512ef924ce288344b707e7bde9c62', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', 1458360037, 'a:6:{s:9:"user_data";s:0:"";s:15:"_facebook_scope";s:5:"email";s:18:"_facebook_callback";s:71:"http://localhost:8888/DropInn/DropInn-Free-4.1.5/users/change_languages";s:14:"locale_country";N;s:8:"language";N;s:6:"locale";N;}');

--
-- Triggers `ci_sessions`
--
DELIMITER $$
CREATE TRIGGER `login_history` AFTER INSERT ON `ci_sessions`
 FOR EACH ROW insert into login_history (session_id,ip_address,user_agent,last_activity,user_id,logout) values (new.session_id,new.ip_address,new.user_agent,new.last_activity,0,0)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `login_history_update` AFTER UPDATE ON `ci_sessions`
 FOR EACH ROW update login_history set session_id = new.session_id, last_activity = new.last_activity where session_id = old.session_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `contact_info`
--

CREATE TABLE `contact_info` (
  `id` int(11) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `street` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `pincode` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_info`
--

INSERT INTO `contact_info` (`id`, `phone`, `email`, `name`, `street`, `city`, `state`, `country`, `pincode`) VALUES
(1, '04524282000', 'support@cogzidel.com', 'Cogzidel Technologies', 'Simakkal', 'Madurai', 'TamilNadu', 'India', 625001);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) NOT NULL,
  `list_id` int(111) NOT NULL,
  `contact_key` varchar(100) NOT NULL,
  `userby` int(11) NOT NULL,
  `userto` int(111) NOT NULL,
  `checkin` varchar(50) NOT NULL,
  `checkout` varchar(50) NOT NULL,
  `no_quest` tinyint(4) NOT NULL,
  `currency` varchar(11) NOT NULL,
  `price` float NOT NULL,
  `original_price` float NOT NULL,
  `topay` float NOT NULL,
  `admin_commission` float NOT NULL,
  `status` tinyint(4) NOT NULL,
  `send_date` int(31) NOT NULL,
  `offer` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `country_symbol` char(2) NOT NULL,
  `caps_name` varchar(80) NOT NULL,
  `country_name` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(5) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=240 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `country_symbol`, `caps_name`, `country_name`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263);

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `id` int(12) NOT NULL,
  `couponcode` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `coupon_price` float NOT NULL,
  `expirein` varchar(12) NOT NULL,
  `status` int(20) NOT NULL,
  `currency` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_users`
--

CREATE TABLE `coupon_users` (
  `id` int(11) NOT NULL,
  `list_id` bigint(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `used_coupon_code` varchar(50) NOT NULL,
  `status` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `currency_name` varchar(150) NOT NULL,
  `currency_code` varchar(5) NOT NULL,
  `currency_symbol` varchar(10) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `default` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `currency_name`, `currency_code`, `currency_symbol`, `status`, `default`) VALUES
(1, 'US Dollar', 'USD', '&#36;', 1, 1),
(2, 'Pound Sterling', 'GBP', '&pound;', 1, 0),
(3, 'Europe', 'EUR', '&euro;', 1, 0),
(4, 'Australian Dollar', 'AUD', '&#36;', 1, 0),
(5, 'Singapore', 'SGD', '&#36;', 1, 0),
(6, 'Swedish Krona', 'SEK', 'kr', 1, 0),
(7, 'Danish Krone', 'DKK', 'kr', 1, 0),
(8, 'Mexican Peso', 'MXN', '$', 1, 0),
(9, 'Brazilian Real', 'BRL', 'R$', 1, 0),
(10, 'Malaysian Ringgit', 'MYR', 'RM', 1, 0),
(11, 'Philippine Peso', 'PHP', 'P', 1, 0),
(12, 'Swiss Franc', 'CHF', '&euro;', 1, 0),
(13, 'India', 'INR', '&#x20B9;', 1, 0),
(14, 'Argentine Peso', 'ARS', '&#36;', 1, 0),
(15, 'Canadian Dollar', 'CAD', '&#36;', 1, 0),
(16, 'Chinese Yuan', 'CNY', '&#165;', 1, 0),
(17, 'Czech Republic Koruna', 'CZK', 'K&#269;', 1, 0),
(18, 'Hong Kong Dollar', 'HKD', '&#36;', 1, 0),
(19, 'Hungarian Forint', 'HUF', 'Ft', 1, 0),
(20, 'Indonesian Rupiah', 'IDR', 'Rp', 1, 0),
(21, 'Israeli New Sheqel', 'ILS', '&#8362;', 1, 0),
(22, 'Japanese Yen', 'JPY', '&#165;', 1, 0),
(23, 'South Korean Won', 'KRW', '&#8361;', 1, 0),
(24, 'Norwegian Krone', 'NOK', 'kr', 1, 0),
(25, 'New Zealand Dollar', 'NZD', '&#36;', 1, 0),
(26, 'Polish Zloty', 'PLN', 'z&#322;', 1, 0),
(27, 'Russian Ruble', 'RUB', 'p', 1, 0),
(28, 'Thai Baht', 'THB', '&#3647;', 1, 0),
(29, 'Turkish Lira', 'TRY', '&#8378;', 1, 0),
(30, 'New Taiwan Dollar', 'TWD', '&#36;', 1, 0),
(31, 'Vietnamese Dong', 'VND', '&#8363;', 1, 0),
(32, 'South African Rand', 'ZAR', 'R', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `currency_converter`
--

CREATE TABLE `currency_converter` (
  `id` int(3) NOT NULL,
  `currency_code` varchar(10) NOT NULL,
  `currency_value` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency_converter`
--

INSERT INTO `currency_converter` (`id`, `currency_code`, `currency_value`) VALUES
(1, 'USD', '1'),
(2, 'GBP', '0.594438'),
(3, 'EUR', '0.744682'),
(4, 'AUD', '1.073841'),
(5, 'SGD', '1.24696'),
(6, 'SEK', '6.863501'),
(7, 'DKK', '5.554448'),
(8, 'MXN', '13.18913'),
(9, 'BRL', '2.259438'),
(10, 'MYR', '3.209797'),
(11, 'PHP', '43.75468'),
(12, 'CHF', '0.90628'),
(13, 'INR', '60.97431'),
(14, 'ARS', '8.230843'),
(15, 'CAD', '1.09174'),
(16, 'CNY', '6.178215'),
(17, 'CZK', '20.61438'),
(18, 'HKD', '7.750034'),
(19, 'HUF', '233.3027'),
(20, 'IDR', '11771.4166'),
(21, 'ILS', '3.420409'),
(22, 'JPY', '102.642499'),
(23, 'KRW', '1035.65165'),
(24, 'NOK', '6.270852'),
(25, 'NZD', '1.174948'),
(26, 'PLN', '3.116912'),
(27, 'RUB', '35.7553'),
(28, 'THB', '32.14812'),
(29, 'TRY', '2.135574'),
(30, 'TWD', '30.02386'),
(31, 'VND', '21219.8333'),
(32, 'ZAR', '10.68457');

-- --------------------------------------------------------

--
-- Table structure for table `discover`
--

CREATE TABLE `discover` (
  `id` int(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `email_settings`
--

CREATE TABLE `email_settings` (
  `id` int(10) NOT NULL,
  `code` varchar(111) NOT NULL,
  `name` varchar(111) NOT NULL,
  `value` varchar(111) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_settings`
--

INSERT INTO `email_settings` (`id`, `code`, `name`, `value`, `created`) VALUES
(1, 'MAILER_TYPE', 'Mailer Type', '1', 2011),
(2, 'SMTP_PORT', 'SMTP Port', '', 2011),
(3, 'SMTP_USER', 'SMTP Username', '', 2011),
(4, 'SMTP_PASS', 'SMTP Password', '', 2011),
(5, 'MAILER_MODE', 'Mailer Mode', 'html', 2011);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(10) unsigned NOT NULL,
  `type` varchar(64) CHARACTER SET utf8 NOT NULL,
  `title` text CHARACTER SET utf8 NOT NULL,
  `mail_subject` text CHARACTER SET utf8 NOT NULL,
  `email_body_text` text CHARACTER SET utf8 NOT NULL,
  `email_body_html` text CHARACTER SET ucs2 NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `type`, `title`, `mail_subject`, `email_body_text`, `email_body_html`) VALUES
(40, 'refferal_invite', 'Refferal Invitation', '{username} has invited you to {site_name}', 'Hi user,\n\n{username} wants you to save money with {site_name}\n\n{dynamic_content}\n\n{click_here}\n\n--\nThanks and Regards,\nAdmin\n{site_name}', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi User,</td>\n</tr>\n<tr>\n<td>\n<p>{username} wants you to save money with {site_name}</p>\n<p>{dynamic_content}</p>\n<p>{click_here} To Started Now!</p>\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>Admin</p>\n<p>{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(44, 'tc_book_to_admin', 'Admin notification for  Travel cretid booking', ' {traveler_name} sent the reservation request by using his Travel Cretids', 'Hello Admin,\r\n\r\n{traveler_name}sent the reservation request to book the {list_title} place on {book_date} at {book_time} by using his Travel Credits.\r\n\r\nDetails as follows,\r\n\r\nTraveler Name : {traveler_name}\r\nContact Email Id : {traveler_email_id}\r\nPlace Name : {list_title}\r\nCheck in : {checkin}\r\nCheck out : {checkout}\r\nMarket Price : {market_price}\r\nPayed Amount : {payed_amount}\r\nTravel Credits : {travel_credits} \r\nHost Name : {host_name}\r\nHost Email Id : {host_email_id} \r\n\r\n--\r\nThanks and Regards,\r\n\r\n{site_name} Team', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>Hi Admin,</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>{traveler_name}sent the reservation request to book the {list_title} place on {book_date} at {book_time} by using his Travel Credits.</p>\r\n<p>Details as follows,</p>\r\n<p>Traveler Name : {traveler_name}</p>\r\n<p>Contact Email Id : {traveler_email_id}</p>\r\n<p>Place Name : {list_title}</p>\r\n<p>Check in : {checkin}</p>\r\n<p>Check out : {checkout}</p>\r\n<p>Market Price : {market_price}</p>\r\n<p>Payed Amount : {payed_amount}</p>\r\n<p>Travel Credits : {travel_credits}</p>\r\n<p>Host Name : {host_name}</p>\r\n<p>Host Email Id : {host_email_id}</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="margin: 0 10px 0 0;">--</p>\r\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\r\n<p style="margin: 0px;">{site_name} Team</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>'),
(45, 'tc_book_to_host', 'Host notification for  Travel cretid booking', ' {traveler_name} sent the reservation request by using his Travel Cretids', 'Hello {username},\r\n\r\n{traveler_name}sent the reservation request to book your {list_title} place on {book_date} at {book_time} by using his Travel Credits.\r\n\r\nWe will contact you with the appropriate payment.\r\n\r\nDetails as follows,\r\n\r\nTraveler Name : {traveler_name}\r\nContact Email Id : {traveler_email_id}\r\nPlace Name : {list_title}\r\nCheck in : {checkin}\r\nCheck out : {checkout}\r\nPrice : {market_price}\r\n\r\n--\r\nThanks and Regards,\r\n\r\nAdmin\r\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>Hi {username} ,</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>{traveler_name}sent the reservation request to book your {list_title} place on {book_date} at {book_time} by using his Travel Credits.</p>\r\n<p>Details as follows,</p>\r\n<p>Traveler Name : {traveler_name}</p>\r\n<p>Contact Email Id : {traveler_email_id}</p>\r\n<p>Place Name : {list_title}</p>\r\n<p>Check in : {checkin}</p>\r\n<p>Check out : {checkout}</p>\r\n<p>Price : {market_price}</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="margin: 0 10px 0 0;">--</p>\r\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\r\n<p style="margin: 0 0 10px 0;">Admin,</p>\r\n<p style="margin: 0px;">{site_name}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>'),
(46, 'admin_mass_email', 'Admin mass email', '{subject}', 'Hi User,\r\n\r\n{dynamic_content}\r\n\r\n--\r\nThanks and Regards,\r\n\r\nAdmin\r\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>Hi User,</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>{dynamic_content}</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="margin: 0 10px 0 0;">--</p>\r\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\r\n<p style="margin: 0 10px 0 0;">Admin</p>\r\n<p style="margin: 0px;">{site_name}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>'),
(47, 'user_reference', 'Reference', 'Write {username} a reference on {site_name}', 'Hi,\n\n{username} is asking you to provide a reference that they can display publicly on their {site_name} profile. {site_name} is a community marketplace for accommodations that is built on trust and reputation. A reference from you would really help build their reputation with the community.\nA reference on {site_name} can help {username} find a cool place to stay or host interesting travelers. \n\n{click_here} to have a Reference for {username}.\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi,</td>\n</tr>\n<tr>\n<td>\n<p>{username} is asking you to provide a reference that they can display publicly on their {site_name} profile. {site_name} is a community marketplace for accommodations that is built on trust and reputation. A reference from you would really help build their reputation with the community. A reference on {site_name} can help {username} find a cool place to stay or host interesting travelers.</p>\n<p>{click_here} to have a Reference for {username}.</p>\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>Admin</p>\n<p>{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(101, 'reference_receive', 'Reference Receive', 'You have received a new reference on {site_name}!', 'Hi {username},\r\n\r\n{other_username} has written a reference for you. Before it goes to your public profile, you can review it and either accept or ignore it. {click_here} to view the reference. \r\n\r\n--\r\nThanks and Regards,\r\n\r\nAdmin\r\n{site_name}', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {username},</td>\n</tr>\n<tr>\n<td>\n<p>{other_username} has written a reference for you. Before it goes to your public profile, you can review it and either accept or ignore it. {click_here} to view the reference.</p>\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>Admin</p>\n<p>{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(48, 'host_reservation_notification', 'Reservation notification for host', 'The Reservation was requested by  {traveler_name}', 'Hello {username},\n\n{traveler_name} booked the {list_title} place on {book_date} at {book_time}.\n\nDetails as follows,\n\nTraveler Name : {traveler_name}\nContact Email Id : {traveler_email_id}\nPlace Name : {list_title}\nCheck in : {checkin}\nCheck out : {checkout}\nPrice : {market_price}\n\nPlease give the confirmation by clicking the below action.\n{action_url}\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>\r\n<p>Hi {username} ,</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>{traveler_name} booked the {list_title} place on {book_date} at {book_time}.</p>\r\n<br />\r\n<p>Details as follows,</p>\r\n<p>Traveler Name : {traveler_name}</p>\r\n<p>Contact Email Id : {traveler_email_id}</p>\r\n<p>Place Name : {list_title}</p>\r\n<p>Check in : {checkin}</p>\r\n<p>Check out : {checkout}</p>\r\n<p>Price : {market_price}</p>\r\n<br />\r\n<p>Please give the confirmation by clicking the below action.</p>\r\n<p>{action_url}</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="margin: 0 10px 0 0;">--</p>\r\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\r\n<p style="margin: 0px;">{site_name} Team</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>'),
(49, 'traveller_reservation_notification', 'Reservation notification for  traveller', 'Your Reservation Request Is Succesfully Sent', 'Hello {traveler_name},\r\n\r\nYour reservation request is successfully sent to the appropriate host.\r\n\r\nPlease wait for his confirmation.\r\n\r\n--\r\nThanks and Regards,\r\n\r\nAdmin\r\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>Hi {traveler_name} ,</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>Your reservation request is successfully sent to the appropriate host.</p>\r\n<p>Please wait for his confirmation.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="margin: 0 10px 0 0;">--</p>\r\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\r\n<p style="margin: 0 0 10px 0;">Admin,</p>\r\n<p style="margin: 0px;">{site_name}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>'),
(50, 'admin_reservation_notification', 'Reservation notification for  administrator', '{traveler_name} sent the reservation request to {host_name}', 'Hello Admin,\n\n{traveler_name} sent the reservation request for {list_title} place on {book_date} at {book_time}.\n\nDetails as follows,\n\nTraveler Name : {traveler_name}\nContact Email Id : {traveler_email_id}\nPlace Name : {list_title}\nCheck in : {checkin}\nCheck out : {checkout}\nPrice : {market_price}\nHost Name : {host_name}\nHost Email Id : {host_email_id} \n\n--\nThanks and Regards,\n\n{site_name} Team', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi Admin,</td>\n</tr>\n<tr>\n<td>\n<p>{traveler_name} sent the reservation request for  {list_title} place on {book_date} at {book_time}.</p>\n<p>Details as follows,</p>\n<p>Traveler Name : {traveler_name}</p>\n<p>Contact Email Id : {traveler_email_id}</p>\n<p>Place Name : {list_title}</p>\n<p>Check in : {checkin}</p>\n<p>Check out : {checkout}</p>\n<p>Price : {market_price}</p>\n<p>Host Name : {host_name}</p>\n<p>Host Email Id : {host_email_id}</p>\n</td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0px;">{site_name} Team</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(51, 'traveler_reservation_granted', 'Traveler : After Reservation granted', 'Congrats! Your reservation request is granted.', 'Hi {traveler_name},\n\nCongratulation, Your reservation request is granted by {host_name} for {list_name}.\n\nBelow we mentioned his contact details,\n\nFirst Name : {Fname}\nLast Name : {Lname}\nLive In : {livein}\nPhone No : {phnum}\n\nExact Address is,\n\nStreet Address : {street_address}\nOptional Address : {optional_address}\nCity : {city}\nState : {state}\nCountry : {country}\nZip Code : {zipcode}\n\nHost Message : {comment} \n\n--\nThanks and Regards,\n\nAdmin\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {traveler_name} ,</td>\n</tr>\n<tr>\n<td>\n<p>Congratulation, Your reservation request is granted by {host_name} for {list_name}.</p>\n<p>Below we mentioned his contact details,</p>\n<p>First Name : {Fname}</p>\n<p>Last Name : {Lname}</p>\n<p>Live In : {livein}</p>\n<p>Phone No : {phnum}</p>\n<p>Exact Address is,</p>\n<p>Street Address : {street_address},</p>\n<p>Optional Address :{optional_address},</p>\n<p>City : {city},</p>\n<p>State : {state},</p>\n<p>Country : {country},</p>\n<p>Zip code : {zipcode}</p>\n<p>Host Message : {comment}</p>\n</td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0 0 10px 0;">Admin,</p>\n<p style="margin: 0px;">{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(52, 'traveler_reservation_declined', 'Traveler : After reservation declined', 'Sorry! Your reservation request is denied', 'Hi {traveler_name},\n\nSorry, Your reservation request is dined by {host_name} for {list_title}.\n\nHost Message : {comment} \n\nSoon, We will contact you with the appropriate payment.\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {traveler_name} ,</td>\n</tr>\n<tr>\n<td>\n<p>Sorry, Your reservation request is dined by {host_name} for {list_title}.</p>\n<p>Host Message : {comment}</p>\n<p>Soon, We will contact you with the appropriate payment.</p>\n</td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0 0 10px 0;">Admin,</p>\n<p style="margin: 0px;">{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(60, 'traveler_reservation_cancel', 'Traveler : After reservation canceled', '{traveler_name} cancelled your reservation list', 'Hi {host_name},\n\nSorry, Your ({status}) reservation list is cancelled by {traveler_name} for {list_title}.\n\n{user_type} Message : {comment} \n\nSure we will contact you soon, if there is any payment balance.\n\nAnd also, if you have any other queries, please feel free to contact us.\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {host_name} ,</td>\n</tr>\n<tr>\n<td>\n<p>Sorry, Your ({status}) reservation list is canceled by {traveler_name} for {list_title}.</p>\n<p>{user_type} Message : {comment}</p>\n<p>Sure we will contact you soon, if there is any payment balance.</p>\n<p>And also, if you have any other queries, please feel free to contact us.</p>\n</td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0 0 10px 0;">Admin,</p>\n<p style="margin: 0px;">{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(53, 'traveler_reservation_expire', 'Traveler : Reservation Expire', 'Sorry! Your {type} request is expired', 'Hi {traveler_name},\n\nYour {type} request is expired.\n\nHost Name : {host_name}\nList Name : {list_title}\nPrice : {currency}{price}\nCheckin Date : {checkin}\nCheckout Date : {checkout}\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}\n', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {traveler_name},</td>\n</tr>\n<tr>\n<td>\n<br />\nYour {type} request is expired.<br /><br />\nHost Name : {host_name}.<br /><br />\nList Name : {list_title}.<br /><br />\nPrice : {currency}{price}.<br /><br />\nCheckin Date : {checkin}.<br /><br />\nCheckout Date : {checkout}.\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>{site_name} Team</p>\n<div>&nbsp;</div>\n</td>\n</tr>\n</tbody>\n</table>'),
(54, 'host_reservation_expire', 'Host : Reservation Expire', '{type} request expired for your list', 'Hi {host_name},\n\n{type} request expired for {list_title} booked by {traveler_name}.\n\nGuest Name : {traveler_name}\nList Name : {list_title}\nPrice : {currency}{price}\nCheckin Date : {checkin}\nCheckout Date : {checkout}\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}\n', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {host_name},</td>\n</tr>\n<tr>\n<td>\n<br />\n{type} request expired for {list_title} booked by {traveler_name}.<br /><br />\nGuest Name : {traveler_name}.<br /><br />\nList Name : {list_title}.<br /><br />\nPrice : {currency}{price}.<br /><br />\nCheckin Date : {checkin}.<br /><br />\nCheckout Date : {checkout}.\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>{site_name} Team</p>\n<div>&nbsp;</div>\n</td>\n</tr>\n</tbody>\n</table>'),
(55, 'admin_reservation_expire', 'Admin : Reservation Expire', '{type} request is expired', 'Hi Admin,\n\n{traveler_name} {type} request is expired for {list_title}.\n\nGuest Name : {traveler_name}\nGuest Email : {traveler_email}\nHost Name : {host_name}\nHost Email : {host_email}\nList Name : {list_title}\nPrice : {currency}{price}\nCheckin Date : {checkin}\nCheckout Date : {checkout}\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}\n\n', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi Admin,</td>\n</tr>\n<tr>\n<td>\n<br />\n{traveler_name} {type} request is expired for {list_title}.<br /><br />\nGuest Name : {traveler_name}.<br /><br />\nGuest Email : {traveler_email}.<br /><br />\nHost Name : {host_name}.<br /><br />\nHost Email : {host_email}.<br /><br />\nList Name : {list_title}.<br /><br />\nPrice : {currency}{price}.<br /><br />\nCheckin Date : {checkin}.<br /><br />\nCheckout Date : {checkout}.\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>{site_name} Team</p>\n<div>&nbsp;</div>\n</td>\n</tr>\n</tbody>\n</table>'),
(56, 'host_reservation_granted', 'Host : After Reservation Granted', 'You have accepted the {traveler_name} reservation request', 'Hi {host_name},\r\n\r\nYou have accepted the {traveler_name} reservation request for {list_title}.\r\n\r\nBelow we mentioned his contact details,\r\n\r\nFirst Name : {Fname}\r\nLast Name : {Lname}\r\nLive In : {livein}\r\nPhone No : {phnum}\r\n\r\n--\r\nThanks and Regards,\r\n\r\nAdmin\r\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>Hi {host_name} ,</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>You have accepted the {traveler_name} reservation request for {list_title}.</p>\r\n<p>Below we mentioned his contact details,</p>\r\n<p>First Name : {Fname}</p>\r\n<p>Last Name : {Lname}</p>\r\n<p>Live In : {livein}</p>\r\n<p>Phone No : {phnum}</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="margin: 0 10px 0 0;">--</p>\r\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\r\n<p style="margin: 0 0 10px 0;">Admin,</p>\r\n<p style="margin: 0px;">{site_name}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>'),
(57, 'admin_reservation_granted', 'Admin : After Reservation granted', '{host_name} accepted the {traveler_name} reservation request', 'Hi Admin,\r\n\r\n{host_name} accepted the {traveler_name} reservation request for {list_title}.\r\n\r\n--\r\nThanks and Regards,\r\n\r\n{site_name} Team', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>Hi Admin,</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>{host_name} accepted the {traveler_name} reservation request for {list_title}.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="margin: 0 10px 0 0;">--</p>\r\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\r\n<p style="margin: 0px;">{site_name} Team</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>'),
(58, 'host_reservation_declined', 'Host : After Reservation Declined', 'You have declined the {traveler_name} reservation request', 'Hi {host_name},\r\n\r\nYou have declined the {traveler_name} reservation request for {list_title}.\r\n\r\n--\r\nThanks and Regards,\r\n\r\nAdmin\r\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>Hi {host_name} ,</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>You have declined the {traveler_name} reservation request} for {list_title}.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="margin: 0 10px 0 0;">--</p>\r\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\r\n<p style="margin: 0 0 10px 0;">Admin,</p>\r\n<p style="margin: 0px;">{site_name}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>'),
(59, 'admin_reservation_declined', 'Admin : After Reservation Declined', '{host_name} declined the {traveler_name} reservation request', 'Hi Admin,\r\n\r\n{host_name} declined the {traveler_name} reservation request for {list_title}.\r\n\r\n--\r\nThanks and Regards,\r\n\r\n{site_name} Team', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>Hi Admin,</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>{host_name} declined the {traveler_name} reservation request for {list_title}.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="margin: 0 10px 0 0;">--</p>\r\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\r\n<p style="margin: 0px;">{site_name} Team</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>'),
(61, 'admin_reservation_cancel', 'Admin : After reservation canceled', '{traveler_name} cancelled the {host_name} reservation list', 'Hi Admin,\n\n{traveler_name} cancelled the {host_name} reservation list ({status}) for {list_title}.\n\n{penalty}\n\n--\nThanks and Regards,\n\n{site_name} Team', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi Admin,</td>\n</tr>\n<tr>\n<td>\n<p>{traveler_name} canceled the {host_name}&nbsp; reservation list ({status}) for {list_title}.\n<br/><br/>{penalty}\n</p>\n</td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0px;">{site_name} Team</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(62, 'host_reservation_cancel', 'Host : After reservation canceled', 'You have cancelled the {host_name} reservation list', 'Hi {traveler_name},\n\nYou have cancelled the {host_name} reservation list ({status}) for {list_title}.\n\n{cancellation_limit}\n\n{penalty}\n\nIf you have any other queries, please feel free to contact us. \n\n--\nThanks and Regards,\n\nAdmin\n{site_name}', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {traveler_name} ,</td>\n</tr>\n<tr>\n<td>\n<p>You have canceled the {host_name}&nbsp; reservation list ({status}) for {list_title}.<br /><br />{cancellation_limit}<br /><br />{penalty}</p>\n<p>If you have any other queries, please feel free to contact us.</p>\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>Admin,</p>\n<p>{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(63, 'forgot_password', 'Forgot Password', 'Forgot Password', 'Dear Member,\n\nBelow we have mentioned your account details.\n\nHere we go,\n\nEmail_id : {email}\n\nPassword : {password}\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Dear Member,</td>\n</tr>\n<tr>\n<td>\n<p>Below we have mentioned your account details.</p>\n<p>Here we go,</p>\n<p>Email_id : {email}</p>\n<p>Password : {password}</p>\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>Admin</p>\n<p>{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(91, 'checkin_host', 'Host: Check In', 'Guest CheckIn', 'Hi {host_name},\n\n{traveler_name} is checkin to {list_title}.\n\nGuest Name : {guest_name}\nList Name : {list_title}\nPrice : {currency}{price}\nCheckin Date : {checkin}\nCheckout Date : {checkout}\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}\n', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {host_name},</td>\n</tr>\n<tr>\n<td>\n<br />\n{traveler_name} is checkin to&nbsp;&nbsp;{list_title} &nbsp;.<br /><br />\nGuest Name : {traveler_name}.<br /><br />\nList Name : {list_title}.<br /><br />\nPrice : {currency}{price}.<br /><br />\nCheckin Date : {checkin}.<br /><br />\nCheckout Date : {checkout}.\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>{site_name} Team</p>\n<div>&nbsp;</div>\n</td>\n</tr>\n</tbody>\n</table>'),
(64, 'users_signin', 'Users Signin', 'Welcome to  {site_name}', 'Dear Member,\r\n\r\nPleasure to meet you and welcome to the {site_name}.\r\n\r\nBelow we have mentioned your account details.\r\n\r\nHere we go,\r\n\r\nEmail_id : {email}\r\n\r\nPassword : {password}\r\n\r\n--\r\nThanks and Regards,\r\n\r\nAdmin\r\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>Dear Member,</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>Pleasure to meet you and welcome to the {site_name}.</p>\r\n<p>Below we have mentioned your account details.</p>\r\n<p>Here we go,</p>\r\n<p>Email_id : {email}</p>\r\n<p>Password : {password}</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="margin: 0 10px 0 0;">--</p>\r\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\r\n<p style="margin: 0 10px 0 0;">Admin</p>\r\n<p style="margin: 0px;">{site_name}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>'),
(65, 'reset_password', 'Reset Password', 'Reset Password', 'Dear Member,\n\nBelow we have mentioned your new account details.\n\nHere we go,\n\nPassword : {password}\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>Dear Member,</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>Below we have mentioned your new account details.</p>\r\n<p>Here we go,</p>\r\n<p>Password : {password}</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="margin: 0 10px 0 0;">--</p>\r\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\r\n<p style="margin: 0 10px 0 0;">Admin</p>\r\n<p style="margin: 0px;">{site_name}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>'),
(66, 'admin_payment', 'Admin payment to Host', 'Admin payed your fees for {list_title}', 'Hello {username},\n\nWe have payed your fees for {list_title}.\n\nDetails as follows,\n\nPlace Name : {list_title}\nCheck in : {checkin}\nCheck out : {checkout}\nPrice : {payed_price}\nPayment Through : {payment_type}\nPay Id: {pay_id}\nPayed Date : {payed_date}\n\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>\n<p>Hi {username} ,</p>\n</td>\n</tr>\n<tr>\n<td>\n<p>We have payed your fees for {list_title}.</p>\n<br />\n<p>Details as follows,</p>\n<p>Place Name : {list_title}</p>\n<p>Check in : {checkin}</p>\n<p>Check out : {checkout}</p>\n<p>Price : {payed_price}</p>\n<p>Payment Through : {payment_type}</p>\n<p>Pay Id : {pay_id}</p>\n<p>Payed Date : {payed_date}</p>\n</td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0px;">{site_name} Team</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(67, 'contact_form', 'Contact Form', 'Message received from contact form', 'Hi Admin,\n\nA message received from contact us page on {date} at {time}.\n\nDetails as follows,\n\nName : {name}\n\nEmail : {email}\n\nMessage : {message}\n\n--\nThanks and Regards,\n\n{site_name} Team', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi Admin,</td>\n</tr>\n<tr>\n<td>\n<p>A message received from contact us page on {date} at {time}.</p>\n<p>Details as follows,</p>\n<p>Name : {name}</p>\n<p>Email : {email}</p>\n<p>Message : {message}</p>\n</td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0px;">{site_name} Team</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(68, 'invite_friend', 'Invite My Friends', '{username} invite You.', 'Hi Friend''s,\n\n{username} wants you to invite {site_name}\n\n{dynamic_content}\n\n{click_here}\n\n--\nRegards,\n{username}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi Friends,</td>\n</tr>\n<tr>\n<td>\n<p>{username} wants you to invite</p>\n<p>{site_name}</p>\n<p>{dynamic_content}</p>\n<p>&nbsp;{click_here}</p>\n</td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Regards,</p>\n<p style="margin: 0px;">{username}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(69, 'email_verification', 'Email Verification Link', '{site_name} Email Verification Link', 'Hi {user_name},\n\nPlease Click the below link for your {site_name} email verification.\n\n{click_here}\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {user_name},</td>\n</tr>\n<tr>\n<td>\n<p>Please Click the below link for your {site_name} email verification.</p>\n<p>&nbsp;{click_here}</p>\n</td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0 10px 0 0;">Admin</p>\n<p style="margin: 0px;">{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(70, 'referral_credit', 'Referral Credit', 'You are earn {amount} from Referrals', 'Hi {username},\n\nYou are earn the {amount} by {friend_name}\n\n--\nThanks and Regards,\nAdmin\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {user_name},</td>\n</tr>\n<tr>\n<td><p>\nYou are earn the {amount} by {friend_name}</p>\n</td>\n</tr><tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0 10px 0 0;">Admin</p>\n<p style="margin: 0px;">{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(72, 'User_join_to_Referal_mail', 'User join to Referal mail', 'Your Friend Signup', 'Dear {refer_name},\n\nYour friend {friend_name} is now join in {site_name}.Now, $100 is credit in your Travel Credit Possible account.\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Dear {refer_name},</td>\n</tr>\n<tr>\n<td><br />Your friend {friend_name} is now join in {site_name}.Now, $100 is credit in your Travel Credit Possible account.<br /><br /></td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0 10px 0 0;">Admin</p>\n<p style="margin: 0px;">{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(73, 'contact_request_to_host', 'Contact Request to Host', 'Contact Request', 'Hi {host_username},\n		\nPlease click on the following link to contact the user : {link}	\n\nList : {title}\n		\nCheckin Date : {checkin}\n		\nCheckout Date : {checkout}\n		\nGuests : {guest}\n		\nGuest Message  : {message}\n\n--\nThanks and Regards,\nAdmin\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {host_username},</td>\n</tr>\n<tr>\n<td>\nPlease click on the following link to contact the user : {link}<br /><br />\n			\nList : {title}<br /><br />\n		\nCheckin Date : {checkin}<br /><br />\n		\nCheckout Date : {checkout}<br /><br />\n		\nGuests : {guest}<br /><br />\n		\nGuest Message  : {message}<br /><br /></td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0 10px 0 0;">Admin</p>\n<p style="margin: 0px;">{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(74, 'contact_request_to_guest', 'Contact Request to Guest', 'Contact Request', 'Hi {traveller_username},\n		\nYou have sent contact request to {host_username}.\n\nList : {title}\n		\nCheckin Date : {checkin}\n		\nCheckout Date : {checkout}\n		\nGuests : {guest}\n		\nYour Message  : {message}\n\n--\nThanks and Regards,\nAdmin\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {traveller_username},</td>\n</tr>\n<tr>\n<td>\nYou have sent contact request to {host_username}.<br /><br />\n			\nList : {title}<br /><br />\n		\nCheckin Date : {checkin}<br /><br />\n		\nCheckout Date : {checkout}<br /><br />\n		\nGuests : {guest}<br /><br />\n		\nYour Message  : {message}<br /><br /></td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0 10px 0 0;">Admin</p>\n<p style="margin: 0px;">{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(75, 'request_granted_to_guest', 'Contact Request Granted to Guest', 'Contact Request Granted', 'Hi {traveller_username},\n\nYour contact request is granted by {host_username}.\n		\nHost Email : {host_email}\n\nList : {title}\n		\nCheckin Date : {checkin}\n		\nCheckout Date : {checkout}\n			\nHost Message  : {message}\n\nURL for Booking  : {link}\n\n--\nThanks and Regards,\nAdmin\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {traveller_username},</td>\n</tr>\n<tr>\n<td><br /><br />\nYour contact request is granted by {host_username}.\n<br /><br />\n\nHost Email : {host_email}<br /><br /> \n\nList : {title}<br /><br /> \n\nCheckin Date : {checkin}<br /><br /> \n\nCheckout Date : {checkout}<br /><br /> \n\nPrice : {price}<br /><br />\n\nHost Message : {message}<br /><br /> \n\nURL for Booking : {link}<br /><br /></td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0 10px 0 0;">Admin</p>\n<p style="margin: 0px;">{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(76, 'request_granted_to_host', 'Contact Request Granted to Host', 'Contact Request Granted', 'Hi {host_username},\n\nYou have accept the contact request for {traveller_username}.\n		\nGuest Email : {guest_email}\n\nList : {title}\n		\nCheckin Date : {checkin}\n		\nCheckout Date : {checkout}\n\nPrice : {price}\n				\nYour Message  : {message}\n\n--\nThanks and Regards,\nAdmin\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {host_username},</td>\n</tr>\n<tr>\n<td><br /><br />\nYou have accept the contact request for {traveller_username}. <br /><br />\n\nGuest Email : {guest_email}<br /><br />	\n		\nList : {title}<br /><br />\n		\nCheckin Date : {checkin}<br /><br />\n		\nCheckout Date : {checkout}<br /><br />\n\nPrice : {price}<br /><br />\n	\nYour Message  : {message}<br /><br />\n\n</td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0 10px 0 0;">Admin</p>\n<p style="margin: 0px;">{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(77, 'contact_request_to_admin', 'Contact Request to Admin', 'Contact Request', 'Hi Admin,\n		\n{traveller_username} sent contact request to {host_username}.\n\nList : {title}\n		\nCheckin Date : {checkin}\n		\nCheckout Date : {checkout}\n		\nGuests : {guest}\n\nPrice : {price}\n		\nGuest Message  : {message}\n\n--\nThanks and Regards,\nAdmin\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi Admin,</td>\n</tr>\n<tr>\n<td><br />\n{traveller_username} sent contact request to {host_username}. <br /><br />		\nList : {title}<br /><br />	\nCheckin Date : {checkin}<br /><br />\n		\nCheckout Date : {checkout}<br /><br />\n	\nPrice : {price}<br /><br />\n		\nGuest Message  : {message}<br /><br />\n\n</td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0 10px 0 0;">Admin</p>\n<p style="margin: 0px;">{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(78, 'request_granted_to_admin', 'Contact Request Granted to Admin', 'Contact Request Granted', 'Hi Admin,\n\n{host_username} accept the contact request for {traveller_username}.\n		\nGuest Email : {guest_email}\n\nHost Email : {host_email}\n\nList : {title}\n		\nCheckin Date : {checkin}\n		\nCheckout Date : {checkout}\n\nPrice : {price}\n				\nHost Message  : {message}\n\n--\nThanks and Regards,\nAdmin\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi Admin,</td>\n</tr>\n<tr>\n<td><br />\n{host_username} accept the contact request for {traveller_username}.<br /><br />\n\nGuest Email : {guest_email}<br /><br />	\n\nHost Email : {host_email}<br /><br />	\n\nList : {title}<br /><br />	\n\nCheckin Date : {checkin}<br /><br />\n		\nCheckout Date : {checkout}<br /><br />\n\nPrice : {price}<br /><br />	\n			\nHost Message  : {message}<br /><br />\n\n</td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0 10px 0 0;">Admin</p>\n<p style="margin: 0px;">{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(79, 'special_request_granted_to_guest', 'Contact Request Granted with Special Offer to Guest', 'Contact Request Granted with Special Offer', 'Hi {traveller_username},\n\n{host_username} accept your contact request with special offer.\n		\nHost Email : {host_email}\n\nList : {title}\n		\nCheckin Date : {checkin}\n		\nCheckout Date : {checkout}\n\nPrice : {price}\n				\nMessage  : {message}\n\nURL for Booking  : {link}\n\n--\nThanks and Regards,\nAdmin\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {traveller_username},</td>\n</tr>\n<tr>\n<td><br />\n\n{host_username} accept your contact request with special offer.<br /><br />\n\nHost Email : {host_email}<br /><br />	\n\nList : {title}<br /><br />	\n\nCheckin Date : {checkin}<br /><br />\n		\nCheckout Date : {checkout}<br /><br />\n\nPrice : {price}<br /><br />\n			\nMessage  : {message}<br /><br />\n\nURL for Booking  : {link}<br /><br />\n\n</td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0 10px 0 0;">Admin</p>\n<p style="margin: 0px;">{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(80, 'special_request_granted_to_host', 'Contact Request Granted with Special Offer to Host', 'Contact Request Granted with Special Offer', 'Hi {host_username},\n\nYou have accept the {traveller_username} contact request with special offer.\n		\nGuest Email : {guest_email}\n\nList : {title}\n		\nCheckin Date : {checkin}\n		\nCheckout Date : {checkout}\n\nPrice : {price}\n			\nYour Message  : {message}\n\n--\nThanks and Regards,\nAdmin\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {host_username},</td>\n</tr>\n<tr>\n<td><br />\n\nYou have accept the {traveller_username} contact request with special offer.<br /><br />\n\nGuest Email : {guest_email}<br /><br />\n\nList : {title}<br /><br />	\n\nCheckin Date : {checkin}<br /><br />\n		\nCheckout Date : {checkout}<br /><br />\n\nPrice : {price}<br /><br />\n			\nYour Message  : {message}<br /><br />\n\n</td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0 10px 0 0;">Admin</p>\n<p style="margin: 0px;">{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(81, 'special_request_granted_to_admin', 'Contact Request Granted with Special Offer to Admin', 'Contact Request Granted with Special Offer', 'Hi Admin,\n\n{host_username} have accept the {traveller_name} contact request with special offer.\n		\nGuest Email : {guest_email}\n\nHost Email : {host_email}\n\nList : {title}\n		\nCheckin Date : {checkin}\n		\nCheckout Date : {checkout}\n\nPrice : {price}\n			\nHost Message  : {message}\n\n--\nThanks and Regards,\nAdmin\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi Admin,</td>\n</tr>\n<tr>\n<td><br />\n\n{host_username} have accept the {traveller_username} contact request with special offer.<br /><br />\n\nGuest Email : {guest_email}<br /><br />\n\nHost Email : {host_email}<br /><br />\n\nList : {title}<br /><br />	\n\nCheckin Date : {checkin}<br /><br />\n		\nCheckout Date : {checkout}<br /><br />\n\nPrice : {price}<br /><br />\n			\nHost Message  : {message}<br /><br />\n\n</td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0 10px 0 0;">Admin</p>\n<p style="margin: 0px;">{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(82, 'request_cancel_to_guest', 'Contact Request Cancelled to Guest', 'Sorry! your contact request is cancelled', 'Hi {traveller_username},\n\nSorry, Your contact request is denied by {host_username} for {title}.\n\nHost Message : {message}\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {traveller_username} ,</td>\n</tr>\n<tr>\n<td>\n<p>Sorry, Your contact request is denied by {host_username} for {title}.</p><br /><br />\nHost Message : {message}<br /><br />\n</td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0 0 10px 0;">Admin,</p>\n<p style="margin: 0px;">{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(83, 'request_cancel_to_host', 'Contact Request Cancelled to Host', 'You have cancelled the contact request', 'Hi {host_username},\n\nYou have cancelled the {traveller_username} contact request for {title}.\n\nYour message : {message}\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {host_username} ,</td>\n</tr>\n<tr>\n<td>\n<p>You have cancelled the {traveller_username} contact request for {title}.</p><br /><br />\nYour message : {message}<br /><br />\n</td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0 0 10px 0;">Admin,</p>\n<p style="margin: 0px;">{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(85, 'checkout_admin', 'Admin: Check Out', 'Traveller Checkout', 'Hi Admin,\n\n{traveler_name} is checkouted from {list_title}.\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}\n', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi Admin,</td>\n</tr>\n<tr>\n<td>\n<p>{traveler_name} is checkouted form {list_title}.</p>\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>{site_name} Team</p>\n<div> </div>\n</td>\n</tr>\n</tbody>\n</table>'),
(84, 'request_cancel_to_admin', 'Contact Request Cancelled to Admin', '{host_username} cancelled the {traveller_username} contact request', 'Hi Admin,\n\n{host_username} cancelled the {traveller_username} contact request for {title}.\n\nHost message : {message}\n\n--\nThanks and Regards,\n\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi Admin,</td>\n</tr>\n<tr>\n<td>\n<p>{host_username} cancelled the {traveller_username} contact request for {title}.</p>\n<br /><br />\nHost message : {message}.\n</td>\n</tr>\n<tr>\n<td>\n<p style="margin: 0 10px 0 0;">--</p>\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\n<p style="margin: 0px;">{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(86, 'checkout_host', 'Host: Check Out', 'Traveller Checkout', 'Hi {host_name},\n\n{traveler_name} is checkouted from {list_title} .\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {host_name} ,</td>\n</tr>\n<tr>\n<td>\n<p>{traveler_name} is checkouted from&nbsp;&nbsp;{list_title} &nbsp;.</p>\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>Admin,</p>\n<p>{site_name}</p>\n<div>&nbsp;</div>\n</td>\n</tr>\n</tbody>\n</table>'),
(87, 'checkout_traveler', 'Traveler: Check Out', 'Traveller Checkout', 'Hi {traveler_name},\n\nThank you,You are checkouted from {list_title}.\n\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {traveler_name} ,</td>\n</tr>\n<tr>\n<td>\n<p>Thank you,You are sucessfully checkouted from {list_title}.</p>\n<p>&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>Admin,</p>\n<p>{site_name}</p>\n<div>&nbsp;</div>\n</td>\n</tr>\n</tbody>\n</table>'),
(88, 'contact_discuss_more_to_guest', 'Contact Request - Discuss more to Guest', 'Contact Request - Discuss more', 'Hi {traveller_username},\r\n\r\n{host_username} wants to discuss more with you.\r\n\r\nHost Email : {host_email}\r\n\r\nList : {title}\r\n		\r\nCheckin Date : {checkin}\r\n		\r\nCheckout Date : {checkout}\r\n				\r\nMessage  : {message}\r\n\r\n--\r\nThanks and Regards,\r\nAdmin\r\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>Hi {traveller_username},</td>\r\n</tr>\r\n<tr>\r\n<td><br />\r\n\r\n{host_username} wants to discuss more with you.<br /><br />\r\n\r\nHost Email : {host_email}<br /><br />	\r\n\r\nList : {title}<br /><br />	\r\n\r\nCheckin Date : {checkin}<br /><br />\r\n		\r\nCheckout Date : {checkout}<br /><br />\r\n			\r\nMessage  : {message}<br /><br />\r\n\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="margin: 0 10px 0 0;">--</p>\r\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\r\n<p style="margin: 0 10px 0 0;">Admin</p>\r\n<p style="margin: 0px;">{site_name}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>'),
(89, 'contact_discuss_more_to_host', 'Contact Request - Discuss more to Host', 'Contact Request - Discuss more', 'Hi {host_username},\r\n\r\nYou wants to discuss more with {traveller_username}.\r\n\r\nGuest Email : {guest_email}\r\n\r\nList : {title}\r\n		\r\nCheckin Date : {checkin}\r\n		\r\nCheckout Date : {checkout}\r\n				\r\nYour Message  : {message}\r\n\r\n--\r\nThanks and Regards,\r\nAdmin\r\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>Hi {host_username},</td>\r\n</tr>\r\n<tr>\r\n<td><br />\r\n\r\nYou wants to discuss more with {traveller_username}.<br /><br />\r\n\r\nGuest Email : {guest_email}<br /><br />	\r\n\r\nList : {title}<br /><br />	\r\n\r\nCheckin Date : {checkin}<br /><br />\r\n		\r\nCheckout Date : {checkout}<br /><br />\r\n			\r\nYour Message  : {message}<br /><br />\r\n\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="margin: 0 10px 0 0;">--</p>\r\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\r\n<p style="margin: 0 10px 0 0;">Admin</p>\r\n<p style="margin: 0px;">{site_name}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>'),
(90, 'contact_discuss_more_to_admin', 'Contact Request - Discuss more to Admin', 'Contact Request - Discuss more', 'Hi Admin,\r\n\r\n{host_username} wants to discuss more with {traveller_username}.\r\n\r\nGuest Email : {guest_email}\r\n\r\nHost Email : {host_email}\r\n\r\nList : {title}\r\n		\r\nCheckin Date : {checkin}\r\n		\r\nCheckout Date : {checkout}\r\n				\r\nHost Message  : {message}\r\n\r\n--\r\nThanks and Regards,\r\nAdmin\r\n{site_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>Hi Admin,</td>\r\n</tr>\r\n<tr>\r\n<td><br />\r\n\r\n{host_username} wants to discuss more with {traveller_username}.<br /><br />\r\n\r\nGuest Email : {guest_email}<br /><br />\r\n\r\nHost Email : {host_email}<br /><br />\r\n\r\nList : {title}<br /><br />\r\n\r\nCheckin Date : {checkin}<br /><br />\r\n		\r\nCheckout Date : {checkout}<br /><br />\r\n			\r\nHost Message  : {message}<br /><br />\r\n\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="margin: 0 10px 0 0;">--</p>\r\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\r\n<p style="margin: 0 10px 0 0;">Admin</p>\r\n<p style="margin: 0px;">{site_name}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>'),
(92, 'checkin_admin', 'Admin: CheckIn', 'Guest CheckIn', 'Hi Admin,\n\n{traveler_name} is checkin to {list_title}.\n\nGuest Name : {traveler_name}\nGuest Email : {traveler_email}\nHost Name : {host_name}\nHost Email : {host_email}\nList Name : {list_title}\nPrice : {currency}{price}\nCheckin Date : {checkin}\nCheckout Date : {checkout}\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}\n', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi Admin,</td>\n</tr>\n<tr>\n<td>\n<br />\n{traveler_name} is checkin to {list_title}.<br /><br />\nGuest Name : {traveler_name}.<br /><br />\nGuest Email : {traveler_email}.<br /><br />\nHost Name : {host_name}.<br /><br />\nHost Email : {host_email}.<br /><br />\nList Name : {list_title}.<br /><br />\nPrice : {currency}{price}.<br /><br />\nCheckin Date : {checkin}.<br /><br />\nCheckout Date : {checkout}.\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>{site_name} Team</p>\n<div>&nbsp;</div>\n</td>\n</tr>\n</tbody>\n</table>'),
(93, 'checkin_traveller', 'Traveler: Check In', 'Guest CheckIn', 'Hi {traveler_name},\n\nThank you,You are checkin to {list_title}.\n\nHost Name : {host_name}\nList Name : {list_title}\nPrice : {currency}{price}\nCheckin Date : {checkin}\nCheckout Date : {checkout}\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}\n', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {traveler_name},</td>\n</tr>\n<tr>\n<td>\n<br />\nThank you,You are sucessfully checkin to {list_title}.<br /><br />\nHost Name : {host_name}.<br /><br />\nList Name : {list_title}.<br /><br />\nPrice : {currency}{price}.<br /><br />\nCheckin Date : {checkin}.<br /><br />\nCheckout Date : {checkout}.\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>{site_name} Team</p>\n<div>&nbsp;</div>\n</td>\n</tr>\n</tbody>\n</table>'),
(94, 'refund_admin', 'Admin: Refund', 'Refund from Admin', 'Hi Admin,\n\nYou have refunded the {refund_amt} amount to {name} {account} account.\n\nGuest Name : {traveler_name}\nGuest Email : {traveler_email}\nHost Name : {host_name}\nHost Email : {host_email}\nList Name : {list_title}\nPrice : {currency}{price}\nCheckin Date : {checkin}\nCheckout Date : {checkout}\nRefunded Amount : {refund_amt}\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}\n', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi Admin,</td>\n</tr>\n<tr>\n<td>\n<br />\nYou have refunded the {refund_amt} amount to {name} {account} account.<br /><br />\nGuest Name : {traveler_name}.<br /><br />\nGuest Email : {traveler_email}.<br /><br />\nHost Name : {host_name}.<br /><br />\nHost Email : {host_email}.<br /><br />\nList Name : {list_title}.<br /><br />\nPrice : {currency}{price}.<br /><br />\nCheckin Date : {checkin}.<br /><br />\nCheckout Date : {checkout}.<br /><br />\nRefunded Amount : {refund_amt}\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>{site_name} Team</p>\n<div>&nbsp;</div>\n</td>\n</tr>\n</tbody>\n</table>'),
(95, 'refund_host', 'Host: Refund', 'Refund from Admin', 'Hi {host_name},\r\n\r\nAdmin refunded the {refund_amt} amount to your {account} account.\r\n\r\nGuest Name : {traveler_name}\r\nList Name : {list_title}\r\nPrice : {currency}{price}\r\nCheckin Date : {checkin}\r\nCheckout Date : {checkout}\r\nRefunded Amount : {refund_amt}\r\n\r\n--\r\nThanks and Regards,\r\n\r\nAdmin\r\n{site_name}\r\n', '<table cellspacing="10" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>Hi {host_name},</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<br />\r\nAdmin refunded the {refund_amt} amount to your {account} account..<br /><br />\r\nGuest Name : {traveler_name}.<br /><br />\r\nList Name : {list_title}.<br /><br />\r\nPrice : {currency}{price}.<br /><br />\r\nCheckin Date : {checkin}.<br /><br />\r\nCheckout Date : {checkout}.<br /><br />\r\nRefunded Amount : {refund_amt}\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>--</p>\r\n<p>Thanks and Regards,</p>\r\n<p>{site_name} Team</p>\r\n<div>&nbsp;</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>');
INSERT INTO `email_templates` (`id`, `type`, `title`, `mail_subject`, `email_body_text`, `email_body_html`) VALUES
(96, 'refund_guest', 'Traveler: Refund', 'Refund from Admin', 'Hi {traveler_name},\n\nAdmin refunded the {refund_amt} amount to your {account} account.\n\nHost Name : {host_name}\nList Name : {list_title}\nPrice : {currency}{price}\nCheckin Date : {checkin}\nCheckout Date : {checkout}\nRefunded Amount : {refund_amt}\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}\n', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {traveler_name},</td>\n</tr>\n<tr>\n<td>\n<br />\nAdmin refunded the {refund_amt} amount to your {account} account.<br /><br />\nHost Name : {host_name}.<br /><br />\nList Name : {list_title}.<br /><br />\nPrice : {currency}{price}.<br /><br />\nCheckin Date : {checkin}.<br /><br />\nCheckout Date : {checkout}.<br /><br />\nRefunded Amount : {refund_amt}\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>{site_name} Team</p>\n<div>&nbsp;</div>\n</td>\n</tr>\n</tbody>\n</table>'),
(97, 'list_create_host', 'List creation to Host', 'You have created the new list', 'Hi {host_name},\r\n\r\nYou have created the new list.\r\n\r\nList name : {list_title}\r\n\r\nLink : {link}\r\n\r\nPrice : {price}\r\n\r\n\r\n--\r\nThanks and Regards,\r\nAdmin\r\n{site_name}', '<table cellspacing="10" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>Hi {host_name},</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<br />\r\nYou have created the new list.<br /><br />\r\nList Name : {list_title}.<br /><br />\r\nLink : {link}.<br /><br />\r\nPrice : {price}.\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>--</p>\r\n<p>Thanks and Regards,</p>\r\n<p>{site_name} Team</p>\r\n<div>&nbsp;</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>'),
(98, 'list_create_admin', 'List creation to Admin', '{host_name} have created the new list', 'Hi Admin,\r\n\r\n{host_name} have created the new list.\r\n\r\nHost name : {host_name}\r\n\r\nList name : {list_title}\r\n\r\nLink : {link}\r\n\r\nPrice : {price}\r\n\r\n\r\n--\r\nThanks and Regards,\r\nAdmin\r\n{site_name}', '<table cellspacing="10" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>Hi Admin,</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<br />\r\n{host_name} have created the new list.<br /><br />\r\nHost name : {host_name}.<br /><br />\r\nList name : {list_title}.<br /><br />\r\nLink : {link}.<br /><br />\r\nPrice : {price}.\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>--</p>\r\n<p>Thanks and Regards,</p>\r\n<p>{site_name} Team</p>\r\n<div>&nbsp;</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>'),
(99, 'list_delete_host', 'List deletion to Host', 'You have deleted the list', 'Hi {host_name},\r\n\r\nYou have deleted the list.\r\n\r\nList name : {list_title}\r\n\r\n--\r\nThanks and Regards,\r\nAdmin\r\n{site_name}', '<table cellspacing="10" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>Hi {host_name},</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<br />\r\nYou have deleted the list.<br /><br />\r\nList Name : {list_title}.\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>--</p>\r\n<p>Thanks and Regards,</p>\r\n<p>{site_name} Team</p>\r\n<div>&nbsp;</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>'),
(100, 'list_delete_admin', 'List deletion to Admin', '{host_name} have deleted the list', 'Hi Admin,\r\n\r\n{host_name} have deleted the list.\r\n\r\nHost name : {host_name}\r\n\r\nList name : {list_title}\r\n\r\n\r\n--\r\nThanks and Regards,\r\nAdmin\r\n{site_name}', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi Admin,</td>\n</tr>\n<tr>\n<td>\n<br />\n{host_name} have deleted the list.<br /><br />\nHost name : {host_name}.<br /><br />\nList name : {list_title}.\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>{site_name} Team</p>\n<div>&nbsp;</div>\n</td>\n</tr>\n</tbody>\n</table>'),
(102, 'payment_issue_to_admin', 'Payment issue mail to Admin', 'Payment misconfigured', 'Hi Admin,\n\n{payment_type} API credentials are misconfigured.\n\n{username} tried to make the payment.\n\nEmail ID : {email_id}\n\n--\nThanks and Regards,\nAdmin\n{site_name}', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi Admin,</td>\n</tr>\n<tr>\n<td>\n<p>{payment_type} API credentials are misconfigured.</p>\n<p>{username} tried to make the payment.</p>\n<p>Email ID : {email_id}</p>\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>Admin</p>\n<p>{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(104, 'refund_host_commission', 'Host: Accept Commission Refund', 'Refunding the Host Accept Commission from Admin', 'Hi {host_name},\n\nAdmin refunded the {refund_amt} amount to your {account} account.\n\nList Name : {list_title}\nRefunded Amount : {refund_amt}\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}\n', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {host_name},</td>\n</tr>\n<tr>\n<td>\n<p>Admin refunded the {refund_amt} amount to your {account} account.</p>\n<p>List Name : {list_title}</p>\n<p>Refunded Amount : {refund_amt}</p>\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>Admin</p>\n<p>{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(105, 'refund_host_commission_admin', 'Admin: Accept Commission Refund', 'You have Refunding the Host Accept Commission', 'Hi Admin,\n\nYou have refunded the {refund_amt} amount to your {account} account.\n\nList Name : {list_title}\nHost Name : {host_name}\nRefunded Amount : {refund_amt}\n\n--\nThanks and Regards,\n\nAdmin\n{site_name}\n', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi Admin,</td>\n</tr>\n<tr>\n<td>\n<p>You have refunded the {refund_amt} amount to your {account} account.</p>\n<p>List Name : {list_title}</p>\n<p>Host Name : {host_name}</p>\n<p>Refunded Amount : {refund_amt}</p>\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>Admin</p>\n<p>{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>'),
(111, 'passport_verification', 'Passport verification for Ã‚Â administrator', '{user_name} sent the passport verification  request ,userid-{user_id}', 'Hello Admin,\\n\\n{user_name}sent the passport verification request,user id {user_id}\\n\\nDetails as follows,\\n\\nUser Name : {user_name}\\nUser Id : {user_id}\\n\\n\\n\\n--\\nThanks and Regards,\\n\\n{user_name}', '<table style="width: 100%;" cellspacing="10" cellpadding="0">\\n<tbody>\\n<tr>\\n<td>Hi Admin,</td>\\n</tr>\\n<tr>\\n<td>\\n<p>{user_name} sent the passport verification request ,user id {user_id}.</p>\\n<p>Details as follows,</p>\\n<p>User Name : {user_name}</p>\\n<p>User Id : {user_id}</p>\\n\\n</td>\\n</tr>\\n<tr>\\n<td>\\n<p style="margin: 0 10px 0 0;">--</p>\\n<p style="margin: 0 0 10px 0;">Thanks and Regards,</p>\\n<p style="margin: 0px;">{user_name} </p>\\n</td>\\n</tr>\\n</tbody>\\n</table>'),
(112, 'change password to user', 'admin change to the password', 'Welcome to  {site_name}', 'admin change the passwordOld password:{new_password}Conform password:{conform_password}Dear Member,Old password:{new_password}Conform password:{conform_password}--Thanks and Regards,Admin{site_name} ', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Dear Member,</td>\n</tr>\n<tr>\n<td>\n<p>&nbsp;You have successfully changed your password</p>\n<p>Please use the below password details for login.</p>\n<p>Old password:{new_password}</p>\n<p><span>New password:{conform_password}</span></p>\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>Admin</p>\n<p>{site_name}</p>\n<div>&nbsp;</div>\n</td>\n</tr>\n</tbody>\n</table>'),
(113, 'spam', 'Spam List', 'Admin Message - Listing reported as Spam!', '****ADMIN MESSAGE****\n\n\n\nThe below listing has been reported as Spam:\n\nURL for Spam Listing : {list_url}', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>****ADMIN MESSAGE****</td>\n</tr>\n<tr>\n<td>\n<p>&nbsp;FLEXIFLAT.COM SPAM REPORT!</p>\n<p>The below listing has been reported as Spam:<br /><br />{list_url}</p>\n</td>\n</tr>\n<tr>\n<td>&nbsp;</td>\n</tr>\n</tbody>\n</table>\n<p>&nbsp;</p>'),
(114, 'host_notify_review', 'Host Notification for Review', '{guest_name} has a review from {host_name}', 'Hi {guest_name},\n\n{host_name} has added a review about you in {list_name} on {site_name}\n\nAnd he is waiting for your review.\nHost name : {host_name}\nList name : {list_name}\n\n\n--\nThanks and Regards,\nAdmin\n{site_name}\n', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {guest_name},</td>\n</tr>\n<tr>\n<td><br/ > {host_name} has added a review about you in {list_name} on {site_name} <br />And he is waiting for your review.\n<br/>\nHost name : {host_name}<br/>\nList name : {list_name}\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>{site_name} Team</p>\n<div>&nbsp;</div>\n</td>\n</tr>\n</tbody>\n</table>'),
(115, 'guest_notify_review', 'Guest Notification for Review', '{guest_name} has checked out.', 'Hi {host_name},\n\n{guest_name} has checkouted from your list {list_name} on {site_name}\n\nAnd he is waiting for your review.\n\n--\nThanks and Regards,\nAdmin\n{site_name}', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hi {host_name},</td>\n</tr>\n<tr>\n<td><br /> {guest_name} has checkouted from your list {list_name} on {site_name} <br />And he is waiting for your review.</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>{site_name} Team</p>\n<div>&nbsp;</div>\n</td>\n</tr>\n</tbody>\n</table>'),
(117, 'list_notification', 'Notification for calendar update', 'The list {list_name} needs an update', 'Hello {host_name},\n\nThe {list_name} you listed in {site_name} don''t have any updates in last month.\n\nTo improve your ranking in the search results please update your list \n--\nThanks and Regards,\n\nAdmin\n{site_name}', '<table cellspacing="10" cellpadding="0">\n<tbody>\n<tr>\n<td>Hello {host_name},</td>\n</tr>\n<tr>\n<td>\n<p>\nThe {list_name} you listed in {site_name} don''t have any updates in last month.</p>\n<p>\nTo improve your ranking in the search results please update your list \n</p>\n\n</td>\n</tr>\n<tr>\n<td>\n<p>--</p>\n<p>Thanks and Regards,</p>\n<p>Admin</p>\n<p>{site_name}</p>\n</td>\n</tr>\n</tbody>\n</table>\n'),
(116, 'host_notification', 'Upcoming notification for host', 'The {traveler_name} is having a reservation on your {list_title} on tomorrow', 'Hello {host_name},\r\n\r\n{traveler_name} booked the {list_title} place on tomorrow.\r\n\r\nDetails as follows,\r\n\r\nTraveler Name : {traveler_name}\r\nContact Email Id : {traveler_email_id}\r\nPlace Name : {list_title}\r\nCheck in : {checkin}\r\nCheck out : {checkout}\r\n\r\n\r\n--\r\nThanks and Regards,\r\n\r\nAdmin\r\n{site_name}', '<table cellspacing="10" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td>Hello {host_name},</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>{traveler_name} booked the {list_title} place on tomorrow.</p>\r\n<p>Details as follows,</p>\r\n\r\n<p>Traveler Name : {traveler_name}</p>\r\n<p>Contact Email Id : {traveler_email_id}</p>\r\n<p>Place Name : {list_title}</p>\r\n<p>Check in : {checkin}</p>\r\n<p>Check out : {checkout}</p>\r\n\r\n\r\n</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>--</p>\r\n<p>Thanks and Regards,</p>\r\n<p>Admin</p>\r\n<p>{site_name}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` bigint(20) unsigned NOT NULL,
  `question` varchar(128) CHARACTER SET utf8 NOT NULL,
  `faq_content` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created` int(31) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `question`, `faq_content`, `status`, `created`) VALUES
(1, 'Need help on this page?', '<p>Every one must be know how to work on this product. It is helpful to shows how to work in this product dropinn.</p>', 1, 0),
(2, 'How do i sign up?', '<p>It is helpful to shows how to sign up to access this product.</p>', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `google_analytics`
--

CREATE TABLE `google_analytics` (
  `id` int(255) NOT NULL,
  `transaction_id` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `google_analytics`
--

INSERT INTO `google_analytics` (`id`, `transaction_id`) VALUES
(1, '');

-- --------------------------------------------------------

--
-- Table structure for table `help`
--

CREATE TABLE `help` (
  `id` int(11) NOT NULL,
  `question` varchar(125) NOT NULL,
  `description` text NOT NULL,
  `page_refer` varchar(150) NOT NULL,
  `created` varchar(150) NOT NULL,
  `modified_date` varchar(150) NOT NULL,
  `status` int(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `help`
--

INSERT INTO `help` (`id`, `question`, `description`, `page_refer`, `created`, `modified_date`, `status`) VALUES
(1, 'Need help on this page?', '<p>Every one must be know how to work on this product. It is helpful to shows how to work in this product dropinn.</p>', 'home', '', '1375233569', 0),
(2, 'How do i sign up?', ' It is helpful to shows how to sign up to access this product.', 'home', '', '', 0),
(3, 'How can i create an account?', ' It is helpful to shows how to create an account to access this product.', 'dashboard', '1375203327', '', 0),
(5, 'How can i view my reserved rooms?', ' It is helpful to shows how to view my reserved rooms.', 'dashboard', '1375204538', '', 0),
(6, 'How can i edit my reserved rooms? 	', 'It is helpful to shows how to edit my reserved rooms.', 'hosting', '1375204557', '', 0),
(7, 'How to set my payout method to pay?', 'To click a payout method in dashboard and then select a payout method to pay.', 'account', '1375204597', '', 0),
(8, 'How to view my transaction history?', '&lt;p&gt;How to view my transaction history?&lt;/p&gt;', 'payout', '1375205019', '1375211187', 0),
(9, 'How can i add new rooms?', '&lt;p&gt;Fill the form correctly and then add new rooms&lt;/p&gt;', 'new', '1375211799', '', 0),
(10, 'How can i view my inbox?', '<p>Go to dashboard and then select a link inbox to view your messages</p>', 'inbox', '1375215395', '1375215585', 0),
(11, 'How can i cancel my reserved rooms?', '<p>Go to dashboard and then select a link reservations to view your reserved rooms. In this link has a cancellation button to cancel the reservations.', 'travelling', '1375215747', '', 1),
(12, 'How can i edit my profile?', 'Login to dashboard and then click a link edit profile to edit.', 'edit', '', '', 1),
(13, 'How can i view my reviews?', '<p>view your reviews to click a link in profile.</p>', 'reviews', '1375233515', '', 1),
(14, 'How can i view my current trip?', 'Select a travellin link and then click a current trip tab to view your current trips.', 'current_trip', '', '', 1),
(15, 'Need help on this page?', '<p>Every one must be know how to work on this product. It is helpful to shows how to work in this product dropinn.</p>', 'guide', '', '1377699914', 1),
(16, 'How do I verify my phone number?', '<p>To verify your phone number:</p>\r\n<ol>\r\n<li>Click your name in the top-right corner of site.</li>\r\n<li>Select <strong>Edit Profile</strong></li>\r\n<li>Look for <strong>Phone Number</strong> and click <strong>Add a phone number</strong></li>\r\n<li>Use the drop-down menu to select your country. We&rsquo;ll automatically insert the right country code.</li>\r\n<li>Enter your area code and phone number</li>\r\n<li>Click <strong>Verify via SMS</strong> or <strong>Verify via Call</strong>. We''ll send you a 4-digit code via an SMS (text) message or automated phone call.</li>\r\n<li>Enter the code we sent you and and click <strong>Verify</strong></li>\r\n<li>If you don&rsquo;t see a confirmation message, try refreshing the page. If the method you chose isn''t working, try the other one.</li>\r\n</ol>', 'verify', '1375215395', '', 0),
(17, 'How do references work?', '<p>&nbsp;Hosts and guests can receive public references from friends, family members, and colleagues to help build their profile. References help people throughout the Airbnb community get to know you, and feel more comfortable booking a reservation with you.<br /><br />You need an account to request and write references, and a reference will only display on the recipient&rsquo;s profile if the author of the reference has a profile photo of their own.<br /><br />To request a reference:<br /><br />&nbsp;&nbsp;&nbsp; Click your name in the top-right corner of site.<br />&nbsp;&nbsp;&nbsp; Select Edit Profile<br />&nbsp;&nbsp;&nbsp; Select References on the left-hand side and use the Request References section to send emails to the people you want to get a reference from<br /><br />In the References About You section, you&rsquo;ll see references that you&rsquo;ve received. You have to approve each reference before it will appear on your profile.<br /><br />In the References By You section, you&rsquo;ll see reference requests you&rsquo;ve received. The only way you can write a reference for someone else in the community is in response to a reference request&mdash;you can&rsquo;t proactively leave a reference for someone.<br /><br />References are different from reviews, which hosts and guests write after a completed trip.</p>', 'references', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(200) NOT NULL,
  `address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `host_cancellation_penalty`
--

CREATE TABLE `host_cancellation_penalty` (
  `id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `amount` float NOT NULL,
  `currency` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `host_cancellation_policy`
--

CREATE TABLE `host_cancellation_policy` (
  `id` int(1) NOT NULL,
  `days` int(2) NOT NULL,
  `months` int(2) NOT NULL,
  `before_amount` int(100) NOT NULL,
  `after_amount` int(100) NOT NULL,
  `free_cancellation` int(100) NOT NULL,
  `currency` varchar(25) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `host_cancellation_policy`
--

INSERT INTO `host_cancellation_policy` (`id`, `days`, `months`, `before_amount`, `after_amount`, `free_cancellation`, `currency`) VALUES
(1, 7, 6, 50, 100, 1, 'USD');

-- --------------------------------------------------------

--
-- Table structure for table `ical_import`
--

CREATE TABLE `ical_import` (
  `id` int(50) NOT NULL,
  `list_id` int(50) NOT NULL,
  `url` varchar(500) NOT NULL,
  `last_sync` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `joinus`
--

CREATE TABLE `joinus` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `joinus`
--

INSERT INTO `joinus` (`id`, `name`, `url`) VALUES
(1, 'Twitter', 'http://twitter.com/cogzidel'),
(2, 'Facebook', 'https://www.facebook.com/cogzidel'),
(3, 'Google', 'https://plus.google.com/116955559424123283004/about'),
(4, 'Youtube', 'http://www.youtube.com/results?search_query=cogzidel');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `code` varchar(7) NOT NULL,
  `name` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `code`, `name`, `status`) VALUES
(1, 'en', 'English', '1'),
(2, 'fr', 'French', '1'),
(3, 'it', 'Italian', '1'),
(4, 'gr', 'German', '1'),
(5, 'po', 'Portuguese', '1'),
(6, 'sp', 'Spanish', '1');

-- --------------------------------------------------------

--
-- Table structure for table `list`
--

CREATE TABLE `list` (
  `id` bigint(20) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` text CHARACTER SET utf8,
  `country` varchar(50) CHARACTER SET utf8 NOT NULL,
  `street_address` varchar(100) CHARACTER SET utf8 NOT NULL,
  `optional_address` varchar(100) CHARACTER SET utf8 NOT NULL,
  `city` varchar(25) CHARACTER SET utf8 NOT NULL,
  `state` varchar(25) CHARACTER SET utf8 NOT NULL,
  `zip_code` varchar(25) NOT NULL,
  `exact` int(11) NOT NULL,
  `directions` text CHARACTER SET utf8,
  `lat` decimal(18,14) NOT NULL,
  `long` decimal(18,14) NOT NULL,
  `property_id` int(11) NOT NULL,
  `room_type` varchar(50) NOT NULL,
  `bedrooms` int(11) NOT NULL,
  `beds` int(11) NOT NULL,
  `bed_type` varchar(50) NOT NULL,
  `bathrooms` float DEFAULT NULL,
  `amenities` varchar(111) NOT NULL,
  `title` text CHARACTER SET utf8,
  `desc` text CHARACTER SET utf8,
  `space` varchar(500) NOT NULL,
  `guests_info` varchar(500) NOT NULL,
  `interaction` varchar(500) NOT NULL,
  `overview` varchar(500) NOT NULL,
  `getting_around` varchar(500) NOT NULL,
  `othert_thing` varchar(500) NOT NULL,
  `capacity` int(11) NOT NULL,
  `cancellation_policy` int(2) NOT NULL,
  `street_view` smallint(6) NOT NULL,
  `price` int(11) NOT NULL,
  `sublet_price` int(50) NOT NULL,
  `sublet_status` enum('0','1') NOT NULL,
  `sublet_startdate` varchar(150) NOT NULL,
  `sublet_enddate` varchar(150) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `house_rule` text CHARACTER SET utf8 NOT NULL,
  `calendar_type` int(1) NOT NULL,
  `is_enable` tinyint(4) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `list_pay` int(1) NOT NULL DEFAULT '0',
  `payment` int(1) NOT NULL DEFAULT '0',
  `page_viewed` bigint(20) NOT NULL,
  `review` int(11) NOT NULL DEFAULT '0',
  `created` int(31) NOT NULL,
  `neighbor` text CHARACTER SET utf8,
  `is_featured` int(11) NOT NULL DEFAULT '0',
  `video_code` varchar(255) NOT NULL,
  `step_status` varchar(200) NOT NULL,
  `check_status` tinyint(255) NOT NULL,
  `banned` varchar(255) NOT NULL DEFAULT '0',
  `home_type` varchar(25) NOT NULL,
  `instance_book` varchar(100) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `list`
--

INSERT INTO `list` (`id`, `user_id`, `address`, `country`, `street_address`, `optional_address`, `city`, `state`, `zip_code`, `exact`, `directions`, `lat`, `long`, `property_id`, `room_type`, `bedrooms`, `beds`, `bed_type`, `bathrooms`, `amenities`, `title`, `desc`, `space`, `guests_info`, `interaction`, `overview`, `getting_around`, `othert_thing`, `capacity`, `cancellation_policy`, `street_view`, `price`, `sublet_price`, `sublet_status`, `sublet_startdate`, `sublet_enddate`, `currency`, `email`, `phone`, `house_rule`, `calendar_type`, `is_enable`, `status`, `list_pay`, `payment`, `page_viewed`, `review`, `created`, `neighbor`, `is_featured`, `video_code`, `step_status`, `check_status`, `banned`, `home_type`, `instance_book`) VALUES
(1, 1, 'Dunas Altas, El Cipras (Guarnician Militar), Zona 4, 22785 Ensenada Municipality, Baja California, Mexico', 'Mexico', 'Dunas Altas, El Cipras (Guarnician Militar), Zona 4, 22785 Ensenada Municipality, Baja California, M', '', 'Zona', 'Baja California', '264634', 0, NULL, '31.78962130000000', '-116.60434580000003', 6, 'Private room', 1, 1, 'Airbed', 1, '4,7,10,11', 'Modern Rustic Beach House with Pool', 'This unique house is a 3 bedrooms beach house with pool designed by architect Jorge Gracia recently featured in in the architectural books ''''21st Century - 150 of the World''''s Best'''' and ''''Architecture Now - Houses'''', published by TASCHEN.', '', '', '', '', '', '', 1, 1, 0, 250, 0, '0', '', '', 'USD', '', '', '', 1, 1, 1, 1, 0, 16, 0, 1366502043, 'nothing select', 1, '', '', 0, '0', '', ''),
(2, 1, 'Carrera 1C # 162A-2 a 162A-100, Bogota, Cundinamarca, Colombia', 'Colombia', 'Carrera 1C # 162A-2 a 162A-100, Bogota, Cundinamarca, Colombia', '', 'Bogota', 'Cundinamarca', '87684', 0, NULL, '4.73524780000000', '-74.01826100000000', 5, 'Private room', 1, 1, 'None', 0, '2,8,14,18,20', 'New beautiful apartment in Spb', 'New beautiful apartment in the centre of the city in a new house with a balcony overlooking the old area of Sankt Petersburg.', '', '', '', '', '', '', 2, 1, 0, 221, 0, '0', '', '', 'PHP', '', '', '', 1, 1, 1, 1, 0, 6, 0, 1366502043, 'nothing select', 1, '', '', 0, '0', '', ''),
(3, 1, '184, 64606 Palva County, Estonia', 'Estonia', '184, 64606 Palva County, Estonia', '', 'Palva', 'Estonia', '235325', 0, 'NULL', '58.21135870000001', '27.16648880000003', 7, 'Shared room', 1, 0, '', 0, '', 'Sunny Room in Brooklyn', '10 minutes to Williamsburg, 20 minutes to manhattan!\nA sunny private room with a Queen size futon and big closet in a new renovated apartment (this March), with a SHARED bathroom , has Wi-Fi, it''''s on the first floor, so no need to drag your heavy suitcase up down stairs.', '', '', '', '', '', '', 2, 1, 0, 125, 0, '0', '', '', 'EUR', '', '', '', 1, 1, 1, 1, 0, 6, 0, 1366502307, 'nothing select', 1, '', '', 0, '0', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `list_pay`
--

CREATE TABLE `list_pay` (
  `id` int(11) NOT NULL,
  `list_id` int(11) NOT NULL,
  `amount` varchar(25) NOT NULL,
  `currency` varchar(25) NOT NULL,
  `created` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `list_photo`
--

CREATE TABLE `list_photo` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `list_id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `image` bigint(200) NOT NULL,
  `resize` bigint(200) NOT NULL,
  `resize1` bigint(200) NOT NULL,
  `map` bigint(200) NOT NULL,
  `highlights` text NOT NULL,
  `is_featured` tinyint(4) NOT NULL DEFAULT '0',
  `created` int(31) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `list_photo`
--

INSERT INTO `list_photo` (`id`, `user_id`, `list_id`, `name`, `image`, `resize`, `resize1`, `map`, `highlights`, `is_featured`, `created`) VALUES
(33, 0, 1, 'bRaqsah8.jpg', 0, 0, 0, 0, '', 1, 1438892174),
(34, 0, 1, 'TotuyK4x.jpg', 0, 0, 0, 0, '', 0, 1438892174),
(36, 0, 1, 'b6j6BpWF.jpg', 0, 0, 0, 0, '', 0, 1438892302),
(37, 0, 2, '5BMSMxWP.jpg', 0, 0, 0, 0, '', 1, 1438892599),
(38, 0, 3, 'Te2DBmSI.jpg', 0, 0, 0, 0, '', 1, 1438893064);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login_history`
--

CREATE TABLE `login_history` (
  `id` bigint(20) NOT NULL,
  `session_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ip_address` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `user_agent` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `location` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `logout` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_history`
--

INSERT INTO `login_history` (`id`, `session_id`, `ip_address`, `user_agent`, `last_activity`, `location`, `user_id`, `logout`) VALUES
(1, 'b2091f3a73f9b9a11657e82cd2a34eb0', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.3', 1455032458, '', '0', 0),
(2, '891039085163f39b354084c513cc5eaf', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.3', 1455033701, '', '0', 0),
(3, '01788e6f5fbc1f405d489ff638c702ed', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.3', 1455043608, '', '0', 0),
(4, '2c6b50948add274a8f1daceb4619ed75', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.3', 1455083409, '', '0', 0),
(5, '6d9894370971204998a2e29edae8f09f', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.109 Safari/537.3', 1455903908, '', '0', 0),
(6, 'd39f3aadbc6aa1c7bac19c375b652754', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.3', 1456315190, '', '0', 0),
(7, '5936d57740b091ebe5398c8d83c1bc49', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.3', 1456322393, '', '0', 0),
(8, 'b63709e0d8030e6e50fe3d077562c8cb', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.3', 1456326908, '', '0', 0),
(9, '714512ef924ce288344b707e7bde9c62', '0.0.0.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', 1458360037, '', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `lys_status`
--

CREATE TABLE `lys_status` (
  `id` int(5) NOT NULL,
  `user_id` int(3) NOT NULL,
  `calendar` int(1) NOT NULL DEFAULT '0',
  `price` int(1) NOT NULL DEFAULT '0',
  `overview` int(1) NOT NULL DEFAULT '0',
  `title` int(1) NOT NULL,
  `summary` int(1) NOT NULL,
  `photo` int(1) NOT NULL DEFAULT '0',
  `amenities` int(1) NOT NULL DEFAULT '0',
  `address` int(1) NOT NULL DEFAULT '0',
  `listing` int(1) NOT NULL DEFAULT '0',
  `beds` int(1) NOT NULL,
  `bathrooms` int(1) NOT NULL,
  `bedscount` int(1) NOT NULL,
  `bedtype` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lys_status`
--

INSERT INTO `lys_status` (`id`, `user_id`, `calendar`, `price`, `overview`, `title`, `summary`, `photo`, `amenities`, `address`, `listing`, `beds`, `bathrooms`, `bedscount`, `bedtype`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `map_photo`
--

CREATE TABLE `map_photo` (
  `user_id` int(255) NOT NULL,
  `list_id` bigint(100) NOT NULL,
  `id` bigint(100) NOT NULL,
  `map` varchar(500) NOT NULL,
  `created` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `message_type`
--

CREATE TABLE `message_type` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `url` varchar(30) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message_type`
--

INSERT INTO `message_type` (`id`, `name`, `url`) VALUES
(1, 'Reservation Request', 'trips/request'),
(2, 'Conversation', 'trips/conversation'),
(3, 'Message', 'trips/conversation'),
(4, 'Review Request', 'trips/review_by_host'),
(5, 'Review Request', 'trips/review_by_traveller'),
(6, 'Inquiry', 'trips/conversation'),
(7, 'Contacts Request', 'contacts/request'),
(8, 'Contacts Response', 'contacts/response'),
(9, 'Referrals', 'trips/conversation'),
(10, 'List Creation', 'trips/conversation');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL,
  `list_id` bigint(20) unsigned NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL DEFAULT '0',
  `userby` int(11) NOT NULL,
  `userto` int(11) NOT NULL,
  `subject` varchar(70) NOT NULL,
  `message` text CHARACTER SET utf8 NOT NULL,
  `created` int(31) NOT NULL,
  `is_read` tinyint(4) NOT NULL DEFAULT '0',
  `is_starred` tinyint(4) NOT NULL,
  `is_respond` int(1) NOT NULL,
  `is_archived` int(1) NOT NULL,
  `message_type` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `metas`
--

CREATE TABLE `metas` (
  `id` int(11) NOT NULL,
  `url` varchar(111) NOT NULL,
  `name` varchar(300) NOT NULL,
  `title` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metas`
--

INSERT INTO `metas` (`id`, `url`, `name`, `title`, `meta_description`, `meta_keyword`) VALUES
(1, 'account/index', 'Edit_account_details', 'Edit account details', 'Edit account details', 'Edit account details'),
(2, 'account/payout', 'Your_Payment_Method_details', 'Your Payment Method details', 'Your Payment Method details', 'Your Payment Method details'),
(3, 'account/setDefault', 'Set_Default_Payout_Preferences', 'Set Default Payout Preferences', 'Set Default Payout Preferences', 'Set Default Payout Preferences'),
(4, 'account/transaction', 'Your_Transaction_Details', 'Your Transaction Details', 'Your Transaction Details', 'Your Transaction Details'),
(5, 'calendar/single', 'Calendar', 'Calendar', 'Calendar', 'Calendar'),
(6, 'home/dashboard', 'Dashboard', 'Dashboard', 'Dashboard', 'Dashboard'),
(7, 'hosting/index', 'Your_Hosting_data', 'Your Listings', 'Your Listings', 'Your Listings'),
(8, 'hosting/change_status', 'Manage_Listings', 'Manage Listings', 'Manage Listings', 'Manage Listings'),
(9, 'hosting/sort_by_status', 'Manage Listings', 'Manage Listings', 'Manage Listings', 'Manage Listings'),
(10, 'hosting/my_reservation', 'My_Reservations', 'My Reservations', 'My Reservations', 'My Reservations'),
(11, 'hosting/policies', 'Stand_Bys', 'Policies', 'Policies', 'Policies'),
(12, 'info/index', 'Access_Deny', 'Access Deny', 'Access Deny', 'Access Deny'),
(13, 'info/deny', 'Access_Deny', 'Access Deny', 'Access Deny', 'Access Deny'),
(14, 'info/how_it_works', 'How it works', 'How it works', 'How it works', 'How it works'),
(15, 'listpay/index', 'Payment_Option', 'Payment Option', 'Payment Option', 'Payment Option'),
(16, 'message/inbox', 'Inbox', 'Inbox', 'Inbox', 'Inbox'),
(17, 'pages/contact', 'Contact_Us', 'Contact Us', 'Contact Us', 'Contact Us'),
(18, 'pages/faq', 'FAQs', 'FAQs', 'FAQs', 'FAQs'),
(19, 'payments/form', 'Confirm_your_booking', 'Confirm your booking', 'Confirm your booking', 'Confirm your booking'),
(20, 'referrals/index', 'Invite_Your_Friends', 'Invite Your Friends', 'Invite Your Friends', 'Invite Your Friends'),
(21, 'referrals/email', 'Invite_Your_Friends -Email', 'Invite Your Friends - Email', 'Invite Your Friends - Email', 'Invite Your Friends - Email'),
(22, 'referrals/tell_a_friend', 'Tell_A_Friend', 'Tell A Friend', 'Tell A Friend', 'Tell A Friend'),
(23, 'rooms/index', 'Rooms', 'Rooms', 'Rooms', 'Rooms'),
(24, 'rooms/newlist', 'List_Your_property', 'List your property', 'List your property', 'List your property'),
(25, 'rooms/edit', 'Edit_your_Listing', 'Edit your Listing', 'Edit your Listing', 'Edit your Listing'),
(26, 'rooms/edit_photo', 'Add_photo_for_this_listing', 'Add photo for this listing', 'Add photo for this listing', 'Add photo for this listing'),
(27, 'rooms/edit_price', 'Edit_the_price_information_for_your_site', 'Edit price', 'Edit price', 'Edit price'),
(28, 'rooms/change_status', 'Manage_Listings', 'Manage Listings', 'Manage Listings', 'Manage Listings'),
(29, 'search/index', 'Search_Elements', 'Search Elements', 'Search Elements', 'Search Elements'),
(30, 'travelling/current_trip', 'Your_Current_Trips', 'Your Current Trips', 'Your Current Trips', 'Your Current Trips'),
(31, 'travelling/your_trips', 'Your_trips', 'Your Trips', 'Your Trips', 'Your Trips'),
(32, 'travelling/previous_trips', 'Your_Previous_Trips_Trips', 'Your Previous Trips', 'Your Previous Trips', 'Your Previous Trips'),
(33, 'travelling/starred_items', 'List_your_stared_Item', 'List your starred Items', 'List your starred Items', 'List your starred Items'),
(34, 'travelling/host_details', 'Host_Details', 'Host Details', 'Host Details', 'Host Details'),
(35, 'travelling/billing', 'Reservation_Request', 'Reservation Request', 'Reservation Request', 'Reservation Request'),
(36, 'trips/request', 'Reservation_Request', 'Reservation Request', 'Reservation Request', 'Reservation Request'),
(37, 'trips/conversation', 'Conversations', 'Conversations', 'Conversations', 'Conversations'),
(38, 'trips/review_by_host', 'Review', 'Review', 'Review', 'Review'),
(39, 'trips/review_by_traveller', 'Review', 'Review', 'Review', 'Review'),
(40, 'host_review', 'View_Your_Review', 'View Your Review', 'View Your Review', 'View Your Review'),
(41, 'trips/traveler_review', 'View_your_review', 'View your review', 'View your review', 'View your review'),
(42, 'users/edit', 'Edit_your_Profile', 'Edit your Profile', 'Edit your Profile', 'Edit your Profile'),
(43, 'users/references', 'Your_recommendation_details', 'References details', 'References details', 'References details'),
(44, 'users/reviews', 'Your_Reviews_and_Recommendation', 'Your Reviews', 'Your Reviews', 'Your Reviews'),
(45, 'users/vouch', 'Recommend_your_friends', 'Recommend your friends', 'Recommend your friends', 'Recommend your friends'),
(46, 'users/signup', 'Sign_Up_for_the_site', 'Sign Up for the site', 'Sign Up for the site', 'Sign Up for the site'),
(47, 'users/signin', 'Sign_In / Sign_Up', 'Sign In / Sign Up', 'Sign In / Sign up', 'Sign In / Sign up'),
(48, 'uers/login', 'Sign_In / Sign_up', 'Sign In / Sign up', 'Sign In / Sign up', 'Sign In / Sign up'),
(49, 'users/logout', 'Logout_Shortly', 'Logout Shortly', 'Logout Shortly', 'Logout Shortly'),
(50, 'users/change_password', 'Change_Password', 'Change Password', 'Change Password', 'Change Password'),
(51, 'pages/cancellation_policy', 'cancellation_policy', 'Cancellation Policy', 'Cancellation Policy', 'Cancellation Policy'),
(52, 'account/mywishlist', 'My Wishlist', 'My Wishlist', 'My Wishlist', 'My Wishlist'),
(53, 'home/popular', 'Popular', 'Popular', 'Popular', 'Popular'),
(54, 'home/friends', 'Friends', 'Friends', 'Friends', 'Friends'),
(55, 'home/neighborhoods', 'Neighborhoods', 'Neighborhoods', 'Neighborhoods', 'Neighborhoods'),
(56, 'home/help', 'Help', 'Help', 'Help', 'Help'),
(57, 'users/verify', 'Verification', 'Verification', 'Verification', 'Verification'),
(58, 'home/verify', 'Verify', 'Verify', 'Verify', 'Verify'),
(59, 'neighbourhoods/detail_place', 'Neighbourhoods', 'Neighbourhoods', 'Neighbourhoods', 'Neighbourhoods'),
(60, 'neighbourhoods/city_places', 'Neighbourhoods', 'Neighbourhoods', 'Neighbourhoods', 'Neighbourhoods'),
(61, 'neighbourhoods/city', 'Neighbourhoods', 'Neighbourhoods', 'Neighbourhoods', 'Neighbourhoods'),
(62, 'users/view_fb_popup', 'Facebook Signup', 'Facebook Signup', 'Facebook Signup', 'Facebook Signup'),
(63, 'contacts/request', 'Contact_Request', 'Contact Request', 'Contact Request', 'Contact Request'),
(64, 'statistics/view_statistics_graph', 'Statistics', 'Statistics', 'Statistics', 'Statistics'),
(65, 'account/security', 'Security', 'Security', 'Security', 'Security'),
(66, 'account/setting', 'Setting', 'Setting', 'Setting', 'Setting');

-- --------------------------------------------------------

--
-- Table structure for table `neigh_category`
--

CREATE TABLE `neigh_category` (
  `id` int(3) NOT NULL,
  `category` varchar(100) NOT NULL,
  `created` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `neigh_category`
--

INSERT INTO `neigh_category` (`id`, `category`, `created`) VALUES
(1, 'Great Transit', '1381458120'),
(2, 'Touristy', '1381458133'),
(3, 'Shopping', '1381458148'),
(4, 'Loved by Londoners', '1381458168');

-- --------------------------------------------------------

--
-- Table structure for table `neigh_city`
--

CREATE TABLE `neigh_city` (
  `id` int(3) NOT NULL,
  `city_name` varchar(100) NOT NULL,
  `city_desc` text NOT NULL,
  `around` text NOT NULL,
  `known` text NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `is_home` int(1) NOT NULL DEFAULT '0',
  `created` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `neigh_city`
--

INSERT INTO `neigh_city` (`id`, `city_name`, `city_desc`, `around`, `known`, `image_name`, `is_home`, `created`) VALUES
(1, 'London', 'Relentlessly enterprising and culturally diverse, all eyes are on London when this influential city takes the stage.', 'Public Transit', 'Pub culture, tea culture, the royal family, Big Ben, Shakespeare, wry humor, theatre, fashion and finance, fish and chips, Tate Modern, the Tube', 'London.jpg', 1, '1388864301');

-- --------------------------------------------------------

--
-- Table structure for table `neigh_city_place`
--

CREATE TABLE `neigh_city_place` (
  `id` int(4) NOT NULL,
  `city_id` int(4) NOT NULL,
  `city_name` varchar(100) NOT NULL,
  `place_name` varchar(100) NOT NULL,
  `quote` text NOT NULL,
  `short_desc` text NOT NULL,
  `long_desc` text NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `lat` varchar(25) NOT NULL,
  `lng` varchar(25) NOT NULL,
  `is_featured` int(1) NOT NULL,
  `created` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `neigh_city_place`
--

INSERT INTO `neigh_city_place` (`id`, `city_id`, `city_name`, `place_name`, `quote`, `short_desc`, `long_desc`, `image_name`, `lat`, `lng`, `is_featured`, `created`) VALUES
(1, 1, 'London', 'Westminster', 'Prove you''re in London with pictures in Westminster.', 'History is etched into the stones that compose this neighborhood''s famous clock tower, abbey, and parliament buildings.', 'Boasting more than a few London landmarks, Westminster is a distinct political and cultural epicenter. Westminster Abbey, Buckingham Palace (God Save the Queen), and the United KingdomÃ¢â‚¬â„¢s House of Parliament all share the cobblestoned lanes under Big BenÃ¢â‚¬â„¢s timely shadow. Perched along the north bank', '0_5616_651_3093_hero_UK_London_King_s_Cross_RD__2.jpg', '51.5096446', '-0.1585863', 1, '1381458492');

-- --------------------------------------------------------

--
-- Table structure for table `neigh_knowledge`
--

CREATE TABLE `neigh_knowledge` (
  `id` int(5) NOT NULL,
  `post_id` int(3) NOT NULL,
  `city_id` int(5) NOT NULL,
  `city` varchar(25) NOT NULL,
  `place_id` int(5) NOT NULL,
  `place` varchar(25) NOT NULL,
  `user_id` int(5) NOT NULL,
  `user_type` varchar(25) NOT NULL DEFAULT 'Guest',
  `room_id` int(5) NOT NULL,
  `room_title` text NOT NULL,
  `knowledge` text NOT NULL,
  `shown` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `neigh_knowledge`
--

INSERT INTO `neigh_knowledge` (`id`, `post_id`, `city_id`, `city`, `place_id`, `place`, `user_id`, `user_type`, `room_id`, `room_title`, `knowledge`, `shown`) VALUES
(1, 1, 1, 'London', 1, 'Westminster', 1, 'Guest', 0, '', 'We would definitely recommend this [neighbourhood] to anyone who wants to be centrally located and use the flat as a base to enjoy this vibrant city and all it has to offer', 1);

-- --------------------------------------------------------

--
-- Table structure for table `neigh_photographer`
--

CREATE TABLE `neigh_photographer` (
  `id` int(3) NOT NULL,
  `city` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `photographer_name` text NOT NULL,
  `photographer_desc` text NOT NULL,
  `photographer_image` varchar(100) NOT NULL,
  `photographer_web` varchar(50) NOT NULL,
  `city_id` varchar(3) NOT NULL,
  `is_featured` varchar(1) NOT NULL,
  `created` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `neigh_photographer`
--

INSERT INTO `neigh_photographer` (`id`, `city`, `place`, `photographer_name`, `photographer_desc`, `photographer_image`, `photographer_web`, `city_id`, `is_featured`, `created`) VALUES
(1, 'London', 'Westminster', 'Duke', 'Rebecca Duke has been working as a photographer for the last decade, after attending Central St Martinâ€™s in London. Her work focuses on people, interiors and travel and has been published in The Sunday Times, Elle Decor and Conde Nast Traveller. Rebecca travels frequently for her work but loved work', 'no_avatar-xlarge.jpg', 'No Website', '1', '1', '1381460489');

-- --------------------------------------------------------

--
-- Table structure for table `neigh_place_category`
--

CREATE TABLE `neigh_place_category` (
  `id` int(5) NOT NULL,
  `city` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `category_id` int(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `neigh_place_category`
--

INSERT INTO `neigh_place_category` (`id`, `city`, `place`, `category_id`) VALUES
(5, 'London', 'Westminster', 1),
(6, 'London', 'Westminster', 2),
(7, 'London', 'Westminster', 3),
(8, 'London', 'Westminster', 4),
(9, 'Tokyo', 'Akihabara', 1),
(10, 'Tokyo', 'Akihabara', 2),
(11, 'Tokyo', 'Akihabara', 3),
(12, 'Tokyo', 'Akihabara', 4),
(13, 'Mexico City', 'Mexico City', 1);

-- --------------------------------------------------------

--
-- Table structure for table `neigh_post`
--

CREATE TABLE `neigh_post` (
  `id` int(3) NOT NULL,
  `city` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `image_title` text NOT NULL,
  `image_desc` text NOT NULL,
  `big_image1` varchar(100) NOT NULL,
  `small_image1` varchar(100) NOT NULL,
  `small_image2` varchar(100) NOT NULL,
  `small_image3` varchar(100) NOT NULL,
  `small_image4` varchar(100) NOT NULL,
  `small_image5` varchar(100) NOT NULL,
  `big_image2` varchar(100) NOT NULL,
  `big_image3` varchar(100) NOT NULL,
  `is_featured` int(1) NOT NULL,
  `created` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `neigh_post`
--

INSERT INTO `neigh_post` (`id`, `city`, `place`, `image_title`, `image_desc`, `big_image1`, `small_image1`, `small_image2`, `small_image3`, `small_image4`, `small_image5`, `big_image2`, `big_image3`, `is_featured`, `created`) VALUES
(1, 'London', 'Westminster', 'Britain''s VIPs: Very Important People and Places', 'Westminster''s regal appeal stems from more than old stones and gold-gilded gates.', '0_5760_0_3840_one_UK_London_King_s_Cross_RD__6.jpg', '0_5760_115_3725_two_UK_London_King_s_Cross_RD__7.jpg', '0_5760_115_3725_two_UK_London_King_s_Cross_RD__18.jpg', '765_4995_0_3840_three_UK_London_King_s_Cross_RD__11.jpg', '765_4995_0_3840_three_UK_London_King_s_Cross_RD__13.jpg', '765_4995_0_3840_three_UK_London_King_s_Cross_RD__9.jpg', '0_5760_115_3725_two_UK_London_King_s_Cross_RD__22.jpg', '0_5760_115_3725_two_UK_London_King_s_Cross_RD__25.jpg', 1, '1381458967');

-- --------------------------------------------------------

--
-- Table structure for table `neigh_tag`
--

CREATE TABLE `neigh_tag` (
  `id` int(5) NOT NULL,
  `city_id` int(5) NOT NULL,
  `city` varchar(25) NOT NULL,
  `place_id` int(5) NOT NULL,
  `place` varchar(25) NOT NULL,
  `user_id` int(5) NOT NULL,
  `tag` varchar(25) NOT NULL,
  `shown` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `neighbor_area`
--

CREATE TABLE `neighbor_area` (
  `id` int(50) NOT NULL,
  `city_id` int(50) NOT NULL,
  `area` varchar(80) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `neighbor_city`
--

CREATE TABLE `neighbor_city` (
  `id` int(50) NOT NULL,
  `Country` varchar(80) NOT NULL,
  `State` varchar(80) NOT NULL,
  `City` varchar(80) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(111) NOT NULL,
  `page_name` varchar(111) NOT NULL,
  `page_title` varchar(111) NOT NULL,
  `page_url` varchar(111) NOT NULL,
  `is_footer` tinyint(4) NOT NULL,
  `is_under` varchar(25) NOT NULL,
  `page_content` text NOT NULL,
  `created` int(31) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `page_name`, `page_title`, `page_url`, `is_footer`, `is_under`, `page_content`, `created`) VALUES
(13, 'Help', 'Help', 'help', 0, '', '<div id="View_help" class="inner_pad_top">\n<ul>\n  		<li><a href="#"> Need help on this page? </a></li>\n  		<li><a href="#">Getting Started Guide</a></li>\n  		<li><a href="#">How do I sign up?</a></li>\n  		<li><a href="#">How do I host on Dropinn?</a></li>\n  		<li><a href="#">How do I travel on Dropinn?</a></li>\n  		<li><a href="#">Visit our Trust & Safety Center </a></li>\n  		<li><a href="#">See all FAQs</a></li>\n  		\n  	</ul>\n</div>', 1323793245),
(12, 'Travel', 'Travel', 'travel', 0, '', '<div class="inner_header"><h2>Travel</h2></div><h4>Aliquam vitae congue tortor</h4>\r\n<p>Praesent in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent dui nibh, placerat id placerat nec, facilisis vitae lorem.Ut at ante non quam posuere sollicitudin. Sed vel libero tellus. Nam aliquam dolor vitae risus lacinia tristique.</p>\r\n\r\n<h3>Nam aliquam dolor</h3>\r\n<p> Sed vitae nibh et felis ornare accum. tiam tristique ornare erat et facilisis. Etiam pretium, massa ut commodo viverra, nunc magna vestibulum risus, a imperdiet quam leo ac mi.</p>\r\n\r\n<p>Nam eget nisl feugiat augue egestas tempus at fermentum tellus. Vestibulum vel orci ante, sed auctor mauris. Nulla a odio id nunc lobortis venenatis. Sed vestibulum elit at urna tincidunt pellentesque. Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</p>\r\n\r\n<p>Nulla mauris tellus, aliquam rutrum consectetur eu, pulvinar sit amet est. Integer sodales vulputate arcu eget dictum. Suspendisse nibh dolor, vestibulum a euismod nec, tristique ac quam. Aliquam vitae dolor justo, non aliquet nisl. Maecenas accumsan convallis mattis.</p>\r\n<div class="inner_terms">\r\n<ul>\r\n   <li><a href="#">Ut rhoncus imperdiet augue sit amet egestas</a></li>\r\n<li><a href="#">Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper</a></li>\r\n<li><a href="#">Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel</a></li>\r\n<li><a href="#">Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit.</a></li>\r\n<li><a href="#">Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio.</a></li>\r\n<li><a href="#">Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat.</a></li>\r\n<li><a href="#">Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</a></li>\r\n<li><a href="#">Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</a></li>\r\n</ul>\r\n</div>\r\n<h3>Phasellus sem</h3>\r\n\r\n<p>Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius.</p>\r\n\r\n<p>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel turpis et lacus fermentum congue. Integer fringilla euismod dui, id vehicula ut. Pellentesque placerat dictum diam sit amet porta.</p>\r\n\r\n<h3>Nunc porttitor sagittis</h3>\r\n\r\n<p>Aliquam vitae congue tortor. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio. Ut elementum ante quis urna auctor sagittis. Nunc porttitor sagittis condimentum. Nullam laoreet elit quis quam lobortis aliquet. Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros.</p>\r\n\r\n<p>Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio.</p>\r\n\r\n<p>Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius.</p>\r\n\r\n<p>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel turpis et lacus fermentum congue. Integer fringilla euismod dui, id vehicula ut. Pellentesque placerat dictum diam sit amet porta.</p>\r\n\r\n\r\n<p>Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio.</p>\r\n<div class="inner_terms">\r\n<ul>\r\n   <li><a href="#">Ut rhoncus imperdiet augue sit amet egestas</a></li>\r\n<li><a href="#">Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper</a></li>\r\n<li><a href="#">Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel</a></li>\r\n<li><a href="#">Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit.</a></li>\r\n<li><a href="#">Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio.</a></li>\r\n<li><a href="#">Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat.</a></li>\r\n<li><a href="#">Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</a></li>\r\n<li><a href="#">Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</a></li>\r\n</ul>\r\n</div>\r\n\r\n<h3>Nam aliquam dolor</h3>\r\n<p> Sed vitae nibh et felis ornare accum. tiam tristique ornare erat et facilisis. Etiam pretium, massa ut commodo viverra, nunc magna vestibulum risus, a imperdiet quam leo ac mi.</p>\r\n\r\n<p>Nam eget nisl feugiat augue egestas tempus at fermentum tellus. Vestibulum vel orci ante, sed auctor mauris. Nulla a odio id nunc lobortis venenatis. Sed vestibulum elit at urna tincidunt pellentesque. Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</p>\r\n\r\n<p>Nulla mauris tellus, aliquam rutrum consectetur eu, pulvinar sit amet est. Integer sodales vulputate arcu eget dictum. Suspendisse nibh dolor, vestibulum a euismod nec, tristique ac quam. Aliquam vitae dolor justo, non aliquet nisl. Maecenas accumsan convallis mattis.</p>', 1323793245),
(11, 'Social Connections', 'Social Connections', 'social', 1, 'discover', '<div class="inner_header"><h2>Social Connections</h2></div><h3>Nam aliquam dolor?</h3>\r\n<p> Sed vitae nibh et felis ornare accum. tiam tristique ornare erat et facilisis. Etiam pretium, massa ut commodo viverra, nunc magna vestibulum risus, a imperdiet quam leo ac mi.</p>\r\n\r\n<p>Nam eget nisl feugiat augue egestas tempus at fermentum tellus. Vestibulum vel orci ante, sed auctor mauris. Nulla a odio id nunc lobortis venenatis. Sed vestibulum elit at urna tincidunt pellentesque. Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</p>\r\n\r\n<p>Nulla mauris tellus, aliquam rutrum consectetur eu, pulvinar sit amet est. Integer sodales vulputate arcu eget dictum. Suspendisse nibh dolor, vestibulum a euismod nec, tristique ac quam. Aliquam vitae dolor justo, non aliquet nisl. Maecenas accumsan convallis mattis.</p>\r\n\r\n<h3>Phasellus sem?</h3>\r\n\r\n<p>Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius.</p>\r\n\r\n<p>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel turpis et lacus fermentum congue. Integer fringilla euismod dui, id vehicula ut. Pellentesque placerat dictum diam sit amet porta.</p>\r\n\r\n<h3>Nunc porttitor sagittis?</h3>\r\n\r\n<p>Aliquam vitae congue tortor. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio. Ut elementum ante quis urna auctor sagittis. Nunc porttitor sagittis condimentum. Nullam laoreet elit quis quam lobortis aliquet. Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros.</p>\r\n<h3>Donec gravida nulla non ante semper fringilla in ante justo?</h3>\r\n<p>Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio.</p>\r\n<h3>Aliquam gravida nisl non libero ullamcorper placerat sed nisl lacus?</h3>\r\n<p>Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius.</p>\r\n<h3>Nunc porttitor sagittis?</h3>\r\n<p>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel turpis et lacus fermentum congue. Integer fringilla euismod dui, id vehicula ut. Pellentesque placerat dictum diam sit amet porta.</p>\r\n\r\n<h3>Nunc porttitor sagittis?</h3>\r\n<p>Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio.</p>', 1323793245),
(10, 'Responsible Hosting', 'Responsible Hosting', 'responsible_hosting', 1, 'company', '<div class="inner_header"><h2>Responsible Hosting</h2></div><h4>Aliquam vitae congue tortor</h4>\n<p>Praesent in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent dui nibh, placerat id placerat nec, facilisis vitae lorem.Ut at ante non quam posuere sollicitudin. Sed vel libero tellus. Nam aliquam dolor vitae risus lacinia tristique.</p>\n\n<h4>Integer velit nunc faucibus idmollir</h4>\n<div class="inner_terms">\n<ul>\n   <li>Ut rhoncus imperdiet augue sit amet egestas</li>\n<li>Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper</li>\n<li>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel</li>\n<li>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit.</li>\n<li>Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio.</li>\n<li>Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat.</li>\n<li>Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</li>\n<li>Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</li>\n</ul>\n</div>\n\n<h4>Aliquam gravida nisl non libero ullamcorper placerat</h4>\n\n<div class="inner_terms">\n<ul>\n  <li>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel</li>\n<li>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit.</li>\n<li>Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio.</li>\n<li>Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat.</li>\n<li>Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</li>\n<li>Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</li>\n</ul>\n</div>\n\n\n<h4>Nam eget nisl feugiat augue egestas</h4>\n<div class="inner_terms">\n<ul>\n<li>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel</li>\n<li>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit.</li>\n<li>Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio.</li>\n<li>Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat.</li>\n<li>Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</li>\n<li>Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio.</li>\n<li>Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat.</li>\n<li>Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</li>\n\n</div>', 1323793245),
(9, 'Terms & Privacy', 'Terms & Privacy', 'terms', 1, 'company', '<div class="inner_header"><h2>Terms & Privacy</h2></div><h4>Aliquam vitae congue tortor</h4>\n<p>Praesent in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent dui nibh, placerat id placerat nec, facilisis vitae lorem.Ut at ante non quam posuere sollicitudin. Sed vel libero tellus. Nam aliquam dolor vitae risus lacinia tristique.</p>\n\n<h3>Nam aliquam dolor</h3>\n<p> Sed vitae nibh et felis ornare accum. tiam tristique ornare erat et facilisis. Etiam pretium, massa ut commodo viverra, nunc magna vestibulum risus, a imperdiet quam leo ac mi.</p>\n\n<p>Nam eget nisl feugiat augue egestas tempus at fermentum tellus. Vestibulum vel orci ante, sed auctor mauris. Nulla a odio id nunc lobortis venenatis. Sed vestibulum elit at urna tincidunt pellentesque. Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</p>\n\n<p>Nulla mauris tellus, aliquam rutrum consectetur eu, pulvinar sit amet est. Integer sodales vulputate arcu eget dictum. Suspendisse nibh dolor, vestibulum a euismod nec, tristique ac quam. Aliquam vitae dolor justo, non aliquet nisl. Maecenas accumsan convallis mattis.</p>\n\n<h3>Phasellus sem</h3>\n\n<p>Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius.</p>\n\n<p>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel turpis et lacus fermentum congue. Integer fringilla euismod dui, id vehicula ut. Pellentesque placerat dictum diam sit amet porta.</p>\n\n<h3>Nunc porttitor sagittis</h3>\n\n<p>Aliquam vitae congue tortor. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio. Ut elementum ante quis urna auctor sagittis. Nunc porttitor sagittis condimentum. Nullam laoreet elit quis quam lobortis aliquet. Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros.</p>\n\n<p>Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio.</p>\n\n<p>Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius.</p>\n\n<p>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel turpis et lacus fermentum congue. Integer fringilla euismod dui, id vehicula ut. Pellentesque placerat dictum diam sit amet porta.</p>\n\n\n<p>Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio.</p>\n<div class="inner_terms">\n<ul>\n   <li>Ut rhoncus imperdiet augue sit amet egestas</li>\n<li>Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper</li>\n<li>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel</li>\n<li>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit.</li>\n<li>Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio.</li>\n<li>Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat.</li>\n<li>Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</li>\n<li>Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</li>\n</ul>\n</div>\n\n', 1323793245),
(8, 'Policies', 'Policies', 'policies', 1, 'company', '<div class="inner_header"><h2>Policies</h2></div><h4>Aliquam vitae congue tortor</h4>\n<p>Praesent in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent dui nibh, placerat id placerat nec, facilisis vitae lorem.Ut at ante non quam posuere sollicitudin. Sed vel libero tellus. Nam aliquam dolor vitae risus lacinia tristique.</p>\n\n<h3>Nam aliquam dolor</h3>\n<p> Sed vitae nibh et felis ornare accum. tiam tristique ornare erat et facilisis. Etiam pretium, massa ut commodo viverra, nunc magna vestibulum risus, a imperdiet quam leo ac mi.</p>\n\n\n<div class="inner_terms">\n<ul>\n   <li>Ut rhoncus imperdiet augue sit amet egestas</li>\n<li>Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper</li>\n<li>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel</li>\n<li>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit.</li>\n<li>Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio.</li>\n<li>Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat.</li>\n<li>Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</li>\n<li>Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</li>\n</ul>\n</div>\n\n<p>Nam eget nisl feugiat augue egestas tempus at fermentum tellus. Vestibulum vel orci ante, sed auctor mauris. Nulla a odio id nunc lobortis venenatis. Sed vestibulum elit at urna tincidunt pellentesque. Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</p>\n\n<p>Nulla mauris tellus, aliquam rutrum consectetur eu, pulvinar sit amet est. Integer sodales vulputate arcu eget dictum. Suspendisse nibh dolor, vestibulum a euismod nec, tristique ac quam. Aliquam vitae dolor justo, non aliquet nisl. Maecenas accumsan convallis mattis.</p>\n<div class="inner_terms">\n<ul>\n  <li>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel</li>\n<li>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit.</li>\n<li>Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio.</li>\n<li>Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat.</li>\n<li>Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</li>\n<li>Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</li>\n</ul>\n</div>\n<h3>Phasellus sem</h3>\n\n<p>Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius.</p>\n\n<p>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel turpis et lacus fermentum congue. Integer fringilla euismod dui, id vehicula ut. Pellentesque placerat dictum diam sit amet porta.</p>\n\n<h3>Nunc porttitor sagittis</h3>\n\n<p>Aliquam vitae congue tortor. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio. Ut elementum ante quis urna auctor sagittis. Nunc porttitor sagittis condimentum. Nullam laoreet elit quis quam lobortis aliquet. Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros.</p>\n\n<p>Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio.</p>\n\n<p>Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius.</p>\n\n<p>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel turpis et lacus fermentum congue. Integer fringilla euismod dui, id vehicula ut. Pellentesque placerat dictum diam sit amet porta.</p>\n\n\n<p>Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio.</p>\n<div class="inner_terms">\n<ul>\n   <li>Ut rhoncus imperdiet augue sit amet egestas</li>\n<li>Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper</li>\n<li>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel</li>\n<li>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit.</li>\n<li>Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio.</li>\n<li>Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat.</li>\n<li>Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</li>\n<li>Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</li>\n</ul>\n</div>\n', 1323793245),
(6, 'About Us', 'About Us', 'about', 1, 'company', '<div class="inner_header"><h2>About Us</h2></div><p>Praesent in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent dui nibh, placerat id placerat nec, facilisis vitae lorem.Ut at ante non quam posuere sollicitudin. Sed vel libero tellus. Nam aliquam dolor vitae risus lacinia tristique. Sed vitae nibh et felis ornare accum. tiam tristique ornare erat et facilisis. Etiam pretium, massa ut commodo viverra, nunc magna vestibulum risus, a imperdiet quam leo ac mi.</p>\n<p>Nam eget nisl feugiat augue egestas tempus at fermentum tellus. Vestibulum vel orci ante, sed auctor mauris. Nulla a odio id nunc lobortis venenatis. Sed vestibulum elit at urna tincidunt pellentesque. Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</p>\n<p>Nulla mauris tellus, aliquam rutrum consectetur eu, pulvinar sit amet est. Integer sodales vulputate arcu eget dictum. Suspendisse nibh dolor, vestibulum a euismod nec, tristique ac quam. Aliquam vitae dolor justo, non aliquet nisl. Maecenas accumsan convallis mattis.</p>\n<p>Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius.</p>\n<p>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel turpis et lacus fermentum congue. Integer fringilla euismod dui, id vehicula ut. Pellentesque placerat dictum diam sit amet porta.</p>\n<p>Aliquam vitae congue tortor. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio. Ut elementum ante quis urna auctor sagittis. Nunc porttitor sagittis condimentum. Nullam laoreet elit quis quam lobortis aliquet. Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros.</p>\n<p>Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio.</p>', 1323793245),
(7, 'Press', 'Press', 'press', 1, 'company', '<div class="inner_header"><h2>Press</h2></div><h4>Aliquam vitae congue tortor</h4>\n<p>Praesent in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent dui nibh, placerat id placerat nec, facilisis vitae lorem.Ut at ante non quam posuere sollicitudin. Sed vel libero tellus. Nam aliquam dolor vitae risus lacinia tristique.</p>\n\n<h3>Nam aliquam dolor</h3>\n<p> Sed vitae nibh et felis ornare accum. tiam tristique ornare erat et facilisis. Etiam pretium, massa ut commodo viverra, nunc magna vestibulum risus, a imperdiet quam leo ac mi.</p>\n\n<p>Nam eget nisl feugiat augue egestas tempus at fermentum tellus. Vestibulum vel orci ante, sed auctor mauris. Nulla a odio id nunc lobortis venenatis. Sed vestibulum elit at urna tincidunt pellentesque. Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</p>\n\n<p>Nulla mauris tellus, aliquam rutrum consectetur eu, pulvinar sit amet est. Integer sodales vulputate arcu eget dictum. Suspendisse nibh dolor, vestibulum a euismod nec, tristique ac quam. Aliquam vitae dolor justo, non aliquet nisl. Maecenas accumsan convallis mattis.</p>\n<div class="inner_terms">\n<ul>\n   <li>Ut rhoncus imperdiet augue sit amet egestas</li>\r\n<li>Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper</li>\r\n<li>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel</li>\r\n<li>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit.</li>\r\n<li>Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio.</li>\r\n<li>Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat.</li><li>Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</li>\r\n<li>Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</li>\n</ul>\n</div>\n<h3>Phasellus sem</h3>\n\n<p>Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius.</p>\n\n<p>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel turpis et lacus fermentum congue. Integer fringilla euismod dui, id vehicula ut. Pellentesque placerat dictum diam sit amet porta.</p>\n\n<h3>Nunc porttitor sagittis</h3>\n\n<p>Aliquam vitae congue tortor. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio. Ut elementum ante quis urna auctor sagittis. Nunc porttitor sagittis condimentum. Nullam laoreet elit quis quam lobortis aliquet. Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros.</p>\n\n<p>Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio.</p>\n\n<p>Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius.</p>\n\n<p>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel turpis et lacus fermentum congue. Integer fringilla euismod dui, id vehicula ut. Pellentesque placerat dictum diam sit amet porta.</p>\n\n\n<p>Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio.</p>\n<div class="inner_terms">\n<ul>\n   <li><a href="#">Ut rhoncus imperdiet augue sit amet egestas</a></li>\n<li><a href="#">Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper</a></li>\n<li><a href="#">Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel</a></li>\n<li><a href="#">Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit.</a></li>\n<li><a href="#">Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio.</a></li>\n<li><a href="#">Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat.</a></li>\n<li><a href="#">Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</a></li>\n<li><a href="#">Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</a></li>\n</ul>\n</div>\n\n<h3>Nam aliquam dolor</h3>\n<p> Sed vitae nibh et felis ornare accum. tiam tristique ornare erat et facilisis. Etiam pretium, massa ut commodo viverra, nunc magna vestibulum risus, a imperdiet quam leo ac mi.</p>\n\n<p>Nam eget nisl feugiat augue egestas tempus at fermentum tellus. Vestibulum vel orci ante, sed auctor mauris. Nulla a odio id nunc lobortis venenatis. Sed vestibulum elit at urna tincidunt pellentesque. Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</p>\n\n<p>Nulla mauris tellus, aliquam rutrum consectetur eu, pulvinar sit amet est. Integer sodales vulputate arcu eget dictum. Suspendisse nibh dolor, vestibulum a euismod nec, tristique ac quam. Aliquam vitae dolor justo, non aliquet nisl. Maecenas accumsan convallis mattis.</p>', 1323793245),
(5, 'Why Host?', 'Why Host?', 'why_host', 1, 'discover', '<div class="inner_header"><h2>Why Host?</h2></div><p>Praesent in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent dui nibh, placerat id placerat nec, facilisis vitae lorem.Ut at ante non quam posuere sollicitudin. Sed vel libero tellus. Nam aliquam dolor vitae risus lacinia tristique. Sed vitae nibh et felis ornare accum. tiam tristique ornare erat et facilisis. Etiam pretium, massa ut commodo viverra, nunc magna vestibulum risus, a imperdiet quam leo ac mi.</p>\n<p>Nam eget nisl feugiat augue egestas tempus at fermentum tellus. Vestibulum vel orci ante, sed auctor mauris. Nulla a odio id nunc lobortis venenatis. Sed vestibulum elit at urna tincidunt pellentesque. Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</p>\n<p>Nulla mauris tellus, aliquam rutrum consectetur eu, pulvinar sit amet est. Integer sodales vulputate arcu eget dictum. Suspendisse nibh dolor, vestibulum a euismod nec, tristique ac quam. Aliquam vitae dolor justo, non aliquet nisl. Maecenas accumsan convallis mattis.</p>\n<p>Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius.</p>\n<p>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel turpis et lacus fermentum congue. Integer fringilla euismod dui, id vehicula ut. Pellentesque placerat dictum diam sit amet porta.</p>\n<p>Aliquam vitae congue tortor. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio. Ut elementum ante quis urna auctor sagittis. Nunc porttitor sagittis condimentum. Nullam laoreet elit quis quam lobortis aliquet. Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros.</p>\n<p>Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio.</p>', 1323793245),
(4, 'Recommendation Help', 'Recommendation Help', 'recommendation_help', 0, '', '<div class="inner_header"><h2>Recommendation Help</h2></div>\r\n\r\n<h4>Aliquam vitae congue tortor</h4>\r\n<p>Praesent in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent dui nibh, placerat id placerat nec, facilisis vitae lorem.Ut at ante non quam posuere sollicitudin. Sed vel libero tellus. Nam aliquam dolor vitae risus lacinia tristique.</p>\r\n\r\n<h3>Nam aliquam dolor</h3>\r\n<p> Sed vitae nibh et felis ornare accum. tiam tristique ornare erat et facilisis. Etiam pretium, massa ut commodo viverra, nunc magna vestibulum risus, a imperdiet quam leo ac mi.</p>\r\n\r\n<p>Nam eget nisl feugiat augue egestas tempus at fermentum tellus. Vestibulum vel orci ante, sed auctor mauris. Nulla a odio id nunc lobortis venenatis. Sed vestibulum elit at urna tincidunt pellentesque. Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</p>\r\n\r\n<p>Nulla mauris tellus, aliquam rutrum consectetur eu, pulvinar sit amet est. Integer sodales vulputate arcu eget dictum. Suspendisse nibh dolor, vestibulum a euismod nec, tristique ac quam. Aliquam vitae dolor justo, non aliquet nisl. Maecenas accumsan convallis mattis.</p>\r\n\r\n<h3>Phasellus sem</h3>\r\n\r\n<p>Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius.</p>\r\n\r\n<p>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel turpis et lacus fermentum congue. Integer fringilla euismod dui, id vehicula ut. Pellentesque placerat dictum diam sit amet porta.</p>\r\n\r\n<h3>Nunc porttitor sagittis</h3>\r\n\r\n<p>Aliquam vitae congue tortor. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio. Ut elementum ante quis urna auctor sagittis. Nunc porttitor sagittis condimentum. Nullam laoreet elit quis quam lobortis aliquet. Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros.</p>\r\n\r\n<p>Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio.</p>\r\n\r\n<p>Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius.</p>\r\n\r\n<p>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel turpis et lacus fermentum congue. Integer fringilla euismod dui, id vehicula ut. Pellentesque placerat dictum diam sit amet porta.</p>\r\n\r\n\r\n<p>Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio.</p>\r\n<div class="inner_terms">\r\n<ul>\r\n   <li>Ut rhoncus imperdiet augue sit amet egestas</li>\r\n<li>Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper</li>\r\n<li>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel</li>\r\n<li>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit.</li>\r\n<li>Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio.</li>\r\n<li>Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat.</li>\r\n<li>Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</li>\r\n<li>Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</li>\r\n</ul>\r\n</div>', 1323793186);
INSERT INTO `page` (`id`, `page_name`, `page_title`, `page_url`, `is_footer`, `is_under`, `page_content`, `created`) VALUES
(3, 'Photo Tips', 'Photo Tips', 'photo_tips', 0, '', '<div class="inner_header"><h2>Photo Tips</h2></div>\r\n\r\n<h4>Aliquam vitae congue tortor</h4>\r\n<p>Praesent in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent dui nibh, placerat id placerat nec, facilisis vitae lorem.Ut at ante non quam posuere sollicitudin. Sed vel libero tellus. Nam aliquam dolor vitae risus lacinia tristique.</p>\r\n\r\n<h3>Nam aliquam dolor</h3>\r\n<p> Sed vitae nibh et felis ornare accum. tiam tristique ornare erat et facilisis. Etiam pretium, massa ut commodo viverra, nunc magna vestibulum risus, a imperdiet quam leo ac mi.</p>\r\n\r\n<p>Nam eget nisl feugiat augue egestas tempus at fermentum tellus. Vestibulum vel orci ante, sed auctor mauris. Nulla a odio id nunc lobortis venenatis. Sed vestibulum elit at urna tincidunt pellentesque. Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</p>\r\n\r\n<p>Nulla mauris tellus, aliquam rutrum consectetur eu, pulvinar sit amet est. Integer sodales vulputate arcu eget dictum. Suspendisse nibh dolor, vestibulum a euismod nec, tristique ac quam. Aliquam vitae dolor justo, non aliquet nisl. Maecenas accumsan convallis mattis.</p>\r\n\r\n<h3>Phasellus sem</h3>\r\n\r\n<p>Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius.</p>\r\n\r\n<p>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel turpis et lacus fermentum congue. Integer fringilla euismod dui, id vehicula ut. Pellentesque placerat dictum diam sit amet porta.</p>\r\n\r\n<h3>Nunc porttitor sagittis</h3>\r\n\r\n<p>Aliquam vitae congue tortor. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio. Ut elementum ante quis urna auctor sagittis. Nunc porttitor sagittis condimentum. Nullam laoreet elit quis quam lobortis aliquet. Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros.</p>\r\n\r\n<p>Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio.</p>\r\n\r\n<p>Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius.</p>\r\n\r\n<p>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel turpis et lacus fermentum congue. Integer fringilla euismod dui, id vehicula ut. Pellentesque placerat dictum diam sit amet porta.</p>\r\n\r\n\r\n<p>Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio.</p>\r\n<div class="inner_terms">\r\n<ul>\r\n   <li>Ut rhoncus imperdiet augue sit amet egestas</li>\r\n<li>Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper</li>\r\n<li>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel</li>\r\n<li>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit.</li>\r\n<li>Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio.</li>\r\n<li>Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat.</li>\r\n<li>Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</li>\r\n<li>Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</li>\r\n</ul>\r\n</div>', 1323793059),
(2, 'Fun Company News', 'Fun Company News', 'fun_company_news', 0, '', '<div class="inner_header"><h2>Fun Company News</h2></div><h4>Aliquam vitae congue tortor</h4>\n<p>Praesent in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent dui nibh, placerat id placerat nec, facilisis vitae lorem.Ut at ante non quam posuere sollicitudin. Sed vel libero tellus. Nam aliquam dolor vitae risus lacinia tristique.</p>\n\n<h3>Nam aliquam dolor</h3>\n<p> Sed vitae nibh et felis ornare accum. tiam tristique ornare erat et facilisis. Etiam pretium, massa ut commodo viverra, nunc magna vestibulum risus, a imperdiet quam leo ac mi.</p>\n\n<p>Nam eget nisl feugiat augue egestas tempus at fermentum tellus. Vestibulum vel orci ante, sed auctor mauris. Nulla a odio id nunc lobortis venenatis. Sed vestibulum elit at urna tincidunt pellentesque. Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</p>\n\n<p>Nulla mauris tellus, aliquam rutrum consectetur eu, pulvinar sit amet est. Integer sodales vulputate arcu eget dictum. Suspendisse nibh dolor, vestibulum a euismod nec, tristique ac quam. Aliquam vitae dolor justo, non aliquet nisl. Maecenas accumsan convallis mattis.</p>\n<div class="inner_terms">\n<ul>\n   <li><a href="#">Ut rhoncus imperdiet augue sit amet egestas</a></li>\n<li><a href="#">Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper</a></li>\n<li><a href="#">Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel</a></li>\n<li><a href="#">Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit.</a></li>\n<li><a href="#">Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio.</a></li>\n<li><a href="#">Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat.</a></li>\n<li><a href="#">Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</a></li>\n<li><a href="#">Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</a></li>\n</ul>\n</div>\n<h3>Phasellus sem</h3>\n\n<p>Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius.</p>\n\n<p>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel turpis et lacus fermentum congue. Integer fringilla euismod dui, id vehicula ut. Pellentesque placerat dictum diam sit amet porta.</p>\n\n<h3>Nunc porttitor sagittis</h3>\n\n<p>Aliquam vitae congue tortor. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio. Ut elementum ante quis urna auctor sagittis. Nunc porttitor sagittis condimentum. Nullam laoreet elit quis quam lobortis aliquet. Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros.</p>\n\n<p>Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio.</p>\n\n<p>Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius.</p>\n\n<p>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel turpis et lacus fermentum congue. Integer fringilla euismod dui, id vehicula ut. Pellentesque placerat dictum diam sit amet porta.</p>\n\n\n<p>Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio.</p>\n<div class="inner_terms">\n<ul>\n   <li><a href="#">Ut rhoncus imperdiet augue sit amet egestas</a></li>\n<li><a href="#">Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper</a></li>\n<li><a href="#">Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel</a></li>\n<li><a href="#">Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit.</a></li>\n<li><a href="#">Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio.</a></li>\n<li><a href="#">Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat.</a></li>\n<li><a href="#">Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</a></li>\n<li><a href="#">Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</a></li>\n</ul>\n</div>\n\n<h3>Nam aliquam dolor</h3>\n<p> Sed vitae nibh et felis ornare accum. tiam tristique ornare erat et facilisis. Etiam pretium, massa ut commodo viverra, nunc magna vestibulum risus, a imperdiet quam leo ac mi.</p>\n\n<p>Nam eget nisl feugiat augue egestas tempus at fermentum tellus. Vestibulum vel orci ante, sed auctor mauris. Nulla a odio id nunc lobortis venenatis. Sed vestibulum elit at urna tincidunt pellentesque. Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</p>\n\n<p>Nulla mauris tellus, aliquam rutrum consectetur eu, pulvinar sit amet est. Integer sodales vulputate arcu eget dictum. Suspendisse nibh dolor, vestibulum a euismod nec, tristique ac quam. Aliquam vitae dolor justo, non aliquet nisl. Maecenas accumsan convallis mattis.</p>', 1323793001),
(1, 'Really Cool Destinations', 'Really Cool Destinations', 'really_cool_destinations', 0, '', '<div class="inner_header"><h2>Really Cool Destinations</h2></div><p>Praesent in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent dui nibh, placerat id placerat nec, facilisis vitae lorem.Ut at ante non quam posuere sollicitudin. Sed vel libero tellus. Nam aliquam dolor vitae risus lacinia tristique. Sed vitae nibh et felis ornare accum. tiam tristique ornare erat et facilisis. Etiam pretium, massa ut commodo viverra, nunc magna vestibulum risus, a imperdiet quam leo ac mi.</p>\n<p>Nam eget nisl feugiat augue egestas tempus at fermentum tellus. Vestibulum vel orci ante, sed auctor mauris. Nulla a odio id nunc lobortis venenatis. Sed vestibulum elit at urna tincidunt pellentesque. Aenean tristique, massa ac faucibus adipiscing, nunc nulla aliquet orci, vitae pharetra enim erat sit amet magna. Ut pulvinar consequat purus in egestas. Phasellus imperdiet bibendum libero sit amet adipiscing.</p>\n<p>Nulla mauris tellus, aliquam rutrum consectetur eu, pulvinar sit amet est. Integer sodales vulputate arcu eget dictum. Suspendisse nibh dolor, vestibulum a euismod nec, tristique ac quam. Aliquam vitae dolor justo, non aliquet nisl. Maecenas accumsan convallis mattis.</p>\n<p>Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros. Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius.</p>\n<p>Phasellus sem tellus, imperdiet eu feugiat vel, laoreet non ligula. Pellentesque eleifend consequat augue eu hendrerit. Quisque vel turpis et lacus fermentum congue. Integer fringilla euismod dui, id vehicula ut. Pellentesque placerat dictum diam sit amet porta.</p>\n<p>Aliquam vitae congue tortor. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio. Ut elementum ante quis urna auctor sagittis. Nunc porttitor sagittis condimentum. Nullam laoreet elit quis quam lobortis aliquet. Duis suscipit interdum sapien, nec vulputate tortor dignissim et. Maecenas consequat rhoncus eros.</p>\n<p>Ut rhoncus imperdiet augue, sit amet egestas odio fermentum sed. Aliquam gravida nisl non libero ullamcorper placerat. Sed nisl lacus, auctor in posuere vitae, aliquam ut elit. Integer velit nunc, faucibus id mollis pharetra, eleifend at odio. Integer ullamcorper pretium varius. Donec gravida nulla non ante semper fringilla. In ante justo, sodales id condimentum sit amet, lobortis ut odio.</p>', 1323792509),
(14, 'Host Cancellation Policy', 'Host Cancellation Policy', 'host_cancellation_policy', 1, 'discover', '<div class="inner_header"><h2>Host Cancellation Policy</h2></div><p>If you need to cancel a confirmed reservation, it&rsquo;s important to do so as soon as possible. Go to your reservations, find the reservation you need to cancel, and click Cancel. You should also contact your guest to apologize for the inconvenience.<br /><br />When a reservation&rsquo;s status is Canceled, you&rsquo;ll be recorded as the party responsible for initiating the cancellation in our system. Because host cancellations require additional customer support, and generate additional costs for securing last-minute accommodations, the following actions are applied:<br /><br />Your calendar will remain blocked for the dates of the reservation. Our system does this automatically, to prevent another guest from booking unavailable dates at your listing.<br /><br />You may be subject to a cancellation fee, if you cancel more than {limit} in a {month}-month period. This fee, taken from your next payout, will help offset the cost of securing last-minute accommodations for your guest. The fee will be {before_amount} for each cancellation after {limit} in a {month}-month period, or {within_amount} for each cancellation after {limit} in a {month}-month period, made on a reservation that begins in {days} days or less.<br /><br />If you cancel before a reservation begins, your guest will receive a full refund and you will not receive a payout. If you cancel an active reservation, your cancellation policy will no longer determine your payout, and your guest will be fully refunded for every night that they did not stay in your space.</p>', 1416840213);

-- --------------------------------------------------------

--
-- Table structure for table `page_popup`
--

CREATE TABLE `page_popup` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `page_popup`
--

INSERT INTO `page_popup` (`id`, `name`, `content`, `status`) VALUES
(11, 'search', '', 1),
(16, 'search', '', 1),
(17, 'step2', '', 1),
(18, 'home', '', 1),
(19, 'step4', '', 1),
(23, 'rooms', '', 1),
(27, 'rooms', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `paykey`
--

CREATE TABLE `paykey` (
  `paykey` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paykey`
--

INSERT INTO `paykey` (`paykey`) VALUES
('AP-9LF47559NN033983K');

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `id` int(11) NOT NULL,
  `payment_id` smallint(6) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` varchar(111) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`id`, `payment_id`, `code`, `name`, `value`) VALUES
(4, 2, 'PAYPAL_ID', 'Paypal Business Id', 'gatesiva44@gmail.com'),
(3, 1, 'CC_SIGNATURE', 'CC Signature', 'AFcWxV21C7fd0v3bYYYRCpSSRl31AZSIKDxFGEpEBkweaNyiG.ilJ1UF'),
(2, 1, 'CC_PASSWORD', 'CC Password', '7R4U7VHZEPF4NGBK'),
(1, 1, 'CC_USER', 'CC Username', 'gatesiva44-facilitator_api1.gmail.com'),
(5, 3, 'BT_MERCHANT', 'BT Merchant Id', 'jdrhjptfq67xxyrq'),
(6, 3, 'BT_PUBLICKEY', 'BT Public Key', 'hc846bfhfy655xkc'),
(7, 3, 'BT_PRIVATEKEY', 'BT Private Key', 'b6c18672a8694e035ea2bc1edf056411');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` smallint(6) NOT NULL,
  `payment_name` varchar(30) NOT NULL,
  `is_enabled` smallint(6) NOT NULL DEFAULT '0',
  `is_live` smallint(6) NOT NULL DEFAULT '0',
  `is_payout` smallint(6) NOT NULL DEFAULT '0',
  `arrives_on` varchar(111) NOT NULL,
  `fees` varchar(30) NOT NULL,
  `currency` varchar(5) NOT NULL,
  `note` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `payment_name`, `is_enabled`, `is_live`, `is_payout`, `arrives_on`, `fees`, `currency`, `note`) VALUES
(2, 'Paypal', 1, 0, 1, 'Instant', 'None', 'USD', 'You can withdraw money from PayPal...\r\n<ul style="list-style-type: disc;list-style-position: inside;">\r\n<li>to your local bank account.</li>\r\n<li>via paper check.</li>\r\n</ul>'),
(1, 'CreditCard', 1, 0, 1, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `paymode`
--

CREATE TABLE `paymode` (
  `id` tinyint(4) NOT NULL,
  `mod_name` varchar(111) NOT NULL,
  `is_premium` tinyint(4) NOT NULL DEFAULT '0',
  `is_fixed` tinyint(4) NOT NULL DEFAULT '0',
  `fixed_amount` bigint(20) NOT NULL,
  `currency` varchar(25) NOT NULL,
  `percentage_amount` float NOT NULL,
  `modified_date` varchar(111) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paymode`
--

INSERT INTO `paymode` (`id`, `mod_name`, `is_premium`, `is_fixed`, `fixed_amount`, `currency`, `percentage_amount`, `modified_date`) VALUES
(1, 'Host Listing', 0, 1, 10, 'USD', 10, ''),
(2, 'Guest Booking', 1, 1, 50, 'USD', 50, ''),
(3, 'Host Accept The Reservation Request', 1, 0, 10, 'USD', 10, '');

-- --------------------------------------------------------

--
-- Table structure for table `payout_preferences`
--

CREATE TABLE `payout_preferences` (
  `id` int(50) NOT NULL,
  `user_id` int(111) NOT NULL,
  `country` varchar(7) NOT NULL,
  `payout_type` smallint(6) NOT NULL,
  `email` varchar(50) NOT NULL,
  `currency` varchar(7) NOT NULL,
  `is_default` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paywhom`
--

CREATE TABLE `paywhom` (
  `id` int(11) NOT NULL,
  `whom` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paywhom`
--

INSERT INTO `paywhom` (`id`, `whom`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_bin
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `id` int(11) NOT NULL,
  `night` int(11) NOT NULL,
  `week` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `guests` smallint(6) NOT NULL,
  `addguests` int(11) NOT NULL,
  `cleaning` int(11) NOT NULL,
  `security` int(11) NOT NULL,
  `previous_price` int(255) NOT NULL,
  `currency` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `price`
--

INSERT INTO `price` (`id`, `night`, `week`, `month`, `guests`, `addguests`, `cleaning`, `security`, `previous_price`, `currency`) VALUES
(1, 250, 1445, 3888, 2, 5, 5, 0, 0, 'USD'),
(2, 221, 155, 258, 1, 5, 5, 0, 0, 'PHP'),
(3, 125, 693, 1890, 1, 5, 0, 0, 0, 'EUR');

-- --------------------------------------------------------

--
-- Table structure for table `profile_picture`
--

CREATE TABLE `profile_picture` (
  `id` int(200) NOT NULL,
  `email` text NOT NULL,
  `src` text,
  `ext` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) NOT NULL,
  `Fname` varchar(255) DEFAULT NULL,
  `Lname` varchar(255) DEFAULT NULL,
  `gender` varchar(25) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `live` text,
  `school` text NOT NULL,
  `work` text,
  `phnum` varchar(255) DEFAULT NULL,
  `describe` text,
  `verification_status` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `emergency_status` int(1) NOT NULL DEFAULT '0',
  `emergency_name` varchar(255) NOT NULL,
  `emergency_phone` varchar(15) NOT NULL,
  `emergency_email` varchar(255) NOT NULL,
  `emergency_relation` varchar(255) NOT NULL,
  `join_date` varchar(70) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `Fname`, `Lname`, `gender`, `dob`, `email`, `live`, `school`, `work`, `phnum`, `describe`, `verification_status`, `language`, `emergency_status`, `emergency_name`, `emergency_phone`, `emergency_email`, `emergency_relation`, `join_date`) VALUES
(1, NULL, NULL, '', '', 'klkhiew.2013@sis.smu.edu.sg', NULL, '', NULL, NULL, NULL, '', '', 0, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `property_type`
--

CREATE TABLE `property_type` (
  `id` int(63) NOT NULL,
  `type` varchar(63) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `property_type`
--

INSERT INTO `property_type` (`id`, `type`) VALUES
(2, 'House'),
(1, 'Apartment'),
(3, 'Bed & Break Fast'),
(5, 'Cabin'),
(7, 'Castle'),
(8, 'Dorm'),
(9, 'Treehouse'),
(10, 'Boat'),
(4, 'Loft'),
(6, 'Villa'),
(11, 'Plane'),
(12, 'Parking Space'),
(13, 'Car'),
(14, 'Van'),
(15, 'Camper/RV'),
(16, 'Lgloo'),
(17, 'Lighthouse'),
(18, 'Yurt'),
(19, 'Tipi'),
(20, 'Cave'),
(21, 'Island'),
(22, 'Chalet'),
(23, 'Earth House'),
(24, 'Hut'),
(25, 'Train'),
(26, 'Tent'),
(27, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `recommends`
--

CREATE TABLE `recommends` (
  `id` bigint(20) NOT NULL,
  `userby` bigint(20) NOT NULL,
  `userto` bigint(20) NOT NULL,
  `message` text NOT NULL,
  `relationship` int(1) NOT NULL,
  `is_approval` int(1) NOT NULL,
  `created` int(31) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reference_request`
--

CREATE TABLE `reference_request` (
  `id` int(10) NOT NULL,
  `userby` int(10) NOT NULL,
  `userto` int(10) NOT NULL,
  `status` int(1) NOT NULL,
  `created` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` int(111) NOT NULL,
  `invite_from` int(111) NOT NULL,
  `invite_to` int(111) NOT NULL,
  `join_date` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `referrals_amount`
--

CREATE TABLE `referrals_amount` (
  `id` int(111) NOT NULL,
  `user_id` int(111) NOT NULL,
  `count_trip` int(111) NOT NULL,
  `count_book` int(111) NOT NULL,
  `amount` varchar(111) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `referrals_booking`
--

CREATE TABLE `referrals_booking` (
  `id` int(11) NOT NULL,
  `payer_id` int(11) NOT NULL,
  `list_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `ref_amount` int(11) NOT NULL,
  `is_full` int(1) NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `refund`
--

CREATE TABLE `refund` (
  `id` int(10) NOT NULL,
  `reservation_id` int(10) NOT NULL,
  `userto` int(10) NOT NULL,
  `payout_id` varchar(50) NOT NULL,
  `accept_status` int(1) NOT NULL,
  `created` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` bigint(20) NOT NULL,
  `transaction_id` varchar(50) NOT NULL,
  `list_id` int(111) NOT NULL,
  `userby` int(11) NOT NULL,
  `userto` int(111) NOT NULL,
  `checkin` varchar(50) NOT NULL,
  `checkout` varchar(50) NOT NULL,
  `no_quest` tinyint(4) NOT NULL,
  `currency` varchar(11) NOT NULL,
  `price` float NOT NULL,
  `topay` float NOT NULL,
  `admin_commission` float NOT NULL,
  `cleaning` float NOT NULL,
  `security` float NOT NULL,
  `extra_guest_price` float NOT NULL,
  `guest_count` int(5) NOT NULL,
  `coupon` varchar(25) NOT NULL,
  `credit_type` tinyint(4) NOT NULL,
  `ref_amount` int(111) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL,
  `is_payed` tinyint(4) NOT NULL DEFAULT '0',
  `is_payed_host` int(1) NOT NULL DEFAULT '0',
  `is_payed_guest` int(1) NOT NULL DEFAULT '0',
  `payment_id` tinyint(4) NOT NULL,
  `payed_date` varchar(111) NOT NULL,
  `book_date` int(31) NOT NULL,
  `cancel_date` varchar(50) NOT NULL,
  `host_topay` float NOT NULL,
  `guest_topay` float NOT NULL,
  `host_penalty` float NOT NULL,
  `policy` int(3) NOT NULL,
  `contacts_offer` int(255) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_status`
--

CREATE TABLE `reservation_status` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation_status`
--

INSERT INTO `reservation_status` (`id`, `name`) VALUES
(0, 'Payment Pending'),
(1, 'Pending'),
(2, 'Expired'),
(3, 'Accepted'),
(4, 'Declined'),
(5, 'Before Checkin Canceled by Host'),
(6, 'Before Checkin Canceled by Guet'),
(7, 'Checkin'),
(8, 'Awaiting Host Review'),
(9, 'Awaiting Travel Review'),
(10, 'Completed'),
(11, 'After Checkin Canceled by Host'),
(12, 'After Checkin Canceled by Guest'),
(13, 'Pending Reservation Canceled');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) NOT NULL,
  `userby` bigint(20) NOT NULL,
  `userto` bigint(20) NOT NULL,
  `reservation_id` bigint(20) NOT NULL,
  `list_id` bigint(20) NOT NULL,
  `review` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `feedback` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cleanliness` smallint(6) NOT NULL,
  `communication` smallint(6) NOT NULL,
  `house_rules` smallint(6) NOT NULL,
  `accuracy` tinyint(4) NOT NULL,
  `checkin` tinyint(4) NOT NULL,
  `location` tinyint(4) NOT NULL,
  `value` tinyint(4) NOT NULL,
  `created` int(31) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `parent_id`, `name`) VALUES
(1, 0, 'User'),
(2, 0, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `saved_neigh`
--

CREATE TABLE `saved_neigh` (
  `id` int(5) NOT NULL,
  `city_id` int(5) NOT NULL,
  `city` varchar(100) NOT NULL,
  `place_id` int(5) NOT NULL,
  `place` varchar(100) NOT NULL,
  `user_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seasonalprice`
--

CREATE TABLE `seasonalprice` (
  `id` int(11) NOT NULL,
  `list_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `start_date` int(31) NOT NULL,
  `end_date` int(31) NOT NULL,
  `currency` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(12) unsigned NOT NULL,
  `code` varchar(100) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `setting_type` char(1) CHARACTER SET utf8 NOT NULL,
  `value_type` char(1) CHARACTER SET utf8 NOT NULL,
  `int_value` int(12) DEFAULT NULL,
  `string_value` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `text_value` text CHARACTER SET utf8,
  `created` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `code`, `name`, `setting_type`, `value_type`, `int_value`, `string_value`, `text_value`, `created`) VALUES
(1, 'SITE_TITLE', 'Site Title', 'S', 'S', 0, 'No Agent', NULL, 1455031660),
(2, 'SITE_SLOGAN', 'Site Slogan', 'S', 'S', 0, 'Rent nightly from real people in 15,543 cities in 185 countries.', NULL, 2013),
(3, 'SITE_STATUS', 'Site status', 'S', 'I', 0, '', NULL, 2013),
(4, 'OFFLINE_MESSAGE', 'Offline Message', 'S', 'T', 0, '', 'Updation is going on...we will run this system very soon', 2013),
(5, 'SITE_ADMIN_MAIL', 'Site Admin Mail', 'S', 'S', NULL, 'klkhiew.2013@sis.smu.edu.sg', NULL, 1455031660),
(6, 'SITE_FB_API_ID', 'Site Facebook API ID', 'S', 'S', NULL, '179085619122575', NULL, 1455031660),
(7, 'SITE_FB_API_SECRET', 'Site Facebook Secret Key', 'S', 'S', NULL, '771d1c954a6c812f1f4a646735299e24', NULL, 1455031660),
(8, 'SITE_GOOGLE_API_ID', 'Site Google API Key', 'S', 'S', NULL, 'AIzaSyCB0ffj7LiC_4gVm3qVy7AubkL3O6pqrk4', NULL, 1455031660),
(9, 'FRONTEND_LANGUAGE', 'Frontend Language', 'S', 'S', 1, 'en', 'en', 2013),
(10, 'SITE_LOGO', 'Site Logo', 'S', 'S', NULL, 'logo.png', NULL, 2013),
(11, 'META_KEYWORD', 'Meta Keyword', 'S', 'S', NULL, 'Dropinn', NULL, 2013),
(12, 'META_DESCRIPTION', 'Meta Description', 'S', 'S', NULL, 'Dropinn - Airbnb Clone', NULL, 2013),
(13, 'HOW_IT_WORKS', 'How It Works', 'S', 'S', 0, 'video.mp4', '', 2013),
(14, 'GOOGLE_ANALYTICS_CODE', 'Google Analytics Code', 'S', 'S', NULL, NULL, '', 2013),
(15, 'BACKEND_LANGUAGE', 'Backend Language', 'S', 'S', 1, 'en', 'en', 0),
(16, 'SITE_TWITTER_API_ID', 'Site Twitter API ID', 'S', 'S', NULL, 'SUCtw5xqu9OlxpMHOLSsvlyRQ', NULL, 1455031660),
(17, 'SITE_TWITTER_API_SECRET', 'Site Twitter Secret Key', 'S', 'S', NULL, 'WLoynPTZenyep0lDWLinHqPYqB37JKpKoRAyRCiCMtoQnpqR1s', NULL, 1455031660),
(18, 'DI_LICENSE_KEY', 'License Key', 'S', 'S', NULL, '', NULL, 1364016667),
(19, 'DI_LICENSE_LOCAL_KEY', 'License Local Key', 'S', 'T', NULL, NULL, 'YToxMDp7czo4OiJjdXN0b21lciI7YTo2OntzOjI6ImlkIjtzOjE6IjIiO3M6MTU6%0AInByaW1hcnlfdXNlcl9pZCI7czoxOiIxIjtzOjQ6Im5hbWUiO3M6MjoiQ1QiO3M6%0AMTA6InZhdF9udW1iZXIiO3M6MDoiIjtzOjY6InN0YXR1cyI7czo3OiJlbmFibGVk%0AIjtzOjc6ImNyZWF0ZWQiO3M6MTA6IjEzMTEzMzY4NDciO31zOjQ6InVzZXIiO2E6%0AMTp7aTowO2E6MTQ6e3M6MjoiaWQiO3M6MToiMSI7czoxMDoic2Vzc2lvbl9pZCI7%0AczozMjoiY2U4N2MzMGRkYTg5YTY5MTU2Mzk1ZjU3YTA0YzNkMjciO3M6MTE6Imxh%0Ac3RfbG9nZ2VkIjtzOjEwOiIxMzEzNTEwNDQyIjtzOjEwOiJmaXJzdF9uYW1lIjtz%0AOjU6ImtyaXNoIjtzOjk6Imxhc3RfbmFtZSI7czoxMjoiQ2hlbGxha2thbm51Ijtz%0AOjg6InBhc3N3b3JkIjtzOjMyOiJlMTBhZGMzOTQ5YmE1OWFiYmU1NmUwNTdmMjBm%0AODgzZSI7czo4OiJ1c2VybmFtZSI7czo0OiJiYWxhIjtzOjU6ImVtYWlsIjtzOjI1%0AOiJiYWxha3Jpc2huYW50bmpAZ21haWwuY29tIjtzOjE3OiJzZWN1cml0eV9xdWVz%0AdGlvbiI7czoyNDoiV2hhdCB3YXMgeW91ciBmaXJzdCBqb2I%2FIjtzOjI0OiJzZWN1%0Acml0eV9xdWVzdGlvbl9hbnN3ZXIiO3M6NjoiYWdyaXlhIjtzOjg6Im1heF9yb3dz%0AIjtzOjE6IjUiO3M6MjU6ImhlbHBkZXNrX2Zsb29kX3Byb3RlY3Rpb24iO3M6ODoi%0ARGlzYWJsZWQiO3M6NzoiY3JlYXRlZCI7czoxMDoiMTMxMTMzNjg0NyI7czo2OiJz%0AdGF0dXMiO3M6NzoiZW5hYmxlZCI7fX1zOjE4OiJsaWNlbnNlX2tleV9zdHJpbmci%0AO3M6MjA6IkRyb3BJbm4tMjYyOTIyOWYxYjllIjtzOjg6Imluc3RhbmNlIjthOjU6%0Ae3M6OToiZGlyZWN0b3J5IjthOjE6e2k6MTg3ODtzOjU0OiIvaG9tZS9jb2d6aWRl%0AbHRlbXAvcHVibGljX2h0bWwvZGVtby9jbGllbnQvZHJvcGlubi0xNjYiO31zOjY6%0AImRvbWFpbiI7YToyOntpOjE4NzU7czoyNjoiZGVtby5jb2d6aWRlbHRlbXBsYXRl%0Acy5jb20iO2k6MTg3NjtzOjMwOiJ3d3cuZGVtby5jb2d6aWRlbHRlbXBsYXRlcy5j%0Ab20iO31zOjI6ImlwIjthOjE6e2k6MTg3NztzOjEzOiIyMDguMTA5Ljg3LjU3Ijt9%0AczoxNToic2VydmVyX2hvc3RuYW1lIjthOjE6e2k6MTg3OTtzOjM2OiJpcC0yMDgt%0AMTA5LTg3LTQyLmlwLnNlY3VyZXNlcnZlci5uZXQiO31zOjk6InNlcnZlcl9pcCI7%0AYToxOntpOjE4ODA7czo5OiIxMjcuMC4wLjEiO319czo3OiJlbmZvcmNlIjthOjU6%0Ae2k6MDtzOjY6ImRvbWFpbiI7aToxO3M6MjoiaXAiO2k6MjtzOjk6ImRpcmVjdG9y%0AeSI7aTozO3M6MTU6InNlcnZlcl9ob3N0bmFtZSI7aTo0O3M6OToic2VydmVyX2lw%0AIjt9czoxMzoiY3VzdG9tX2ZpZWxkcyI7YToxOntzOjA6IiI7Tjt9czoyMzoiZG93%0AbmxvYWRfYWNjZXNzX2V4cGlyZXMiO3M6MTA6IjEzNTUxNDgyMTYiO3M6MTU6Imxp%0AY2Vuc2VfZXhwaXJlcyI7czo1OiJuZXZlciI7czoxNzoibG9jYWxfa2V5X2V4cGly%0AZXMiO3M6MTA6IjEzNzU4NTUxOTkiO3M6Njoic3RhdHVzIjtzOjY6ImFjdGl2ZSI7%0AfXtzcGJhc31hM2YwM2QyNTNiNmFmMmExZjQxYTJhNGQxMmI1NDE4NntzcGJhc304%0AZTQ1ZTcxYWU0NjIyY2YwZWNlMjJkM2U2OTAzMjY4Ng%3D%3D', 1364016667),
(30, 'BANNER_VIDEO', 'Home page banner video', 'S', 'S', 0, 'http://www.youtube.com/watch?v=ab0TSkLe-E0', NULL, 0),
(20, 'NEXMO_API_SECRET', 'Nexmo API Secret', 'S', 'T', 0, 'c0a428fd', NULL, 0),
(21, 'NEXMO_API_KEY', 'Nexmo API Key', 'S', 'T', 0, 'af6792d3', NULL, 0),
(22, 'NEXMO_API_PHONE_NO', 'Nexmo API Registered Phone number', 'S', 'S', 0, '919597944025', NULL, 0),
(23, 'FAVICON_IMAGE', 'favicon image', 'S', 'S', NULL, 'logo.png', NULL, 2014);

-- --------------------------------------------------------

--
-- Table structure for table `settings_extra`
--

CREATE TABLE `settings_extra` (
  `id` int(12) unsigned NOT NULL,
  `code` varchar(100) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `setting_type` char(1) CHARACTER SET utf8 NOT NULL,
  `value_type` char(1) CHARACTER SET utf8 NOT NULL,
  `int_value` int(12) DEFAULT NULL,
  `string_value` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `text_value` text CHARACTER SET utf8,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE `statistics` (
  `id` int(25) NOT NULL,
  `list_id` int(25) NOT NULL,
  `page_view` int(25) NOT NULL,
  `date` int(25) NOT NULL,
  `month` varchar(100) NOT NULL,
  `year` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `theme_select`
--

CREATE TABLE `theme_select` (
  `id` int(11) NOT NULL,
  `color` varchar(25) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `theme_select`
--

INSERT INTO `theme_select` (`id`, `color`, `status`) VALUES
(1, 'red', 1),
(2, 'orange', 0),
(3, 'pink', 0),
(4, 'green', 0),
(5, 'yellow', 0);

-- --------------------------------------------------------

--
-- Table structure for table `toplocation_categories`
--

CREATE TABLE `toplocation_categories` (
  `id` smallint(6) NOT NULL,
  `name` varchar(111) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `toplocation_categories`
--

INSERT INTO `toplocation_categories` (`id`, `name`) VALUES
(1, 'India'),
(2, 'World');

-- --------------------------------------------------------

--
-- Table structure for table `toplocations`
--

CREATE TABLE `toplocations` (
  `id` int(11) NOT NULL,
  `category_id` smallint(6) NOT NULL,
  `name` varchar(111) NOT NULL,
  `search_code` varchar(111) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `toplocations`
--

INSERT INTO `toplocations` (`id`, `category_id`, `name`, `search_code`) VALUES
(1, 1, 'Delhi', 'Delhi'),
(2, 1, 'Mumbai', 'Mumbai'),
(3, 1, 'Bangalore', 'Bangalore'),
(4, 1, 'Hyderabad', 'Hyderabad'),
(5, 1, 'Ahmedabad', 'Ahmedabad'),
(6, 1, 'Chennai', 'Chennai'),
(7, 1, 'Kolkata', 'Kolkata'),
(8, 1, 'Pune', 'Pune'),
(9, 2, 'New York', 'New York'),
(10, 2, 'San Francisco', 'San Francisco'),
(11, 2, 'London', 'London'),
(12, 2, 'Paris', 'Paris'),
(13, 2, 'Barcelona', 'Barcelona'),
(14, 2, 'Rome', 'Rome'),
(15, 2, 'Berlin', 'Berlin'),
(16, 2, 'Amsterdam', 'Amsterdam');

-- --------------------------------------------------------

--
-- Table structure for table `user_autologin`
--

CREATE TABLE `user_autologin` (
  `key_id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `user_agent` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_ip` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_notification`
--

CREATE TABLE `user_notification` (
  `id` bigint(11) NOT NULL,
  `periodic_offers` smallint(5) NOT NULL,
  `company_news` smallint(5) NOT NULL,
  `upcoming_reservation` smallint(5) NOT NULL,
  `new_review` smallint(5) NOT NULL,
  `leave_review` smallint(5) NOT NULL,
  `standby_guests` smallint(5) NOT NULL,
  `rank_search` smallint(5) NOT NULL,
  `user_id` smallint(6) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_notification`
--

INSERT INTO `user_notification` (`id`, `periodic_offers`, `company_news`, `upcoming_reservation`, `new_review`, `leave_review`, `standby_guests`, `rank_search`, `user_id`) VALUES
(1, 0, 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `country` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_temp`
--

CREATE TABLE `user_temp` (
  `id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(34) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `activation_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_ip` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_wishlist`
--

CREATE TABLE `user_wishlist` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `list_id` int(10) NOT NULL,
  `wishlist_id` int(10) NOT NULL,
  `note` text NOT NULL,
  `created` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '1',
  `ref_id` varchar(50) NOT NULL,
  `fb_id` bigint(20) NOT NULL,
  `twitter_id` bigint(20) NOT NULL,
  `google_id` bigint(20) NOT NULL,
  `file1` varchar(255) NOT NULL,
  `file2` varchar(255) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `via_login` varchar(25) NOT NULL,
  `facebook_verify` varchar(10) DEFAULT '0',
  `facebook_email` varchar(25) NOT NULL,
  `google_verify` varchar(10) DEFAULT '0',
  `google_email` varchar(25) NOT NULL,
  `email_verify` varchar(10) DEFAULT '0',
  `phone_verify` varchar(10) NOT NULL DEFAULT '0',
  `email_verification_code` varchar(50) DEFAULT '0',
  `phone_verification_code` int(10) NOT NULL,
  `referral_code` varchar(15) NOT NULL,
  `refer_userid` varchar(100) NOT NULL,
  `trips_referral_code` varchar(15) NOT NULL,
  `list_referral_code` varchar(15) NOT NULL,
  `referral_amount` int(10) NOT NULL,
  `timezone` varchar(11) NOT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `newpass` varchar(34) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `newpass_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `newpass_time` datetime DEFAULT NULL,
  `last_ip` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_login` int(31) NOT NULL,
  `created` int(31) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `photo_status` int(11) NOT NULL,
  `shortlist` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `ref_id`, `fb_id`, `twitter_id`, `google_id`, `file1`, `file2`, `coupon_code`, `username`, `password`, `email`, `via_login`, `facebook_verify`, `facebook_email`, `google_verify`, `google_email`, `email_verify`, `phone_verify`, `email_verification_code`, `phone_verification_code`, `referral_code`, `refer_userid`, `trips_referral_code`, `list_referral_code`, `referral_amount`, `timezone`, `banned`, `ban_reason`, `newpass`, `newpass_key`, `newpass_time`, `last_ip`, `last_login`, `created`, `modified`, `photo_status`, `shortlist`) VALUES
(1, 2, '63a9f0ea7bb98050796b649e85481845', 0, 0, 0, '', '', '71195', 'root', '$1$74c/2I/M$pLCib/.vio4aR6wzYVQBT1', 'klkhiew.2013@sis.smu.edu.sg', '', '0', '', '0', '', '0', '0', '0', 0, '', '', '', '', 0, '', 0, NULL, NULL, NULL, NULL, '::1', 0, 1455028060, '2016-02-09 15:27:40', 0, '1,2');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `privacy` int(1) NOT NULL,
  `created` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accept_pay`
--
ALTER TABLE `accept_pay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_key`
--
ALTER TABLE `admin_key`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amnities`
--
ALTER TABLE `amnities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calendar`
--
ALTER TABLE `calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cancellation_policy`
--
ALTER TABLE `cancellation_policy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `contact_info`
--
ALTER TABLE `contact_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_users`
--
ALTER TABLE `coupon_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_converter`
--
ALTER TABLE `currency_converter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discover`
--
ALTER TABLE `discover`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_settings`
--
ALTER TABLE `email_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `google_analytics`
--
ALTER TABLE `google_analytics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help`
--
ALTER TABLE `help`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `host_cancellation_penalty`
--
ALTER TABLE `host_cancellation_penalty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `host_cancellation_policy`
--
ALTER TABLE `host_cancellation_policy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ical_import`
--
ALTER TABLE `ical_import`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `joinus`
--
ALTER TABLE `joinus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `list`
--
ALTER TABLE `list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `list_pay`
--
ALTER TABLE `list_pay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `list_photo`
--
ALTER TABLE `list_photo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_history`
--
ALTER TABLE `login_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `map_photo`
--
ALTER TABLE `map_photo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_type`
--
ALTER TABLE `message_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metas`
--
ALTER TABLE `metas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `neigh_category`
--
ALTER TABLE `neigh_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `neigh_city`
--
ALTER TABLE `neigh_city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `neigh_city_place`
--
ALTER TABLE `neigh_city_place`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `neigh_knowledge`
--
ALTER TABLE `neigh_knowledge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `neigh_photographer`
--
ALTER TABLE `neigh_photographer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `neigh_place_category`
--
ALTER TABLE `neigh_place_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `neigh_post`
--
ALTER TABLE `neigh_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `neigh_tag`
--
ALTER TABLE `neigh_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `neighbor_area`
--
ALTER TABLE `neighbor_area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `neighbor_city`
--
ALTER TABLE `neighbor_city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_popup`
--
ALTER TABLE `page_popup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payout_preferences`
--
ALTER TABLE `payout_preferences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paywhom`
--
ALTER TABLE `paywhom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_picture`
--
ALTER TABLE `profile_picture`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD KEY `email` (`email`);

--
-- Indexes for table `property_type`
--
ALTER TABLE `property_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recommends`
--
ALTER TABLE `recommends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reference_request`
--
ALTER TABLE `reference_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals_amount`
--
ALTER TABLE `referrals_amount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals_booking`
--
ALTER TABLE `referrals_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund`
--
ALTER TABLE `refund`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saved_neigh`
--
ALTER TABLE `saved_neigh`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seasonalprice`
--
ALTER TABLE `seasonalprice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_extra`
--
ALTER TABLE `settings_extra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme_select`
--
ALTER TABLE `theme_select`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `toplocation_categories`
--
ALTER TABLE `toplocation_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `toplocations`
--
ALTER TABLE `toplocations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_autologin`
--
ALTER TABLE `user_autologin`
  ADD PRIMARY KEY (`key_id`,`user_id`);

--
-- Indexes for table `user_notification`
--
ALTER TABLE `user_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_temp`
--
ALTER TABLE `user_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_wishlist`
--
ALTER TABLE `user_wishlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accept_pay`
--
ALTER TABLE `accept_pay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `admin_key`
--
ALTER TABLE `admin_key`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `amnities`
--
ALTER TABLE `amnities`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `calendar`
--
ALTER TABLE `calendar`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cancellation_policy`
--
ALTER TABLE `cancellation_policy`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `contact_info`
--
ALTER TABLE `contact_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=240;
--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `coupon_users`
--
ALTER TABLE `coupon_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `currency_converter`
--
ALTER TABLE `currency_converter`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `discover`
--
ALTER TABLE `discover`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `email_settings`
--
ALTER TABLE `email_settings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=118;
--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `google_analytics`
--
ALTER TABLE `google_analytics`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `help`
--
ALTER TABLE `help`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `host_cancellation_penalty`
--
ALTER TABLE `host_cancellation_penalty`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `host_cancellation_policy`
--
ALTER TABLE `host_cancellation_policy`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ical_import`
--
ALTER TABLE `ical_import`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `joinus`
--
ALTER TABLE `joinus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `list`
--
ALTER TABLE `list`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `list_pay`
--
ALTER TABLE `list_pay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `list_photo`
--
ALTER TABLE `list_photo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `login_history`
--
ALTER TABLE `login_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `map_photo`
--
ALTER TABLE `map_photo`
  MODIFY `id` bigint(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `message_type`
--
ALTER TABLE `message_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `metas`
--
ALTER TABLE `metas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `neigh_category`
--
ALTER TABLE `neigh_category`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `neigh_city`
--
ALTER TABLE `neigh_city`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `neigh_city_place`
--
ALTER TABLE `neigh_city_place`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `neigh_knowledge`
--
ALTER TABLE `neigh_knowledge`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `neigh_photographer`
--
ALTER TABLE `neigh_photographer`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `neigh_place_category`
--
ALTER TABLE `neigh_place_category`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `neigh_post`
--
ALTER TABLE `neigh_post`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `neigh_tag`
--
ALTER TABLE `neigh_tag`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `neighbor_area`
--
ALTER TABLE `neighbor_area`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `neighbor_city`
--
ALTER TABLE `neighbor_city`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(111) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `page_popup`
--
ALTER TABLE `page_popup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `payout_preferences`
--
ALTER TABLE `payout_preferences`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `profile_picture`
--
ALTER TABLE `profile_picture`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `property_type`
--
ALTER TABLE `property_type`
  MODIFY `id` int(63) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `recommends`
--
ALTER TABLE `recommends`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reference_request`
--
ALTER TABLE `reference_request`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` int(111) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `referrals_amount`
--
ALTER TABLE `referrals_amount`
  MODIFY `id` int(111) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `referrals_booking`
--
ALTER TABLE `referrals_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `refund`
--
ALTER TABLE `refund`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `saved_neigh`
--
ALTER TABLE `saved_neigh`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `seasonalprice`
--
ALTER TABLE `seasonalprice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(12) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `settings_extra`
--
ALTER TABLE `settings_extra`
  MODIFY `id` int(12) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `statistics`
--
ALTER TABLE `statistics`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `theme_select`
--
ALTER TABLE `theme_select`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `toplocation_categories`
--
ALTER TABLE `toplocation_categories`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `toplocations`
--
ALTER TABLE `toplocations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `user_notification`
--
ALTER TABLE `user_notification`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_temp`
--
ALTER TABLE `user_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_wishlist`
--
ALTER TABLE `user_wishlist`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;--
-- Database: `is306recco`
--

-- --------------------------------------------------------

--
-- Table structure for table `defect`
--

CREATE TABLE `defect` (
  `defectid` int(11) NOT NULL,
  `projectname` varchar(500) NOT NULL,
  `defectname` varchar(500) NOT NULL,
  `description` varchar(8000) DEFAULT NULL,
  `reportby` varchar(25) NOT NULL,
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `iscomplete` int(11) NOT NULL DEFAULT '0',
  `severity` int(11) NOT NULL DEFAULT '2',
  `duedate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `validation`
--

CREATE TABLE `validation` (
  `projectname` varchar(1000) DEFAULT NULL,
  `startdate` varchar(1000) DEFAULT NULL,
  `enddate` varchar(1000) DEFAULT NULL,
  `projecttype` varchar(1000) DEFAULT NULL,
  `projectpriority` varchar(1000) DEFAULT NULL,
  `clientname` varchar(1000) DEFAULT NULL,
  `clientemail` varchar(1000) DEFAULT NULL,
  `clientnotes` varchar(10000) DEFAULT NULL,
  `functionality` varchar(1000) DEFAULT NULL,
  `experience` varchar(1000) DEFAULT NULL,
  `developer` varchar(1000) DEFAULT NULL,
  `version` varchar(1000) DEFAULT NULL,
  `timing` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `validation`
--

INSERT INTO `validation` (`projectname`, `startdate`, `enddate`, `projecttype`, `projectpriority`, `clientname`, `clientemail`, `clientnotes`, `functionality`, `experience`, `developer`, `version`, `timing`) VALUES
('', '', '', 'wordpress', 'Low', '', '-', '', '', 'senior', 'candy', 'b', 'Wed'),
('', '', '', 'wordpress', 'Low', '', '-', '', '', 'senior', 'candy', 'b', '11/11/2015'),
('', '', '', 'wordpress', 'Low', '', '-', '', '', 'senior', 'candy', 'b', '2015-11-11'),
('', '', '', 'wordpress', 'Low', '', '-', '', '', 'senior', 'candy', 'b', '11/11/2015'),
('', '', '', 'wordpress', 'Low', '', '-', '', '', 'senior', 'candy', 'b', '11/11/2015'),
('', '', '', 'wordpress', 'es', '-', '-', '-', '-', '-', '-', '-', '-'),
('', '', '', 'wordpress', 'Low', '', '-', '', '', 'senior', 'candy', 'b', 'Wed'),
('', '', '', 'wordpress', 'Low', '', '-', '', '', 'senior', 'candy', 'b', 'Wed'),
('', '', '', 'wordpress', 'Low', '', '-', '', '', 'senior', 'candy', 'b', '<script'),
('', '', '', 'wordpress', 'Low', '', '-', '', '', 'senior', 'candy', 'b', ''),
('', '', '', 'wordpress', 'Low', '', '-', '', '', 'senior', 'candy', 'b', '1447209690649'),
('', '', '', 'wordpress', 'Low', '', '-', '', '', 'senior', 'candy', 'b', '2015-11-11'),
('', '', '', 'wordpress', 'Low', '', '-', '', '', 'senior', 'candy', 'b', '2015-11-11'),
('', '', '', 'wordpress', 'Low', '', '-', '', '', 'senior', 'candy', 'b', '2015-11-12'),
('asdas', '', '', 'wordpress', 'Low', '', '', 'asdasd', 'asdasd', 'senior', 'candy', 'a', '2015-11-12'),
('', '', '', 'wordpress', 'Low', '', '-', '', '', 'senior', 'candy', 'b', '2015-11-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `defect`
--
ALTER TABLE `defect`
  ADD PRIMARY KEY (`defectid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `defect`
--
ALTER TABLE `defect`
  MODIFY `defectid` int(11) NOT NULL AUTO_INCREMENT;