-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2013 at 11:51 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `map`
--
CREATE DATABASE IF NOT EXISTS `map` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `map`;

-- --------------------------------------------------------

--
-- Table structure for table `base`
--

CREATE TABLE IF NOT EXISTS `base` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `sizeX` int(11) DEFAULT NULL,
  `sizeY` int(11) DEFAULT NULL,
  `currentTurn` varchar(100) NOT NULL COMMENT 'The player that is currently doing his turn',
  PRIMARY KEY (`index`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `base`
--

INSERT INTO `base` (`index`, `sizeX`, `sizeY`, `currentTurn`) VALUES
(1, 15, 15, 'Chrome');

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE IF NOT EXISTS `buildings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `posX` int(11) DEFAULT NULL,
  `posY` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `owner` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` (`id`, `posX`, `posY`, `type`, `owner`) VALUES
(1, 7, 6, 0, 'Chrome'),
(2, 5, 10, 0, 'Chrome'),
(3, 5, 10, 0, 'Chrome'),
(4, 4, 7, 0, 'Chrome'),
(5, 3, 7, 3, 'TheZoq2'),
(6, 7, 4, 1, 'Chrome'),
(7, 9, 9, 1, 'TheZoq2'),
(8, 0, 9, 1, 'TheZoq2');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`ID`, `Name`) VALUES
(22, 'TheZoq2'),
(24, 'Chrome');

-- --------------------------------------------------------

--
-- Table structure for table `tile`
--

