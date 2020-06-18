-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2020-06-19 01:03:35
-- 伺服器版本： 10.4.11-MariaDB
-- PHP 版本： 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `invoice`
--

-- --------------------------------------------------------

--
-- 資料表結構 `award_number`
--

CREATE TABLE `award_number` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '跟財政部API有關係，真的要去超商兌獎時，發票code會是唯一。',
  `number` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `period` tinyint(1) UNSIGNED NOT NULL,
  `year` year(4) NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `award_number`
--

INSERT INTO `award_number` (`id`, `code`, `number`, `period`, `year`, `type`) VALUES
(5, NULL, '91911374', 2, 2020, 1),
(6, NULL, '08501338', 2, 2020, 2),
(7, NULL, '57161318', 2, 2020, 3),
(8, NULL, '23570653', 2, 2020, 3),
(9, NULL, '47332279', 2, 2020, 3),
(10, NULL, '519', 2, 2020, 4),
(11, NULL, '', 2, 2020, 4),
(12, NULL, '', 2, 2020, 4),
(13, NULL, '12620024', 1, 2020, 1),
(14, NULL, '39793895', 1, 2020, 2),
(15, NULL, '67913945', 1, 2020, 3),
(16, NULL, '09954061', 1, 2020, 3),
(17, NULL, '54574947', 1, 2020, 3),
(18, NULL, '007', 1, 2020, 4),
(19, NULL, '', 1, 2020, 4),
(20, NULL, '', 1, 2020, 4),
(29, NULL, '20048019', 3, 2021, 1),
(30, NULL, '02142605', 3, 2021, 2),
(31, NULL, '21240109', 3, 2021, 3),
(32, NULL, '78323535', 3, 2021, 3),
(33, NULL, '18549847', 3, 2021, 3),
(34, NULL, '706', 3, 2021, 4),
(35, NULL, '574', 3, 2021, 4),
(36, NULL, '', 3, 2021, 4),
(37, NULL, '12342126', 2, 2021, 1),
(38, NULL, '80740977', 2, 2021, 2),
(39, NULL, '36822639', 2, 2021, 3),
(40, NULL, '38786238', 2, 2021, 3),
(41, NULL, '87204837', 2, 2021, 3),
(42, NULL, '991', 2, 2021, 4),
(43, NULL, '715', 2, 2021, 4),
(44, NULL, '', 2, 2021, 4);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `award_number`
--
ALTER TABLE `award_number`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `award_number`
--
ALTER TABLE `award_number`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
