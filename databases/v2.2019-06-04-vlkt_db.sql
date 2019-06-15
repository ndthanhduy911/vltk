-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 04, 2019 lúc 12:11 PM
-- Phiên bản máy phục vụ: 10.1.38-MariaDB
-- Phiên bản PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ab_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accessories`
--

CREATE TABLE `accessories` (
  `id` int(11) NOT NULL,
  `assets_id` int(11) DEFAULT NULL,
  `serial_number` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `mac` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `cat_assets_id` int(11) NOT NULL,
  `chain_id` int(11) DEFAULT NULL,
  `buy_date` date NOT NULL,
  `guarantee_date` date NOT NULL,
  `unit_price_pro` double NOT NULL,
  `depreciation_time` int(11) DEFAULT NULL,
  `depreciation_type` int(11) DEFAULT NULL,
  `depreciation_tm` int(2) DEFAULT NULL,
  `quality` int(1) NOT NULL,
  `status` int(1) NOT NULL,
  `wh_id` int(11) DEFAULT NULL,
  `lost_id` int(11) DEFAULT NULL,
  `whi_id` int(11) DEFAULT NULL,
  `who_id` int(11) DEFAULT NULL,
  `is_draft` int(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `accessories`
--

INSERT INTO `accessories` (`id`, `assets_id`, `serial_number`, `mac`, `dept_id`, `manager_id`, `cat_assets_id`, `chain_id`, `buy_date`, `guarantee_date`, `unit_price_pro`, `depreciation_time`, `depreciation_type`, `depreciation_tm`, `quality`, `status`, `wh_id`, `lost_id`, `whi_id`, `who_id`, `is_draft`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, 3, '1897632634', '', NULL, NULL, 18, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 1, 2, 1, NULL, 2, NULL, 1, '2019-06-04 16:49:52', '2019-06-04 16:49:52', 0),
(2, 4, '12334567810', '', NULL, NULL, 18, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 1, 2, 1, NULL, 2, NULL, 1, '2019-06-04 16:49:52', '2019-06-04 16:49:52', 0),
(3, 5, '1233456789', '', NULL, NULL, 17, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 2, 2, 1, NULL, 1, NULL, 1, '2019-06-04 16:50:12', '2019-06-04 16:50:12', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accessories_log`
--

CREATE TABLE `accessories_log` (
  `id` int(11) NOT NULL,
  `assets_log_id` int(11) DEFAULT NULL,
  `accessories_id` int(11) DEFAULT NULL,
  `wh_id` int(11) DEFAULT NULL,
  `serial_number` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `mac` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `cat_assets_id` int(11) NOT NULL,
  `chain_id` int(11) DEFAULT NULL,
  `buy_date` date NOT NULL,
  `guarantee_date` date NOT NULL,
  `unit_price_pro` double NOT NULL,
  `depreciation_time` int(11) DEFAULT NULL,
  `depreciation_type` int(11) DEFAULT NULL,
  `depreciation_tm` int(2) DEFAULT NULL,
  `quality` int(1) NOT NULL,
  `status` int(1) NOT NULL,
  `lost_id` int(11) DEFAULT NULL,
  `whi_id` int(11) DEFAULT NULL,
  `who_id` int(11) DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `datetime_aplied` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `accessories_log`
--

INSERT INTO `accessories_log` (`id`, `assets_log_id`, `accessories_id`, `wh_id`, `serial_number`, `mac`, `dept_id`, `manager_id`, `cat_assets_id`, `chain_id`, `buy_date`, `guarantee_date`, `unit_price_pro`, `depreciation_time`, `depreciation_type`, `depreciation_tm`, `quality`, `status`, `lost_id`, `whi_id`, `who_id`, `step`, `datetime_aplied`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, 1, 3, 1, '1233456789', '', NULL, NULL, 17, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 2, 2, NULL, 1, NULL, 3, '2019-06-04 16:49:00', '2019-05-31 14:29:35', '2019-05-31 14:29:35', 0),
(2, 2, 1, 1, '1897632634', '', NULL, NULL, 18, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 1, 2, NULL, 2, NULL, 3, '2019-06-04 16:49:00', '2019-05-31 14:34:16', '2019-05-31 14:34:16', 0),
(3, 3, 2, 1, '12334567810', '', NULL, NULL, 18, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 1, 2, NULL, 2, NULL, 3, '2019-06-04 16:49:00', '2019-05-31 14:35:23', '2019-05-31 14:35:23', 0),
(4, 6, 2, 1, '12334567810', '', NULL, NULL, 18, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 1, 1, NULL, NULL, 1, 3, '2019-06-04 16:50:00', '2019-06-04 16:50:59', '2019-06-04 16:50:59', 0),
(5, 9, 3, 1, '1233456789', '', NULL, NULL, 17, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 2, 1, NULL, NULL, 1, 3, '2019-06-04 16:50:00', '2019-06-04 16:51:50', '2019-06-04 16:51:50', 0),
(6, 10, 1, 1, '1897632634', '', NULL, NULL, 18, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 1, 1, NULL, NULL, 1, 3, '2019-06-04 16:50:00', '2019-06-04 16:52:03', '2019-06-04 16:52:03', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `serial_number` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `mac` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `cat_assets_id` int(11) NOT NULL,
  `chain_id` int(11) DEFAULT NULL,
  `buy_date` date NOT NULL,
  `guarantee_date` date NOT NULL,
  `unit_price_pro` double NOT NULL,
  `depreciation_time` int(11) DEFAULT NULL,
  `depreciation_type` int(11) DEFAULT NULL,
  `depreciation_tm` int(2) DEFAULT NULL,
  `quality` int(1) NOT NULL,
  `status` int(1) NOT NULL,
  `wh_id` int(11) DEFAULT NULL,
  `lost_id` int(11) DEFAULT NULL,
  `whi_id` int(11) DEFAULT NULL,
  `who_id` int(11) DEFAULT NULL,
  `is_draft` int(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `assets`
--

INSERT INTO `assets` (`id`, `serial_number`, `mac`, `dept_id`, `manager_id`, `cat_assets_id`, `chain_id`, `buy_date`, `guarantee_date`, `unit_price_pro`, `depreciation_time`, `depreciation_type`, `depreciation_tm`, `quality`, `status`, `wh_id`, `lost_id`, `whi_id`, `who_id`, `is_draft`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, '18A912CAC0002', '', NULL, NULL, 13, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 2, 2, 1, NULL, 3, NULL, 1, '2019-06-04 16:49:40', '2019-06-04 16:49:40', 0),
(2, '18A912CAC001', '', NULL, NULL, 13, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 2, 2, 1, NULL, 3, NULL, 1, '2019-06-04 16:49:40', '2019-06-04 16:49:40', 0),
(3, '28117941', '', NULL, NULL, 7, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 1, 2, 1, NULL, 2, NULL, 1, '2019-06-04 16:49:52', '2019-06-04 16:49:52', 0),
(4, '28117944', '', NULL, NULL, 7, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 1, 2, 1, NULL, 2, NULL, 1, '2019-06-04 16:49:52', '2019-06-04 16:49:52', 0),
(5, '13517779', '', NULL, NULL, 11, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 2, 2, 1, NULL, 1, NULL, 1, '2019-06-04 16:50:12', '2019-06-04 16:50:12', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `assets_log`
--

CREATE TABLE `assets_log` (
  `id` int(11) NOT NULL,
  `wh_id` int(11) DEFAULT NULL,
  `assets_id` int(11) DEFAULT NULL,
  `serial_number` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `mac` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `cat_assets_id` int(11) NOT NULL,
  `chain_id` int(11) DEFAULT NULL,
  `buy_date` date NOT NULL,
  `guarantee_date` date NOT NULL,
  `unit_price_pro` double NOT NULL,
  `depreciation_time` int(11) DEFAULT NULL,
  `depreciation_type` int(11) DEFAULT NULL,
  `depreciation_tm` int(2) DEFAULT NULL,
  `quality` int(1) NOT NULL,
  `status` int(1) NOT NULL,
  `lost_id` int(11) DEFAULT NULL,
  `whi_id` int(11) DEFAULT NULL,
  `who_id` int(11) DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `datetime_aplied` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `assets_log`
--

INSERT INTO `assets_log` (`id`, `wh_id`, `assets_id`, `serial_number`, `mac`, `dept_id`, `manager_id`, `cat_assets_id`, `chain_id`, `buy_date`, `guarantee_date`, `unit_price_pro`, `depreciation_time`, `depreciation_type`, `depreciation_tm`, `quality`, `status`, `lost_id`, `whi_id`, `who_id`, `step`, `datetime_aplied`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, 1, 5, '13517779', '', NULL, NULL, 11, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 2, 2, NULL, 1, NULL, 3, '2019-06-04 16:49:00', '2019-05-31 14:29:02', '2019-05-31 14:29:38', 0),
(2, 1, 3, '28117941', '', NULL, NULL, 7, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 1, 2, NULL, 2, NULL, 3, '2019-06-04 16:49:00', '2019-05-31 14:33:51', '2019-05-31 14:34:23', 0),
(3, 1, 4, '28117944', '', NULL, NULL, 7, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 1, 2, NULL, 2, NULL, 3, '2019-06-04 16:49:00', '2019-05-31 14:34:57', '2019-05-31 14:35:25', 0),
(4, 1, 1, '18A912CAC0002', '', NULL, NULL, 13, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 2, 2, NULL, 3, NULL, 3, '2019-06-04 16:49:00', '2019-05-31 14:40:40', '2019-05-31 14:40:47', 0),
(5, 1, 2, '18A912CAC001', '', NULL, NULL, 13, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 2, 2, NULL, 3, NULL, 3, '2019-06-04 16:49:00', '2019-05-31 14:41:30', '2019-05-31 14:41:33', 0),
(6, 1, 4, '28117944', '', NULL, NULL, 7, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 1, 1, NULL, NULL, 1, 3, '2019-06-04 16:50:00', '2019-06-04 16:50:59', '2019-06-04 16:51:09', 0),
(7, 1, 1, '18A912CAC0002', '', NULL, NULL, 13, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 2, 1, NULL, NULL, 1, 3, '2019-06-04 16:50:00', '2019-06-04 16:51:22', '2019-06-04 16:51:34', 0),
(8, 1, 2, '18A912CAC001', '', NULL, NULL, 13, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 2, 1, NULL, NULL, 1, 3, '2019-06-04 16:50:00', '2019-06-04 16:51:39', '2019-06-04 16:51:45', 0),
(9, 1, 5, '13517779', '', NULL, NULL, 11, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 2, 1, NULL, NULL, 1, 3, '2019-06-04 16:50:00', '2019-06-04 16:51:49', '2019-06-04 16:51:53', 0),
(10, 1, 3, '28117941', '', NULL, NULL, 7, NULL, '2019-05-31', '2019-05-31', 100, 0, 0, 0, 1, 1, NULL, NULL, 1, 3, '2019-06-04 16:50:00', '2019-06-04 16:52:03', '2019-06-04 16:52:06', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `abbreviation` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `abbreviation`, `description`, `status`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, 'Chức vụ', NULL, '', 1, '2019-03-21 08:37:02', '2019-03-21 08:37:02', 0),
(2, 'Bộ phận', NULL, '', 1, '2019-03-21 08:37:02', '2019-03-21 08:37:02', 0),
(4, 'Tiền tệ', NULL, '', 1, '2019-03-21 08:37:02', '2019-03-21 08:37:02', 0),
(5, 'Quốc gia', NULL, '', 1, '2019-03-21 08:37:02', '2019-03-21 08:37:02', 0),
(6, 'Hợp đồng', NULL, '', 1, '2019-03-21 08:37:02', '2019-03-21 08:37:02', 0),
(7, 'Nhóm', NULL, '', 1, '2019-03-21 08:37:02', '2019-03-21 08:37:02', 0),
(8, 'Đợn vị tính', NULL, '', 1, '2019-03-21 08:37:02', '2019-03-21 08:37:02', 0),
(9, 'Nhà cung cấp', NULL, '', 1, '2019-03-21 08:37:02', '2019-03-21 08:37:02', 0),
(10, 'Hãng sản xuẩt', NULL, '', 1, '2019-03-21 08:37:02', '2019-03-21 08:37:02', 0),
(11, 'Chủng loại', NULL, '', 1, '2019-03-21 08:37:02', '2019-03-21 08:37:02', 0),
(12, 'Phụ kiện', NULL, '', 1, '2019-03-21 08:37:02', '2019-03-21 08:37:02', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_assets`
--

CREATE TABLE `cat_assets` (
  `id` int(11) NOT NULL,
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ma danh muc tai san',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ten danh muc tai san',
  `class_id` int(11) NOT NULL COMMENT 'ID nhom tai san',
  `species_id` int(11) NOT NULL COMMENT 'ID chung loai tai san',
  `made_id` int(11) NOT NULL COMMENT 'ID quoc gia san xuat',
  `producer_id` int(11) NOT NULL COMMENT 'ID nha san suat',
  `unit_id` int(11) NOT NULL COMMENT 'ID don vi tinh',
  `currencies_id` int(11) NOT NULL COMMENT 'ID don vi tien te',
  `specification` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Thong so ky thuat',
  `status` int(1) NOT NULL COMMENT 'Trang thai',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cat_assets`
--

INSERT INTO `cat_assets` (`id`, `code`, `name`, `class_id`, `species_id`, `made_id`, `producer_id`, `unit_id`, `currencies_id`, `specification`, `status`, `created_at`, `updated_at`, `is_delete`) VALUES
(4, 'ATI02', 'Anten indoor 5.0 GHz', 1, 6, 7, 1, 2, 2, 'Băng thông lên đến : 5.0 GHz.\r\nChế độ Hoạt động : . đa hướng , half-duplex , tự động chuyển mạch thông qua cảm biến cao cấp\r\nĐộ lợi:11+-1dBi\r\nNhiệt độ hoạt động : -40 đến 70 độ .\r\nĐộ ẩm hoạt động : độ ẩm tương đối lên đến 95%.\r\nVật liệu : nhựa lõi thép', 1, '2019-04-02 22:13:47', '2019-05-29 13:57:23', 0),
(5, 'ATO01', 'Anten outdoor 2.4 GHGz', 1, 9, 7, 10, 2, 2, 'Model: AOA-2458-59-TFL\r\nFrequency: 2.4 GHz dual band \r\nVSWR: 2.0 \r\nGain: 9 dBi (5 GHz), 5 dBi (2.4 Ghz)\r\nPolarization: Vertical \r\nPower Handling: 50 Watts \r\nImpedance: 50 ohm \r\nConnector: N Female\r\nHeight: 10.2 inches including connector (260mm)', 1, '2019-04-03 08:14:11', '2019-05-29 13:55:26', 0),
(6, 'ATO02', 'Anten outdoor 5.0 GHz', 1, 9, 7, 10, 2, 2, 'Model: AOA-2458-59-TFL\r\nFrequency: 5.0 GHz dual band \r\nVSWR: 2.0 \r\nGain: 9 dBi (5 GHz), 5 dBi (2.4 Ghz)\r\nPolarization: Vertical \r\nPower Handling: 50 Watts \r\nImpedance: 50 ohm \r\nConnector: N Female\r\nHeight: 10.2 inches including connector (260mm)', 1, '2019-04-03 08:21:31', '2019-05-29 13:55:43', 0),
(7, 'MMZ563HV', 'COMPEX MMZ563HV', 3, 1, 7, 10, 6, 2, 'Kiểu dáng trang nhã và thanh lịch, phù hợp với những địa điểm sang trọng như khách sạn, nhà hàng, cao ốc\r\nChuẩn: 802.11 b/g/n \r\nTần số: 2.4 Ghz và 5.0 GHz\r\nCông suất phát: Mạnh\r\nBảo mật: WEP, WPA, WPA2,802.11i\r\nNguồn điện cung cấp: PoE 24V', 1, '2019-04-03 08:25:01', '2019-05-30 15:04:50', 0),
(8, 'MMJ344HV', 'Compex MMJ344HV', 3, 1, 7, 10, 6, 1, 'Kiểu dáng trang nhã và thanh lịch, phù hợp với những địa điểm sang trọng như khách sạn, nhà hàng, cao ốc\r\nChuẩn: 802.11 b/g/n \r\nTần số: 2.4 Ghz và 5.0 GHz\r\nCông suất phát: Mạnh\r\nBảo mật: WEP, WPA ,WPA2 , 802.11i\r\nNguồn điện cung cấp: PoE', 1, '2019-04-03 08:27:55', '2019-05-30 15:03:48', 0),
(9, 'MMZ558HV', 'COMPEX MMZ558HV', 3, 1, 7, 10, 6, 2, 'Kiểu dáng trang nhã và thanh lịch, phù hợp với những địa điểm sang trọng như khách sạn, nhà hàng, cao ốc\r\nChuẩn: 802.11 b/g/n \r\nTần số: 2.4 Ghz và 5.0 GHz\r\nCông suất phát: Mạnh\r\nBảo mật: WEP, WPA, WPA2,802.11i\r\nNguồn điện cung cấp: PoE 24V', 1, '2019-04-03 08:30:10', '2019-05-30 15:05:11', 0),
(10, '600DHP', 'BUFFALO WZR-600DHP', 3, 1, 7, 9, 6, 2, 'Kiểu dáng trang nhã và thanh lịch, phù hợp với những địa điểm sang trọng như khách sạn, nhà hàng, cao ốc\r\nChuẩn: 802.11 b/g/n \r\nTần số: 2.4 Ghz và 5.0 GHz\r\nCông suất phát: Mạnh\r\nBảo mật: WEP, WPA, WPA2,802.11i\r\nNguồn điện cung cấp:  12V', 1, '2019-04-03 08:31:58', '2019-05-30 15:05:40', 0),
(11, 'AG300H', 'BUFFALO WZR-HP-AG300H', 3, 1, 7, 11, 6, 2, 'Kiểu dáng trang nhã và thanh lịch, phù hợp với những địa điểm sang trọng như khách sạn, nhà hàng, cao ốc\r\nChuẩn: 802.11 b/g/n \r\nTần số: 2.4 Ghz và 5.0 GHz\r\nCông suất phát: Mạnh\r\nBảo mật: WEP, WPA, WPA2,802.11i\r\nNguồn điện cung cấp: 12V', 1, '2019-04-03 08:33:50', '2019-05-30 15:05:59', 0),
(12, 'UB64', 'ALFA HORNET UBX2', 3, 1, 7, 1, 6, 2, 'Kiểu dáng trang nhã và thanh lịch, phù hợp với những địa điểm sang trọng như khách sạn, nhà hàng, cao ốc\r\nChuẩn: 802.11 b/g/n \r\nTần số: 2.4 Ghz và 5.0 GHz\r\nCông suất phát: Mạnh\r\nBảo mật: WEP, WPA, WPA2,802.11i\r\nNguồn điện cung cấp: PoE ', 1, '2019-04-03 08:35:05', '2019-05-30 15:06:13', 0),
(13, 'AP120C', ' ALFA HORNET AP120C', 3, 1, 7, 1, 2, 2, 'Kiểu dáng trang nhã và thanh lịch, phù hợp với những địa điểm sang trọng như khách sạn, nhà hàng, cao ốc\r\nChuẩn: 802.11 b/g/n \r\nTần số: 2.4 Ghz và 5.0 GHz\r\nCông suất phát: Mạnh\r\nBảo mật: WEP, WPA, WPA2,802.11i\r\nNguồn điện cung cấp: PoE', 1, '2019-04-03 08:36:38', '2019-05-30 15:06:27', 0),
(14, 'ATI01', 'Anten indoor 2.4 GHz', 1, 6, 7, 1, 2, 2, 'Băng thông lên đến : 5.0 GHz.\r\nChế độ Hoạt động : . đa hướng , half-duplex , tự động chuyển mạch thông qua cảm biến cao cấp\r\nĐộ lợi:11+-1dBi\r\nNhiệt độ hoạt động : -40 đến 70 độ .\r\nĐộ ẩm hoạt động : độ ẩm tương đối lên đến 95%.\r\nVật liệu : nhựa lõi thép', 1, '2019-05-21 17:49:48', '2019-05-29 13:57:45', 0),
(15, 'POE01', 'Nguồn PoE 12v', 1, 8, 7, 1, 2, 2, 'Công suất : 24v0.5a 12w\r\nNguồn POE 12V-0.5A Ubiquiti sử dụng trộn data và power chung trong cùng một sợi cáp mạng RJ45.\r\nỨng dụng cấp nguồn: hệ thông wifi của Ubiquiti, Modem, Switch, camera..\r\nHỗ trợ nguồn điện dải rộng: 100-240V@50-60hz.\r\nĐầu vào: 1 x RJ45 (DATA IN)\r\nĐầu ra 1 x RJ45 POE (DATA+POWER)\r\n', 1, '2019-05-21 17:53:29', '2019-05-29 14:01:29', 0),
(16, 'POE02', 'Nguồn PoE 24V', 1, 8, 7, 10, 2, 2, 'Công suất : 24v0.5a 12w\r\nNguồn POE 24V-0.5A Ubiquiti sử dụng trộn data và power chung trong cùng một sợi cáp mạng RJ45.\r\nỨng dụng cấp nguồn: hệ thông wifi của Ubiquiti, Modem, Switch, camera..\r\nHỗ trợ nguồn điện dải rộng: 100-240V@50-60hz.\r\nĐầu vào: 1 x RJ45 (DATA IN)\r\nĐầu ra 1 x RJ45 POE (DATA+POWER)\r\n', 1, '2019-05-21 17:54:09', '2019-05-29 14:03:13', 0),
(17, 'ADT01', 'Nguồn Adapter 12V', 1, 7, 7, 10, 2, 2, 'Đầu vào: 100-240V 50/60Hz\r\nĐầu ra: 12V - 1A\r\nCung cấp năng lượng với đầu kết nối 2.1mm x 5.5mm\r\nĐèn LED báo tín hiệu', 1, '2019-05-21 17:55:07', '2019-05-29 13:59:05', 0),
(18, 'ADT02', 'Nguồn Adapter 24V', 1, 7, 7, 10, 2, 2, ' Đầu vào: 100-240V 50/60Hz\r\n Đầu ra: 24V - 1A\r\n Cung cấp năng lượng với đầu kết nối 2.1mm x 5.5mm\r\n Đèn LED báo tín hiệu', 1, '2019-05-21 17:55:50', '2019-05-29 13:59:27', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_classes`
--

CREATE TABLE `cat_classes` (
  `id` int(5) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `abbreviation` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) DEFAULT '1',
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cat_classes`
--

INSERT INTO `cat_classes` (`id`, `cat_id`, `abbreviation`, `name`, `status`, `description`, `created_at`, `updated_at`, `is_delete`) VALUES
(0, 7, '', 'Tất cả', 1, '', '2019-03-21 08:37:43', '2019-03-21 08:37:43', 0),
(1, 7, '', 'Phụ kiện', 1, '', '2019-05-21 07:57:32', '2019-05-21 07:57:32', 0),
(3, 7, '', 'Thiết bị mạng', 1, '', '2019-04-03 06:24:09', '2019-05-21 12:07:44', 0),
(4, 7, '', 'Tài sản cố định', 1, '', '2019-04-03 06:24:20', '2019-04-03 06:24:20', 0),
(5, 7, '', 'IOT', 1, '', '2019-04-03 06:25:03', '2019-04-03 06:25:03', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_contracts`
--

CREATE TABLE `cat_contracts` (
  `id` int(5) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `abbreviation` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) DEFAULT '1',
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_countries`
--

CREATE TABLE `cat_countries` (
  `id` int(5) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `abbreviation` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cat_countries`
--

INSERT INTO `cat_countries` (`id`, `cat_id`, `name`, `abbreviation`, `status`, `description`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, 5, 'Hàn Quốc', NULL, 1, '', '2019-03-21 08:38:49', '2019-03-21 08:38:49', 0),
(2, 5, 'Trung Quốc', NULL, 1, '', '2019-04-03 05:58:24', '2019-04-03 05:58:24', 0),
(3, 5, 'Việt Nam', NULL, 1, '', '2019-04-03 05:58:32', '2019-04-03 05:58:32', 0),
(4, 5, 'Mỹ', NULL, 1, '', '2019-04-03 05:58:41', '2019-04-03 05:58:41', 0),
(5, 5, 'Nhật Bản', NULL, 1, '', '2019-04-03 06:23:12', '2019-04-03 06:23:12', 0),
(6, 5, 'Nga', NULL, 1, '', '2019-04-03 08:16:48', '2019-04-03 08:16:48', 0),
(7, 5, 'Đài Loan ', 'TW', 1, '', '2019-05-21 12:06:34', '2019-05-21 12:07:19', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_currencies`
--

CREATE TABLE `cat_currencies` (
  `id` int(5) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `abbreviation` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cat_currencies`
--

INSERT INTO `cat_currencies` (`id`, `cat_id`, `name`, `abbreviation`, `status`, `description`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, 4, 'Việt Nam đồng ', 'VND', 1, '', '2019-03-21 08:42:12', '2019-05-21 12:05:20', 0),
(2, 4, 'Dollar Mỹ ', 'USD', 1, '', '2019-04-03 05:58:05', '2019-05-21 12:06:03', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_division`
--

CREATE TABLE `cat_division` (
  `id` int(5) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `abbreviation` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cat_division`
--

INSERT INTO `cat_division` (`id`, `cat_id`, `name`, `abbreviation`, `status`, `description`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, 2, 'Bộ phận Kỹ thuật', NULL, 1, '', '2019-03-21 08:42:51', '2019-03-21 08:42:51', 0),
(2, 2, 'Bộ phận System & Database', '', 1, '', '2019-04-03 05:49:03', '2019-05-31 13:18:49', 0),
(3, 2, 'Bộ phận WiFi & IoT', '', 1, '', '2019-04-03 05:57:10', '2019-05-31 13:26:20', 0),
(4, 2, 'Bộ phận Web App', '', 1, '', '2019-04-03 05:57:31', '2019-05-31 13:20:15', 0),
(5, 2, 'Bộ phận Mobile App', '', 1, '', '2019-04-03 05:57:42', '2019-05-31 13:19:28', 0),
(6, 2, 'Bộ phận BA ', '', 1, '', '2019-05-31 13:21:27', '2019-05-31 13:21:27', 0),
(7, 2, 'Bộ phận QK', '', 1, '', '2019-05-31 13:21:44', '2019-05-31 13:21:51', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_position`
--

CREATE TABLE `cat_position` (
  `id` int(5) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `abbreviation` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cat_position`
--

INSERT INTO `cat_position` (`id`, `cat_id`, `name`, `abbreviation`, `status`, `description`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, 1, 'Giám Đốc ', 'GD', 1, '', '2019-03-21 08:44:03', '2019-05-31 13:23:35', 0),
(2, 1, 'Tổng Giám Đốc', NULL, 1, '', '2019-03-21 08:44:03', '2019-03-21 08:44:03', 0),
(3, 1, 'Kế Toán Trưởng', NULL, 1, '', '2019-04-03 05:46:11', '2019-04-03 05:46:11', 1),
(4, 1, 'Nhân Viên', '', 1, '', '2019-04-03 05:47:16', '2019-05-31 13:22:33', 1),
(5, 1, 'Trưởng Phòng ', '', 1, '', '2019-04-03 05:48:23', '2019-05-31 13:22:25', 0),
(6, 1, 'Nhân viên', 'NV', 1, '', '2019-05-21 10:14:04', '2019-05-21 10:14:22', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_produceres`
--

CREATE TABLE `cat_produceres` (
  `id` int(5) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `abbreviation` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cat_produceres`
--

INSERT INTO `cat_produceres` (`id`, `cat_id`, `name`, `abbreviation`, `status`, `description`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, 10, 'Alpha INC', '', 1, '', '2019-03-21 08:44:46', '2019-05-21 12:45:41', 0),
(2, 10, 'Sony', NULL, 1, '', '2019-03-21 08:44:46', '2019-03-21 08:44:46', 0),
(3, 10, 'HP', NULL, 1, '', '2019-03-21 08:44:46', '2019-03-21 08:44:46', 0),
(4, 10, 'Dell', NULL, 1, '', '2019-03-21 08:44:46', '2019-03-21 08:44:46', 0),
(5, 10, 'Toyota', NULL, 1, '', '2019-04-03 06:04:12', '2019-04-03 06:04:12', 0),
(6, 10, 'Hòa Phát', NULL, 1, '', '2019-04-03 06:33:06', '2019-04-03 06:33:06', 0),
(7, 10, 'Hyundai', NULL, 1, '', '2019-04-03 08:16:34', '2019-04-03 08:16:34', 0),
(8, 10, 'Samco', NULL, 1, '', '2019-04-03 08:18:35', '2019-04-03 08:18:35', 0),
(9, 10, 'SAMSUNG', NULL, 1, '', '2019-04-03 08:25:29', '2019-04-03 08:25:29', 0),
(10, 10, 'Compex INC', '', 1, '', '2019-04-03 08:25:55', '2019-05-21 12:44:44', 0),
(11, 10, 'BUFFALO', '', 1, '', '2019-05-21 12:50:34', '2019-05-21 12:50:34', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_species`
--

CREATE TABLE `cat_species` (
  `id` int(5) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `abbreviation` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cat_species`
--

INSERT INTO `cat_species` (`id`, `cat_id`, `class_id`, `name`, `abbreviation`, `status`, `description`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, 11, 3, 'Access point', 'APS', 1, '', '2019-03-21 08:45:19', '2019-05-21 12:42:45', 0),
(2, 11, 3, 'Switch', 'SWS', 1, '', '2019-04-03 06:01:05', '2019-05-21 12:43:29', 0),
(3, 11, 3, 'Router', 'RTS', 1, '', '2019-04-03 06:01:34', '2019-05-21 12:43:15', 0),
(4, 11, 3, 'PC Gateway', 'PCG', 1, '', '2019-04-03 06:01:52', '2019-05-21 12:43:01', 0),
(5, 11, 5, 'Sensor/Smart device', NULL, 1, NULL, '2019-04-03 06:02:05', '2019-04-03 06:02:05', 0),
(6, 11, 1, 'Anten indoor', 'ATI', 1, '', '2019-04-03 08:16:09', '2019-05-21 12:40:50', 0),
(7, 11, 1, 'Nguồn Adapter ', 'ADT', 1, '', '2019-05-21 10:43:59', '2019-05-21 12:09:13', 0),
(8, 11, 1, 'Nguồn PoE', 'POE', 1, '', '2019-05-21 12:09:38', '2019-05-21 12:41:20', 0),
(9, 11, 1, 'Anten outdoor', 'ATO', 1, '', '2019-05-21 12:30:18', '2019-05-21 12:40:57', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_status`
--

CREATE TABLE `cat_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cretaed_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `cat_status`
--

INSERT INTO `cat_status` (`id`, `name`, `cretaed_at`, `updated_at`, `is_delete`) VALUES
(0, 'Dừng', '2019-03-21 08:45:48', '2019-03-21 08:45:48', 0),
(1, 'Hoạt động', '2019-03-21 08:45:48', '2019-03-21 08:45:48', 0),
(4, 'Đã xóa', '2019-03-21 08:45:48', '2019-03-21 08:45:48', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_supplieres`
--

CREATE TABLE `cat_supplieres` (
  `id` int(11) NOT NULL,
  `cat_id` int(2) NOT NULL DEFAULT '9',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mstdn` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `career` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` int(1) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cat_supplieres`
--

INSERT INTO `cat_supplieres` (`id`, `cat_id`, `name`, `address`, `phone`, `email`, `website`, `mstdn`, `career`, `description`, `status`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, 9, 'BUFFALO', 'Đài Loan', '03265489956', 'cy1@gmail.com', 'https://congty1.com', '21354645632123', 'Buôn bán ô tô', '', 1, '2019-03-21 08:46:15', '2019-05-31 14:39:10', 0),
(2, 9, 'COMPEX', 'Đài Loan', '036544846564', 'congty2@congty2.vn', 'https://congty2.vn', '5465456465465', 'Cung cấp thiết bị nội thất', NULL, 1, '2019-03-21 08:46:15', '2019-05-31 14:39:20', 0),
(3, 9, 'Alpha INC', 'Đài Loan', '0335010778', 'nhan18041997@gmail.com', 'honeynet.vn', '03152115', 'gghggkj', NULL, 1, '2019-05-29 08:39:03', '2019-05-31 14:38:50', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_units`
--

CREATE TABLE `cat_units` (
  `id` int(5) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `abbreviation` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cat_units`
--

INSERT INTO `cat_units` (`id`, `cat_id`, `name`, `abbreviation`, `status`, `description`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, 8, 'Máy', NULL, 1, NULL, '2019-03-21 08:46:52', '2019-03-21 08:46:52', 0),
(2, 8, 'Chiếc', NULL, 1, '', '2019-04-03 06:02:36', '2019-04-03 06:02:36', 0),
(3, 8, 'Mảnh', NULL, 1, '', '2019-04-03 06:03:09', '2019-04-03 06:03:09', 0),
(4, 8, 'Kg', NULL, 1, '', '2019-04-03 06:03:41', '2019-04-03 06:03:41', 0),
(5, 8, 'Cái', NULL, 1, '', '2019-04-03 08:30:48', '2019-04-03 08:30:48', 0),
(6, 8, 'Bộ', '', 1, '', '2019-05-21 12:11:18', '2019-05-21 12:11:18', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chain`
--

CREATE TABLE `chain` (
  `id` int(11) NOT NULL,
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ma day chuyen',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ten day chuyen',
  `description` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mo ta',
  `dept_id` int(11) NOT NULL,
  `status` int(1) NOT NULL COMMENT 'Trạng thái',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chain`
--

INSERT INTO `chain` (`id`, `code`, `name`, `description`, `dept_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'DC', 'Dây chuyền đóng gói sợi cáp quang', 'Mồ hình đóng gói', 25, 1, '2019-03-23 02:21:51', '2019-03-23 02:21:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `status` int(1) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `clients`
--

INSERT INTO `clients` (`id`, `code`, `name`, `type`, `address`, `phone`, `email`, `note`, `status`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, '001`', 'FPT', 1, 'C', 'E', 'd@gmail.com', 'F', 1, '2019-05-09 20:42:22', '2019-05-31 10:53:01', 0),
(2, '002', 'VNPT', 1, 'c', '01222827346', 'VNPT@gmail.com', '', 1, '2019-05-31 10:53:49', '2019-05-31 11:01:50', 0),
(3, '003', 'HTC', 3, 'c', '01222827346', 'HTC@gmail.com', '', 1, '2019-05-31 10:54:31', '2019-05-31 11:01:37', 0),
(4, '004', 'VNU', 2, 'c', '01222827346', 'VNU@gmail.com', '', 1, '2019-05-31 11:00:33', '2019-05-31 11:00:33', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `commute`
--

CREATE TABLE `commute` (
  `id` int(11) NOT NULL,
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `assets_id` int(11) NOT NULL,
  `descrip2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bill_num` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buy_date` date NOT NULL,
  `expired_guarantee_date` date NOT NULL,
  `used_date` date DEFAULT NULL,
  `unit_price_pro` double NOT NULL,
  `price_pro` double NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `dept_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `depreciation_time` int(11) DEFAULT NULL,
  `depreciation_total` int(25) DEFAULT NULL,
  `depreciation_type` int(11) DEFAULT NULL,
  `depreciation_tm` int(2) DEFAULT NULL,
  `evaluated` int(11) DEFAULT NULL,
  `quality` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `default_tb`
--

CREATE TABLE `default_tb` (
  `id` int(11) NOT NULL,
  `created_user` int(11) NOT NULL COMMENT 'ID tai khoan tao',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `level` int(2) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `departments`
--

INSERT INTO `departments` (`id`, `code`, `name`, `parent_id`, `level`, `status`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, 'CT0001', 'Công Ty HoneyNet', 0, 0, 1, '2019-04-02 22:17:00', '2019-04-02 22:17:00', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `evaluate`
--

CREATE TABLE `evaluate` (
  `id` int(11) NOT NULL,
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `assets_id` int(11) NOT NULL,
  `descrip2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bill_num` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buy_date` date NOT NULL,
  `expired_guarantee_date` date NOT NULL,
  `used_date` date DEFAULT NULL,
  `unit_price_pro` double NOT NULL,
  `price_pro` double NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `dept_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `depreciation_time` int(11) DEFAULT NULL,
  `depreciation_total` int(25) DEFAULT NULL,
  `depreciation_type` int(11) DEFAULT NULL,
  `depreciation_tm` int(2) DEFAULT NULL,
  `evaluated` int(11) DEFAULT NULL,
  `quality` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` text COLLATE utf8_unicode_ci,
  `status` int(1) NOT NULL,
  `actived` int(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `language`
--

INSERT INTO `language` (`id`, `name`, `short_name`, `path`, `icon`, `status`, `actived`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, 'VIET NAM', 'VIE', '/language_file/vie', 'vietnam.png', 1, 1, NULL, NULL, 0),
(2, 'ENGLISH', 'ENG', '/language_file/eng', 'united-states.png', 1, 0, NULL, NULL, 0),
(3, 'CHIESE', 'CHI', '/language_file/chi', 'china.png', 1, 0, NULL, NULL, 0),
(4, 'KOREA', 'KOR', '/language_file/kor', 'south-korea.png', 1, 0, NULL, NULL, 0),
(5, 'LÀO', 'LAO', '/language_file/lao', 'laos.png', 1, 0, NULL, NULL, 0),
(6, 'HONEYNET', 'HNN', '/language_file/hnn', 'Honeynet logo (symbol only).png', 0, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `liquidations`
--

CREATE TABLE `liquidations` (
  `id` int(10) NOT NULL,
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `liquidate_date` date NOT NULL,
  `type` int(1) NOT NULL,
  `cause` text COLLATE utf8_unicode_ci NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `liquidate_num` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `liquidations`
--

INSERT INTO `liquidations` (`id`, `code`, `liquidate_date`, `type`, `cause`, `end_date`, `liquidate_num`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'TL00001', '2019-02-26', 1, 'Hết hạn sử dụng', NULL, 'QDTL00001', 'Ghi chú', 1, '2019-02-26 11:19:03', '2019-04-03 09:07:18'),
(2, 'TL00002', '2019-03-16', 1, 'Tài sản không còn khả năng sử dụng', NULL, 'QDTL00002', 'Đã có QĐ thanh lý', 1, '2019-04-03 09:08:27', '2019-04-03 09:08:27'),
(3, 'TL00003', '2019-01-01', 2, 'Tài sản không sử dụng', NULL, 'QDTL00003', 'Đề nghị thanh lý\r\n', 1, '2019-04-03 09:11:06', '2019-04-03 09:11:06'),
(4, 'TL00004', '2019-01-01', 2, 'Tài sản không sử dụng', NULL, 'QDTL00004', 'Đề nghị thanh lý', 1, '2019-04-03 09:13:12', '2019-04-03 09:13:12'),
(5, 'TL00005', '2019-01-01', 2, 'Tài sản không sử dụng', NULL, 'QDTL00005', 'Đề nghị thanh lý', 1, '2019-04-03 09:14:17', '2019-04-03 09:14:17'),
(6, 'TL00006', '2019-04-03', 2, 'Tài sản không sử dụng', NULL, 'QDTL00006', 'Đề nghị thanh lý', 1, '2019-04-03 09:19:09', '2019-04-03 09:19:09'),
(7, 'TL00007', '2019-04-03', 2, 'Tài sản không sử dụng', NULL, 'QDTL00007', 'Đề nghị thanh lý', 1, '2019-04-03 09:19:45', '2019-04-03 09:19:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `liquidation_pelf`
--

CREATE TABLE `liquidation_pelf` (
  `id` int(10) NOT NULL,
  `liquidation_id` int(11) NOT NULL,
  `properties_id` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `pelf_quantity` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `log_history`
--

CREATE TABLE `log_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page` int(1) NOT NULL,
  `type` int(2) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `log_history`
--

INSERT INTO `log_history` (`id`, `user_id`, `page`, `type`, `name`, `detail`, `ip`, `device`, `created_at`) VALUES
(1, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.118 Chrome/69.4.3497.118 Safari/537.36', '2018-10-16 01:37:29'),
(2, 1, 1, 2, 'Cập nhật tài sản ID: 16', '{\"id\":\"16\",\"code\":\"x0000002\",\"name\":\"Xe \\u00f4 to Toyota\",\"descrip1\":\"Toyota 8 ch\\u1ed5\",\"descrip2\":\"\",\"bill_num\":\"\",\"buy_date\":\"2016-01-01\",\"expired_guarantee_date\":\"2018-04-01\",\"used_date\":\"2018-10-09\",\"used_year\":\"2018\",\"price\":830150000,\"status\":\"0\",\"dept_id\":\"2\",\"class_id\":\"43\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"7\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"evaluated\":0,\"balance_data\":\"[]\"}', '127.0.0.1', NULL, '2018-10-16 04:29:51'),
(3, 1, 1, 2, 'Cập nhật tài sản ID: 16', '{\"id\":\"16\",\"code\":\"x0000002\",\"name\":\"Xe \\u00f4 to Toyota\",\"descrip1\":\"Toyota 8 ch\\u1ed5\",\"descrip2\":\"\",\"bill_num\":\"\",\"buy_date\":\"2016-01-01\",\"expired_guarantee_date\":\"2018-04-01\",\"used_date\":\"2018-10-09\",\"used_year\":\"2018\",\"price\":830150000,\"status\":\"0\",\"dept_id\":\"2\",\"class_id\":\"43\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"7\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"evaluated\":0,\"balance_data\":\"[]\"}', '127.0.0.1', NULL, '2018-10-16 04:35:01'),
(4, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', NULL, '2018-10-16 04:35:35'),
(5, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.118 Chrome/69.4.3497.118 Safari/537.36', '2018-10-17 00:36:08'),
(6, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.118 Chrome/69.4.3497.118 Safari/537.36', '2018-10-17 00:49:47'),
(7, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-23 05:35:07'),
(8, 1, 1, 2, 'Cập nhật tài sản ID: 16', '{\"id\":\"16\",\"code\":\"x0000002\",\"name\":\"Xe \\u00f4 to Toyota\",\"descrip1\":\"Toyota 8 ch\\u1ed5\",\"descrip2\":\"\",\"bill_num\":\"\",\"buy_date\":\"2016-01-01\",\"expired_guarantee_date\":\"2018-04-01\",\"used_date\":\"2018-10-09\",\"used_year\":\"2018\",\"price\":830150000,\"status\":\"0\",\"dept_id\":\"2\",\"class_id\":\"43\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"7\",\"depreciation_total\":null,\"depreciation_type\":\"2\",\"depreciation_tm\":\"1\",\"evaluated\":0,\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-23 09:58:21'),
(9, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-24 01:01:07'),
(10, 1, 1, 2, 'Cập nhật tài sản ID: 16', '{\"id\":\"16\",\"code\":\"x0000002\",\"name\":\"Xe \\u00f4 to Toyota\",\"descrip1\":\"Toyota 8 ch\\u1ed5\",\"descrip2\":\"\",\"bill_num\":\"\",\"buy_date\":\"2016-01-01\",\"expired_guarantee_date\":\"2018-04-01\",\"used_date\":\"2018-10-09\",\"used_year\":\"2018\",\"price\":830150000,\"status\":\"0\",\"dept_id\":\"2\",\"class_id\":\"43\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"7\",\"depreciation_total\":null,\"depreciation_type\":\"2\",\"depreciation_tm\":\"2\",\"evaluated\":0,\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-24 06:03:41'),
(11, 1, 1, 2, 'Cập nhật tài sản ID: 16', '{\"id\":\"16\",\"code\":\"x0000002\",\"name\":\"Xe \\u00f4 to Toyota\",\"descrip1\":\"Toyota 8 ch\\u1ed5\",\"descrip2\":\"\",\"bill_num\":\"\",\"buy_date\":\"2016-01-01\",\"expired_guarantee_date\":\"2018-04-01\",\"used_date\":\"2018-10-09\",\"used_year\":\"2018\",\"price\":830150000,\"status\":\"0\",\"dept_id\":\"2\",\"class_id\":\"43\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"7\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"2\",\"evaluated\":0,\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-24 06:05:26'),
(12, 1, 1, 2, 'Cập nhật tài sản ID: 16', '{\"id\":\"16\",\"code\":\"x0000002\",\"name\":\"Xe \\u00f4 to Toyota\",\"descrip1\":\"Toyota 8 ch\\u1ed5\",\"descrip2\":\"\",\"bill_num\":\"\",\"buy_date\":\"2016-01-01\",\"expired_guarantee_date\":\"2018-04-01\",\"used_date\":\"2018-10-09\",\"used_year\":\"2018\",\"price\":830150000,\"status\":\"0\",\"dept_id\":\"2\",\"class_id\":\"43\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"7\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":0,\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-24 07:26:05'),
(13, 1, 1, 2, 'Cập nhật tài sản ID: 16', '{\"id\":\"16\",\"code\":\"x0000002\",\"name\":\"Xe \\u00f4 to Toyota\",\"descrip1\":\"Toyota 8 ch\\u1ed5\",\"descrip2\":\"\",\"bill_num\":\"\",\"buy_date\":\"2016-01-01\",\"expired_guarantee_date\":\"2018-04-01\",\"used_date\":\"2018-06-06\",\"used_year\":\"2018\",\"price\":830150000,\"status\":\"0\",\"dept_id\":\"2\",\"class_id\":\"43\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"7\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":0,\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-24 08:54:55'),
(14, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-25 09:30:59'),
(15, 1, 1, 2, 'Cập nhật tài sản ID: 18', '{\"id\":\"18\",\"code\":\"12345678921\",\"name\":\"T\\u00e0i s\\u1ea3n m\\u1edbi\",\"descrip1\":\"Th\\u00f4ng s\\u1ed1\",\"descrip2\":\"Kh\\u00f4ng c\\u00f3\",\"bill_num\":\"1234567893\",\"buy_date\":\"2018-10-03\",\"expired_guarantee_date\":\"2019-02-01\",\"used_date\":\"2017-09-01\",\"used_year\":\"2017\",\"price\":10000000,\"status\":\"0\",\"dept_id\":\"8\",\"class_id\":\"44\",\"manager_id\":\"2\",\"location_id\":\"3\",\"depreciation_time\":\"10\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"2\",\"evaluated\":\"0\",\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-25 09:42:26'),
(16, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-26 00:42:56'),
(17, 1, 1, 2, 'Cập nhật tài sản ID: 18', '{\"id\":\"18\",\"code\":\"12345678921\",\"name\":\"T\\u00e0i s\\u1ea3n m\\u1edbi\",\"descrip1\":\"Th\\u00f4ng s\\u1ed1\",\"descrip2\":\"Kh\\u00f4ng c\\u00f3\",\"bill_num\":\"1234567893\",\"buy_date\":\"2018-10-03\",\"expired_guarantee_date\":\"2019-02-01\",\"used_date\":\"2017-09-01\",\"used_year\":\"2017\",\"price\":10000000,\"status\":\"0\",\"dept_id\":\"8\",\"class_id\":\"44\",\"manager_id\":\"2\",\"location_id\":\"3\",\"depreciation_time\":\"10\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":\"0\",\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-26 00:46:18'),
(18, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-27 00:43:35'),
(19, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-30 03:59:30'),
(20, 1, 1, 2, 'Cập nhật tài sản ID: 16', '{\"id\":\"16\",\"code\":\"x0000002\",\"name\":\"Xe \\u00f4 to Toyota\",\"descrip1\":\"Toyota 8 ch\\u1ed5\",\"descrip2\":\"\",\"bill_num\":\"\",\"buy_date\":\"2016-01-01\",\"expired_guarantee_date\":\"2018-04-01\",\"used_date\":\"2018-01-01\",\"used_year\":\"2018\",\"price\":830150000,\"status\":\"0\",\"dept_id\":\"2\",\"class_id\":\"43\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"7\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":\"1\",\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-30 08:33:28'),
(21, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-05 01:13:42'),
(22, 1, 1, 2, 'Cập nhật tài sản ID: 18', '{\"id\":\"18\",\"code\":\"12345678921\",\"name\":\"T\\u00e0i s\\u1ea3n m\\u1edbi\",\"descrip1\":\"Th\\u00f4ng s\\u1ed1\",\"descrip2\":\"Kh\\u00f4ng c\\u00f3\",\"bill_num\":\"1234567893\",\"buy_date\":\"2018-10-03\",\"expired_guarantee_date\":\"2019-02-01\",\"used_date\":\"2017-09-01\",\"used_year\":\"2017\",\"price\":10000000,\"status\":\"0\",\"dept_id\":\"8\",\"class_id\":\"44\",\"manager_id\":\"2\",\"location_id\":\"3\",\"depreciation_time\":\"10\",\"depreciation_total\":null,\"depreciation_type\":\"2\",\"depreciation_tm\":\"1\",\"evaluated\":\"0\",\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-05 02:59:00'),
(23, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-07 02:48:23'),
(24, 1, 1, 2, 'Cập nhật tài khoản ID: 27', '{\"id\":\"27\",\"name\":\"QTV\",\"username\":\"qtvvp\",\"password\":\"$2y$08$WFBEK0p3cjlEN3hwUFdYU.VCuHYo.k1oclFV.veCoqIoZXaEdbHJy\",\"mail\":\"qtv@vnuhcm.edu.vn\",\"phone\":\"01234567890\",\"date_create\":\"2018-10-10 14:19:41\",\"status\":\"1\",\"picture\":\"\",\"role\":\"2\",\"dept_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-07 02:54:06'),
(25, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-07 02:54:34'),
(26, 27, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-07 02:55:01'),
(27, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-09 02:24:14'),
(28, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-11 00:18:42'),
(29, 27, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-11 00:53:19'),
(30, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-11 00:53:50'),
(31, 27, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-11 00:54:12'),
(32, 27, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-11 00:56:56'),
(33, 27, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-11 00:58:42'),
(34, 26, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-11 00:59:30'),
(35, 26, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-11 01:01:35'),
(36, 27, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-11 01:24:08'),
(37, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-14 03:56:08'),
(38, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-14 08:36:44'),
(39, 1, 1, 1, 'Thêm tài khoản ID: 28', '{\"id\":\"28\",\"name\":\"Nguyen Van A\",\"username\":\"test1\",\"password\":\"$2y$08$aE1uMUM0elpYU0R1RnUxe.4rmTTwnEO\\/rfLHioAhmkNnQtrfnmCFK\",\"mail\":\"test1@gmail.com\",\"phone\":\"01236525478\",\"date_create\":\"2018-11-14 16:46:37\",\"status\":\"1\",\"picture\":\"\",\"role\":\"2\",\"dept_id\":null}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-14 09:46:37'),
(40, 1, 1, 1, 'Thêm tài khoản ID: 29', '{\"id\":\"29\",\"name\":\"Nguyen Van B\",\"username\":\"test2\",\"password\":\"$2y$08$ampyUWlQTFIyNldwMjU2Muyir1jHsK\\/eoACIbvh.kAxleNA.3OJJ.\",\"mail\":\"test2@gmail.com\",\"phone\":\"0214578960\",\"date_create\":\"2018-11-14 17:11:40\",\"status\":\"1\",\"picture\":\"\",\"role\":\"2\",\"dept_id\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-14 10:11:40'),
(41, 1, 1, 1, 'Thêm tài khoản ID: 30', '{\"id\":\"30\",\"name\":\"Nguyen Van C\",\"username\":\"test3\",\"password\":\"$2y$08$SytubW0xdlRuVlJsUVIrNOUsc6BPkad88eDireozcnwMvFwR8vrPG\",\"mail\":\"test3@gmail.com\",\"phone\":\"0214563250\",\"date_create\":\"2018-11-14 17:13:10\",\"status\":\"1\",\"picture\":\"\",\"role\":\"2\",\"dept_id\":\"13\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-14 10:13:10'),
(42, 1, 1, 1, 'Thêm tài khoản ID: 31', '{\"id\":\"31\",\"name\":\"Nguyen Van E\",\"username\":\"test5\",\"password\":\"$2y$08$VjVTUnNHR3ZkU1EycGU3SO9vpivnyexSENFCgwpKpIq5qzUCuRI9W\",\"mail\":\"test5@gmail.com\",\"phone\":\"01234569801\",\"date_create\":\"2018-11-14 17:14:29\",\"status\":\"1\",\"picture\":\"\",\"role\":\"2\",\"dept_id\":\"16\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-14 10:14:29'),
(43, 1, 1, 1, 'Thêm tài khoản ID: 32', '{\"id\":\"32\",\"name\":\"Nguyen Van D\",\"username\":\"test4\",\"password\":\"$2y$08$dVR0OHZQYVlsby9FTW81Qu9sA9g94ysEJ2.HclQ3K4HIvTsRj.JwW\",\"mail\":\"test4@gmail.com\",\"phone\":\"0231578520\",\"date_create\":\"2018-11-14 17:15:56\",\"status\":\"1\",\"picture\":\"\",\"role\":\"2\",\"dept_id\":\"19\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-14 10:15:56'),
(44, 28, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-14 10:48:59'),
(45, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-19 01:27:11'),
(46, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-20 00:21:18'),
(47, 1, 1, 1, 'Thêm tài sản ID: 19', '{\"id\":\"19\",\"code\":\"LAP000123\",\"name\":\"Laptop\",\"descrip1\":\"I5-4600U\",\"descrip2\":\"Chu\\u1ed9t\",\"bill_num\":\"100000\",\"buy_date\":\"2018-10-01\",\"expired_guarantee_date\":\"2018-11-01\",\"used_date\":\"2018-11-01\",\"used_year\":\"2018\",\"price\":10000000,\"status\":\"0\",\"dept_id\":\"2\",\"class_id\":\"44\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"10\",\"depreciation_total\":null,\"depreciation_type\":\"2\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-20 01:06:21'),
(48, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-20 02:16:33'),
(49, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '118.69.55.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 02:17:04'),
(50, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 06:29:50'),
(51, 1, 1, 3, 'Xóa nhóm tài sản', '{\"id\":\"30\",\"code\":\"HNN20\",\"name\":\"\\u00e1dasdasd\",\"parent_id\":\"0\",\"level\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 06:31:07'),
(52, 1, 1, 2, 'Cập nhật nhóm tài sản 43', '{\"id\":\"43\",\"code\":\"HNN00001\",\"name\":\"Ph\\u01b0\\u01a1ng ti\\u1ec7n v\\u1eadn t\\u1ea3i\",\"parent_id\":0,\"level\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 06:32:36'),
(53, 1, 1, 2, 'Cập nhật nhóm tài sản 44', '{\"id\":\"44\",\"code\":\"HNN00002\",\"name\":\"M\\u00e1y m\\u00f3c thi\\u1ebft b\\u1ecb v\\u0103n ph\\u00f2ng\",\"parent_id\":0,\"level\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 06:33:09'),
(54, 1, 1, 2, 'Cập nhật nhóm tài sản 45', '{\"id\":\"45\",\"code\":\"HNN00003\",\"name\":\"Xe b\\u1ed1n b\\u00e1nh\",\"parent_id\":43,\"level\":\"1\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 06:33:27'),
(55, 1, 1, 3, 'Xóa nhóm tài sản', '{\"id\":\"45\",\"code\":\"HNN00003\",\"name\":\"Xe b\\u1ed1n b\\u00e1nh\",\"parent_id\":\"43\",\"level\":\"1\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 06:34:27'),
(56, 1, 1, 3, 'Xóa người sử dụng', '{\"id\":\"9\",\"code\":\"678\",\"name\":\"danhnguyenviet test\",\"dept_id\":\"2\",\"note\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 06:35:12'),
(57, 1, 1, 2, 'Cập nhật người sử dụng ID: 1', '{\"id\":\"1\",\"code\":\"003\",\"name\":\"Nguy\\u1ec5n Minh Th\\u01b0\",\"dept_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 06:40:07'),
(58, 1, 1, 2, 'Cập nhật người sử dụng ID: 2', '{\"id\":\"2\",\"code\":\"234\",\"name\":\"Tr\\u1ea7n Ng\\u1ecdc Minh\",\"dept_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 06:40:49'),
(59, 1, 1, 2, 'Cập nhật người sử dụng ID: 3', '{\"id\":\"3\",\"code\":\"001\",\"name\":\"L\\u00ea Ng\\u1ecdc A\",\"dept_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:43:29'),
(60, 1, 1, 2, 'Cập nhật người sử dụng ID: 1', '{\"id\":\"1\",\"code\":\"003\",\"name\":\"Nguy\\u1ec5n V\\u0103n B\",\"dept_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:43:54'),
(61, 1, 1, 2, 'Cập nhật người sử dụng ID: 2', '{\"id\":\"2\",\"code\":\"234\",\"name\":\"Tr\\u1ea7n V\\u0103n C\",\"dept_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:44:17'),
(62, 1, 1, 2, 'Cập nhật người sử dụng ID: 11', '{\"id\":\"11\",\"code\":\"004\",\"name\":\"L\\u00ea Ng\\u1ecdc A\",\"dept_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:45:08'),
(63, 1, 1, 2, 'Cập nhật người sử dụng ID: 11', '{\"id\":\"11\",\"code\":\"004\",\"name\":\"L\\u00ea Ng\\u1ecdc A\",\"dept_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:45:57'),
(64, 1, 1, 2, 'Cập nhật người sử dụng ID: 10', '{\"id\":\"10\",\"code\":\"002\",\"name\":\"Hu\\u1ef3nh Th\\u1ecb B\",\"dept_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:46:21'),
(65, 1, 1, 2, 'Cập nhật người sử dụng ID: 12', '{\"id\":\"12\",\"code\":\"005\",\"name\":\"Nguy\\u1ec5n Th\\u1ecb T\",\"dept_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:46:49'),
(66, 1, 1, 2, 'Cập nhật người sử dụng ID: 14', '{\"id\":\"14\",\"code\":\"007\",\"name\":\"Nguy\\u1ec5n Th\\u1ecb Q\",\"dept_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:47:26'),
(67, 1, 1, 2, 'Cập nhật người sử dụng ID: 13', '{\"id\":\"13\",\"code\":\"006\",\"name\":\"L\\u00ea Th\\u1ecb H\",\"dept_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:48:00'),
(68, 1, 1, 2, 'Cập nhật người sử dụng ID: 11', '{\"id\":\"11\",\"code\":\"004\",\"name\":\"L\\u00ea Kim A\",\"dept_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:48:25'),
(69, 1, 1, 1, 'Thêm tài khoản ID: 33', '{\"id\":\"33\",\"name\":\"Nguy\\u1ec5n V\\u0103n F\",\"username\":\"test6\",\"password\":\"$2y$08$c3BXc1o1Q1Vrb2s3ZkZvM.u.aiqKyjXfH1ZwdTDfAMuYazhQZbGXK\",\"mail\":\"test6@gmail.com\",\"phone\":\"0902155622\",\"date_create\":\"2018-11-20 14:52:27\",\"status\":\"1\",\"picture\":\"\",\"role\":\"3\",\"dept_id\":\"2\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:52:27'),
(70, 1, 1, 1, 'Thêm tài khoản ID: 34', '{\"id\":\"34\",\"name\":\"Nguy\\u1ec5n V\\u0103n G\",\"username\":\"test7\",\"password\":\"$2y$08$SmRpUkdBTGR1alBtWCt3QO0oTd2wZ.qco91qiJ2tLo2pVoU8t\\/V1u\",\"mail\":\"test7@gmail.com\",\"phone\":\"0256885664\",\"date_create\":\"2018-11-20 14:55:26\",\"status\":\"1\",\"picture\":\"\",\"role\":\"3\",\"dept_id\":\"2\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:55:26'),
(71, 1, 1, 1, 'Thêm tài khoản ID: 35', '{\"id\":\"35\",\"name\":\"Nguy\\u1ec5n V\\u0103n H\",\"username\":\"test8\",\"password\":\"$2y$08$bVpSYjFFQVVjcHNtcWpqTOPGstkWX9e4DvVVBGfkDH6q5ek23EUBi\",\"mail\":\"test8@gmail.com\",\"phone\":\"0932888656\",\"date_create\":\"2018-11-20 14:57:33\",\"status\":\"1\",\"picture\":\"\",\"role\":\"3\",\"dept_id\":\"2\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:57:33'),
(72, 1, 1, 1, 'Thêm tài khoản ID: 36', '{\"id\":\"36\",\"name\":\"Nguy\\u1ec5n V\\u0103n K\",\"username\":\"test9\",\"password\":\"$2y$08$NDViMTZ2cGVuTGFPSW5BduLTlB4YaDdnqFX8LMlR7i95d\\/q.PW7g2\",\"mail\":\"test9@gmai.com\",\"phone\":\"0932814032\",\"date_create\":\"2018-11-20 14:59:02\",\"status\":\"1\",\"picture\":\"\",\"role\":\"3\",\"dept_id\":\"2\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:59:02'),
(73, 1, 1, 2, 'Cập nhật đơn vị ID: 1', '{\"id\":\"1\",\"dept_id\":\"2\",\"code\":\"HNNL00001\",\"name\":\"P.101\",\"parent_id\":\"2\",\"level\":1}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:00:45'),
(74, 1, 1, 2, 'Cập nhật đơn vị ID: 3', '{\"id\":\"3\",\"dept_id\":\"2\",\"code\":\"HNNL00002\",\"name\":\"P.103\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:01:33'),
(75, 1, 1, 2, 'Cập nhật đơn vị ID: 16', '{\"id\":\"16\",\"dept_id\":\"2\",\"code\":\"HNNL00003\",\"name\":\"Ph\\u00f2ng QTTB\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:01:51'),
(76, 1, 1, 2, 'Cập nhật đơn vị ID: 2', '{\"id\":\"2\",\"dept_id\":\"2\",\"code\":\"HNN00004\",\"name\":\"P.102\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:02:10'),
(77, 1, 1, 1, 'Thêm vị trí ID: 17', '{\"id\":\"17\",\"dept_id\":\"2\",\"code\":\"HNN00005\",\"name\":\"P.104\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:03:19'),
(78, 1, 1, 2, 'Cập nhật đơn vị ID: 17', '{\"id\":\"17\",\"dept_id\":\"2\",\"code\":\"HNNL00005\",\"name\":\"P.104\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:03:38'),
(79, 1, 1, 1, 'Thêm vị trí ID: 18', '{\"id\":\"18\",\"dept_id\":\"2\",\"code\":\"HNNL00006\",\"name\":\"P.105\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:04:05'),
(80, 1, 1, 1, 'Thêm vị trí ID: 19', '{\"id\":\"19\",\"dept_id\":\"2\",\"code\":\"HNNL00007\",\"name\":\"P.106\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:04:49'),
(81, 1, 1, 1, 'Thêm vị trí ID: 20', '{\"id\":\"20\",\"dept_id\":\"2\",\"code\":\"HNNL00008\",\"name\":\"P.107\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:05:21'),
(82, 1, 1, 1, 'Thêm vị trí ID: 21', '{\"id\":\"21\",\"dept_id\":\"2\",\"code\":\"HNNL00009\",\"name\":\"P.107\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:06:04'),
(83, 1, 1, 2, 'Cập nhật đơn vị ID: 21', '{\"id\":\"21\",\"dept_id\":\"2\",\"code\":\"HNNL00009\",\"name\":\"P.108\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:06:15'),
(84, 1, 1, 1, 'Thêm vị trí ID: 22', '{\"id\":\"22\",\"dept_id\":\"2\",\"code\":\"HNNL000010\",\"name\":\"P.109\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:06:55'),
(85, 1, 1, 2, 'Cập nhật đơn vị ID: 16', '{\"id\":\"16\",\"dept_id\":\"9\",\"code\":\"HNNL00003\",\"name\":\"P.110\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:21:15'),
(86, 1, 1, 2, 'Cập nhật đơn vị ID: 22', '{\"id\":\"22\",\"dept_id\":\"8\",\"code\":\"HNNL000010\",\"name\":\"P.109\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:21:29'),
(87, 1, 1, 2, 'Cập nhật đơn vị ID: 21', '{\"id\":\"21\",\"dept_id\":\"11\",\"code\":\"HNNL00009\",\"name\":\"P.108\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:21:44'),
(88, 1, 1, 2, 'Cập nhật đơn vị ID: 19', '{\"id\":\"19\",\"dept_id\":\"11\",\"code\":\"HNNL00007\",\"name\":\"P.106\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:22:06'),
(89, 1, 1, 2, 'Cập nhật đơn vị ID: 17', '{\"id\":\"17\",\"dept_id\":\"19\",\"code\":\"HNNL00005\",\"name\":\"P.104\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:22:20'),
(90, 1, 1, 2, 'Cập nhật đơn vị ID: 17', '{\"id\":\"17\",\"dept_id\":\"19\",\"code\":\"HNNL00005\",\"name\":\"P.104\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:23:07'),
(91, 1, 1, 2, 'Cập nhật đơn vị ID: 1', '{\"id\":\"1\",\"dept_id\":\"2\",\"code\":\"HNNL00001\",\"name\":\"P.101\",\"parent_id\":\"2\",\"level\":1}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:23:20'),
(92, 1, 1, 2, 'Cập nhật đơn vị ID: 1', '{\"id\":\"1\",\"dept_id\":\"2\",\"code\":\"HNNL00001\",\"name\":\"P.101\",\"parent_id\":\"2\",\"level\":1}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:23:25'),
(93, 1, 1, 2, 'Cập nhật đơn vị ID: 1', '{\"id\":\"1\",\"dept_id\":\"2\",\"code\":\"HNNL00001\",\"name\":\"P.101\",\"parent_id\":\"2\",\"level\":1}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:24:04'),
(94, 1, 1, 2, 'Cập nhật đơn vị ID: 1', '{\"id\":\"1\",\"dept_id\":\"2\",\"code\":\"HNNL00001\",\"name\":\"P.101\",\"parent_id\":\"2\",\"level\":1}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:24:19'),
(95, 1, 1, 2, 'Cập nhật đơn vị ID: 1', '{\"id\":\"1\",\"dept_id\":\"2\",\"code\":\"HNNL00001\",\"name\":\"P.101\",\"parent_id\":\"2\",\"level\":1}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:24:29'),
(96, 1, 1, 2, 'Cập nhật đơn vị ID: 3', '{\"id\":\"3\",\"dept_id\":\"12\",\"code\":\"HNNL00002\",\"name\":\"P.103\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:24:46'),
(97, 27, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 09:32:31'),
(98, 27, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 09:34:29'),
(99, 27, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-20 09:36:08'),
(100, 34, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 09:37:55'),
(101, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 09:40:36'),
(102, 1, 1, 1, 'Thêm tài sản ID: 20', '{\"id\":\"20\",\"code\":\"HNNP00001\",\"name\":\"Laptop\",\"descrip1\":\"DEll-5557\",\"descrip2\":\"Chu\\u1ed9t\",\"bill_num\":\"123456\",\"buy_date\":\"2016-10-28\",\"expired_guarantee_date\":\"2018-10-28\",\"used_date\":\"2016-10-29\",\"used_year\":\"2016\",\"price\":15000000,\"status\":\"0\",\"dept_id\":\"2\",\"class_id\":\"44\",\"manager_id\":\"1\",\"location_id\":\"2\",\"depreciation_time\":\"30\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 09:46:41'),
(103, 1, 1, 1, 'Thêm tài sản ID: 21', '{\"id\":\"21\",\"code\":\"HNNP00002\",\"name\":\"Laptop\",\"descrip1\":\"DEll-5557\",\"descrip2\":\"Chu\\u1ed9t\",\"bill_num\":\"123456\",\"buy_date\":\"2016-10-28\",\"expired_guarantee_date\":\"2018-10-28\",\"used_date\":\"2016-10-29\",\"used_year\":\"2016\",\"price\":15000000,\"status\":\"0\",\"dept_id\":\"2\",\"class_id\":\"44\",\"manager_id\":\"1\",\"location_id\":\"2\",\"depreciation_time\":\"30\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 09:52:05'),
(104, 1, 1, 1, 'Thêm tài sản ID: 22', '{\"id\":\"22\",\"code\":\"HNNP00003\",\"name\":\"B\\u00e0n\",\"descrip1\":\"123456\",\"descrip2\":\"No\",\"bill_num\":\"123456\",\"buy_date\":\"2015-10-29\",\"expired_guarantee_date\":\"2016-11-08\",\"used_date\":\"2015-10-30\",\"used_year\":\"2015\",\"price\":1000000,\"status\":\"1\",\"dept_id\":\"2\",\"class_id\":\"44\",\"manager_id\":\"11\",\"location_id\":\"2\",\"depreciation_time\":\"1\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"2\",\"evaluated\":null,\"balance_data\":\"[]\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 09:55:43'),
(105, 1, 1, 1, 'Thêm tài sản ID: 23', '{\"id\":\"23\",\"code\":\"HNNP00006\",\"name\":\"Gh\\u1ebf\",\"descrip1\":\"GH005\",\"descrip2\":\"Kh\\u00f4ng\",\"bill_num\":\"136566\",\"buy_date\":\"2015-10-29\",\"expired_guarantee_date\":\"2016-11-08\",\"used_date\":\"2015-10-30\",\"used_year\":\"2015\",\"price\":500000,\"status\":\"1\",\"dept_id\":\"2\",\"class_id\":\"44\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"2\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"2\",\"evaluated\":null,\"balance_data\":\"[]\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 10:02:58'),
(106, 1, 1, 1, 'Thêm tài sản ID: 24', '{\"id\":\"24\",\"code\":\"HNNP00008\",\"name\":\"M\\u00e1y l\\u1ea1nh\",\"descrip1\":\"ML004\",\"descrip2\":\"kh\\u00f4ng\",\"bill_num\":\"1885652\",\"buy_date\":\"2017-11-01\",\"expired_guarantee_date\":\"2018-11-08\",\"used_date\":\"2018-11-02\",\"used_year\":\"2018\",\"price\":7000000,\"status\":\"0\",\"dept_id\":\"2\",\"class_id\":\"44\",\"manager_id\":\"3\",\"location_id\":\"2\",\"depreciation_time\":\"2\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 10:08:10'),
(107, 1, 1, 1, 'Thêm tài sản ID: 25', '{\"id\":\"25\",\"code\":\"HNNP000010\",\"name\":\"\\u0110\\u00e8n\",\"descrip1\":\"15866\",\"descrip2\":\"Kh\\u00f4ng\",\"bill_num\":\"1548665\",\"buy_date\":\"2018-09-29\",\"expired_guarantee_date\":\"2018-12-08\",\"used_date\":\"2018-09-30\",\"used_year\":\"2018\",\"price\":50000,\"status\":\"0\",\"dept_id\":\"2\",\"class_id\":\"44\",\"manager_id\":\"1\",\"location_id\":\"2\",\"depreciation_time\":\"1\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 10:14:29'),
(108, 1, 1, 1, 'Thêm tài sản ID: 26', '{\"id\":\"26\",\"code\":\"HNNP000011\",\"name\":\"Qu\\u1ea1t\",\"descrip1\":\"Q1548552\",\"descrip2\":\"Kh\\u00f4ng\",\"bill_num\":\"159896\",\"buy_date\":\"2016-10-28\",\"expired_guarantee_date\":\"2017-10-29\",\"used_date\":\"2016-10-30\",\"used_year\":\"2016\",\"price\":1500000,\"status\":\"0\",\"dept_id\":\"2\",\"class_id\":\"44\",\"manager_id\":\"2\",\"location_id\":\"2\",\"depreciation_time\":\"1\",\"depreciation_total\":null,\"depreciation_type\":\"2\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 10:15:52'),
(109, 1, 1, 1, 'Thêm tài sản ID: 27', '{\"id\":\"27\",\"code\":\"HNNP000012\",\"name\":\"T\\u1ee7\",\"descrip1\":\"T055465\",\"descrip2\":\"Kh\\u00f4ng\",\"bill_num\":\"321678866\",\"buy_date\":\"2017-10-31\",\"expired_guarantee_date\":\"2018-11-01\",\"used_date\":\"2017-10-30\",\"used_year\":\"2017\",\"price\":5500000,\"status\":\"0\",\"dept_id\":\"2\",\"class_id\":\"44\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"3\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 10:18:11'),
(110, 1, 1, 1, 'Thêm tài sản ID: 28', '{\"id\":\"28\",\"code\":\"HNNP000014\",\"name\":\"M\\u00e1y t\\u00ednh b\\u00e0n\",\"descrip1\":\"2565\",\"descrip2\":\"CPU + Chu\\u1ed9t\",\"bill_num\":\"316598989\",\"buy_date\":\"2015-10-29\",\"expired_guarantee_date\":\"2016-11-08\",\"used_date\":\"2015-10-30\",\"used_year\":\"2015\",\"price\":7000000,\"status\":\"0\",\"dept_id\":\"2\",\"class_id\":\"44\",\"manager_id\":\"11\",\"location_id\":\"2\",\"depreciation_time\":\"2\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 10:22:22'),
(111, 27, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-20 11:46:23'),
(112, 27, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-20 11:57:21'),
(113, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '58.186.140.229', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-20 20:32:53'),
(114, 27, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-20 21:39:08'),
(115, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-20 21:40:32'),
(116, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-21 00:53:43'),
(117, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-23 01:52:06'),
(118, 1, 1, 1, 'Thêm tài khoản ID: 37', '{\"id\":\"37\",\"name\":\"Nguyen Duy\",\"username\":\"admin1234\",\"password\":\"$2y$08$dzJPU09YVWZubisyWnFvTeNk\\/ilLiatbBhRf9MvJOzd3ZARM\\/ruMa\",\"mail\":\"admin1@gmail.com\",\"phone\":\"0323456985\",\"avatar\":null,\"role\":\"2\",\"dept_id\":\"2\",\"status\":\"1\",\"created_at\":\"2018-11-23 10:17:32\",\"updated_at\":null}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-23 03:17:32'),
(119, 1, 1, 2, 'Cập nhật tài khoản ID: 27', '{\"id\":\"27\",\"name\":\"QTV\",\"username\":\"qtvvp\",\"password\":\"h@neynet.vn2018\",\"mail\":\"qtv@vnuhcm.edu.vn\",\"phone\":\"0352254987\",\"avatar\":\"\",\"role\":\"2\",\"dept_id\":\"2\",\"status\":\"1\",\"created_at\":\"2018-10-10 14:19:41\",\"updated_at\":\"2018201820182018-NovNov-FriFri 10:41:11\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-23 03:41:11'),
(120, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-23 18:21:58'),
(121, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-25 05:20:11'),
(122, 1, 1, 2, 'Cập nhật đơn vị ID: 9', '{\"id\":\"9\",\"code\":\"D001\",\"name\":\"Vi\\u1ec7t Nam\",\"parent_id\":0,\"level\":0}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-25 05:42:09'),
(123, 1, 1, 2, 'Cập nhật đơn vị ID: 18', '{\"id\":\"18\",\"code\":\"Mi\\u1ec1n Nam\",\"name\":\"Ban DH\",\"parent_id\":\"9\",\"level\":1}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-25 05:47:28'),
(124, 1, 1, 2, 'Cập nhật đơn vị ID: 18', '{\"id\":\"18\",\"code\":\"VN001\",\"name\":\"Mi\\u1ec1n Nam\",\"parent_id\":\"9\",\"level\":1}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-25 05:47:49'),
(125, 1, 1, 2, 'Cập nhật đơn vị ID: 23', '{\"id\":\"23\",\"code\":\"VN002\",\"name\":\"Mi\\u1ec1n B\\u1eafc\",\"parent_id\":\"9\",\"level\":1}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-25 05:48:13'),
(126, 1, 1, 2, 'Cập nhật đơn vị ID: 24', '{\"id\":\"24\",\"code\":\"VN003\",\"name\":\"Mi\\u1ec1n Trung\",\"parent_id\":\"9\",\"level\":1}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-25 05:48:40'),
(127, 1, 1, 2, 'Cập nhật đơn vị ID: 16', '{\"id\":\"16\",\"code\":\"206\",\"name\":\"Tp. H\\u1ed3 Ch\\u00ed Minh\",\"parent_id\":\"18\",\"level\":2}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-25 05:49:12'),
(128, 1, 1, 2, 'Cập nhật đơn vị ID: 14', '{\"id\":\"14\",\"code\":\"MN002\",\"name\":\"Long An\",\"parent_id\":\"18\",\"level\":2}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-25 05:49:48'),
(129, 1, 1, 2, 'Cập nhật đơn vị ID: 11', '{\"id\":\"11\",\"code\":\"MN001\",\"name\":\"Tp. H\\u1ed3 Ch\\u00ed Minh\",\"parent_id\":\"18\",\"level\":2}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-25 05:50:35'),
(130, 1, 1, 2, 'Cập nhật đơn vị ID: 19', '{\"id\":\"19\",\"code\":\"MN003\",\"name\":\"C\\u1ea7n Th\\u01a1\",\"parent_id\":\"18\",\"level\":2}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-25 05:51:26'),
(131, 1, 1, 2, 'Cập nhật đơn vị ID: 2', '{\"id\":\"2\",\"code\":\"MB001\",\"name\":\"Tp. H\\u00e0 N\\u1ed9i\",\"parent_id\":\"23\",\"level\":2}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-25 05:53:57'),
(132, 1, 1, 2, 'Cập nhật đơn vị ID: 12', '{\"id\":\"12\",\"code\":\"MT001\",\"name\":\"Tp. \\u0110\\u00e0 N\\u1eb5ng\",\"parent_id\":\"24\",\"level\":2}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-25 05:54:32'),
(133, 1, 1, 2, 'Cập nhật đơn vị ID: 8', '{\"id\":\"8\",\"code\":\"MT002\",\"name\":\"Tp. Nha Trang\",\"parent_id\":\"24\",\"level\":2}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-25 05:55:34'),
(134, 1, 1, 2, 'Cập nhật đơn vị ID: 10', '{\"id\":\"10\",\"code\":\"MB002\",\"name\":\"Ngh\\u1ec7 An\",\"parent_id\":\"23\",\"level\":2}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-25 05:56:14'),
(135, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-25 15:16:26'),
(136, 1, 1, 1, 'Thêm tài khoản ID: 38', '{\"id\":\"38\",\"name\":\"aaaaaaaaa\",\"username\":\"aaaaaa\",\"password\":\"$2y$08$dG54TTFmUTJZTmUyb1RUOOFBhikCJYaWgIkHzB3O0JyD9ZD.7ykRm\",\"mail\":\"aaa@aaaa\",\"phone\":\"0323456754\",\"avatar\":null,\"role\":\"2\",\"dept_id\":\"8\",\"dept_mg\":null,\"status\":\"1\",\"created_at\":\"2018-11-26 00:29:50\",\"updated_at\":null}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-25 17:29:50');
INSERT INTO `log_history` (`id`, `user_id`, `page`, `type`, `name`, `detail`, `ip`, `device`, `created_at`) VALUES
(137, 1, 1, 1, 'Thêm tài khoản ID: 39', '{\"id\":\"39\",\"name\":\"aaaa\",\"username\":\"aaaaaaaaaaa\",\"password\":\"$2y$08$MDc3RWZUaXpGSWVtQlMwT.3cD\\/8\\/QmV0RWwVvLfk8JVxRCX8kQnK.\",\"mail\":\"aaaaaaaa@aaaaaaa\",\"phone\":\"0365455122\",\"avatar\":null,\"role\":\"2\",\"dept_id\":\"8\",\"dept_mg\":\"null\",\"status\":\"1\",\"created_at\":\"2018-11-26 12:05:35\",\"updated_at\":null}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 05:05:35'),
(138, 1, 1, 1, 'Thêm tài khoản ID: 40', '{\"id\":\"40\",\"name\":\"aaaaaaaaa\",\"username\":\"aaaaaaaaa\",\"password\":\"$2y$08$Vng4Z21scnRVY21sYi8rOOEdLv0kD6AGDdzOBgGn7fFK3GJIJtVcC\",\"mail\":\"aaaaaaaa@aaaaaaaaa\",\"phone\":\"0345678998\",\"avatar\":null,\"role\":\"2\",\"dept_id\":\"8\",\"dept_mg\":\"null\",\"status\":\"1\",\"created_at\":\"2018-11-26 12:07:34\",\"updated_at\":null}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 05:07:34'),
(139, 1, 1, 1, 'Thêm tài khoản ID: 41', '{\"id\":\"41\",\"name\":\"aaaaaaaaaaaa\",\"username\":\"aaaaaaaaaaaaaa\",\"password\":\"$2y$08$SG5HdDh3VFRiWXVnRlZiS.oEBpgr30BMMOj87A3g8FdyWIxASu2iG\",\"mail\":\"aaaaaaa@gail.com\",\"phone\":\"0355555555\",\"avatar\":null,\"role\":\"2\",\"dept_id\":\"8\",\"dept_mg\":\"[\\\"9\\\",\\\"23\\\",\\\"10\\\",\\\"2\\\",\\\"18\\\",\\\"19\\\",\\\"14\\\",\\\"11\\\",\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 12:13:46\",\"updated_at\":\"2018-11-26 12:13:46\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 05:13:46'),
(140, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 05:15:52'),
(141, 1, 1, 2, 'Cập nhật tài khoản ID: 41', '{\"id\":\"41\",\"name\":\"aaaaaaaaaaaa\",\"username\":\"aaaaaaaaaaaaaa\",\"password\":\"$2y$08$SG5HdDh3VFRiWXVnRlZiS.oEBpgr30BMMOj87A3g8FdyWIxASu2iG\",\"mail\":\"aaaaaaa@gail.com\",\"phone\":\"0355555555\",\"avatar\":\"aaaaaaaaaaaa\",\"role\":\"2\",\"dept_id\":\"8\",\"dept_mg\":\"[\\\"9\\\",\\\"23\\\",\\\"10\\\",\\\"2\\\",\\\"18\\\",\\\"19\\\",\\\"14\\\",\\\"11\\\",\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 12:13:46\",\"updated_at\":\"2018201820182018-NovNov-MonMon 13:31:54\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 06:31:54'),
(142, 1, 1, 2, 'Cập nhật tài khoản ID: 41', '{\"id\":\"41\",\"name\":\"aaaaaaaaaaaa\",\"username\":\"aaaaaaaaaaaaaa\",\"password\":\"$2y$08$SG5HdDh3VFRiWXVnRlZiS.oEBpgr30BMMOj87A3g8FdyWIxASu2iG\",\"mail\":\"aaaaaaa@gail.com\",\"phone\":\"0355555555\",\"avatar\":\"aaaaaaaaaaaa\",\"role\":\"2\",\"dept_id\":\"8\",\"dept_mg\":\"[\\\"9\\\",\\\"23\\\",\\\"10\\\",\\\"2\\\",\\\"18\\\",\\\"19\\\",\\\"14\\\",\\\"11\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 12:13:46\",\"updated_at\":\"2018201820182018-NovNov-MonMon 13:32:04\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 06:32:04'),
(143, 1, 1, 2, 'Cập nhật tài khoản ID: 41', '{\"id\":\"41\",\"name\":\"aaaaaaaaaaaa\",\"username\":\"aaaaaaaaaaaaaa\",\"password\":\"$2y$08$SG5HdDh3VFRiWXVnRlZiS.oEBpgr30BMMOj87A3g8FdyWIxASu2iG\",\"mail\":\"aaaaaaa@gail.com\",\"phone\":\"0355555555\",\"avatar\":\"aaaaaaaaaaaa\",\"role\":\"2\",\"dept_id\":\"8\",\"dept_mg\":\"[\\\"9\\\",\\\"23\\\",\\\"10\\\",\\\"2\\\",\\\"18\\\",\\\"19\\\",\\\"14\\\",\\\"11\\\",\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 12:13:46\",\"updated_at\":\"2018201820182018-NovNov-MonMon 13:32:11\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 06:32:11'),
(144, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 06:59:40'),
(145, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 07:05:02'),
(146, 26, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 07:07:40'),
(147, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 07:08:30'),
(148, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 07:57:55'),
(149, 1, 1, 2, 'Cập nhật tài khoản ID: 41', '{\"id\":\"41\",\"name\":\"aaaaaaaaaaaa\",\"username\":\"aaaaaaaaaaaaaa\",\"password\":\"$2y$08$SG5HdDh3VFRiWXVnRlZiS.oEBpgr30BMMOj87A3g8FdyWIxASu2iG\",\"mail\":\"aaaaaaa@gail.com\",\"phone\":\"0355555555\",\"avatar\":\"aaaaaaaaaaaa\",\"role\":\"2\",\"dept_id\":\"8\",\"dept_mg\":\"[\\\"9\\\",\\\"23\\\",\\\"10\\\",\\\"2\\\",\\\"18\\\",\\\"19\\\",\\\"14\\\",\\\"11\\\",\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 12:13:46\",\"updated_at\":\"2018201820182018-NovNov-MonMon 14:58:16\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 07:58:16'),
(150, 1, 1, 2, 'Cập nhật tài khoản ID: 41', '{\"id\":\"41\",\"name\":\"aaaaaaaaaaaa\",\"username\":\"aaaaaaaaaaaaaa\",\"password\":\"$2y$08$SG5HdDh3VFRiWXVnRlZiS.oEBpgr30BMMOj87A3g8FdyWIxASu2iG\",\"mail\":\"aaaaaaa@gail.com\",\"phone\":\"0355555555\",\"avatar\":\"aaaaaaaaaaaa\",\"role\":\"2\",\"dept_id\":\"8\",\"dept_mg\":\"[\\\"9\\\",\\\"23\\\",\\\"10\\\",\\\"2\\\",\\\"18\\\",\\\"19\\\",\\\"14\\\",\\\"11\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 12:13:46\",\"updated_at\":\"2018201820182018-NovNov-MonMon 14:58:23\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 07:58:23'),
(151, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 07:59:12'),
(152, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 07:59:29'),
(153, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 07:59:45'),
(154, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 07:59:55'),
(155, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 08:00:00'),
(156, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 08:00:05'),
(157, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 08:00:10'),
(158, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 08:00:16'),
(159, 1, 1, 1, 'Thêm tài khoản ID: 42', '{\"id\":\"42\",\"name\":\"Nguyen Van Test 1\",\"username\":\"test1\",\"password\":\"$2y$08$eG1nbncxQUwvazZidkw1VOlyGiW6.6BbyNfeap41nBXBFx5ci4LgG\",\"mail\":\"test1@gmail.com\",\"phone\":\"0352222333\",\"avatar\":null,\"role\":\"2\",\"dept_id\":\"2\",\"dept_mg\":\"[\\\"23\\\",\\\"10\\\",\\\"2\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 15:01:50\",\"updated_at\":\"2018-11-26 15:01:50\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 08:01:50'),
(160, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 08:02:01'),
(161, 42, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 08:02:49'),
(162, 42, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 08:03:47'),
(163, 42, 1, 1, 'Thêm tài khoản ID: 43', '{\"id\":\"43\",\"name\":\"aaaaaaaaaaaaaaaaa\",\"username\":\"aaaaaa\",\"password\":\"$2y$08$bzhzSEpzSGtOY2FGTzhiZuiaxOqhIhl.Yqn8b\\/UMc0HtE1EIIYZpO\",\"mail\":\"aaaaaaaaaaaaaaa@aaa\",\"phone\":\"0311111111\",\"avatar\":null,\"role\":\"2\",\"dept_id\":\"2\",\"dept_mg\":\"[\\\"2\\\",\\\"10\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 15:55:13\",\"updated_at\":\"2018-11-26 15:55:13\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 08:55:13'),
(164, 42, 1, 2, 'Cập nhật tài khoản ID: 43', '{\"id\":\"43\",\"name\":\"aaaaaaaaaaaaaaaaa\",\"username\":\"aaaaaa\",\"password\":\"$2y$08$bzhzSEpzSGtOY2FGTzhiZuiaxOqhIhl.Yqn8b\\/UMc0HtE1EIIYZpO\",\"mail\":\"aaaaaaaaaaaaaaa@aaa\",\"phone\":\"0311111111\",\"avatar\":\"aaaaaaaaaaaaaaaaa\",\"role\":\"2\",\"dept_id\":\"2\",\"dept_mg\":\"[\\\"2\\\",\\\"10\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 15:55:13\",\"updated_at\":\"2018201820182018-NovNov-MonMon 16:14:48\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:14:48'),
(165, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:21:00'),
(166, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:22:18'),
(167, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:30:22'),
(168, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:30:49'),
(169, 1, 1, 2, 'Cập nhật đơn vị ID: 9', '{\"id\":\"9\",\"code\":\"D001\",\"name\":\"Vi\\u1ec7t Nam\",\"parent_id\":0,\"level\":0,\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:34:18'),
(170, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:35:44'),
(171, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:37:14'),
(172, 2, 1, 1, 'Thêm tài khoản ID: 44', '{\"id\":\"44\",\"name\":\"Nguyen Van Test 2\",\"username\":\"test2\",\"password\":\"$2y$08$TXoyNE9rR0dpU1M0cE9ieONkxhPn2zrwK5FuKak7PMfaebqZL\\/0p.\",\"mail\":\"test2@gmail.com\",\"phone\":\"0356666666\",\"avatar\":null,\"role\":\"3\",\"dept_id\":\"2\",\"dept_mg\":\"[\\\"2\\\"]\",\"status\":\"0\",\"created_at\":\"2018-11-26 16:39:20\",\"updated_at\":\"2018-11-26 16:39:20\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:39:20'),
(173, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:39:47'),
(174, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:40:09'),
(175, 1, 1, 2, 'Cập nhật tài khoản ID: 44', '{\"id\":\"44\",\"name\":\"Nguyen Van Test 2\",\"username\":\"test2\",\"password\":\"$2y$08$TXoyNE9rR0dpU1M0cE9ieONkxhPn2zrwK5FuKak7PMfaebqZL\\/0p.\",\"mail\":\"test2@gmail.com\",\"phone\":\"0356666666\",\"avatar\":\"Nguyen Van Test 2\",\"role\":\"3\",\"dept_id\":\"2\",\"dept_mg\":\"[\\\"2\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 16:39:20\",\"updated_at\":\"2018201820182018-NovNov-MonMon 16:41:04\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:41:04'),
(176, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 10:05:19'),
(177, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 11:49:54'),
(178, 1, 1, 2, 'Đã thay đổi mật khẩu', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 12:01:24'),
(179, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-27 05:56:26'),
(180, 1, 1, 2, 'Đã thay đổi mật khẩu', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-27 06:00:14'),
(181, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-27 06:00:36'),
(182, 2, 1, 2, 'Đã thay đổi mật khẩu', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-27 06:06:11'),
(183, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-27 06:06:25'),
(184, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-27 07:25:05'),
(185, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-27 07:34:25'),
(186, 2, 1, 1, 'Thêm người sử dụng ID: 15', '{\"id\":\"15\",\"code\":\"12345678\",\"name\":\"Nguyen Van C\",\"dept_id\":\"2\",\"note\":null,\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-27 08:22:25'),
(187, 2, 1, 2, 'Cập nhật người sử dụng ID: 15', '{\"id\":\"15\",\"code\":\"12345678\",\"name\":\"Nguyen Van C\",\"dept_id\":\"2\",\"note\":null,\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-27 08:28:21'),
(188, 2, 1, 2, 'Cập nhật người sử dụng ID: 15', '{\"id\":\"15\",\"code\":\"12345678\",\"name\":\"Nguyen Van C\",\"dept_id\":\"2\",\"location_id\":\"0\",\"note\":null,\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-27 08:30:21'),
(189, 2, 1, 2, 'Cập nhật người sử dụng ID: 15', '{\"id\":\"15\",\"code\":\"12345678\",\"name\":\"Nguyen Van C\",\"dept_id\":\"2\",\"location_id\":\"1\",\"note\":null,\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-27 08:31:57'),
(190, 2, 1, 3, 'Xóa người sử dụng', '{\"id\":\"2\",\"code\":\"234\",\"name\":\"Tr\\u1ea7n V\\u0103n C\",\"dept_id\":\"2\",\"location_id\":\"0\",\"note\":\"\",\"status\":4}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-27 08:46:17'),
(191, 2, 1, 2, 'Cập nhật vị trí ID: 20', '{\"id\":\"20\",\"dept_id\":\"2\",\"code\":\"HNNL00008\",\"name\":\"P.107\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-27 09:07:34'),
(192, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-28 02:18:53'),
(193, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-29 02:02:00'),
(194, 1, 1, 1, 'Thêm mới danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"1\",\"name\":\"Gi\\u00e1m \\u0111\\u1ed1c\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-29 04:19:44'),
(195, 1, 1, 2, 'Cập nhật vị trí ID: 1', '{\"id\":\"1\",\"cat_id\":\"1\",\"name\":\"Gi\\u00e1m \\u0111\\u1ed1c\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-29 07:53:42'),
(196, 1, 1, 2, 'Cập nhật vị trí ID: 1', '{\"id\":\"1\",\"cat_id\":\"1\",\"name\":\"Gi\\u00e1m \\u0111\\u1ed1c\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-29 07:55:20'),
(197, 1, 1, 1, 'Thêm mới danh mục ID: 2', '{\"id\":\"2\",\"cat_id\":\"1\",\"name\":\"T\\u1ed5ng Gi\\u00e1m \\u0110\\u1ed1c\",\"status\":\"0\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-29 08:13:17'),
(198, 1, 1, 1, 'Thêm mới danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"2\",\"name\":\"B\\u1ed9 ph\\u1eadn K\\u1ef9 thu\\u1eadt\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-29 08:13:55'),
(199, 1, 1, 2, 'Cập nhật vị trí ID: 2', '{\"id\":\"2\",\"cat_id\":\"1\",\"name\":\"T\\u1ed5ng Gi\\u00e1m \\u0110\\u1ed1c\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-29 08:15:29'),
(200, 1, 1, 3, 'Xóa Chức vụ', '{\"id\":\"2\",\"cat_id\":\"1\",\"name\":\"T\\u1ed5ng Gi\\u00e1m \\u0110\\u1ed1c\",\"status\":4,\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-29 08:49:57'),
(201, 1, 1, 1, 'Thêm ngôn ngữ ID: 1', '{\"id\":\"1\",\"name\":\"VIET NAM\",\"short_name\":\"VIE\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-29 10:19:08'),
(202, 1, 1, 1, 'Thêm ngôn ngữ ID: 4', '{\"id\":\"4\",\"name\":\"ENGLISH\",\"short_name\":\"END\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-29 10:45:00'),
(203, 1, 1, 1, 'Thêm ngôn ngữ ID: 5', '{\"id\":\"5\",\"name\":\"ENGLISH\",\"short_name\":\"VIE\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-29 10:46:37'),
(204, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 02:01:57'),
(205, 1, 1, 1, 'Thêm ngôn ngữ ID: 6', '{\"id\":\"6\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"icon\":null,\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 03:04:51'),
(206, 1, 1, 1, 'Thêm ngôn ngữ ID: 8', '{\"id\":\"8\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"icon\":\"\\/public\\/language_file\\/CHI\\/china.png\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 03:12:53'),
(207, 1, 1, 1, 'Thêm ngôn ngữ ID: 9', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/public\\/language_file\\/CHI\\/\",\"icon\":\"china.png\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 03:22:27'),
(208, 1, 1, 2, 'Cập nhật ngôn ngữ ID: 9', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHE\",\"path\":\"\\/public\\/language_file\\/che\\/\",\"icon\":\"china.png\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 03:33:26'),
(209, 1, 1, 2, 'Cập nhật ngôn ngữ ID: 9', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/public\\/language_file\\/chi\\/\",\"icon\":\"china.png\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 03:37:54'),
(210, 1, 1, 2, 'Cập nhật ngôn ngữ ID: 9', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHE\",\"path\":\"\\/public\\/language_file\\/che\\/\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 03:38:36'),
(211, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHE\",\"path\":\"\\/public\\/language_file\\/che\\/\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 03:48:46'),
(212, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/public\\/language_file\\/chi\\/\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 03:49:09'),
(213, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHE\",\"path\":\"\\/public\\/language_file\\/che\\/\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 03:50:09'),
(214, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHU\",\"path\":\"\\/public\\/language_file\\/che\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 03:56:05'),
(215, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHE\",\"path\":\"\\/public\\/language_file\\/che\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 03:56:17'),
(216, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/public\\/language_file\\/chi\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 03:57:34'),
(217, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/public\\/language_file\\/chi\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 03:57:58'),
(218, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHE\",\"path\":\"\\/public\\/language_file\\/che\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 03:58:37'),
(219, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHE\",\"path\":\"\\/public\\/language_file\\/che\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 03:58:54'),
(220, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/public\\/language_file\\/chi\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:01:27'),
(221, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/public\\/language_file\\/chi\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:01:38'),
(222, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHE\",\"path\":\"\\/public\\/language_file\\/che\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:02:16'),
(223, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/public\\/language_file\\/chi\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:03:25'),
(224, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHE\",\"path\":\"\\/public\\/language_file\\/che\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:03:35'),
(225, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/public\\/language_file\\/chi\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:04:32'),
(226, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/public\\/language_file\\/chi\",\"icon\":\"united-states.png\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:06:35'),
(227, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/public\\/language_file\\/chi\",\"icon\":\"china.png\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:06:45'),
(228, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/public\\/language_file\\/chi\",\"icon\":\"united-states.png\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:06:52'),
(229, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/language_file\\/chi\",\"icon\":\"china.png\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:13:05'),
(230, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHE\",\"path\":\"\\/language_file\\/che\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:13:24'),
(231, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHE\",\"path\":\"\\/language_file\\/che\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:18:11'),
(232, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHE\",\"path\":\"\\/language_file\\/che\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:18:28'),
(233, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/language_file\\/chi\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:18:36'),
(234, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHE\",\"path\":\"\\/language_file\\/che\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:18:47'),
(235, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/language_file\\/chi\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:20:45'),
(236, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/language_file\\/chi\",\"icon\":\"china.png\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:21:06'),
(237, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/language_file\\/chi\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:24:22'),
(238, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/language_file\\/chi\",\"icon\":\"china.png\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:24:33'),
(239, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/language_file\\/chi\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:25:15'),
(240, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/language_file\\/chi\",\"icon\":\"china.png\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:25:23'),
(241, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/language_file\\/chi\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:27:34'),
(242, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/language_file\\/chi\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:29:01'),
(243, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/language_file\\/chi\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:29:51'),
(244, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/language_file\\/chi\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:32:13'),
(245, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/language_file\\/chi\",\"icon\":\"china.png\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:32:30'),
(246, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/language_file\\/chi\",\"icon\":\"china.png\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:32:40'),
(247, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"9\",\"name\":\"CHIESE\",\"short_name\":\"CHI\",\"path\":\"\\/language_file\\/chi\",\"icon\":\"china.png\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:33:06'),
(248, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"5\",\"name\":\"ENGLISH\",\"short_name\":\"VIE\",\"path\":null,\"icon\":null,\"status\":\"1\",\"actived\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:33:26'),
(249, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"5\",\"name\":\"ENGLISH\",\"short_name\":\"END\",\"path\":\"\\/language_file\\/end\",\"icon\":\"united-states.png\",\"status\":\"1\",\"actived\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:34:00'),
(250, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"1\",\"name\":\"VIET NAM\",\"short_name\":\"VIE\",\"path\":null,\"icon\":null,\"status\":\"1\",\"actived\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:34:10'),
(251, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"1\",\"name\":\"VIET NAM\",\"short_name\":\"VIE\",\"path\":null,\"icon\":\"vietnam.png\",\"status\":\"1\",\"actived\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:34:36'),
(252, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"1\",\"name\":\"VIET NAM\",\"short_name\":\"VIE\",\"path\":null,\"icon\":\"vietnam.png\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:37:11'),
(253, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"1\",\"name\":\"VIET NAM\",\"short_name\":\"VIE\",\"path\":null,\"icon\":\"vietnam.png\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:38:03'),
(254, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"1\",\"name\":\"VIET NAM\",\"short_name\":\"VIE\",\"path\":\"\\/language_file\\/vie\",\"icon\":\"united-states.png\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:38:12'),
(255, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"1\",\"name\":\"VIET NAM\",\"short_name\":\"VIE\",\"path\":\"\\/language_file\\/vie\",\"icon\":\"china.png\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:48:53'),
(256, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"2\",\"name\":\"ENGLISH\",\"short_name\":\"END\",\"path\":\"\\/language_file\\/end\",\"icon\":\"united-states.png\",\"status\":\"1\",\"actived\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:53:23'),
(257, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"2\",\"name\":\"ENGLISH\",\"short_name\":\"END\",\"path\":\"\\/language_file\\/end\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:56:14'),
(258, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"2\",\"name\":\"ENGLISH\",\"short_name\":\"END\",\"path\":\"\\/language_file\\/end\",\"icon\":\"\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:56:25'),
(259, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"2\",\"name\":\"ENGLISH\",\"short_name\":\"END\",\"path\":\"\\/language_file\\/end\",\"icon\":\"united-states.png\",\"status\":\"1\",\"actived\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:57:09'),
(260, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"1\",\"name\":\"VIET NAM\",\"short_name\":\"VIE\",\"path\":\"\\/language_file\\/vie\",\"icon\":\"vietnam.png\",\"status\":\"1\",\"actived\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 04:59:07'),
(261, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 08:22:09'),
(262, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 10:03:29'),
(263, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 10:50:28'),
(264, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 10:53:25'),
(265, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 10:54:26'),
(266, 1, 1, 1, 'Thêm ngôn ngữ ID: 4', '{\"id\":\"4\",\"name\":\"KOREA\",\"short_name\":\"KOR\",\"path\":\"\\/language_file\\/kor\",\"icon\":\"south-korea.png\",\"status\":\"1\",\"actived\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-11-30 12:37:00'),
(267, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"2\",\"name\":\"ENGLISH\",\"short_name\":\"END\",\"path\":\"\\/language_file\\/end\",\"icon\":\"united-states.png\",\"status\":\"1\",\"actived\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-01 01:28:46'),
(268, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-01 01:55:04'),
(269, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-03 02:15:28'),
(270, 1, 1, 3, 'Xóa ngôn ngữ', '{\"id\":\"4\",\"name\":\"KOREA\",\"short_name\":\"KOR\",\"path\":\"\\/language_file\\/kor\",\"icon\":\"south-korea.png\",\"status\":4,\"actived\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-03 02:59:52'),
(271, 1, 1, 3, 'Xóa ngôn ngữ', '{\"id\":\"4\",\"name\":\"KOREA\",\"short_name\":\"KOR\",\"path\":\"\\/language_file\\/kor\",\"icon\":\"south-korea.png\",\"status\":4,\"actived\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-03 03:10:21'),
(272, 1, 1, 3, 'Xóa ngôn ngữ', '{\"id\":\"4\",\"name\":\"KOREA\",\"short_name\":\"KOR\",\"path\":\"\\/language_file\\/kor\",\"icon\":\"south-korea.png\",\"status\":4,\"actived\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-03 03:12:13'),
(273, 1, 1, 3, 'Xóa ngôn ngữ', '{\"id\":\"4\",\"name\":\"KOREA\",\"short_name\":\"KOR\",\"path\":\"\\/language_file\\/kor\",\"icon\":\"south-korea.png\",\"status\":4,\"actived\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-03 03:14:51'),
(274, 1, 1, 3, 'Xóa ngôn ngữ', '{\"id\":\"4\",\"name\":\"KOREA\",\"short_name\":\"KOR\",\"path\":\"\\/language_file\\/kor\",\"icon\":\"south-korea.png\",\"status\":4,\"actived\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-03 03:16:39'),
(275, 1, 1, 3, 'Xóa ngôn ngữ', '{\"id\":\"4\",\"name\":\"KOREA\",\"short_name\":\"KOR\",\"path\":\"\\/language_file\\/kor\",\"icon\":\"south-korea.png\",\"status\":4,\"actived\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-03 03:19:02'),
(276, 1, 1, 3, 'Xóa ngôn ngữ', '{\"id\":\"4\",\"name\":\"KOREA\",\"short_name\":\"KOR\",\"path\":\"\\/language_file\\/kor\",\"icon\":\"south-korea.png\",\"status\":4,\"actived\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-03 03:20:46'),
(277, 1, 1, 3, 'Xóa ngôn ngữ', '{\"id\":\"4\",\"name\":\"KOREA\",\"short_name\":\"KOR\",\"path\":\"\\/language_file\\/kor\",\"icon\":\"south-korea.png\",\"status\":4,\"actived\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-03 03:27:16'),
(278, 1, 1, 3, 'Xóa ngôn ngữ', '{\"id\":\"4\",\"name\":\"KOREA\",\"short_name\":\"KOR\",\"path\":\"\\/language_file\\/kor\",\"icon\":\"south-korea.png\",\"status\":4,\"actived\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-03 03:28:22'),
(279, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-03 04:44:53'),
(280, 1, 1, 1, 'Thêm nhóm tài sản 1', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-03 06:00:48'),
(281, 1, 1, 2, 'Cập nhật người dùng ID: 2', '{\"id\":\"2\",\"code\":\"234\",\"name\":\"Tr\\u1ea7n V\\u0103n C\",\"dept_id\":\"2\",\"location_id\":\"1\",\"note\":\"\",\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-03 08:54:28'),
(282, 1, 1, 2, 'Cập nhật người dùng ID: 2', '{\"id\":\"2\",\"code\":\"234\",\"name\":\"Tr\\u1ea7n V\\u0103n C\",\"dept_id\":\"2\",\"location_id\":\"1\",\"note\":\"\",\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-03 08:55:15'),
(283, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-04 01:12:31');
INSERT INTO `log_history` (`id`, `user_id`, `page`, `type`, `name`, `detail`, `ip`, `device`, `created_at`) VALUES
(284, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-05 00:33:58'),
(285, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-06 00:54:02'),
(286, 1, 1, 1, 'Thêm mới danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"7\",\"name\":\"H\\u00e0ng nh\\u1eadp kh\\u1ea9u\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-06 02:56:44'),
(287, 1, 1, 1, 'Thêm mới danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"8\",\"name\":\"M\\u00e1y\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-06 02:57:23'),
(288, 1, 1, 1, 'Thêm mới danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"9\",\"name\":\"Hyundai\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-06 02:58:32'),
(289, 1, 1, 1, 'Thêm mới danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"10\",\"name\":\"Trung Qu\\u1ed1c\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-06 02:58:45'),
(290, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-06 08:47:35'),
(291, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.110 Chrome/70.0.3538.110 Safari/537.36', '2018-12-07 00:20:47'),
(292, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-08 05:54:49'),
(293, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-09 18:01:24'),
(294, 1, 1, 1, 'Tạo nhập kho thành công với ID 1', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-09 18:25:59'),
(295, 1, 1, 1, 'Tạo nhập kho thành công với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-10 07:04:59'),
(296, 1, 1, 1, 'Thêm tài sản vào nhập kho thành công với ID 1', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-10 09:34:20'),
(297, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 01:16:17'),
(298, 1, 1, 1, 'Thêm tài sản vào nhập kho thành công với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 03:13:40'),
(299, 1, 1, 1, 'Tạo nhập kho thành công với ID 1', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 04:15:11'),
(300, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"N1234567\",\"warehouse_id\":\"1\",\"move\":\"Ph\\u00f2ng nh\\u00e2n s\\u1ef1\",\"manager_id\":\"2\",\"datetime\":\"2018-12-01 00:00:00\",\"input_type\":\"1\",\"input_doc\":null,\"delivery_doc\":null,\"value_status\":\"1\",\"value_doc\":null,\"created_user\":\"1\",\"status\":\"1\",\"note\":\"AAAAAAAAAAA\",\"pelf\":\"\",\"created_at\":\"2018-12-10 01:25:58\",\"updated_at\":\"2018-12-10 01:25:58\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 04:27:18'),
(301, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"N1234567\",\"warehouse_id\":\"1\",\"move\":\"Ph\\u00f2ng nh\\u00e2n s\\u1ef1\",\"manager_id\":\"2\",\"datetime\":\"2018-12-01 00:00:00\",\"input_type\":\"1\",\"input_doc\":null,\"delivery_doc\":null,\"value_status\":\"1\",\"value_doc\":null,\"created_user\":\"1\",\"status\":\"1\",\"note\":\"AAAAAAAAAAA\",\"pelf\":\"\",\"created_at\":\"2018-12-10 01:25:58\",\"updated_at\":\"2018-12-11 11:27:18\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 04:27:26'),
(302, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"N1234567\",\"warehouse_id\":\"1\",\"move\":\"Ph\\u00f2ng nh\\u00e2n s\\u1ef1\",\"manager_id\":\"2\",\"reason\":\"\",\"datetime\":\"2018-12-01 00:00:00\",\"input_type\":\"1\",\"input_doc\":null,\"delivery_doc\":null,\"value_status\":\"1\",\"value_doc\":null,\"created_user\":\"1\",\"status\":\"1\",\"note\":\"AAAAAAAAAAA\",\"pelf\":\"\",\"created_at\":\"2018-12-10 01:25:58\",\"updated_at\":\"2018-12-11 11:27:26\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 04:30:49'),
(303, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"N1234567\",\"warehouse_id\":\"1\",\"move\":\"Ph\\u00f2ng nh\\u00e2n s\\u1ef1\",\"manager_id\":\"2\",\"reason\":\"Nh\\u1eadp\",\"datetime\":\"2018-12-01 00:00:00\",\"input_type\":\"1\",\"input_doc\":null,\"delivery_doc\":null,\"value_status\":\"1\",\"value_doc\":null,\"created_user\":\"1\",\"status\":\"1\",\"note\":\"AAAAAAAAAAA\",\"pelf\":\"\",\"created_at\":\"2018-12-10 01:25:58\",\"updated_at\":\"2018-12-11 11:30:49\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 04:30:53'),
(304, 1, 1, 2, 'Cập nhật kho ID: 2', '{\"id\":\"2\",\"code\":\"aaaaaaa\",\"warehouse_id\":\"1\",\"move\":\"aaaa\",\"manager_id\":\"2\",\"reason\":\"\",\"datetime\":\"2018-12-10 00:00:00\",\"input_type\":\"1\",\"input_doc\":\"1544425499Bi-kip-Co-Luong-Tu.pdf\",\"delivery_doc\":\"1544425499Quan ly tai san.pdf\",\"value_status\":\"1\",\"value_doc\":\"1544425499Quan ly tai san.pdf\",\"created_user\":\"1\",\"status\":\"1\",\"note\":\"a\",\"pelf\":\"[\\\"1\\\",\\\"2\\\"]\",\"created_at\":\"2018-12-10 14:04:59\",\"updated_at\":\"2018-12-11 10:13:40\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 04:50:50'),
(305, 1, 1, 2, 'Cập nhật kho ID: 2', '{\"id\":\"2\",\"code\":\"aaaaaaa\",\"warehouse_id\":\"1\",\"move\":\"aaaa\",\"manager_id\":\"2\",\"reason\":\"Nhap moi\",\"datetime\":\"2018-12-10 00:00:00\",\"input_type\":\"1\",\"input_doc\":\"1544425499Bi-kip-Co-Luong-Tu.pdf\",\"delivery_doc\":\"1544425499Quan ly tai san.pdf\",\"value_status\":\"1\",\"value_doc\":\"2_1544503850Quan ly tai san.pdf\",\"created_user\":\"1\",\"status\":\"1\",\"note\":\"a\",\"pelf\":\"[\\\"1\\\",\\\"2\\\"]\",\"created_at\":\"2018-12-10 14:04:59\",\"updated_at\":\"2018-12-11 11:50:50\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 04:56:09'),
(306, 1, 1, 2, 'Cập nhật kho ID: 2', '{\"id\":\"2\",\"code\":\"aaaaaaa\",\"warehouse_id\":\"1\",\"move\":\"aaaa\",\"manager_id\":\"2\",\"reason\":\"Nhap moi\",\"datetime\":\"2018-12-10 00:00:00\",\"input_type\":\"1\",\"input_doc\":\"0_1544504169Bi-kip-Co-Luong-Tu.pdf\",\"delivery_doc\":\"1_1544504169Bi-kip-Co-Luong-Tu.pdf\",\"value_status\":\"1\",\"value_doc\":\"2_1544504169Bi-kip-Co-Luong-Tu.pdf\",\"created_user\":\"1\",\"status\":\"1\",\"note\":\"a\",\"pelf\":\"[\\\"1\\\",\\\"2\\\"]\",\"created_at\":\"2018-12-10 14:04:59\",\"updated_at\":\"2018-12-11 11:56:09\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 04:57:50'),
(307, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"N1234567\",\"warehouse_id\":\"1\",\"move\":\"Ph\\u00f2ng nh\\u00e2n s\\u1ef1\",\"manager_id\":\"2\",\"reason\":\"Nh\\u1eadp\",\"datetime\":\"2018-12-01 00:00:00\",\"input_type\":\"1\",\"input_doc\":null,\"delivery_doc\":null,\"value_status\":\"1\",\"value_doc\":null,\"created_user\":\"1\",\"status\":\"1\",\"note\":\"AAAAAAAAAAA\",\"pelf\":\"\",\"created_at\":\"2018-12-10 01:25:58\",\"updated_at\":\"2018-12-11 11:30:53\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 05:33:35'),
(308, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"X12345\",\"warehouse_id\":\"1\",\"move\":\"Nh\\u00e0 h\\u00e0ng\",\"manager_id\":\"1\",\"datetime\":\"2018-12-11 00:00:00\",\"reason\":\"\",\"output_type\":\"1\",\"output_doc\":null,\"value_status\":\"1\",\"value_doc\":\"1_1544501711Quan ly tai san.pdf\",\"created_user\":\"1\",\"status\":\"1\",\"note\":\"Ghi ch\\u00fa\",\"pelf\":null,\"created_at\":\"2018-12-11 11:15:11\",\"updated_at\":\"2018-12-11 11:15:11\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 05:42:27'),
(309, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"X12345\",\"warehouse_id\":\"1\",\"move\":\"Nh\\u00e0 h\\u00e0ng\",\"manager_id\":\"1\",\"datetime\":\"2018-12-11 00:00:00\",\"reason\":\"a\",\"output_type\":\"1\",\"output_doc\":\"\",\"value_status\":\"1\",\"value_doc\":\"\",\"created_user\":\"1\",\"status\":\"1\",\"note\":\"Ghi ch\\u00fa\",\"pelf\":null,\"created_at\":\"2018-12-11 11:15:11\",\"updated_at\":\"2018-12-11 12:42:27\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 05:44:36'),
(310, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"X12345\",\"warehouse_id\":\"1\",\"move\":\"Nh\\u00e0 h\\u00e0ng\",\"manager_id\":\"1\",\"datetime\":\"2018-12-11 00:00:00\",\"reason\":\"a\",\"output_type\":\"1\",\"output_doc\":\"0_1544507076Bi-kip-Co-Luong-Tu.pdf\",\"value_status\":\"1\",\"value_doc\":\"\",\"created_user\":\"1\",\"status\":\"1\",\"note\":\"Ghi ch\\u00fa\",\"pelf\":null,\"created_at\":\"2018-12-11 11:15:11\",\"updated_at\":\"2018-12-11 12:44:36\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 05:45:05'),
(311, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"X12345\",\"warehouse_id\":\"1\",\"move\":\"Nh\\u00e0 h\\u00e0ng\",\"manager_id\":\"1\",\"datetime\":\"2018-12-11 00:00:00\",\"reason\":\"a\",\"output_type\":\"1\",\"output_doc\":\"0_1544507105Bi-kip-Co-Luong-Tu.pdf\",\"value_status\":\"1\",\"value_doc\":\"\",\"created_user\":\"1\",\"status\":\"1\",\"note\":\"Ghi ch\\u00fa\",\"pelf\":null,\"created_at\":\"2018-12-11 11:15:11\",\"updated_at\":\"2018-12-11 12:45:05\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 05:45:50'),
(312, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"X12345\",\"warehouse_id\":\"1\",\"move\":\"Nh\\u00e0 h\\u00e0ng\",\"manager_id\":\"1\",\"datetime\":\"2018-12-11 00:00:00\",\"reason\":\"a\",\"output_type\":\"1\",\"output_doc\":\"0_1544507105Bi-kip-Co-Luong-Tu.pdf\",\"value_status\":\"1\",\"value_doc\":\"1_1544507150Quan ly tai san.pdf\",\"created_user\":\"1\",\"status\":\"1\",\"note\":\"Ghi ch\\u00fa\",\"pelf\":null,\"created_at\":\"2018-12-11 11:15:11\",\"updated_at\":\"2018-12-11 12:45:50\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 05:45:59'),
(313, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"X12345\",\"warehouse_id\":\"1\",\"move\":\"Nh\\u00e0 h\\u00e0ng\",\"manager_id\":\"1\",\"datetime\":\"2018-12-11 00:00:00\",\"reason\":\"a\",\"output_type\":\"1\",\"output_doc\":\"0_1544507105Bi-kip-Co-Luong-Tu.pdf\",\"value_status\":\"1\",\"value_doc\":\"1_1544507159Quan ly tai san.pdf\",\"created_user\":\"1\",\"status\":\"1\",\"note\":\"Ghi ch\\u00fa\",\"pelf\":null,\"created_at\":\"2018-12-11 11:15:11\",\"updated_at\":\"2018-12-11 12:45:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 05:48:21'),
(314, 1, 1, 1, 'Thêm tài sản vào nhập kho thành công với ID 1', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 06:04:10'),
(315, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"N1234567\",\"warehouse_id\":\"1\",\"move\":\"Ph\\u00f2ng nh\\u00e2n s\\u1ef1\",\"manager_id\":\"2\",\"reason\":\"Nh\\u1eadp\",\"datetime\":\"2018-12-01 00:00:00\",\"input_type\":\"1\",\"input_doc\":null,\"delivery_doc\":null,\"value_status\":\"1\",\"value_doc\":null,\"created_user\":\"1\",\"status\":\"1\",\"note\":\"AAAAAAAAAAA\",\"created_at\":\"2018-12-10 01:25:58\",\"updated_at\":\"2018-12-11 12:33:35\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 06:16:02'),
(316, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"N1234567\",\"warehouse_id\":\"1\",\"move\":\"Ph\\u00f2ng nh\\u00e2n s\\u1ef1\",\"manager_id\":\"2\",\"reason\":\"Nh\\u1eadp\",\"datetime\":\"2018-12-01 00:00:00\",\"input_type\":\"1\",\"input_doc\":\"0_1544508962Phuluc.doc\",\"delivery_doc\":\"1_1544508962Phuluc.doc\",\"value_status\":\"1\",\"value_doc\":\"2_1544508962Phuluc.doc\",\"created_user\":\"1\",\"status\":\"1\",\"note\":\"AAAAAAAAAAA\",\"created_at\":\"2018-12-10 01:25:58\",\"updated_at\":\"2018-12-11 13:16:02\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 06:17:37'),
(317, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"N1234567\",\"warehouse_id\":\"1\",\"move\":\"Ph\\u00f2ng nh\\u00e2n s\\u1ef1\",\"manager_id\":\"2\",\"reason\":\"Nh\\u1eadp\",\"datetime\":\"2018-12-01 00:00:00\",\"input_type\":\"1\",\"input_doc\":\"0_1544509057Phuluc.doc\",\"delivery_doc\":\"1_1544509057Phuluc.doc\",\"value_status\":\"1\",\"value_doc\":\"2_1544509057Phuluc.doc\",\"created_user\":\"1\",\"status\":\"1\",\"note\":\"AAAAAAAAAAA\",\"created_at\":\"2018-12-10 01:25:58\",\"updated_at\":\"2018-12-11 13:17:37\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 06:18:33'),
(318, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 14:52:00'),
(319, 1, 1, 1, 'Thêm mới danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"4\",\"name\":\"VND\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-11 15:20:27'),
(320, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 00:47:26'),
(321, 1, 1, 1, 'Thêm tài sản ID: 1', '{\"id\":\"1\",\"code\":\"M123456\",\"name\":\"Laptop HP 15 da0054TU\",\"descrip1\":\"i3 7020U\\/4GB\\/500GB\\/Win10\\/(4ME68PA)\",\"descrip2\":\"Chu\\u1ed9t Misusi\",\"bill_num\":\"123456\",\"buy_date\":\"2018-12-12\",\"expired_guarantee_date\":\"2023-12-12\",\"used_date\":\"2018-12-12\",\"used_year\":\"2018\",\"price\":10000000,\"class_id\":\"1\",\"unit_id\":\"1\",\"producer_id\":\"1\",\"supplier_id\":\"1\",\"status\":\"0\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"location_id\":\"1\",\"depreciation_time\":\"10\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 00:52:30'),
(322, 1, 1, 1, 'Thêm tài sản ID: 2', '{\"id\":\"2\",\"code\":\"M654321\",\"name\":\"Laptop Dell Inspiron 3576\",\"descrip1\":\"i5 8250U\\/4GB\\/1TB\\/Win10\\/(P63F002N76F)\",\"descrip2\":\"Chu\\u1ed9t Misusi\",\"bill_num\":\"2345678\",\"buy_date\":\"2018-12-13\",\"expired_guarantee_date\":\"2018-12-12\",\"used_date\":\"2018-12-01\",\"used_year\":\"2018\",\"price\":1000000,\"class_id\":\"1\",\"unit_id\":\"1\",\"producer_id\":\"1\",\"supplier_id\":\"1\",\"status\":\"0\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"location_id\":\"1\",\"depreciation_time\":\"10\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 00:58:52'),
(323, 1, 1, 1, 'Thêm mới danh mục ID: 2', '{\"id\":\"2\",\"cat_id\":\"9\",\"name\":\"Dell\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 00:59:28'),
(324, 1, 1, 1, 'Thêm mới danh mục ID: 3', '{\"id\":\"3\",\"cat_id\":\"9\",\"name\":\"HP\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 00:59:45'),
(325, 1, 1, 1, 'Thêm mới danh mục ID: 4', '{\"id\":\"4\",\"cat_id\":\"9\",\"name\":\"Assus\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 00:59:56'),
(326, 1, 1, 1, 'Thêm mới danh mục ID: 5', '{\"id\":\"5\",\"cat_id\":\"9\",\"name\":\"Sony\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 01:00:10'),
(327, 1, 1, 1, 'Thêm mới danh mục ID: 2', '{\"id\":\"2\",\"cat_id\":\"10\",\"name\":\"Sony\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 01:00:33'),
(328, 1, 1, 1, 'Thêm mới danh mục ID: 3', '{\"id\":\"3\",\"cat_id\":\"10\",\"name\":\"HP\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 01:00:39'),
(329, 1, 1, 1, 'Thêm mới danh mục ID: 4', '{\"id\":\"4\",\"cat_id\":\"10\",\"name\":\"Dell\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 01:00:58'),
(330, 1, 1, 1, 'Thêm tài sản ID: 3', '{\"id\":\"3\",\"code\":\"M2341456\",\"name\":\"Laptop Asus VivoBook S15 S510UA\",\"descrip1\":\"i3 8130U\\/4GB\\/1TB\\/Win10\\/(BQ222T)\",\"descrip2\":\"Chu\\u1ed9t Misusi\",\"bill_num\":\"321654\",\"buy_date\":\"2018-12-12\",\"expired_guarantee_date\":\"2018-12-12\",\"used_date\":\"2018-12-12\",\"used_year\":\"2018\",\"price\":1000000,\"class_id\":\"1\",\"unit_id\":\"1\",\"producer_id\":\"2\",\"supplier_id\":\"4\",\"status\":\"0\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"location_id\":\"1\",\"depreciation_time\":\"10\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 01:03:52'),
(331, 1, 1, 1, 'Thêm bảo trì ID: 1', '{\"id\":\"1\",\"properties_id\":\"1\",\"code\":\"123456\",\"note\":\"Bao tri gap\",\"item\":\"B\\u1ea3o tr\\u00ec\",\"man_type\":\"1\",\"man_day\":\"2018-12-12\",\"num_day\":\"10\",\"noti_day\":\"10\",\"man_name\":\"Nguyen Van A\",\"man_email\":\"nguyenvana@gmail.com\",\"man_phone\":\"03265487852\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 02:52:44'),
(332, 1, 1, 2, 'Cập nhật kho ID: 2', '{\"id\":\"2\",\"code\":\"aaaaaaa\",\"warehouse_id\":\"1\",\"move\":\"aaaa\",\"manager_id\":\"2\",\"reason\":\"Nhap moi\",\"datetime\":\"2018-12-10 00:00:00\",\"input_type\":\"1\",\"input_doc\":\"0_1544504270Quan ly tai san.pdf\",\"delivery_doc\":\"1_1544504270Quan ly tai san.pdf\",\"value_status\":\"1\",\"value_doc\":\"2_1544504270Quan ly tai san.pdf\",\"created_user\":\"1\",\"status\":\"1\",\"note\":\"a\",\"created_at\":\"2018-12-10 14:04:59\",\"updated_at\":\"2018-12-11 11:57:50\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 03:13:51'),
(333, 1, 1, 2, 'Cập nhật kho ID: 2', '{\"id\":\"2\",\"code\":\"M1234323\",\"warehouse_id\":\"1\",\"move\":\"aaaa\",\"manager_id\":\"2\",\"reason\":\"Nhap moi\",\"datetime\":\"2018-12-10 00:00:00\",\"input_type\":\"1\",\"input_doc\":\"0_1544504270Quan ly tai san.pdf\",\"delivery_doc\":\"1_1544504270Quan ly tai san.pdf\",\"value_status\":\"1\",\"value_doc\":\"2_1544504270Quan ly tai san.pdf\",\"created_user\":\"1\",\"status\":\"1\",\"note\":\"a\",\"created_at\":\"2018-12-10 14:04:59\",\"updated_at\":\"2018-12-12 10:13:51\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 03:14:17'),
(334, 1, 1, 2, 'Cập nhật kho ID: 2', '{\"id\":\"2\",\"code\":\"M1234323\",\"warehouse_id\":\"1\",\"move\":\"aaaa\",\"manager_id\":\"2\",\"reason\":\"Nhap moi\",\"datetime\":\"2018-12-10 00:00:00\",\"input_type\":\"1\",\"input_doc\":\"0_1544504270Quan ly tai san.pdf\",\"delivery_doc\":\"1_1544504270Quan ly tai san.pdf\",\"value_status\":\"1\",\"value_doc\":\"2_1544504270Quan ly tai san.pdf\",\"created_user\":\"1\",\"status\":\"1\",\"note\":\"Cong ty X\",\"created_at\":\"2018-12-10 14:04:59\",\"updated_at\":\"2018-12-12 10:14:17\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 03:20:42'),
(335, 1, 1, 1, 'Thêm tài sản vào nhập kho thành công với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 06:27:56'),
(336, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 07:01:10'),
(337, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-12 16:09:24'),
(338, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-13 01:59:09'),
(339, 1, 1, 1, 'Thêm đối tác ID: 1', '{\"id\":\"1\",\"name\":\"C\\u00f4ng ty 1\",\"address\":\"135B, Tr\\u1ea7n H\\u01b0ng \\u0110\\u1ea1o, P. B\\u1ebfn Ngh\\u00e9, Qu\\u1eadn 1\",\"phone\":\"03265489956\",\"website\":\"https:\\/\\/congty1.com\",\"mstdn\":\"21354645632123\",\"career\":\"Cung c\\u1ea5p linh ki\\u1ec7n\",\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-13 07:15:36'),
(340, 1, 1, 1, 'Thêm mới danh mục ID: 2', '{\"id\":\"2\",\"cat_id\":\"9\",\"name\":\"C\\u00f4ng ty 2\",\"address\":\"115, Tr\\u1ea7n H\\u01b0ng \\u0110\\u1ea1o, Ph\\u01b0\\u1eddng C\\u1ea7u \\u00d4ng L\\u00e3nh, Qu\\u1eadn 1\",\"phone\":\"036544846564\",\"email\":\"congty2@congty2.vn\",\"website\":\"https:\\/\\/congty2.vn\",\"mstdn\":\"5465456465465\",\"career\":\"Cung c\\u1ea5p than\",\"note\":null,\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-13 12:26:48'),
(341, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"N1234567\",\"warehouse_id\":\"1\",\"move\":\"Ph\\u00f2ng nh\\u00e2n s\\u1ef1\",\"move_type\":\"1\",\"supplieres_id\":\"1\",\"manager_id\":\"2\",\"reason\":\"Nh\\u1eadp\",\"datetime\":\"2018-12-01 00:00:00\",\"input_type\":\"1\",\"input_doc\":\"0_1544509057Phuluc.doc\",\"delivery_name\":\"\",\"delivery_doc\":\"1_1544509057Phuluc.doc\",\"value_status\":\"1\",\"value_doc\":\"2_1544509057Phuluc.doc\",\"created_user\":\"1\",\"status\":\"1\",\"note\":\"AAAAAAAAAAA\",\"created_at\":\"2018-12-10 01:25:58\",\"updated_at\":\"2018-12-11 13:18:33\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-13 13:02:22'),
(342, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-14 00:54:56'),
(343, 1, 1, 1, 'Thêm tài sản vào nhập kho thành công với ID ', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-14 03:30:25'),
(344, 1, 1, 1, 'Cập nhật tài sản trong nhập kho thành công với ID 3', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-14 08:51:44'),
(345, 1, 1, 1, 'Cập nhật tài sản trong nhập kho thành công với ID 3', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-14 08:52:26'),
(346, 1, 1, 1, 'Cập nhật tài sản trong nhập kho thành công với ID 3', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-14 08:53:35'),
(347, 1, 1, 1, 'Cập nhật tài sản trong nhập kho thành công với ID 3', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-14 08:53:41'),
(348, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-14 13:04:35'),
(349, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-15 00:42:36'),
(350, 1, 1, 1, 'Cập nhật tài sản trong nhập kho thành công với ID 3', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-15 01:56:37'),
(351, 1, 1, 1, 'Cập nhật tài sản trong nhập kho thành công với ID 3', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-15 01:58:41'),
(352, 1, 1, 1, 'Cập nhật tài sản trong nhập kho thành công với ID 3', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-15 01:59:17'),
(353, 1, 1, 1, 'Cập nhật tài sản trong nhập kho thành công với ID 3', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-15 01:59:53'),
(354, 1, 1, 1, 'Cập nhật tài sản trong nhập kho thành công với ID 3', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-15 02:00:00'),
(355, 1, 1, 1, 'Cập nhật tài sản trong nhập kho thành công với ID 3', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-15 02:00:44'),
(356, 1, 1, 1, 'Cập nhật tài sản trong nhập kho thành công với ID 3', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-15 02:41:13'),
(357, 1, 1, 1, 'Cập nhật tài sản trong nhập kho thành công với ID 3', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-15 02:52:00'),
(358, 1, 1, 1, 'Tạo nhập kho thành công với ID 3', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-15 03:35:25'),
(359, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"N1234567\",\"warehouse_id\":\"1\",\"move\":null,\"move_type\":\"2\",\"supplieres_id\":\"1\",\"manager_id\":\"2\",\"reason\":\"Nh\\u1eadp\",\"datetime\":\"2018-12-01 00:00:00\",\"input_type\":\"1\",\"input_doc\":\"0_1544509057Phuluc.doc\",\"delivery_name\":\"Nguyen Van A\",\"delivery_doc\":\"1_1544509057Phuluc.doc\",\"value_status\":\"1\",\"value_doc\":\"2_1544509057Phuluc.doc\",\"created_user\":\"1\",\"status\":\"1\",\"note\":\"AAAAAAAAAAA\",\"created_at\":\"2018-12-10 01:25:58\",\"updated_at\":\"2018-12-13 20:02:22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-15 04:16:16'),
(360, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-15 09:02:12'),
(361, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-16 16:55:59'),
(362, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"aaaaa\",\"warehouse_id\":\"1\",\"move\":null,\"move_type\":\"2\",\"supplieres_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"a\",\"datetime\":\"2018-12-15 00:00:00\",\"input_type\":\"1\",\"input_doc\":null,\"delivery_name\":\"a\",\"delivery_doc\":null,\"value_status\":\"1\",\"value_doc\":null,\"created_user\":\"1\",\"status\":\"0\",\"note\":\"a\",\"created_at\":\"2018-12-15 10:35:25\",\"updated_at\":\"2018-12-15 10:35:25\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-17 02:17:17'),
(363, 1, 1, 2, 'Cập nhật nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"M1234323\",\"warehouse_id\":\"1\",\"move\":null,\"move_type\":\"2\",\"supplieres_id\":\"1\",\"manager_id\":\"2\",\"reason\":\"Nhap moi\",\"datetime\":\"2018-12-10 00:00:00\",\"input_type\":\"1\",\"input_doc\":\"0_1544504270Quan ly tai san.pdf\",\"delivery_name\":\"\",\"delivery_doc\":\"1_1544504270Quan ly tai san.pdf\",\"value_status\":\"1\",\"value_doc\":\"2_1544504270Quan ly tai san.pdf\",\"created_user\":\"1\",\"status\":\"1\",\"note\":\"Cong ty X\",\"created_at\":\"2018-12-10 14:04:59\",\"updated_at\":\"2018-12-12 10:20:42\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-17 02:18:04'),
(364, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"aaaaa\",\"warehouse_id\":\"1\",\"move\":\"Nh\\u1eadp kh\\u00e1c\",\"move_type\":\"2\",\"supplieres_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"a\",\"datetime\":\"2018-12-15 00:00:00\",\"input_type\":\"1\",\"input_doc\":null,\"delivery_name\":\"a\",\"delivery_doc\":null,\"value_status\":\"1\",\"value_doc\":null,\"created_user\":\"1\",\"status\":\"0\",\"note\":\"a\",\"created_at\":\"2018-12-15 10:35:25\",\"updated_at\":\"2018-12-17 09:17:17\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-17 02:20:58'),
(365, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-17 03:41:02'),
(366, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NhaKho0111\",\"name\":\"Nh\\u00e0 Kho K\\u1ef9 thu\\u1eadt\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"description\":\"\",\"diagram\":null,\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-17 06:46:44'),
(367, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"N1234567\",\"warehouse_id\":\"1\",\"move\":null,\"move_type\":\"2\",\"supplieres_id\":\"1\",\"manager_id\":\"2\",\"reason\":\"Nh\\u1eadp\",\"datetime\":\"2018-12-01 00:00:00\",\"input_type\":\"1\",\"input_doc\":\"0_1544509057Phuluc.doc\",\"delivery_name\":\"Nguyen Van A\",\"delivery_doc\":\"1_1544509057Phuluc.doc\",\"value_status\":\"1\",\"value_doc\":\"2_1544509057Phuluc.doc\",\"created_user\":\"1\",\"status\":\"1\",\"note\":\"AAAAAAAAAAA\",\"created_at\":\"2018-12-10 01:25:58\",\"updated_at\":\"2018-12-15 11:16:16\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-17 07:17:04'),
(368, 1, 1, 1, 'Cập nhật tài sản trong nhập kho thành công với ID 3', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-17 07:19:53'),
(369, 1, 1, 1, 'Cập nhật tài sản trong nhập kho thành công với ID 1', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-17 07:20:13'),
(370, 1, 1, 1, 'Cập nhật tài sản trong nhập kho thành công với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-17 07:20:28'),
(371, 1, 1, 1, 'Cập nhật tài sản trong nhập kho thành công với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-17 08:29:44'),
(372, 1, 1, 1, 'Cập nhật tài sản trong nhập kho thành công với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-17 08:36:56'),
(373, 1, 1, 1, 'Cập nhật tài sản trong nhập kho thành công với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-17 08:37:59'),
(374, 1, 1, 1, 'Cập nhật tài sản trong nhập kho thành công với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-17 08:39:18'),
(375, 1, 1, 1, 'Cập nhật tài sản trong nhập kho thành công với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-17 08:39:23'),
(376, 1, 1, 1, 'Cập nhật tài sản kho thành công với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-17 08:41:35'),
(377, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-18 09:01:49'),
(378, 1, 1, 1, 'Tạo danh mục tài sản với ID 1', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-19 02:58:53'),
(379, 1, 1, 1, 'Thêm mới danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"5\",\"name\":\"H\\u00e0n Qu\\u1ed1c\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-19 03:46:49'),
(380, 1, 1, 1, 'Cập nhật tài sản kho thành công với ID 3', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-19 05:11:56'),
(381, 1, 1, 1, 'Cập nhật tài sản kho thành công với ID 3', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-19 09:13:12'),
(382, 1, 1, 1, 'Cập nhật tài sản kho thành công với ID 3', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-19 10:46:29'),
(383, 1, 1, 1, 'Cập nhật tài sản kho thành công với ID 1', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-19 10:46:56'),
(384, 1, 1, 1, 'Cập nhật tài sản kho thành công với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-19 10:47:30'),
(385, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-20 01:11:22'),
(386, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-24 06:08:26'),
(387, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-27 19:10:03'),
(388, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-27 19:17:23'),
(389, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-28 01:46:26'),
(390, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NhaKho0111\",\"name\":\"Nh\\u00e0 Kho K\\u1ef9 thu\\u1eadt\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"5\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"500\",\"pallet_used\":\"0\",\"description\":\"\",\"gates_in\":\"0\",\"gates_out\":\"0\",\"status\":\"1\",\"created_at\":\"2018-12-25 10:05:02\",\"updated_at\":\"2018-12-25 10:05:02\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-02 09:22:05'),
(391, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NhaKho0111\",\"name\":\"Nh\\u00e0 Kho K\\u1ef9 thu\\u1eadt\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"5\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"500\",\"pallet_used\":\"0\",\"description\":\"\",\"gates_in\":\"[{\\\"name\\\":\\\"C\\u1ed5ng 1\\\",\\\"size\\\":\\\"10\\\"}]\",\"gates_out\":\"[{\\\"name\\\":\\\"C\\u1ed5ng 2\\\",\\\"size\\\":\\\"10\\\"}]\",\"status\":\"1\",\"created_at\":\"2018-12-25 10:05:02\",\"updated_at\":\"2018-12-25 10:05:02\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-02 09:27:25'),
(392, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NhaKho0111\",\"name\":\"Nh\\u00e0 Kho K\\u1ef9 thu\\u1eadt\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"5\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"500\",\"pallet_used\":\"0\",\"description\":\"\",\"gates_in\":\"[{\\\"name\\\":\\\"C\\u1ed5ng 1\\\",\\\"size\\\":\\\"10\\\"}]\",\"gates_out\":\"[{\\\"name\\\":\\\"C\\u1ed5ng 2\\\",\\\"size\\\":\\\"10\\\"}]\",\"status\":\"1\",\"created_at\":\"2018-12-25 10:05:02\",\"updated_at\":\"2018-12-25 10:05:02\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-02 09:33:25'),
(393, 1, 1, 1, 'Tạo kho thành công với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-07 03:08:43'),
(394, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-10 08:12:28'),
(395, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-10 08:13:13'),
(396, 1, 1, 2, 'Cập nhật vị trí ID: 1', '{\"id\":\"1\",\"cat_id\":\"1\",\"name\":\"Gi\\u00e1m \\u0111\\u1ed1c\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-11 09:08:22'),
(397, 1, 1, 1, 'Thêm mới danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"11\",\"class_id\":\"1\",\"name\":\"C\\u00e1i g\\u00ec \\u0111\\u00f3\",\"info\":\"\\u0110\\u00e2y l\\u00e0 g\\u00ec\",\"status\":\"1\",\"note\":null}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-11 09:28:03'),
(398, 1, 1, 2, 'Cập nhật vị trí ID: 1', '{\"id\":\"1\",\"cat_id\":\"1\",\"name\":\"Gi\\u00e1m \\u0111\\u1ed1c\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-11 09:49:08'),
(399, 1, 1, 1, 'Thêm ngôn ngữ ID: 5', '{\"id\":\"5\",\"name\":\"L\\u00e0o\",\"short_name\":\"LAO\",\"path\":\"\\/language_file\\/lao\",\"icon\":\"laos.png\",\"status\":\"1\",\"actived\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-11 10:24:18'),
(400, 1, 1, 1, 'Tạo kho thành công với ID 1', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-13 20:12:20'),
(401, 1, 1, 1, 'Tạo kho thành công với ID 1', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-13 20:26:00'),
(402, 1, 1, 1, 'Cập nhật cổng của kho có ID1 với ID cổng là1', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-15 02:28:05'),
(403, 1, 1, 1, 'Cập nhật cổng của kho có ID1 với ID cổng là1', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-15 02:46:08'),
(404, 1, 1, 1, 'Cập nhật cổng của kho có ID1 với ID cổng là1', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-15 03:28:51'),
(405, 1, 1, 1, 'Cập nhật cổng của kho có ID1 với ID cổng là1', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-15 03:32:51'),
(406, 1, 1, 1, 'Tạo cổng kho ID của kho ID1 với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-15 03:44:12'),
(407, 1, 1, 1, 'Tạo cổng kho ID của kho ID1 với ID 3', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-15 04:02:55'),
(408, 1, 1, 1, 'Tạo cổng kho ID của kho ID1 với ID 4', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-15 04:08:03'),
(409, 1, 1, 1, 'Cập nhật cổng của kho có ID1 với ID cổng là2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-15 04:13:46'),
(410, 1, 1, 1, 'Cập nhật cổng của kho có ID1 với ID cổng là2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-15 04:13:53'),
(411, 1, 1, 1, 'Cập nhật cổng của kho có ID1 với ID cổng là4', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-15 04:14:04'),
(412, 1, 1, 1, 'Tạo nhập kho thành công với ID 1', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-15 09:09:14'),
(413, 1, 1, 1, 'Thêm tài sản vào nhập kho có ID 1 thành công với ID 1', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-16 03:41:16'),
(414, 1, 1, 1, 'Cập nhật tài sản kho thành công với ID 1', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-16 03:56:31'),
(415, 1, 1, 1, 'Cập nhật tài sản kho thành công với ID 1', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-16 04:01:01'),
(416, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"warehouse_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"supplier_id\":\"1\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"time_expected\":null,\"datetime\":null,\"input_type\":\"1\",\"input_doc\":\"0_1547543354test.txt\",\"order_doc\":\"1_1547543354test.txt\",\"delivery_type\":\"1\",\"delivery_info\":\"\",\"delivery_doc\":null,\"security_id\":null,\"value_status\":null,\"value_doc\":null,\"created_user\":\"1\",\"status\":\"0\",\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-01-15 16:09:14\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-16 06:42:12');
INSERT INTO `log_history` (`id`, `user_id`, `page`, `type`, `name`, `detail`, `ip`, `device`, `created_at`) VALUES
(417, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"warehouse_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"supplier_id\":\"1\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"time_expected\":null,\"datetime\":\"2019-01-16 13:42:12\",\"input_type\":\"1\",\"input_doc\":\"0_1547543354test.txt\",\"order_doc\":\"1_1547543354test.txt\",\"delivery_type\":\"1\",\"delivery_info\":\"\",\"delivery_doc\":null,\"security_id\":null,\"value_status\":null,\"value_doc\":null,\"created_user\":\"1\",\"status\":\"0\",\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-01-16 13:42:12\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-16 07:00:00'),
(418, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"warehouse_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"supplier_id\":\"1\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"time_expected\":null,\"datetime\":\"2019-01-16 14:00:00\",\"input_type\":\"1\",\"input_doc\":\"0_1547543354test.txt\",\"order_doc\":\"1_1547543354test.txt\",\"delivery_type\":\"1\",\"delivery_info\":\"\",\"delivery_doc\":null,\"security_id\":null,\"value_status\":null,\"value_doc\":null,\"created_user\":\"1\",\"status\":\"0\",\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-01-16 14:00:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-16 07:02:07'),
(419, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"warehouse_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"supplier_id\":\"1\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"time_expected\":null,\"datetime\":\"2019-01-16 14:02:07\",\"input_type\":\"1\",\"input_doc\":\"0_1547543354test.txt\",\"order_doc\":\"1_1547543354test.txt\",\"delivery_type\":\"1\",\"delivery_info\":\"\",\"delivery_doc\":null,\"security_id\":null,\"value_status\":null,\"value_doc\":null,\"created_user\":\"1\",\"status\":\"0\",\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-01-16 14:02:07\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-16 07:04:13'),
(420, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"warehouse_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"supplier_id\":\"1\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"time_expected\":null,\"datetime\":\"2019-01-16 14:04:13\",\"input_type\":\"1\",\"input_doc\":\"0_1547543354test.txt\",\"order_doc\":\"1_1547543354test.txt\",\"delivery_type\":\"1\",\"delivery_info\":\"\",\"delivery_doc\":null,\"security_id\":null,\"value_status\":null,\"value_doc\":null,\"created_user\":\"1\",\"status\":\"0\",\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-01-16 14:04:13\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-16 07:08:28'),
(421, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"warehouse_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"supplier_id\":\"1\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"time_expected\":null,\"datetime\":\"2019-01-16 14:08:28\",\"input_type\":\"1\",\"input_doc\":\"0_1547543354test.txt\",\"order_doc\":\"1_1547543354test.txt\",\"delivery_type\":\"1\",\"delivery_info\":\"\",\"delivery_doc\":null,\"security_id\":null,\"value_status\":null,\"value_doc\":null,\"created_user\":\"1\",\"status\":\"0\",\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-01-16 14:08:28\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-16 07:09:34'),
(422, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"warehouse_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"supplier_id\":\"1\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"time_expected\":null,\"datetime\":\"2019-01-16 14:09:34\",\"input_type\":\"1\",\"input_doc\":\"0_1547543354test.txt\",\"order_doc\":\"1_1547543354test.txt\",\"delivery_type\":\"1\",\"delivery_info\":\"\",\"delivery_doc\":null,\"security_id\":null,\"value_status\":null,\"value_doc\":null,\"created_user\":\"1\",\"status\":\"0\",\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-01-16 14:09:34\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-16 08:25:38'),
(423, 1, 1, 1, 'Cập nhật cổng của kho có ID1 với ID cổng là2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-17 04:10:24'),
(424, 1, 1, 1, 'Cập nhật cổng của kho có ID1 với ID cổng là2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-17 04:17:51'),
(425, 1, 1, 1, 'Cập nhật cổng của kho có ID1 với ID cổng là2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-17 04:18:58'),
(426, 1, 1, 1, 'Cập nhật cổng của kho có ID1 với ID cổng là2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-17 04:24:01'),
(427, 1, 1, 1, 'Cập nhật cổng của kho có ID1 với ID cổng là4', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-17 07:56:10'),
(428, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.118 Chrome/70.0.3538.118 Safari/537.36', '2019-01-23 01:14:36'),
(429, 1, 1, 1, 'Cập nhật cổng của kho có ID1 với ID cổng là2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 03:04:53'),
(430, 1, 1, 1, 'Cập nhật cổng của kho có ID1 với ID cổng là5', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 03:05:04'),
(431, 1, 1, 1, 'Cập nhật cổng của kho có ID1 với ID cổng là3', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 03:05:09'),
(432, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 1\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 03:45:21'),
(433, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 1\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 03:53:31'),
(434, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 1\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 03:53:45'),
(435, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 2\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 03:58:33'),
(436, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 2\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:00:28'),
(437, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 2\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:01:08'),
(438, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 2\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:01:26'),
(439, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 3\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:03:45'),
(440, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 3\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:03:54'),
(441, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 2\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:11:36'),
(442, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 2\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:11:41'),
(443, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 3\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:11:48'),
(444, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 1\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:12:44'),
(445, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 2\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:25:26'),
(446, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 3\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:26:45'),
(447, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 4\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:30:08'),
(448, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 4\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:30:24'),
(449, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 1\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:56:50'),
(450, 1, 1, 1, 'Cập nhật cổng của kho có ID1 với ID cổng là2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:57:15'),
(451, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 1\",\"dept_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-31 01:14:18'),
(452, 1, 1, 1, 'Cập nhật cổng của kho có ID1 với ID cổng là2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-31 01:14:45'),
(453, 1, 1, 2, 'Cập nhật cổng kho ID của kho ID với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-31 01:36:32'),
(454, 1, 1, 2, 'Cập nhật cổng kho ID của kho ID1 với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-31 01:45:19'),
(455, 1, 1, 2, 'Cập nhật cổng kho ID của kho ID1 với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-31 01:47:55'),
(456, 1, 1, 2, 'Cập nhật cổng kho ID của kho ID1 với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-31 01:51:40'),
(457, 1, 1, 2, 'Cập nhật cổng kho ID của kho ID1 với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-31 01:52:08'),
(458, 1, 1, 2, 'Cập nhật cổng kho ID của kho ID1 với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-31 01:54:33'),
(459, 1, 1, 2, 'Cập nhật cổng kho ID của kho ID1 với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-31 01:55:01'),
(460, 1, 1, 2, 'Cập nhật cổng kho ID của kho ID1 với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-31 01:55:30'),
(461, 1, 1, 2, 'Cập nhật cổng kho ID của kho ID1 với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-31 01:56:29'),
(462, 1, 1, 1, 'Tạo cổng kho ID của kho ID1 với ID 6', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-31 01:57:02'),
(463, 1, 1, 1, 'Tạo cổng kho ID của kho ID1 với ID 7', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-31 01:57:08'),
(464, 1, 1, 2, 'Cập nhật cổng kho ID của kho ID1 với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-31 01:57:24'),
(465, 1, 1, 2, 'Cập nhật cổng kho ID của kho ID1 với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-31 01:57:50'),
(466, 1, 1, 2, 'Cập nhật cổng kho ID của kho ID1 với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-31 02:00:44'),
(467, 1, 1, 2, 'Cập nhật cổng kho ID của kho ID1 với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-31 02:02:28'),
(468, 1, 1, 2, 'Cập nhật cổng kho ID của kho ID1 với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-31 02:02:35'),
(469, 1, 1, 2, 'Cập nhật cổng kho ID của kho ID1 với ID 2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-31 02:02:43'),
(470, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"warehouse_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"supplier_id\":\"1\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"time_expected\":null,\"datetime\":null,\"input_type\":\"1\",\"input_doc\":\"0_1547543354test.txt\",\"order_doc\":\"1_1547543354test.txt\",\"delivery_type\":\"1\",\"delivery_info\":\"H\\u1ecd & T\\u00ean: Nguyen Van A\\r\\nS\\u0110T: 012345678\\r\\nBi\\u1ec3n s\\u1ed1 xe: 72K1-12345\",\"delivery_doc\":null,\"security_id\":null,\"value_status\":null,\"value_doc\":null,\"created_user\":\"1\",\"status\":\"0\",\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-01-16 15:25:38\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-31 04:32:04'),
(471, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"warehouse_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"supplier_id\":\"1\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"time_expected\":null,\"datetime\":\"2019-01-31 11:32:04\",\"input_type\":\"1\",\"input_doc\":\"0_1547543354test.txt\",\"order_doc\":\"1_1547543354test.txt\",\"delivery_type\":\"1\",\"delivery_info\":\"H\\u1ecd & T\\u00ean: Nguyen Van A\\r\\nS\\u0110T: 012345678\\r\\nBi\\u1ec3n s\\u1ed1 xe: 72K1-12345\",\"delivery_doc\":null,\"security_id\":null,\"value_status\":null,\"value_doc\":null,\"created_user\":\"1\",\"status\":\"0\",\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-01-31 11:32:04\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-02-01 02:37:54'),
(472, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-02-25 08:14:09'),
(473, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-03-04 01:19:10'),
(474, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '2019-03-06 00:40:19'),
(475, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '2019-03-07 10:43:05'),
(476, 1, 1, 2, 'Cập nhật danh mục tài sản ID: 1', '{\"id\":\"1\",\"code\":\"SS123456\",\"name\":\"Samsung Galaxy A9 (2018)\",\"unit_price\":\"12000000\",\"class_id\":\"1\",\"species_id\":\"1\",\"made_id\":\"1\",\"producer_id\":\"3\",\"unit_id\":\"1\",\"currencies_id\":\"1\",\"specification\":\"M\\u00e0n h\\u00ecnh:\\tSuper AMOLED, 6.3\\\", Full HD+\\r\\nH\\u1ec7 \\u0111i\\u1ec1u h\\u00e0nh:\\tAndroid 8.0 (Oreo)\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2018-12-19 09:58:53\",\"updated_at\":\"0000-00-00 00:00:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '2019-03-09 01:34:47'),
(477, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-03-10 15:00:34'),
(478, 1, 1, 1, 'Thêm tài khoản ID: 45', '{\"id\":\"45\",\"name\":\"nvst\",\"username\":\"nvst\",\"password\":\"$2y$08$c3hZdlZ4SnNjTlZJTExoM.7jBuhQEhZuJ03zF.NuLvjN8jAzlKZwe\",\"mail\":\"nvst@gmail.com\",\"phone\":\"0369858545\",\"avatar\":null,\"role\":\"7\",\"dept_id\":null,\"dept_mg\":\"[]\",\"status\":\"1\",\"created_at\":\"2019-03-11 08:42:58\",\"updated_at\":\"2019-03-11 08:42:58\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-03-11 01:42:58'),
(479, 1, 1, 1, 'Thêm tài khoản ID: 46', '{\"id\":\"46\",\"name\":\"Nguyen Van Truong Phong\",\"username\":\"tp\",\"password\":\"$2y$08$U09FOTRnV3N5NWhTRGNOcuyvfKfFGxdu3pOvOaJPfJgrEX0.kH6ZW\",\"mail\":\"tp@gmail.com\",\"phone\":\"0356985456\",\"avatar\":null,\"role\":\"8\",\"dept_id\":\"25\",\"dept_mg\":\"[\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2019-03-11 08:47:38\",\"updated_at\":\"2019-03-11 08:47:38\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-03-11 01:47:38'),
(480, 45, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-03-11 01:52:45'),
(481, 45, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-03-11 02:22:42'),
(482, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-03-11 03:24:50'),
(483, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '2019-03-12 00:38:32'),
(484, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '2019-03-12 01:47:27'),
(485, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-18 06:51:19'),
(486, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-18 12:14:39'),
(487, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-19 10:33:08'),
(488, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-19 11:22:56'),
(489, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-19 11:23:23'),
(490, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-19 11:24:41'),
(491, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-19 11:30:48'),
(492, 44, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-19 11:32:16'),
(493, 44, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-19 11:38:04'),
(494, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-19 17:25:25'),
(495, 1, 1, 2, 'Cập nhật tài khoản ID: 45', '{\"id\":\"45\",\"name\":\"nvst\",\"username\":\"nvst\",\"password\":\"$2y$08$c3hZdlZ4SnNjTlZJTExoM.7jBuhQEhZuJ03zF.NuLvjN8jAzlKZwe\",\"mail\":\"nvst@gmail.com\",\"phone\":\"0369858545\",\"avatar\":null,\"role\":\"7\",\"dept_id\":\"25\",\"dept_mg\":\"[\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2019-03-11 08:42:58\",\"updated_at\":\"2019201920192019-MarMar-WedWed 00:39:13\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-19 17:39:13'),
(496, 1, 1, 2, 'Cập nhật tài khoản ID: 45', '{\"id\":\"45\",\"name\":\"nvst\",\"username\":\"nvst\",\"password\":\"$2y$08$c3hZdlZ4SnNjTlZJTExoM.7jBuhQEhZuJ03zF.NuLvjN8jAzlKZwe\",\"mail\":\"nvst@gmail.com\",\"phone\":\"0369858545\",\"avatar\":null,\"role\":\"7\",\"dept_id\":\"25\",\"dept_mg\":\"[\\\"25\\\",\\\"26\\\"]\",\"status\":\"1\",\"created_at\":\"2019-03-11 08:42:58\",\"updated_at\":\"2019201920192019-MarMar-WedWed 00:40:27\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-19 17:40:27'),
(497, 1, 1, 2, 'Cập nhật tài khoản ID: 45', '{\"id\":\"45\",\"name\":\"nvst\",\"username\":\"nvst\",\"password\":\"$2y$08$c3hZdlZ4SnNjTlZJTExoM.7jBuhQEhZuJ03zF.NuLvjN8jAzlKZwe\",\"mail\":\"nvst@gmail.com\",\"phone\":\"0369858545\",\"avatar\":null,\"role\":\"7\",\"dept_id\":\"25\",\"dept_mg\":\"[\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2019-03-11 08:42:58\",\"updated_at\":\"2019201920192019-MarMar-WedWed 00:40:31\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-19 17:40:31'),
(498, 1, 1, 2, 'Cập nhật tài khoản ID: 45', '{\"id\":\"45\",\"name\":\"nvst\",\"username\":\"nvst\",\"password\":\"$2y$08$c3hZdlZ4SnNjTlZJTExoM.7jBuhQEhZuJ03zF.NuLvjN8jAzlKZwe\",\"mail\":\"nvst@gmail.com\",\"phone\":\"0369858545\",\"avatar\":null,\"role\":\"7\",\"dept_id\":\"25\",\"dept_mg\":\"[\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2019-03-11 08:42:58\",\"updated_at\":\"2019201920192019-MarMar-WedWed 00:40:52\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-19 17:40:52'),
(499, 1, 1, 2, 'Cập nhật tài khoản ID: 45', '{\"id\":\"45\",\"name\":\"nvst\",\"username\":\"nvst\",\"password\":\"$2y$08$c3hZdlZ4SnNjTlZJTExoM.7jBuhQEhZuJ03zF.NuLvjN8jAzlKZwe\",\"mail\":\"nvst@gmail.com\",\"phone\":\"0369858545\",\"avatar\":null,\"role\":\"7\",\"dept_id\":\"25\",\"dept_mg\":\"[\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2019-03-11 08:42:58\",\"updated_at\":\"2019201920192019-MarMar-WedWed 00:41:44\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-19 17:41:44'),
(500, 1, 1, 2, 'Cập nhật tài khoản ID: 45', '{\"id\":\"45\",\"name\":\"nvst\",\"username\":\"nvst\",\"password\":\"$2y$08$c3hZdlZ4SnNjTlZJTExoM.7jBuhQEhZuJ03zF.NuLvjN8jAzlKZwe\",\"mail\":\"nvst@gmail.com\",\"phone\":\"0369858545\",\"avatar\":null,\"role\":\"7\",\"dept_id\":\"25\",\"dept_mg\":\"[\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2019-03-11 08:42:58\",\"updated_at\":\"2019201920192019-MarMar-WedWed 00:42:16\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-19 17:42:16'),
(501, 1, 1, 2, 'Đã thay đổi mật khẩu', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-19 17:53:56'),
(502, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-20 00:57:17'),
(503, 1, 1, 2, 'Cập nhật tài khoản ID: 2', '{\"id\":\"2\",\"name\":\"Nguyen Van Test 1\",\"username\":\"test1\",\"password\":\"$2y$08$a0lzVHRnaS9OVTZlenljbuNcvYJ6RjhUcCJHRnrFVfMbwf9xkUDwC\",\"mail\":\"test1@gmail.com\",\"phone\":\"0352222333\",\"avatar\":null,\"role\":\"2\",\"dept_id\":\"2\",\"dept_mg\":\"[\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 15:01:50\",\"updated_at\":\"2019201920192019-MarMar-WedWed 07:59:02\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-20 00:59:02'),
(504, 1, 1, 2, 'Đã thay đổi mật khẩu', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-20 00:59:14'),
(505, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-20 00:59:47'),
(506, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-20 01:01:09'),
(507, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-20 01:32:39'),
(508, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-20 02:45:12'),
(509, 2, 1, 2, 'Cập nhật đơn vị/ phòng ban ID: 28', '{\"id\":\"28\",\"code\":\"Q10001\",\"name\":\"B\\u1ec7nh vi\\u1ec7n Q1\",\"parent_id\":\"25\",\"level\":4,\"status\":\"1\",\"created_at\":\"2019-03-20 09:42:36\",\"updated_at\":\"2019-03-20 09:42:36\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-20 02:52:37'),
(510, 2, 1, 2, 'Cập nhật đơn vị/ phòng ban ID: 25', '{\"id\":\"25\",\"code\":\"HCM001\",\"name\":\"Qu\\u1eadn 1\",\"parent_id\":\"25\",\"level\":4,\"status\":\"1\",\"created_at\":\"2019-03-19 08:41:18\",\"updated_at\":\"2019-03-19 08:41:18\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-20 02:55:32'),
(511, 2, 1, 2, 'Cập nhật đơn vị/ phòng ban ID: 25', '{\"id\":\"25\",\"code\":\"HCM001\",\"name\":\"Qu\\u1eadn 1\",\"parent_id\":\"11\",\"level\":3,\"status\":\"1\",\"created_at\":\"2019-03-19 08:41:18\",\"updated_at\":\"2019-03-19 08:41:18\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-20 04:01:01'),
(512, 2, 1, 2, 'Cập nhật đơn vị/ phòng ban ID: 25', '{\"id\":\"25\",\"code\":\"HCM00001\",\"name\":\"Qu\\u1eadn 1\",\"parent_id\":\"11\",\"level\":3,\"status\":\"1\",\"created_at\":\"2019-03-19 08:41:18\",\"updated_at\":\"2019-03-19 08:41:18\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-20 04:01:24'),
(513, 2, 1, 2, 'Cập nhật đơn vị/ phòng ban ID: 25', '{\"id\":\"25\",\"code\":\"HCM00001\",\"name\":\"Qu\\u1eadn 1\",\"parent_id\":\"11\",\"level\":3,\"status\":\"1\",\"created_at\":\"2019-03-19 08:41:18\",\"updated_at\":\"2019-03-19 08:41:18\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-20 04:07:41'),
(514, 2, 1, 1, 'Thêm đơn vị/ khu vực ID: 29', '{\"id\":\"29\",\"code\":\"Q100002\",\"name\":\"Nha Hat Q1\",\"parent_id\":\"25\",\"level\":4,\"status\":\"1\",\"created_at\":null,\"updated_at\":null}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-20 04:27:38'),
(515, 2, 1, 1, 'Thêm đơn vị/ khu vực ID: 32', '{\"id\":\"32\",\"code\":\"Q100001\",\"name\":\"KTX Q1\",\"parent_id\":\"11\",\"level\":4,\"status\":\"1\",\"created_at\":null,\"updated_at\":null}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-20 04:49:04'),
(516, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-20 04:51:16'),
(517, 2, 1, 1, 'Thêm đơn vị/ khu vực ID: 33', '{\"id\":\"33\",\"code\":\"Q100003\",\"name\":\"Nh\\u00e0 H\\u00e0ng Q1\",\"parent_id\":\"11\",\"level\":4,\"status\":\"1\",\"created_at\":null,\"updated_at\":null}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-20 04:53:01'),
(518, 2, 1, 2, 'Cập nhật đơn vị/ phòng ban ID: 33', '{\"id\":\"33\",\"code\":\"Q100003\",\"name\":\"Nh\\u00e0 H\\u00e0ng Q1\",\"parent_id\":\"25\",\"level\":4,\"status\":\"1\",\"created_at\":\"2019-03-20 11:53:01\",\"updated_at\":\"2019-03-20 11:53:01\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-20 04:58:17'),
(519, 2, 1, 2, 'Cập nhật đơn vị/ phòng ban ID: 25', '{\"id\":\"25\",\"code\":\"HCM00001\",\"name\":\"Qu\\u1eadn 1\",\"parent_id\":\"11\",\"level\":3,\"status\":\"1\",\"created_at\":\"2019-03-19 08:41:18\",\"updated_at\":\"2019-03-19 08:41:18\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-20 04:58:24'),
(520, 2, 1, 2, 'Cập nhật tài khoản ID: 45', '{\"id\":\"45\",\"name\":\"nvst\",\"username\":\"nvst\",\"password\":\"$2y$08$c3hZdlZ4SnNjTlZJTExoM.7jBuhQEhZuJ03zF.NuLvjN8jAzlKZwe\",\"mail\":\"nvst@gmail.com\",\"phone\":\"0369858545\",\"avatar\":null,\"role\":\"7\",\"dept_id\":\"25\",\"dept_mg\":\"[\\\"25\\\",\\\"28\\\",\\\"29\\\",\\\"32\\\",\\\"33\\\",\\\"34\\\"]\",\"status\":\"1\",\"created_at\":\"2019-03-11 08:42:58\",\"updated_at\":\"2019201920192019-MarMar-WedWed 13:47:54\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-20 06:47:54'),
(521, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-20 17:23:05'),
(522, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '2019-03-21 01:55:41'),
(523, 44, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-03-21 10:53:00'),
(524, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-03-22 06:01:00'),
(525, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-03-23 02:15:16'),
(526, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '14.161.12.83', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-03-27 08:20:21'),
(527, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-03-27 09:31:37'),
(528, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '113.161.38.98', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-03-28 10:12:14'),
(529, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-03-28 10:45:19'),
(530, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-03-28 10:55:14'),
(531, 44, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-03-28 10:55:33'),
(532, 44, 1, 4, 'Tài khoản đã đăng nhập', NULL, '125.234.104.146', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-03-29 01:03:38'),
(533, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '125.234.104.146', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-03-29 01:07:46'),
(534, 44, 1, 4, 'Tài khoản đã đăng nhập', NULL, '125.234.104.146', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-03-29 01:21:24'),
(535, 44, 1, 4, 'Tài khoản đã đăng nhập', NULL, '125.234.104.146', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-03-29 01:30:59'),
(536, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '203.210.208.74', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-03-29 02:40:04'),
(537, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '14.161.9.34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-03-31 03:07:18'),
(538, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-03-31 23:58:00'),
(539, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '14.186.182.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', '2019-04-01 04:20:22'),
(540, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '192.168.200.5', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-01 06:19:12'),
(541, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 14:37:54'),
(542, 44, 1, 4, 'Tài khoản đã đăng nhập', NULL, '113.162.165.254', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 14:57:47'),
(543, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '113.162.165.254', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 14:59:38'),
(544, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '113.162.165.254', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 15:00:10'),
(545, 1, 1, 2, 'Cập nhật đơn vị/ phòng ban ID: 35', '{\"id\":\"35\",\"code\":\"CT0001\",\"name\":\"ABC Group\",\"parent_id\":0,\"level\":0,\"status\":\"1\",\"created_at\":\"2019-04-02 22:17:00\",\"updated_at\":\"2019-04-02 22:17:00\"}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 15:17:27'),
(546, 1, 1, 2, 'Cập nhật đơn vị/ phòng ban ID: 36', '{\"id\":\"36\",\"code\":\"CT0002\",\"name\":\"C\\u00f4ng ty con 1 - ABC Group\",\"parent_id\":\"35\",\"level\":1,\"status\":\"1\",\"created_at\":\"2019-04-02 22:17:59\",\"updated_at\":\"2019-04-02 22:17:59\"}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 15:19:12'),
(547, 1, 1, 2, 'Cập nhật đơn vị/ phòng ban ID: 36', '{\"id\":\"36\",\"code\":\"CCT0002\",\"name\":\"C\\u00f4ng ty con 1 - ABC Group\",\"parent_id\":\"35\",\"level\":1,\"status\":\"1\",\"created_at\":\"2019-04-02 22:17:59\",\"updated_at\":\"2019-04-02 22:17:59\"}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 15:20:01'),
(548, 1, 1, 2, 'Cập nhật đơn vị/ phòng ban ID: 36', '{\"id\":\"36\",\"code\":\"CCT0001\",\"name\":\"C\\u00f4ng ty con 1 - ABC Group\",\"parent_id\":\"35\",\"level\":1,\"status\":\"1\",\"created_at\":\"2019-04-02 22:17:59\",\"updated_at\":\"2019-04-02 22:17:59\"}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 15:20:40'),
(549, 1, 1, 2, 'Cập nhật đơn vị/ phòng ban ID: 37', '{\"id\":\"37\",\"code\":\"CCT0002\",\"name\":\"C\\u00f4ng ty con 2 - ABC Group\",\"parent_id\":\"35\",\"level\":1,\"status\":\"1\",\"created_at\":\"2019-04-02 22:19:54\",\"updated_at\":\"2019-04-02 22:19:54\"}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 15:20:45'),
(550, 1, 1, 2, 'Cập nhật đơn vị/ phòng ban ID: 38', '{\"id\":\"38\",\"code\":\"CCT0003\",\"name\":\"C\\u00f4ng ty con 3 - ABC Group\",\"parent_id\":\"35\",\"level\":1,\"status\":\"1\",\"created_at\":\"2019-04-02 22:20:33\",\"updated_at\":\"2019-04-02 22:20:33\"}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 15:20:52'),
(551, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 15:49:04'),
(552, 1, 1, 2, 'Cập nhật vị trí ID: 1', '{\"id\":\"1\",\"cat_id\":\"1\",\"name\":\"Gi\\u00e1m \\u0111\\u1ed1c\",\"status\":\"1\",\"note\":\"\",\"created_at\":\"2019-03-21 08:44:03\",\"updated_at\":\"2019-03-21 08:44:03\"}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 15:49:11'),
(553, 1, 1, 1, 'Thêm mới danh mục ID: 3', '{\"id\":\"3\",\"cat_id\":\"1\",\"name\":\"K\\u1ebf to\\u00e1n tr\\u01b0\\u1edfng\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 22:46:11'),
(554, 1, 1, 1, 'Thêm mới danh mục ID: 4', '{\"id\":\"4\",\"cat_id\":\"1\",\"name\":\"Nh\\u00e2n vi\\u00ean kinh doanh\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 22:47:16'),
(555, 1, 1, 1, 'Thêm mới danh mục ID: 5', '{\"id\":\"5\",\"cat_id\":\"1\",\"name\":\"Tr\\u01b0\\u1edfng Ph\\u00f2ng K\\u1ef9 Thu\\u1eadt\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 22:48:23');
INSERT INTO `log_history` (`id`, `user_id`, `page`, `type`, `name`, `detail`, `ip`, `device`, `created_at`) VALUES
(556, 1, 1, 1, 'Thêm mới danh mục ID: 2', '{\"id\":\"2\",\"cat_id\":\"2\",\"name\":\"B\\u1ed9 ph\\u1eadn k\\u1ebf to\\u00e1n\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 22:49:03'),
(557, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '27.3.33.105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 22:50:01'),
(558, 1, 1, 2, 'Cập nhật vị trí ID: 1', '{\"id\":\"1\",\"cat_id\":\"2\",\"name\":\"B\\u1ed9 ph\\u1eadn K\\u1ef9 thu\\u1eadt\",\"status\":\"1\",\"note\":\"\",\"created_at\":\"2019-03-21 08:42:51\",\"updated_at\":\"2019-03-21 08:42:51\"}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 22:50:42'),
(559, 1, 1, 2, 'Cập nhật vị trí ID: 3', '{\"id\":\"3\",\"cat_id\":\"1\",\"name\":\"K\\u1ebf To\\u00e1n Tr\\u01b0\\u1edfng\",\"status\":\"1\",\"note\":\"\",\"created_at\":\"2019-04-03 05:46:11\",\"updated_at\":\"2019-04-03 05:46:11\"}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 22:55:35'),
(560, 1, 1, 2, 'Cập nhật vị trí ID: 1', '{\"id\":\"1\",\"cat_id\":\"1\",\"name\":\"Gi\\u00e1m \\u0110\\u1ed1c\",\"status\":\"1\",\"note\":\"\",\"created_at\":\"2019-03-21 08:44:03\",\"updated_at\":\"2019-03-21 08:44:03\"}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 22:55:49'),
(561, 1, 1, 2, 'Cập nhật vị trí ID: 4', '{\"id\":\"4\",\"cat_id\":\"1\",\"name\":\"Nh\\u00e2n Vi\\u00ean Kinh Doanh\",\"status\":\"1\",\"note\":\"\",\"created_at\":\"2019-04-03 05:47:16\",\"updated_at\":\"2019-04-03 05:47:16\"}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 22:56:05'),
(562, 1, 1, 1, 'Thêm mới danh mục ID: 3', '{\"id\":\"3\",\"cat_id\":\"2\",\"name\":\"B\\u1ed9 ph\\u1eadn Marketing\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 22:57:10'),
(563, 1, 1, 1, 'Thêm mới danh mục ID: 4', '{\"id\":\"4\",\"cat_id\":\"2\",\"name\":\"B\\u1ed9 ph\\u1eadn ph\\u1ee5c v\\u1ee5\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 22:57:31'),
(564, 1, 1, 1, 'Thêm mới danh mục ID: 5', '{\"id\":\"5\",\"cat_id\":\"2\",\"name\":\"B\\u1ed9 ph\\u1eadn v\\u1eadn chuy\\u1ec3n\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 22:57:42'),
(565, 1, 1, 1, 'Thêm mới danh mục ID: 2', '{\"id\":\"2\",\"cat_id\":\"4\",\"name\":\"$\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 22:58:05'),
(566, 1, 1, 1, 'Thêm mới danh mục ID: 2', '{\"id\":\"2\",\"cat_id\":\"5\",\"name\":\"Trung Qu\\u1ed1c\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 22:58:24'),
(567, 1, 1, 1, 'Thêm mới danh mục ID: 3', '{\"id\":\"3\",\"cat_id\":\"5\",\"name\":\"Vi\\u1ec7t Nam\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 22:58:32'),
(568, 1, 1, 1, 'Thêm mới danh mục ID: 4', '{\"id\":\"4\",\"cat_id\":\"5\",\"name\":\"M\\u1ef9\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 22:58:41'),
(569, 1, 1, 1, 'Thêm mới danh mục ID: 2', '{\"id\":\"2\",\"cat_id\":\"7\",\"name\":\"H\\u00e0ng xu\\u1ea5t kh\\u1ea9u\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 22:59:56'),
(570, 1, 1, 2, 'Cập nhật vị trí ID: 1', '{\"id\":\"1\",\"cat_id\":\"11\",\"class_id\":\"1\",\"name\":\"Ch\\u1ee7ng lo\\u1ea1i 1\",\"info\":\"Ch\\u1ee7ng lo\\u1ea1i 1\",\"status\":\"1\",\"note\":null,\"created_at\":\"2019-03-21 08:45:19\",\"updated_at\":\"2019-03-21 08:45:19\"}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:00:44'),
(571, 1, 1, 1, 'Thêm mới danh mục ID: 2', '{\"id\":\"2\",\"cat_id\":\"11\",\"class_id\":\"1\",\"name\":\"Ch\\u1ee7ng lo\\u1ea1i 2\",\"info\":\"\",\"status\":\"1\",\"note\":null,\"created_at\":null,\"updated_at\":null}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:01:05'),
(572, 1, 1, 1, 'Thêm mới danh mục ID: 3', '{\"id\":\"3\",\"cat_id\":\"11\",\"class_id\":\"1\",\"name\":\"Ch\\u1ee7ng lo\\u1ea1i 3\",\"info\":\"\",\"status\":\"1\",\"note\":null,\"created_at\":null,\"updated_at\":null}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:01:34'),
(573, 1, 1, 1, 'Thêm mới danh mục ID: 4', '{\"id\":\"4\",\"cat_id\":\"11\",\"class_id\":\"2\",\"name\":\"Ch\\u1ee7ng lo\\u1ea1i 3\",\"info\":\"\",\"status\":\"1\",\"note\":null,\"created_at\":null,\"updated_at\":null}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:01:52'),
(574, 1, 1, 1, 'Thêm mới danh mục ID: 5', '{\"id\":\"5\",\"cat_id\":\"11\",\"class_id\":\"2\",\"name\":\"Ch\\u1ee7ng lo\\u1ea1i 4\",\"info\":\"\",\"status\":\"1\",\"note\":null,\"created_at\":null,\"updated_at\":null}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:02:05'),
(575, 1, 1, 1, 'Thêm mới danh mục ID: 2', '{\"id\":\"2\",\"cat_id\":\"8\",\"name\":\"Chi\\u1ebfc\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:02:36'),
(576, 1, 1, 1, 'Thêm mới danh mục ID: 3', '{\"id\":\"3\",\"cat_id\":\"8\",\"name\":\"M\\u1ea3nh\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:03:09'),
(577, 1, 1, 1, 'Thêm mới danh mục ID: 4', '{\"id\":\"4\",\"cat_id\":\"8\",\"name\":\"Kg\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:03:41'),
(578, 1, 1, 2, 'Cập nhật vị trí ID: 1', '{\"id\":\"1\",\"cat_id\":\"10\",\"name\":\"Assus\",\"status\":\"1\",\"note\":\"\",\"created_at\":\"2019-03-21 08:44:46\",\"updated_at\":\"2019-03-21 08:44:46\"}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:03:56'),
(579, 1, 1, 1, 'Thêm mới danh mục ID: 5', '{\"id\":\"5\",\"cat_id\":\"10\",\"name\":\"Toyota\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:04:12'),
(580, 1, 1, 2, 'Cập nhật vị trí ID: 1', '{\"id\":\"1\",\"cat_id\":\"9\",\"name\":\"C\\u00f4ng ty 1\",\"address\":\"135B, Tr\\u1ea7n H\\u01b0ng \\u0110\\u1ea1o, P. B\\u1ebfn Ngh\\u00e9, Qu\\u1eadn 1\",\"phone\":\"03265489956\",\"email\":\"cy1@gmail.com\",\"website\":\"https:\\/\\/congty1.com\",\"mstdn\":\"21354645632123\",\"career\":\"Cung c\\u1ea5p linh ki\\u1ec7n\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-21 08:46:15\",\"updated_at\":\"2019-03-21 08:46:15\"}', '42.113.166.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:04:59'),
(581, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:19:46'),
(582, 1, 1, 2, 'Cập nhật vị trí ID: 2', '{\"id\":\"2\",\"cat_id\":\"4\",\"name\":\"USD\",\"status\":\"1\",\"note\":\"\",\"created_at\":\"2019-04-03 05:58:05\",\"updated_at\":\"2019-04-03 05:58:05\"}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:22:49'),
(583, 1, 1, 1, 'Thêm mới danh mục ID: 5', '{\"id\":\"5\",\"cat_id\":\"5\",\"name\":\"Nh\\u1eadt B\\u1ea3n\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:23:12'),
(584, 1, 1, 1, 'Thêm mới danh mục ID: 3', '{\"id\":\"3\",\"cat_id\":\"7\",\"name\":\"C\\u00f4ng c\\u1ee5, d\\u1ee5ng c\\u1ee5\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:24:09'),
(585, 1, 1, 1, 'Thêm mới danh mục ID: 4', '{\"id\":\"4\",\"cat_id\":\"7\",\"name\":\"T\\u00e0i s\\u1ea3n kh\\u00e1c\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:24:20'),
(586, 1, 1, 2, 'Cập nhật vị trí ID: 1', '{\"id\":\"1\",\"cat_id\":\"7\",\"name\":\"H\\u00e0ng nh\\u1eadp kh\\u1ea9u\",\"status\":\"0\",\"note\":\"\",\"created_at\":\"2019-03-21 08:37:43\",\"updated_at\":\"2019-03-21 08:37:43\"}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:24:29'),
(587, 1, 1, 1, 'Thêm mới danh mục ID: 5', '{\"id\":\"5\",\"cat_id\":\"7\",\"name\":\"T\\u00e0i s\\u1ea3n c\\u1ed1 \\u0111\\u1ecbnh\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:25:03'),
(588, 1, 1, 2, 'Cập nhật vị trí ID: 2', '{\"id\":\"2\",\"cat_id\":\"7\",\"name\":\"H\\u00e0ng xu\\u1ea5t kh\\u1ea9u\",\"status\":\"0\",\"note\":\"\",\"created_at\":\"2019-04-03 05:59:56\",\"updated_at\":\"2019-04-03 05:59:56\"}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:25:22'),
(589, 1, 1, 2, 'Cập nhật vị trí ID: 1', '{\"id\":\"1\",\"cat_id\":\"11\",\"class_id\":\"5\",\"name\":\"\\u00d4 t\\u00f4 4 ch\\u1ed7\",\"info\":\"Ch\\u1ee7ng lo\\u1ea1i 1\",\"status\":\"1\",\"note\":null,\"created_at\":\"2019-03-21 08:45:19\",\"updated_at\":\"2019-03-21 08:45:19\"}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:29:50'),
(590, 1, 1, 2, 'Cập nhật vị trí ID: 5', '{\"id\":\"5\",\"cat_id\":\"11\",\"class_id\":\"5\",\"name\":\"\\u00d4 t\\u00f4 7 ch\\u1ed7\",\"info\":\"\",\"status\":\"1\",\"note\":null,\"created_at\":\"2019-04-03 06:02:05\",\"updated_at\":\"2019-04-03 06:02:05\"}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:30:10'),
(591, 1, 1, 2, 'Cập nhật vị trí ID: 4', '{\"id\":\"4\",\"cat_id\":\"11\",\"class_id\":\"3\",\"name\":\"\\u0110i\\u1ec7n tho\\u1ea1i\",\"info\":\"\",\"status\":\"1\",\"note\":null,\"created_at\":\"2019-04-03 06:01:52\",\"updated_at\":\"2019-04-03 06:01:52\"}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:30:38'),
(592, 1, 1, 2, 'Cập nhật vị trí ID: 3', '{\"id\":\"3\",\"cat_id\":\"11\",\"class_id\":\"3\",\"name\":\"B\\u00e0n l\\u00e0m vi\\u1ec7c\",\"info\":\"\",\"status\":\"1\",\"note\":null,\"created_at\":\"2019-04-03 06:01:34\",\"updated_at\":\"2019-04-03 06:01:34\"}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:32:12'),
(593, 1, 1, 2, 'Cập nhật vị trí ID: 2', '{\"id\":\"2\",\"cat_id\":\"11\",\"class_id\":\"3\",\"name\":\"Gh\\u1ebf ng\\u1ed3i\",\"info\":\"\",\"status\":\"1\",\"note\":null,\"created_at\":\"2019-04-03 06:01:05\",\"updated_at\":\"2019-04-03 06:01:05\"}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:32:28'),
(594, 1, 1, 1, 'Thêm mới danh mục ID: 6', '{\"id\":\"6\",\"cat_id\":\"10\",\"name\":\"H\\u00f2a Ph\\u00e1t\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:33:06'),
(595, 1, 1, 2, 'Cập nhật vị trí ID: 1', '{\"id\":\"1\",\"cat_id\":\"9\",\"name\":\"Nh\\u00e0 cung c\\u1ea5p 1\",\"address\":\"135B, Tr\\u1ea7n H\\u01b0ng \\u0110\\u1ea1o, P. B\\u1ebfn Ngh\\u00e9, Qu\\u1eadn 1\",\"phone\":\"03265489956\",\"email\":\"cy1@gmail.com\",\"website\":\"https:\\/\\/congty1.com\",\"mstdn\":\"21354645632123\",\"career\":\"Cung c\\u1ea5p linh ki\\u1ec7n\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-21 08:46:15\",\"updated_at\":\"2019-03-21 08:46:15\"}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:33:57'),
(596, 1, 1, 2, 'Cập nhật vị trí ID: 2', '{\"id\":\"2\",\"cat_id\":\"9\",\"name\":\"Nh\\u00e0 cung c\\u1ea5p 2\",\"address\":\"115, Tr\\u1ea7n H\\u01b0ng \\u0110\\u1ea1o, Ph\\u01b0\\u1eddng C\\u1ea7u \\u00d4ng L\\u00e3nh, Qu\\u1eadn 1\",\"phone\":\"036544846564\",\"email\":\"congty2@congty2.vn\",\"website\":\"https:\\/\\/congty2.vn\",\"mstdn\":\"5465456465465\",\"career\":\"Cung c\\u1ea5p thi\\u1ebft b\\u1ecb n\\u1ed9i th\\u1ea5t\",\"note\":null,\"status\":\"1\",\"created_at\":\"2019-03-21 08:46:15\",\"updated_at\":\"2019-03-21 08:46:15\"}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:34:30'),
(597, 1, 1, 2, 'Cập nhật vị trí ID: 1', '{\"id\":\"1\",\"cat_id\":\"9\",\"name\":\"Nh\\u00e0 cung c\\u1ea5p 1\",\"address\":\"135B, Tr\\u1ea7n H\\u01b0ng \\u0110\\u1ea1o, P. B\\u1ebfn Ngh\\u00e9, Qu\\u1eadn 1\",\"phone\":\"03265489956\",\"email\":\"cy1@gmail.com\",\"website\":\"https:\\/\\/congty1.com\",\"mstdn\":\"21354645632123\",\"career\":\"Bu\\u00f4n b\\u00e1n \\u00f4 t\\u00f4\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-21 08:46:15\",\"updated_at\":\"2019-03-21 08:46:15\"}', '42.113.162.87', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-02 23:34:59'),
(598, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-03 00:32:55'),
(599, 1, 1, 2, 'Cập nhật vị trí ID: 1', '{\"id\":\"1\",\"cat_id\":\"11\",\"class_id\":\"5\",\"name\":\"\\u00d4 t\\u00f4 4 ch\\u1ed7\",\"info\":\"\",\"status\":\"1\",\"note\":null,\"created_at\":\"2019-03-21 08:45:19\",\"updated_at\":\"2019-03-21 08:45:19\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-03 00:39:52'),
(600, 1, 1, 1, 'Thêm mới danh mục ID: 6', '{\"id\":\"6\",\"cat_id\":\"11\",\"class_id\":\"5\",\"name\":\"\\u00d4 t\\u00f4 24 ch\\u1ed7\",\"info\":\"\",\"status\":\"1\",\"note\":null,\"created_at\":null,\"updated_at\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-03 01:16:09'),
(601, 1, 1, 1, 'Thêm mới danh mục ID: 7', '{\"id\":\"7\",\"cat_id\":\"10\",\"name\":\"Hyundai\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-03 01:16:34'),
(602, 1, 1, 1, 'Thêm mới danh mục ID: 6', '{\"id\":\"6\",\"cat_id\":\"5\",\"name\":\"Nga\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-03 01:16:48'),
(603, 1, 1, 2, 'Cập nhật vị trí ID: 6', '{\"id\":\"6\",\"cat_id\":\"11\",\"class_id\":\"5\",\"name\":\"\\u00d4 t\\u00f4 29 ch\\u1ed7\",\"info\":\"\",\"status\":\"1\",\"note\":null,\"created_at\":\"2019-04-03 08:16:09\",\"updated_at\":\"2019-04-03 08:16:09\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-03 01:18:14'),
(604, 1, 1, 1, 'Thêm mới danh mục ID: 8', '{\"id\":\"8\",\"cat_id\":\"10\",\"name\":\"Samco\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-03 01:18:35'),
(605, 1, 1, 1, 'Thêm mới danh mục ID: 9', '{\"id\":\"9\",\"cat_id\":\"10\",\"name\":\"SAMSUNG\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-03 01:25:29'),
(606, 1, 1, 1, 'Thêm mới danh mục ID: 10', '{\"id\":\"10\",\"cat_id\":\"10\",\"name\":\"Apple\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-03 01:25:55'),
(607, 1, 1, 1, 'Thêm mới danh mục ID: 5', '{\"id\":\"5\",\"cat_id\":\"8\",\"name\":\"C\\u00e1i\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-03 01:30:48'),
(608, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.3 Safari/605.1.15', '2019-04-03 02:17:48'),
(609, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2019-04-03 02:20:35'),
(610, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/78.0.136 Chrome/72.0.3626.136 Safari/537.36', '2019-04-16 14:37:06'),
(611, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/78.0.136 Chrome/72.0.3626.136 Safari/537.36', '2019-04-16 14:40:33'),
(612, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"5\",\"name\":\"L\\u00e0o\",\"short_name\":\"LAO\",\"path\":\"\\/language_file\\/lao\",\"icon\":\"laos.png\",\"status\":\"1\",\"actived\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/78.0.136 Chrome/72.0.3626.136 Safari/537.36', '2019-04-16 14:45:08'),
(613, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-07 02:29:56'),
(614, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-07 14:47:28'),
(615, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-07 15:40:48'),
(616, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho S\\u1ed1 1\",\"dept_id\":\"2\",\"user_id\":\"1\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-05-07 23:24:22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-07 16:24:22'),
(617, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho S\\u1ed1 1\",\"dept_id\":\"25\",\"user_id\":\"2\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-05-07 23:24:22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-07 16:35:27'),
(618, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho S\\u1ed1 1\",\"dept_id\":\"25\",\"user_id\":\"2\",\"address\":\"\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-05-07 23:24:22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-07 16:48:19'),
(619, 1, 1, 2, 'Cập nhật vị trí ID: 3', '{\"id\":\"3\",\"cat_id\":\"7\",\"name\":\"WIFI\",\"status\":\"1\",\"note\":\"\",\"created_at\":\"2019-04-03 06:24:09\",\"updated_at\":\"2019-04-03 06:24:09\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 02:16:26'),
(620, 1, 1, 2, 'Cập nhật vị trí ID: 5', '{\"id\":\"5\",\"cat_id\":\"7\",\"name\":\"IOT\",\"status\":\"1\",\"note\":\"\",\"created_at\":\"2019-04-03 06:25:03\",\"updated_at\":\"2019-04-03 06:25:03\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 02:16:44'),
(621, 1, 1, 2, 'Cập nhật vị trí ID: 4', '{\"id\":\"4\",\"cat_id\":\"7\",\"name\":\"T\\u00e0i s\\u1ea3n c\\u1ed1 \\u0111\\u1ecbnh\",\"status\":\"1\",\"note\":\"\",\"created_at\":\"2019-04-03 06:24:20\",\"updated_at\":\"2019-04-03 06:24:20\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 02:19:13'),
(622, 1, 1, 2, 'Cập nhật vị trí ID: 3', '{\"id\":\"3\",\"cat_id\":\"11\",\"class_id\":\"3\",\"name\":\"Assespoint\",\"info\":\"\",\"status\":\"1\",\"note\":null,\"created_at\":\"2019-04-03 06:01:34\",\"updated_at\":\"2019-04-03 06:01:34\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 02:21:58'),
(623, 1, 1, 2, 'Cập nhật vị trí ID: 4', '{\"id\":\"4\",\"cat_id\":\"11\",\"class_id\":\"3\",\"name\":\"Switch\",\"info\":\"\",\"status\":\"1\",\"note\":null,\"created_at\":\"2019-04-03 06:01:52\",\"updated_at\":\"2019-04-03 06:01:52\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 02:22:26'),
(624, 1, 1, 2, 'Cập nhật vị trí ID: 2', '{\"id\":\"2\",\"cat_id\":\"11\",\"class_id\":\"3\",\"name\":\"Router\",\"info\":\"\",\"status\":\"1\",\"note\":null,\"created_at\":\"2019-04-03 06:01:05\",\"updated_at\":\"2019-04-03 06:01:05\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 02:22:48'),
(625, 1, 1, 2, 'Cập nhật vị trí ID: 1', '{\"id\":\"1\",\"cat_id\":\"11\",\"class_id\":\"3\",\"name\":\"Assespoint\",\"info\":\"\",\"status\":\"1\",\"note\":null,\"created_at\":\"2019-03-21 08:45:19\",\"updated_at\":\"2019-03-21 08:45:19\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 02:27:44'),
(626, 1, 1, 2, 'Cập nhật vị trí ID: 1', '{\"id\":\"1\",\"cat_id\":\"1\",\"name\":\"Gi\\u00e1m \\u0110\\u1ed1c\",\"status\":\"1\",\"note\":\"\",\"created_at\":\"2019-03-21 08:44:03\",\"updated_at\":\"2019-03-21 08:44:03\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 04:26:08'),
(627, 1, 1, 2, 'Cập nhật vị trí ID: 1', '{\"id\":\"1\",\"cat_id\":\"1\",\"name\":\"Gi\\u00e1m \\u0110\\u1ed1c A\",\"status\":\"1\",\"note\":\"\",\"created_at\":\"2019-03-21 08:44:03\",\"updated_at\":\"2019-03-21 08:44:03\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 04:26:42'),
(628, 1, 1, 2, 'Cập nhật vị trí ID: 1', '{\"id\":\"1\",\"cat_id\":\"1\",\"name\":\"Gi\\u00e1m \\u0110\\u1ed1c A\",\"status\":\"1\",\"note\":\"\",\"created_at\":\"2019-03-21 08:44:03\",\"updated_at\":\"2019-03-21 08:44:03\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 04:27:34'),
(629, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 07:09:06'),
(630, 1, 1, 2, 'Cập nhật tài khoản có ID: 2', '{\"id\":\"2\",\"name\":\"Qu\\u1ea3n Tr\\u1ecb Vi\\u00ean\",\"username\":\"quan_tri_vien\",\"password\":\"$2y$08$bDZLMnBraXhSY3N5UXVmeO0ZWelRan8PvN0MjimG8yIAODirOqPgK\",\"email\":\"test1@gmail.com\",\"phone\":\"0352222333\",\"avatar\":null,\"role\":\"2\",\"dept_id\":\"25\",\"dept_mg\":\"[\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 15:01:50\",\"updated_at\":\"2019-05-09 14:25:22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 07:25:22'),
(631, 1, 1, 2, 'Cập nhật tài khoản có ID: 2', '{\"id\":\"2\",\"name\":\"Qu\\u1ea3n Tr\\u1ecb Vi\\u00ean\",\"username\":\"quan_tri_vien\",\"password\":\"$2y$08$bDZLMnBraXhSY3N5UXVmeO0ZWelRan8PvN0MjimG8yIAODirOqPgK\",\"email\":\"test1@gmail.com\",\"phone\":\"0352222333\",\"avatar\":null,\"role\":\"2\",\"dept_id\":\"25\",\"dept_mg\":\"[\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 15:01:50\",\"updated_at\":\"2019-05-09 14:25:53\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 07:25:53'),
(632, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 07:27:16'),
(633, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 07:27:31'),
(634, 1, 1, 2, 'Cập nhật tài khoản có ID: 2', '{\"id\":\"2\",\"name\":\"Qu\\u1ea3n Tr\\u1ecb Vi\\u00ean\",\"username\":\"quan_tri_vien\",\"password\":\"$2y$08$cXRmK2VuMEdnTng1djdNUuenzqcmeseBNXJU8mFV\\/9wZXILFsd2eK\",\"email\":\"test1@gmail.com\",\"phone\":\"0352222333\",\"avatar\":null,\"role\":\"2\",\"dept_id\":\"25\",\"dept_mg\":\"[\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 15:01:50\",\"updated_at\":\"2019-05-09 14:27:44\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 07:27:44'),
(635, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 07:27:55'),
(636, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 07:28:03'),
(637, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 07:36:37'),
(638, 1, 1, 1, 'Thêm mới tài khoản có ID: 4', '{\"id\":\"4\",\"name\":\"Nguyen Duy\",\"username\":\"nguyen_duy\",\"password\":\"$2y$08$NTFZb1QvMUd3ejkwZTU1M.hw9YDphC9WTZ047bL7vCcQMPihWUJ.a\",\"email\":\"nguyenduy701@gmail.com\",\"phone\":\"0988291649\",\"avatar\":null,\"role\":\"2\",\"dept_id\":\"35\",\"dept_mg\":\"[\\\"35\\\",\\\"25\\\",\\\"36\\\",\\\"37\\\",\\\"38\\\"]\",\"status\":\"1\",\"created_at\":\"2019-05-09 14:45:39\",\"updated_at\":\"2019-05-09 14:45:39\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 07:45:39'),
(639, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 07:51:21'),
(640, 1, 1, 2, 'Cập nhật tài khoản có ID: 3', '{\"id\":\"3\",\"name\":\"Nh\\u00e2n Vi\\u00ean\",\"username\":\"nhan_vien\",\"password\":\"$2y$08$eDk0bE9DZnRHQ0lmZkIwVeMn29Kw9s7Y89lzsz3hX23uFZ\\/KINmgS\",\"email\":\"test2@gmail.com\",\"phone\":\"0356666666\",\"avatar\":\"\",\"role\":\"3\",\"dept_id\":\"25\",\"dept_mg\":\"[\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 16:39:20\",\"updated_at\":\"2019-05-09 14:51:42\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 07:51:42'),
(641, 1, 1, 2, 'Đã thay đổi mật khẩu', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 08:01:25'),
(642, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 08:03:27'),
(643, 1, 1, 2, 'Đã thay đổi mật khẩu', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 08:03:46'),
(644, 1, 1, 2, 'Đã thay đổi mật khẩu', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 08:04:06'),
(645, 1, 1, 2, 'Đã thay đổi mật khẩu', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 08:06:04'),
(646, 4, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 08:06:34'),
(647, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 08:06:44'),
(648, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"2\",\"name\":\"ENGLISH\",\"short_name\":\"ENG\",\"path\":\"\\/language_file\\/eng\",\"icon\":\"united-states.png\",\"status\":\"1\",\"actived\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 09:14:37'),
(649, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 09:15:11'),
(650, 1, 1, 1, 'Thêm mới khách hàng ID: 1', '{\"id\":\"1\",\"code\":\"A\",\"name\":\"B\",\"type\":\"1\",\"address\":\"C\",\"phone\":\"E\",\"email\":\"d@gmail.com\",\"note\":\"F\",\"status\":\"1\",\"created_at\":\"2019-05-09 20:42:22\",\"updated_at\":null}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 13:42:22'),
(651, 1, 1, 2, 'Cập nhật khách hàng ID: 1', '{\"id\":\"1\",\"code\":\"A\",\"name\":\"B\",\"type\":\"1\",\"address\":\"C\",\"phone\":\"E\",\"email\":\"d@gmail.com\",\"note\":\"F\",\"status\":\"1\",\"created_at\":\"2019-05-09 20:42:22\",\"updated_at\":\"2019-05-09 20:48:03\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 13:48:03'),
(652, 1, 1, 3, 'Xoá tài khoản có ID: 1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 15:00:14'),
(653, 1, 1, 2, 'Cập nhật nhân viên ID: 10', '{\"id\":\"10\",\"code\":\"NV00010\",\"name\":\"Hu\\u1ef3nh Th\\u1ecb B\",\"dept_id\":\"36\",\"position_id\":\"2\",\"division_id\":\"2\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-09 23:19:15\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-09 16:19:15'),
(654, 1, 1, 1, 'Tạo nhập kho thành công với ID 1', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 01:13:03'),
(655, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-08-05 15:01:00\",\"other_doc\":\"0_1547543354test.txt\",\"handover_doc\":\"1_1547543354test.txt\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 08:15:20\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 01:15:20'),
(656, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"0_1547543354test.txt\",\"handover_doc\":\"1_1547543354test.txt\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 08:36:44\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 01:36:44'),
(657, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"0_1547543354test.txt\",\"handover_doc\":\"1_1547543354test.txt\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 08:36:54\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 01:36:54'),
(658, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"0_1547543354test.txt\",\"handover_doc\":\"1_1547543354test.txt\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 08:36:58\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 01:36:58'),
(659, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-08-05 15:01:00\",\"other_doc\":\"0_1547543354test.txt\",\"handover_doc\":\"1_1547543354test.txt\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 08:37:15\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 01:37:15'),
(660, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"0_1547543354test.txt\",\"handover_doc\":\"1_1547543354test.txt\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 08:48:39\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 01:48:39'),
(661, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-08-05 15:01:00\",\"other_doc\":\"0_1547543354test.txt\",\"handover_doc\":\"1_1547543354test.txt\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 08:52:36\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 01:52:36'),
(662, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"0_1547543354test.txt\",\"handover_doc\":\"1_1547543354test.txt\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 08:53:26\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 01:53:26'),
(663, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"0_1547543354test.txt\",\"handover_doc\":\"1_1547543354test.txt\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 08:53:32\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 01:53:32'),
(664, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"0_1547543354test.txt\",\"handover_doc\":\"1_1547543354test.txt\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 09:44:24\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 02:44:24'),
(665, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"0_1547543354test.txt\",\"handover_doc\":\"1_1547543354test.txt\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 09:44:35\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 02:44:35'),
(666, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"0_1547543354test.txt\",\"handover_doc\":\"1_1547543354test.txt\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 10:34:45\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 03:34:45'),
(667, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 10:53:02\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 03:53:02'),
(668, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 11:06:14\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 04:06:14'),
(669, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[]\",\"handover_doc\":\"5cd8f4aa86502_3. Harry Potter and the Prisoner of Azkaban.pdf\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 11:38:02\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 04:38:02'),
(670, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd8fda18b7d6_2. Harry Potter and the Chamber of Secrets - Copy.pdf\\\",\\\"5cd8fda18b987_2. Harry Potter and the Chamber of Secrets.pdf\\\",\\\"5cd8fda18bafd_3. Harry Potter and the Prisoner of Azkaban - Copy.pdf\\\"]\",\"handover_doc\":\"5cd8f4aa86502_3. Harry Potter and the Prisoner of Azkaban.pdf\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 12:16:17\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 05:16:17'),
(671, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd8fe2e56ddf_1. Harry Potter and the Philosopher\'s Stone.pdf\\\",\\\"5cd8fe2e56f6d_2. Harry Potter and the Chamber of Secrets - Copy.pdf\\\",\\\"5cd8fe2e570db_2. Harry Potter and the Chamber of Secrets.pdf\\\"]\",\"handover_doc\":\"5cd8fe2e56baf_1. Harry Potter and the Philosopher\'s Stone.pdf\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 12:18:38\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 05:18:38'),
(672, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[]\",\"handover_doc\":\"5cd8fe2e56baf_1. Harry Potter and the Philosopher\'s Stone.pdf\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 14:53:25\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 07:53:25'),
(673, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[]\",\"handover_doc\":\"5cd8fe2e56baf_1. Harry Potter and the Philosopher\'s Stone.pdf\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 15:00:14\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 08:00:14'),
(674, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[]\",\"handover_doc\":\"5cd8fe2e56baf_1. Harry Potter and the Philosopher\'s Stone.pdf\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 15:00:33\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 08:00:33'),
(675, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[]\",\"handover_doc\":\"5cd8fe2e56baf_1. Harry Potter and the Philosopher\'s Stone.pdf\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 15:02:24\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 08:02:24');
INSERT INTO `log_history` (`id`, `user_id`, `page`, `type`, `name`, `detail`, `ip`, `device`, `created_at`) VALUES
(676, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[]\",\"handover_doc\":\"5cd8fe2e56baf_1. Harry Potter and the Philosopher\'s Stone.pdf\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 15:05:38\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 08:05:38'),
(677, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[]\",\"handover_doc\":\"5cd8fe2e56baf_1. Harry Potter and the Philosopher\'s Stone.pdf\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 15:06:04\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 08:06:04'),
(678, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[]\",\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 15:16:04\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 08:16:04'),
(679, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd928c9efe82_lifecycle_react.png\\\",\\\"5cd928c9f0301_logo.png\\\",\\\"5cd928c9f04d4_map-icon.png\\\"]\",\"handover_doc\":\"5cd928c9efa49_Reimage - PC Repair Online - Confirmation page.pdf\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 15:20:25\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 08:20:25'),
(680, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd928c9efe82_lifecycle_react.png\\\",\\\"5cd928c9f0301_logo.png\\\",\\\"5cd928c9f04d4_map-icon.png\\\"]\",\"handover_doc\":\"5cd928c9efa49_Reimage - PC Repair Online - Confirmation page.pdf\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 15:40:23\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 08:40:23'),
(681, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd928c9efe82_lifecycle_react.png\\\",\\\"5cd928c9f0301_logo.png\\\",\\\"5cd928c9f04d4_map-icon.png\\\"]\",\"handover_doc\":\"5cd928c9efa49_Reimage - PC Repair Online - Confirmation page.pdf\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 15:41:29\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 08:41:29'),
(682, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd928c9efe82_lifecycle_react.png\\\",\\\"5cd928c9f0301_logo.png\\\",\\\"5cd928c9f04d4_map-icon.png\\\"]\",\"handover_doc\":\"5cd928c9efa49_Reimage - PC Repair Online - Confirmation page.pdf\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 15:51:43\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 08:51:43'),
(683, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd928c9efe82_lifecycle_react.png\\\",\\\"5cd928c9f0301_logo.png\\\",\\\"5cd928c9f04d4_map-icon.png\\\"]\",\"handover_doc\":\"5cd928c9efa49_Reimage - PC Repair Online - Confirmation page.pdf\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 15:53:23\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 08:53:23'),
(684, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd928c9efe82_lifecycle_react.png\\\",\\\"5cd928c9f0301_logo.png\\\",\\\"5cd928c9f04d4_map-icon.png\\\"]\",\"handover_doc\":\"5cd928c9efa49_Reimage - PC Repair Online - Confirmation page.pdf\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 15:54:29\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 08:54:29'),
(685, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd928c9efe82_lifecycle_react.png\\\",\\\"5cd928c9f0301_logo.png\\\",\\\"5cd928c9f04d4_map-icon.png\\\"]\",\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 15:59:05\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 08:59:05'),
(686, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:00:15\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:00:15'),
(687, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd932520b1c8_lifecycle_react.png\\\",\\\"5cd932520b3d3_logo.png\\\",\\\"5cd932520b571_map-icon.png\\\"]\",\"handover_doc\":\"5cd932520af61_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:01:06\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:01:06'),
(688, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":\"5cd932520af61_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:01:18\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:01:18'),
(689, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":\"5cd932520af61_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:01:43\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:01:43'),
(690, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":\"5cd932520af61_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:02:06\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:02:06'),
(691, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":\"5cd932520af61_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:09:12\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:09:12'),
(692, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":\"5cd932520af61_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:10:41\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:10:41'),
(693, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":\"5cd932520af61_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:13:52\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:13:52'),
(694, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":\"5cd932520af61_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:16:23\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:16:23'),
(695, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":\"5cd932520af61_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:16:35\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:16:35'),
(696, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":\"5cd932520af61_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:16:53\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:16:53'),
(697, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":\"5cd932520af61_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:23:14\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:23:14'),
(698, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd937d507fac_lifecycle_react.png\\\",\\\"5cd937d508198_logo_500x500.png\\\",\\\"5cd937d508440_map-icon.png\\\"]\",\"handover_doc\":\"5cd937d507db9_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:24:37\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:24:37'),
(699, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd937d507fac_lifecycle_react.png\\\",\\\"5cd937d508198_logo_500x500.png\\\",\\\"5cd937d508440_map-icon.png\\\"]\",\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:24:48\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:24:48'),
(700, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:27:10\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:27:10'),
(701, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd9389be0e16_lifecycle_react.png\\\",\\\"5cd9389be0f90_logo.png\\\",\\\"5cd9389be10fb_logo_500x500.png\\\"]\",\"handover_doc\":\"5cd9389be0c38_map-icon.png\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:27:55\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:27:55'),
(702, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd9389be0e16_lifecycle_react.png\\\",\\\"5cd9389be0f90_logo.png\\\",\\\"5cd9389be10fb_logo_500x500.png\\\"]\",\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:28:06\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:28:06'),
(703, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd9389be0e16_lifecycle_react.png\\\",\\\"5cd9389be0f90_logo.png\\\",\\\"5cd9389be10fb_logo_500x500.png\\\"]\",\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:28:38\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:28:38'),
(704, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd9392810e47_logo.png\\\",\\\"5cd93928110ab_logo_500x500.png\\\",\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd9392810bca_lifecycle_react.png\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:30:16\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:30:16'),
(705, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"{\\\"0\\\":\\\"5cd9392810e47_logo.png\\\",\\\"2\\\":\\\"5cd939281121c_map-icon.png\\\"}\",\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:32:50\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:32:51'),
(706, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:36:11\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:36:11'),
(707, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93b4e1fc16_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:39:26\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:39:26'),
(708, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:39:35\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:39:35'),
(709, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93b6553bdb_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:39:49\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:39:49'),
(710, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93b730d867_lifecycle_react.png\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:40:03\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:40:03'),
(711, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":null,\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93bf3cc83e_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:42:11\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:42:11'),
(712, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 16:43:56\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 09:43:56'),
(713, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 17:39:01\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 10:39:01'),
(714, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-13 17:41:20\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-13 10:41:20'),
(715, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 10:14:18\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 03:14:18'),
(716, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 10:14:51\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 03:14:51'),
(717, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"move_note\":\"\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 10:14:53\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 03:14:53'),
(718, 1, 1, 1, 'Thêm mới nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"A\",\"datetime\":\"2019-05-14 14:19:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":1,\"note\":\"A\",\"created_at\":\"2019-05-14 14:19:28\",\"updated_at\":\"2019-05-14 14:19:28\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 07:19:28'),
(719, 1, 1, 1, 'Thêm mới nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"A\",\"datetime\":\"2019-05-14 14:19:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":1,\"note\":\"A\",\"created_at\":\"2019-05-14 14:19:45\",\"updated_at\":\"2019-05-14 14:19:45\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 07:19:45'),
(720, 1, 1, 1, 'Thêm mới nhập kho ID: 4', '{\"id\":\"4\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"A\",\"datetime\":\"2019-05-14 14:19:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":1,\"note\":\"A\",\"created_at\":\"2019-05-14 14:19:49\",\"updated_at\":\"2019-05-14 14:19:49\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 07:19:49'),
(721, 1, 1, 1, 'Thêm mới nhập kho ID: 5', '{\"id\":\"5\",\"code\":\"HNN19IN0000005\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"AAAAAAAAA\",\"datetime\":\"2019-05-14 14:28:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":1,\"note\":\"AAAAAA\",\"created_at\":\"2019-05-14 14:28:25\",\"updated_at\":\"2019-05-14 14:28:25\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 07:28:25'),
(722, 1, 1, 1, 'Thêm mới nhập kho ID: 6', '{\"id\":\"6\",\"code\":\"HNN19IN0000006\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"VVVV\",\"datetime\":\"2019-05-14 14:29:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":1,\"note\":\"VVVV\",\"created_at\":\"2019-05-14 14:29:50\",\"updated_at\":\"2019-05-14 14:29:50\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 07:29:50'),
(723, 1, 1, 1, 'Thêm mới nhập kho ID: 7', '{\"id\":\"7\",\"code\":\"HNN19IN0000007\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"2\",\"manager_id\":\"1\",\"reason\":\"FFFFFFFFF\",\"datetime\":\"2019-05-14 14:32:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":1,\"note\":\"A\",\"created_at\":\"2019-05-14 14:33:02\",\"updated_at\":\"2019-05-14 14:33:02\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 07:33:02'),
(724, 1, 1, 1, 'Thêm mới nhập kho ID: 8', '{\"id\":\"8\",\"code\":\"HNN19IN0000008\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"FSDSFS\",\"datetime\":\"2019-05-14 14:34:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":1,\"note\":\"\\u1ea4DDDDDDDDD\",\"created_at\":\"2019-05-14 14:34:16\",\"updated_at\":\"2019-05-14 14:34:16\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 07:34:16'),
(725, 1, 1, 1, 'Thêm mới nhập kho ID: 9', '{\"id\":\"9\",\"code\":\"HNN19IN0000009\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"2\",\"manager_id\":\"1\",\"reason\":\"AAAAAAAA\",\"datetime\":\"2019-05-14 14:35:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":1,\"note\":\"A\",\"created_at\":\"2019-05-14 14:35:08\",\"updated_at\":\"2019-05-14 14:35:08\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 07:35:08'),
(726, 1, 1, 1, 'Thêm mới nhập kho ID: 10', '{\"id\":\"10\",\"code\":\"HNN19IN0000010\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"2\",\"manager_id\":\"1\",\"reason\":\"FS\",\"datetime\":\"2019-05-14 14:39:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":1,\"note\":\"ADDDDD\",\"created_at\":\"2019-05-14 14:39:21\",\"updated_at\":\"2019-05-14 14:39:21\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 07:39:21'),
(727, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 16:51:43\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 09:51:43'),
(728, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 16:51:55\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 09:51:55'),
(729, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 16:53:24\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 09:53:24'),
(730, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 16:55:07\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 09:55:07'),
(731, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 16:55:24\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 09:55:24'),
(732, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 16:55:27\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 09:55:27'),
(733, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 16:55:51\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 09:55:51'),
(734, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 16:55:55\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 09:55:55'),
(735, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 16:55:58\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 09:55:58'),
(736, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 16:58:32\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 09:58:32'),
(737, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 16:59:40\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 09:59:40'),
(738, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 16:59:46\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 09:59:46'),
(739, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:01:23\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:01:23'),
(740, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:01:45\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:01:45'),
(741, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:01:49\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:01:49'),
(742, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:04:21\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:04:21'),
(743, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:06:02\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:06:02'),
(744, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:06:04\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:06:04'),
(745, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:06:18\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:06:18'),
(746, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:06:19\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:06:19'),
(747, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:06:36\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:06:36'),
(748, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:06:37\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:06:37');
INSERT INTO `log_history` (`id`, `user_id`, `page`, `type`, `name`, `detail`, `ip`, `device`, `created_at`) VALUES
(749, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:07:12\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:07:12'),
(750, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:07:17\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:07:17'),
(751, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:07:23\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:07:23'),
(752, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:07:31\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:07:31'),
(753, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:27:02\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:27:02'),
(754, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:29:08\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:29:08'),
(755, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:29:10\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:29:10'),
(756, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:29:35\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:29:35'),
(757, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:29:37\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:29:37'),
(758, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:29:47\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:29:47'),
(759, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:29:53\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:29:53'),
(760, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:34:36\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:34:36'),
(761, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:34:37\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:34:37'),
(762, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:46:38\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:46:38'),
(763, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:46:39\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:46:39'),
(764, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:48:31\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:48:31'),
(765, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:48:32\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:48:32'),
(766, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:54:32\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:54:32'),
(767, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:59:54\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:59:54'),
(768, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 17:59:56\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 10:59:56'),
(769, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 18:04:23\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 11:04:23'),
(770, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 18:04:27\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 11:04:27'),
(771, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 18:04:29\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 11:04:29'),
(772, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 18:06:24\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 11:06:24'),
(773, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 18:06:40\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 11:06:40'),
(774, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 18:06:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 11:06:59'),
(775, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 18:07:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 11:07:00'),
(776, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 18:07:01\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 11:07:01'),
(777, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 18:07:02\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 11:07:02'),
(778, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 18:18:58\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 11:18:58'),
(779, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 18:20:30\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 11:20:30'),
(780, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 18:20:34\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 11:20:34'),
(781, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 18:25:06\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 11:25:06'),
(782, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 18:25:11\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 11:25:11'),
(783, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 18:25:13\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 11:25:13'),
(784, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 18:52:35\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 11:52:35'),
(785, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 18:54:40\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 11:54:40'),
(786, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"2\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 18:54:52\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 11:54:52'),
(787, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 18:56:33\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 11:56:33'),
(788, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 18:58:19\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 11:58:19'),
(789, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 18:59:05\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 11:59:05'),
(790, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 19:00:14\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 12:00:14'),
(791, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 19:00:57\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 12:00:57'),
(792, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi l\\u1eafm\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 19:01:08\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 12:01:08'),
(793, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"M\\u1edbi l\\u1eafm\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-14 19:01:20\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 12:01:20'),
(794, 1, 1, 1, 'Thêm mới nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"AAAAAAAAAA\",\"datetime\":\"2019-05-14 19:06:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":1,\"note\":\"A\",\"created_at\":\"2019-05-14 19:06:14\",\"updated_at\":\"2019-05-14 19:06:14\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 12:06:14'),
(795, 1, 1, 2, 'Cập nhật nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"AAAAAAAAAA\",\"datetime\":\"2019-05-14 19:06:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":1,\"note\":\"A\",\"created_at\":\"2019-05-14 19:06:14\",\"updated_at\":\"2019-05-14 19:06:32\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 12:06:32'),
(796, 1, 1, 2, 'Cập nhật nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"AAAAAAAAAA\",\"datetime\":\"2019-05-14 19:06:00\",\"other_doc\":null,\"handover_doc\":\"5cdaafd333b4f_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"A\",\"created_at\":\"2019-05-14 19:06:14\",\"updated_at\":\"2019-05-14 19:08:51\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 12:08:51'),
(797, 1, 1, 2, 'Cập nhật nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"AAAAAAAAAA\",\"datetime\":\"2019-05-14 19:06:00\",\"other_doc\":null,\"handover_doc\":\"5cdaafd333b4f_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"A\",\"created_at\":\"2019-05-14 19:06:14\",\"updated_at\":\"2019-05-14 19:09:07\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 12:09:07'),
(798, 1, 1, 1, 'Thêm mới nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"2\",\"manager_id\":\"1\",\"reason\":\"JHKJHJK\",\"datetime\":\"2019-05-14 19:14:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"a\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-14 19:14:35\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-14 12:14:35'),
(799, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"2\",\"manager_id\":\"1\",\"reason\":\"1\",\"reason_other\":null,\"datetime\":\"2019-05-14 19:14:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"a\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-15 08:52:35\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 01:52:35'),
(800, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"2\",\"manager_id\":\"1\",\"reason\":\"2\",\"eviction\":\"1235464\",\"reason_other\":\"\",\"datetime\":\"2019-05-14 19:14:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"a\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-15 09:02:31\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 02:02:31'),
(801, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-15 12:43:48\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 05:43:48'),
(802, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-15 12:45:02\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 05:45:02'),
(803, 1, 1, 1, 'Thêm mới tài sản/thiết bị ID: 1', '{\"id\":\"1\",\"assets_id\":null,\"assets_code\":\"1232435467\",\"mac\":\"12324356\",\"dept_id\":null,\"cat_assets_id\":\"5\",\"chain_id\":null,\"bill_num\":\"1234566\",\"buy_date\":\"2019-05-15 00:00:00\",\"guarantee_date\":\"2019-05-15 00:00:00\",\"unit_price_pro\":10000000,\"price_pro\":100000000,\"depreciation_time\":\"\",\"depreciation_type\":\"0\",\"depreciation_tm\":\"0\",\"quality\":\"10\",\"quantity\":10,\"status\":0,\"lost_id\":null,\"whi_id\":\"1\",\"who_id\":null,\"step\":1,\"datetime_aplied\":\"2019-05-08 15:01:00\",\"created_at\":\"2019-05-15 13:28:07\",\"updated_at\":\"2019-05-15 13:28:07\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 06:28:07'),
(804, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":0,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-15 14:13:58\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 07:13:58'),
(805, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":0,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-15 14:14:31\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 07:14:31'),
(806, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":0,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-15 14:15:24\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 07:15:24'),
(807, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":0,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-15 14:16:27\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 07:16:27'),
(808, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":0,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-15 14:20:37\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 07:20:37'),
(809, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":0,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-15 14:23:40\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 07:23:40'),
(810, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":0,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-15 14:24:14\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 07:24:14'),
(811, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":0,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-15 14:26:54\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 07:26:54'),
(812, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":0,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-15 14:27:06\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 07:27:06'),
(813, 1, 1, 2, 'Cập nhật tài sản/thiết bị ID: 1', '{\"id\":\"1\",\"assets_id\":null,\"assets_code\":\"1232435467\",\"mac\":\"12324356\",\"dept_id\":null,\"cat_assets_id\":\"5\",\"chain_id\":null,\"bill_num\":\"1234566\",\"buy_date\":\"2019-05-15 00:00:00\",\"guarantee_date\":\"2019-05-15 00:00:00\",\"unit_price_pro\":10000000,\"price_pro\":100000000,\"depreciation_time\":\"0\",\"depreciation_type\":\"0\",\"depreciation_tm\":\"0\",\"quality\":\"10\",\"quantity\":10,\"status\":0,\"lost_id\":null,\"whi_id\":\"3\",\"who_id\":null,\"step\":1,\"datetime_aplied\":\"2019-05-08 15:01:00\",\"created_at\":\"2019-05-15 13:28:07\",\"updated_at\":\"2019-05-15 16:55:39\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 09:55:39'),
(814, 1, 1, 2, 'Cập nhật tài sản/thiết bị ID: 1', '{\"id\":\"1\",\"assets_id\":null,\"assets_code\":\"1232435467\",\"mac\":\"12324356\",\"dept_id\":null,\"cat_assets_id\":\"5\",\"chain_id\":null,\"bill_num\":\"1234566\",\"buy_date\":\"2019-05-15 00:00:00\",\"guarantee_date\":\"2019-05-15 00:00:00\",\"unit_price_pro\":10000000,\"price_pro\":100000000,\"depreciation_time\":\"0\",\"depreciation_type\":\"0\",\"depreciation_tm\":\"0\",\"quality\":\"10\",\"quantity\":10,\"status\":0,\"lost_id\":null,\"whi_id\":\"3\",\"who_id\":null,\"step\":2,\"datetime_aplied\":\"2019-05-08 15:01:00\",\"created_at\":\"2019-05-15 13:28:07\",\"updated_at\":\"2019-05-15 17:06:48\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 10:06:48'),
(815, 1, 1, 2, 'Cập nhật tài sản/thiết bị ID: 1', '{\"id\":\"1\",\"assets_id\":null,\"assets_code\":\"1232435467\",\"mac\":\"12324356\",\"dept_id\":null,\"cat_assets_id\":\"5\",\"chain_id\":null,\"bill_num\":\"1234566\",\"buy_date\":\"2019-05-15 00:00:00\",\"guarantee_date\":\"2019-05-15 00:00:00\",\"unit_price_pro\":10000000,\"price_pro\":100000000,\"depreciation_time\":\"10\",\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"quality\":\"10\",\"quantity\":10,\"status\":0,\"lost_id\":null,\"whi_id\":\"3\",\"who_id\":null,\"step\":3,\"datetime_aplied\":\"2019-05-08 15:01:00\",\"created_at\":\"2019-05-15 13:28:07\",\"updated_at\":\"2019-05-15 17:06:58\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 10:06:58'),
(816, 1, 1, 2, 'Cập nhật tài sản/thiết bị ID: 1', '{\"id\":\"1\",\"assets_id\":null,\"assets_code\":\"1232435467\",\"mac\":\"12324356\",\"dept_id\":null,\"cat_assets_id\":\"5\",\"chain_id\":null,\"bill_num\":\"1234566\",\"buy_date\":\"2019-05-15 00:00:00\",\"guarantee_date\":\"2019-05-15 00:00:00\",\"unit_price_pro\":10000000,\"price_pro\":100000000,\"depreciation_time\":\"10\",\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"quality\":\"10\",\"quantity\":10,\"status\":0,\"lost_id\":null,\"whi_id\":\"3\",\"who_id\":null,\"step\":3,\"datetime_aplied\":\"2019-05-08 15:01:00\",\"created_at\":\"2019-05-15 13:28:07\",\"updated_at\":\"2019-05-15 17:07:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 10:07:00'),
(817, 1, 1, 2, 'Cập nhật tài sản/thiết bị ID: 1', '{\"id\":\"1\",\"assets_id\":null,\"assets_code\":\"1232435467\",\"mac\":\"12324356\",\"dept_id\":null,\"cat_assets_id\":\"5\",\"chain_id\":null,\"bill_num\":\"1234566\",\"buy_date\":\"2019-05-15 00:00:00\",\"guarantee_date\":\"2019-05-15 00:00:00\",\"unit_price_pro\":10000000,\"price_pro\":100000000,\"depreciation_time\":\"10\",\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"quality\":\"10\",\"quantity\":10,\"status\":0,\"lost_id\":null,\"whi_id\":\"3\",\"who_id\":null,\"step\":3,\"datetime_aplied\":\"2019-05-08 15:01:00\",\"created_at\":\"2019-05-15 13:28:07\",\"updated_at\":\"2019-05-15 17:07:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 10:07:59'),
(818, 1, 1, 2, 'Cập nhật tài sản/thiết bị ID: 1', '{\"id\":\"1\",\"assets_id\":null,\"assets_code\":\"1232435467\",\"mac\":\"12324356\",\"dept_id\":null,\"cat_assets_id\":\"5\",\"chain_id\":null,\"bill_num\":\"1234566\",\"buy_date\":\"2019-05-15 00:00:00\",\"guarantee_date\":\"2019-05-15 00:00:00\",\"unit_price_pro\":10000000,\"price_pro\":100000000,\"depreciation_time\":\"10\",\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"quality\":\"10\",\"quantity\":10,\"status\":0,\"lost_id\":null,\"whi_id\":\"3\",\"who_id\":null,\"step\":3,\"datetime_aplied\":\"2019-05-08 15:01:00\",\"created_at\":\"2019-05-15 13:28:07\",\"updated_at\":\"2019-05-15 17:08:40\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 10:08:40'),
(819, 1, 1, 2, 'Cập nhật tài sản/thiết bị ID: 1', '{\"id\":\"1\",\"assets_id\":null,\"assets_code\":\"1232435467\",\"mac\":\"12324356\",\"dept_id\":null,\"cat_assets_id\":\"5\",\"chain_id\":null,\"bill_num\":\"1234566\",\"buy_date\":\"2019-05-15 00:00:00\",\"guarantee_date\":\"2019-05-15 00:00:00\",\"unit_price_pro\":10000000,\"price_pro\":100000000,\"depreciation_time\":\"10\",\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"quality\":\"10\",\"quantity\":10,\"status\":0,\"lost_id\":null,\"whi_id\":\"3\",\"who_id\":null,\"step\":3,\"datetime_aplied\":\"2019-05-08 15:01:00\",\"created_at\":\"2019-05-15 13:28:07\",\"updated_at\":\"2019-05-15 17:10:44\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 10:10:44');
INSERT INTO `log_history` (`id`, `user_id`, `page`, `type`, `name`, `detail`, `ip`, `device`, `created_at`) VALUES
(820, 1, 1, 2, 'Cập nhật tài sản/thiết bị ID: 1', '{\"id\":\"1\",\"assets_id\":null,\"assets_code\":\"1232435467\",\"mac\":\"12324356\",\"dept_id\":null,\"cat_assets_id\":\"5\",\"chain_id\":null,\"bill_num\":\"1234566\",\"buy_date\":\"2019-05-15 00:00:00\",\"guarantee_date\":\"2019-05-15 00:00:00\",\"unit_price_pro\":10000000,\"price_pro\":100000000,\"depreciation_time\":\"10\",\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"quality\":\"10\",\"quantity\":10,\"status\":0,\"lost_id\":null,\"whi_id\":\"3\",\"who_id\":null,\"step\":3,\"datetime_aplied\":\"2019-05-08 15:01:00\",\"created_at\":\"2019-05-15 13:28:07\",\"updated_at\":\"2019-05-15 17:10:52\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 10:10:52'),
(821, 1, 1, 2, 'Cập nhật tài sản/thiết bị ID: 1', '{\"id\":\"1\",\"assets_id\":null,\"assets_code\":\"1232435467\",\"mac\":\"12324356\",\"dept_id\":null,\"cat_assets_id\":\"5\",\"chain_id\":null,\"bill_num\":\"1234566\",\"buy_date\":\"2019-05-15 00:00:00\",\"guarantee_date\":\"2019-05-15 00:00:00\",\"unit_price_pro\":10000000,\"price_pro\":100000000,\"depreciation_time\":\"10\",\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"quality\":\"10\",\"quantity\":10,\"status\":1,\"lost_id\":null,\"whi_id\":\"3\",\"who_id\":null,\"step\":4,\"datetime_aplied\":\"2019-05-08 15:01:00\",\"created_at\":\"2019-05-15 13:28:07\",\"updated_at\":\"2019-05-15 17:11:03\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 10:11:03'),
(822, 1, 1, 1, 'Thêm mới tài sản/thiết bị ID: 2', '{\"id\":\"2\",\"assets_id\":null,\"assets_code\":\"adszfghjkl\",\"mac\":\"dsafghjk\",\"dept_id\":null,\"cat_assets_id\":\"4\",\"chain_id\":null,\"bill_num\":\"`axsdfvbgnh\",\"buy_date\":\"2019-05-15 00:00:00\",\"guarantee_date\":\"2019-05-15 00:00:00\",\"unit_price_pro\":997000000,\"price_pro\":997000000,\"depreciation_time\":\"\",\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"quality\":\"123456789\",\"quantity\":1,\"status\":0,\"lost_id\":null,\"whi_id\":\"3\",\"who_id\":null,\"step\":1,\"datetime_aplied\":\"2019-05-08 15:01:00\",\"created_at\":\"2019-05-15 17:12:34\",\"updated_at\":\"2019-05-15 17:12:34\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 10:12:34'),
(823, 1, 1, 2, 'Cập nhật tài sản/thiết bị ID: 2', '{\"id\":\"2\",\"assets_id\":null,\"assets_code\":\"adszfghjkl\",\"mac\":\"dsafghjk\",\"dept_id\":null,\"cat_assets_id\":\"4\",\"chain_id\":null,\"bill_num\":\"`axsdfvbgnh\",\"buy_date\":\"2019-05-15 00:00:00\",\"guarantee_date\":\"2019-05-15 00:00:00\",\"unit_price_pro\":997000000,\"price_pro\":997000000,\"depreciation_time\":\"\",\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"quality\":\"123456789\",\"quantity\":1,\"status\":0,\"lost_id\":null,\"whi_id\":\"3\",\"who_id\":null,\"step\":2,\"datetime_aplied\":\"2019-05-08 15:01:00\",\"created_at\":\"2019-05-15 17:12:34\",\"updated_at\":\"2019-05-15 17:12:46\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 10:12:46'),
(824, 1, 1, 2, 'Cập nhật tài sản/thiết bị ID: 2', '{\"id\":\"2\",\"assets_id\":null,\"assets_code\":\"adszfghjkl\",\"mac\":\"dsafghjk\",\"dept_id\":null,\"cat_assets_id\":\"4\",\"chain_id\":null,\"bill_num\":\"`axsdfvbgnh\",\"buy_date\":\"2019-05-15 00:00:00\",\"guarantee_date\":\"2019-05-15 00:00:00\",\"unit_price_pro\":997000000,\"price_pro\":997000000,\"depreciation_time\":\"10\",\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"quality\":\"123456789\",\"quantity\":1,\"status\":0,\"lost_id\":null,\"whi_id\":\"3\",\"who_id\":null,\"step\":3,\"datetime_aplied\":\"2019-05-08 15:01:00\",\"created_at\":\"2019-05-15 17:12:34\",\"updated_at\":\"2019-05-15 17:13:10\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 10:13:10'),
(825, 1, 1, 2, 'Cập nhật tài sản/thiết bị ID: 2', '{\"id\":\"2\",\"assets_id\":null,\"assets_code\":\"adszfghjkl\",\"mac\":\"dsafghjk\",\"dept_id\":null,\"cat_assets_id\":\"4\",\"chain_id\":null,\"bill_num\":\"`axsdfvbgnh\",\"buy_date\":\"2019-05-15 00:00:00\",\"guarantee_date\":\"2019-05-15 00:00:00\",\"unit_price_pro\":997000000,\"price_pro\":997000000,\"depreciation_time\":\"10\",\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"quality\":\"123456789\",\"quantity\":1,\"status\":1,\"lost_id\":null,\"whi_id\":\"3\",\"who_id\":null,\"step\":4,\"datetime_aplied\":\"2019-05-08 15:01:00\",\"created_at\":\"2019-05-15 17:12:34\",\"updated_at\":\"2019-05-15 17:13:13\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-15 10:13:13'),
(826, 1, 1, 2, 'Cập nhật nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-14 19:06:00\",\"other_doc\":null,\"handover_doc\":\"5cdaafd333b4f_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":0,\"note\":\"\",\"created_at\":\"2019-05-14 19:06:14\",\"updated_at\":\"2019-05-16 09:17:10\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-16 02:17:10'),
(827, 1, 1, 2, 'Cập nhật nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-14 19:06:00\",\"other_doc\":null,\"handover_doc\":\"5cdaafd333b4f_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"created_at\":\"2019-05-14 19:06:14\",\"updated_at\":\"2019-05-16 09:17:14\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-16 02:17:14'),
(828, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-16 09:25:52\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-16 02:25:52'),
(829, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-16 09:26:06\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-16 02:26:06'),
(830, 1, 1, 2, 'Cập nhật nhà kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho S\\u1ed1 1\",\"short_name\":\"HNN\",\"dept_id\":\"25\",\"manager_id\":\"2\",\"address\":\"Qu\\u1eadn 1\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"diagram\":\"5cdd1cd4d5139_logo.png\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-05-16 15:18:28\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-16 08:18:28'),
(831, 1, 1, 2, 'Cập nhật đơn vị/ phòng ban ID: 35', '{\"id\":\"35\",\"code\":\"CT0001\",\"name\":\"T\\u1eadp \\u0110o\\u00e0n HoneyNet\",\"parent_id\":0,\"level\":0,\"status\":\"1\",\"created_at\":\"2019-04-02 22:17:00\",\"updated_at\":\"2019-04-02 22:17:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-16 08:29:57'),
(832, 1, 1, 2, 'Cập nhật đơn vị/ phòng ban ID: 25', '{\"id\":\"25\",\"code\":\"HCM00001\",\"name\":\"C\\u00f4ng ty HoneyNet\",\"parent_id\":\"35\",\"level\":1,\"status\":\"1\",\"created_at\":\"2019-03-19 08:41:18\",\"updated_at\":\"2019-03-19 08:41:18\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-16 08:30:16'),
(833, 1, 1, 2, 'Cập nhật đơn vị/ phòng ban ID: 25', '{\"id\":\"25\",\"code\":\"HNN00001\",\"name\":\"C\\u00f4ng ty HoneyNet\",\"parent_id\":\"35\",\"level\":1,\"status\":\"1\",\"created_at\":\"2019-03-19 08:41:18\",\"updated_at\":\"2019-03-19 08:41:18\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-16 08:30:27'),
(834, 1, 1, 2, 'Cập nhật nhân viên ID: 11', '{\"id\":\"11\",\"code\":\"NV00009\",\"name\":\"Hu\\u1ef3nh \\u0110\\u1eafc Nh\\u00e2n\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"5\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-16 15:31:17\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-16 08:31:17'),
(835, 1, 1, 2, 'Cập nhật nhân viên ID: 11', '{\"id\":\"11\",\"code\":\"NV00009\",\"name\":\"Hu\\u1ef3nh \\u0110\\u1eafc Nh\\u00e2n\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"5\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-16 15:31:30\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-16 08:31:30'),
(836, 1, 1, 2, 'Cập nhật nhân viên ID: 11', '{\"id\":\"11\",\"code\":\"NV00009\",\"name\":\"Hu\\u1ef3nh \\u0110\\u1eafc Nh\\u00e2n\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-16 15:32:44\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-16 08:32:44'),
(837, 1, 1, 2, 'Cập nhật tài khoản có ID: 4', '{\"id\":\"4\",\"name\":\"Nguyen Duy\",\"username\":\"nguyen_duy\",\"password\":\"$2y$08$OE9FaEpoYU1kTVlYb0pRSusJ93YCWfcCDZEN3SivbQhn63RtM3JG.\",\"email\":\"nguyenduy701@gmail.com\",\"phone\":\"0988291649\",\"avatar\":null,\"role\":\"2\",\"dept_id\":\"25\",\"dept_mg\":\"[\\\"35\\\",\\\"25\\\",\\\"36\\\",\\\"37\\\",\\\"38\\\"]\",\"status\":\"1\",\"created_at\":\"2019-05-09 14:45:39\",\"updated_at\":\"2019-05-16 15:33:13\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-16 08:33:13'),
(838, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":\"5cdd3202db631_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-16 16:48:50\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-16 09:48:50'),
(839, 1, 1, 1, 'Thêm mới xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19EX0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"2\",\"eviction\":\"12345678\",\"reason_other\":\"\",\"datetime\":\"2019-05-16 17:56:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"AAAAAAAAA\",\"created_at\":\"2019-05-16 17:56:42\",\"updated_at\":\"2019-05-16 17:56:42\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-16 10:56:42'),
(840, 1, 1, 2, 'Cập nhật xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19EX0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"2\",\"eviction\":\"12345678\",\"reason_other\":\"\",\"datetime\":\"2019-05-16 17:56:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"AAAAAAAAA\",\"created_at\":\"2019-05-16 17:56:42\",\"updated_at\":\"2019-05-17 12:24:04\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-17 05:24:04'),
(841, 1, 1, 2, 'Cập nhật xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19EX0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"2\",\"eviction\":\"12345678\",\"reason_other\":\"\",\"datetime\":\"2019-05-16 17:56:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"\",\"created_at\":\"2019-05-16 17:56:42\",\"updated_at\":\"2019-05-17 16:12:27\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-17 09:12:27'),
(842, 1, 1, 2, 'Cập nhật xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19EX0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"2\",\"eviction\":\"12345678\",\"reason_other\":\"\",\"datetime\":\"2019-05-16 17:56:00\",\"other_doc\":null,\"handover_doc\":\"5cde7b09e35f1_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"created_at\":\"2019-05-16 17:56:42\",\"updated_at\":\"2019-05-17 16:12:41\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-17 09:12:41'),
(843, 1, 1, 1, 'Thêm mới nhập kho ID: 4', '{\"id\":\"4\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"2\",\"eviction\":\"12345677\",\"reason_other\":\"\",\"datetime\":\"2019-05-17 23:05:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"Thu h\\u1ed3i POC\",\"created_at\":\"2019-05-17 23:09:07\",\"updated_at\":\"2019-05-17 23:09:07\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-17 16:09:07'),
(844, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":\"5cdd3202db631_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-18 07:23:08\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 00:23:08'),
(845, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"other_doc\":null,\"handover_doc\":\"5cdd3202db631_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-18 07:23:13\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 00:23:13'),
(846, 1, 1, 2, 'Cập nhật nhập kho ID: 4', '{\"id\":\"4\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"2\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-17 23:05:00\",\"datetime_expected\":\"2019-05-15 07:35:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"Thu h\\u1ed3i POC\",\"created_at\":\"2019-05-17 23:09:07\",\"updated_at\":\"2019-05-18 07:36:43\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 00:36:43'),
(847, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"datetime_expected\":\"2019-05-29 07:49:00\",\"other_doc\":null,\"handover_doc\":\"5cdd3202db631_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":0,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-18 07:49:33\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 00:49:33'),
(848, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"datetime_expected\":\"2019-05-29 07:49:00\",\"other_doc\":null,\"handover_doc\":\"5cdd3202db631_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-18 07:52:27\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 00:52:27'),
(849, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"datetime_expected\":\"2019-05-29 07:49:00\",\"other_doc\":null,\"handover_doc\":\"5cdd3202db631_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":0,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-18 07:52:33\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 00:52:33'),
(850, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"datetime_expected\":\"2019-05-29 07:49:00\",\"other_doc\":null,\"handover_doc\":\"5cdd3202db631_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-18 07:53:33\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 00:53:33'),
(851, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"datetime_expected\":\"2019-05-29 07:49:00\",\"other_doc\":null,\"handover_doc\":\"5cdd3202db631_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":0,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-18 07:53:37\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 00:53:37'),
(852, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"datetime_expected\":\"2019-05-29 07:49:00\",\"other_doc\":null,\"handover_doc\":\"5cdd3202db631_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-18 07:54:42\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 00:54:42'),
(853, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"datetime_expected\":\"2019-05-29 07:49:00\",\"other_doc\":null,\"handover_doc\":\"5cdd3202db631_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-18 07:54:44\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 00:54:44'),
(854, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-08 15:01:00\",\"datetime_expected\":\"2019-05-29 07:49:00\",\"other_doc\":null,\"handover_doc\":\"5cdd3202db631_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-18 07:54:48\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 00:54:48'),
(855, 1, 1, 2, 'Xác nhận nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-18 08:32:00\",\"datetime_expected\":\"2019-05-29 07:49:00\",\"other_doc\":null,\"handover_doc\":\"5cdd3202db631_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"\",\"note_confirm\":null,\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-18 08:32:53\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 01:32:53'),
(856, 1, 1, 2, 'Xác nhận nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"1\",\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-18 08:40:00\",\"datetime_expected\":\"2019-05-08 07:49:00\",\"other_doc\":null,\"handover_doc\":\"5cdd3202db631_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"\",\"note_confirm\":null,\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-18 08:40:56\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 01:40:56'),
(857, 1, 1, 2, 'Cập nhật nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-03 08:45:00\",\"other_doc\":null,\"handover_doc\":\"5cdaafd333b4f_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"\",\"note_confirm\":null,\"created_at\":\"2019-05-14 19:06:14\",\"updated_at\":\"2019-05-18 08:45:24\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 01:45:24'),
(858, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-10 08:45:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"\",\"note_confirm\":null,\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-18 08:45:33\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 01:45:33'),
(859, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-08 07:49:00\",\"other_doc\":null,\"handover_doc\":\"5cdd3202db631_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"note_confirm\":null,\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-18 08:46:12\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 01:46:12'),
(860, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-08 07:49:00\",\"other_doc\":null,\"handover_doc\":\"5cdd3202db631_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"note_confirm\":null,\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-18 08:46:34\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 01:46:34'),
(861, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-08 07:49:00\",\"other_doc\":null,\"handover_doc\":\"5cdd3202db631_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"note_confirm\":null,\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-18 08:46:36\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 01:46:36'),
(862, 1, 1, 2, 'Cập nhật nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-03 08:45:00\",\"other_doc\":null,\"handover_doc\":\"5cdaafd333b4f_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"\",\"note_confirm\":null,\"cancel_note\":null,\"created_at\":\"2019-05-14 19:06:14\",\"updated_at\":\"2019-05-18 09:07:35\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 02:07:35'),
(863, 1, 1, 2, 'Cập nhật nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-03 08:45:00\",\"other_doc\":null,\"handover_doc\":\"5cdaafd333b4f_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"note_confirm\":null,\"cancel_note\":null,\"created_at\":\"2019-05-14 19:06:14\",\"updated_at\":\"2019-05-18 09:07:38\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 02:07:38'),
(864, 1, 1, 2, 'Xác nhận nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"HNN19IN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":\"1\",\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-03 08:45:00\",\"other_doc\":null,\"handover_doc\":\"5cdaafd333b4f_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":3,\"note\":\"\",\"note_confirm\":null,\"cancel_note\":\"M\\u00f4 t\\u1ea3 h\\u1ee7y\",\"created_at\":\"2019-05-14 19:06:14\",\"updated_at\":\"2019-05-18 09:08:33\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 02:08:33'),
(865, 1, 1, 3, 'Xoá phiếu nhập kho có ID: 4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 02:34:23'),
(866, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-10 08:45:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"\",\"note_confirm\":null,\"cancel_note\":null,\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-18 10:35:02\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 03:35:02'),
(867, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-10 08:45:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"\",\"note_confirm\":null,\"cancel_note\":null,\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-18 10:49:34\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 03:49:34'),
(868, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-10 08:45:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"note_confirm\":null,\"cancel_note\":null,\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-18 10:49:36\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 03:49:36'),
(869, 1, 1, 2, 'Xác nhận nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"3\",\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-17 10:53:00\",\"datetime_expected\":\"2019-05-10 08:45:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"\",\"note_confirm\":null,\"cancel_note\":null,\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-18 10:55:25\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 03:55:25'),
(870, 1, 1, 2, 'Xác nhận nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"3\",\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-17 10:53:00\",\"datetime_expected\":\"2019-05-10 08:45:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"\",\"note_confirm\":null,\"cancel_note\":null,\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-18 11:00:58\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 04:00:58'),
(871, 1, 1, 2, 'Xác nhận nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"3\",\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-17 10:53:00\",\"datetime_expected\":\"2019-05-10 08:45:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"\",\"note_confirm\":null,\"cancel_note\":null,\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-18 11:02:37\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 04:02:37'),
(872, 1, 1, 2, 'Xác nhận nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"3\",\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-17 10:53:00\",\"datetime_expected\":\"2019-05-10 08:45:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"\",\"note_confirm\":null,\"cancel_note\":null,\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-18 11:03:46\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 04:03:46'),
(873, 1, 1, 2, 'Xác nhận nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"2\",\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-17 10:53:00\",\"datetime_expected\":\"2019-05-10 08:45:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"\",\"note_confirm\":null,\"cancel_note\":null,\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-18 11:04:55\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 04:04:55'),
(874, 1, 1, 2, 'Xác nhận nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"2\",\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-17 10:53:00\",\"datetime_expected\":\"2019-05-10 08:45:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"\",\"note_confirm\":null,\"cancel_note\":null,\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-18 11:06:34\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 04:06:34'),
(875, 1, 1, 2, 'Xác nhận nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"2\",\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-17 10:53:00\",\"datetime_expected\":\"2019-05-10 08:45:00\",\"other_doc\":\"[\\\"5cd939281121c_map-icon.png\\\"]\",\"handover_doc\":\"5cd93c5cd120e_logo_500x500.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"\",\"note_confirm\":null,\"cancel_note\":null,\"created_at\":\"2019-01-15 16:09:14\",\"updated_at\":\"2019-05-18 11:07:20\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 04:07:20'),
(876, 1, 1, 1, 'Thêm mới xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19EX0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-18 15:27:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-18 15:27:14\",\"updated_at\":\"2019-05-18 15:27:14\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-18 08:27:14'),
(877, 1, 1, 2, 'Cập nhật xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19EX0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-18 15:27:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-18 15:27:14\",\"updated_at\":\"2019-05-20 01:05:03\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-19 18:05:03'),
(878, 1, 1, 2, 'Cập nhật xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19EX0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-18 15:27:00\",\"other_doc\":null,\"handover_doc\":\"5ce19ada3b6f1_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-18 15:27:14\",\"updated_at\":\"2019-05-20 01:05:14\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-19 18:05:14'),
(879, 1, 1, 2, 'Xác nhận xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19EX0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":\"2\",\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-20 08:14:00\",\"datetime_expected\":\"2019-05-18 15:27:00\",\"other_doc\":null,\"handover_doc\":\"5ce19ada3b6f1_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-18 15:27:14\",\"updated_at\":\"2019-05-20 08:14:33\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 01:14:33'),
(880, 1, 1, 2, 'Xác nhận xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19EX0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":\"2\",\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-20 08:17:00\",\"datetime_expected\":\"2019-05-18 15:27:00\",\"other_doc\":null,\"handover_doc\":\"5ce19ada3b6f1_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-18 15:27:14\",\"updated_at\":\"2019-05-20 08:17:33\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 01:17:33'),
(881, 1, 1, 2, 'Xác nhận xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19EX0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":\"3\",\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-20 08:22:00\",\"datetime_expected\":\"2019-05-18 15:27:00\",\"other_doc\":null,\"handover_doc\":\"5ce19ada3b6f1_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-18 15:27:14\",\"updated_at\":\"2019-05-20 08:23:04\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 01:23:04'),
(882, 1, 1, 2, 'Xác nhận xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19EX0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":\"2\",\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-20 08:25:00\",\"datetime_expected\":\"2019-05-18 15:27:00\",\"other_doc\":null,\"handover_doc\":\"5ce19ada3b6f1_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-18 15:27:14\",\"updated_at\":\"2019-05-20 08:25:43\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 01:25:43'),
(883, 1, 1, 2, 'Xác nhận xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19EX0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":\"3\",\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-20 08:27:00\",\"datetime_expected\":\"2019-05-18 15:27:00\",\"other_doc\":null,\"handover_doc\":\"5ce19ada3b6f1_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-18 15:27:14\",\"updated_at\":\"2019-05-20 08:27:44\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 01:27:44'),
(884, 1, 1, 2, 'Cập nhật vị trí ID: 1', '{\"id\":\"1\",\"cat_id\":\"11\",\"class_id\":\"3\",\"name\":\"Accesspoint\",\"info\":\"\",\"status\":\"1\",\"note\":null,\"created_at\":\"2019-03-21 08:45:19\",\"updated_at\":\"2019-03-21 08:45:19\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 02:30:11'),
(885, 1, 1, 2, 'Xác nhận nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"HNN19IN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":\"11\",\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-20 09:36:00\",\"datetime_expected\":\"2019-05-08 07:49:00\",\"other_doc\":null,\"handover_doc\":\"5cdd3202db631_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-14 19:14:35\",\"updated_at\":\"2019-05-20 09:36:39\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 02:36:39'),
(886, 1, 1, 2, 'Cập nhật nhập kho ID: 4', '{\"id\":\"4\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-15 07:35:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"Thu h\\u1ed3i POC\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-17 23:09:07\",\"updated_at\":\"2019-05-20 12:17:38\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 05:17:38'),
(887, 1, 1, 2, 'Cập nhật nhập kho ID: 4', '{\"id\":\"4\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-15 07:35:00\",\"other_doc\":null,\"handover_doc\":\"5ce2389ddedb3_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"Thu h\\u1ed3i POC\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-17 23:09:07\",\"updated_at\":\"2019-05-20 12:18:21\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 05:18:21'),
(888, 1, 1, 2, 'Xác nhận nhập kho ID: 4', '{\"id\":\"4\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":\"2\",\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-20 12:41:00\",\"datetime_expected\":\"2019-05-15 07:35:00\",\"other_doc\":null,\"handover_doc\":\"5ce2389ddedb3_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"Thu h\\u1ed3i POC\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-17 23:09:07\",\"updated_at\":\"2019-05-20 12:42:05\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 05:42:05');
INSERT INTO `log_history` (`id`, `user_id`, `page`, `type`, `name`, `detail`, `ip`, `device`, `created_at`) VALUES
(889, 1, 1, 2, 'Xác nhận nhập kho ID: 4', '{\"id\":\"4\",\"code\":\"HNN19IN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":\"12\",\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-20 12:44:00\",\"datetime_expected\":\"2019-05-15 07:35:00\",\"other_doc\":null,\"handover_doc\":\"5ce2389ddedb3_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"Thu h\\u1ed3i POC\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-17 23:09:07\",\"updated_at\":\"2019-05-20 12:44:33\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 05:44:33'),
(890, 1, 1, 1, 'Thêm mới nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-20 12:49:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-20 12:49:50\",\"updated_at\":\"2019-05-20 12:49:50\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 05:49:50'),
(891, 1, 1, 1, 'Thêm mới nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-20 12:56:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"abc\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-20 12:56:29\",\"updated_at\":\"2019-05-20 12:56:29\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 05:56:29'),
(892, 1, 1, 1, 'Thêm mới nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-20 12:57:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"aaaaaaaa\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-20 12:57:37\",\"updated_at\":\"2019-05-20 12:57:37\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 05:57:37'),
(893, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-20 12:57:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-20 12:57:37\",\"updated_at\":\"2019-05-20 12:58:15\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 05:58:15'),
(894, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-20 12:57:00\",\"other_doc\":null,\"handover_doc\":\"5ce2420193886_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-20 12:57:37\",\"updated_at\":\"2019-05-20 12:58:25\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 05:58:25'),
(895, 1, 1, 2, 'Xác nhận nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19IN0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"10\",\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-20 12:58:00\",\"datetime_expected\":\"2019-05-20 12:57:00\",\"other_doc\":null,\"handover_doc\":\"5ce2420193886_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-20 12:57:37\",\"updated_at\":\"2019-05-20 12:58:37\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 05:58:37'),
(896, 1, 1, 1, 'Thêm mới xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19EX0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-20 13:09:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"AAAAAAA\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-20 13:10:03\",\"updated_at\":\"2019-05-20 13:10:03\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 06:10:03'),
(897, 1, 1, 2, 'Cập nhật xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19EX0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-20 13:09:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-20 13:10:03\",\"updated_at\":\"2019-05-20 13:10:19\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 06:10:19'),
(898, 1, 1, 2, 'Cập nhật xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19EX0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-20 13:09:00\",\"other_doc\":null,\"handover_doc\":\"5ce244debcef4_laos.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-20 13:10:03\",\"updated_at\":\"2019-05-20 13:10:38\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 06:10:38'),
(899, 1, 1, 2, 'Xác nhận xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"HNN19EX0010000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":\"11\",\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-20 13:10:00\",\"datetime_expected\":\"2019-05-20 13:09:00\",\"other_doc\":null,\"handover_doc\":\"5ce244debcef4_laos.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-20 13:10:03\",\"updated_at\":\"2019-05-20 13:10:51\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 06:10:51'),
(900, 1, 1, 1, 'Thêm mới nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"HNN19IN0010000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-20 18:05:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"aaa\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-20 18:05:27\",\"updated_at\":\"2019-05-20 18:05:27\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-20 11:05:27'),
(901, 1, 1, 2, 'Cập nhật vị trí ID: 6', '{\"id\":\"6\",\"cat_id\":\"7\",\"name\":\"Ph\\u1ee5 ki\\u1ec7n\",\"status\":\"1\",\"note\":\"\",\"created_at\":null,\"updated_at\":null}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-21 00:57:32'),
(902, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-21 02:19:06'),
(903, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-21 02:19:18'),
(904, 1, 1, 2, 'Cập nhật danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"1\",\"name\":\"Gi\\u00e1m \\u0110\\u1ed1c A\",\"abbreviation\":\"\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-03-21 08:44:03\",\"updated_at\":\"2019-05-21 10:09:30\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-21 03:09:30'),
(905, 1, 1, 2, 'Cập nhật danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"1\",\"name\":\"Gi\\u00e1m \\u0110\\u1ed1c A\",\"abbreviation\":\"GD\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-03-21 08:44:03\",\"updated_at\":\"2019-05-21 10:09:38\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-21 03:09:38'),
(906, 1, 1, 2, 'Cập nhật danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"1\",\"name\":\"Gi\\u00e1m \\u0110\\u1ed1c A\",\"abbreviation\":\"GD\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-03-21 08:44:03\",\"updated_at\":\"2019-05-21 10:13:49\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-21 03:13:49'),
(907, 1, 1, 1, 'Thêm mới danh mục ID: 6', '{\"id\":\"6\",\"cat_id\":\"1\",\"name\":\"B\\u1ed9 ph\\u1eadn Kinh T\\u1ebf\",\"abbreviation\":\"KT\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-05-21 10:14:04\",\"updated_at\":\"2019-05-21 10:14:04\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-21 03:14:04'),
(908, 1, 1, 2, 'Cập nhật danh mục ID: 6', '{\"id\":\"6\",\"cat_id\":\"1\",\"name\":\"Nh\\u00e2n vi\\u00ean\",\"abbreviation\":\"NV\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-05-21 10:14:04\",\"updated_at\":\"2019-05-21 10:14:22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-21 03:14:22'),
(909, 1, 1, 2, 'Cập nhật danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"11\",\"class_id\":\"3\",\"name\":\"Accesspoint\",\"abbreviation\":\"\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-03-21 08:45:19\",\"updated_at\":\"2019-05-21 10:32:15\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-21 03:32:15'),
(910, 1, 1, 2, 'Cập nhật danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"11\",\"class_id\":\"3\",\"name\":\"Accesspoint\",\"abbreviation\":\"ACP\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-03-21 08:45:19\",\"updated_at\":\"2019-05-21 10:32:22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-21 03:32:22'),
(911, 1, 1, 2, 'Cập nhật danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"9\",\"name\":\"Nh\\u00e0 cung c\\u1ea5p 1\",\"address\":\"135B, Tr\\u1ea7n H\\u01b0ng \\u0110\\u1ea1o, P. B\\u1ebfn Ngh\\u00e9, Qu\\u1eadn 1\",\"phone\":\"03265489956\",\"email\":\"cy1@gmail.com\",\"website\":\"https:\\/\\/congty1.com\",\"mstdn\":\"21354645632123\",\"career\":\"Bu\\u00f4n b\\u00e1n \\u00f4 t\\u00f4\",\"description\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-21 08:46:15\",\"updated_at\":\"2019-05-21 10:35:48\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-21 03:35:48'),
(912, 1, 1, 1, 'Thêm mới danh mục ID: 7', '{\"id\":\"7\",\"cat_id\":\"11\",\"class_id\":\"6\",\"name\":\"Ngu\\u1ed3n\",\"abbreviation\":\"ADT\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-05-21 10:43:59\",\"updated_at\":\"2019-05-21 10:43:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-21 03:43:59'),
(913, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:04:38'),
(914, 1, 1, 2, 'Cập nhật danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"4\",\"name\":\"Vi\\u1ec7t Nam \\u0111\\u1ed3ng \",\"abbreviation\":\"VND\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-03-21 08:42:12\",\"updated_at\":\"2019-05-21 12:05:20\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:05:20'),
(915, 1, 1, 2, 'Cập nhật danh mục ID: 2', '{\"id\":\"2\",\"cat_id\":\"4\",\"name\":\"Dollar M\\u1ef9 \",\"abbreviation\":\"USD\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-04-03 05:58:05\",\"updated_at\":\"2019-05-21 12:06:03\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:06:03'),
(916, 1, 1, 1, 'Thêm mới danh mục ID: 7', '{\"id\":\"7\",\"cat_id\":\"5\",\"name\":\"\\u0110\\u00e0i Loan \",\"abbreviation\":\"DL\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-05-21 12:06:34\",\"updated_at\":\"2019-05-21 12:06:34\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:06:34'),
(917, 1, 1, 2, 'Cập nhật danh mục ID: 7', '{\"id\":\"7\",\"cat_id\":\"5\",\"name\":\"\\u0110\\u00e0i Loan \",\"abbreviation\":\"TW\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-05-21 12:06:34\",\"updated_at\":\"2019-05-21 12:07:19\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:07:19'),
(918, 1, 1, 2, 'Cập nhật danh mục ID: 3', '{\"id\":\"3\",\"cat_id\":\"7\",\"abbreviation\":\"\",\"name\":\"Thi\\u1ebft b\\u1ecb m\\u1ea1ng\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-04-03 06:24:09\",\"updated_at\":\"2019-05-21 12:07:44\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:07:44'),
(919, 1, 1, 2, 'Cập nhật danh mục ID: 7', '{\"id\":\"7\",\"cat_id\":\"11\",\"class_id\":\"6\",\"name\":\"Ngu\\u1ed3n Adapter \",\"abbreviation\":\"ADT\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-05-21 10:43:59\",\"updated_at\":\"2019-05-21 12:09:13\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:09:13'),
(920, 1, 1, 1, 'Thêm mới danh mục ID: 8', '{\"id\":\"8\",\"cat_id\":\"11\",\"class_id\":\"6\",\"name\":\"Ngu\\u1ed3n PoE\",\"abbreviation\":\"\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-05-21 12:09:38\",\"updated_at\":\"2019-05-21 12:09:38\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:09:38'),
(921, 1, 1, 2, 'Cập nhật danh mục ID: 8', '{\"id\":\"8\",\"cat_id\":\"11\",\"class_id\":\"6\",\"name\":\"Ngu\\u1ed3n PoE\",\"abbreviation\":\"PoE\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-05-21 12:09:38\",\"updated_at\":\"2019-05-21 12:09:49\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:09:49'),
(922, 1, 1, 1, 'Thêm mới danh mục ID: 6', '{\"id\":\"6\",\"cat_id\":\"8\",\"name\":\"B\\u1ed9\",\"abbreviation\":\"\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-05-21 12:11:18\",\"updated_at\":\"2019-05-21 12:11:18\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:11:18'),
(923, 1, 1, 1, 'Thêm mới danh mục ID: 9', '{\"id\":\"9\",\"cat_id\":\"11\",\"class_id\":\"6\",\"name\":\"Anten outdoor\",\"abbreviation\":\"\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-05-21 12:30:18\",\"updated_at\":\"2019-05-21 12:30:18\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:30:18'),
(924, 1, 1, 2, 'Cập nhật danh mục ID: 9', '{\"id\":\"9\",\"cat_id\":\"11\",\"class_id\":\"6\",\"name\":\"Anten outdoor\",\"abbreviation\":\"AT\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-05-21 12:30:18\",\"updated_at\":\"2019-05-21 12:31:14\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:31:14'),
(925, 1, 1, 2, 'Cập nhật danh mục ID: 6', '{\"id\":\"6\",\"cat_id\":\"11\",\"class_id\":\"6\",\"name\":\"Anten indoor\",\"abbreviation\":\"ATi\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-04-03 08:16:09\",\"updated_at\":\"2019-05-21 12:34:59\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:34:59'),
(926, 1, 1, 2, 'Cập nhật danh mục ID: 9', '{\"id\":\"9\",\"cat_id\":\"11\",\"class_id\":\"6\",\"name\":\"Anten outdoor\",\"abbreviation\":\"ATo\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-05-21 12:30:18\",\"updated_at\":\"2019-05-21 12:35:10\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:35:10'),
(927, 1, 1, 2, 'Cập nhật danh mục ID: 6', '{\"id\":\"6\",\"cat_id\":\"11\",\"class_id\":\"6\",\"name\":\"Anten indoor\",\"abbreviation\":\"ATI\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-04-03 08:16:09\",\"updated_at\":\"2019-05-21 12:40:50\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:40:50'),
(928, 1, 1, 2, 'Cập nhật danh mục ID: 9', '{\"id\":\"9\",\"cat_id\":\"11\",\"class_id\":\"6\",\"name\":\"Anten outdoor\",\"abbreviation\":\"ATO\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-05-21 12:30:18\",\"updated_at\":\"2019-05-21 12:40:57\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:40:57'),
(929, 1, 1, 2, 'Cập nhật danh mục ID: 8', '{\"id\":\"8\",\"cat_id\":\"11\",\"class_id\":\"6\",\"name\":\"Ngu\\u1ed3n PoE\",\"abbreviation\":\"POE\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-05-21 12:09:38\",\"updated_at\":\"2019-05-21 12:41:20\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:41:20'),
(930, 1, 1, 2, 'Cập nhật danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"11\",\"class_id\":\"3\",\"name\":\"Accesspoint\",\"abbreviation\":\"AP\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-03-21 08:45:19\",\"updated_at\":\"2019-05-21 12:41:52\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:41:52'),
(931, 1, 1, 2, 'Cập nhật danh mục ID: 4', '{\"id\":\"4\",\"cat_id\":\"11\",\"class_id\":\"3\",\"name\":\"PC Getway\",\"abbreviation\":\"PCG\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-04-03 06:01:52\",\"updated_at\":\"2019-05-21 12:42:05\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:42:05'),
(932, 1, 1, 2, 'Cập nhật danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"11\",\"class_id\":\"3\",\"name\":\"Accesspoint\",\"abbreviation\":\"APS\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-03-21 08:45:19\",\"updated_at\":\"2019-05-21 12:42:30\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:42:30'),
(933, 1, 1, 2, 'Cập nhật danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"11\",\"class_id\":\"3\",\"name\":\"Access point\",\"abbreviation\":\"APS\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-03-21 08:45:19\",\"updated_at\":\"2019-05-21 12:42:45\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:42:45'),
(934, 1, 1, 2, 'Cập nhật danh mục ID: 4', '{\"id\":\"4\",\"cat_id\":\"11\",\"class_id\":\"3\",\"name\":\"PC Gateway\",\"abbreviation\":\"PCG\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-04-03 06:01:52\",\"updated_at\":\"2019-05-21 12:43:01\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:43:01'),
(935, 1, 1, 2, 'Cập nhật danh mục ID: 3', '{\"id\":\"3\",\"cat_id\":\"11\",\"class_id\":\"3\",\"name\":\"Router\",\"abbreviation\":\"RTS\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-04-03 06:01:34\",\"updated_at\":\"2019-05-21 12:43:15\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:43:15'),
(936, 1, 1, 2, 'Cập nhật danh mục ID: 2', '{\"id\":\"2\",\"cat_id\":\"11\",\"class_id\":\"3\",\"name\":\"Switch\",\"abbreviation\":\"SWS\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-04-03 06:01:05\",\"updated_at\":\"2019-05-21 12:43:29\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:43:29'),
(937, 1, 1, 2, 'Cập nhật danh mục ID: 10', '{\"id\":\"10\",\"cat_id\":\"10\",\"name\":\"Compex INC\",\"abbreviation\":\"\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-04-03 08:25:55\",\"updated_at\":\"2019-05-21 12:44:44\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:44:44'),
(938, 1, 1, 2, 'Cập nhật danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"10\",\"name\":\"Alpha INC\",\"abbreviation\":\"\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-03-21 08:44:46\",\"updated_at\":\"2019-05-21 12:45:41\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:45:41'),
(939, 1, 1, 1, 'Thêm mới danh mục ID: 11', '{\"id\":\"11\",\"cat_id\":\"10\",\"name\":\"BUFFALO\",\"abbreviation\":\"\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-05-21 12:50:34\",\"updated_at\":\"2019-05-21 12:50:34\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 05:50:34'),
(940, 1, 1, 1, 'Thêm mới nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-21 15:42:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-21 15:42:24\",\"updated_at\":\"2019-05-21 15:42:24\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-21 08:42:24'),
(941, 1, 1, 1, 'Thêm mới nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"19HNNIN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-21 15:42:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-21 15:43:14\",\"updated_at\":\"2019-05-21 15:43:14\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-21 08:43:14'),
(942, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36', '2019-05-21 09:37:08'),
(943, 1, 1, 1, 'Thêm mới nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-23 08:01:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-23 08:02:01\",\"updated_at\":\"2019-05-23 08:02:01\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-23 01:02:01'),
(944, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-23 08:01:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-23 08:02:01\",\"updated_at\":\"2019-05-23 08:40:12\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-23 01:40:12'),
(945, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-23 08:01:00\",\"other_doc\":null,\"handover_doc\":\"5ce611f594678_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-23 08:02:01\",\"updated_at\":\"2019-05-23 10:22:29\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-23 03:22:29'),
(946, 1, 1, 2, 'Xác nhận nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"10\",\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-23 15:05:00\",\"datetime_expected\":\"2019-05-23 08:01:00\",\"other_doc\":null,\"handover_doc\":\"5ce611f594678_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-23 08:02:01\",\"updated_at\":\"2019-05-23 15:05:34\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-23 08:05:34'),
(947, 1, 1, 2, 'Xác nhận nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"2\",\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-23 15:07:00\",\"datetime_expected\":\"2019-05-23 08:01:00\",\"other_doc\":null,\"handover_doc\":\"5ce611f594678_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-23 08:02:01\",\"updated_at\":\"2019-05-23 15:07:42\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-23 08:07:42'),
(948, 1, 1, 2, 'Xác nhận nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"2\",\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-23 15:13:00\",\"datetime_expected\":\"2019-05-23 08:01:00\",\"other_doc\":null,\"handover_doc\":\"5ce611f594678_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-23 08:02:01\",\"updated_at\":\"2019-05-23 15:13:12\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-23 08:13:12'),
(949, 1, 1, 2, 'Xác nhận nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"2\",\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-23 15:19:00\",\"datetime_expected\":\"2019-05-23 08:01:00\",\"other_doc\":null,\"handover_doc\":\"5ce611f594678_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-23 08:02:01\",\"updated_at\":\"2019-05-23 15:19:32\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-23 08:19:32'),
(950, 1, 1, 2, 'Xác nhận nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"3\",\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-23 15:19:00\",\"datetime_expected\":\"2019-05-23 08:01:00\",\"other_doc\":null,\"handover_doc\":\"5ce611f594678_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-23 08:02:01\",\"updated_at\":\"2019-05-23 15:22:24\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-23 08:22:24'),
(951, 1, 1, 2, 'Xác nhận nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"3\",\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-23 15:19:00\",\"datetime_expected\":\"2019-05-23 08:01:00\",\"other_doc\":null,\"handover_doc\":\"5ce611f594678_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-23 08:02:01\",\"updated_at\":\"2019-05-23 15:24:48\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-23 08:24:48'),
(952, 1, 1, 2, 'Xác nhận nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"2\",\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-23 15:19:00\",\"datetime_expected\":\"2019-05-23 08:01:00\",\"other_doc\":null,\"handover_doc\":\"5ce611f594678_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-23 08:02:01\",\"updated_at\":\"2019-05-23 15:25:50\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-23 08:25:50'),
(953, 1, 1, 2, 'Xác nhận nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"2\",\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-23 15:19:00\",\"datetime_expected\":\"2019-05-23 08:01:00\",\"other_doc\":null,\"handover_doc\":\"5ce611f594678_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-23 08:02:01\",\"updated_at\":\"2019-05-23 15:35:17\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-23 08:35:17'),
(954, 1, 1, 2, 'Xác nhận nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"2\",\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-23 15:19:00\",\"datetime_expected\":\"2019-05-23 08:01:00\",\"other_doc\":null,\"handover_doc\":\"5ce611f594678_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-23 08:02:01\",\"updated_at\":\"2019-05-23 15:36:22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-23 08:36:22'),
(955, 1, 1, 2, 'Xác nhận nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"3\",\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-23 15:19:00\",\"datetime_expected\":\"2019-05-23 08:01:00\",\"other_doc\":null,\"handover_doc\":\"5ce611f594678_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-23 08:02:01\",\"updated_at\":\"2019-05-23 16:03:05\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-23 09:03:05'),
(956, 1, 1, 2, 'Xác nhận nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"2\",\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-23 15:19:00\",\"datetime_expected\":\"2019-05-23 08:01:00\",\"other_doc\":null,\"handover_doc\":\"5ce611f594678_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-23 08:02:01\",\"updated_at\":\"2019-05-23 16:12:16\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-23 09:12:16'),
(957, 1, 1, 2, 'Xác nhận nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":\"3\",\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":\"2019-05-23 15:19:00\",\"datetime_expected\":\"2019-05-23 08:01:00\",\"other_doc\":null,\"handover_doc\":\"5ce611f594678_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":2,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-23 08:02:01\",\"updated_at\":\"2019-05-23 16:17:52\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-23 09:17:52'),
(958, 1, 1, 1, 'Thêm mới nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"19HNNIN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-24 12:46:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-24 12:46:39\",\"updated_at\":\"2019-05-24 12:46:39\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-24 05:46:39'),
(959, 1, 1, 2, 'Cập nhật nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"19HNNIN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-24 12:46:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-24 12:46:39\",\"updated_at\":\"2019-05-24 12:47:35\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-24 05:47:35'),
(960, 1, 1, 2, 'Cập nhật nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"19HNNIN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-24 12:46:00\",\"other_doc\":null,\"handover_doc\":\"5ce785898a594_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-24 12:46:39\",\"updated_at\":\"2019-05-24 12:47:53\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-24 05:47:53'),
(961, 1, 1, 1, 'Thêm mới xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNEX0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-25 11:00:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-25 11:00:45\",\"updated_at\":\"2019-05-25 11:00:45\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-25 04:00:45'),
(962, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-27 01:16:47'),
(963, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-27 01:17:02'),
(964, 1, 1, 1, 'Thêm mới nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-27 16:48:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-27 16:48:34\",\"updated_at\":\"2019-05-27 16:48:34\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-27 09:48:34'),
(965, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-27 16:48:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-27 16:48:34\",\"updated_at\":\"2019-05-28 08:12:49\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-28 01:12:49'),
(966, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-27 16:48:00\",\"other_doc\":null,\"handover_doc\":\"5cec8b33cc8eb_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-27 16:48:34\",\"updated_at\":\"2019-05-28 08:13:23\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-28 01:13:23'),
(967, 1, 1, 1, 'Thêm mới nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"19HNNIN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-28 09:04:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"1\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-28 09:04:27\",\"updated_at\":\"2019-05-28 09:04:27\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-28 02:04:27'),
(968, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-28 07:30:21'),
(969, 1, 1, 2, 'Cập nhật nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"19HNNIN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-28 09:04:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"1\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-28 09:04:27\",\"updated_at\":\"2019-05-28 14:30:39\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-28 07:30:39'),
(970, 1, 1, 2, 'Cập nhật nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"19HNNIN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-28 09:04:00\",\"other_doc\":null,\"handover_doc\":\"5cece3a7d18fd_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"1\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-28 09:04:27\",\"updated_at\":\"2019-05-28 14:30:47\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-28 07:30:47'),
(971, 1, 1, 1, 'Thêm mới nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"19HNNIN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-28 18:14:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"AAAAAAAA\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-28 18:14:25\",\"updated_at\":\"2019-05-28 18:14:25\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-28 11:14:25'),
(972, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"19HNNIN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-28 18:14:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"AAAAAAAA\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-28 18:14:25\",\"updated_at\":\"2019-05-28 18:23:58\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-28 11:23:59'),
(973, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"19HNNIN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-28 18:14:00\",\"other_doc\":null,\"handover_doc\":\"5ced1a5da3783_logo_vnu_ver_end_3.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"AAAAAAAA\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-28 18:14:25\",\"updated_at\":\"2019-05-28 18:24:13\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-28 11:24:13'),
(974, 1, 1, 1, 'Thêm mới xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNEX0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-29 08:03:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"1\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-29 08:04:00\",\"updated_at\":\"2019-05-29 08:04:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-29 01:04:00');
INSERT INTO `log_history` (`id`, `user_id`, `page`, `type`, `name`, `detail`, `ip`, `device`, `created_at`) VALUES
(975, 1, 1, 1, 'Thêm mới danh mục ID: 3', '{\"id\":\"3\",\"cat_id\":\"9\",\"name\":\"a\",\"address\":\"1\",\"phone\":\"122\",\"email\":\"1\",\"website\":\"1\",\"mstdn\":\"1\",\"career\":\"1\",\"description\":null,\"status\":\"1\",\"created_at\":\"2019-05-29 09:00:14\",\"updated_at\":\"2019-05-29 09:00:14\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-29 02:00:14'),
(976, 1, 1, 1, 'Thêm mới nhập kho ID: 4', '{\"id\":\"4\",\"code\":\"19HNNIN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"3\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-29 09:14:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"a\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-29 09:14:10\",\"updated_at\":\"2019-05-29 09:14:10\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-29 02:14:10'),
(977, 1, 1, 2, 'Cập nhật nhập kho ID: 4', '{\"id\":\"4\",\"code\":\"19HNNIN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"3\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-29 09:14:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"a\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-29 09:14:10\",\"updated_at\":\"2019-05-29 09:49:22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-29 02:49:22'),
(978, 1, 1, 2, 'Cập nhật nhập kho ID: 4', '{\"id\":\"4\",\"code\":\"19HNNIN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"3\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-29 09:14:00\",\"other_doc\":null,\"handover_doc\":\"5cedf3376dd72_blitezone-logo.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"a\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-29 09:14:10\",\"updated_at\":\"2019-05-29 09:49:27\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-29 02:49:27'),
(979, 1, 1, 2, 'Cập nhật nhập kho ID: 4', '{\"id\":\"4\",\"code\":\"19HNNIN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"3\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-29 09:14:00\",\"other_doc\":null,\"handover_doc\":\"5cedf3376dd72_blitezone-logo.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"a\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-29 09:14:10\",\"updated_at\":\"2019-05-29 10:02:30\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-29 03:02:30'),
(980, 1, 1, 2, 'Cập nhật nhập kho ID: 4', '{\"id\":\"4\",\"code\":\"19HNNIN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"3\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-29 09:14:00\",\"other_doc\":null,\"handover_doc\":\"5cedf3376dd72_blitezone-logo.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"a\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-29 09:14:10\",\"updated_at\":\"2019-05-29 10:02:45\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-29 03:02:46'),
(981, 1, 1, 2, 'Cập nhật nhập kho ID: 4', '{\"id\":\"4\",\"code\":\"19HNNIN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"3\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-29 09:14:00\",\"other_doc\":null,\"handover_doc\":\"5cedf3376dd72_blitezone-logo.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"a\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-29 09:14:10\",\"updated_at\":\"2019-05-29 10:02:53\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-29 03:02:53'),
(982, 1, 1, 2, 'Cập nhật nhập kho ID: 4', '{\"id\":\"4\",\"code\":\"19HNNIN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"3\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-29 09:14:00\",\"other_doc\":null,\"handover_doc\":\"5cedf3376dd72_blitezone-logo.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"a\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-29 09:14:10\",\"updated_at\":\"2019-05-29 10:02:55\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-29 03:02:55'),
(983, 1, 1, 2, 'Cập nhật nhập kho ID: 4', '{\"id\":\"4\",\"code\":\"19HNNIN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"3\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-29 09:14:00\",\"other_doc\":null,\"handover_doc\":\"5cedf3376dd72_blitezone-logo.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"a\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-29 09:14:10\",\"updated_at\":\"2019-05-29 10:09:58\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-29 03:09:58'),
(984, 1, 1, 2, 'Cập nhật nhập kho ID: 4', '{\"id\":\"4\",\"code\":\"19HNNIN0000004\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"3\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-29 09:14:00\",\"other_doc\":null,\"handover_doc\":\"5cedf3376dd72_blitezone-logo.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"a\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-29 09:14:10\",\"updated_at\":\"2019-05-29 10:10:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-29 03:10:00'),
(985, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-29 05:30:54'),
(986, 1, 1, 2, 'Cập nhật xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNEX0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-29 08:03:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"1\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-29 08:04:00\",\"updated_at\":\"2019-05-29 14:56:18\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-29 07:56:18'),
(987, 1, 1, 2, 'Cập nhật xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNEX0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-29 08:03:00\",\"other_doc_ex\":null,\"handover_doc_ex\":\"5cee43ac3e76e_blitezone-logo.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"1\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-29 08:04:00\",\"updated_at\":\"2019-05-29 15:32:44\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-29 08:32:44'),
(988, 1, 1, 1, 'Thêm mới xuất kho ID: 2', '{\"id\":\"2\",\"code\":\"19HNNEX0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"3\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-29 15:33:00\",\"other_doc_ex\":null,\"handover_doc_ex\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-29 15:34:27\",\"updated_at\":\"2019-05-29 15:34:27\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-29 08:34:27'),
(989, 1, 1, 2, 'Cập nhật xuất kho ID: 2', '{\"id\":\"2\",\"code\":\"19HNNEX0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"3\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-29 15:33:00\",\"other_doc_ex\":null,\"handover_doc_ex\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-29 15:34:27\",\"updated_at\":\"2019-05-29 17:41:32\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-29 10:41:32'),
(990, 1, 1, 2, 'Cập nhật xuất kho ID: 2', '{\"id\":\"2\",\"code\":\"19HNNEX0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"3\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-29 15:33:00\",\"other_doc_ex\":null,\"handover_doc_ex\":\"5cee61e39f594_blitezone-logo.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-29 15:34:27\",\"updated_at\":\"2019-05-29 17:41:39\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.108 Chrome/73.0.3683.108 Safari/537.36', '2019-05-29 10:41:39'),
(991, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-30 01:09:49'),
(992, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-30 07:30:30'),
(993, 1, 1, 1, 'Thêm mới nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"3\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-30 14:53:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-30 14:53:13\",\"updated_at\":\"2019-05-30 14:53:13\",\"is_delete\":null}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-30 07:53:13'),
(994, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"3\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-30 14:53:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-30 14:53:13\",\"updated_at\":\"2019-05-30 15:14:14\",\"is_delete\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-30 08:14:14'),
(995, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"3\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-30 14:53:00\",\"other_doc\":null,\"handover_doc\":\"5cef90de3b9bf_logo.png\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-30 14:53:13\",\"updated_at\":\"2019-05-30 15:14:22\",\"is_delete\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-30 08:14:22'),
(996, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-30 08:58:59'),
(997, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-30 11:29:55'),
(998, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 03:51:09'),
(999, 1, 1, 2, 'Cập nhật khách hàng ID: 1', '{\"id\":\"1\",\"code\":\"001`\",\"name\":\"B\",\"type\":\"1\",\"address\":\"C\",\"phone\":\"E\",\"email\":\"d@gmail.com\",\"note\":\"F\",\"status\":\"1\",\"created_at\":\"2019-05-09 20:42:22\",\"updated_at\":\"2019-05-31 10:51:36\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 03:51:36'),
(1000, 1, 1, 2, 'Cập nhật khách hàng ID: 1', '{\"id\":\"1\",\"code\":\"001`\",\"name\":\"FPT\",\"type\":\"2\",\"address\":\"C\",\"phone\":\"E\",\"email\":\"d@gmail.com\",\"note\":\"F\",\"status\":\"1\",\"created_at\":\"2019-05-09 20:42:22\",\"updated_at\":\"2019-05-31 10:52:51\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 03:52:51'),
(1001, 1, 1, 2, 'Cập nhật khách hàng ID: 1', '{\"id\":\"1\",\"code\":\"001`\",\"name\":\"FPT\",\"type\":\"1\",\"address\":\"C\",\"phone\":\"E\",\"email\":\"d@gmail.com\",\"note\":\"F\",\"status\":\"1\",\"created_at\":\"2019-05-09 20:42:22\",\"updated_at\":\"2019-05-31 10:53:01\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 03:53:01'),
(1002, 1, 1, 1, 'Thêm mới khách hàng ID: 2', '{\"id\":\"2\",\"code\":\"002\",\"name\":\"VNPT\",\"type\":\"2\",\"address\":\"c\",\"phone\":\"01222827346\",\"email\":\"VNPT@gmail.com\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-05-31 10:53:49\",\"updated_at\":\"2019-05-31 10:53:49\",\"is_delete\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 03:53:49'),
(1003, 1, 1, 1, 'Thêm mới khách hàng ID: 3', '{\"id\":\"3\",\"code\":\"003\",\"name\":\"HTC\",\"type\":\"2\",\"address\":\"c\",\"phone\":\"01222827346\",\"email\":\"HTC@gmail.com\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-05-31 10:54:31\",\"updated_at\":\"2019-05-31 10:54:31\",\"is_delete\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 03:54:31'),
(1004, 1, 1, 1, 'Thêm mới khách hàng ID: 4', '{\"id\":\"4\",\"code\":\"004\",\"name\":\"VNU\",\"type\":\"2\",\"address\":\"c\",\"phone\":\"01222827346\",\"email\":\"VNU@gmail.com\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-05-31 11:00:33\",\"updated_at\":\"2019-05-31 11:00:33\",\"is_delete\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 04:00:33'),
(1005, 1, 1, 2, 'Cập nhật khách hàng ID: 3', '{\"id\":\"3\",\"code\":\"003\",\"name\":\"HTC\",\"type\":\"3\",\"address\":\"c\",\"phone\":\"01222827346\",\"email\":\"HTC@gmail.com\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-05-31 10:54:31\",\"updated_at\":\"2019-05-31 11:01:37\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 04:01:37'),
(1006, 1, 1, 2, 'Cập nhật khách hàng ID: 2', '{\"id\":\"2\",\"code\":\"002\",\"name\":\"VNPT\",\"type\":\"1\",\"address\":\"c\",\"phone\":\"01222827346\",\"email\":\"VNPT@gmail.com\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-05-31 10:53:49\",\"updated_at\":\"2019-05-31 11:01:50\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 04:01:50'),
(1007, 1, 1, 2, 'Cập nhật nhân viên ID: 11', '{\"id\":\"11\",\"code\":\"NV00009\",\"name\":\"Hu\\u1ef3nh \\u0110\\u1eafc Nh\\u00e2n\",\"dept_id\":\"25\",\"position_id\":\"6\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 11:02:52\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 04:02:52'),
(1008, 1, 1, 2, 'Cập nhật nhân viên ID: 3', '{\"id\":\"3\",\"code\":\"NV00008\",\"name\":\"Ng\\u00f4 Ho\\u00e0ng H\\u1ea3i\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 11:15:14\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 04:15:14'),
(1009, 1, 1, 2, 'Cập nhật nhân viên ID: 13', '{\"id\":\"13\",\"code\":\"NV00007\",\"name\":\"Ph\\u1ea1m Ti\\u1ebfn S\\u0129\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 11:16:16\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 04:16:16'),
(1010, 1, 1, 2, 'Cập nhật nhân viên ID: 11', '{\"id\":\"11\",\"code\":\"NV00009\",\"name\":\"Hu\\u1ef3nh \\u0110\\u1eafc Nh\\u00e2n\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 11:16:28\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 04:16:28'),
(1011, 1, 1, 2, 'Cập nhật nhân viên ID: 10', '{\"id\":\"10\",\"code\":\"NV00010\",\"name\":\"Th\\u00e1i Ho\\u00e0ng Nam\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 11:16:55\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 04:16:56'),
(1012, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 05:52:33'),
(1013, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Linux; Android 9; SM-J610F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Mobile Safari/537.36', '2019-05-31 05:55:35'),
(1014, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:67.0) Gecko/20100101 Firefox/67.0', '2019-05-31 06:00:36'),
(1015, 1, 1, 2, 'Cập nhật nhân viên ID: 16', '{\"id\":\"16\",\"code\":\"NV12345\",\"name\":\"Nguy\\u1ec5n \\u0110\\u1eb7ng Thanh Duy\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 16:02:15\",\"updated_at\":\"2019-05-31 13:06:44\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:06:44'),
(1016, 1, 1, 2, 'Cập nhật nhân viên ID: 14', '{\"id\":\"14\",\"code\":\"NV00005\",\"name\":\"Nguy\\u1ec5n Th\\u00e0nh Ph\\u00e1t \",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 13:07:12\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:07:12'),
(1017, 1, 1, 2, 'Cập nhật nhân viên ID: 12', '{\"id\":\"12\",\"code\":\"NV00004\",\"name\":\"Tr\\u1ecbnh Minh \\u0110\\u1ee9c\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 13:07:39\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:07:39'),
(1018, 1, 1, 2, 'Cập nhật nhân viên ID: 1', '{\"id\":\"1\",\"code\":\"NV00003\",\"name\":\"Nguy\\u1ec5n Vi\\u1ebft Danh\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 13:08:11\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:08:11'),
(1019, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', '2019-05-31 06:08:37'),
(1020, 1, 1, 2, 'Cập nhật nhân viên ID: 15', '{\"id\":\"15\",\"code\":\"NV00002\",\"name\":\"Ph\\u1ea1m Ng\\u1ecdc Th\\u1ea1ch\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 13:08:37\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:08:37'),
(1021, 1, 1, 2, 'Cập nhật nhân viên ID: 2', '{\"id\":\"2\",\"code\":\"NV00001\",\"name\":\"\\u0110\\u1ea1i Tr\\u01b0\\u1eddng Ph\\u00e1t\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 13:09:10\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:09:10'),
(1022, 1, 1, 2, 'Cập nhật nhân viên ID: 11', '{\"id\":\"11\",\"code\":\"NV00006\",\"name\":\"Hu\\u1ef3nh \\u0110\\u1eafc Nh\\u00e2n\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 13:10:18\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:10:18'),
(1023, 1, 1, 2, 'Cập nhật nhân viên ID: 16', '{\"id\":\"16\",\"code\":\"NV0008\",\"name\":\"Nguy\\u1ec5n \\u0110\\u1eb7ng Thanh Duy\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 16:02:15\",\"updated_at\":\"2019-05-31 13:10:48\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:10:48'),
(1024, 1, 1, 2, 'Cập nhật nhân viên ID: 16', '{\"id\":\"16\",\"code\":\"NV00009\",\"name\":\"Nguy\\u1ec5n \\u0110\\u1eb7ng Thanh Duy\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 16:02:15\",\"updated_at\":\"2019-05-31 13:11:02\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:11:02'),
(1025, 1, 1, 1, 'Thêm mới nhân viên ID: 17', '{\"id\":\"17\",\"code\":\"NV00009\",\"name\":\"Nguy\\u1ec5n Ho\\u00e0i Nh\\u00e2n\",\"dept_id\":\"25\",\"position_id\":\"6\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-05-31 13:12:14\",\"updated_at\":\"2019-05-31 13:12:14\",\"is_delete\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:12:15'),
(1026, 1, 1, 2, 'Cập nhật nhân viên ID: 17', '{\"id\":\"17\",\"code\":\"NV000011\",\"name\":\"Nguy\\u1ec5n Ho\\u00e0i Nh\\u00e2n\",\"dept_id\":\"25\",\"position_id\":\"6\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-05-31 13:12:14\",\"updated_at\":\"2019-05-31 13:13:16\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:13:16'),
(1027, 1, 1, 2, 'Cập nhật nhân viên ID: 17', '{\"id\":\"17\",\"code\":\"NV00011\",\"name\":\"Nguy\\u1ec5n Ho\\u00e0i Nh\\u00e2n\",\"dept_id\":\"25\",\"position_id\":\"6\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-05-31 13:12:14\",\"updated_at\":\"2019-05-31 13:13:40\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:13:40'),
(1028, 1, 1, 1, 'Thêm mới nhân viên ID: 18', '{\"id\":\"18\",\"code\":\"NV00012\",\"name\":\"L\\u00ea V\\u0103n P\\u00f4n\",\"dept_id\":\"25\",\"position_id\":\"6\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-05-31 13:14:21\",\"updated_at\":\"2019-05-31 13:14:21\",\"is_delete\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:14:21'),
(1029, 1, 1, 1, 'Thêm mới nhân viên ID: 19', '{\"id\":\"19\",\"code\":\"NV00013\",\"name\":\"B\\u00f9i Minh Nguy\\u00ean\",\"dept_id\":\"25\",\"position_id\":\"6\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-05-31 13:15:01\",\"updated_at\":\"2019-05-31 13:15:01\",\"is_delete\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:15:01'),
(1030, 1, 1, 1, 'Thêm mới nhân viên ID: 20', '{\"id\":\"20\",\"code\":\"NV00014\",\"name\":\"Ph\\u1ea1m Hu\\u1ef3nh Nh\\u1eadt\",\"dept_id\":\"25\",\"position_id\":\"6\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-05-31 13:16:11\",\"updated_at\":\"2019-05-31 13:16:11\",\"is_delete\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:16:11'),
(1031, 1, 1, 2, 'Cập nhật danh mục ID: 2', '{\"id\":\"2\",\"cat_id\":\"2\",\"name\":\"B\\u1ed9 ph\\u1eadn System & Database\",\"abbreviation\":\"\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-04-03 05:49:03\",\"updated_at\":\"2019-05-31 13:18:49\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:18:49'),
(1032, 1, 1, 2, 'Cập nhật danh mục ID: 3', '{\"id\":\"3\",\"cat_id\":\"2\",\"name\":\"B\\u1ed9 ph\\u1eadn WiFi\",\"abbreviation\":\"\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-04-03 05:57:10\",\"updated_at\":\"2019-05-31 13:19:07\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:19:07'),
(1033, 1, 1, 2, 'Cập nhật danh mục ID: 5', '{\"id\":\"5\",\"cat_id\":\"2\",\"name\":\"B\\u1ed9 ph\\u1eadn Mobile App\",\"abbreviation\":\"\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-04-03 05:57:42\",\"updated_at\":\"2019-05-31 13:19:28\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:19:28'),
(1034, 1, 1, 2, 'Cập nhật danh mục ID: 4', '{\"id\":\"4\",\"cat_id\":\"2\",\"name\":\"B\\u1ed9 ph\\u1eadn Web App\",\"abbreviation\":\"\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-04-03 05:57:31\",\"updated_at\":\"2019-05-31 13:20:15\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:20:15'),
(1035, 1, 1, 1, 'Thêm mới danh mục ID: 6', '{\"id\":\"6\",\"cat_id\":\"2\",\"name\":\"B\\u1ed9 ph\\u1eadn BA \",\"abbreviation\":\"\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-05-31 13:21:27\",\"updated_at\":\"2019-05-31 13:21:27\",\"is_delete\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:21:27'),
(1036, 1, 1, 1, 'Thêm mới danh mục ID: 7', '{\"id\":\"7\",\"cat_id\":\"2\",\"name\":\"B\\u1ed9 ph\\u1eadn QK\",\"abbreviation\":\"\",\"status\":\"0\",\"description\":\"\",\"created_at\":\"2019-05-31 13:21:44\",\"updated_at\":\"2019-05-31 13:21:44\",\"is_delete\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:21:44'),
(1037, 1, 1, 2, 'Cập nhật danh mục ID: 7', '{\"id\":\"7\",\"cat_id\":\"2\",\"name\":\"B\\u1ed9 ph\\u1eadn QK\",\"abbreviation\":\"\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-05-31 13:21:44\",\"updated_at\":\"2019-05-31 13:21:51\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:21:51'),
(1038, 1, 1, 2, 'Cập nhật nhân viên ID: 2', '{\"id\":\"2\",\"code\":\"NV00001\",\"name\":\"\\u0110\\u1ea1i Tr\\u01b0\\u1eddng Ph\\u00e1t\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"4\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 13:22:09\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:22:09'),
(1039, 1, 1, 2, 'Cập nhật danh mục ID: 5', '{\"id\":\"5\",\"cat_id\":\"1\",\"name\":\"Tr\\u01b0\\u1edfng Ph\\u00f2ng \",\"abbreviation\":\"\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-04-03 05:48:23\",\"updated_at\":\"2019-05-31 13:22:25\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:22:25'),
(1040, 1, 1, 2, 'Cập nhật danh mục ID: 4', '{\"id\":\"4\",\"cat_id\":\"1\",\"name\":\"Nh\\u00e2n Vi\\u00ean\",\"abbreviation\":\"\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-04-03 05:47:16\",\"updated_at\":\"2019-05-31 13:22:33\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:22:33'),
(1041, 1, 1, 3, 'Xóa thành công danh mục có Cat ID: 1 và ID: 4', '', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:22:52'),
(1042, 1, 1, 3, 'Xóa thành công danh mục có Cat ID: 1 và ID: 3', '', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:23:00'),
(1043, 1, 1, 3, 'Xóa thành công danh mục có Cat ID: 1 và ID: 3', '', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:23:06'),
(1044, 1, 1, 2, 'Cập nhật danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"1\",\"name\":\"Gi\\u00e1m \\u0110\\u1ed1c \",\"abbreviation\":\"GD\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-03-21 08:44:03\",\"updated_at\":\"2019-05-31 13:23:35\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:23:35'),
(1045, 1, 1, 2, 'Cập nhật nhân viên ID: 2', '{\"id\":\"2\",\"code\":\"NV00001\",\"name\":\"\\u0110\\u1ea1i Tr\\u01b0\\u1eddng Ph\\u00e1t\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"4\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 13:23:51\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:23:51'),
(1046, 1, 1, 2, 'Cập nhật nhân viên ID: 15', '{\"id\":\"15\",\"code\":\"NV00002\",\"name\":\"Ph\\u1ea1m Ng\\u1ecdc Th\\u1ea1ch\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"1\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 13:23:57\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:23:58'),
(1047, 1, 1, 2, 'Cập nhật nhân viên ID: 15', '{\"id\":\"15\",\"code\":\"NV00002\",\"name\":\"Ph\\u1ea1m Ng\\u1ecdc Th\\u1ea1ch\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"5\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 13:24:06\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:24:06'),
(1048, 1, 1, 2, 'Cập nhật nhân viên ID: 1', '{\"id\":\"1\",\"code\":\"NV00003\",\"name\":\"Nguy\\u1ec5n Vi\\u1ebft Danh\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"6\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 13:24:13\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:24:14'),
(1049, 1, 1, 2, 'Cập nhật nhân viên ID: 12', '{\"id\":\"12\",\"code\":\"NV00004\",\"name\":\"Tr\\u1ecbnh Minh \\u0110\\u1ee9c\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"2\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 13:24:22\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:24:22'),
(1050, 1, 1, 2, 'Cập nhật nhân viên ID: 14', '{\"id\":\"14\",\"code\":\"NV00005\",\"name\":\"Nguy\\u1ec5n Th\\u00e0nh Ph\\u00e1t \",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"3\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 13:24:30\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:24:30'),
(1051, 1, 1, 2, 'Cập nhật nhân viên ID: 11', '{\"id\":\"11\",\"code\":\"NV00006\",\"name\":\"Hu\\u1ef3nh \\u0110\\u1eafc Nh\\u00e2n\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"2\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 13:24:38\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:24:38'),
(1052, 1, 1, 2, 'Cập nhật nhân viên ID: 13', '{\"id\":\"13\",\"code\":\"NV00007\",\"name\":\"Ph\\u1ea1m Ti\\u1ebfn S\\u0129\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"3\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 13:24:46\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:24:46'),
(1053, 1, 1, 2, 'Cập nhật nhân viên ID: 3', '{\"id\":\"3\",\"code\":\"NV00008\",\"name\":\"Ng\\u00f4 Ho\\u00e0ng H\\u1ea3i\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"3\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 13:24:56\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:24:56'),
(1054, 1, 1, 2, 'Cập nhật nhân viên ID: 16', '{\"id\":\"16\",\"code\":\"NV00009\",\"name\":\"Nguy\\u1ec5n \\u0110\\u1eb7ng Thanh Duy\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"4\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 16:02:15\",\"updated_at\":\"2019-05-31 13:25:10\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:25:10'),
(1055, 1, 1, 2, 'Cập nhật nhân viên ID: 18', '{\"id\":\"18\",\"code\":\"NV00012\",\"name\":\"L\\u00ea V\\u0103n P\\u00f4n\",\"dept_id\":\"25\",\"position_id\":\"6\",\"division_id\":\"4\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-05-31 13:14:21\",\"updated_at\":\"2019-05-31 13:25:36\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:25:36'),
(1056, 1, 1, 2, 'Cập nhật nhân viên ID: 19', '{\"id\":\"19\",\"code\":\"NV00013\",\"name\":\"B\\u00f9i Minh Nguy\\u00ean\",\"dept_id\":\"25\",\"position_id\":\"6\",\"division_id\":\"5\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-05-31 13:15:01\",\"updated_at\":\"2019-05-31 13:25:44\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:25:44'),
(1057, 1, 1, 2, 'Cập nhật nhân viên ID: 20', '{\"id\":\"20\",\"code\":\"NV00014\",\"name\":\"Ph\\u1ea1m Hu\\u1ef3nh Nh\\u1eadt\",\"dept_id\":\"25\",\"position_id\":\"6\",\"division_id\":\"4\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-05-31 13:16:11\",\"updated_at\":\"2019-05-31 13:25:54\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:25:54'),
(1058, 1, 1, 2, 'Cập nhật danh mục ID: 3', '{\"id\":\"3\",\"cat_id\":\"2\",\"name\":\"B\\u1ed9 ph\\u1eadn WiFi & IoT\",\"abbreviation\":\"\",\"status\":\"1\",\"description\":\"\",\"created_at\":\"2019-04-03 05:57:10\",\"updated_at\":\"2019-05-31 13:26:20\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:26:20'),
(1059, 1, 1, 2, 'Cập nhật nhân viên ID: 2', '{\"id\":\"2\",\"code\":\"NV00001\",\"name\":\"L\\u00ea Tr\\u01b0\\u1eddng Ph\\u00e1t\",\"dept_id\":\"25\",\"position_id\":\"5\",\"division_id\":\"4\",\"note\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-19 10:41:06\",\"updated_at\":\"2019-05-31 13:28:11\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 06:28:11'),
(1060, 1, 1, 1, 'Thêm mới nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 14:48:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:26:56\",\"updated_at\":\"2019-05-31 14:26:56\",\"is_delete\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 07:26:56'),
(1061, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 14:48:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:26:56\",\"updated_at\":\"2019-05-31 14:29:49\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 07:29:49'),
(1062, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 14:48:00\",\"other_doc\":null,\"handover_doc\":\"5cf0d7f727cd1_White.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:26:56\",\"updated_at\":\"2019-05-31 14:29:59\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 07:29:59'),
(1063, 1, 1, 1, 'Thêm mới nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"19HNNIN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"2\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 14:54:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:32:50\",\"updated_at\":\"2019-05-31 14:32:50\",\"is_delete\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 07:32:50'),
(1064, 1, 1, 2, 'Cập nhật nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"19HNNIN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"2\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 14:54:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:32:50\",\"updated_at\":\"2019-05-31 14:35:34\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 07:35:34'),
(1065, 1, 1, 2, 'Cập nhật nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"19HNNIN0000002\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"2\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 14:54:00\",\"other_doc\":null,\"handover_doc\":\"5cf0d951a35c2_White.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:32:50\",\"updated_at\":\"2019-05-31 14:35:45\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 07:35:45'),
(1066, 1, 1, 2, 'Cập nhật danh mục ID: 3', '{\"id\":\"3\",\"cat_id\":\"9\",\"name\":\"Alpha INC\",\"address\":\"\\u0110\\u00e0i Loan\",\"phone\":\"0335010778\",\"email\":\"nhan18041997@gmail.com\",\"website\":\"honeynet.vn\",\"mstdn\":\"03152115\",\"career\":\"gghggkj\",\"description\":null,\"status\":\"1\",\"created_at\":\"2019-05-29 08:39:03\",\"updated_at\":\"2019-05-31 14:38:50\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 07:38:50'),
(1067, 1, 1, 2, 'Cập nhật danh mục ID: 1', '{\"id\":\"1\",\"cat_id\":\"9\",\"name\":\"BUFFALO\",\"address\":\"\\u0110\\u00e0i Loan\",\"phone\":\"03265489956\",\"email\":\"cy1@gmail.com\",\"website\":\"https:\\/\\/congty1.com\",\"mstdn\":\"21354645632123\",\"career\":\"Bu\\u00f4n b\\u00e1n \\u00f4 t\\u00f4\",\"description\":\"\",\"status\":\"1\",\"created_at\":\"2019-03-21 08:46:15\",\"updated_at\":\"2019-05-31 14:39:10\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 07:39:10'),
(1068, 1, 1, 2, 'Cập nhật danh mục ID: 2', '{\"id\":\"2\",\"cat_id\":\"9\",\"name\":\"COMPEX\",\"address\":\"\\u0110\\u00e0i Loan\",\"phone\":\"036544846564\",\"email\":\"congty2@congty2.vn\",\"website\":\"https:\\/\\/congty2.vn\",\"mstdn\":\"5465456465465\",\"career\":\"Cung c\\u1ea5p thi\\u1ebft b\\u1ecb n\\u1ed9i th\\u1ea5t\",\"description\":null,\"status\":\"1\",\"created_at\":\"2019-03-21 08:46:15\",\"updated_at\":\"2019-05-31 14:39:20\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 07:39:20'),
(1069, 1, 1, 1, 'Thêm mới nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"19HNNIN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"3\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 15:01:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":1,\"status\":0,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:39:40\",\"updated_at\":\"2019-05-31 14:39:40\",\"is_delete\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 07:39:40'),
(1070, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"19HNNIN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"3\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 15:01:00\",\"other_doc\":null,\"handover_doc\":null,\"value_status\":null,\"created_user\":\"1\",\"step\":2,\"status\":0,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:39:40\",\"updated_at\":\"2019-05-31 14:41:34\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 07:41:34');
INSERT INTO `log_history` (`id`, `user_id`, `page`, `type`, `name`, `detail`, `ip`, `device`, `created_at`) VALUES
(1071, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"19HNNIN0000003\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"3\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 15:01:00\",\"other_doc\":null,\"handover_doc\":\"5cf0dab7e6eb6_White.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:39:40\",\"updated_at\":\"2019-05-31 14:41:43\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 07:41:43'),
(1072, 1, 1, 3, 'Xoá Tài sản/Thiết bị nhập kho có ID: 4', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 07:44:28'),
(1073, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 14:48:00\",\"other_doc\":null,\"handover_doc\":\"5cf0d7f727cd1_White.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:26:56\",\"updated_at\":\"2019-05-31 14:44:30\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 07:44:30'),
(1074, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"19HNNIN0000003\",\"title\":\"Nh\\u1eadp thi\\u1ebft b\\u1ecb Access point Buff\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"3\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 15:01:00\",\"other_doc\":null,\"handover_doc\":\"5cf0dab7e6eb6_White.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:39:40\",\"updated_at\":\"2019-05-31 14:56:53\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 07:56:53'),
(1075, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"19HNNIN0000003\",\"title\":\"Nh\\u1eadp thi\\u1ebft b\\u1ecb Access point Buff\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"3\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 15:01:00\",\"other_doc\":null,\"handover_doc\":\"5cf0dab7e6eb6_White.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:39:40\",\"updated_at\":\"2019-05-31 14:56:55\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 07:56:55'),
(1076, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"19HNNIN0000003\",\"title\":\"Nh\\u1eadp thi\\u1ebft b\\u1ecb Access point Buff\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"3\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 15:01:00\",\"other_doc\":null,\"handover_doc\":\"5cf0dab7e6eb6_White.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:39:40\",\"updated_at\":\"2019-05-31 14:56:57\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 07:56:57'),
(1077, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"19HNNIN0000003\",\"title\":\"Nh\\u1eadp thi\\u1ebft b\\u1ecb ALFA HORNET AP120C\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"3\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 15:01:00\",\"other_doc\":null,\"handover_doc\":\"5cf0dab7e6eb6_White.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:39:40\",\"updated_at\":\"2019-05-31 15:06:59\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 08:06:59'),
(1078, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"19HNNIN0000003\",\"title\":\"Nh\\u1eadp thi\\u1ebft b\\u1ecb ALFA HORNET AP120C\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"3\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 15:01:00\",\"other_doc\":null,\"handover_doc\":\"5cf0dab7e6eb6_White.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:39:40\",\"updated_at\":\"2019-05-31 15:07:01\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 08:07:02'),
(1079, 1, 1, 2, 'Cập nhật nhập kho ID: 3', '{\"id\":\"3\",\"code\":\"19HNNIN0000003\",\"title\":\"Nh\\u1eadp thi\\u1ebft b\\u1ecb ALFA HORNET AP120C\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"3\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 15:01:00\",\"other_doc\":null,\"handover_doc\":\"5cf0dab7e6eb6_White.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:39:40\",\"updated_at\":\"2019-05-31 15:07:03\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 08:07:03'),
(1080, 1, 1, 2, 'Cập nhật nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"19HNNIN0000002\",\"title\":\"COMPEX MMZ563HV \",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"2\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 14:54:00\",\"other_doc\":null,\"handover_doc\":\"5cf0d951a35c2_White.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:32:50\",\"updated_at\":\"2019-05-31 15:07:19\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 08:07:19'),
(1081, 1, 1, 2, 'Cập nhật nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"19HNNIN0000002\",\"title\":\"COMPEX MMZ563HV \",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"2\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 14:54:00\",\"other_doc\":null,\"handover_doc\":\"5cf0d951a35c2_White.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:32:50\",\"updated_at\":\"2019-05-31 15:07:21\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 08:07:21'),
(1082, 1, 1, 2, 'Cập nhật nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"19HNNIN0000002\",\"title\":\"Nh\\u1eadp thi\\u1ebft b\\u1ecb COMPEX MMZ563HV \",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"2\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 14:54:00\",\"other_doc\":null,\"handover_doc\":\"5cf0d951a35c2_White.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:32:50\",\"updated_at\":\"2019-05-31 15:07:36\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 08:07:36'),
(1083, 1, 1, 2, 'Cập nhật nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"19HNNIN0000002\",\"title\":\"Nh\\u1eadp thi\\u1ebft b\\u1ecb COMPEX MMZ563HV \",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"2\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 14:54:00\",\"other_doc\":null,\"handover_doc\":\"5cf0d951a35c2_White.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:32:50\",\"updated_at\":\"2019-05-31 15:07:37\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 08:07:37'),
(1084, 1, 1, 2, 'Cập nhật nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"19HNNIN0000002\",\"title\":\"Nh\\u1eadp thi\\u1ebft b\\u1ecb COMPEX MMZ563HV \",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"2\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 14:54:00\",\"other_doc\":null,\"handover_doc\":\"5cf0d951a35c2_White.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:32:50\",\"updated_at\":\"2019-05-31 15:07:39\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 08:07:39'),
(1085, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"title\":\"Nh\\u1eadp thi\\u1ebft b\\u1ecb BUFFALO WZR-HP-AG300H\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 14:48:00\",\"other_doc\":null,\"handover_doc\":\"5cf0d7f727cd1_White.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:26:56\",\"updated_at\":\"2019-05-31 15:08:01\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 08:08:01'),
(1086, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"title\":\"Nh\\u1eadp thi\\u1ebft b\\u1ecb BUFFALO WZR-HP-AG300H\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 14:48:00\",\"other_doc\":null,\"handover_doc\":\"5cf0d7f727cd1_White.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:26:56\",\"updated_at\":\"2019-05-31 15:08:02\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 08:08:02'),
(1087, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"title\":\"Nh\\u1eadp thi\\u1ebft b\\u1ecb BUFFALO WZR-HP-AG300H\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"1\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 14:48:00\",\"other_doc\":null,\"handover_doc\":\"5cf0d7f727cd1_White.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":3,\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:26:56\",\"updated_at\":\"2019-05-31 15:08:04\",\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-05-31 08:08:04'),
(1088, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-03 07:39:56'),
(1089, 1, 1, 1, 'Thêm ngôn ngữ ID: 6', '{\"id\":\"6\",\"name\":\"HONEYNET\",\"short_name\":\"HNN\",\"path\":\"\\/language_file\\/hnn\",\"icon\":\"Honeynet logo (symbol only).png\",\"status\":\"0\",\"actived\":\"0\",\"created_at\":null,\"updated_at\":null,\"is_delete\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-03 07:46:53'),
(1090, 1, 1, 2, 'Cập nhật ngôn ngữ ID: ', '{\"id\":\"1\",\"name\":\"VIET NAM\",\"short_name\":\"VIE\",\"path\":\"\\/language_file\\/vie\",\"icon\":\"vietnam.png\",\"status\":\"1\",\"actived\":\"0\",\"created_at\":null,\"updated_at\":null,\"is_delete\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-03 07:47:11'),
(1091, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-03 10:39:53'),
(1092, 1, 1, 2, 'Cập nhật nhập kho ID: 2', '{\"id\":\"2\",\"code\":\"19HNNIN0000002\",\"title\":\"Nh\\u1eadp thi\\u1ebft b\\u1ecb COMPEX MMZ563HV \",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 14:54:00\",\"other_doc\":null,\"handover_doc\":\"5cf0d951a35c2_White.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:32:50\",\"updated_at\":\"2019-06-03 18:47:51\",\"is_delete\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-03 11:47:51'),
(1093, 1, 1, 2, 'Cập nhật nhập kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNIN0000001\",\"title\":\"Nh\\u1eadp thi\\u1ebft b\\u1ecb BUFFALO WZR-HP-AG300H\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"3\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"1\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-05-31 14:48:00\",\"other_doc\":null,\"handover_doc\":\"5cf0d7f727cd1_White.jpg\",\"value_status\":null,\"created_user\":\"1\",\"step\":\"3\",\"status\":1,\"note\":\"\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-05-31 14:26:56\",\"updated_at\":\"2019-06-03 18:48:53\",\"is_delete\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-03 11:48:53'),
(1094, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-04 02:53:28'),
(1095, 1, 1, 1, 'Thêm mới tài khoản có ID: 2', '{\"id\":\"2\",\"name\":\"Qu\\u1ea3n tr\\u1ecb vi\\u00ean Honeynet\",\"username\":\"quan_tri_vien\",\"password\":\"$2y$08$QVBIQVVxT0N5UXNVT1N4N.OGEGjOYoK4CVA3ZmGMRFuYrdnfUung2\",\"email\":\"quantrivien@honeynet.vn\",\"phone\":\"0235765454\",\"avatar\":null,\"role\":\"2\",\"dept_id\":\"25\",\"dept_mg\":\"[\\\"35\\\",\\\"25\\\",\\\"36\\\",\\\"37\\\",\\\"38\\\"]\",\"status\":\"1\",\"created_at\":\"2019-06-04 10:47:18\",\"updated_at\":\"2019-06-04 10:47:18\",\"is_delete\":null}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-04 03:47:18'),
(1096, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-04 03:49:19'),
(1097, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-04 04:25:13'),
(1098, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-04 04:33:21'),
(1099, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-04 04:35:29'),
(1100, 2, 1, 1, 'Thêm mới tài khoản có ID: 3', '{\"id\":\"3\",\"name\":\"Th\\u1ee7 Kho\",\"username\":\"thu_kho\",\"password\":\"$2y$08$WC8zbk41N1lsRDM1NllBMuQRg8WtSxdK4zarM.ojv\\/YeaBsYsTy1C\",\"email\":\"thukho@honeynet.vn\",\"phone\":\"0256465456\",\"avatar\":null,\"role\":\"3\",\"dept_id\":\"35\",\"dept_mg\":\"[\\\"35\\\",\\\"36\\\",\\\"37\\\",\\\"38\\\",\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2019-06-04 11:41:00\",\"updated_at\":\"2019-06-04 11:41:00\",\"is_delete\":null}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-04 04:41:00'),
(1101, 3, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-04 04:41:19'),
(1102, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-04 04:42:52'),
(1103, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-04 04:45:01'),
(1104, 3, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-04 06:07:26'),
(1105, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-04 06:21:22'),
(1106, 2, 1, 1, 'Thêm mới tài khoản có ID: 4', '{\"id\":\"4\",\"name\":\"Nh\\u00e2n vi\\u00ean Kho\",\"username\":\"quan_tri_vien\",\"password\":\"$2y$08$R2R2dUhZWnlWVFQreFJmcetgmJ25em3T4PGAX03AryNZv\\/iN8y3NW\",\"email\":\"nhanvienkho@honeynet.vn\",\"phone\":\"0265464984\",\"avatar\":null,\"role\":\"4\",\"dept_id\":\"25\",\"dept_mg\":\"[\\\"35\\\",\\\"36\\\",\\\"37\\\",\\\"38\\\",\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2019-06-04 13:22:13\",\"updated_at\":\"2019-06-04 13:22:13\",\"is_delete\":null}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-04 06:22:13'),
(1107, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-04 06:23:13'),
(1108, 4, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-04 06:37:19'),
(1109, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-04 06:51:09'),
(1110, 3, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-04 06:53:51'),
(1111, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-04 07:16:01'),
(1112, 3, 1, 1, 'Thêm mới xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNEX0000001\",\"title\":\"A\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-06-04 16:50:00\",\"other_doc_ex\":null,\"handover_doc_ex\":null,\"value_status\":null,\"created_user\":\"3\",\"step\":1,\"status\":0,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-06-04 16:50:48\",\"updated_at\":\"2019-06-04 16:50:48\",\"is_delete\":null}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-04 09:50:48'),
(1113, 3, 1, 2, 'Cập nhật xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNEX0000001\",\"title\":\"A\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-06-04 16:50:00\",\"other_doc_ex\":null,\"handover_doc_ex\":null,\"value_status\":null,\"created_user\":\"3\",\"step\":2,\"status\":0,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-06-04 16:50:48\",\"updated_at\":\"2019-06-04 16:55:22\",\"is_delete\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-04 09:55:22'),
(1114, 3, 1, 2, 'Cập nhật xuất kho ID: 1', '{\"id\":\"1\",\"code\":\"19HNNEX0000001\",\"title\":\"A\",\"wh_id\":\"1\",\"move\":\"\",\"move_type\":\"2\",\"move_id\":\"1\",\"manager_id\":null,\"reason\":\"2\",\"cancel_reason\":null,\"eviction\":null,\"reason_other\":\"\",\"datetime\":null,\"datetime_expected\":\"2019-06-04 16:50:00\",\"other_doc_ex\":null,\"handover_doc_ex\":\"5cf6401358a27_logo_vnu_ver_end_3.jpg\",\"value_status\":null,\"created_user\":\"3\",\"step\":3,\"status\":1,\"note\":\"A\",\"confirm_note\":null,\"cancel_note\":null,\"created_at\":\"2019-06-04 16:50:48\",\"updated_at\":\"2019-06-04 16:55:31\",\"is_delete\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2019-06-04 09:55:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `maintenance`
--

CREATE TABLE `maintenance` (
  `id` int(11) NOT NULL,
  `properties_id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `note` text,
  `item` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `man_type` varchar(255) NOT NULL,
  `man_day` date DEFAULT NULL,
  `num_day` int(11) NOT NULL,
  `noti_day` int(11) NOT NULL,
  `man_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `man_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `man_phone` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `maintenance`
--

INSERT INTO `maintenance` (`id`, `properties_id`, `code`, `note`, `item`, `man_type`, `man_day`, `num_day`, `noti_day`, `man_name`, `man_email`, `man_phone`) VALUES
(1, 1, '123456', 'Bao tri gap', 'Bảo trì', '1', '2018-12-12', 10, 10, 'Nguyen Van A', 'nguyenvana@gmail.com', '03265487852');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `managers`
--

CREATE TABLE `managers` (
  `id` int(11) NOT NULL,
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ma nguoi su dung',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ten nguoi su dung',
  `dept_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `division_id` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `status` int(1) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `managers`
--

INSERT INTO `managers` (`id`, `code`, `name`, `dept_id`, `position_id`, `division_id`, `note`, `status`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, 'NV00003', 'Nguyễn Viết Danh', 1, 5, 6, '', 1, '2019-03-19 10:41:06', '2019-05-31 13:24:13', 0),
(2, 'NV00001', 'Lê Trường Phát', 1, 5, 4, '', 1, '2019-03-19 10:41:06', '2019-05-31 13:28:11', 0),
(3, 'NV00008', 'Ngô Hoàng Hải', 1, 5, 3, '', 1, '2019-03-19 10:41:06', '2019-05-31 13:24:56', 0),
(10, 'NV00010', 'Thái Hoàng Nam', 1, 5, 1, '', 1, '2019-03-19 10:41:06', '2019-05-31 11:16:55', 0),
(11, 'NV00006', 'Huỳnh Đắc Nhân', 1, 5, 2, '', 1, '2019-03-19 10:41:06', '2019-05-31 13:24:38', 0),
(12, 'NV00004', 'Trịnh Minh Đức', 1, 5, 2, '', 1, '2019-03-19 10:41:06', '2019-05-31 13:24:22', 0),
(13, 'NV00007', 'Phạm Tiến Sĩ', 1, 5, 3, '', 1, '2019-03-19 10:41:06', '2019-05-31 13:24:46', 0),
(14, 'NV00005', 'Nguyễn Thành Phát ', 1, 5, 3, '', 1, '2019-03-19 10:41:06', '2019-05-31 13:24:30', 0),
(15, 'NV00002', 'Phạm Ngọc Thạch', 1, 5, 5, '', 1, '2019-03-19 10:41:06', '2019-05-31 13:24:06', 0),
(16, 'NV00009', 'Nguyễn Đặng Thanh Duy', 1, 5, 4, '', 1, '2019-03-19 16:02:15', '2019-05-31 13:25:10', 0),
(17, 'NV00011', 'Nguyễn Hoài Nhân', 1, 6, 1, '', 1, '2019-05-31 13:12:14', '2019-05-31 13:13:40', 0),
(18, 'NV00012', 'Lê Văn Pôn', 1, 6, 4, '', 1, '2019-05-31 13:14:21', '2019-05-31 13:25:36', 0),
(19, 'NV00013', 'Bùi Minh Nguyên', 1, 6, 5, '', 1, '2019-05-31 13:15:01', '2019-05-31 13:25:44', 0),
(20, 'NV00014', 'Phạm Huỳnh Nhật', 1, 6, 4, '', 1, '2019-05-31 13:16:11', '2019-05-31 13:25:54', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `viewed` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notification`
--

INSERT INTO `notification` (`id`, `type`, `content`, `link`, `viewed`, `status`, `created_at`) VALUES
(1, 1, 'Phiếu nhập kho NK00001 đã qua khu vực an ninh', '#', NULL, 1, '2019-01-02 10:21:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `offers`
--

CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `create_date` date NOT NULL,
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ma de nghi mua sam',
  `dept_id` int(11) NOT NULL COMMENT 'Don vi mua sam',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0' COMMENT 'Trang thai cua buoc ke hoach',
  `step` int(11) NOT NULL,
  `created_user` int(11) NOT NULL COMMENT 'ID tài khoan lam de nghi mua sam',
  `note` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `offers`
--

INSERT INTO `offers` (`id`, `create_date`, `code`, `dept_id`, `content`, `status`, `step`, `created_user`, `note`, `created_at`, `updated_at`) VALUES
(1, '2019-03-12', 'SS123456', 25, 'Đề nghị mua điện thoại', 1, 1, 1, 'Ghí chú', '2019-03-12 14:04:45', '2019-03-12 14:21:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `offers_pelf`
--

CREATE TABLE `offers_pelf` (
  `id` int(11) NOT NULL,
  `assets_id` int(11) NOT NULL,
  `offers_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `purpose` text COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_ex` double NOT NULL,
  `unit_price_ex` double NOT NULL,
  `used_date_ex` date NOT NULL,
  `buy_method` int(11) NOT NULL,
  `created_user` int(11) NOT NULL COMMENT 'ID tài khoan tao tai san',
  `status` int(1) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `controller` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `optgroup` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(2) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permission`
--

INSERT INTO `permission` (`id`, `controller`, `action`, `name`, `description`, `optgroup`, `status`, `created_at`) VALUES
(1, '1', '1', 'Toàn quyền', 'Toàn quyền ', 'Toàn quyền', 1, '2019-02-25 14:20:45'),
(10, 'assetsmg', '', 'Toàn quyền quản lý tài sản', 'Toàn quyền quản lý tài sản', 'Tài sản/Thiết bị', 1, '2019-02-25 14:20:45'),
(11, 'assetsmg', 'index', 'Xem danh sách tài sản', 'Xem danh sách tài sản', 'Tài sản/Thiết bị', 1, '2019-02-25 14:20:45'),
(12, 'assetsmg', 'update', 'Cập nhật tài sản', 'Cập nhật tài sản', 'Tài sản/Thiết bị', 1, '2019-02-25 14:20:45'),
(13, 'assetsmg', 'running', 'Xem tài sản đang chạy thật', 'Xem tài sản đang chạy thật', 'Tài sản/Thiết bị', 1, '2019-02-25 14:20:45'),
(14, 'assetsmg', 'trash', 'Xóa tài sản', 'Xóa tài sản', 'Tài sản/Thiết bị', 1, '2019-02-25 14:20:45'),
(15, 'assetsmg', 'update', 'Đánh giá lại tài sản', 'Đánh giá lại tài sản', 'Tài sản/Thiết bị', 1, '2019-02-25 14:20:45'),
(16, 'assetsmg', 'delete', 'Lấy giá tài sản đánh giá', 'Lấy giá tài sản đánh giá', 'Tài sản/Thiết bị', 1, '2019-02-25 14:20:45'),
(30, 'warehousing', '', 'Toàn quyền quản lý nhóm tài sản', 'Toàn quyền quản lý nhóm tài sản', 'Nhập kho', 1, '2019-02-25 14:20:45'),
(31, 'warehousing', 'index', 'Xem danh sách nhóm tài sản', 'Xem danh sách nhóm tài sản', 'Nhập kho', 1, '2019-02-25 14:20:45'),
(32, 'warehousing', 'list', 'Thêm nhóm tài sản', 'Thêm nhóm tài sản', 'Nhập kho', 1, '2019-02-25 14:20:45'),
(33, 'warehousing', 'update', 'Cập nhật nhóm tài sản', 'Cập nhật nhóm tài sản', 'Nhập kho', 1, '2019-02-25 14:20:45'),
(34, 'warehousing', 'confirm', 'Xóa nhóm tài sản', 'Xóa nhóm tài sản', 'Nhập kho', 1, '2019-02-25 14:20:45'),
(35, 'warehousing', 'cancel', 'Thêm nhóm tài sản qua modal', 'Thêm nhóm tài sản qua modal', 'Nhập kho', 1, '2019-02-25 14:20:45'),
(36, 'warehousing', 'delete', 'Thêm nhóm tài sản qua modal', 'Thêm nhóm tài sản qua modal', 'Nhập kho', 1, '2019-02-25 14:20:45'),
(37, 'warehousing', 'updatewhiassets', 'Thêm nhóm tài sản qua modal', 'Thêm nhóm tài sản qua modal', 'Nhập kho', 1, '2019-02-25 14:20:45'),
(38, 'warehousing', 'updatewhiaccessories', 'Thêm nhóm tài sản qua modal', 'Thêm nhóm tài sản qua modal', 'Nhập kho', 1, '2019-02-25 14:20:45'),
(39, 'warehousing', 'deletewhiassets', 'Thêm nhóm tài sản qua modal', 'Thêm nhóm tài sản qua modal', 'Nhập kho', 1, '2019-02-25 14:20:45'),
(50, 'departments', '', 'Toàn quyền đơn vị', 'Toàn quyền đơn vị', 'QL Đơn vị', 1, '2019-02-25 14:20:45'),
(51, 'departments', 'index', 'Xem dánh sách đơn vị', 'Xem danh sách đơn vị', 'QL Đơn vị', 1, '2019-02-25 14:20:45'),
(52, 'departments', 'add', 'Thêm đơn vị', 'Thêm đơn vị', 'QL Đơn vị', 1, '2019-02-25 14:20:45'),
(53, 'departments', 'edit', 'Cập nhật đơn vị', 'Cập nhật đơn vị', 'QL Đơn vị', 1, '2019-02-25 14:20:45'),
(54, 'departments', 'delete', 'Xóa đơn vị', 'Xóa đơn vị', 'QL Đơn vị', 1, '2019-02-25 14:20:45'),
(70, 'warehouseex', '', 'Toàn quyền quản lý nhóm tài sản', 'Toàn quyền quản lý nhóm tài sản', 'Xuất kho', 1, '2019-02-25 14:20:45'),
(71, 'warehouseex', 'index', 'Xem danh sách nhóm tài sản', 'Xem danh sách nhóm tài sản', 'Xuất kho', 1, '2019-02-25 14:20:45'),
(72, 'warehouseex', 'list', 'Thêm nhóm tài sản', 'Thêm nhóm tài sản', 'Xuất kho', 1, '2019-02-25 14:20:45'),
(73, 'warehouseex', 'update', 'Cập nhật nhóm tài sản', 'Cập nhật nhóm tài sản', 'Xuất kho', 1, '2019-02-25 14:20:45'),
(74, 'warehouseex', 'confirm', 'Xóa nhóm tài sản', 'Xóa nhóm tài sản', 'Xuất kho', 1, '2019-02-25 14:20:45'),
(75, 'warehouseex', 'cancel', 'Thêm nhóm tài sản qua modal', 'Thêm nhóm tài sản qua modal', 'Xuất kho', 1, '2019-02-25 14:20:45'),
(76, 'warehouseex', 'delete', 'Thêm nhóm tài sản qua modal', 'Thêm nhóm tài sản qua modal', 'Xuất kho', 1, '2019-02-25 14:20:45'),
(77, 'warehouseex', 'updatewhoassets', 'Thêm nhóm tài sản qua modal', 'Thêm nhóm tài sản qua modal', 'Xuất kho', 1, '2019-02-25 14:20:45'),
(78, 'warehouseex', 'updatewhoaccessories', 'Thêm nhóm tài sản qua modal', 'Thêm nhóm tài sản qua modal', 'Xuất kho', 1, '2019-02-25 14:20:45'),
(79, 'warehouseex', 'deletewhoassets', 'Thêm nhóm tài sản qua modal', 'Thêm nhóm tài sản qua modal', 'Xuất kho', 1, '2019-02-25 14:20:45'),
(90, 'categories', '', 'Toàn quyền thanh lý tài sản', 'Toàn quyền thanh lý tài sản', 'Danh mục', 1, '2019-02-25 14:20:45'),
(91, 'categories', 'index', 'Xem danh sách thanh lý tài sản', 'Xem danh sách thanh lý tài sản', 'Danh mục', 1, '2019-02-25 14:20:45'),
(92, 'categories', 'items', 'Danh sách đề nghị thanh lý tài sản', 'Danh sách đề nghị thanh lý tài sản', 'Danh mục', 1, '2019-02-25 14:20:45'),
(93, 'categories', 'supplieres', 'Lấy danh sách đề nghị thanh lý tài sản', 'Lấy danh sách đề nghị thanh lý tài sản', 'Danh mục', 1, '2019-02-25 14:20:45'),
(94, 'categories', 'species', 'Cập nhật đề nghị thanh lý tài sản', 'Cập nhật đề nghị thanh lý tài sản', 'Danh mục', 1, '2019-02-25 14:20:45'),
(95, 'categories', 'assets', 'Xác nhận đề nghị thanh lý tài sản', 'Xác nhận đề nghị thanh lý tài sản', 'Danh mục', 1, '2019-02-25 14:20:45'),
(96, 'categories', 'updateassets', 'Lấy dữ liệu thanh lý tài sản', 'Lấy dữ liệu thanh lý tài sản', 'Danh mục', 1, '2019-02-25 14:20:45'),
(97, 'categories', 'deleteassets', 'Thêm thanh lý tài sản', 'Thêm thanh lý tài sản', 'Danh mục', 1, '2019-02-25 14:20:45'),
(98, 'categories', 'update', 'Cập nhật thanh lý tài sản', 'Cập nhật thanh lý tài sản', 'Danh mục', 1, '2019-02-25 14:20:45'),
(99, 'categories', 'delete', 'Xóa thanh lý tài sản', 'Xóa thanh lý tài sản', 'Danh mục', 1, '2019-02-25 14:20:45'),
(110, 'language', '', 'Toàn quyền vị trí sử dụng tài sản', 'Toàn quyền vị trí sử dụng tài sản', 'Ngôn ngữ', 1, '2019-02-25 14:20:45'),
(111, 'language', 'index', 'Xem danh sách vị trí sử dụng tài sản', 'Xem danh sách vị trí sử dụng tài sản', 'Ngôn ngữ', 1, '2019-02-25 14:20:45'),
(112, 'language', 'add', 'Thêm vị trí sử dụng tài sản', 'Thêm vị trí sử dụng tài sản', 'Ngôn ngữ', 1, '2019-02-25 14:20:45'),
(113, 'language', 'edit', 'Cập nhật vị trí sử dụng tài sản', 'Cập nhật vị trí sử dụng tài sản', 'Ngôn ngữ', 1, '2019-02-25 14:20:45'),
(114, 'language', 'delete', 'Xóa kế hoạch', 'Xóa kế hoạch', 'Ngôn ngữ', 1, '2019-02-25 14:20:45'),
(115, 'language', 'change', 'Kiểm tra kế hoạch', 'Kiểm tra kế hoạch', 'Ngôn ngữ', 1, '2019-02-25 14:20:45'),
(130, 'maintenance', '', 'Toàn quyền bảo trì tài sản', 'Toàn quyền bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45'),
(131, 'maintenance', 'index', 'Xem danh sách bảo trì tài sản', 'Xem danh sách bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45'),
(132, 'maintenance', 'add', 'Thêm bảo trì tài sản', 'Thêm bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45'),
(133, 'maintenance', 'edit', 'Cập nhật bảo trì tài sản', 'Cập nhật bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45'),
(134, 'maintenance', 'delete', 'Xóa bảo trì tài sản', 'Xóa bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45'),
(135, 'maintenance', 'getdata', 'Lấy dữ liệu bảo trì tài sản', 'Lấy dữ liệu bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45'),
(136, 'maintenance', 'confirm', 'Xác nhận đã bảo trì tài sản', 'Xác nhận đã bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45'),
(137, 'maintenance', 'notification', 'Lấy thông báo bảo trì tài sản', 'Lấy thông báo bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45'),
(150, 'managers', '', 'Toàn quyền người sử dụng', 'Toàn quyền người sử dụng', 'Nhân viên', 1, '2019-02-25 14:20:45'),
(151, 'managers', 'index', 'Xem danh sách người sử dụng', 'Xem danh sách người sử dụng', 'Nhân viên', 1, '2019-02-25 14:20:45'),
(152, 'managers', 'update', 'Thêm người sử dụng', 'Thêm người sử dụng', 'Nhân viên', 1, '2019-02-25 14:20:45'),
(153, 'managers', 'delete', 'Cập nhật người sử dụng', 'Cập nhật người sử dụng', 'Nhân viên', 1, '2019-02-25 14:20:45'),
(170, 'offers', '', 'Toàn quyền đề nghị trang cấp', 'Toàn quyền đề nghị trang cấp', 'QL Đề nghị trang cấp tài sản', 1, '2019-02-25 14:20:45'),
(171, 'offers', 'index', 'Xem danh sách đề nghị trang cấp', 'Xem danh sách đề nghị trang cấp', 'QL Đề nghị trang cấp tài sản', 1, '2019-02-25 14:20:45'),
(172, 'offers', 'add', 'Thêm đề nghị trang cấp', 'Thêm đề nghị trang cấp', 'QL Đề nghị trang cấp tài sản', 1, '2019-02-25 14:20:45'),
(173, 'offers', 'edit', 'Cập nhật đề nghị trang cấp', 'Cập nhật nghị trang cấp', 'QL Đề nghị trang cấp tài sản', 1, '2019-02-25 14:20:45'),
(174, 'offers', 'delete', 'Xóa đề nghị trang cấp', 'Xóa đề nghị trang cấp', 'QL Đề nghị trang cấp tài sản', 1, '2019-02-25 14:20:45'),
(175, 'offers', 'getdata', 'Lấy dữ liệu đề nghị trang cấp', 'Lấy dữ liệu đề nghị trang cấp', 'QL Đề nghị trang cấp tài sản', 1, '2019-02-25 14:20:45'),
(190, 'roles', '', 'Toàn quyền phân quyền', 'Toàn quyền phân quyên', 'QL phân quyền', 1, '2019-02-25 14:20:45'),
(191, 'roles', 'index', 'Xem danh sách các nhóm quyền', 'Xem danh sách các nhóm quyền', 'QL phân quyền', 1, '2019-02-25 14:20:45'),
(210, 'users', '', 'Toàn quyền quản lý tài khoản', 'Toàn quyền quản lý tài khoản', 'Tài khoản', 1, '2019-02-25 14:20:45'),
(211, 'users', 'index', 'Xem danh sách tài khoản', 'Xem danh sách tài khoản', 'Tài khoản', 1, '2019-02-25 14:20:45'),
(212, 'users', 'update', 'Thêm tài khoản', 'Thêm tài khoản', 'Tài khoản', 1, '2019-02-25 14:20:45'),
(213, 'users', 'detele', 'Cập nhật tài khoản', 'Cập nhật tài khoản', 'Tài khoản', 1, '2019-02-25 14:20:45'),
(214, 'users', 'changepw', 'Xóa tài khoản', 'Xóa tài khoản', 'Tài khoản', 1, '2019-02-25 14:20:45'),
(215, 'users', 'changepassword', 'Lấy danh sách tài khoản', 'Lấy danh sách tài khoản', 'Tài khoản', 1, '2019-02-25 14:20:45'),
(230, 'transfers', '', 'Toàn quyền luân chuyển tài sản', 'Toàn quyền luân chuyển tài sản', 'QL Luân chuyển', 1, '2019-02-25 14:20:45'),
(234, 'transfers', 'index', 'Xem danh sách luân chuyển tài sản', 'Xem danh sách luân chuyển tài sản', 'QL Luân chuyển', 1, '2019-02-25 14:20:45'),
(235, 'transfers', 'add', 'Thêm luân chuyển tài sản', 'Thêm luân chuyển tài sản', 'QL Luân chuyển', 1, '2019-02-25 14:20:45'),
(250, 'warehouse', '', 'Toàn quyền quản lý kho', 'Toàn quyền quản lý kho', 'Nhà kho', 1, '2019-02-25 14:20:45'),
(251, 'warehouse', 'index', 'Xem danh sách kho', 'Xem danh sách kho', 'Nhà kho', 1, '2019-02-25 14:20:45'),
(252, 'warehouse', 'assets', 'Thêm kho', 'Thêm kho', 'Nhà kho', 1, '2019-02-25 14:20:45'),
(253, 'warehouse', 'accessories', 'Cập nhật kho', 'Cập nhật kho', 'Nhà kho', 1, '2019-02-25 14:20:45'),
(254, 'warehouse', 'calendar', 'Xóa kho', 'Xóa kho', 'Nhà kho', 1, '2019-02-25 14:20:45'),
(255, 'warehouse', 'update', 'Lấy dữ liệu kho', 'Lấy dữ liệu kho', 'Nhà kho', 1, '2019-02-25 14:20:45'),
(256, 'warehouse', 'createdefaultwhid', 'Lấy dữ liệu kho', 'Lấy dữ liệu kho', 'Nhà kho', 1, '2019-02-25 14:20:45'),
(257, 'warehouse', 'delete', 'Lấy dữ liệu kho', 'Lấy dữ liệu kho', 'Nhà kho', 1, '2019-02-25 14:20:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `plan`
--

CREATE TABLE `plan` (
  `id` int(11) NOT NULL,
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ma de nghi mua sam',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT 'Trang thai cua buoc ke hoach',
  `step` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL COMMENT 'Don vi mua sam',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created_user` int(11) NOT NULL COMMENT 'ID tài khoan lam de nghi mua sam',
  `year` year(4) NOT NULL COMMENT 'Nam mua sam',
  `note` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `plan`
--

INSERT INTO `plan` (`id`, `code`, `status`, `step`, `dept_id`, `content`, `created_user`, `year`, `note`, `created_at`, `updated_at`) VALUES
(1, 'MUA2019', 1, 1, 25, '#', 1, 2019, '', '2019-03-09 16:45:31', '2019-04-01 06:58:48'),
(2, '2019DN1', 1, 2, 25, 'Đề nghị mua đồ đầu năm', 1, 2019, NULL, '2019-03-11 17:30:06', '2019-03-11 17:30:06'),
(3, 'A10001', 1, 1, 11, 'Kế hoạch mua sắm 2019', 1, 2019, '#', '2019-04-02 22:04:43', '2019-04-02 22:04:43'),
(4, 'A10002', 1, 1, 11, 'Kế hoạch mua sắm 2019', 1, 2019, '#', '2019-04-02 22:04:54', '2019-04-02 22:04:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `plan_pelf`
--

CREATE TABLE `plan_pelf` (
  `id` int(11) NOT NULL,
  `assets_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `purpose` text COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_ex` double NOT NULL,
  `unit_price_ex` double NOT NULL,
  `used_date_ex` date NOT NULL,
  `buy_method` int(11) NOT NULL,
  `created_user` int(11) NOT NULL COMMENT 'ID tài khoan tao tai san',
  `status` int(1) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `plan_pelf`
--

INSERT INTO `plan_pelf` (`id`, `assets_id`, `plan_id`, `dept_id`, `purpose`, `quantity`, `price_ex`, `unit_price_ex`, `used_date_ex`, `buy_method`, `created_user`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 25, 'Sử dụng liên lạc', 2, 24000000, 12000000, '2019-03-11', 1, 1, 0, '2019-03-11 13:37:54', '2019-03-11 13:37:54'),
(2, 1, 2, 25, '', 2, 10000000, 0, '2019-03-11', 1, 1, 0, '2019-03-11 13:37:54', '2019-03-11 13:37:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(5) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `permission_id` text COLLATE utf8_unicode_ci NOT NULL,
  `active` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `permission_id`, `active`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, 'Supper Admin', '[1]', 'Y', '2019-06-04 00:00:00', '2019-06-04 00:00:00', 0),
(2, 'Quản trị viên', '[10,30,50,70,90,110,130,150,170,210,230,250]', 'Y', '2019-06-04 00:00:00', '2019-06-04 00:00:00', 0),
(3, 'Thủ kho', '[30,70,90,250]', 'Y', '2019-06-04 00:00:00', '2019-06-04 00:00:00', 0),
(4, 'Nhân viên kho', '[31,32,33,36,37,38,39,71,72,73,76,77,78,79,90,251,252,253,254,256]', 'Y', '2019-06-04 00:00:00', '2019-06-04 00:00:00', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `status`
--

CREATE TABLE `status` (
  `code` int(5) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `status`
--

INSERT INTO `status` (`code`, `name`) VALUES
(0, 'Đang sử dụng'),
(1, 'Yêu cầu thanh lý'),
(2, 'Thanh lý'),
(3, 'Trash'),
(4, 'Remove');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transfers`
--

CREATE TABLE `transfers` (
  `id` int(10) NOT NULL,
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `transfer_date` date NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `recovery_num` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `handover_num` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `dept_id` int(5) NOT NULL,
  `dept_id_2` int(5) NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `transfers`
--

INSERT INTO `transfers` (`id`, `code`, `transfer_date`, `end_date`, `recovery_num`, `handover_num`, `dept_id`, `dept_id_2`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'LC00002', '2019-03-29', NULL, 'TH00002', 'BG00002', 36, 25, 'Luân chuyên XYZ', 1, '2019-02-25 15:41:34', '2019-04-03 09:03:05'),
(2, 'LC00001', '2019-03-29', NULL, 'TH00001', 'BG00001', 36, 25, 'Luân chuyển cho ABC', 1, '2019-04-02 22:08:00', '2019-04-03 09:03:29'),
(3, 'LC00003', '2019-03-29', NULL, 'TH00003', 'BG00003', 36, 25, 'Đề nghị luân chuyển', 1, '2019-04-03 09:04:41', '2019-04-03 09:04:41'),
(4, 'LC00004', '2019-04-02', NULL, 'TH00004', 'BG00004', 36, 25, 'Đề nghị luân chuyển', 1, '2019-04-03 09:18:04', '2019-04-03 09:18:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transfer_pelf`
--

CREATE TABLE `transfer_pelf` (
  `id` int(10) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `properties_id` int(11) NOT NULL,
  `dept_id` int(5) NOT NULL,
  `location_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `dept_id_2` int(5) NOT NULL,
  `location_id_2` int(11) NOT NULL,
  `manager_id_2` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `pelf_quantity` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` text COLLATE utf8_unicode_ci,
  `role` int(5) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `dept_mg` text COLLATE utf8_unicode_ci,
  `status` int(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `email`, `phone`, `avatar`, `role`, `dept_id`, `dept_mg`, `status`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, 'IT Support', 'support', '$2y$08$cXRmK2VuMEdnTng1djdNUuenzqcmeseBNXJU8mFV/9wZXILFsd2eK', 'support@honeynet.vn', '01234567890', '', 1, -1, '', 1, '2016-10-13 22:05:35', '2018-11-23 08:25:16', 0),
(2, 'Quản trị viên Honeynet', 'quan_tri_vien', '$2y$08$QVBIQVVxT0N5UXNVT1N4N.OGEGjOYoK4CVA3ZmGMRFuYrdnfUung2', 'quantrivien@honeynet.vn', '0235765454', NULL, 2, 1, '[\"1\"]', 1, '2019-06-04 10:47:18', '2019-06-04 10:47:18', 0),
(3, 'Thủ Kho', 'thu_kho', '$2y$08$WC8zbk41N1lsRDM1NllBMuQRg8WtSxdK4zarM.ojv/YeaBsYsTy1C', 'thukho@honeynet.vn', '0256465456', NULL, 3, 1, '[\"1\"]', 1, '2019-06-04 11:41:00', '2019-06-04 11:41:00', 0),
(4, 'Nhân viên Kho', 'nhan_vien_kho', '$2y$08$R2R2dUhZWnlWVFQreFJmcetgmJ25em3T4PGAX03AryNZv/iN8y3NW', 'nhanvienkho@honeynet.vn', '0265464984', NULL, 4, 1, '[\"1\"]', 1, '2019-06-04 13:22:13', '2019-06-04 13:22:13', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouseex`
--

CREATE TABLE `warehouseex` (
  `id` int(11) NOT NULL,
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `wh_id` int(11) NOT NULL,
  `move` text COLLATE utf8_unicode_ci,
  `move_type` int(2) NOT NULL DEFAULT '1',
  `move_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `reason` int(1) NOT NULL,
  `cancel_reason` int(1) DEFAULT NULL,
  `eviction` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reason_other` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `datetime_expected` datetime NOT NULL,
  `other_doc_ex` text COLLATE utf8_unicode_ci,
  `handover_doc_ex` text COLLATE utf8_unicode_ci,
  `value_status` int(1) DEFAULT NULL,
  `created_user` int(11) NOT NULL,
  `step` int(2) NOT NULL,
  `status` int(1) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `confirm_note` text COLLATE utf8_unicode_ci,
  `cancel_note` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `warehouseex`
--

INSERT INTO `warehouseex` (`id`, `code`, `title`, `wh_id`, `move`, `move_type`, `move_id`, `manager_id`, `reason`, `cancel_reason`, `eviction`, `reason_other`, `datetime`, `datetime_expected`, `other_doc_ex`, `handover_doc_ex`, `value_status`, `created_user`, `step`, `status`, `note`, `confirm_note`, `cancel_note`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, '19HNNEX0000001', 'A', 1, '', 2, 1, NULL, 2, NULL, NULL, '', NULL, '2019-06-04 16:50:00', NULL, '5cf6401358a27_logo_vnu_ver_end_3.jpg', NULL, 3, 3, 1, 'A', NULL, NULL, '2019-06-04 16:50:48', '2019-06-04 16:55:31', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouselist`
--

CREATE TABLE `warehouselist` (
  `id` int(11) NOT NULL,
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `dept_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `diagram` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `warehouselist`
--

INSERT INTO `warehouselist` (`id`, `code`, `name`, `short_name`, `dept_id`, `manager_id`, `address`, `description`, `diagram`, `status`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, 'NK00001', 'Nhà Kho Số 1', 'HNN', 1, 2, 'Quận 1', 'Thông tin khác', '5cdd1cd4d5139_logo.png', 1, '2019-01-14 03:26:00', '2019-05-16 15:18:28', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehousing`
--

CREATE TABLE `warehousing` (
  `id` int(11) NOT NULL,
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `wh_id` int(11) NOT NULL,
  `move` text COLLATE utf8_unicode_ci,
  `move_type` int(2) NOT NULL DEFAULT '1',
  `move_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `reason` int(1) NOT NULL,
  `cancel_reason` int(1) DEFAULT NULL,
  `eviction` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reason_other` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `datetime_expected` datetime NOT NULL,
  `other_doc` text COLLATE utf8_unicode_ci,
  `handover_doc` text COLLATE utf8_unicode_ci,
  `value_status` int(1) DEFAULT NULL,
  `created_user` int(11) NOT NULL,
  `step` int(2) NOT NULL,
  `status` int(1) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `confirm_note` text COLLATE utf8_unicode_ci,
  `cancel_note` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `warehousing`
--

INSERT INTO `warehousing` (`id`, `code`, `title`, `wh_id`, `move`, `move_type`, `move_id`, `manager_id`, `reason`, `cancel_reason`, `eviction`, `reason_other`, `datetime`, `datetime_expected`, `other_doc`, `handover_doc`, `value_status`, `created_user`, `step`, `status`, `note`, `confirm_note`, `cancel_note`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, '19HNNIN0000001', 'Nhập thiết bị BUFFALO WZR-HP-AG300H', 1, '', 3, 1, 12, 1, NULL, NULL, '', '2019-06-04 16:49:00', '2019-05-31 14:48:00', NULL, '5cf0d7f727cd1_White.jpg', NULL, 1, 3, 2, '', NULL, NULL, '2019-05-31 14:26:56', '2019-06-04 16:50:12', 0),
(2, '19HNNIN0000002', 'Nhập thiết bị COMPEX MMZ563HV ', 1, '', 2, 1, 17, 1, NULL, NULL, '', '2019-06-04 16:49:00', '2019-05-31 14:54:00', NULL, '5cf0d951a35c2_White.jpg', NULL, 1, 3, 2, '', NULL, NULL, '2019-05-31 14:32:50', '2019-06-04 16:49:52', 0),
(3, '19HNNIN0000003', 'Nhập thiết bị ALFA HORNET AP120C', 1, '', 1, 3, 13, 1, NULL, NULL, '', '2019-06-04 16:49:00', '2019-05-31 15:01:00', NULL, '5cf0dab7e6eb6_White.jpg', NULL, 1, 3, 2, '', NULL, NULL, '2019-05-31 14:39:40', '2019-06-04 16:49:40', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `accessories`
--
ALTER TABLE `accessories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `serial_number` (`serial_number`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `mac` (`mac`),
  ADD KEY `assets_id` (`assets_id`),
  ADD KEY `cat_assets_id` (`cat_assets_id`),
  ADD KEY `wh_id` (`wh_id`),
  ADD KEY `whi_id` (`whi_id`),
  ADD KEY `who_id` (`who_id`);

--
-- Chỉ mục cho bảng `accessories_log`
--
ALTER TABLE `accessories_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `mac` (`mac`),
  ADD KEY `assets_log_id` (`assets_log_id`),
  ADD KEY `accessories_id` (`accessories_id`),
  ADD KEY `wh_id` (`wh_id`),
  ADD KEY `serial_number` (`serial_number`);

--
-- Chỉ mục cho bảng `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `serial_number` (`serial_number`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `mac` (`mac`),
  ADD KEY `manager_id` (`manager_id`),
  ADD KEY `cat_assets_id` (`cat_assets_id`),
  ADD KEY `wh_id` (`wh_id`),
  ADD KEY `whi_id` (`whi_id`),
  ADD KEY `who_id` (`who_id`);

--
-- Chỉ mục cho bảng `assets_log`
--
ALTER TABLE `assets_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `mac` (`mac`),
  ADD KEY `wh_id` (`wh_id`),
  ADD KEY `assets_id` (`assets_id`),
  ADD KEY `manager_id` (`manager_id`),
  ADD KEY `whi_id` (`whi_id`),
  ADD KEY `who_id` (`who_id`),
  ADD KEY `cat_assets_id` (`cat_assets_id`),
  ADD KEY `serial_number` (`serial_number`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cat_assets`
--
ALTER TABLE `cat_assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `species_id` (`species_id`),
  ADD KEY `made_id` (`made_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `producer_id` (`producer_id`),
  ADD KEY `currencies_id` (`currencies_id`);

--
-- Chỉ mục cho bảng `cat_classes`
--
ALTER TABLE `cat_classes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cat_contracts`
--
ALTER TABLE `cat_contracts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cat_countries`
--
ALTER TABLE `cat_countries`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cat_currencies`
--
ALTER TABLE `cat_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cat_division`
--
ALTER TABLE `cat_division`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cat_position`
--
ALTER TABLE `cat_position`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cat_produceres`
--
ALTER TABLE `cat_produceres`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cat_species`
--
ALTER TABLE `cat_species`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cat_status`
--
ALTER TABLE `cat_status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cat_supplieres`
--
ALTER TABLE `cat_supplieres`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cat_units`
--
ALTER TABLE `cat_units`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chain`
--
ALTER TABLE `chain`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `commute`
--
ALTER TABLE `commute`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `constraints_4` (`dept_id`),
  ADD KEY `constraints_6` (`manager_id`),
  ADD KEY `status` (`status`),
  ADD KEY `status_2` (`status`),
  ADD KEY `assets_id` (`assets_id`);

--
-- Chỉ mục cho bảng `default_tb`
--
ALTER TABLE `default_tb`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `evaluate`
--
ALTER TABLE `evaluate`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `constraints_4` (`dept_id`),
  ADD KEY `constraints_6` (`manager_id`),
  ADD KEY `status` (`status`),
  ADD KEY `status_2` (`status`),
  ADD KEY `assets_id` (`assets_id`);

--
-- Chỉ mục cho bảng `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `liquidations`
--
ALTER TABLE `liquidations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `liquidation_pelf`
--
ALTER TABLE `liquidation_pelf`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `log_history`
--
ALTER TABLE `log_history`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `managers`
--
ALTER TABLE `managers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position_id` (`position_id`),
  ADD KEY `division_id` (`division_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Chỉ mục cho bảng `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `constraints_4` (`dept_id`),
  ADD KEY `status` (`status`),
  ADD KEY `status_2` (`status`);

--
-- Chỉ mục cho bảng `offers_pelf`
--
ALTER TABLE `offers_pelf`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_id` (`offers_id`),
  ADD KEY `assets_id` (`assets_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Chỉ mục cho bảng `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `constraints_4` (`dept_id`),
  ADD KEY `status` (`status`),
  ADD KEY `status_2` (`status`);

--
-- Chỉ mục cho bảng `plan_pelf`
--
ALTER TABLE `plan_pelf`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_id` (`plan_id`),
  ADD KEY `assets_id` (`assets_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`code`);

--
-- Chỉ mục cho bảng `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `constraints_11` (`dept_id`),
  ADD KEY `constraints_12` (`dept_id_2`);

--
-- Chỉ mục cho bảng `transfer_pelf`
--
ALTER TABLE `transfer_pelf`
  ADD PRIMARY KEY (`id`),
  ADD KEY `constraints_11` (`dept_id`),
  ADD KEY `constraints_12` (`dept_id_2`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `constraints_13` (`role`);

--
-- Chỉ mục cho bảng `warehouseex`
--
ALTER TABLE `warehouseex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wh_id` (`wh_id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Chỉ mục cho bảng `warehouselist`
--
ALTER TABLE `warehouselist`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `warehousing`
--
ALTER TABLE `warehousing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wh_id` (`wh_id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `accessories`
--
ALTER TABLE `accessories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `accessories_log`
--
ALTER TABLE `accessories_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `assets_log`
--
ALTER TABLE `assets_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `cat_assets`
--
ALTER TABLE `cat_assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `cat_classes`
--
ALTER TABLE `cat_classes`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `cat_contracts`
--
ALTER TABLE `cat_contracts`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cat_countries`
--
ALTER TABLE `cat_countries`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `cat_currencies`
--
ALTER TABLE `cat_currencies`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `cat_division`
--
ALTER TABLE `cat_division`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `cat_position`
--
ALTER TABLE `cat_position`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `cat_produceres`
--
ALTER TABLE `cat_produceres`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `cat_species`
--
ALTER TABLE `cat_species`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `cat_status`
--
ALTER TABLE `cat_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `cat_supplieres`
--
ALTER TABLE `cat_supplieres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `cat_units`
--
ALTER TABLE `cat_units`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `chain`
--
ALTER TABLE `chain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `commute`
--
ALTER TABLE `commute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `default_tb`
--
ALTER TABLE `default_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `evaluate`
--
ALTER TABLE `evaluate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `liquidations`
--
ALTER TABLE `liquidations`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `liquidation_pelf`
--
ALTER TABLE `liquidation_pelf`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `log_history`
--
ALTER TABLE `log_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1115;

--
-- AUTO_INCREMENT cho bảng `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `managers`
--
ALTER TABLE `managers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `offers_pelf`
--
ALTER TABLE `offers_pelf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT cho bảng `plan`
--
ALTER TABLE `plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `plan_pelf`
--
ALTER TABLE `plan_pelf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `transfer_pelf`
--
ALTER TABLE `transfer_pelf`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `warehouseex`
--
ALTER TABLE `warehouseex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `warehouselist`
--
ALTER TABLE `warehouselist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `warehousing`
--
ALTER TABLE `warehousing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