CREATE TABLE IF NOT EXISTS `tile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `posX` int(11) DEFAULT NULL,
  `posY` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=627 ;

--
-- Dumping data for table `tile`
--

INSERT INTO `tile` (`id`, `posX`, `posY`, `type`) VALUES
(1, 0, 0, 1),
(2, 1, 0, 1),
(3, 2, 0, 1),
(4, 3, 0, 1),
(5, 4, 0, 1),
(6, 5, 0, 1),
(7, 6, 0, 2),
(8, 7, 0, 1),
(9, 8, 0, 1),
(10, 9, 0, 1),
(11, 10, 0, 1),
(12, 11, 0, 1),
(13, 12, 0, 1),
(14, 13, 0, 1),
(15, 14, 0, 1),
(16, 0, 1, 1),
(17, 1, 1, 1),
(18, 2, 1, 1),
(19, 3, 1, 1),
(20, 4, 1, 1),
(21, 5, 1, 1),
(22, 6, 1, 1),
(23, 7, 1, 1),
(24, 8, 1, 1),
(25, 9, 1, 1),
(26, 10, 1, 1),
(27, 11, 1, 1),
(28, 12, 1, 1),
(29, 13, 1, 1),
(30, 14, 1, 1),
(31, 0, 2, 1),
(32, 1, 2, 1),
(33, 2, 2, 1),
(34, 3, 2, 3),
(35, 4, 2, 1),
(36, 5, 2, 1),
(37, 6, 2, 1),
(38, 7, 2, 1),
(39, 8, 2, 3),
(40, 9, 2, 2),
(41, 10, 2, 1),
(42, 11, 2, 1),
(43, 12, 2, 1),
(44, 13, 2, 1),
(45, 14, 2, 1),
(46, 0, 3, 1),
(47, 1, 3, 1),
(48, 2, 3, 1),
(49, 3, 3, 1),
(50, 4, 3, 1),
(51, 5, 3, 1),
(52, 6, 3, 1),
(53, 7, 3, 1),
(54, 8, 3, 1),
(55, 9, 3, 1),
(56, 10, 3, 1),
(57, 11, 3, 1),
(58, 12, 3, 1),
(59, 13, 3, 1),
(60, 14, 3, 1),
(61, 0, 4, 3),
(62, 1, 4, 1),
(63, 2, 4, 1),
(64, 3, 4, 1),
(65, 4, 4, 1),
(66, 5, 4, 1),
(67, 6, 4, 1),
(68, 7, 4, 1),
(69, 8, 4, 1),
(70, 9, 4, 1),
(71, 10, 4, 1),
(72, 11, 4, 1),
(73, 12, 4, 1),
(74, 13, 4, 1),
(75, 14, 4, 1),
(76, 0, 5, 1),
(77, 1, 5, 1),
(78, 2, 5, 1),
(79, 3, 5, 1),
(80, 4, 5, 2),
(81, 5, 5, 1),
(82, 6, 5, 1),
(83, 7, 5, 1),
(84, 8, 5, 1),
(85, 9, 5, 1),
(86, 10, 5, 3),
(87, 11, 5, 1),
(88, 12, 5, 1),
(89, 13, 5, 1),
(90, 14, 5, 1),
(91, 0, 6, 1),
(92, 1, 6, 1),
(93, 2, 6, 1),
(94, 3, 6, 1),
(95, 4, 6, 1),
(96, 5, 6, 1),
(97, 6, 6, 1),
(98, 7, 6, 2),
(99, 8, 6, 1),
(100, 9, 6, 1),
(101, 10, 6, 1),
(102, 11, 6, 1),
(103, 12, 6, 1),
(104, 13, 6, 1),
(105, 14, 6, 1),
(106, 0, 7, 1),
(107, 1, 7, 1),
(108, 2, 7, 1),
(109, 3, 7, 1),
(110, 4, 7, 1),
(111, 5, 7, 1),
(112, 6, 7, 1),
(113, 7, 7, 1),
(114, 8, 7, 1),
(115, 9, 7, 1),
(116, 10, 7, 1),
(117, 11, 7, 1),
(118, 12, 7, 1),
(119, 13, 7, 1),
(120, 14, 7, 1),
(121, 0, 8, 1),
(122, 1, 8, 1),
(123, 2, 8, 1),
(124, 3, 8, 1),
(125, 4, 8, 1),
(126, 5, 8, 1),
(127, 6, 8, 1),
(128, 7, 8, 2),
(129, 8, 8, 3),
(130, 9, 8, 1),
(131, 10, 8, 1),
(132, 11, 8, 1),
(133, 12, 8, 1),
(134, 13, 8, 1),
(135, 14, 8, 1),
(136, 0, 9, 1),
(137, 1, 9, 1),
(138, 2, 9, 1),
(139, 3, 9, 1),
(140, 4, 9, 1),
(141, 5, 9, 1),
(142, 6, 9, 1),
(143, 7, 9, 1),
(144, 8, 9, 3),
(145, 9, 9, 1),
(146, 10, 9, 1),
(147, 11, 9, 1),
(148, 12, 9, 1),
(149, 13, 9, 1),
(150, 14, 9, 1),
(151, 0, 10, 1),
(152, 1, 10, 1),
(153, 2, 10, 1),
(154, 3, 10, 3),
(155, 4, 10, 1),
(156, 5, 10, 1),
(157, 6, 10, 1),
(158, 7, 10, 2),
(159, 8, 10, 1),
(160, 9, 10, 1),
(161, 10, 10, 1),
(162, 11, 10, 1),
(163, 12, 10, 1),
(164, 13, 10, 1),
(165, 14, 10, 1),
(166, 0, 11, 1),
(167, 1, 11, 1),
(168, 2, 11, 1),
(169, 3, 11, 1),
(170, 4, 11, 1),
(171, 5, 11, 1),
(172, 6, 11, 1),
(173, 7, 11, 1),
(174, 8, 11, 1),
(175, 9, 11, 1),
(176, 10, 11, 1),
(177, 11, 11, 1),
(178, 12, 11, 1),
(179, 13, 11, 1),
(180, 14, 11, 1),
(181, 0, 12, 1),
(182, 1, 12, 1),
(183, 2, 12, 1),
(184, 3, 12, 1),
(185, 4, 12, 1),
(186, 5, 12, 1),
(187, 6, 12, 1),
(188, 7, 12, 1),
(189, 8, 12, 1),
(190, 9, 12, 1),
(191, 10, 12, 1),
(192, 11, 12, 1),
(193, 12, 12, 1),
(194, 13, 12, 1),
(195, 14, 12, 3),
(196, 0, 13, 1),
(197, 1, 13, 2),
(198, 2, 13, 1),
(199, 3, 13, 1),
(200, 4, 13, 1),
(201, 5, 13, 1),
(202, 6, 13, 1),
(203, 7, 13, 1),
(204, 8, 13, 2),
(205, 9, 13, 1),
(206, 10, 13, 1),
(207, 11, 13, 1),
(208, 12, 13, 1),
(209, 13, 13, 1),
(210, 14, 13, 1),
(211, 0, 14, 1),
(212, 1, 14, 1),
(213, 2, 14, 1),
(214, 3, 14, 1),
(215, 4, 14, 1),
(216, 5, 14, 1),
(217, 6, 14, 1),
(218, 7, 14, 3),
(219, 8, 14, 1),
(220, 9, 14, 1),
(221, 10, 14, 1),
(222, 11, 14, 1),
(223, 12, 14, 1),
(224, 13, 14, 1),
(225, 14, 14, 1),
(226, 6, 11, 1),
(227, 7, 11, 1),
(228, 8, 11, 1),
(229, 9, 11, 1),
(230, 10, 11, 1),
(231, 11, 11, 1),
(232, 12, 11, 1),
(233, 13, 11, 1),
(234, 14, 11, 1),
(235, 15, 11, 2),
(236, 16, 11, 1),
(237, 17, 11, 1),
(238, 18, 11, 1),
(239, 19, 11, 2),
(240, 0, 12, 1),
(241, 1, 12, 1),
(242, 2, 12, 1),
(243, 3, 12, 1),
(244, 4, 12, 1),
(245, 5, 12, 1),
(246, 6, 12, 1),
(247, 7, 12, 1),
(248, 8, 12, 1),
(249, 9, 12, 1),
(250, 10, 12, 1),
(251, 11, 12, 2),
(252, 12, 12, 1),
(253, 13, 12, 1),
(254, 14, 12, 1),
(255, 15, 12, 1),
(256, 16, 12, 3),
(257, 17, 12, 1),
(258, 18, 12, 3),
(259, 19, 12, 1),
(260, 0, 13, 1),
(261, 1, 13, 1),
(262, 2, 13, 1),
(263, 3, 13, 1),
(264, 4, 13, 1),
(265, 5, 13, 1),
(266, 6, 13, 1),
(267, 7, 13, 3),
(268, 8, 13, 1),
(269, 9, 13, 1),
(270, 10, 13, 1),
(271, 11, 13, 1),
(272, 12, 13, 1),
(273, 13, 13, 1),
(274, 14, 13, 1),
(275, 15, 13, 1),
(276, 16, 13, 1),
(277, 17, 13, 1),
(278, 18, 13, 1),
(279, 19, 13, 1),
(280, 0, 14, 1),
(281, 1, 14, 1),
(282, 2, 14, 1),
(283, 3, 14, 3),
(284, 4, 14, 1),
(285, 5, 14, 1),
(286, 6, 14, 1),
(287, 7, 14, 1),
(288, 8, 14, 1),
(289, 9, 14, 3),
(290, 10, 14, 1),
(291, 11, 14, 1),
(292, 12, 14, 1),
(293, 13, 14, 1),
(294, 14, 14, 1),
(295, 15, 14, 1),
(296, 16, 14, 2),
(297, 17, 14, 1),
(298, 18, 14, 1),
(299, 19, 14, 1),
(300, 0, 15, 1),
(301, 1, 15, 1),
(302, 2, 15, 1),
(303, 3, 15, 3),
(304, 4, 15, 1),
(305, 5, 15, 1),
(306, 6, 15, 1),
(307, 7, 15, 1),
(308, 8, 15, 1),
(309, 9, 15, 1),
(310, 10, 15, 1),
(311, 11, 15, 2),
(312, 12, 15, 1),
(313, 13, 15, 1),
(314, 14, 15, 1),
(315, 15, 15, 1),
(316, 16, 15, 1),
(317, 17, 15, 1),
(318, 18, 15, 1),
(319, 19, 15, 1),
(320, 0, 16, 1),
(321, 1, 16, 1),
(322, 2, 16, 1),
(323, 3, 16, 1),
(324, 4, 16, 1),
(325, 5, 16, 1),
(326, 6, 16, 1),
(327, 7, 16, 1),
(328, 8, 16, 1),
(329, 9, 16, 1),
(330, 10, 16, 1),
(331, 11, 16, 1),
(332, 12, 16, 1),
(333, 13, 16, 1),
(334, 14, 16, 1),
(335, 15, 16, 1),
(336, 16, 16, 1),
(337, 17, 16, 1),
(338, 18, 16, 1),
(339, 19, 16, 1),
(340, 0, 17, 1),
(341, 1, 17, 1),
(342, 2, 17, 1),
(343, 3, 17, 1),
(344, 4, 17, 1),
(345, 5, 17, 1),
(346, 6, 17, 1),
(347, 7, 17, 1),
(348, 8, 17, 1),
(349, 9, 17, 1),
(350, 10, 17, 1),
(351, 11, 17, 1),
(352, 12, 17, 1),
(353, 13, 17, 1),
(354, 4, 14, 1),
(355, 5, 14, 1),
(356, 6, 14, 2),
(357, 7, 14, 1),
(358, 8, 14, 1),
(359, 9, 14, 1),
(360, 10, 14, 1),
(361, 11, 14, 1),
(362, 12, 14, 1),
(363, 13, 14, 1),
(364, 14, 14, 1),
(365, 15, 14, 1),
(366, 16, 14, 1),
(367, 17, 14, 1),
(368, 18, 14, 1),
(369, 19, 14, 1),
(370, 20, 14, 1),
(371, 21, 14, 1),
(372, 22, 14, 1),
(373, 23, 14, 1),
(374, 24, 14, 1),
(375, 0, 15, 1),
(376, 1, 15, 1),
(377, 2, 15, 3),
(378, 3, 15, 1),
(379, 4, 15, 1),
(380, 5, 15, 1),
(381, 6, 15, 1),
(382, 7, 15, 2),
(383, 8, 15, 1),
(384, 9, 15, 1),
(385, 10, 15, 1),
(386, 11, 15, 1),
(387, 12, 15, 1),
(388, 13, 15, 1),
(389, 14, 15, 1),
(390, 15, 15, 1),
(391, 16, 15, 1),
(392, 17, 15, 1),
(393, 18, 15, 1),
(394, 19, 15, 1),
(395, 20, 15, 1),
(396, 21, 15, 3),
(397, 22, 15, 1),
(398, 23, 15, 2),
(399, 24, 15, 1),
(400, 0, 16, 1),
(401, 1, 16, 1),
(402, 2, 16, 1),
(403, 3, 16, 1),
(404, 4, 16, 1),
(405, 5, 16, 2),
(406, 6, 16, 1),
(407, 7, 16, 1),
(408, 8, 16, 1),
(409, 9, 16, 1),
(410, 10, 16, 1),
(411, 11, 16, 1),
(412, 12, 16, 1),
(413, 13, 16, 1),
(414, 14, 16, 1),
(415, 15, 16, 1),
(416, 16, 16, 1),
(417, 17, 16, 1),
(418, 18, 16, 1),
(419, 19, 16, 1),
(420, 20, 16, 1),
(421, 21, 16, 1),
(422, 22, 16, 1),
(423, 23, 16, 1),
(424, 24, 16, 1),
(425, 0, 17, 1),
(426, 1, 17, 1),
(427, 2, 17, 1),
(428, 3, 17, 1),
(429, 4, 17, 2),
(430, 5, 17, 1),
(431, 6, 17, 1),
(432, 7, 17, 1),
(433, 8, 17, 1),
(434, 9, 17, 1),
(435, 10, 17, 1),
(436, 11, 17, 1),
(437, 12, 17, 1),
(438, 13, 17, 1),
(439, 14, 17, 1),
(440, 15, 17, 1),
(441, 16, 17, 1),
(442, 17, 17, 1),
(443, 18, 17, 1),
(444, 19, 17, 1),
(445, 20, 17, 1),
(446, 21, 17, 1),
(447, 22, 17, 1),
(448, 23, 17, 1),
(449, 24, 17, 1),
(450, 0, 18, 3),
(451, 1, 18, 3),
(452, 2, 18, 1),
(453, 3, 18, 1),
(454, 4, 18, 1),
(455, 5, 18, 1),
(456, 6, 18, 1),
(457, 7, 18, 1),
(458, 8, 18, 1),
(459, 9, 18, 1),
(460, 10, 18, 1),
(461, 11, 18, 1),
(462, 12, 18, 1),
(463, 13, 18, 2),
(464, 14, 18, 1),
(465, 15, 18, 1),
(466, 16, 18, 1),
(467, 17, 18, 1),
(468, 18, 18, 1),
(469, 19, 18, 1),
(470, 20, 18, 1),
(471, 21, 18, 1),
(472, 22, 18, 1),
(473, 23, 18, 1),
(474, 24, 18, 1),
(475, 0, 19, 1),
(476, 1, 19, 1),
(477, 2, 19, 1),
(478, 3, 19, 1),
(479, 4, 19, 1),
(480, 5, 19, 1),
(481, 6, 19, 1),
(482, 7, 19, 1),
(483, 8, 19, 1),
(484, 9, 19, 1),
(485, 10, 19, 1),
(486, 11, 19, 1),
(487, 12, 19, 1),
(488, 13, 19, 1),
(489, 14, 19, 1),
(490, 15, 19, 1),
(491, 16, 19, 1),
(492, 17, 19, 1),
(493, 18, 19, 1),
(494, 19, 19, 1),
(495, 20, 19, 2),
(496, 21, 19, 1),
(497, 22, 19, 1),
(498, 23, 19, 1),
(499, 24, 19, 1),
(500, 0, 20, 1),
(501, 1, 20, 1),
(502, 2, 20, 1),
(503, 3, 20, 1),
(504, 4, 20, 1),
(505, 5, 20, 1),
(506, 6, 20, 1),
(507, 7, 20, 1),
(508, 8, 20, 1),
(509, 9, 20, 1),
(510, 10, 20, 1),
(511, 11, 20, 1),
(512, 12, 20, 1),
(513, 13, 20, 1),
(514, 14, 20, 1),
(515, 15, 20, 1),
(516, 16, 20, 1),
(517, 17, 20, 1),
(518, 18, 20, 1),
(519, 19, 20, 2),
(520, 20, 20, 1),
(521, 21, 20, 1),
(522, 22, 20, 1),
(523, 23, 20, 3),
(524, 24, 20, 1),
(525, 0, 21, 1),
(526, 1, 21, 1),
(527, 2, 21, 2),
(528, 3, 21, 1),
(529, 4, 21, 1),
(530, 5, 21, 1),
(531, 6, 21, 1),
(532, 7, 21, 1),
(533, 8, 21, 1),
(534, 9, 21, 1),
(535, 10, 21, 1),
(536, 11, 21, 1),
(537, 12, 21, 1),
(538, 13, 21, 1),
(539, 14, 21, 1),
(540, 15, 21, 3),
(541, 16, 21, 1),
(542, 17, 21, 1),
(543, 18, 21, 1),
(544, 19, 21, 1),
(545, 20, 21, 2),
(546, 21, 21, 1),
(547, 22, 21, 1),
(548, 23, 21, 1),
(549, 24, 21, 1),
(550, 0, 22, 1),
(551, 1, 22, 1),
(552, 2, 22, 1),
(553, 3, 22, 1),
(554, 4, 22, 1),
(555, 5, 22, 1),
(556, 6, 22, 1),
(557, 7, 22, 1),
(558, 8, 22, 1),
(559, 9, 22, 1),
(560, 10, 22, 1),
(561, 11, 22, 1),
(562, 12, 22, 1),
(563, 13, 22, 1),
(564, 14, 22, 1),
(565, 15, 22, 1),
(566, 16, 22, 1),
(567, 17, 22, 1),
(568, 18, 22, 1),
(569, 19, 22, 1),
(570, 20, 22, 1),
(571, 21, 22, 1),
(572, 22, 22, 1),
(573, 23, 22, 1),
(574, 24, 22, 1),
(575, 0, 23, 1),
(576, 1, 23, 1),
(577, 2, 23, 1),
(578, 3, 23, 1),
(579, 4, 23, 2),
(580, 5, 23, 1),
(581, 6, 23, 1),
(582, 7, 23, 1),
(583, 8, 23, 2),
(584, 9, 23, 3),
(585, 10, 23, 1),
(586, 11, 23, 1),
(587, 12, 23, 1),
(588, 13, 23, 1),
(589, 14, 23, 2),
(590, 15, 23, 1),
(591, 16, 23, 2),
(592, 17, 23, 1),
(593, 18, 23, 1),
(594, 19, 23, 1),
(595, 20, 23, 1),
(596, 21, 23, 1),
(597, 22, 23, 1),
(598, 23, 23, 1),
(599, 24, 23, 3),
(600, 0, 24, 2),
(601, 1, 24, 1),
(602, 2, 24, 2),
(603, 3, 24, 1),
(604, 4, 24, 1),
(605, 5, 24, 1),
(606, 6, 24, 1),
(607, 7, 24, 1),
(608, 8, 24, 1),
(609, 9, 24, 1),
(610, 10, 24, 1),
(611, 11, 24, 1),
(612, 12, 24, 1),
(613, 13, 24, 1),
(614, 14, 24, 1),
(615, 15, 24, 1),
(616, 16, 24, 1),
(617, 17, 24, 1),
(618, 18, 24, 1),
(619, 24, 17, 619),
(620, 24, 18, 620),
(621, 24, 19, 621),
(622, 24, 20, 622),
(623, 24, 21, 623),
(624, 24, 22, 624),
(625, 24, 23, 0),
(626, 24, 24, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
