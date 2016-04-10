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
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cron`
--

INSERT INTO `cron` (`cronid`, `updatetime`, `state`) VALUES
(1, '2016-04-07 22:18:30', 1),
(2, '2016-04-08 02:52:23', 1),
(3, '2016-04-08 02:54:21', 1),
(4, '2016-04-08 02:56:21', 1),
(5, '2016-04-08 02:58:20', 1),
(6, '2016-04-08 03:00:30', 1),
(7, '2016-04-08 03:02:20', 1),
(8, '2016-04-08 03:04:20', 1),
(9, '2016-04-08 03:06:20', 1),
(10, '2016-04-08 03:08:19', 1),
(11, '2016-04-08 03:10:31', 1),
(12, '2016-04-08 03:12:21', 1),
(13, '2016-04-08 03:14:18', 1),
(14, '2016-04-08 03:16:19', 1),
(15, '2016-04-08 03:18:20', 1),
(16, '2016-04-08 03:20:25', 1),
(17, '2016-04-08 03:22:21', 1),
(18, '2016-04-08 03:24:21', 1),
(19, '2016-04-08 03:26:20', 1),
(20, '2016-04-08 03:28:19', 1),
(21, '2016-04-08 03:30:26', 1),
(22, '2016-04-08 03:32:19', 1),
(23, '2016-04-08 03:34:19', 1),
(24, '2016-04-08 03:36:20', 1),
(25, '2016-04-08 03:38:19', 1),
(26, '2016-04-08 03:40:26', 1),
(27, '2016-04-08 03:42:21', 1),
(28, '2016-04-08 03:44:22', 1),
(29, '2016-04-08 03:46:19', 1),
(30, '2016-04-08 03:48:23', 1),
(31, '2016-04-08 03:50:26', 1),
(32, '2016-04-08 03:52:21', 1),
(33, '2016-04-08 03:54:23', 1),
(34, '2016-04-08 03:56:25', 1),
(35, '2016-04-08 03:58:28', 1),
(36, '2016-04-08 04:00:41', 1),
(37, '2016-04-08 04:02:39', 1),
(38, '2016-04-08 04:04:23', 1),
(39, '2016-04-08 04:06:26', 1),
(40, '2016-04-08 04:08:20', 1),
(41, '2016-04-08 04:10:30', 1),
(42, '2016-04-08 04:12:21', 1),
(43, '2016-04-08 04:14:20', 1),
(44, '2016-04-08 04:16:20', 1),
(45, '2016-04-08 04:18:22', 1),
(46, '2016-04-08 04:20:27', 1),
(47, '2016-04-08 04:22:23', 1),
(48, '2016-04-08 04:24:22', 1),
(49, '2016-04-08 04:26:20', 1),
(50, '2016-04-08 04:28:22', 1),
(51, '2016-04-08 04:30:29', 1),
(52, '2016-04-08 04:32:21', 1),
(53, '2016-04-08 04:34:19', 1),
(54, '2016-04-08 04:36:19', 1),
(55, '2016-04-08 04:38:19', 1),
(56, '2016-04-08 04:40:26', 1),
(57, '2016-04-08 04:42:23', 1),
(58, '2016-04-08 04:44:22', 1),
(59, '2016-04-08 04:46:25', 1),
(60, '2016-04-08 04:48:26', 1),
(61, '2016-04-08 04:50:38', 1),
(62, '2016-04-08 04:52:22', 1),
(63, '2016-04-08 04:54:20', 1),
(64, '2016-04-08 04:56:21', 1),
(65, '2016-04-08 04:58:20', 1),
(66, '2016-04-08 05:00:31', 1),
(67, '2016-04-08 05:02:24', 1),
(68, '2016-04-08 05:04:18', 1),
(69, '2016-04-08 05:06:20', 1),
(70, '2016-04-08 05:08:18', 1),
(71, '2016-04-08 05:10:34', 1),
(72, '2016-04-08 05:12:20', 1),
(73, '2016-04-08 05:14:19', 1),
(74, '2016-04-08 05:16:19', 1),
(75, '2016-04-08 05:18:21', 1),
(76, '2016-04-08 05:20:24', 1),
(77, '2016-04-08 05:22:25', 1),
(78, '2016-04-08 05:24:21', 1),
(79, '2016-04-08 05:26:19', 1),
(80, '2016-04-08 05:28:19', 1),
(81, '2016-04-08 05:30:26', 1),
(82, '2016-04-08 05:32:19', 1),
(83, '2016-04-08 05:34:22', 1),
(84, '2016-04-08 05:36:21', 1),
(85, '2016-04-08 05:38:19', 1),
(86, '2016-04-08 05:40:25', 1),
(87, '2016-04-08 05:42:22', 1),
(88, '2016-04-08 05:44:20', 1),
(89, '2016-04-08 05:46:19', 1),
(90, '2016-04-08 05:48:19', 1),
(91, '2016-04-08 05:50:25', 1),
(92, '2016-04-08 05:52:19', 1),
(93, '2016-04-08 05:54:20', 1),
(94, '2016-04-08 05:56:19', 1),
(95, '2016-04-08 05:58:20', 1),
(96, '2016-04-08 06:00:30', 1),
(97, '2016-04-08 06:02:21', 1),
(98, '2016-04-08 06:04:21', 1),
(99, '2016-04-08 06:06:21', 1),
(100, '2016-04-08 06:08:32', 1),
(101, '2016-04-08 06:10:34', 1),
(102, '2016-04-08 06:12:24', 1),
(103, '2016-04-08 06:14:20', 1),
(104, '2016-04-08 06:16:18', 1),
(105, '2016-04-08 06:18:19', 1),
(106, '2016-04-08 06:20:25', 1),
(107, '2016-04-08 06:22:20', 1),
(108, '2016-04-08 06:24:21', 1),
(109, '2016-04-08 06:26:19', 1),
(110, '2016-04-08 06:28:20', 1),
(111, '2016-04-08 06:30:27', 1),
(112, '2016-04-08 06:32:21', 1),
(113, '2016-04-08 06:34:19', 1),
(114, '2016-04-08 06:36:21', 1),
(115, '2016-04-08 06:38:19', 1),
(116, '2016-04-08 06:40:25', 1),
(117, '2016-04-08 06:42:21', 1),
(118, '2016-04-08 06:44:21', 1),
(119, '2016-04-08 06:46:18', 1),
(120, '2016-04-08 06:48:21', 1),
(121, '2016-04-08 06:50:24', 1),
(122, '2016-04-08 06:52:20', 1),
(123, '2016-04-08 06:54:19', 1),
(124, '2016-04-08 06:56:19', 1),
(125, '2016-04-08 06:58:20', 1),
(126, '2016-04-08 07:00:29', 1),
(127, '2016-04-08 07:02:20', 1),
(128, '2016-04-08 07:04:18', 1),
(129, '2016-04-08 07:06:22', 1),
(130, '2016-04-08 07:08:21', 1),
(131, '2016-04-08 07:10:53', 1),
(132, '2016-04-08 07:12:31', 1),
(133, '2016-04-08 07:14:19', 1),
(134, '2016-04-08 07:16:20', 1),
(135, '2016-04-08 07:18:21', 1),
(136, '2016-04-08 07:20:25', 1),
(137, '2016-04-08 07:22:24', 1),
(138, '2016-04-08 07:24:23', 1),
(139, '2016-04-08 07:26:19', 1),
(140, '2016-04-08 07:28:21', 1),
(141, '2016-04-08 07:30:29', 1),
(142, '2016-04-08 07:32:20', 1),
(143, '2016-04-08 07:34:22', 1),
(144, '2016-04-08 07:36:21', 1),
(145, '2016-04-08 07:38:20', 1),
(146, '2016-04-08 07:40:26', 1),
(147, '2016-04-08 07:42:23', 1),
(148, '2016-04-08 07:44:22', 1),
(149, '2016-04-08 07:46:19', 1),
(150, '2016-04-08 07:48:21', 1),
(151, '2016-04-08 07:50:25', 1),
(152, '2016-04-08 07:52:21', 1),
(153, '2016-04-08 07:54:20', 1),
(154, '2016-04-08 07:56:19', 1),
(155, '2016-04-08 07:58:20', 1);

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
(1, '(2) Association of Funeral Directors (AFDS)', 'Invalid Form Validation', 'Pls check ss', 'kaiwen12', '2016-04-07 23:24:39', 1, 1, '2016-02-26', 'alexadayandayan'),
(2, 'Full Black Heels [E-Commerce]', 'Form Nav Bar Tpe', 'Typo for "Contract me".', 'kaiwen12', '2016-02-22 17:24:19', 1, 2, '2016-03-02', 'debe2'),
(3, 'Fashmob (E-Commerce)', 'Form Mismatch Requirement', 'Pls check ss', 'kaiwen12', '2016-04-07 23:24:39', 1, 1, '2016-02-26', 'alexadayandayan'),
(4, 'Agape Methodist Church (Template + CMS Integration)', 'Validation Error', 'Error on date input validation', 'kaiwen12', '2016-04-07 23:24:39', 1, 2, '2016-02-27', 'marsd'),
(5, '(2) My Singapore Food [CMS]', 'Deadline404 error on ThaiFood.html on right nav', '404 error on ThaiFood.html on right nav', 'markconderw', '2016-04-07 23:24:39', 1, 2, '2016-03-10', 'bahri_ripplewerkz'),
(6, '(2) My Singapore Food [CMS]', 'Error Messages not clear', 'Client requires more specific error messages for their users. Also, some error messages are not showing', 'markconderw', '2016-04-07 23:24:39', 1, 3, '2016-02-26', 'debe2'),
(7, '(2) Association of Funeral Directors (AFDS)', 'Wordpress plugin out of date,', 'Please update wordpress plugin', 'markconderw', '2016-04-07 23:24:39', 1, 2, '2016-02-26', 'debe2'),
(8, 'SeaCAD [Responsive + CMS + Event Espresso (Training Courses) + E-Commerce]', 'Inventory not updating', 'Inventory not updating, Inventory in the commerce store does not update when it runs out of stock', 'markconderw', '2016-04-07 23:24:39', 1, 1, '2016-04-18', 'chaisiri1'),
(9, '1036liveseafood.com [Design only]', 'Image Transparency', 'Image Transparency, Support for transparent image for project view', 'markconderw', '2016-04-07 23:24:39', 1, 2, '2016-02-28', 'zripplewerkz'),
(10, 'First Energy [CMS]', 'Issue Key', 'New UI makes issue key very hard to select and copy paste', 'markconderw', '2016-02-22 17:30:48', 1, 1, '2016-03-25', 'debe2'),
(11, 'Purely Adoption [CMS]', 'CAPTCHA image link not working', 'CAPTCHA image link not working', 'markconderw', '2016-04-07 23:24:39', 1, 2, '2016-03-29', 'benjo12'),
(12, 'ENVI (eComm)', 'Google Translate API', 'Google Translate API, The api code broke down, Please update. Client needs the translation for website to perform business function', 'markconderw', '2016-04-07 23:24:39', 1, 2, '2016-03-22', 'debe2'),
(13, 'Flave - Vanitytriad [E-Commerce]', 'Image Thumbnail Issue', 'Image Thumbnail Issue, Thumbnail in JPEG break transparency in PNG/GIF', 'markconderw', '2016-02-22 17:33:03', 1, 2, '2016-03-18', 'zripplewerkz'),
(14, 'Agape Methodist Church (Template + CMS Integration)', 'Animation not showing', 'Animation not showing, Home page animation has broke, please check with slicing department before integrating', 'markconderw', '2016-04-07 23:24:39', 1, 1, '2016-04-15', 'marsd'),
(15, 'Fashmob (E-Commerce)', 'API Issue', 'API Issue, AXAA restful API  is  not stable', 'markconderw', '2016-02-22 17:35:34', 1, 2, '2016-04-14', 'pukpik'),
(16, 'Flave - Vanitytriad [E-Commerce]', 'JSON from hotel API', 'Bad JSON data coming back from hotel API', 'markconderw', '2016-04-07 23:24:39', 1, 2, '2016-04-12', 'zripplewerkz'),
(17, 'MINERVA - INTRA', 'Server config issue', 'After 10000 request, server will die', 'markconderw', '2016-04-07 23:24:39', 1, 2, '2016-04-14', 'debe2'),
(18, '(2) Association of Funeral Directors (AFDS)', 'Missing vote count,', 'Up voting counts should be displayed on the side', 'markconderw', '2016-04-07 23:24:39', 1, 2, '2016-02-29', 'pukpik'),
(19, 'Nachuraru [E-Commerce + CMS + Responsive]', 'Discount not showing', 'Customer tried to set discount but the discount is not shown', 'markconderw', '2016-04-07 23:24:39', 1, 2, '2016-03-08', 'roy1'),
(20, 'Full Black Heels [E-Commerce]', 'Inventory mixup', 'SKU and inventory ID does not match', 'markconderw', '2016-02-22 17:53:27', 1, 3, '2016-03-11', 'debe2'),
(21, 'ENVI (eComm)', 'Inventory image', 'Display pic for inventory not showing full size image', 'markconderw', '2016-04-07 23:24:39', 1, 1, '2016-03-19', 'debe2'),
(22, 'HafBox', 'Catalog', 'Catalog upload function not working', 'markconderw', '2016-04-07 23:24:39', 1, 3, '2016-03-17', 'pukpik'),
(23, 'Maven [CMS Integration]', 'Analytics Dashboard', 'Dashboard not displaying latest updates', 'markconderw', '2016-04-07 23:24:39', 1, 3, '2016-03-26', 'marsd'),
(24, '1036liveseafood.com [Design only]', 'Wordpress theme needs update', 'Please update wordpress plugins and themes for client as the old theme has errors in the UI', 'markconderw', '2016-04-07 23:24:39', 1, 3, '2016-03-26', 'zripplewerkz'),
(25, '(2) Association of Funeral Directors (AFDS)', 'Image Transparency', 'Support for transparent image for project view', 'markconderw', '2016-04-07 23:24:39', 1, 1, '2016-03-16', 'debe2'),
(26, 'Branslord [CMS]', 'Unable to login', 'Client is unable to login into the system, password that are reset will still be wrong.', 'kaiwen12', '2016-04-08 01:31:38', 0, 2, '2016-04-11', 'chaisiri1'),
(27, '25 HOURS TIME INTERNATIONAL PTE LTD', 'Manage User page issue', '-', 'kaiwen12', '2016-04-08 02:24:23', 0, 2, '2018-12-12', 'bahri_ripplewerkz'),
(28, 'Procter and Gamble', 'Client unhappy with login', '4', 'kaiwen12', '2016-04-08 04:08:51', 0, 3, '2020-12-12', 'roy1'),
(29, 'Procter and Gamble', 'checkout function issue', '3', 'kaiwen12', '2016-04-08 04:09:18', 0, 3, '2020-02-02', 'roy1'),
(30, 'TAHAN CAPITAL MANAGEMENT PTE LTD', 'login', '-', 'kaiwen12', '2016-04-08 04:09:52', 0, 2, '2020-12-02', 'marsd'),
(32, 'TAHAN CAPITAL MANAGEMENT PTE LTD', 'transaction issue', '3', 'kaiwen12', '2016-04-08 04:11:59', 0, 2, '2020-05-03', 'marsd'),
(33, 'TAG TEAM INC. PTE LTD', 'transaction issue', '-', 'kaiwen12', '2016-04-08 05:14:45', 0, 3, '2019-03-05', 'lesterjester'),
(34, 'TAG TEAM INC. PTE LTD', 'final submission page issue', '-', 'kaiwen12', '2016-04-08 05:16:07', 0, 1, '2017-05-03', 'lesterjester'),
(35, 'Decendents of the Sky [Responsive]', 'Nav Bar needs to have more menu items', 'Add a few more menu items into the nav bar', 'peterripplewerkz', '2016-04-08 05:36:39', 0, 1, '2016-04-11', 'lesterjester'),
(36, 'TaeBak Media [Responsive]', 'UI issues', 'The UI is a bit blur. Please ensure client gets top quality resolution', 'peterripplewerkz', '2016-04-08 06:06:59', 0, 2, '2016-04-28', 'sirachon'),
(37, 'Wolf Pte Ltd [CMS]', 'Logic issue', 'Please check the logic for the CMS', 'peterripplewerkz', '2016-04-08 06:49:55', 0, 2, '2016-04-16', 'debe2');

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
  `dateandtime` datetime DEFAULT NULL,
  `archived` char(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notificationid`, `username`, `notificationtype`, `projectname`, `status`, `dateandtime`, `archived`) VALUES
