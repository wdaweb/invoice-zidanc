-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2020-06-19 01:04:55
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
-- 資料表結構 `invoice`
--

CREATE TABLE `invoice` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `period` tinyint(1) UNSIGNED NOT NULL COMMENT '只有分六期，所以不用太多位元，選TinyINT即可。',
  `expend` int(10) UNSIGNED NOT NULL,
  `year` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '若要紀錄完整日期，就用DATE。'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `invoice`
--

INSERT INTO `invoice` (`id`, `code`, `number`, `period`, `expend`, `year`) VALUES
(1, 'FR', '22663334', 3, 111, '2020'),
(2, 'ZZ', '66332211', 1, 350, '2020'),
(3, 'UI', '77666677', 2, 75, '2020'),
(4, 'UX', '77666678', 1, 30, '2020'),
(5, 'GJ', '33661144', 1, 50, '2020'),
(6, 'AB', '55556666', 2, 180, '2020'),
(8, 'IP', '77331112', 2, 370, '2021'),
(10, 'AA', '61270653', 2, 120, '2020'),
(11, 'AA', '47332279', 2, 120, '2020'),
(12, 'AA', '08501338', 2, 120, '2020'),
(13, 'BC', '88554411', 3, 70, '2021'),
(14, 'GH', '88666688', 4, 10, '2020'),
(18, 'CC', '66991122', 4, 15, '2021'),
(19, 'HJ', '63714235', 1, 60, '2021'),
(20, 'JA', '28999202', 6, 240, '2022'),
(21, 'AB', '42666238', 6, 160, '2021'),
(22, 'BC', '40760575', 5, 210, '2020'),
(23, 'FF', '52510042', 6, 210, '2021'),
(24, 'LH', '76145555', 4, 47, '2020'),
(25, 'BD', '03657991', 2, 65, '2021'),
(26, 'MQ', '27962715', 1, 22, '2021'),
(27, 'TX', '86786238', 2, 92, '2021'),
(29, 'YU', '71359546', 1, 230, '2020'),
(31, 'JK', '11224947', 1, 205, '2020'),
(32, 'WE', '34564007', 1, 77, '2020'),
(33, 'QR', '12224947', 2, 350, '2020'),
(34, 'MN', '91313945', 1, 233, '2020');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
