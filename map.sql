-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 15, 2013 at 06:33 PM
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
  PRIMARY KEY (`index`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `base`
--

INSERT INTO `base` (`index`, `sizeX`, `sizeY`) VALUES
(1, 25, 25);

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE IF NOT EXISTS `buildings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `posX` int(11) DEFAULT NULL,
  `posY` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=559 ;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` (`id`, `posX`, `posY`, `type`) VALUES
(545, 8, 9, 1),
(546, 8, 9, 1),
(547, 22, 18, 1),
(548, 8, 23, 1),
(549, 8, 23, 1),
(550, 0, 0, 0),
(551, 8, 9, 1),
(552, 8, 9, 1),
(553, 8, 9, 1),
(554, 8, 9, 1),
(555, 0, 0, 0),
(556, 0, 0, 0),
(557, 0, 0, 0),
(558, 0, 0, 0);

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
(1, 1, 1, 0),
(2, 0, 0, 1),
(3, 0, 1, 1),
(4, 0, 2, 1),
(5, 0, 3, 1),
(6, 0, 4, 1),
(7, 0, 5, 0),
(8, 0, 6, 1),
(9, 0, 7, 1),
(10, 0, 8, 1),
(11, 0, 9, 1),
(12, 0, 10, 1),
(13, 0, 11, 1),
(14, 0, 12, 1),
(15, 0, 13, 1),
(16, 0, 14, 1),
(17, 0, 15, 0),
(18, 0, 16, 1),
(19, 0, 17, 1),
(20, 0, 18, 1),
(21, 0, 19, 1),
(22, 0, 20, 1),
(23, 0, 21, 1),
(24, 0, 22, 1),
(25, 0, 23, 1),
(26, 0, 24, 1),
(27, 1, 0, 1),
(28, 1, 1, 1),
(29, 1, 2, 1),
(30, 1, 3, 1),
(31, 1, 4, 1),
(32, 1, 5, 1),
(33, 1, 6, 1),
(34, 1, 7, 0),
(35, 1, 8, 1),
(36, 1, 9, 1),
(37, 1, 10, 1),
(38, 1, 11, 1),
(39, 1, 12, 1),
(40, 1, 13, 1),
(41, 1, 14, 1),
(42, 1, 15, 1),
(43, 1, 16, 1),
(44, 1, 17, 1),
(45, 1, 18, 1),
(46, 1, 19, 1),
(47, 1, 20, 1),
(48, 1, 21, 1),
(49, 1, 22, 1),
(50, 1, 23, 0),
(51, 1, 24, 0),
(52, 2, 0, 0),
(53, 2, 1, 1),
(54, 2, 2, 1),
(55, 2, 3, 1),
(56, 2, 4, 1),
(57, 2, 5, 1),
(58, 2, 6, 1),
(59, 2, 7, 1),
(60, 2, 8, 1),
(61, 2, 9, 1),
(62, 2, 10, 0),
(63, 2, 11, 1),
(64, 2, 12, 1),
(65, 2, 13, 1),
(66, 2, 14, 1),
(67, 2, 15, 1),
(68, 2, 16, 1),
(69, 2, 17, 1),
(70, 2, 18, 0),
(71, 2, 19, 1),
(72, 2, 20, 1),
(73, 2, 21, 1),
(74, 2, 22, 1),
(75, 2, 23, 1),
(76, 2, 24, 1),
(77, 3, 0, 1),
(78, 3, 1, 1),
(79, 3, 2, 1),
(80, 3, 3, 1),
(81, 3, 4, 1),
(82, 3, 5, 1),
(83, 3, 6, 1),
(84, 3, 7, 1),
(85, 3, 8, 1),
(86, 3, 9, 1),
(87, 3, 10, 1),
(88, 3, 11, 1),
(89, 3, 12, 1),
(90, 3, 13, 1),
(91, 3, 14, 1),
(92, 3, 15, 1),
(93, 3, 16, 0),
(94, 3, 17, 1),
(95, 3, 18, 1),
(96, 3, 19, 1),
(97, 3, 20, 1),
(98, 3, 21, 1),
(99, 3, 22, 1),
(100, 3, 23, 1),
(101, 3, 24, 1),
(102, 4, 0, 1),
(103, 4, 1, 1),
(104, 4, 2, 1),
(105, 4, 3, 1),
(106, 4, 4, 1),
(107, 4, 5, 1),
(108, 4, 6, 1),
(109, 4, 7, 1),
(110, 4, 8, 1),
(111, 4, 9, 1),
(112, 4, 10, 1),
(113, 4, 11, 1),
(114, 4, 12, 1),
(115, 4, 13, 1),
(116, 4, 14, 1),
(117, 4, 15, 1),
(118, 4, 16, 1),
(119, 4, 17, 1),
(120, 4, 18, 1),
(121, 4, 19, 1),
(122, 4, 20, 1),
(123, 4, 21, 1),
(124, 4, 22, 1),
(125, 4, 23, 1),
(126, 4, 24, 1),
(127, 5, 0, 1),
(128, 5, 1, 1),
(129, 5, 2, 1),
(130, 5, 3, 1),
(131, 5, 4, 1),
(132, 5, 5, 1),
(133, 5, 6, 1),
(134, 5, 7, 1),
(135, 5, 8, 1),
(136, 5, 9, 1),
(137, 5, 10, 0),
(138, 5, 11, 1),
(139, 5, 12, 1),
(140, 5, 13, 1),
(141, 5, 14, 1),
(142, 5, 15, 1),
(143, 5, 16, 1),
(144, 5, 17, 1),
(145, 5, 18, 1),
(146, 5, 19, 1),
(147, 5, 20, 1),
(148, 5, 21, 1),
(149, 5, 22, 1),
(150, 5, 23, 1),
(151, 5, 24, 1),
(152, 6, 0, 1),
(153, 6, 1, 1),
(154, 6, 2, 1),
(155, 6, 3, 1),
(156, 6, 4, 1),
(157, 6, 5, 1),
(158, 6, 6, 1),
(159, 6, 7, 1),
(160, 6, 8, 1),
(161, 6, 9, 1),
(162, 6, 10, 1),
(163, 6, 11, 1),
(164, 6, 12, 1),
(165, 6, 13, 1),
(166, 6, 14, 1),
(167, 6, 15, 1),
(168, 6, 16, 1),
(169, 6, 17, 1),
(170, 6, 18, 1),
(171, 6, 19, 1),
(172, 6, 20, 1),
(173, 6, 21, 1),
(174, 6, 22, 1),
(175, 6, 23, 1),
(176, 6, 24, 1),
(177, 7, 0, 1),
(178, 7, 1, 1),
(179, 7, 2, 1),
(180, 7, 3, 1),
(181, 7, 4, 1),
(182, 7, 5, 1),
(183, 7, 6, 1),
(184, 7, 7, 1),
(185, 7, 8, 1),
(186, 7, 9, 1),
(187, 7, 10, 1),
(188, 7, 11, 1),
(189, 7, 12, 1),
(190, 7, 13, 1),
(191, 7, 14, 1),
(192, 7, 15, 1),
(193, 7, 16, 1),
(194, 7, 17, 1),
(195, 7, 18, 1),
(196, 7, 19, 1),
(197, 7, 20, 1),
(198, 7, 21, 1),
(199, 7, 22, 1),
(200, 7, 23, 1),
(201, 7, 24, 1),
(202, 8, 0, 1),
(203, 8, 1, 1),
(204, 8, 2, 1),
(205, 8, 3, 1),
(206, 8, 4, 1),
(207, 8, 5, 1),
(208, 8, 6, 1),
(209, 8, 7, 1),
(210, 8, 8, 1),
(211, 8, 9, 1),
(212, 8, 10, 1),
(213, 8, 11, 1),
(214, 8, 12, 1),
(215, 8, 13, 1),
(216, 8, 14, 1),
(217, 8, 15, 1),
(218, 8, 16, 1),
(219, 8, 17, 1),
(220, 8, 18, 1),
(221, 8, 19, 1),
(222, 8, 20, 0),
(223, 8, 21, 1),
(224, 8, 22, 1),
(225, 8, 23, 1),
(226, 8, 24, 1),
(227, 9, 0, 1),
(228, 9, 1, 1),
(229, 9, 2, 1),
(230, 9, 3, 1),
(231, 9, 4, 1),
(232, 9, 5, 1),
(233, 9, 6, 1),
(234, 9, 7, 1),
(235, 9, 8, 1),
(236, 9, 9, 1),
(237, 9, 10, 1),
(238, 9, 11, 1),
(239, 9, 12, 1),
(240, 9, 13, 1),
(241, 9, 14, 0),
(242, 9, 15, 0),
(243, 9, 16, 1),
(244, 9, 17, 1),
(245, 9, 18, 1),
(246, 9, 19, 1),
(247, 9, 20, 1),
(248, 9, 21, 1),
(249, 9, 22, 1),
(250, 9, 23, 1),
(251, 9, 24, 1),
(252, 10, 0, 1),
(253, 10, 1, 1),
(254, 10, 2, 1),
(255, 10, 3, 1),
(256, 10, 4, 1),
(257, 10, 5, 1),
(258, 10, 6, 1),
(259, 10, 7, 1),
(260, 10, 8, 1),
(261, 10, 9, 1),
(262, 10, 10, 1),
(263, 10, 11, 1),
(264, 10, 12, 1),
(265, 10, 13, 1),
(266, 10, 14, 1),
(267, 10, 15, 1),
(268, 10, 16, 1),
(269, 10, 17, 1),
(270, 10, 18, 1),
(271, 10, 19, 1),
(272, 10, 20, 1),
(273, 10, 21, 1),
(274, 10, 22, 1),
(275, 10, 23, 1),
(276, 10, 24, 1),
(277, 11, 0, 1),
(278, 11, 1, 1),
(279, 11, 2, 1),
(280, 11, 3, 1),
(281, 11, 4, 1),
(282, 11, 5, 1),
(283, 11, 6, 1),
(284, 11, 7, 0),
(285, 11, 8, 1),
(286, 11, 9, 1),
(287, 11, 10, 1),
(288, 11, 11, 1),
(289, 11, 12, 1),
(290, 11, 13, 1),
(291, 11, 14, 1),
(292, 11, 15, 1),
(293, 11, 16, 1),
(294, 11, 17, 1),
(295, 11, 18, 1),
(296, 11, 19, 1),
(297, 11, 20, 1),
(298, 11, 21, 1),
(299, 11, 22, 1),
(300, 11, 23, 1),
(301, 11, 24, 1),
(302, 12, 0, 1),
(303, 12, 1, 1),
(304, 12, 2, 1),
(305, 12, 3, 1),
(306, 12, 4, 1),
(307, 12, 5, 1),
(308, 12, 6, 1),
(309, 12, 7, 1),
(310, 12, 8, 1),
(311, 12, 9, 1),
(312, 12, 10, 1),
(313, 12, 11, 1),
(314, 12, 12, 1),
(315, 12, 13, 1),
(316, 12, 14, 1),
(317, 12, 15, 1),
(318, 12, 16, 1),
(319, 12, 17, 1),
(320, 12, 18, 1),
(321, 12, 19, 1),
(322, 12, 20, 1),
(323, 12, 21, 1),
(324, 12, 22, 1),
(325, 12, 23, 1),
(326, 12, 24, 1),
(327, 13, 0, 1),
(328, 13, 1, 1),
(329, 13, 2, 1),
(330, 13, 3, 1),
(331, 13, 4, 1),
(332, 13, 5, 1),
(333, 13, 6, 1),
(334, 13, 7, 1),
(335, 13, 8, 1),
(336, 13, 9, 1),
(337, 13, 10, 1),
(338, 13, 11, 1),
(339, 13, 12, 1),
(340, 13, 13, 1),
(341, 13, 14, 1),
(342, 13, 15, 1),
(343, 13, 16, 1),
(344, 13, 17, 1),
(345, 13, 18, 1),
(346, 13, 19, 1),
(347, 13, 20, 1),
(348, 13, 21, 1),
(349, 13, 22, 1),
(350, 13, 23, 1),
(351, 13, 24, 1),
(352, 14, 0, 1),
(353, 14, 1, 1),
(354, 14, 2, 1),
(355, 14, 3, 1),
(356, 14, 4, 1),
(357, 14, 5, 1),
(358, 14, 6, 1),
(359, 14, 7, 1),
(360, 14, 8, 1),
(361, 14, 9, 1),
(362, 14, 10, 1),
(363, 14, 11, 1),
(364, 14, 12, 1),
(365, 14, 13, 1),
(366, 14, 14, 1),
(367, 14, 15, 1),
(368, 14, 16, 1),
(369, 14, 17, 0),
(370, 14, 18, 1),
(371, 14, 19, 1),
(372, 14, 20, 1),
(373, 14, 21, 1),
(374, 14, 22, 1),
(375, 14, 23, 1),
(376, 14, 24, 1),
(377, 15, 0, 1),
(378, 15, 1, 1),
(379, 15, 2, 1),
(380, 15, 3, 1),
(381, 15, 4, 1),
(382, 15, 5, 1),
(383, 15, 6, 1),
(384, 15, 7, 1),
(385, 15, 8, 1),
(386, 15, 9, 1),
(387, 15, 10, 1),
(388, 15, 11, 1),
(389, 15, 12, 1),
(390, 15, 13, 1),
(391, 15, 14, 1),
(392, 15, 15, 1),
(393, 15, 16, 1),
(394, 15, 17, 0),
(395, 15, 18, 1),
(396, 15, 19, 1),
(397, 15, 20, 1),
(398, 15, 21, 1),
(399, 15, 22, 1),
(400, 15, 23, 0),
(401, 15, 24, 1),
(402, 16, 0, 1),
(403, 16, 1, 1),
(404, 16, 2, 1),
(405, 16, 3, 1),
(406, 16, 4, 1),
(407, 16, 5, 1),
(408, 16, 6, 1),
(409, 16, 7, 1),
(410, 16, 8, 1),
(411, 16, 9, 1),
(412, 16, 10, 1),
(413, 16, 11, 1),
(414, 16, 12, 1),
(415, 16, 13, 0),
(416, 16, 14, 1),
(417, 16, 15, 1),
(418, 16, 16, 1),
(419, 16, 17, 1),
(420, 16, 18, 1),
(421, 16, 19, 1),
(422, 16, 20, 1),
(423, 16, 21, 1),
(424, 16, 22, 1),
(425, 16, 23, 1),
(426, 16, 24, 1),
(427, 17, 0, 1),
(428, 17, 1, 1),
(429, 17, 2, 1),
(430, 17, 3, 1),
(431, 17, 4, 1),
(432, 17, 5, 1),
(433, 17, 6, 1),
(434, 17, 7, 1),
(435, 17, 8, 1),
(436, 17, 9, 1),
(437, 17, 10, 1),
(438, 17, 11, 1),
(439, 17, 12, 1),
(440, 17, 13, 1),
(441, 17, 14, 0),
(442, 17, 15, 1),
(443, 17, 16, 1),
(444, 17, 17, 1),
(445, 17, 18, 1),
(446, 17, 19, 1),
(447, 17, 20, 1),
(448, 17, 21, 1),
(449, 17, 22, 1),
(450, 17, 23, 0),
(451, 17, 24, 1),
(452, 18, 0, 1),
(453, 18, 1, 1),
(454, 18, 2, 1),
(455, 18, 3, 1),
(456, 18, 4, 1),
(457, 18, 5, 1),
(458, 18, 6, 1),
(459, 18, 7, 1),
(460, 18, 8, 1),
(461, 18, 9, 1),
(462, 18, 10, 1),
(463, 18, 11, 0),
(464, 18, 12, 1),
(465, 18, 13, 1),
(466, 18, 14, 1),
(467, 18, 15, 1),
(468, 18, 16, 1),
(469, 18, 17, 1),
(470, 18, 18, 1),
(471, 18, 19, 1),
(472, 18, 20, 1),
(473, 18, 21, 0),
(474, 18, 22, 1),
(475, 18, 23, 1),
(476, 18, 24, 1),
(477, 19, 0, 1),
(478, 19, 1, 1),
(479, 19, 2, 1),
(480, 19, 3, 1),
(481, 19, 4, 1),
(482, 19, 5, 1),
(483, 19, 6, 1),
(484, 19, 7, 1),
(485, 19, 8, 0),
(486, 19, 9, 1),
(487, 19, 10, 1),
(488, 19, 11, 1),
(489, 19, 12, 1),
(490, 19, 13, 1),
(491, 19, 14, 1),
(492, 19, 15, 1),
(493, 19, 16, 1),
(494, 19, 17, 0),
(495, 19, 18, 1),
(496, 19, 19, 1),
(497, 19, 20, 1),
(498, 19, 21, 1),
(499, 19, 22, 1),
(500, 19, 23, 1),
(501, 19, 24, 1),
(502, 20, 0, 1),
(503, 20, 1, 1),
(504, 20, 2, 1),
(505, 20, 3, 1),
(506, 20, 4, 1),
(507, 20, 5, 1),
(508, 20, 6, 1),
(509, 20, 7, 1),
(510, 20, 8, 1),
(511, 20, 9, 1),
(512, 20, 10, 1),
(513, 20, 11, 1),
(514, 20, 12, 1),
(515, 20, 13, 1),
(516, 20, 14, 1),
(517, 20, 15, 1),
(518, 20, 16, 1),
(519, 20, 17, 1),
(520, 20, 18, 1),
(521, 20, 19, 1),
(522, 20, 20, 1),
(523, 20, 21, 1),
(524, 20, 22, 1),
(525, 20, 23, 1),
(526, 20, 24, 1),
(527, 21, 0, 1),
(528, 21, 1, 1),
(529, 21, 2, 1),
(530, 21, 3, 1),
(531, 21, 4, 1),
(532, 21, 5, 1),
(533, 21, 6, 1),
(534, 21, 7, 1),
(535, 21, 8, 0),
(536, 21, 9, 1),
(537, 21, 10, 1),
(538, 21, 11, 1),
(539, 21, 12, 1),
(540, 21, 13, 1),
(541, 21, 14, 1),
(542, 21, 15, 1),
(543, 21, 16, 1),
(544, 21, 17, 1),
(545, 21, 18, 0),
(546, 21, 19, 1),
(547, 21, 20, 1),
(548, 21, 21, 1),
(549, 21, 22, 1),
(550, 21, 23, 1),
(551, 21, 24, 1),
(552, 22, 0, 1),
(553, 22, 1, 1),
(554, 22, 2, 0),
(555, 22, 3, 1),
(556, 22, 4, 1),
(557, 22, 5, 1),
(558, 22, 6, 1),
(559, 22, 7, 1),
(560, 22, 8, 1),
(561, 22, 9, 1),
(562, 22, 10, 1),
(563, 22, 11, 1),
(564, 22, 12, 1),
(565, 22, 13, 1),
(566, 22, 14, 1),
(567, 22, 15, 1),
(568, 22, 16, 1),
(569, 22, 17, 1),
(570, 22, 18, 1),
(571, 22, 19, 1),
(572, 22, 20, 1),
(573, 22, 21, 1),
(574, 22, 22, 1),
(575, 22, 23, 1),
(576, 22, 24, 1),
(577, 23, 0, 1),
(578, 23, 1, 1),
(579, 23, 2, 1),
(580, 23, 3, 1),
(581, 23, 4, 1),
(582, 23, 5, 1),
(583, 23, 6, 1),
(584, 23, 7, 1),
(585, 23, 8, 0),
(586, 23, 9, 1),
(587, 23, 10, 1),
(588, 23, 11, 1),
(589, 23, 12, 1),
(590, 23, 13, 1),
(591, 23, 14, 1),
(592, 23, 15, 1),
(593, 23, 16, 1),
(594, 23, 17, 1),
(595, 23, 18, 1),
(596, 23, 19, 1),
(597, 23, 20, 1),
(598, 23, 21, 0),
(599, 23, 22, 1),
(600, 23, 23, 1),
(601, 23, 24, 1),
(602, 24, 0, 1),
(603, 24, 1, 1),
(604, 24, 2, 1),
(605, 24, 3, 1),
(606, 24, 4, 1),
(607, 24, 5, 1),
(608, 24, 6, 1),
(609, 24, 7, 1),
(610, 24, 8, 1),
(611, 24, 9, 1),
(612, 24, 10, 0),
(613, 24, 11, 1),
(614, 24, 12, 1),
(615, 24, 13, 1),
(616, 24, 14, 1),
(617, 24, 15, 1),
(618, 24, 16, 1),
(619, 24, 17, 1),
(620, 24, 18, 1),
(621, 24, 19, 1),
(622, 24, 20, 1),
(623, 24, 21, 1),
(624, 24, 22, 0),
(625, 24, 23, 0),
(626, 24, 24, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;