(1, 'pukpik', 'assignedProject', 'Facebook Virtual', 'F', '2016-04-08 05:12:55', 'T'),
(2, 'lesterjester', 'assignedProject', 'Twitter Blogging', 'F', '2016-04-08 05:14:38', 'T'),
(3, 'pukpik', 'assignedProject', 'Twitter Blogging', 'F', '2016-04-08 05:14:38', 'T'),
(4, 'pukpik', 'assignedProject', 'Starbucks Mobile', 'F', '2016-04-08 05:19:49', 'T'),
(5, 'roy1', 'assignedProject', 'Monster Beverage', 'F', '2016-04-08 05:20:24', 'T'),
(6, 'marsd', 'assignedProject', 'Kraft Foods', 'F', '2016-04-08 05:21:12', 'T'),
(7, 'zripplewerkz', 'assignedProject', 'Petronas Web', 'F', '2016-04-08 05:21:45', 'T'),
(8, 'zripplewerkz', 'assignedProject', 'Liberty Media [3 Page Static]', 'F', '2016-04-08 05:22:52', 'T'),
(9, 'lesterjester', 'assignedProject', 'BA Foods [Responsive]', 'F', '2016-04-08 05:23:25', 'T'),
(10, 'ballalist', 'assignedProject', 'BA Foods [Responsive]', 'F', '2016-04-08 05:23:25', 'T'),
(11, 'marsd', 'assignedProject', 'Hubort Management [CMS + Responsive]', 'F', '2016-04-08 05:23:59', 'T'),
(12, 'ballalist', 'assignedProject', 'Hubort Management [CMS + Responsive]', 'F', '2016-04-08 05:23:59', 'T'),
(13, 'marsd', 'assignedProject', 'Hubort Management [CMS + Responsive]', 'F', '2016-04-08 05:26:01', 'T'),
(14, 'ballalist', 'assignedProject', 'Hubort Management [CMS + Responsive]', 'F', '2016-04-08 05:26:01', 'T'),
(15, 'lesterjester', 'assignedProject', 'Hubort Management [CMS + Responsive]', 'F', '2016-04-08 05:26:07', 'T'),
(16, 'marsd', 'assignedProject', 'Hubort Management [CMS + Responsive]', 'F', '2016-04-08 05:26:07', 'T'),
(17, 'lesterjester', 'assignedProject', 'Branslord [CMS]', 'F', '2016-04-08 05:30:07', 'T'),
(18, 'pukpik', 'assignedProject', 'Branslord [CMS]', 'F', '2016-04-08 05:30:07', 'T'),
(19, 'sirachon', 'assignedProject', 'Branslord [CMS]', 'F', '2016-04-08 05:30:07', 'T'),
(20, 'chaisiri1', 'assignedDefect26', 'Branslord [CMS]', 'F', '2016-04-08 05:31:38', 'T'),
(21, 'roy1', 'assignedProject', 'Procter and Gamble', 'F', '2016-04-08 06:11:31', 'T'),
(22, 'lesterjester', 'assignedProject', '25 HOURS TIME INTERNATIONAL PTE LTD', 'F', '2016-04-08 06:12:35', 'T'),
(23, 'pukpik', 'assignedProject', '25 HOURS TIME INTERNATIONAL PTE LTD', 'F', '2016-04-08 06:12:35', 'T'),
(24, 'roy1', 'assignedProject', '3 DEGREES ASSET MANAGEMENT PTE LTD', 'F', '2016-04-08 06:13:27', 'T'),
(25, 'lesterjester', 'assignedProject', '3 DEGREES ASSET MANAGEMENT PTE LTD', 'F', '2016-04-08 06:13:27', 'T'),
(26, 'pukpik', 'assignedProject', '3 DEGREES HOSPITALITY PTE LTD', 'F', '2016-04-08 06:14:24', 'T'),
(28, 'lesterjester', 'assignedProject', 'L-Intelligent Eduhub Pte. Ltd', 'F', '2016-04-08 06:16:11', 'T'),
(29, 'zripplewerkz', 'assignedProject', 'L.D. WAXSON (S) PTE LTD', 'F', '2016-04-08 06:16:56', 'T'),
(30, 'lesterjester', 'assignedProject', 'TAG TEAM INC. PTE LTD', 'F', '2016-04-08 06:17:19', 'T'),
(31, 'pukpik', 'assignedProject', 'TAGIT PTE LTD', 'F', '2016-04-08 06:17:49', 'T'),
(32, 'marsd', 'assignedProject', 'TAHAN CAPITAL MANAGEMENT PTE LTD', 'F', '2016-04-08 06:18:15', 'T'),
(33, 'bahri_ripplewerkz', 'assignedDefect27', '25 HOURS TIME INTERNATIONAL PTE LTD', 'F', '2016-04-08 06:24:23', 'T'),
(34, 'roy1', 'assignedDefect28', 'Procter and Gamble', 'F', '2016-04-08 08:08:51', 'T'),
(35, 'roy1', 'assignedDefect29', 'Procter and Gamble', 'F', '2016-04-08 08:09:18', 'T'),
(36, 'marsd', 'assignedDefect30', 'TAHAN CAPITAL MANAGEMENT PTE LTD', 'F', '2016-04-08 08:09:52', 'T'),
(38, 'marsd', 'assignedDefect32', 'TAHAN CAPITAL MANAGEMENT PTE LTD', 'F', '2016-04-08 08:11:59', 'T'),
(39, 'lesterjester', 'assignedDefect33', 'TAG TEAM INC. PTE LTD', 'F', '2016-04-08 09:14:45', 'T'),
(40, 'lesterjester', 'assignedDefect34', 'TAG TEAM INC. PTE LTD', 'F', '2016-04-08 09:16:07', 'T'),
(41, 'lesterjester', 'assignedProject', 'Decendents of the Sky [Responsive]', 'F', '2016-04-08 09:35:06', 'T'),
(42, 'pukpik', 'assignedProject', 'Decendents of the Sky [Responsive]', 'F', '2016-04-08 09:35:06', 'T'),
(43, 'lesterjester', 'assignedDefect35', 'Decendents of the Sky [Responsive]', 'F', '2016-04-08 09:36:39', 'T'),
(44, 'debe2', 'assignedProject', 'Wolf Pte Ltd [CMS]', 'F', '2016-04-08 09:38:41', 'T'),
(45, 'lesterjester', 'assignedProject', 'Piccolo Pottery Co. (CMS + Responsive + Parallax)', 'F', '2016-04-08 09:41:16', 'T'),
(46, 'ballalist', 'assignedProject', 'Big Beauty Boss Pte Ltd [Static + HTML + Responsive + CMS]', 'F', '2016-04-08 09:49:05', 'T'),
(47, 'pukpik', 'assignedProject', 'Snoopy Electric Components [CMS + Responsive]', 'F', '2016-04-08 09:53:14', 'T'),
(48, 'zripplewerkz', 'assignedProject', 'Doves Supplies [E-commerce + CMS + responsive]', 'F', '2016-04-08 09:54:50', 'T'),
(49, 'zripplewerkz', 'assignedProject', 'Doves Supplies [E-commerce + CMS + responsive]', 'F', '2016-04-08 09:55:03', 'T'),
(50, 'zripplewerkz', 'assignedProject', 'Urk Market Supllies [E-commerce]', 'F', '2016-04-08 09:57:41', 'T'),
(51, 'sirachon', 'assignedProject', 'TaeBak Media [Responsive]', 'F', '2016-04-08 09:59:09', 'T'),
(52, 'lesterjester', 'assignedProject', 'Pluto Fried Rice [CMS]', 'F', '2016-04-08 10:01:37', 'T'),
(53, 'roy1', 'assignedProject', 'North Star Engineering [E-commerce + Responsive]', 'F', '2016-04-08 10:02:51', 'T'),
(54, 'sirachon', 'assignedDefect36', 'TaeBak Media [Responsive]', 'F', '2016-04-08 10:06:59', 'T'),
(55, 'debe2', 'assignedDefect37', 'Wolf Pte Ltd [CMS]', 'F', '2016-04-08 10:49:55', 'T'),
(56, 'roy1', 'assignedProject', 'Mars Bar Pte Ltd [CMS]', 'F', '2016-04-08 12:25:18', 'T'),
(57, 'lesterjester', 'assignedProject', 'Hopscotch Bar [E-commerce]', 'F', '2016-04-08 12:26:19', 'T'),
(58, 'pukpik', 'assignedProject', 'Hopscotch Bar [E-commerce]', 'F', '2016-04-08 12:26:19', 'T'),
(59, 'pukpik', 'assignedProject', 'Kim Keat Hokkiean Mee [CMS]', 'F', '2016-04-08 12:27:04', 'T'),
(60, 'lesterjester', 'assignedProject', 'AtonHouse Kindergarten [CMS + Responsive]', 'F', '2016-04-09 02:30:39', 'T');

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
('(1) Klarity', '56b175985eaeb240978870f8', '', 'lionelchin', '2015-07-31', 2, 1, 'wordpress', 30, NULL),
('(2) Association of Funeral Directors (AFDS)', '56b175985eaeb24097886f87', 'Project Type: CMS w/ Responsive Design and Members Login module\r\nDesigner:\r\nDeveloper:\r\nURL: \r\nPDC:\r\nClie', 'markconderw', '2015-07-27', 0, 1, 'ecommerce', 20, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886f87/x/257ed62625fb711f2340ca46de9dab6f/AFD_Logo.ai'),
('(2) My Singapore Food [CMS]', '56b175985eaeb24097886f2a', 'community page \r\n- Only contribute by Singapore Home Cooks (Top 100 recipe out of their current 1000+', 'markconderw', '2015-07-27', 1, 1, 'wordpress', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886f2a/x/851c1d8f6804f116634b524dd4bac830/Main-Logo.png'),
('(8) MegaPOS [CMS + Responsive] - New Design', '56b175985eaeb24097886e6b', 'Revamp of http://www.megapos.com.sg | Please provide 2 concept drafts to client.', 'kaiwen12', '2015-09-25', 1, 1, 'wordpress', 23, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886e6b/x/8b89b603b857b7bb6fba0688f66c5efe/megapos_cover.jpg'),
('(?) PurelyAdoption [eCommence]', '56b175985eaeb24097886f27', '', 'peterripplewerkz', '2016-02-22', 2, 1, 'wordpress', 30, NULL),
('1036liveseafood.com [Design only]', '56b175985eaeb24097886fb2', 'Project Type: Design only (pass PSDs to client once completed)\r\nDesigner:\r\nDeveloper:\r\nURL: http://www.', 'markconderw', '2015-04-21', 1, 1, 'wordpress', 33, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886fb2/x/7cc1efb718adfcd9be23217d5443d279/1036_Live_Seafood.png'),
('25 HOURS TIME INTERNATIONAL PTE LTD', '5707831afcda1b280dac9614', '', 'kaiwen12', '2016-04-08', 0, 1, 'wordpress', 12, NULL),
('3 DEGREES ASSET MANAGEMENT PTE LTD', '570783213e3c8a82fef4d57a', '', 'kaiwen12', '2016-04-08', 1, 0, 'wordpress', 3, NULL),
('3 DEGREES HOSPITALITY PTE LTD', '57078328a176a3a0bbadfc85', '', 'kaiwen12', '2016-04-08', 0, 0, 'wordpress', 3, NULL),
('Abex Engineering [non-responsive CMS]', '56b175985eaeb24097886f5f', 'Project Type: Revamp + CMS (non-responsive)\r\nDesigner: \r\nDeveloper:\r\nURL: http://ww1.abex-engrg.com/ (c', 'markconderw', '2016-02-22', 1, 1, 'custom', 34, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886f5f/x/8535033b76aaf8d31d1560f7649414df/Abex_logo.png'),
('Agape 2', '56cbb80638904904311d6333', '', 'peterripplewerkz', '2016-04-06', 2, 0, 'wordpress', 30, 'https://trello-attachments.s3.amazonaws.com/56cbb80638904904311d6333/317x249/5d7638a2378ea4ca388a68a0b3d6083e/upload_2_23_2016_at_9_38_58_AM.png'),
('Agape Methodist Church (Template + CMS Integration)', '56b175985eaeb24097887005', 'Project Type: Template Design + CMS Integration\r\nTemplate (chosen by client): http://themeforest.net/', 'markconderw', '2016-02-22', 1, 1, 'custom', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097887005/x/b5e3ed17e11074975b6227740f1f1ca2/Agape_Logo.png'),
('All That Jazz [CMS]', '56b175985eaeb24097886efc', 'Project Type: CMS (Responsive Site)\r\nDesigner: Simin\r\nDeveloper:\r\nURL: http://allthatjazz.com.sg (curre', 'markconderw', '2015-08-09', 1, 1, 'wordpress', 36, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886efc/x/150e3e57a1bd1ef79ba28adc15baf3b7/All_That_Jazz_logo.png'),
('AtonHouse Kindergarten [CMS + Responsive]', '5707d966b5ef2e3824c4cd7f', '', 'lionelchin', '2016-04-09', 1, 0, 'custom', 15, NULL),
('BA Foods [Responsive]', '5707756f32320475b78ce858', '', 'kaiwen12', '2016-04-08', 0, 0, 'custom', 22, NULL),
('Big Beauty Boss Pte Ltd [Static + HTML + Responsive + CMS]', '5707a9f994dd1a44f50508f5', '', 'peterripplewerkz', '2016-06-20', 0, 0, 'custom', 20, 'https://trello-attachments.s3.amazonaws.com/5707a9f994dd1a44f50508f5/800x450/ff8ebd037d14918050358302b9860560/upload_4_8_2016_at_9_05_22_PM.png'),
('Bottles & Bone [CMS and Responsive]', '56b175995eaeb240978871e2', '', 'peterripplewerkz', '2016-04-08', 2, 0, 'wordpress', 30, NULL),
('Branslord [CMS]', '57077590a9fa89e304dc7006', '', 'kaiwen12', '2016-04-08', 0, 0, 'wordpress', 22, NULL),
('Broco Kitchen (Static HTML)', '56b175985eaeb24097886e63', 'Project Type: Static HTML\nDesigner: -\nDeveloper:\nURL: http://brocokitchen.com (current website)\nPDC:\nClient''s Name: Peggy\nClient''s Contact Email: peggy@morrisschaefer.com / morrisschaefer88@gmail.com\nClient''s Contact Number: 6285 0056\n\n---\n\nCD with all images will be provided.\n\n---\n\n\nReferences:\nwww.ernestomeda.com\nwww.poggenpohl.com\nwww.boffi.com\n ', 'markconderw', '2015-09-25', 2, 0, 'wordpress', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886e63/x/250bedbb25ecfdf1e438cf88fe18695a/Broco_Kitchen_logo.png'),
('CE Engineering [CMS]', '56b175995eaeb24097887163', '', 'lionelchin', '2016-02-22', 2, 1, 'wordpress', 30, NULL),
('CIMS', '56b175985eaeb24097887126', '', 'lionelchin', '2016-02-22', 2, 1, 'wordpress', 30, NULL),
('Claymore Mall', '56b175985eaeb24097887103', '', 'kaiwen12', '2015-08-06', 2, 1, 'ecommerce', 30, NULL),
('Collate Mobile', '56b175985eaeb24097887102', '', 'lionelchin', '2016-02-22', 2, 1, 'wordpress', 30, NULL),
('Concorde Security [CMS + Responsive]', '56b175995eaeb2409788714a', 'Project Type: CMS + Responsive\nDesigner: -\nDeveloper:\nURL: http://concorde.com.sg (current website) \nPDC:\nClient''s Name: Sarah\nClient''s Contact Email: \nClient''s Contact Number:  \n\n---\n\nClient is in the technological integrations business, specifically security and monitoring systems. The website must be able to translate trust, professionalism and sense of security to users. \n\nNote: 2 concept drafts for Home page is required. Refer to the references below\n\nImages link\n\nhttps://drive.google.com/folderview?id=0B8cNZhWAd_ElcDdYVkNkSFM2eFE&usp=sharing', 'markconderw', '2016-02-22', 2, 1, 'wordpress', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175995eaeb2409788714a/x/941f10dba35b3eb2410563f6e511b9aa/Concorde_Security_logo.png'),
('Decendents of the Sky [Responsive]', '5707a98c1c93954ffb7c1a27', 'Military Information shop', 'peterripplewerkz', '2016-05-12', 0, 0, 'wordpress', 12, 'https://trello-attachments.s3.amazonaws.com/5707a98c1c93954ffb7c1a27/780x520/c3f31734fa5818e4baa75928539d4181/upload_4_8_2016_at_9_01_36_PM.png'),
('Doves Supplies [E-commerce + CMS + responsive]', '5707aa45e39799400187762d', '', 'peterripplewerkz', '2016-08-23', 0, 0, 'ecommerce', 40, 'https://trello-attachments.s3.amazonaws.com/5707aa45e39799400187762d/400x320/c203ba816dbceaadbce6aacb9a271b21/upload_4_8_2016_at_9_06_36_PM.png'),
('Eastern Holiday Singapore', '56b175985eaeb24097886f96', 'contact no. \n6534 6168\n\nHP:91996133', 'peterripplewerkz', '2016-02-22', 2, 1, 'wordpress', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886f96/x/55e5dea9d83f59e347af44de9b9cae64/Official_Quotation_for_Mrs_Yang1.pdf'),
('ENVI (eComm)', '56b175975eaeb24097886cf4', '', 'markconderw', '2016-02-23', 1, 1, 'ecommerce', 32, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175975eaeb24097886cf4/x/5b113e076a997d096253ca1b085a52c7/envi_trello_coverphoto.jpg'),
('Eye Trendy Responsive', '56b175995eaeb240978871ea', '', 'peterripplewerkz', '2016-02-22', 2, 1, 'custom', 30, NULL),
('Facebook Virtual', '57077504ad70d033dc47cdd7', '', 'kaiwen12', '2016-04-08', 0, 0, 'wordpress', 25, NULL),
('Fashmob (E-Commerce)', '56b175985eaeb24097886f49', 'Project Type: E-Commerce (Revamp) w/ Responsive and Gift Card module\r\nDesigner:\r\nDeveloper:\r\nURL: http:', 'markconderw', '2015-04-03', 1, 1, 'wordpress', 12, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886f49/x/70ebd29adef3cee110243a35efc179f9/FASHMOB_Logo.png'),
('Fevrier Designs', '56b175985eaeb24097887101', '', 'kaiwen12', '2016-02-22', 2, 1, 'wordpress', 30, NULL),
('Fevrier Designs [Add ons]', '56b175985eaeb2409788710d', 'Website: http://www.fevrierdesigns.com\nPDC: https://docs.google.com/spreadsheets/d/1x5o2IVUzVxhjddsH7wcwlpS6LyV_dLS0azC3J4oaGlQ/edit?usp=drive_web', 'kaiwen12', '2016-02-22', 2, 1, 'custom', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb2409788710d/x/45a399b5b9c0e55b389707ba75ebbf99/change1.jpg'),
('First Energy [CMS]', '56b175975eaeb24097886ce0', 'Integration Document: https://docs.google.com/document/d/1nex1rKS4g6QLf19BdepETUvZUG34MI2Mc1n6o5n5xU', 'markconderw', '2014-10-24', 1, 1, 'ecommerce', 17, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175975eaeb24097886ce0/x/8b6a0149eed2a9a8e2ad9c407728f812/First_Energy_Project_Brief.pdf'),
('Flave - Vanitytriad [E-Commerce]', '56b175985eaeb24097886d08', 'Project Type: E-Commerce\r\nDesigner:\r\nDeveloper:\r\nURL: \r\nPDC:\r\nClient', 'markconderw', '2015-08-05', 0, 1, 'wordpress', 17, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886d08/x/95d0f1c50f0c80297e6ae0d8a1095d97/Shau_Fun_(Project_Brief).pdf'),
('Full Black Heels [E-Commerce]', '56b175975eaeb24097886c6b', '', 'markconderw', '2016-02-23', 1, 1, 'ecommerce', 32, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175975eaeb24097886c6b/x/6d1b700e4dd9f97d8137c275ab8002ca/Project_Brief.pdf'),
('Gadgets Glossary', '56b175985eaeb24097886e12', '', 'markconderw', '2015-08-31', 2, 1, 'wordpress', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886e12/x/1aa0de50bfc2cb48e0da46504cf8eaca/gadgetsglossary29juneforbossdebe_(2).docx'),
('GAT [CMS + Responsive]', '56b175985eaeb24097886e6e', 'Project Type: CMS + Responsive\r\nDesigner: -\r\nDeveloper:\r\nURL: -\r\nPDC:\r\nClient', 'markconderw', '2016-02-23', 0, 1, 'wordpress', 23, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886e6e/x/7bf74d24cbbe8ba16f3c31d71e185dd9/Google_Map_example_(pin_w__details).png'),
('Grapevine (Custom + Responsive + Logo)', '56b175985eaeb24097886dec', 'Project Type: Custom + Responsive + Logo\nDesigner: Sandy\nDeveloper:\nURL:\nPDC:\nClient''s Name: Jian Rong\nClient''s Contact Email: \nClient''s Contact Number: 9296 3735', 'markconderw', '2016-02-22', 2, 1, 'custom', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886dec/x/0328c4d54805e59d2188a85b3f336c3f/Timeline_for_LNF_Services_(V2).pdf'),
('Great Skin FX', '56b175985eaeb240978870f7', '', 'lionelchin', '2016-02-22', 2, 1, 'wordpress', 30, NULL),
('Green Waste Recycling [CMS + Responsive]', '56b175995eaeb24097887187', 'Project Type: CMS + Responsive \r\nDesigner: -\r\nDeveloper:\r\nURL: \r\nPDC:\r\nClient', 'markconderw', '2016-02-23', 0, 1, 'wordpress', 23, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175995eaeb24097887187/x/30576844c363e636e64526320d603877/Logos_PSDs.zip'),
('HafBox', '56b175985eaeb24097886fdb', 'Eugenia Yeo (Mrs) |\r\nHaf Box Pte Ltd\r\nT +65 6235 4560 | M +65 9627 8079\r\n\r\nurl: http://inspiramedia.com/', 'markconderw', '2015-08-27', 0, 1, 'wordpress', 43, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886fdb/x/5a49f632f985f42e5933bffef5c57d14/store_logo.png'),
('Hopscotch Bar [E-commerce]', '5707d3d9b6723f404975b6e4', '', 'lionelchin', '2016-04-11', 0, 1, 'wordpress', 40, NULL),
('Hubb Records Butler', '56f7eb5648f99c0d3abfe454', '', 'kaiwen12', '2016-04-08', 2, 0, 'wordpress', 30, NULL),
('Hubort Management [CMS + Responsive]', '57077582590bc5faf0d46d4e', '', 'kaiwen12', '2016-04-08', 0, 0, 'custom', 30, NULL),
('Innovez One [CMS + Responsive]', '56b175995eaeb24097887170', 'Project Type: CMS + Responsive\r\nDesigner: -\r\nDeveloper:\r\nURL: http://innovez-one.com (current website) ', 'markconderw', '2016-02-23', 0, 1, 'wordpress', 20, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175995eaeb24097887170/x/77e831e4343e094872a0c29356c50231/innovez_logo.png'),
('Jemsa Multistore', '56b175985eaeb240978870fd', '', 'lionelchin', '2016-02-22', 2, 1, 'wordpress', 30, NULL),
('JMT Leather [CMS]', '56b175975eaeb24097886c58', 'Website revamp: http://www.jmtleather.com/en/\r\nTarget Audience: Architects/Interior Designers\r\n\r\n------', 'markconderw', '2016-02-22', 1, 1, 'wordpress', 20, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175975eaeb24097886c58/x/a2177219e40ebfcdf91a2b2dce1e9e7b/JMT_Logo.png'),
('Kajima Overseas Asia (CMS)', '56b175975eaeb24097886bf5', 'To help you better understand the flowchart:\n\n- Blue represents what we are currently working on (which is now put on-hold because of the new website structure)\n- Grey highlights the connecting sites (which we refer to as a multi-site installation)\n- Orange highlights the individual CMS system setup for Construction, Development and Design sections\n- Green highlights shared control for Project Gallery (for Construction site)\n- Yellow highlights shared control for Project Gallery (for Development site)\n- Purple highlights separate CMS control for the respective Admin for HR and News\n', 'markconderw', '2016-02-22', 2, 1, 'wordpress', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175975eaeb24097886bf5/x/baf23fa4575cf6a8e3afad09d202296c/kajima_trello_coverphoto.jpg'),
('Kantar Media (DTAM) [CMS + Responsive]', '56b175985eaeb24097886ed9', 'Project Type: CMS + Responsive + Custom Plugin\nDesigner: -\nDeveloper: -\nURL: -\nPDC: -\nClient''s Name: Darick Loo / Steven Lau \nClient''s Contact Email: Darick.loo@kantarmedia.com / Steven.lau@kantarmedia.com\nClient''s Contact Number:  6634 6310 / 9745 1058\n\n67 Ubi Avenue 1\n06-04 StarHub Green\nSingapore 408942\n\n---\n\n2nd draft by 14 July 2015 ( Before noon ) \nThurs (Friday - Before Noon) - HTML \n\n\nSliced version: \nhttp://inspiramedia.com/anthony/dynamic_tam/\nhttp://inspiramedia.com/anthony/dynamic_tam/about_us.html\nhttp://inspiramedia.com/anthony/dynamic_tam/faq.html\nhttp://inspiramedia.com/anthony/dynamic_tam/coming_soon.html\nhttp://inspiramedia.com/anthony/dynamic_tam/toturials.html\n\n\nGoogle Drive : \nhttps://drive.google.com/folderview?id=0B6fia60qRAkwblVNWUVXVkpGLUU&usp=sharing\n\nsite : http://www.dtammalaysia.com/\n\n\nMailchimp: Please login with the following credentials:\nUsername: dtamsupport\nPassword: Jycp4@kantar', 'peterripplewerkz', '2015-07-27', 2, 1, 'wordpress', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886ed9/x/857835593531de4781d3f17bda80c41a/DTAM_V3_Light_Mockups.zip'),
('KHG Collections', '56b175985eaeb24097886d8b', '', 'markconderw', '2016-02-23', 1, 1, 'wordpress', 12, NULL),
('Kim Keat Hokkiean Mee [CMS]', '5707d5f6504e004a46b47e23', '', 'lionelchin', '2016-04-20', 1, 0, 'wordpress', 27, 'https://trello-attachments.s3.amazonaws.com/5707d5f6504e004a46b47e23/640x640/772edf149ceb71cbce00fbceea939850/hokkiean_mee.jpg'),
('Kraft Foods', '570775539bb4b2ec02209647', '', 'kaiwen12', '2016-04-08', 0, 0, 'custom', 23, NULL),
('L''OREAL Singapore', '5707832d840baff7fa6111d6', '', 'kaiwen12', '2016-04-08', 2, 0, 'wordpress', 30, NULL),
('L-Intelligent Eduhub Pte. Ltd', '5707833222cf4e2cbb86f1a4', '', 'kaiwen12', '2016-04-08', 0, 0, 'custom', 15, NULL),
('L.D. WAXSON (S) PTE LTD', '57078336fda892c666ffa3a6', '', 'kaiwen12', '2016-04-08', 0, 0, 'ecommerce', 17, NULL),
('LBK', '56b175985eaeb24097886dc7', 'Mobile development is on hold to prioritise fixing the issues in the issue list\n\nIssue List:  [Click here](https://docs.google.com/spreadsheets/d/1njoHa_MxU-M0KQrR9BK1fKHY6pvAkXGWbxArBSuEt7s/edit#gid=0)\n\nPDC: [Click here](https://docs.google.com/spreadsheet/ccc?key=0AkIGnNSUYxyndFB5QnJoVWR3MGoyeWV2WXhIMjVoOHc&usp=sharing)', 'markconderw', '2016-02-22', 2, 1, 'wordpress', 30, NULL),
('Liberty Media [3 Page Static]', '570775651ad8b6ac7ca809e9', '', 'kaiwen12', '2016-04-08', 0, 0, 'ecommerce', 23, NULL),
('Lifebuilders', '56b175995eaeb240978871e3', 'Current site : nope\nTemplate : creativo - 5-0-ultra - responsive\n\nJust change the code , make use of the HTML pages to re-integrate the project.\n\n\nhttps://docs.google.com/document/d/1oIZLkT6G2iGOx5f-sKji1hIKBz1NW7s4h2oYisz4hxA/edit', 'markconderw', '2016-04-14', 2, 0, 'wordpress', 30, NULL),
('Mars Bar Pte Ltd [CMS]', '5707d2bdbab487fcf0aa2013', '', 'lionelchin', '2016-04-10', 1, 1, 'wordpress', 20, 'https://trello-attachments.s3.amazonaws.com/5707d2bdbab487fcf0aa2013/225x238/f73042bf0c9a2361b8dbde94ed9d1861/photo_2016-04-08_23-53-49.jpg'),
('Maven [CMS Integration]', '56b175985eaeb24097886fc3', 'CMS integration only. Designs will be provided by the client in PSD format. Please note that there i', 'markconderw', '2015-03-31', 0, 1, 'custom', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886fc3/x/2090eb8009a3599b143773826650480b/Maven_Project_Brief.pdf'),
('MINERVA - INTRA', '56b175985eaeb24097886ec0', '+656848 5155\r\n\r\nHp: \r\n98636095\r\n\r\nResponsive website\r\n\r\n2 Mockup for Homepage\r\n\r\nallow print page \r\n\r\nSEO frien', 'markconderw', '2015-09-23', 0, 1, 'ecommerce', 17, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886ec0/x/02eda8e2d6d77874316415d33f7c28c3/logo.png'),
('Monster Beverage', '570775474cd5a7d7fe73628e', '', 'kaiwen12', '2016-04-08', 0, 0, 'wordpress', 33, NULL),
('Mothership Can or Not', '56b175985eaeb240978870ff', '', 'lionelchin', '2015-07-17', 2, 1, 'wordpress', 30, NULL),
('Mothership Mobile App', '56b175985eaeb240978870f6', '', 'kaiwen12', '2016-02-22', 2, 1, 'wordpress', 30, NULL),
('My Drum School - Responsive', '56b175985eaeb24097886e7b', 'Site Test Account: Lionel / R1ppl3!!', 'kaiwen12', '2016-02-22', 1, 1, 'wordpress', 21, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886e7b/x/64be301dbd31da73393687e0c8768a6a/mds-logo.png'),
('Nachuraru [E-Commerce + CMS + Responsive]', '56b175985eaeb24097886e81', 'Project Type: E-Commerce + CMS (Responsive Site)\r\nDesigner: Simin\r\nDeveloper:\r\nURL: \r\nPDC:\r\nClient', 'markconderw', '2015-08-04', 0, 1, 'ecommerce', 21, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886e81/x/3b68df07ed6689502e7e5d9e73d7c05f/Nachuraru_Project_Brief.pdf'),
('North Star Engineering [E-commerce + Responsive]', '5707ab63b246e35b15fbdc89', '', 'peterripplewerkz', '2016-08-10', 0, 0, 'ecommerce', 12, 'https://trello-attachments.s3.amazonaws.com/5707ab63b246e35b15fbdc89/500x500/3d15b14c7e0dcc9aa6b26f73e7e2d535/upload_4_8_2016_at_9_09_09_PM.png'),
('Pacific Conferences', '56e41b489a44c1e195aeea8c', '', 'kaiwen12', '2016-04-08', 2, 0, 'wordpress', 30, NULL),
('Petronas Web', '57077559ab49892a030499de', '', 'kaiwen12', '2016-04-08', 0, 0, 'ecommerce', 31, NULL),
('Piccolo Pottery Co. (CMS + Responsive + Parallax)', '5707a9c2080ecf0524d635d0', '', 'peterripplewerkz', '2016-06-22', 1, 0, 'custom', 26, 'https://trello-attachments.s3.amazonaws.com/5707a9c2080ecf0524d635d0/720x480/0244a6bc186ae5b1748e022cf6e016ff/upload_4_8_2016_at_9_03_21_PM.png'),
('pleasework2', '56cf460242791c4be98870d2', '', 'kaiwen12', '2016-04-08', 2, 1, 'wordpress', 30, NULL),
('Pluto Fried Rice [CMS]', '5707ab5027afec5ebba5436e', '', 'peterripplewerkz', '2016-08-18', 0, 0, 'wordpress', 35, 'https://trello-attachments.s3.amazonaws.com/5707ab5027afec5ebba5436e/600x338/b847f45d9182666bf1c6cab5405878ed/upload_4_8_2016_at_9_08_42_PM.png'),
('Procter and Gamble', '57078148a4fdf4df23aa5b2a', '', 'kaiwen12', '2016-04-08', 0, 0, 'ecommerce', 23, NULL),
('Purely Adoption [CMS]', '56b175985eaeb24097886f1e', 'http://www.spca.org.sg/\r\n\r\nTemplate : http://www.templatemonster.com/demo/52176.html\r\n\r\nhttps://www.drop', 'markconderw', '2015-09-25', 1, 1, 'wordpress', 23, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886f1e/x/66f9811934f5a39085c3f26db114d813/logo.jpg'),
('Renaissance Design Group [CMS]', '56b175975eaeb24097886c5d', 'Revamp http://www.renaidesigngroup.com\r\n\r\n*\r\n\r\n Looking to launch by 3rd week of April. ', 'markconderw', '2016-02-22', 0, 1, 'wordpress', 30, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175975eaeb24097886c5d/x/600d159696c1b23162544e1521e79357/Renaissance_Logo.png'),
('Robert Yam & Co [Logo Tracing + CMS + Responsive]', '56b175995eaeb24097887159', 'Project Type: CMS + Responsive\r\nDesigner: -\r\nDeveloper:\r\nURL: http://robertyamco.com.sg (current websit', 'kaiwen12', '2016-02-23', 1, 1, 'wordpress', 12, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175995eaeb24097887159/x/db895a2f165cc10ab5c71f0d16bde1b8/Robert_Yam__26_Co_logo.png'),
('SeaCAD [Responsive + CMS + Event Espresso (Training Courses) + E-Commerce]', '56b175995eaeb24097887164', 'Project Type: CMS + Responsive + Event Espresso + E-Commerce\r\nDesigner: -\r\nDeveloper:\r\nURL: http://www.', 'markconderw', '2016-02-23', 1, 1, 'ecommerce', 20, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175995eaeb24097887164/x/ea4aa5b60107c0d73fbd25e7a0e3a44b/SEACAD_-_Logo_-_TransparentBg_-_RGB_-_Big.png'),
('Sgwinecellar', '56b175995eaeb24097887138', '', 'markconderw', '2015-09-03', 0, 1, 'wordpress', 23, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175995eaeb24097887138/x/f80f69ac7d26c111f02ef50d76c1c4ec/upload_11_25_2015_at_11_38_07_AM.png'),
('Snoopy Electric Components [CMS + Responsive]', '5707aa24f7599fff790683e9', '', 'peterripplewerkz', '2016-07-21', 0, 0, 'wordpress', 16, 'https://trello-attachments.s3.amazonaws.com/5707aa24f7599fff790683e9/300x300/0e62687a841f9243d9a9ff10c6df074b/upload_4_8_2016_at_9_05_49_PM.png'),
('Starbucks Mobile', '57077532806dd7ebf4792fdf', '', 'kaiwen12', '2016-04-08', 0, 0, 'wordpress', 30, NULL),
('TaeBak Media [Responsive]', '5707aa7ead1b2550b79d5b41', '', 'peterripplewerkz', '2016-08-09', 0, 0, 'wordpress', 12, 'https://trello-attachments.s3.amazonaws.com/5707aa7ead1b2550b79d5b41/452x302/c119d2efc6acd46aae3abb97688ce147/upload_4_8_2016_at_9_08_10_PM.png'),
('TAG TEAM INC. PTE LTD', '5707833ae30ff3bd66946904', '', 'kaiwen12', '2016-04-08', 0, 0, 'wordpress', 32, NULL),
('TAGIT PTE LTD', '57078341e602dea2490b8851', '', 'kaiwen12', '2016-04-08', 1, 0, 'wordpress', 31, NULL),
('TAHAN CAPITAL MANAGEMENT PTE LTD', '5707834a93a5bbcf54003728', '', 'kaiwen12', '2016-04-08', 1, 0, 'wordpress', 5, NULL),
('The Rad Label [E-commerce + Responsive]', '56b175995eaeb2409788717c', 'Project Type: E-Commerce/Responsive\n\nDesigner: Name and @trelloid\n\nDeveloper: Pukpik and Chawin\n\nURL: <If there is a current website, then the url>\n\nPDC: <If there is a PDC created, if not, then PM will create one>\n\nClient''s Name: <Adeline/Ruth>\n\nClient''s Contact Email: <ayla2004@singnet.com.sg/ruthleongnc@gmail.com>\n\nClient''s Contact Number: < 6341 7339/ 82999700>', 'markconderw', '2016-02-22', 2, 1, 'ecommerce', 30, 'https://www.dropbox.com/s/i4w9a85dili46rz/homepage-popupicon.psd?dl=0'),
('Twitter Blogging', '5707752ac9559683bb0cca0b', '', 'kaiwen12', '2016-04-08', 0, 0, 'wordpress', 20, NULL),
('Unseason', '56b175995eaeb24097887136', '', 'kaiwen12', '2016-02-22', 2, 1, 'wordpress', 30, NULL),
('Urk Market Supllies [E-commerce]', '5707aa677b1389410161afdb', '', 'peterripplewerkz', '2016-08-23', 0, 1, 'ecommerce', 29, 'https://trello-attachments.s3.amazonaws.com/5707aa677b1389410161afdb/640x447/4c1f674a599e2a5781d908136c2d5638/upload_4_8_2016_at_9_07_22_PM.png'),
('Vlosophy (eComm)', '56b175975eaeb24097886c26', '', 'markconderw', '2016-02-22', 0, 1, 'custom', 50, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175975eaeb24097886c26/x/d51f278b4edb269c868b24e903a0b5ca/vlsophy_trello_coverphoto.jpg'),
('Wolf Pte Ltd [CMS]', '5707a99b13c2c5bc924b64f7', 'Artic supplies company', 'peterripplewerkz', '2016-06-10', 0, 0, 'wordpress', 12, 'https://trello-attachments.s3.amazonaws.com/5707a99b13c2c5bc924b64f7/620x372/77e6d31bc70a02472d46796fdd49ff16/upload_4_8_2016_at_9_02_36_PM.png'),
('WORKFLOW PRESENTATION 1', '56cac095e38b501bbdda0053', '', 'kaiwen12', '2016-02-22', 2, 1, 'wordpress', 30, 'https://trello-attachments.s3.amazonaws.com/56cac095e38b501bbdda0053/300x300/2fdd16f158eb2d4b7f1d3c9b984dca5a/upload_22_2_2016_at_16_05_52.png'),
('WSTAR', '56b175985eaeb24097886ee4', 'These are the website we send client for sample and they like them:\r\n\r\nhttp://sgwinecellar.com/\r\nhttp:/', 'markconderw', '2016-02-23', 1, 1, 'wordpress', 14, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175985eaeb24097886ee4/x/a36cda414897073dec83d70a9ba958b5/upload_2015-05-12_at_10.18.53_am.png'),
('[Kayamila]', '56b175995eaeb24097887192', '', 'markconderw', '2016-02-23', 0, 1, 'custom', 23, 'https://trello-attachments.s3.amazonaws.com/56b175975eaeb24097886bbc/56b175995eaeb24097887192/x/0a34320f00d1e6c19a4a2c5a1856ff8d/FY1862_WEBSITE_Look_and_Feel.jpg'),
('[SoonChow]', '56b175995eaeb240978871ec', '', 'kaiwen12', '2016-04-08', 2, 0, 'wordpress', 30, NULL);

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
('(2) Association of Funeral Directors (AFDS)', 'debe2', '2016-02-22 12:55:48', '2016-02-08', '2016-04-04', '2016-03-07', '2016-04-04', 1),
('(2) My Singapore Food [CMS]', 'bahri_ripplewerkz', '2016-02-22 12:57:45', '2016-03-24', '2016-05-05', '2016-03-24', NULL, 0),
('1036liveseafood.com [Design only]', 'zripplewerkz', '2016-02-22 12:58:48', '2016-03-14', '2016-04-29', '2016-03-14', '2016-06-14', 1),
('25 HOURS TIME INTERNATIONAL PTE LTD', 'lesterjester', '2016-04-08 02:12:35', '2016-09-12', '2016-11-07', NULL, NULL, 0),
('25 HOURS TIME INTERNATIONAL PTE LTD', 'pukpik', '2016-04-08 02:12:35', '2016-09-18', '2016-11-13', NULL, NULL, 0),
('3 DEGREES ASSET MANAGEMENT PTE LTD', 'lesterjester', '2016-04-08 02:13:27', '2016-07-08', '2016-09-02', NULL, NULL, 0),
('3 DEGREES ASSET MANAGEMENT PTE LTD', 'roy1', '2016-04-08 02:13:27', '2016-07-10', '2016-09-04', NULL, NULL, 0),
('3 DEGREES HOSPITALITY PTE LTD', 'pukpik', '2016-04-08 02:14:24', '2016-05-02', '2016-06-27', NULL, NULL, 0),
('Abex Engineering [non-responsive CMS]', 'lesterjester', '2016-02-22 12:59:52', '2016-03-17', '2016-05-03', '2016-03-17', NULL, 0),
('Agape 2', 'debe2', '2016-04-08 02:52:02', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Agape Methodist Church (Template + CMS Integration)', 'marsd', '2016-02-22 12:56:29', '2016-03-09', '2016-04-20', '2016-03-09', NULL, 0),
('All That Jazz [CMS]', 'pukpik', '2016-02-22 13:05:28', '2016-03-20', '2016-05-09', '2016-03-20', '2016-06-20', 1),
('AtonHouse Kindergarten [CMS + Responsive]', 'lesterjester', '2016-04-08 22:30:39', '2016-02-21', '2016-04-17', '2016-02-21', NULL, 0),
('BA Foods [Responsive]', 'ballalist', '2016-04-08 01:23:25', '2016-03-07', '2016-05-02', '2016-03-07', NULL, 0),
('BA Foods [Responsive]', 'lesterjester', '2016-04-08 01:23:25', '2016-02-05', '2016-04-01', '2016-02-05', NULL, 0),
('Big Beauty Boss Pte Ltd [Static + HTML + Responsive + CMS]', 'ballalist', '2016-04-08 05:49:04', '2016-04-17', '2016-06-12', NULL, NULL, 0),
('Bottles & Bone [CMS and Responsive]', 'debe2', '2016-04-08 02:52:08', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Bottles & Bone [CMS and Responsive]', 'roy1', '2016-04-08 02:52:08', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Branslord [CMS]', 'lesterjester', '2016-04-08 01:30:07', '2015-12-24', '2016-02-18', '2015-12-24', NULL, 0),
('Branslord [CMS]', 'pukpik', '2016-04-08 01:30:07', '2016-01-06', '2016-03-02', '2016-01-06', NULL, 0),
('Branslord [CMS]', 'sirachon', '2016-04-08 01:30:07', '2016-01-18', '2016-03-14', '2016-01-18', NULL, 0),
('Broco Kitchen (Static HTML)', 'debe2', '2016-04-08 02:52:04', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Decendents of the Sky [Responsive]', 'lesterjester', '2016-04-08 05:35:06', '2016-01-23', '2016-03-19', '2016-01-23', NULL, 0),
('Decendents of the Sky [Responsive]', 'pukpik', '2016-04-08 05:35:06', '2016-01-29', '2016-03-25', '2016-01-29', NULL, 0),
('Doves Supplies [E-commerce + CMS + responsive]', 'zripplewerkz', '2016-04-08 05:54:49', '2015-08-16', '2015-10-16', '2015-08-16', NULL, 0),
('Doves Supplies [E-commerce + CMS + responsive]', 'zripplewerkz', '2016-04-08 05:55:02', '2015-08-16', '2015-10-16', '2015-08-16', NULL, 0),
('ENVI (eComm)', 'debe2', '2016-02-22 13:18:51', '2016-04-04', '2016-05-18', '2016-04-04', NULL, 0),
('Facebook Virtual', 'pukpik', '2016-04-08 01:12:55', '2015-12-30', '2016-02-24', '2015-12-30', NULL, 0),
('Fashmob (E-Commerce)', 'pukpik', '2016-02-22 13:06:16', '2016-02-09', '2016-04-05', '2016-03-20', '2016-04-10', 1),
('First Energy [CMS]', 'debe2', '2016-02-22 13:22:43', '2016-03-02', '2016-04-27', '2016-04-04', NULL, 0),
('Flave - Vanitytriad [E-Commerce]', 'zripplewerkz', '2016-02-22 12:54:13', '2016-01-30', '2016-03-26', '2016-03-03', '2016-03-26', 1),
('Full Black Heels [E-Commerce]', 'debe2', '2016-02-22 13:14:50', '2016-02-29', '2016-04-13', '2016-02-29', '2016-05-30', 1),
('Full Black Heels [E-Commerce]', 'debe2', '2016-02-22 13:17:17', '2016-02-29', '2016-04-13', '2016-02-29', '2016-05-30', 1),
('GAT [CMS + Responsive]', 'roy1', '2016-02-22 13:39:53', '2016-03-07', '2016-04-08', '2016-03-07', '2016-06-07', 1),
('Green Waste Recycling [CMS + Responsive]', 'bahri_ripplewerkz', '2016-02-22 13:35:37', '2016-03-07', '2016-04-08', '2016-03-07', '2016-06-07', 1),
('Green Waste Recycling [CMS + Responsive]', 'sirachon', '2016-02-22 13:35:49', '2016-03-06', '2016-04-07', '2016-03-06', '2016-06-06', 1),
('HafBox', 'pukpik', '2016-02-22 13:00:42', '2016-03-19', '2016-05-18', '2016-03-19', NULL, 0),
('Hopscotch Bar [E-commerce]', 'lesterjester', '2016-04-08 08:26:19', '2015-12-02', '2016-01-27', '2015-12-02', NULL, 0),
('Hopscotch Bar [E-commerce]', 'pukpik', '2016-04-08 08:26:19', '2015-12-06', '2016-01-31', '2015-12-06', NULL, 0),
('Hubb Records Butler', 'alexadayandayan', '2016-04-08 02:52:20', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Hubb Records Butler', 'ballalist', '2016-04-08 02:52:20', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Hubb Records Butler', 'chaisiri1', '2016-04-08 02:52:20', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Hubb Records Butler', 'debe2', '2016-04-08 02:52:20', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Hubort Management [CMS + Responsive]', 'ballalist', '2016-04-08 01:23:59', '2016-03-30', '2016-05-25', '2016-03-30', NULL, 0),
('Hubort Management [CMS + Responsive]', 'ballalist', '2016-04-08 01:26:01', '2016-03-30', '2016-05-25', '2016-03-30', NULL, 0),
('Hubort Management [CMS + Responsive]', 'lesterjester', '2016-04-08 01:26:06', '2016-02-01', '2016-03-28', '2016-02-01', NULL, 0),
('Hubort Management [CMS + Responsive]', 'marsd', '2016-04-08 01:23:59', '2016-02-28', '2016-04-24', '2016-02-28', NULL, 0),
('Hubort Management [CMS + Responsive]', 'marsd', '2016-04-08 01:26:01', '2016-02-28', '2016-04-24', '2016-02-28', NULL, 0),
('Hubort Management [CMS + Responsive]', 'marsd', '2016-04-08 01:26:06', '2016-02-28', '2016-04-24', '2016-02-28', NULL, 0),
('Innovez One [CMS + Responsive]', 'vandavedecio', '2016-02-22 13:34:01', '2016-02-07', '2016-04-03', '2016-03-06', '2016-06-06', 1),
('JMT Leather [CMS]', 'vandavedecio', '2016-02-22 12:54:57', '2016-03-04', '2016-04-29', '2016-04-01', NULL, 0),
('KHG Collections', 'marsd', '2016-02-22 13:20:48', '2016-01-12', '2016-03-08', '2016-02-21', '2016-04-08', 1),
('Kim Keat Hokkiean Mee [CMS]', 'pukpik', '2016-04-08 08:27:04', '2015-12-28', '2016-02-22', '2015-12-28', NULL, 0),
('Kraft Foods', 'marsd', '2016-04-08 01:21:12', '2016-02-19', '2016-04-15', '2016-02-19', NULL, 0),
('L-Intelligent Eduhub Pte. Ltd', 'lesterjester', '2016-04-08 02:16:10', '2016-02-19', '2016-04-15', '2016-02-19', NULL, 0),
('L.D. WAXSON (S) PTE LTD', 'zripplewerkz', '2016-04-08 02:16:55', '2015-12-23', '2016-02-17', '2015-12-23', NULL, 0),
('Liberty Media [3 Page Static]', 'zripplewerkz', '2016-04-08 01:22:52', '2015-11-01', '2015-12-27', '2015-11-01', NULL, 0),
('Lifebuilders', 'debe2', '2016-04-08 02:52:03', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Mars Bar Pte Ltd [CMS]', 'roy1', '2016-04-08 08:25:18', '2016-01-21', '2016-03-17', '2016-01-21', NULL, 0),
('Maven [CMS Integration]', 'marsd', '2016-02-22 13:04:38', '2016-02-21', '2016-04-03', '2016-02-21', '2016-04-10', 1),
('MINERVA - INTRA', 'debe2', '2016-02-22 13:03:23', '2016-03-03', '2016-04-28', '2016-04-05', NULL, 0),
('Monster Beverage', 'roy1', '2016-04-08 01:20:24', '2015-12-23', '2016-02-17', '2015-12-23', NULL, 0),
('My Drum School - Responsive', 'bahri_ripplewerkz', '2016-02-22 12:42:29', '2015-11-23', '2016-02-23', '2015-11-23', '2016-02-23', 1),
('Nachuraru [E-Commerce + CMS + Responsive]', 'roy1', '2016-02-22 13:01:25', '2016-02-23', '2016-04-19', '2016-03-21', NULL, 0),
('Nachuraru [E-Commerce + CMS + Responsive]', 'roy1', '2016-02-22 13:01:48', '2016-02-23', '2016-04-19', '2016-03-21', NULL, 0),
('North Star Engineering [E-commerce + Responsive]', 'roy1', '2016-04-08 06:02:50', '2016-02-22', '2016-04-18', '2016-02-22', NULL, 0),
('Pacific Conferences', 'benjo12', '2016-04-08 02:52:18', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Pacific Conferences', 'sirachon', '2016-04-08 02:52:18', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Petronas Web', 'zripplewerkz', '2016-04-08 01:21:45', '2015-09-26', '2015-11-21', '2015-09-26', NULL, 0),
('Piccolo Pottery Co. (CMS + Responsive + Parallax)', 'lesterjester', '2016-04-08 05:41:16', '2016-02-15', '2016-04-11', '2016-02-15', NULL, 0),
('pleasework2', 'john_pajarillo', '2016-04-08 02:52:13', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0),
('Pluto Fried Rice [CMS]', 'lesterjester', '2016-04-08 06:01:36', '2015-12-09', '2016-02-03', '2015-12-09', NULL, 0),
('Procter and Gamble', 'roy1', '2016-04-08 02:11:31', '2017-10-28', '2017-12-23', NULL, NULL, 0),
('Purely Adoption [CMS]', 'benjo12', '2016-02-22 13:14:19', '2016-02-16', '2016-03-19', '2016-02-16', '2016-04-10', 1),
('Renaissance Design Group [CMS]', 'zripplewerkz', '2016-02-22 12:53:15', '2016-03-31', '2016-05-12', '2016-03-31', NULL, 0),
('Robert Yam & Co [Logo Tracing + CMS + Responsive]', 'lesterjester', '2016-02-22 13:31:46', '2016-01-25', '2016-03-21', '2016-03-05', '2016-06-05', 1),
('SeaCAD [Responsive + CMS + Event Espresso (Training Courses) + E-Commerce]', 'zripplewerkz', '2016-02-22 13:41:03', '2016-03-31', '2016-05-26', NULL, NULL, 0),
('Sgwinecellar', 'chaisiri1', '2016-02-22 13:11:03', '2016-04-07', '2016-05-09', '2016-04-07', NULL, 0),
('Sgwinecellar', 'pukpik', '2016-02-22 13:13:06', '2016-02-21', '2016-04-17', '2016-02-21', NULL, 0),
('Snoopy Electric Components [CMS + Responsive]', 'pukpik', '2016-04-08 05:53:14', '2016-01-22', '2016-03-18', '2016-01-22', NULL, 0),
('Starbucks Mobile', 'pukpik', '2016-04-08 01:19:49', '2015-12-23', '2016-02-17', '2015-12-23', NULL, 0),
('TaeBak Media [Responsive]', 'sirachon', '2016-04-08 05:59:09', '2016-01-29', '2016-03-25', '2016-01-29', NULL, 0),
('TAG TEAM INC. PTE LTD', 'lesterjester', '2016-04-08 02:17:18', '2016-04-23', '2016-07-12', NULL, NULL, 0),
('TAGIT PTE LTD', 'pukpik', '2016-04-08 02:17:49', '2016-09-12', '2016-11-07', NULL, NULL, 0),
('TAHAN CAPITAL MANAGEMENT PTE LTD', 'marsd', '2016-04-08 02:18:15', '2016-03-04', '2016-04-29', '2016-03-04', NULL, 0),
('Twitter Blogging', 'lesterjester', '2016-04-08 01:14:38', '2015-12-30', '2016-02-24', '2015-12-30', NULL, 0),
('Twitter Blogging', 'pukpik', '2016-04-08 01:14:38', '2016-01-08', '2016-03-04', '2016-01-08', NULL, 0),
('Urk Market Supllies [E-commerce]', 'zripplewerkz', '2016-04-08 05:57:41', '2015-10-05', '2015-11-30', '2015-10-05', NULL, 0),
('Vlosophy (eComm)', 'ballalist', '2016-02-22 12:52:15', '2016-02-29', '2016-05-09', '2016-02-29', NULL, 0),
('Wolf Pte Ltd [CMS]', 'debe2', '2016-04-08 05:38:41', '2016-02-28', '2016-04-24', '2016-02-28', NULL, 0),
('WSTAR', 'pukpik', '2016-02-22 13:02:41', '2016-02-12', '2016-04-08', '2016-03-20', '2016-04-08', 1),
('[Kayamila]', 'lesterjester', '2016-02-22 13:38:51', '2016-03-22', '2016-04-23', '2016-03-22', '2016-04-22', 1),
('[SoonChow]', 'ballalist', '2016-04-08 02:52:11', '2016-04-09', '2016-05-21', '2016-04-09', NULL, 0);

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
(2, '[[{"username":"bahri_ripplewerkz","nationality":"Indonesia","currentprojectcount":0,"earlieststart":"Feb 23, 2016","estimateworkingday":21,"estimateday":29,"scheduleperformance":1.0,"estimatecompletion":"Mar 23, 2016","idealcompletion":"Mar 23, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Feb 23, 2016","estimateworkingday":21,"estimateday":29,"scheduleperformance":1.0,"estimatecompletion":"Mar 23, 2016","idealcompletion":"Mar 23, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Feb 23, 2016","estimateworkingday":21,"estimateday":29,"scheduleperformance":1.0,"estimatecompletion":"Mar 23, 2016","idealcompletion":"Mar 23, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Feb 23, 2016","estimateworkingday":21,"estimateday":29,"scheduleperformance":1.0,"estimatecompletion":"Mar 23, 2016","idealcompletion":"Mar 23, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', 'My Drum School - Responsive', 1, '2016-02-22 12:42:30'),
(5, '[[{"username":"alexadayandayan","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Feb 25, 2016","estimateworkingday":200,"estimateday":280,"scheduleperformance":1.0,"estimatecompletion":"Dec 1, 2016","idealcompletion":"Dec 1, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Feb 25, 2016","estimateworkingday":200,"estimateday":280,"scheduleperformance":1.0,"estimatecompletion":"Dec 1, 2016","idealcompletion":"Dec 1, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Feb 25, 2016","estimateworkingday":200,"estimateday":280,"scheduleperformance":1.0,"estimatecompletion":"Dec 1, 2016","idealcompletion":"Dec 1, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Feb 25, 2016","estimateworkingday":200,"estimateday":280,"scheduleperformance":1.0,"estimatecompletion":"Dec 1, 2016","idealcompletion":"Dec 1, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', 'Jurlesquez (eComm)', 1, '2016-02-22 12:50:39'),
(6, '[[{"username":"ballalist","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Feb 29, 2016","estimateworkingday":50,"estimateday":70,"scheduleperformance":1.0,"estimatecompletion":"May 9, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Feb 29, 2016","estimateworkingday":50,"estimateday":70,"scheduleperformance":1.0,"estimatecompletion":"May 9, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Feb 29, 2016","estimateworkingday":50,"estimateday":70,"scheduleperformance":1.0,"estimatecompletion":"May 9, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Feb 29, 2016","estimateworkingday":50,"estimateday":70,"scheduleperformance":1.0,"estimatecompletion":"May 9, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', 'Vlosophy (eComm)', 1, '2016-02-22 12:52:16'),
(7, '[[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 31, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"May 12, 2016","idealcompletion":"May 12, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 31, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"May 12, 2016","idealcompletion":"May 12, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"bahri_ripplewerkz","nationality":"Indonesia","currentprojectcount":0,"earlieststart":"Mar 31, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"May 12, 2016","idealcompletion":"May 12, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 31, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"May 12, 2016","idealcompletion":"May 12, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', 'Renaissance Design Group [CMS]', 1, '2016-02-22 12:53:16'),
(8, '[[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 3, 2016","estimateworkingday":17,"estimateday":23,"scheduleperformance":1.0,"estimatecompletion":"Mar 26, 2016","idealcompletion":"Mar 26, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 3, 2016","estimateworkingday":17,"estimateday":23,"scheduleperformance":1.0,"estimatecompletion":"Mar 26, 2016","idealcompletion":"Mar 26, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Mar 3, 2016","estimateworkingday":17,"estimateday":23,"scheduleperformance":1.0,"estimatecompletion":"Mar 26, 2016","idealcompletion":"Mar 26, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 3, 2016","estimateworkingday":17,"estimateday":23,"scheduleperformance":1.0,"estimatecompletion":"Mar 26, 2016","idealcompletion":"Mar 26, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', 'Flave - Vanitytriad [E-Commerce]', 1, '2016-02-22 12:54:13'),
(9, '[[{"username":"vandavedecio","nationality":"Philippines","currentprojectcount":1,"earlieststart":"Apr 1, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Apr 29, 2016","idealcompletion":"Apr 29, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"john_pajarillo","nationality":"Philippines","currentprojectcount":1,"earlieststart":"May 6, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Jun 3, 2016","idealcompletion":"Jun 3, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":1,"earlieststart":"Mar 27, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Apr 24, 2016","idealcompletion":"Apr 24, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"john_pajarillo","nationality":"Philippines","currentprojectcount":1,"earlieststart":"May 6, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Jun 3, 2016","idealcompletion":"Jun 3, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', 'JMT Leather [CMS]', 1, '2016-02-22 12:54:57'),
(10, '[[{"username":"debe2","nationality":"Indonesia","currentprojectcount":0,"earlieststart":"Mar 7, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Apr 4, 2016","idealcompletion":"Apr 4, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Mar 7, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Apr 4, 2016","idealcompletion":"Apr 4, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":1,"earlieststart":"Mar 27, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Apr 24, 2016","idealcompletion":"Apr 24, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Mar 7, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Apr 4, 2016","idealcompletion":"Apr 4, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', '(2) Association of Funeral Directors (AFDS)', 1, '2016-02-22 12:55:48'),
(12, '[[{"username":"bahri_ripplewerkz","nationality":"Indonesia","currentprojectcount":1,"earlieststart":"Mar 24, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"May 5, 2016","idealcompletion":"May 5, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":1,"earlieststart":"Apr 21, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"Jun 2, 2016","idealcompletion":"Jun 2, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 10, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"Jun 21, 2016","idealcompletion":"Jun 21, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"marsd","nationality":"Singapore","currentprojectcount":1,"earlieststart":"Apr 21, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"Jun 2, 2016","idealcompletion":"Jun 2, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', '(2) My Singapore Food [CMS]', 1, '2016-02-22 12:57:46'),
(13, '[[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":2,"earlieststart":"May 13, 2016","estimateworkingday":33,"estimateday":46,"scheduleperformance":1.0,"estimatecompletion":"Jun 28, 2016","idealcompletion":"Jun 28, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 12, 2016","estimateworkingday":33,"estimateday":46,"scheduleperformance":1.0,"estimatecompletion":"Apr 27, 2016","idealcompletion":"Apr 27, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"bahri_ripplewerkz","nationality":"Indonesia","currentprojectcount":2,"earlieststart":"May 6, 2016","estimateworkingday":33,"estimateday":46,"scheduleperformance":1.0,"estimatecompletion":"Jun 21, 2016","idealcompletion":"Jun 21, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 12, 2016","estimateworkingday":33,"estimateday":46,"scheduleperformance":1.0,"estimatecompletion":"Apr 27, 2016","idealcompletion":"Apr 27, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', '1036liveseafood.com [Design only]', 1, '2016-02-22 12:58:49'),
(14, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 17, 2016","estimateworkingday":34,"estimateday":47,"scheduleperformance":1.0,"estimatecompletion":"May 3, 2016","idealcompletion":"May 3, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":1,"earlieststart":"Apr 21, 2016","estimateworkingday":34,"estimateday":47,"scheduleperformance":1.0,"estimatecompletion":"Jun 7, 2016","idealcompletion":"Jun 7, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 10, 2016","estimateworkingday":34,"estimateday":47,"scheduleperformance":1.0,"estimatecompletion":"Jun 26, 2016","idealcompletion":"Jun 26, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"marsd","nationality":"Singapore","currentprojectcount":1,"earlieststart":"Apr 21, 2016","estimateworkingday":34,"estimateday":47,"scheduleperformance":1.0,"estimatecompletion":"Jun 7, 2016","idealcompletion":"Jun 7, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', 'Abex Engineering [non-responsive CMS]', 1, '2016-02-22 12:59:53'),
(15, '[[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Mar 19, 2016","estimateworkingday":43,"estimateday":60,"scheduleperformance":1.0,"estimatecompletion":"May 18, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"benjo12","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 19, 2016","estimateworkingday":43,"estimateday":60,"scheduleperformance":1.0,"estimatecompletion":"May 18, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Mar 19, 2016","estimateworkingday":43,"estimateday":60,"scheduleperformance":1.0,"estimatecompletion":"May 18, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"benjo12","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 19, 2016","estimateworkingday":43,"estimateday":60,"scheduleperformance":1.0,"estimatecompletion":"May 18, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', 'HafBox', 1, '2016-02-22 13:00:42'),
(17, '[[{"username":"pukpik","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 19, 2016","estimateworkingday":14,"estimateday":19,"scheduleperformance":1.0,"estimatecompletion":"Jun 7, 2016","idealcompletion":"Jun 7, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"benjo12","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 23, 2016","estimateworkingday":14,"estimateday":19,"scheduleperformance":1.0,"estimatecompletion":"Apr 11, 2016","idealcompletion":"Apr 11, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 20, 2016","estimateworkingday":14,"estimateday":19,"scheduleperformance":1.0,"estimatecompletion":"May 9, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"benjo12","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Mar 23, 2016","estimateworkingday":14,"estimateday":19,"scheduleperformance":1.0,"estimatecompletion":"Apr 11, 2016","idealcompletion":"Apr 11, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', 'WSTAR', 1, '2016-02-22 13:02:42'),
(18, '[[{"username":"debe2","nationality":"Indonesia","currentprojectcount":1,"earlieststart":"Apr 5, 2016","estimateworkingday":17,"estimateday":23,"scheduleperformance":1.0,"estimatecompletion":"Apr 28, 2016","idealcompletion":"Apr 28, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 20, 2016","estimateworkingday":17,"estimateday":23,"scheduleperformance":1.0,"estimatecompletion":"May 13, 2016","idealcompletion":"May 13, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":1,"earlieststart":"May 13, 2016","estimateworkingday":17,"estimateday":23,"scheduleperformance":1.0,"estimatecompletion":"Jun 5, 2016","idealcompletion":"Jun 5, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 20, 2016","estimateworkingday":17,"estimateday":23,"scheduleperformance":1.0,"estimatecompletion":"May 13, 2016","idealcompletion":"May 13, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', 'MINERVA - INTRA', 1, '2016-02-22 13:03:24'),
(19, '[[{"username":"marsd","nationality":"Singapore","currentprojectcount":1,"earlieststart":"Apr 21, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"Jun 2, 2016","idealcompletion":"Jun 2, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":1,"earlieststart":"May 4, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"Jun 15, 2016","idealcompletion":"Jun 15, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 10, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"Jun 21, 2016","idealcompletion":"Jun 21, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":1,"earlieststart":"May 4, 2016","estimateworkingday":30,"estimateday":42,"scheduleperformance":1.0,"estimatecompletion":"Jun 15, 2016","idealcompletion":"Jun 15, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', 'Maven [CMS Integration]', 1, '2016-02-22 13:04:39'),
(20, '[[{"username":"pukpik","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 19, 2016","estimateworkingday":36,"estimateday":50,"scheduleperformance":1.0,"estimatecompletion":"Jul 8, 2016","idealcompletion":"Jul 8, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"benjo12","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 1, 2016","estimateworkingday":36,"estimateday":50,"scheduleperformance":1.0,"estimatecompletion":"May 21, 2016","idealcompletion":"May 21, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 20, 2016","estimateworkingday":36,"estimateday":50,"scheduleperformance":1.0,"estimatecompletion":"Jun 9, 2016","idealcompletion":"Jun 9, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"benjo12","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 1, 2016","estimateworkingday":36,"estimateday":50,"scheduleperformance":1.0,"estimatecompletion":"May 21, 2016","idealcompletion":"May 21, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', 'All That Jazz [CMS]', 1, '2016-02-22 13:05:29'),
(21, '[[{"username":"pukpik","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 19, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"Jun 4, 2016","idealcompletion":"Jun 4, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"benjo12","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 4, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"Apr 20, 2016","idealcompletion":"Apr 20, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 20, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"May 6, 2016","idealcompletion":"May 6, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"benjo12","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 4, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"Apr 20, 2016","idealcompletion":"Apr 20, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', 'Fashmob (E-Commerce)', 1, '2016-02-22 13:06:16'),
(22, '[[{"username":"benjo12","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 7, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"May 9, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"chaisiri1","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 7, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"May 9, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 7, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"May 9, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 7, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"May 9, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', 'Sgwinecellar', 2, '2016-02-22 13:11:04'),
(23, '[[{"username":"pukpik","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 19, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"Jun 20, 2016","idealcompletion":"Jun 20, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"benjo12","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"May 18, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 20, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"May 22, 2016","idealcompletion":"May 22, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 20, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"May 22, 2016","idealcompletion":"May 22, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', 'Purely Adoption [CMS]', 2, '2016-02-22 13:14:20'),
(24, '[[{"username":"bahri_ripplewerkz","nationality":"Indonesia","currentprojectcount":1,"earlieststart":"May 6, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"May 22, 2016","idealcompletion":"May 22, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":1,"earlieststart":"Apr 21, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"May 7, 2016","idealcompletion":"May 7, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 10, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"May 26, 2016","idealcompletion":"May 26, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 10, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"May 26, 2016","idealcompletion":"May 26, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', 'KHG Collections', 2, '2016-02-22 13:20:49'),
(25, '[[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":1,"earlieststart":"May 13, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"May 29, 2016","idealcompletion":"May 29, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":1,"earlieststart":"May 4, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"May 20, 2016","idealcompletion":"May 20, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"bahri_ripplewerkz","nationality":"Indonesia","currentprojectcount":1,"earlieststart":"May 6, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"May 22, 2016","idealcompletion":"May 22, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"bahri_ripplewerkz","nationality":"Indonesia","currentprojectcount":1,"earlieststart":"May 6, 2016","estimateworkingday":12,"estimateday":16,"scheduleperformance":1.0,"estimatecompletion":"May 22, 2016","idealcompletion":"May 22, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', 'Robert Yam & Co [Logo Tracing + CMS + Responsive]', 2, '2016-02-22 13:31:46'),
(26, '[[{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 10, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"Jun 11, 2016","idealcompletion":"Jun 11, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":1,"earlieststart":"May 21, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"Jun 22, 2016","idealcompletion":"Jun 22, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Jun 3, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"Jul 5, 2016","idealcompletion":"Jul 5, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"marsd","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Jun 3, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"Jul 5, 2016","idealcompletion":"Jul 5, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', '[Kayamila]', 2, '2016-02-22 13:38:52'),
(27, '[[{"username":"john_pajarillo","nationality":"Philippines","currentprojectcount":0,"earlieststart":"May 6, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"Jun 7, 2016","idealcompletion":"Jun 7, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"May 6, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"Jun 7, 2016","idealcompletion":"Jun 7, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 10, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"Jun 11, 2016","idealcompletion":"Jun 11, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]]', '[{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 10, 2016","estimateworkingday":23,"estimateday":32,"scheduleperformance":1.0,"estimatecompletion":"Jun 11, 2016","idealcompletion":"Jun 11, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":0}]', 'GAT [CMS + Responsive]', 2, '2016-02-22 13:39:54'),
(28, '[[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Jul 7, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Aug 4, 2016","idealcompletion":"Aug 4, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Jul 7, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Aug 4, 2016","idealcompletion":"Aug 4, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}],[{"username":"debe2","nationality":"Indonesia","currentprojectcount":1,"earlieststart":"Jul 28, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Aug 25, 2016","idealcompletion":"Aug 25, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]]', '[{"username":"debe2","nationality":"Indonesia","currentprojectcount":1,"earlieststart":"Jul 28, 2016","estimateworkingday":20,"estimateday":28,"scheduleperformance":1.0,"estimatecompletion":"Aug 25, 2016","idealcompletion":"Aug 25, 2016","defectlessfactor":0.0,"schedulefactor":0.0,"avgdefectperproject":0.0,"experiencefactor":0.0,"projectexperiencecount":0,"zainessscore":0.0,"sorting":1}]', 'SeaCAD [Responsive + CMS + Event Espresso (Training Courses) + E-Commerce]', 2, '2016-02-22 13:41:04'),
(29, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-41,"estimateday":-57,"scheduleperformance":-1.625,"estimatecompletion":"Feb 12, 2016","idealcompletion":"May 14, 2016","defectlessfactor":0.8413,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4894,"sorting":0}],[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-32,"estimateday":-45,"scheduleperformance":-1.261053333333,"estimatecompletion":"Feb 24, 2016","idealcompletion":"May 14, 2016","defectlessfactor":0.2578,"schedulefactor":0.898,"avgdefectperproject":0.4,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.449,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-29,"estimateday":-40,"scheduleperformance":-1.1307,"estimatecompletion":"Feb 29, 2016","idealcompletion":"May 14, 2016","defectlessfactor":0.8413,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.4782,"sorting":0}]]', '[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-32,"estimateday":-45,"scheduleperformance":-1.261053333333,"estimatecompletion":"Feb 24, 2016","idealcompletion":"May 14, 2016","defectlessfactor":0.2578,"schedulefactor":0.898,"avgdefectperproject":0.4,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.449,"sorting":0}]', 'Facebook Virtual', 1, '2016-04-08 01:12:55'),
(30, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-33,"estimateday":-46,"scheduleperformance":-1.625,"estimatecompletion":"Feb 24, 2016","idealcompletion":"May 7, 2016","defectlessfactor":0.834,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6172,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-26,"estimateday":-36,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 4, 2016","idealcompletion":"May 7, 2016","defectlessfactor":0.3446,"schedulefactor":0.898,"avgdefectperproject":0.3333,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5157,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-33,"estimateday":-46,"scheduleperformance":-1.625,"estimatecompletion":"Feb 24, 2016","idealcompletion":"May 7, 2016","defectlessfactor":0.834,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6172,"sorting":0},{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-23,"estimateday":-32,"scheduleperformance":-1.1307,"estimatecompletion":"Mar 9, 2016","idealcompletion":"May 7, 2016","defectlessfactor":0.834,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5892,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-33,"estimateday":-46,"scheduleperformance":-1.625,"estimatecompletion":"Feb 24, 2016","idealcompletion":"May 7, 2016","defectlessfactor":0.834,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6172,"sorting":0},{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-17,"estimateday":-24,"scheduleperformance":-0.8438,"estimatecompletion":"Mar 16, 2016","idealcompletion":"May 7, 2016","defectlessfactor":0.834,"schedulefactor":0.6985,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.5189,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-33,"estimateday":-46,"scheduleperformance":-1.625,"estimatecompletion":"Feb 24, 2016","idealcompletion":"May 7, 2016","defectlessfactor":0.834,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6172,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-26,"estimateday":-36,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 4, 2016","idealcompletion":"May 7, 2016","defectlessfactor":0.3446,"schedulefactor":0.898,"avgdefectperproject":0.3333,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5157,"sorting":0}]', 'Twitter Blogging', 1, '2016-04-08 01:14:38'),
(31, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-49,"estimateday":-69,"scheduleperformance":-1.625,"estimatecompletion":"Jan 31, 2016","idealcompletion":"May 21, 2016","defectlessfactor":0.8315,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6749,"sorting":0}],[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-38,"estimateday":-53,"scheduleperformance":-1.261053333333,"estimatecompletion":"Feb 17, 2016","idealcompletion":"May 21, 2016","defectlessfactor":0.4129,"schedulefactor":0.898,"avgdefectperproject":0.2857,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.511,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-34,"estimateday":-48,"scheduleperformance":-1.1307,"estimatecompletion":"Feb 21, 2016","idealcompletion":"May 21, 2016","defectlessfactor":0.8315,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6536,"sorting":0}]]', '[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-38,"estimateday":-53,"scheduleperformance":-1.261053333333,"estimatecompletion":"Feb 17, 2016","idealcompletion":"May 21, 2016","defectlessfactor":0.4129,"schedulefactor":0.898,"avgdefectperproject":0.2857,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.511,"sorting":0}]', 'Starbucks Mobile', 1, '2016-04-08 01:19:49'),
(32, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-54,"estimateday":-76,"scheduleperformance":-1.625,"estimatecompletion":"Jan 24, 2016","idealcompletion":"May 25, 2016","defectlessfactor":0.8264,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6147,"sorting":0}],[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-42,"estimateday":-59,"scheduleperformance":-1.261053333333,"estimatecompletion":"Feb 10, 2016","idealcompletion":"May 25, 2016","defectlessfactor":0.4641,"schedulefactor":0.898,"avgdefectperproject":0.25,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5551,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-38,"estimateday":-53,"scheduleperformance":-1.1307,"estimatecompletion":"Feb 17, 2016","idealcompletion":"May 25, 2016","defectlessfactor":0.8264,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5867,"sorting":0}]]', '[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-38,"estimateday":-53,"scheduleperformance":-1.1307,"estimatecompletion":"Feb 17, 2016","idealcompletion":"May 25, 2016","defectlessfactor":0.8264,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5867,"sorting":0}]', 'Monster Beverage', 2, '2016-04-08 01:20:24'),
(33, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-11,"estimateday":-15,"scheduleperformance":-0.43785,"estimatecompletion":"Mar 25, 2016","idealcompletion":"May 11, 2016","defectlessfactor":0.9207,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6426,"sorting":0}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":4,"estimateday":6,"scheduleperformance":0.2024,"estimatecompletion":"Apr 15, 2016","idealcompletion":"May 11, 2016","defectlessfactor":0.0023,"schedulefactor":0.409,"avgdefectperproject":1.5,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.1753,"sorting":0}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":12,"estimateday":17,"scheduleperformance":0.5571,"estimatecompletion":"Apr 27, 2016","idealcompletion":"May 11, 2016","defectlessfactor":0.9207,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.3625,"sorting":0}]]', '[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":4,"estimateday":6,"scheduleperformance":0.2024,"estimatecompletion":"Apr 15, 2016","idealcompletion":"May 11, 2016","defectlessfactor":0.0023,"schedulefactor":0.409,"avgdefectperproject":1.5,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.1753,"sorting":0}]', 'Kraft Foods', 1, '2016-04-08 01:21:12'),
(34, '[[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-100,"estimateday":-140,"scheduleperformance":-3.2143,"estimatecompletion":"Nov 21, 2015","idealcompletion":"May 22, 2016","defectlessfactor":0.9713,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6466,"sorting":0}],[{"username":"debe2","nationality":"Indonesia","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-23,"estimateday":-33,"scheduleperformance":-0.737883333333,"estimatecompletion":"Mar 7, 2016","idealcompletion":"May 22, 2016","defectlessfactor":0.0778,"schedulefactor":0.3974,"avgdefectperproject":1.6,"experiencefactor":0.4,"projectexperiencecount":6,"zainessscore":0.2888,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":19,"estimateday":26,"scheduleperformance":0.6207,"estimatecompletion":"May 5, 2016","idealcompletion":"May 22, 2016","defectlessfactor":0.3192,"schedulefactor":0.1423,"avgdefectperproject":1.0,"experiencefactor":0.08,"projectexperiencecount":2,"zainessscore":0.1787,"sorting":0}]]', '[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-100,"estimateday":-140,"scheduleperformance":-3.2143,"estimatecompletion":"Nov 21, 2015","idealcompletion":"May 22, 2016","defectlessfactor":0.9713,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6466,"sorting":0}]', 'Petronas Web', 3, '2016-04-08 01:21:45');
INSERT INTO `recommendationlog` (`id`, `generated`, `selected`, `projectname`, `choice`, `updated`) VALUES
(35, '[[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-74,"estimateday":-104,"scheduleperformance":-3.2143,"estimatecompletion":"Dec 27, 2015","idealcompletion":"May 11, 2016","defectlessfactor":0.9713,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6466,"sorting":0}],[{"username":"debe2","nationality":"Indonesia","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-17,"estimateday":-24,"scheduleperformance":-0.737883333333,"estimatecompletion":"Mar 16, 2016","idealcompletion":"May 11, 2016","defectlessfactor":0.0778,"schedulefactor":0.3974,"avgdefectperproject":1.6,"experiencefactor":0.4,"projectexperiencecount":6,"zainessscore":0.2888,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":14,"estimateday":19,"scheduleperformance":0.6207,"estimatecompletion":"Apr 28, 2016","idealcompletion":"May 11, 2016","defectlessfactor":0.3192,"schedulefactor":0.1423,"avgdefectperproject":1.0,"experiencefactor":0.08,"projectexperiencecount":2,"zainessscore":0.1787,"sorting":0}]]', '[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-74,"estimateday":-104,"scheduleperformance":-3.2143,"estimatecompletion":"Dec 27, 2015","idealcompletion":"May 11, 2016","defectlessfactor":0.9713,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6466,"sorting":0}]', 'Liberty Media [3 Page Static]', 0, '2016-04-08 01:22:52'),
(36, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 15, 2016","estimateworkingday":-10,"estimateday":-14,"scheduleperformance":-0.43785,"estimatecompletion":"Apr 1, 2016","idealcompletion":"May 15, 2016","defectlessfactor":0.983,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.7482,"sorting":0},{"username":"marsd","nationality":"Singapore","currentprojectcount":1,"earlieststart":"Apr 18, 2016","estimateworkingday":4,"estimateday":6,"scheduleperformance":0.2024,"estimatecompletion":"Apr 24, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.0,"schedulefactor":0.409,"avgdefectperproject":1.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.1322,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 15, 2016","estimateworkingday":-10,"estimateday":-14,"scheduleperformance":-0.43785,"estimatecompletion":"Apr 1, 2016","idealcompletion":"May 15, 2016","defectlessfactor":0.983,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.7482,"sorting":0},{"username":"ballalist","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 15, 2016","estimateworkingday":12,"estimateday":17,"scheduleperformance":0.5571,"estimatecompletion":"May 2, 2016","idealcompletion":"May 15, 2016","defectlessfactor":0.983,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.536,"sorting":0}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":1,"earlieststart":"Apr 18, 2016","estimateworkingday":4,"estimateday":6,"scheduleperformance":0.2024,"estimatecompletion":"Apr 24, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.0,"schedulefactor":0.409,"avgdefectperproject":1.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.1322,"sorting":0},{"username":"ballalist","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 15, 2016","estimateworkingday":12,"estimateday":17,"scheduleperformance":0.5571,"estimatecompletion":"May 2, 2016","idealcompletion":"May 15, 2016","defectlessfactor":0.983,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.536,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 15, 2016","estimateworkingday":-10,"estimateday":-14,"scheduleperformance":-0.43785,"estimatecompletion":"Apr 1, 2016","idealcompletion":"May 15, 2016","defectlessfactor":0.983,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.7482,"sorting":0},{"username":"ballalist","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 15, 2016","estimateworkingday":12,"estimateday":17,"scheduleperformance":0.5571,"estimatecompletion":"May 2, 2016","idealcompletion":"May 15, 2016","defectlessfactor":0.983,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.536,"sorting":0}]', 'BA Foods [Responsive]', 1, '2016-04-08 01:23:25'),
(37, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-14,"estimateday":-19,"scheduleperformance":-0.43785,"estimatecompletion":"Mar 28, 2016","idealcompletion":"May 28, 2016","defectlessfactor":0.983,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6632,"sorting":0},{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":6,"estimateday":8,"scheduleperformance":0.2024,"estimatecompletion":"Apr 24, 2016","idealcompletion":"May 28, 2016","defectlessfactor":0.0,"schedulefactor":0.409,"avgdefectperproject":1.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.1746,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-14,"estimateday":-19,"scheduleperformance":-0.43785,"estimatecompletion":"Mar 28, 2016","idealcompletion":"May 28, 2016","defectlessfactor":0.983,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6632,"sorting":0},{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 2, 2016","estimateworkingday":16,"estimateday":23,"scheduleperformance":0.5571,"estimatecompletion":"May 25, 2016","idealcompletion":"Jun 13, 2016","defectlessfactor":0.983,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.3831,"sorting":0}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":6,"estimateday":8,"scheduleperformance":0.2024,"estimatecompletion":"Apr 24, 2016","idealcompletion":"May 28, 2016","defectlessfactor":0.0,"schedulefactor":0.409,"avgdefectperproject":1.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.1746,"sorting":0},{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 2, 2016","estimateworkingday":16,"estimateday":23,"scheduleperformance":0.5571,"estimatecompletion":"May 25, 2016","idealcompletion":"Jun 13, 2016","defectlessfactor":0.983,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.3831,"sorting":0}]]', '[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":6,"estimateday":8,"scheduleperformance":0.2024,"estimatecompletion":"Apr 24, 2016","idealcompletion":"May 28, 2016","defectlessfactor":0.0,"schedulefactor":0.409,"avgdefectperproject":1.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.1746,"sorting":0},{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 2, 2016","estimateworkingday":16,"estimateday":23,"scheduleperformance":0.5571,"estimatecompletion":"May 25, 2016","idealcompletion":"Jun 13, 2016","defectlessfactor":0.983,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.3831,"sorting":0}]', 'Hubort Management [CMS + Responsive]', 2, '2016-04-08 01:23:59'),
(38, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-36,"estimateday":-51,"scheduleperformance":-1.625,"estimatecompletion":"Feb 18, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.8264,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6147,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-28,"estimateday":-39,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 2, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.4641,"schedulefactor":0.898,"avgdefectperproject":0.25,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5551,"sorting":0},{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-25,"estimateday":-35,"scheduleperformance":-1.1307,"estimatecompletion":"Mar 5, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.8264,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5867,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-36,"estimateday":-51,"scheduleperformance":-1.625,"estimatecompletion":"Feb 18, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.8264,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6147,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-28,"estimateday":-39,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 2, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.4641,"schedulefactor":0.898,"avgdefectperproject":0.25,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5551,"sorting":0},{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-19,"estimateday":-26,"scheduleperformance":-0.8438,"estimatecompletion":"Mar 14, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.8264,"schedulefactor":0.6985,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.5164,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-36,"estimateday":-51,"scheduleperformance":-1.625,"estimatecompletion":"Feb 18, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.8264,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6147,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-28,"estimateday":-39,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 2, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.4641,"schedulefactor":0.898,"avgdefectperproject":0.25,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5551,"sorting":0},{"username":"vandavedecio","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-8,"estimateday":-12,"scheduleperformance":-0.35715,"estimatecompletion":"Mar 28, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.8264,"schedulefactor":0.4129,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.4486,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-36,"estimateday":-51,"scheduleperformance":-1.625,"estimatecompletion":"Feb 18, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.8264,"schedulefactor":0.9564,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6147,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-28,"estimateday":-39,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 2, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.4641,"schedulefactor":0.898,"avgdefectperproject":0.25,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5551,"sorting":0},{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-19,"estimateday":-26,"scheduleperformance":-0.8438,"estimatecompletion":"Mar 14, 2016","idealcompletion":"May 9, 2016","defectlessfactor":0.8264,"schedulefactor":0.6985,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.5164,"sorting":0}]', 'Branslord [CMS]', 1, '2016-04-08 01:30:08'),
(39, '[[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Dec 4, 2017","estimateworkingday":-74,"estimateday":-104,"scheduleperformance":-3.2143,"estimatecompletion":"Aug 23, 2017","idealcompletion":"Jan 5, 2018","defectlessfactor":0.9713,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6466,"sorting":0}],[{"username":"debe2","nationality":"Indonesia","currentprojectcount":0,"earlieststart":"Dec 4, 2017","estimateworkingday":-17,"estimateday":-24,"scheduleperformance":-0.737883333333,"estimatecompletion":"Nov 10, 2017","idealcompletion":"Jan 5, 2018","defectlessfactor":0.0778,"schedulefactor":0.3974,"avgdefectperproject":1.6,"experiencefactor":0.4,"projectexperiencecount":6,"zainessscore":0.2888,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Dec 4, 2017","estimateworkingday":14,"estimateday":19,"scheduleperformance":0.6207,"estimatecompletion":"Dec 23, 2017","idealcompletion":"Jan 5, 2018","defectlessfactor":0.3192,"schedulefactor":0.1423,"avgdefectperproject":1.0,"experiencefactor":0.08,"projectexperiencecount":2,"zainessscore":0.1787,"sorting":0}]]', '[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Dec 4, 2017","estimateworkingday":14,"estimateday":19,"scheduleperformance":0.6207,"estimatecompletion":"Dec 23, 2017","idealcompletion":"Jan 5, 2018","defectlessfactor":0.3192,"schedulefactor":0.1423,"avgdefectperproject":1.0,"experiencefactor":0.08,"projectexperiencecount":2,"zainessscore":0.1787,"sorting":0}]', 'Procter and Gamble', 2, '2016-04-08 02:11:31'),
(40, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Dec 5, 2016","estimateworkingday":-20,"estimateday":-28,"scheduleperformance":-1.625,"estimatecompletion":"Nov 7, 2016","idealcompletion":"Dec 21, 2016","defectlessfactor":0.4721,"schedulefactor":0.9564,"avgdefectperproject":0.3333,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4978,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Dec 5, 2016","estimateworkingday":-16,"estimateday":-22,"scheduleperformance":-1.261053333333,"estimatecompletion":"Nov 13, 2016","idealcompletion":"Dec 21, 2016","defectlessfactor":0.5478,"schedulefactor":0.898,"avgdefectperproject":0.2222,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5827,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Dec 5, 2016","estimateworkingday":-20,"estimateday":-28,"scheduleperformance":-1.625,"estimatecompletion":"Nov 7, 2016","idealcompletion":"Dec 21, 2016","defectlessfactor":0.4721,"schedulefactor":0.9564,"avgdefectperproject":0.3333,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4978,"sorting":0},{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Dec 5, 2016","estimateworkingday":-14,"estimateday":-19,"scheduleperformance":-1.1307,"estimatecompletion":"Nov 16, 2016","idealcompletion":"Dec 21, 2016","defectlessfactor":0.8508,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5948,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Dec 5, 2016","estimateworkingday":-20,"estimateday":-28,"scheduleperformance":-1.625,"estimatecompletion":"Nov 7, 2016","idealcompletion":"Dec 21, 2016","defectlessfactor":0.4721,"schedulefactor":0.9564,"avgdefectperproject":0.3333,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4978,"sorting":0},{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Dec 5, 2016","estimateworkingday":-11,"estimateday":-15,"scheduleperformance":-0.8438,"estimatecompletion":"Nov 20, 2016","idealcompletion":"Dec 21, 2016","defectlessfactor":0.8508,"schedulefactor":0.6985,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.5245,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Dec 5, 2016","estimateworkingday":-20,"estimateday":-28,"scheduleperformance":-1.625,"estimatecompletion":"Nov 7, 2016","idealcompletion":"Dec 21, 2016","defectlessfactor":0.4721,"schedulefactor":0.9564,"avgdefectperproject":0.3333,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4978,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Dec 5, 2016","estimateworkingday":-16,"estimateday":-22,"scheduleperformance":-1.261053333333,"estimatecompletion":"Nov 13, 2016","idealcompletion":"Dec 21, 2016","defectlessfactor":0.5478,"schedulefactor":0.898,"avgdefectperproject":0.2222,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5827,"sorting":0}]', '25 HOURS TIME INTERNATIONAL PTE LTD', 0, '2016-04-08 02:12:35'),
(41, '[[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Sep 9, 2016","estimateworkingday":-4,"estimateday":-5,"scheduleperformance":-1.1307,"estimatecompletion":"Sep 4, 2016","idealcompletion":"Sep 14, 2016","defectlessfactor":0.8413,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5916,"sorting":1},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Sep 9, 2016","estimateworkingday":-4,"estimateday":-6,"scheduleperformance":-1.261053333333,"estimatecompletion":"Sep 3, 2016","idealcompletion":"Sep 14, 2016","defectlessfactor":0.5714,"schedulefactor":0.898,"avgdefectperproject":0.2,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5905,"sorting":1}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Sep 9, 2016","estimateworkingday":-4,"estimateday":-5,"scheduleperformance":-1.1307,"estimatecompletion":"Sep 4, 2016","idealcompletion":"Sep 14, 2016","defectlessfactor":0.8413,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5916,"sorting":1},{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Sep 9, 2016","estimateworkingday":-5,"estimateday":-7,"scheduleperformance":-1.625,"estimatecompletion":"Sep 2, 2016","idealcompletion":"Sep 14, 2016","defectlessfactor":0.5714,"schedulefactor":0.9564,"avgdefectperproject":0.25,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.5306,"sorting":1}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Sep 9, 2016","estimateworkingday":-4,"estimateday":-5,"scheduleperformance":-1.1307,"estimatecompletion":"Sep 4, 2016","idealcompletion":"Sep 14, 2016","defectlessfactor":0.8413,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5916,"sorting":1},{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Sep 9, 2016","estimateworkingday":-3,"estimateday":-4,"scheduleperformance":-0.8125,"estimatecompletion":"Sep 5, 2016","idealcompletion":"Sep 14, 2016","defectlessfactor":0.8413,"schedulefactor":0.6844,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.5299,"sorting":1}]]', '[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Sep 9, 2016","estimateworkingday":-4,"estimateday":-5,"scheduleperformance":-1.1307,"estimatecompletion":"Sep 4, 2016","idealcompletion":"Sep 14, 2016","defectlessfactor":0.8413,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5916,"sorting":1},{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Sep 9, 2016","estimateworkingday":-5,"estimateday":-7,"scheduleperformance":-1.625,"estimatecompletion":"Sep 2, 2016","idealcompletion":"Sep 14, 2016","defectlessfactor":0.5714,"schedulefactor":0.9564,"avgdefectperproject":0.25,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.5306,"sorting":1}]', '3 DEGREES ASSET MANAGEMENT PTE LTD', 1, '2016-04-08 02:13:27'),
(42, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Jul 3, 2016","estimateworkingday":-5,"estimateday":-7,"scheduleperformance":-1.625,"estimatecompletion":"Jun 26, 2016","idealcompletion":"Jul 7, 2016","defectlessfactor":0.6293,"schedulefactor":0.9564,"avgdefectperproject":0.2,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4364,"sorting":0}],[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Jul 3, 2016","estimateworkingday":-4,"estimateday":-6,"scheduleperformance":-1.261053333333,"estimatecompletion":"Jun 27, 2016","idealcompletion":"Jul 7, 2016","defectlessfactor":0.5636,"schedulefactor":0.898,"avgdefectperproject":0.2,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5254,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Jul 3, 2016","estimateworkingday":-4,"estimateday":-5,"scheduleperformance":-1.1307,"estimatecompletion":"Jun 29, 2016","idealcompletion":"Jul 7, 2016","defectlessfactor":0.8389,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.4776,"sorting":0}]]', '[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Jul 3, 2016","estimateworkingday":-4,"estimateday":-6,"scheduleperformance":-1.261053333333,"estimatecompletion":"Jun 27, 2016","idealcompletion":"Jul 7, 2016","defectlessfactor":0.5636,"schedulefactor":0.898,"avgdefectperproject":0.2,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5254,"sorting":0}]', '3 DEGREES HOSPITALITY PTE LTD', 1, '2016-04-08 02:14:24'),
(43, '[[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 29, 2016","estimateworkingday":-13,"estimateday":-18,"scheduleperformance":-1.1307,"estimatecompletion":"Apr 11, 2016","idealcompletion":"May 14, 2016","defectlessfactor":0.8365,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6561,"sorting":1}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 29, 2016","estimateworkingday":-9,"estimateday":-13,"scheduleperformance":-0.8125,"estimatecompletion":"Apr 16, 2016","idealcompletion":"May 14, 2016","defectlessfactor":0.8365,"schedulefactor":0.6844,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6094,"sorting":1}],[{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 29, 2016","estimateworkingday":-10,"estimateday":-13,"scheduleperformance":-0.8438,"estimatecompletion":"Apr 16, 2016","idealcompletion":"May 14, 2016","defectlessfactor":0.8365,"schedulefactor":0.6985,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.6029,"sorting":1}]]', '[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 29, 2016","estimateworkingday":-13,"estimateday":-18,"scheduleperformance":-1.1307,"estimatecompletion":"Apr 11, 2016","idealcompletion":"May 14, 2016","defectlessfactor":0.8365,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6561,"sorting":1}]', 'L', NULL, '2016-04-08 02:15:41'),
(44, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 25, 2016","estimateworkingday":-7,"estimateday":-10,"scheduleperformance":-0.43785,"estimatecompletion":"Apr 15, 2016","idealcompletion":"May 16, 2016","defectlessfactor":0.9977,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5361,"sorting":0}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 25, 2016","estimateworkingday":3,"estimateday":4,"scheduleperformance":0.2024,"estimatecompletion":"Apr 29, 2016","idealcompletion":"May 16, 2016","defectlessfactor":0.0,"schedulefactor":0.409,"avgdefectperproject":0.75,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.1622,"sorting":0}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":3,"earlieststart":"May 28, 2016","estimateworkingday":8,"estimateday":11,"scheduleperformance":0.5571,"estimatecompletion":"Jun 8, 2016","idealcompletion":"Jun 18, 2016","defectlessfactor":0.9977,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.3039,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 25, 2016","estimateworkingday":-7,"estimateday":-10,"scheduleperformance":-0.43785,"estimatecompletion":"Apr 15, 2016","idealcompletion":"May 16, 2016","defectlessfactor":0.9977,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5361,"sorting":0}]', 'L-Intelligent Eduhub Pte. Ltd', 1, '2016-04-08 02:16:11'),
(45, '[[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"May 3, 2016","estimateworkingday":-55,"estimateday":-77,"scheduleperformance":-3.2143,"estimatecompletion":"Feb 17, 2016","idealcompletion":"May 26, 2016","defectlessfactor":1.0,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6561,"sorting":0}],[{"username":"debe2","nationality":"Indonesia","currentprojectcount":0,"earlieststart":"May 3, 2016","estimateworkingday":-13,"estimateday":-18,"scheduleperformance":-0.737883333333,"estimatecompletion":"Apr 15, 2016","idealcompletion":"May 26, 2016","defectlessfactor":0.0,"schedulefactor":0.3974,"avgdefectperproject":1.6,"experiencefactor":0.4,"projectexperiencecount":6,"zainessscore":0.2631,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"May 3, 2016","estimateworkingday":10,"estimateday":14,"scheduleperformance":0.6207,"estimatecompletion":"May 18, 2016","idealcompletion":"May 26, 2016","defectlessfactor":0.8554,"schedulefactor":0.1423,"avgdefectperproject":0.5,"experiencefactor":0.08,"projectexperiencecount":2,"zainessscore":0.3556,"sorting":0}]]', '[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"May 3, 2016","estimateworkingday":-55,"estimateday":-77,"scheduleperformance":-3.2143,"estimatecompletion":"Feb 17, 2016","idealcompletion":"May 26, 2016","defectlessfactor":1.0,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6561,"sorting":0}]', 'L.D. WAXSON (S) PTE LTD', 0, '2016-04-08 02:16:56'),
(46, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Dec 2, 2019","estimateworkingday":-52,"estimateday":-73,"scheduleperformance":-1.625,"estimatecompletion":"Sep 20, 2019","idealcompletion":"Jan 15, 2020","defectlessfactor":0.6255,"schedulefactor":0.9564,"avgdefectperproject":0.2,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.5484,"sorting":0}],[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Dec 2, 2019","estimateworkingday":-41,"estimateday":-57,"scheduleperformance":-1.261053333333,"estimatecompletion":"Oct 6, 2019","idealcompletion":"Jan 15, 2020","defectlessfactor":0.591,"schedulefactor":0.898,"avgdefectperproject":0.1818,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.597,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Dec 2, 2019","estimateworkingday":-37,"estimateday":-51,"scheduleperformance":-1.1307,"estimatecompletion":"Oct 12, 2019","idealcompletion":"Jan 15, 2020","defectlessfactor":0.8365,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.59,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Dec 2, 2019","estimateworkingday":-52,"estimateday":-73,"scheduleperformance":-1.625,"estimatecompletion":"Sep 20, 2019","idealcompletion":"Jan 15, 2020","defectlessfactor":0.6255,"schedulefactor":0.9564,"avgdefectperproject":0.2,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.5484,"sorting":0}]', 'TAG TEAM INC. PTE LTD', 1, '2016-04-08 02:17:19'),
(47, '[[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Jan 1, 2017","estimateworkingday":-40,"estimateday":-55,"scheduleperformance":-1.261053333333,"estimatecompletion":"Nov 7, 2016","idealcompletion":"Feb 13, 2017","defectlessfactor":0.5871,"schedulefactor":0.898,"avgdefectperproject":0.1818,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5313,"sorting":1}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Jan 1, 2017","estimateworkingday":-36,"estimateday":-50,"scheduleperformance":-1.1307,"estimatecompletion":"Nov 12, 2016","idealcompletion":"Feb 13, 2017","defectlessfactor":0.834,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.4764,"sorting":1}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Jan 1, 2017","estimateworkingday":-51,"estimateday":-71,"scheduleperformance":-1.625,"estimatecompletion":"Oct 22, 2016","idealcompletion":"Feb 13, 2017","defectlessfactor":0.6628,"schedulefactor":0.9564,"avgdefectperproject":0.1667,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4448,"sorting":1}]]', '[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Jan 1, 2017","estimateworkingday":-40,"estimateday":-55,"scheduleperformance":-1.261053333333,"estimatecompletion":"Nov 7, 2016","idealcompletion":"Feb 13, 2017","defectlessfactor":0.5871,"schedulefactor":0.898,"avgdefectperproject":0.1818,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5313,"sorting":1}]', 'TAGIT PTE LTD', 0, '2016-04-08 02:17:49'),
(48, '[[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"May 5, 2016","estimateworkingday":-6,"estimateday":-8,"scheduleperformance":-1.1307,"estimatecompletion":"Apr 27, 2016","idealcompletion":"May 12, 2016","defectlessfactor":0.8315,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6536,"sorting":1}],[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"May 5, 2016","estimateworkingday":-7,"estimateday":-9,"scheduleperformance":-1.261053333333,"estimatecompletion":"Apr 27, 2016","idealcompletion":"May 12, 2016","defectlessfactor":0.6064,"schedulefactor":0.898,"avgdefectperproject":0.1667,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.6077,"sorting":1}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"May 5, 2016","estimateworkingday":-5,"estimateday":-6,"scheduleperformance":-0.8125,"estimatecompletion":"Apr 29, 2016","idealcompletion":"May 12, 2016","defectlessfactor":0.8315,"schedulefactor":0.6844,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6068,"sorting":1}]]', '[{"username":"marsd","nationality":"Singapore","currentprojectcount":0,"earlieststart":"May 5, 2016","estimateworkingday":-5,"estimateday":-6,"scheduleperformance":-0.8125,"estimatecompletion":"Apr 29, 2016","idealcompletion":"May 12, 2016","defectlessfactor":0.8315,"schedulefactor":0.6844,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6068,"sorting":1}]', 'TAHAN CAPITAL MANAGEMENT PTE LTD', 2, '2016-04-08 02:18:15'),
(49, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-20,"estimateday":-28,"scheduleperformance":-1.625,"estimatecompletion":"Mar 19, 2016","idealcompletion":"May 2, 2016","defectlessfactor":0.2206,"schedulefactor":0.9564,"avgdefectperproject":0.6667,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.3342,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-16,"estimateday":-22,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 25, 2016","idealcompletion":"May 2, 2016","defectlessfactor":0.758,"schedulefactor":0.898,"avgdefectperproject":0.1667,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.574,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-20,"estimateday":-28,"scheduleperformance":-1.625,"estimatecompletion":"Mar 19, 2016","idealcompletion":"May 2, 2016","defectlessfactor":0.2206,"schedulefactor":0.9564,"avgdefectperproject":0.6667,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.3342,"sorting":0},{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-14,"estimateday":-19,"scheduleperformance":-1.1307,"estimatecompletion":"Mar 28, 2016","idealcompletion":"May 2, 2016","defectlessfactor":0.9147,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.4966,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-20,"estimateday":-28,"scheduleperformance":-1.625,"estimatecompletion":"Mar 19, 2016","idealcompletion":"May 2, 2016","defectlessfactor":0.2206,"schedulefactor":0.9564,"avgdefectperproject":0.6667,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.3342,"sorting":0},{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-11,"estimateday":-15,"scheduleperformance":-0.8438,"estimatecompletion":"Apr 1, 2016","idealcompletion":"May 2, 2016","defectlessfactor":0.9147,"schedulefactor":0.6985,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.4233,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-20,"estimateday":-28,"scheduleperformance":-1.625,"estimatecompletion":"Mar 19, 2016","idealcompletion":"May 2, 2016","defectlessfactor":0.2206,"schedulefactor":0.9564,"avgdefectperproject":0.6667,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.3342,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-16,"estimateday":-22,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 25, 2016","idealcompletion":"May 2, 2016","defectlessfactor":0.758,"schedulefactor":0.898,"avgdefectperproject":0.1667,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.574,"sorting":0}]', 'Decendents of the Sky [Responsive]', 0, '2016-04-08 05:35:06'),
(50, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":1,"earlieststart":"Apr 27, 2016","estimateworkingday":-12,"estimateday":-16,"scheduleperformance":-0.43785,"estimatecompletion":"Apr 11, 2016","idealcompletion":"Jun 2, 2016","defectlessfactor":0.9977,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5361,"sorting":1}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":3,"earlieststart":"May 28, 2016","estimateworkingday":14,"estimateday":20,"scheduleperformance":0.5571,"estimatecompletion":"Jun 17, 2016","idealcompletion":"Jul 3, 2016","defectlessfactor":0.9977,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.3039,"sorting":1}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":5,"earlieststart":"May 8, 2016","estimateworkingday":5,"estimateday":7,"scheduleperformance":0.2024,"estimatecompletion":"May 15, 2016","idealcompletion":"Jun 13, 2016","defectlessfactor":0.0,"schedulefactor":0.409,"avgdefectperproject":0.75,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.1622,"sorting":1}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":1,"earlieststart":"Apr 27, 2016","estimateworkingday":-12,"estimateday":-16,"scheduleperformance":-0.43785,"estimatecompletion":"Apr 11, 2016","idealcompletion":"Jun 2, 2016","defectlessfactor":0.9977,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5361,"sorting":1}]', 'Piccolo Pottery Co. (CMS + Responsive + Parallax)', 0, '2016-04-08 05:41:16'),
(51, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":2,"earlieststart":"Apr 27, 2016","estimateworkingday":-9,"estimateday":-13,"scheduleperformance":-0.43785,"estimatecompletion":"Apr 14, 2016","idealcompletion":"May 25, 2016","defectlessfactor":0.9977,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.7327,"sorting":0}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":5,"earlieststart":"May 8, 2016","estimateworkingday":4,"estimateday":5,"scheduleperformance":0.2024,"estimatecompletion":"May 13, 2016","idealcompletion":"Jun 5, 2016","defectlessfactor":0.0,"schedulefactor":0.409,"avgdefectperproject":0.75,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.2345,"sorting":0}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":3,"earlieststart":"May 28, 2016","estimateworkingday":11,"estimateday":15,"scheduleperformance":0.5571,"estimatecompletion":"Jun 12, 2016","idealcompletion":"Jun 25, 2016","defectlessfactor":0.9977,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.3284,"sorting":0}]]', '[{"username":"ballalist","nationality":"Thailand","currentprojectcount":3,"earlieststart":"May 28, 2016","estimateworkingday":11,"estimateday":15,"scheduleperformance":0.5571,"estimatecompletion":"Jun 12, 2016","idealcompletion":"Jun 25, 2016","defectlessfactor":0.9977,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.3284,"sorting":0}]', 'Big Beauty Boss Pte Ltd [Static + HTML + Responsive + CMS]', 2, '2016-04-08 05:49:05'),
(52, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-26,"estimateday":-37,"scheduleperformance":-1.625,"estimatecompletion":"Mar 10, 2016","idealcompletion":"May 8, 2016","defectlessfactor":0.2033,"schedulefactor":0.9564,"avgdefectperproject":0.7143,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.3299,"sorting":0}],[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-21,"estimateday":-29,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 18, 2016","idealcompletion":"May 8, 2016","defectlessfactor":0.7422,"schedulefactor":0.898,"avgdefectperproject":0.1538,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5701,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-19,"estimateday":-26,"scheduleperformance":-1.1307,"estimatecompletion":"Mar 21, 2016","idealcompletion":"May 8, 2016","defectlessfactor":0.8997,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.4928,"sorting":0}]]', '[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 16, 2016","estimateworkingday":-21,"estimateday":-29,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 18, 2016","idealcompletion":"May 8, 2016","defectlessfactor":0.7422,"schedulefactor":0.898,"avgdefectperproject":0.1538,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5701,"sorting":0}]', 'Snoopy Electric Components [CMS + Responsive]', 1, '2016-04-08 05:53:14'),
(53, '[[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 14, 2016","estimateworkingday":-129,"estimateday":-181,"scheduleperformance":-3.2143,"estimatecompletion":"Oct 16, 2015","idealcompletion":"Jun 9, 2016","defectlessfactor":0.9964,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6549,"sorting":0}],[{"username":"debe2","nationality":"Indonesia","currentprojectcount":1,"earlieststart":"Apr 23, 2016","estimateworkingday":-30,"estimateday":-42,"scheduleperformance":-0.737883333333,"estimatecompletion":"Mar 12, 2016","idealcompletion":"Jun 18, 2016","defectlessfactor":0.2643,"schedulefactor":0.3974,"avgdefectperproject":1.6,"experiencefactor":0.4,"projectexperiencecount":6,"zainessscore":0.3504,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 14, 2016","estimateworkingday":24,"estimateday":34,"scheduleperformance":0.6207,"estimatecompletion":"May 18, 2016","idealcompletion":"Jun 9, 2016","defectlessfactor":0.0197,"schedulefactor":0.1423,"avgdefectperproject":1.5,"experiencefactor":0.08,"projectexperiencecount":2,"zainessscore":0.0799,"sorting":0}]]', '[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 14, 2016","estimateworkingday":-129,"estimateday":-181,"scheduleperformance":-3.2143,"estimatecompletion":"Oct 16, 2015","idealcompletion":"Jun 9, 2016","defectlessfactor":0.9964,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6549,"sorting":0}]', 'Doves Supplies [E-commerce + CMS + responsive]', 1, '2016-04-08 05:54:50'),
(54, '[[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-94,"estimateday":-131,"scheduleperformance":-3.2143,"estimatecompletion":"Nov 30, 2015","idealcompletion":"May 19, 2016","defectlessfactor":0.9964,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6549,"sorting":0}],[{"username":"debe2","nationality":"Indonesia","currentprojectcount":1,"earlieststart":"Apr 23, 2016","estimateworkingday":-22,"estimateday":-30,"scheduleperformance":-0.737883333333,"estimatecompletion":"Mar 24, 2016","idealcompletion":"Jun 2, 2016","defectlessfactor":0.2643,"schedulefactor":0.3974,"avgdefectperproject":1.6,"experiencefactor":0.4,"projectexperiencecount":6,"zainessscore":0.3504,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":1,"earlieststart":"Apr 18, 2016","estimateworkingday":18,"estimateday":25,"scheduleperformance":0.6207,"estimatecompletion":"May 13, 2016","idealcompletion":"May 28, 2016","defectlessfactor":0.0197,"schedulefactor":0.1423,"avgdefectperproject":1.5,"experiencefactor":0.08,"projectexperiencecount":2,"zainessscore":0.0799,"sorting":0}]]', '[{"username":"zripplewerkz","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-94,"estimateday":-131,"scheduleperformance":-3.2143,"estimatecompletion":"Nov 30, 2015","idealcompletion":"May 19, 2016","defectlessfactor":0.9964,"schedulefactor":0.9082,"avgdefectperproject":0.0,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.6549,"sorting":0}]', 'Urk Market Supllies [E-commerce]', 0, '2016-04-08 05:57:41'),
(55, '[[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-16,"estimateday":-22,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 18, 2016","idealcompletion":"Apr 25, 2016","defectlessfactor":0.7549,"schedulefactor":0.898,"avgdefectperproject":0.1429,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.6511,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-14,"estimateday":-19,"scheduleperformance":-1.1307,"estimatecompletion":"Mar 21, 2016","idealcompletion":"Apr 25, 2016","defectlessfactor":0.898,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6103,"sorting":0}],[{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-11,"estimateday":-15,"scheduleperformance":-0.8438,"estimatecompletion":"Mar 25, 2016","idealcompletion":"Apr 25, 2016","defectlessfactor":0.898,"schedulefactor":0.6985,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.54,"sorting":0}]]', '[{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 9, 2016","estimateworkingday":-11,"estimateday":-15,"scheduleperformance":-0.8438,"estimatecompletion":"Mar 25, 2016","idealcompletion":"Apr 25, 2016","defectlessfactor":0.898,"schedulefactor":0.6985,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.54,"sorting":0}]', 'TaeBak Media [Responsive]', 2, '2016-04-08 05:59:09'),
(56, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 22, 2016","estimateworkingday":-57,"estimateday":-80,"scheduleperformance":-1.625,"estimatecompletion":"Feb 3, 2016","idealcompletion":"Jun 10, 2016","defectlessfactor":0.2005,"schedulefactor":0.9564,"avgdefectperproject":0.7143,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4082,"sorting":0}],[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 22, 2016","estimateworkingday":-45,"estimateday":-62,"scheduleperformance":-1.261053333333,"estimatecompletion":"Feb 20, 2016","idealcompletion":"Jun 10, 2016","defectlessfactor":0.7549,"schedulefactor":0.898,"avgdefectperproject":0.1429,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.6511,"sorting":0}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":0,"earlieststart":"Apr 22, 2016","estimateworkingday":-40,"estimateday":-56,"scheduleperformance":-1.1307,"estimatecompletion":"Feb 26, 2016","idealcompletion":"Jun 10, 2016","defectlessfactor":0.898,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6103,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 22, 2016","estimateworkingday":-57,"estimateday":-80,"scheduleperformance":-1.625,"estimatecompletion":"Feb 3, 2016","idealcompletion":"Jun 10, 2016","defectlessfactor":0.2005,"schedulefactor":0.9564,"avgdefectperproject":0.7143,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4082,"sorting":0}]', 'Pluto Fried Rice [CMS]', 1, '2016-04-08 06:01:37');
INSERT INTO `recommendationlog` (`id`, `generated`, `selected`, `projectname`, `choice`, `updated`) VALUES
(57, '[[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 10, 2016","estimateworkingday":-26,"estimateday":-36,"scheduleperformance":-1.261053333333,"estimatecompletion":"Mar 5, 2016","idealcompletion":"May 8, 2016","defectlessfactor":0.8023,"schedulefactor":0.898,"avgdefectperproject":0.1429,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.5851,"sorting":1}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 18, 2016","estimateworkingday":-23,"estimateday":-32,"scheduleperformance":-1.1307,"estimatecompletion":"Mar 17, 2016","idealcompletion":"May 16, 2016","defectlessfactor":0.9099,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.4954,"sorting":1}],[{"username":"vandavedecio","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 10, 2016","estimateworkingday":-8,"estimateday":-11,"scheduleperformance":-0.35715,"estimatecompletion":"Mar 30, 2016","idealcompletion":"May 8, 2016","defectlessfactor":0.9099,"schedulefactor":0.4129,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.3907,"sorting":1}]]', '[{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 18, 2016","estimateworkingday":-23,"estimateday":-32,"scheduleperformance":-1.1307,"estimatecompletion":"Mar 17, 2016","idealcompletion":"May 16, 2016","defectlessfactor":0.9099,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.4954,"sorting":1}]', 'Mars Bar Pte Ltd [CMS]', 1, '2016-04-08 08:25:18'),
(58, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":2,"earlieststart":"Apr 27, 2016","estimateworkingday":-65,"estimateday":-92,"scheduleperformance":-1.625,"estimatecompletion":"Jan 27, 2016","idealcompletion":"Jun 22, 2016","defectlessfactor":0.4247,"schedulefactor":0.9564,"avgdefectperproject":0.625,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4822,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 11, 2016","estimateworkingday":-51,"estimateday":-71,"scheduleperformance":-1.261053333333,"estimatecompletion":"Jan 31, 2016","idealcompletion":"Jun 6, 2016","defectlessfactor":0.8023,"schedulefactor":0.898,"avgdefectperproject":0.1429,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.6667,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":2,"earlieststart":"Apr 27, 2016","estimateworkingday":-65,"estimateday":-92,"scheduleperformance":-1.625,"estimatecompletion":"Jan 27, 2016","idealcompletion":"Jun 22, 2016","defectlessfactor":0.4247,"schedulefactor":0.9564,"avgdefectperproject":0.625,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4822,"sorting":0},{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 18, 2016","estimateworkingday":-46,"estimateday":-64,"scheduleperformance":-1.1307,"estimatecompletion":"Feb 14, 2016","idealcompletion":"Jun 13, 2016","defectlessfactor":0.9099,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6143,"sorting":0}],[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":2,"earlieststart":"Apr 27, 2016","estimateworkingday":-65,"estimateday":-92,"scheduleperformance":-1.625,"estimatecompletion":"Jan 27, 2016","idealcompletion":"Jun 22, 2016","defectlessfactor":0.4247,"schedulefactor":0.9564,"avgdefectperproject":0.625,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4822,"sorting":0},{"username":"sirachon","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 11, 2016","estimateworkingday":-34,"estimateday":-48,"scheduleperformance":-0.8438,"estimatecompletion":"Feb 24, 2016","idealcompletion":"Jun 6, 2016","defectlessfactor":0.6664,"schedulefactor":0.6985,"avgdefectperproject":0.3333,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.4636,"sorting":0}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":2,"earlieststart":"Apr 27, 2016","estimateworkingday":-65,"estimateday":-92,"scheduleperformance":-1.625,"estimatecompletion":"Jan 27, 2016","idealcompletion":"Jun 22, 2016","defectlessfactor":0.4247,"schedulefactor":0.9564,"avgdefectperproject":0.625,"experiencefactor":0.08,"projectexperiencecount":1,"zainessscore":0.4822,"sorting":0},{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 11, 2016","estimateworkingday":-51,"estimateday":-71,"scheduleperformance":-1.261053333333,"estimatecompletion":"Jan 31, 2016","idealcompletion":"Jun 6, 2016","defectlessfactor":0.8023,"schedulefactor":0.898,"avgdefectperproject":0.1429,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.6667,"sorting":0}]', 'Hopscotch Bar [E-commerce]', 1, '2016-04-08 08:26:19'),
(59, '[[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 10, 2016","estimateworkingday":-35,"estimateday":-48,"scheduleperformance":-1.261053333333,"estimatecompletion":"Feb 22, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.8078,"schedulefactor":0.898,"avgdefectperproject":0.1333,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.7084,"sorting":1}],[{"username":"roy1","nationality":"Singapore","currentprojectcount":2,"earlieststart":"Apr 18, 2016","estimateworkingday":-31,"estimateday":-43,"scheduleperformance":-1.1307,"estimatecompletion":"Mar 6, 2016","idealcompletion":"May 25, 2016","defectlessfactor":0.9066,"schedulefactor":0.8315,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.6912,"sorting":1}],[{"username":"vandavedecio","nationality":"Philippines","currentprojectcount":0,"earlieststart":"Apr 10, 2016","estimateworkingday":-10,"estimateday":-14,"scheduleperformance":-0.35715,"estimatecompletion":"Mar 27, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.9066,"schedulefactor":0.4129,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.5865,"sorting":1}]]', '[{"username":"pukpik","nationality":"Thailand","currentprojectcount":0,"earlieststart":"Apr 10, 2016","estimateworkingday":-35,"estimateday":-48,"scheduleperformance":-1.261053333333,"estimatecompletion":"Feb 22, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.8078,"schedulefactor":0.898,"avgdefectperproject":0.1333,"experiencefactor":0.32,"projectexperiencecount":5,"zainessscore":0.7084,"sorting":1}]', 'Kim Keat Hokkiean Mee [CMS]', 1, '2016-04-08 08:27:04'),
(60, '[[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":2,"earlieststart":"Apr 27, 2016","estimateworkingday":-7,"estimateday":-10,"scheduleperformance":-0.43785,"estimatecompletion":"Apr 17, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.9977,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.7327,"sorting":1}],[{"username":"ballalist","nationality":"Thailand","currentprojectcount":1,"earlieststart":"May 2, 2016","estimateworkingday":8,"estimateday":11,"scheduleperformance":0.5571,"estimatecompletion":"May 13, 2016","idealcompletion":"May 23, 2016","defectlessfactor":0.9977,"schedulefactor":0.1379,"avgdefectperproject":0.0,"experiencefactor":0.04,"projectexperiencecount":1,"zainessscore":0.3284,"sorting":1}],[{"username":"marsd","nationality":"Singapore","currentprojectcount":4,"earlieststart":"Apr 24, 2016","estimateworkingday":3,"estimateday":4,"scheduleperformance":0.2024,"estimatecompletion":"Apr 28, 2016","idealcompletion":"May 15, 2016","defectlessfactor":0.0,"schedulefactor":0.409,"avgdefectperproject":0.75,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.2345,"sorting":1}]]', '[{"username":"lesterjester","nationality":"Philippines","currentprojectcount":2,"earlieststart":"Apr 27, 2016","estimateworkingday":-7,"estimateday":-10,"scheduleperformance":-0.43785,"estimatecompletion":"Apr 17, 2016","idealcompletion":"May 18, 2016","defectlessfactor":0.9977,"schedulefactor":0.9066,"avgdefectperproject":0.0,"experiencefactor":0.12,"projectexperiencecount":2,"zainessscore":0.7327,"sorting":1}]', 'AtonHouse Kindergarten [CMS + Responsive]', 1, '2016-04-08 22:30:39');

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
  MODIFY `cronid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=156;
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
  ADD CONSTRAINT `notifications_fk2` FOREIGN KEY (`projectname`) REFERENCES `project` (`projectname`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_fk` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE;

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
