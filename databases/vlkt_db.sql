-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 15, 2019 lúc 04:56 PM
-- Phiên bản máy phục vụ: 10.1.38-MariaDB
-- Phiên bản PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `v2-factory_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `status`) VALUES
(1, 'Chức vụ', '', 1),
(2, 'Bộ phận', '', 1),
(3, 'Nhân viên', '', 1),
(4, 'Tiền tệ', '', 1),
(5, 'Quốc gia', '', 1),
(6, 'Hợp đồng', '', 1),
(7, 'Nhóm', '', 1),
(8, 'Đợn vị tính', '', 1),
(9, 'Nhà cung cấp', '', 1),
(10, 'Hãng sản xuẩt', '', 1),
(11, 'Chủng loại', '', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_assets`
--

CREATE TABLE `cat_assets` (
  `id` int(11) NOT NULL,
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ma danh muc tai san',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ten danh muc tai san',
  `unit_price` double NOT NULL COMMENT 'Gia mac dinh cua danh muc',
  `class_id` int(11) NOT NULL COMMENT 'ID nhom tai san',
  `species_id` int(11) NOT NULL COMMENT 'ID chung loai tai san',
  `made_id` int(11) NOT NULL COMMENT 'ID quoc gia san xuat',
  `producer_id` int(11) NOT NULL COMMENT 'ID nha san suat',
  `unit_id` int(11) NOT NULL COMMENT 'ID don vi tinh',
  `currencies_id` int(11) NOT NULL COMMENT 'ID don vi tien te',
  `specification` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Thong so ky thuat',
  `note` text COLLATE utf8_unicode_ci COMMENT 'Ghi chu',
  `status` int(1) NOT NULL COMMENT 'Trang thai',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cat_assets`
--

INSERT INTO `cat_assets` (`id`, `code`, `name`, `unit_price`, `class_id`, `species_id`, `made_id`, `producer_id`, `unit_id`, `currencies_id`, `specification`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'SS123456', 'Samsung Galaxy A9 (2018)', 12000000, 1, 1, 1, 3, 1, 1, 'Màn hình:	Super AMOLED, 6.3\", Full HD+\r\nHệ điều hành:	Android 8.0 (Oreo)', '', 1, '2018-12-19 09:58:53', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_classes`
--

CREATE TABLE `cat_classes` (
  `id` int(5) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) DEFAULT '1',
  `note` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cat_classes`
--

INSERT INTO `cat_classes` (`id`, `cat_id`, `name`, `status`, `note`) VALUES
(0, 7, 'Tất cả', 1, ''),
(1, 7, 'Hàng nhập khẩu', 1, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_contracts`
--

CREATE TABLE `cat_contracts` (
  `id` int(5) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) DEFAULT '1',
  `note` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_countries`
--

CREATE TABLE `cat_countries` (
  `id` int(5) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) DEFAULT '1',
  `note` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cat_countries`
--

INSERT INTO `cat_countries` (`id`, `cat_id`, `name`, `status`, `note`) VALUES
(1, 5, 'Hàn Quốc', 1, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_currencies`
--

CREATE TABLE `cat_currencies` (
  `id` int(5) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) DEFAULT '1',
  `note` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cat_currencies`
--

INSERT INTO `cat_currencies` (`id`, `cat_id`, `name`, `status`, `note`) VALUES
(1, 4, 'VND', 1, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_division`
--

CREATE TABLE `cat_division` (
  `id` int(5) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) DEFAULT '1',
  `note` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cat_division`
--

INSERT INTO `cat_division` (`id`, `cat_id`, `name`, `status`, `note`) VALUES
(1, 2, 'Bộ phận Kỹ thuật', 1, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_employees`
--

CREATE TABLE `cat_employees` (
  `id` int(5) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) DEFAULT '1',
  `note` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_position`
--

CREATE TABLE `cat_position` (
  `id` int(5) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) DEFAULT '1',
  `note` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cat_position`
--

INSERT INTO `cat_position` (`id`, `cat_id`, `name`, `status`, `note`) VALUES
(1, 1, 'Giám đốc', 1, ''),
(2, 1, 'Tổng Giám Đốc', 1, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_produceres`
--

CREATE TABLE `cat_produceres` (
  `id` int(5) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) DEFAULT '1',
  `note` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cat_produceres`
--

INSERT INTO `cat_produceres` (`id`, `cat_id`, `name`, `status`, `note`) VALUES
(1, 10, 'Trung Quốc', 1, ''),
(2, 10, 'Sony', 1, ''),
(3, 10, 'HP', 1, ''),
(4, 10, 'Dell', 1, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_species`
--

CREATE TABLE `cat_species` (
  `id` int(5) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `info` text COLLATE utf8_unicode_ci,
  `status` int(1) DEFAULT '1',
  `note` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cat_species`
--

INSERT INTO `cat_species` (`id`, `cat_id`, `class_id`, `name`, `info`, `status`, `note`) VALUES
(1, 11, 1, 'Cái gì đó', 'Đây là gì', 1, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_status`
--

CREATE TABLE `cat_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `cat_status`
--

INSERT INTO `cat_status` (`id`, `name`) VALUES
(0, 'Dừng'),
(1, 'Hoạt động'),
(4, 'Đã xóa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_supplieres`
--

CREATE TABLE `cat_supplieres` (
  `id` int(11) NOT NULL,
  `cat_id` int(2) NOT NULL DEFAULT '9',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mstdn` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `career` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cat_supplieres`
--

INSERT INTO `cat_supplieres` (`id`, `cat_id`, `name`, `address`, `phone`, `email`, `website`, `mstdn`, `career`, `note`, `status`) VALUES
(1, 9, 'Công ty 1', '135B, Trần Hưng Đạo, P. Bến Nghé, Quận 1', '03265489956', '', 'https://congty1.com', '21354645632123', 'Cung cấp linh kiện', '', 1),
(2, 9, 'Công ty 2', '115, Trần Hưng Đạo, Phường Cầu Ông Lãnh, Quận 1', '036544846564', 'congty2@congty2.vn', 'https://congty2.vn', '5465456465465', 'Cung cấp than', NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cat_units`
--

CREATE TABLE `cat_units` (
  `id` int(5) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) DEFAULT '1',
  `note` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cat_units`
--

INSERT INTO `cat_units` (`id`, `cat_id`, `name`, `status`, `note`) VALUES
(1, 8, 'Máy', 1, NULL);

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
  `department_id` int(11) NOT NULL,
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
  `id` int(5) NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `level` int(2) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `departments`
--

INSERT INTO `departments` (`id`, `code`, `name`, `parent_id`, `level`, `status`) VALUES
(2, 'MB001', 'Tp. Hà Nội', 23, 2, 1),
(8, 'MT002', 'Tp. Nha Trang', 24, 2, 1),
(9, 'D001', 'Việt Nam', 0, 0, 1),
(10, 'MB002', 'Nghệ An', 23, 2, 1),
(11, 'MN001', 'Tp. Hồ Chí Minh', 18, 2, 1),
(12, 'MT001', 'Tp. Đà Nẵng', 24, 2, 1),
(14, 'MN002', 'Long An', 18, 2, 1),
(18, 'VN001', 'Miền Nam', 9, 1, 1),
(19, 'MN003', 'Cần Thơ', 18, 2, 1),
(23, 'VN002', 'Miền Bắc', 9, 1, 1),
(24, 'VN003', 'Miền Trung', 9, 1, 1),
(25, 'HCM001', 'Quận 1', 11, 3, 1);

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
  `department_id` int(11) NOT NULL,
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
  `actived` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `language`
--

INSERT INTO `language` (`id`, `name`, `short_name`, `path`, `icon`, `status`, `actived`) VALUES
(1, 'VIET NAM', 'VIE', '/language_file/vie', 'vietnam.png', 1, 1),
(2, 'ENGLISH', 'ENG', '/language_file/eng', 'united-states.png', 1, 0),
(3, 'CHIESE', 'CHI', '/language_file/chi', 'china.png', 1, 0),
(4, 'KOREA', 'KOR', '/language_file/kor', 'south-korea.png', 1, 0),
(5, 'Lào', 'LAO', '/language_file/lao', 'laos.png', 1, 0);

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
(1, '123456', '2019-02-26', 1, 'Hết hạn sử dụng', NULL, '12345678', 'Ghi chú', 1, '2019-02-26 11:19:03', '2019-02-26 15:52:45');

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

--
-- Đang đổ dữ liệu cho bảng `liquidation_pelf`
--

INSERT INTO `liquidation_pelf` (`id`, `liquidation_id`, `properties_id`, `note`, `pelf_quantity`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1', 3, 1, '2019-02-26 11:38:00', '2019-02-26 11:39:25');

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
(2, 1, 1, 2, 'Cập nhật tài sản ID: 16', '{\"id\":\"16\",\"code\":\"x0000002\",\"name\":\"Xe \\u00f4 to Toyota\",\"descrip1\":\"Toyota 8 ch\\u1ed5\",\"descrip2\":\"\",\"bill_num\":\"\",\"buy_date\":\"2016-01-01\",\"expired_guarantee_date\":\"2018-04-01\",\"used_date\":\"2018-10-09\",\"used_year\":\"2018\",\"price\":830150000,\"status\":\"0\",\"department_id\":\"2\",\"class_id\":\"43\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"7\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"evaluated\":0,\"balance_data\":\"[]\"}', '127.0.0.1', NULL, '2018-10-16 04:29:51'),
(3, 1, 1, 2, 'Cập nhật tài sản ID: 16', '{\"id\":\"16\",\"code\":\"x0000002\",\"name\":\"Xe \\u00f4 to Toyota\",\"descrip1\":\"Toyota 8 ch\\u1ed5\",\"descrip2\":\"\",\"bill_num\":\"\",\"buy_date\":\"2016-01-01\",\"expired_guarantee_date\":\"2018-04-01\",\"used_date\":\"2018-10-09\",\"used_year\":\"2018\",\"price\":830150000,\"status\":\"0\",\"department_id\":\"2\",\"class_id\":\"43\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"7\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"evaluated\":0,\"balance_data\":\"[]\"}', '127.0.0.1', NULL, '2018-10-16 04:35:01'),
(4, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', NULL, '2018-10-16 04:35:35'),
(5, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.118 Chrome/69.4.3497.118 Safari/537.36', '2018-10-17 00:36:08'),
(6, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.118 Chrome/69.4.3497.118 Safari/537.36', '2018-10-17 00:49:47'),
(7, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-23 05:35:07'),
(8, 1, 1, 2, 'Cập nhật tài sản ID: 16', '{\"id\":\"16\",\"code\":\"x0000002\",\"name\":\"Xe \\u00f4 to Toyota\",\"descrip1\":\"Toyota 8 ch\\u1ed5\",\"descrip2\":\"\",\"bill_num\":\"\",\"buy_date\":\"2016-01-01\",\"expired_guarantee_date\":\"2018-04-01\",\"used_date\":\"2018-10-09\",\"used_year\":\"2018\",\"price\":830150000,\"status\":\"0\",\"department_id\":\"2\",\"class_id\":\"43\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"7\",\"depreciation_total\":null,\"depreciation_type\":\"2\",\"depreciation_tm\":\"1\",\"evaluated\":0,\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-23 09:58:21'),
(9, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-24 01:01:07'),
(10, 1, 1, 2, 'Cập nhật tài sản ID: 16', '{\"id\":\"16\",\"code\":\"x0000002\",\"name\":\"Xe \\u00f4 to Toyota\",\"descrip1\":\"Toyota 8 ch\\u1ed5\",\"descrip2\":\"\",\"bill_num\":\"\",\"buy_date\":\"2016-01-01\",\"expired_guarantee_date\":\"2018-04-01\",\"used_date\":\"2018-10-09\",\"used_year\":\"2018\",\"price\":830150000,\"status\":\"0\",\"department_id\":\"2\",\"class_id\":\"43\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"7\",\"depreciation_total\":null,\"depreciation_type\":\"2\",\"depreciation_tm\":\"2\",\"evaluated\":0,\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-24 06:03:41'),
(11, 1, 1, 2, 'Cập nhật tài sản ID: 16', '{\"id\":\"16\",\"code\":\"x0000002\",\"name\":\"Xe \\u00f4 to Toyota\",\"descrip1\":\"Toyota 8 ch\\u1ed5\",\"descrip2\":\"\",\"bill_num\":\"\",\"buy_date\":\"2016-01-01\",\"expired_guarantee_date\":\"2018-04-01\",\"used_date\":\"2018-10-09\",\"used_year\":\"2018\",\"price\":830150000,\"status\":\"0\",\"department_id\":\"2\",\"class_id\":\"43\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"7\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"2\",\"evaluated\":0,\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-24 06:05:26'),
(12, 1, 1, 2, 'Cập nhật tài sản ID: 16', '{\"id\":\"16\",\"code\":\"x0000002\",\"name\":\"Xe \\u00f4 to Toyota\",\"descrip1\":\"Toyota 8 ch\\u1ed5\",\"descrip2\":\"\",\"bill_num\":\"\",\"buy_date\":\"2016-01-01\",\"expired_guarantee_date\":\"2018-04-01\",\"used_date\":\"2018-10-09\",\"used_year\":\"2018\",\"price\":830150000,\"status\":\"0\",\"department_id\":\"2\",\"class_id\":\"43\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"7\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":0,\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-24 07:26:05'),
(13, 1, 1, 2, 'Cập nhật tài sản ID: 16', '{\"id\":\"16\",\"code\":\"x0000002\",\"name\":\"Xe \\u00f4 to Toyota\",\"descrip1\":\"Toyota 8 ch\\u1ed5\",\"descrip2\":\"\",\"bill_num\":\"\",\"buy_date\":\"2016-01-01\",\"expired_guarantee_date\":\"2018-04-01\",\"used_date\":\"2018-06-06\",\"used_year\":\"2018\",\"price\":830150000,\"status\":\"0\",\"department_id\":\"2\",\"class_id\":\"43\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"7\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":0,\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-24 08:54:55'),
(14, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-25 09:30:59'),
(15, 1, 1, 2, 'Cập nhật tài sản ID: 18', '{\"id\":\"18\",\"code\":\"12345678921\",\"name\":\"T\\u00e0i s\\u1ea3n m\\u1edbi\",\"descrip1\":\"Th\\u00f4ng s\\u1ed1\",\"descrip2\":\"Kh\\u00f4ng c\\u00f3\",\"bill_num\":\"1234567893\",\"buy_date\":\"2018-10-03\",\"expired_guarantee_date\":\"2019-02-01\",\"used_date\":\"2017-09-01\",\"used_year\":\"2017\",\"price\":10000000,\"status\":\"0\",\"department_id\":\"8\",\"class_id\":\"44\",\"manager_id\":\"2\",\"location_id\":\"3\",\"depreciation_time\":\"10\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"2\",\"evaluated\":\"0\",\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-25 09:42:26'),
(16, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-26 00:42:56'),
(17, 1, 1, 2, 'Cập nhật tài sản ID: 18', '{\"id\":\"18\",\"code\":\"12345678921\",\"name\":\"T\\u00e0i s\\u1ea3n m\\u1edbi\",\"descrip1\":\"Th\\u00f4ng s\\u1ed1\",\"descrip2\":\"Kh\\u00f4ng c\\u00f3\",\"bill_num\":\"1234567893\",\"buy_date\":\"2018-10-03\",\"expired_guarantee_date\":\"2019-02-01\",\"used_date\":\"2017-09-01\",\"used_year\":\"2017\",\"price\":10000000,\"status\":\"0\",\"department_id\":\"8\",\"class_id\":\"44\",\"manager_id\":\"2\",\"location_id\":\"3\",\"depreciation_time\":\"10\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":\"0\",\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-26 00:46:18'),
(18, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-27 00:43:35'),
(19, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-30 03:59:30'),
(20, 1, 1, 2, 'Cập nhật tài sản ID: 16', '{\"id\":\"16\",\"code\":\"x0000002\",\"name\":\"Xe \\u00f4 to Toyota\",\"descrip1\":\"Toyota 8 ch\\u1ed5\",\"descrip2\":\"\",\"bill_num\":\"\",\"buy_date\":\"2016-01-01\",\"expired_guarantee_date\":\"2018-04-01\",\"used_date\":\"2018-01-01\",\"used_year\":\"2018\",\"price\":830150000,\"status\":\"0\",\"department_id\":\"2\",\"class_id\":\"43\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"7\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":\"1\",\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-10-30 08:33:28'),
(21, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-05 01:13:42'),
(22, 1, 1, 2, 'Cập nhật tài sản ID: 18', '{\"id\":\"18\",\"code\":\"12345678921\",\"name\":\"T\\u00e0i s\\u1ea3n m\\u1edbi\",\"descrip1\":\"Th\\u00f4ng s\\u1ed1\",\"descrip2\":\"Kh\\u00f4ng c\\u00f3\",\"bill_num\":\"1234567893\",\"buy_date\":\"2018-10-03\",\"expired_guarantee_date\":\"2019-02-01\",\"used_date\":\"2017-09-01\",\"used_year\":\"2017\",\"price\":10000000,\"status\":\"0\",\"department_id\":\"8\",\"class_id\":\"44\",\"manager_id\":\"2\",\"location_id\":\"3\",\"depreciation_time\":\"10\",\"depreciation_total\":null,\"depreciation_type\":\"2\",\"depreciation_tm\":\"1\",\"evaluated\":\"0\",\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-05 02:59:00'),
(23, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-07 02:48:23'),
(24, 1, 1, 2, 'Cập nhật tài khoản ID: 27', '{\"id\":\"27\",\"name\":\"QTV\",\"username\":\"qtvvp\",\"password\":\"$2y$08$WFBEK0p3cjlEN3hwUFdYU.VCuHYo.k1oclFV.veCoqIoZXaEdbHJy\",\"mail\":\"qtv@vnuhcm.edu.vn\",\"phone\":\"01234567890\",\"date_create\":\"2018-10-10 14:19:41\",\"status\":\"1\",\"picture\":\"\",\"role\":\"2\",\"department_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-07 02:54:06'),
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
(39, 1, 1, 1, 'Thêm tài khoản ID: 28', '{\"id\":\"28\",\"name\":\"Nguyen Van A\",\"username\":\"test1\",\"password\":\"$2y$08$aE1uMUM0elpYU0R1RnUxe.4rmTTwnEO\\/rfLHioAhmkNnQtrfnmCFK\",\"mail\":\"test1@gmail.com\",\"phone\":\"01236525478\",\"date_create\":\"2018-11-14 16:46:37\",\"status\":\"1\",\"picture\":\"\",\"role\":\"2\",\"department_id\":null}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-14 09:46:37'),
(40, 1, 1, 1, 'Thêm tài khoản ID: 29', '{\"id\":\"29\",\"name\":\"Nguyen Van B\",\"username\":\"test2\",\"password\":\"$2y$08$ampyUWlQTFIyNldwMjU2Muyir1jHsK\\/eoACIbvh.kAxleNA.3OJJ.\",\"mail\":\"test2@gmail.com\",\"phone\":\"0214578960\",\"date_create\":\"2018-11-14 17:11:40\",\"status\":\"1\",\"picture\":\"\",\"role\":\"2\",\"department_id\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-14 10:11:40'),
(41, 1, 1, 1, 'Thêm tài khoản ID: 30', '{\"id\":\"30\",\"name\":\"Nguyen Van C\",\"username\":\"test3\",\"password\":\"$2y$08$SytubW0xdlRuVlJsUVIrNOUsc6BPkad88eDireozcnwMvFwR8vrPG\",\"mail\":\"test3@gmail.com\",\"phone\":\"0214563250\",\"date_create\":\"2018-11-14 17:13:10\",\"status\":\"1\",\"picture\":\"\",\"role\":\"2\",\"department_id\":\"13\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-14 10:13:10'),
(42, 1, 1, 1, 'Thêm tài khoản ID: 31', '{\"id\":\"31\",\"name\":\"Nguyen Van E\",\"username\":\"test5\",\"password\":\"$2y$08$VjVTUnNHR3ZkU1EycGU3SO9vpivnyexSENFCgwpKpIq5qzUCuRI9W\",\"mail\":\"test5@gmail.com\",\"phone\":\"01234569801\",\"date_create\":\"2018-11-14 17:14:29\",\"status\":\"1\",\"picture\":\"\",\"role\":\"2\",\"department_id\":\"16\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-14 10:14:29'),
(43, 1, 1, 1, 'Thêm tài khoản ID: 32', '{\"id\":\"32\",\"name\":\"Nguyen Van D\",\"username\":\"test4\",\"password\":\"$2y$08$dVR0OHZQYVlsby9FTW81Qu9sA9g94ysEJ2.HclQ3K4HIvTsRj.JwW\",\"mail\":\"test4@gmail.com\",\"phone\":\"0231578520\",\"date_create\":\"2018-11-14 17:15:56\",\"status\":\"1\",\"picture\":\"\",\"role\":\"2\",\"department_id\":\"19\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-14 10:15:56'),
(44, 28, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-14 10:48:59'),
(45, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-19 01:27:11'),
(46, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-20 00:21:18'),
(47, 1, 1, 1, 'Thêm tài sản ID: 19', '{\"id\":\"19\",\"code\":\"LAP000123\",\"name\":\"Laptop\",\"descrip1\":\"I5-4600U\",\"descrip2\":\"Chu\\u1ed9t\",\"bill_num\":\"100000\",\"buy_date\":\"2018-10-01\",\"expired_guarantee_date\":\"2018-11-01\",\"used_date\":\"2018-11-01\",\"used_year\":\"2018\",\"price\":10000000,\"status\":\"0\",\"department_id\":\"2\",\"class_id\":\"44\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"10\",\"depreciation_total\":null,\"depreciation_type\":\"2\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-20 01:06:21'),
(48, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-20 02:16:33'),
(49, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '118.69.55.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 02:17:04'),
(50, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 06:29:50'),
(51, 1, 1, 3, 'Xóa nhóm tài sản', '{\"id\":\"30\",\"code\":\"HNN20\",\"name\":\"\\u00e1dasdasd\",\"parent_id\":\"0\",\"level\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 06:31:07'),
(52, 1, 1, 2, 'Cập nhật nhóm tài sản 43', '{\"id\":\"43\",\"code\":\"HNN00001\",\"name\":\"Ph\\u01b0\\u01a1ng ti\\u1ec7n v\\u1eadn t\\u1ea3i\",\"parent_id\":0,\"level\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 06:32:36'),
(53, 1, 1, 2, 'Cập nhật nhóm tài sản 44', '{\"id\":\"44\",\"code\":\"HNN00002\",\"name\":\"M\\u00e1y m\\u00f3c thi\\u1ebft b\\u1ecb v\\u0103n ph\\u00f2ng\",\"parent_id\":0,\"level\":\"0\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 06:33:09'),
(54, 1, 1, 2, 'Cập nhật nhóm tài sản 45', '{\"id\":\"45\",\"code\":\"HNN00003\",\"name\":\"Xe b\\u1ed1n b\\u00e1nh\",\"parent_id\":43,\"level\":\"1\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 06:33:27'),
(55, 1, 1, 3, 'Xóa nhóm tài sản', '{\"id\":\"45\",\"code\":\"HNN00003\",\"name\":\"Xe b\\u1ed1n b\\u00e1nh\",\"parent_id\":\"43\",\"level\":\"1\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 06:34:27'),
(56, 1, 1, 3, 'Xóa người sử dụng', '{\"id\":\"9\",\"code\":\"678\",\"name\":\"danhnguyenviet test\",\"department_id\":\"2\",\"note\":null}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 06:35:12'),
(57, 1, 1, 2, 'Cập nhật người sử dụng ID: 1', '{\"id\":\"1\",\"code\":\"003\",\"name\":\"Nguy\\u1ec5n Minh Th\\u01b0\",\"department_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 06:40:07'),
(58, 1, 1, 2, 'Cập nhật người sử dụng ID: 2', '{\"id\":\"2\",\"code\":\"234\",\"name\":\"Tr\\u1ea7n Ng\\u1ecdc Minh\",\"department_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 06:40:49'),
(59, 1, 1, 2, 'Cập nhật người sử dụng ID: 3', '{\"id\":\"3\",\"code\":\"001\",\"name\":\"L\\u00ea Ng\\u1ecdc A\",\"department_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:43:29'),
(60, 1, 1, 2, 'Cập nhật người sử dụng ID: 1', '{\"id\":\"1\",\"code\":\"003\",\"name\":\"Nguy\\u1ec5n V\\u0103n B\",\"department_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:43:54'),
(61, 1, 1, 2, 'Cập nhật người sử dụng ID: 2', '{\"id\":\"2\",\"code\":\"234\",\"name\":\"Tr\\u1ea7n V\\u0103n C\",\"department_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:44:17'),
(62, 1, 1, 2, 'Cập nhật người sử dụng ID: 11', '{\"id\":\"11\",\"code\":\"004\",\"name\":\"L\\u00ea Ng\\u1ecdc A\",\"department_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:45:08'),
(63, 1, 1, 2, 'Cập nhật người sử dụng ID: 11', '{\"id\":\"11\",\"code\":\"004\",\"name\":\"L\\u00ea Ng\\u1ecdc A\",\"department_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:45:57'),
(64, 1, 1, 2, 'Cập nhật người sử dụng ID: 10', '{\"id\":\"10\",\"code\":\"002\",\"name\":\"Hu\\u1ef3nh Th\\u1ecb B\",\"department_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:46:21'),
(65, 1, 1, 2, 'Cập nhật người sử dụng ID: 12', '{\"id\":\"12\",\"code\":\"005\",\"name\":\"Nguy\\u1ec5n Th\\u1ecb T\",\"department_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:46:49'),
(66, 1, 1, 2, 'Cập nhật người sử dụng ID: 14', '{\"id\":\"14\",\"code\":\"007\",\"name\":\"Nguy\\u1ec5n Th\\u1ecb Q\",\"department_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:47:26'),
(67, 1, 1, 2, 'Cập nhật người sử dụng ID: 13', '{\"id\":\"13\",\"code\":\"006\",\"name\":\"L\\u00ea Th\\u1ecb H\",\"department_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:48:00'),
(68, 1, 1, 2, 'Cập nhật người sử dụng ID: 11', '{\"id\":\"11\",\"code\":\"004\",\"name\":\"L\\u00ea Kim A\",\"department_id\":\"2\",\"note\":\"\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:48:25'),
(69, 1, 1, 1, 'Thêm tài khoản ID: 33', '{\"id\":\"33\",\"name\":\"Nguy\\u1ec5n V\\u0103n F\",\"username\":\"test6\",\"password\":\"$2y$08$c3BXc1o1Q1Vrb2s3ZkZvM.u.aiqKyjXfH1ZwdTDfAMuYazhQZbGXK\",\"mail\":\"test6@gmail.com\",\"phone\":\"0902155622\",\"date_create\":\"2018-11-20 14:52:27\",\"status\":\"1\",\"picture\":\"\",\"role\":\"3\",\"department_id\":\"2\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:52:27'),
(70, 1, 1, 1, 'Thêm tài khoản ID: 34', '{\"id\":\"34\",\"name\":\"Nguy\\u1ec5n V\\u0103n G\",\"username\":\"test7\",\"password\":\"$2y$08$SmRpUkdBTGR1alBtWCt3QO0oTd2wZ.qco91qiJ2tLo2pVoU8t\\/V1u\",\"mail\":\"test7@gmail.com\",\"phone\":\"0256885664\",\"date_create\":\"2018-11-20 14:55:26\",\"status\":\"1\",\"picture\":\"\",\"role\":\"3\",\"department_id\":\"2\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:55:26'),
(71, 1, 1, 1, 'Thêm tài khoản ID: 35', '{\"id\":\"35\",\"name\":\"Nguy\\u1ec5n V\\u0103n H\",\"username\":\"test8\",\"password\":\"$2y$08$bVpSYjFFQVVjcHNtcWpqTOPGstkWX9e4DvVVBGfkDH6q5ek23EUBi\",\"mail\":\"test8@gmail.com\",\"phone\":\"0932888656\",\"date_create\":\"2018-11-20 14:57:33\",\"status\":\"1\",\"picture\":\"\",\"role\":\"3\",\"department_id\":\"2\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:57:33'),
(72, 1, 1, 1, 'Thêm tài khoản ID: 36', '{\"id\":\"36\",\"name\":\"Nguy\\u1ec5n V\\u0103n K\",\"username\":\"test9\",\"password\":\"$2y$08$NDViMTZ2cGVuTGFPSW5BduLTlB4YaDdnqFX8LMlR7i95d\\/q.PW7g2\",\"mail\":\"test9@gmai.com\",\"phone\":\"0932814032\",\"date_create\":\"2018-11-20 14:59:02\",\"status\":\"1\",\"picture\":\"\",\"role\":\"3\",\"department_id\":\"2\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 07:59:02'),
(73, 1, 1, 2, 'Cập nhật đơn vị ID: 1', '{\"id\":\"1\",\"department_id\":\"2\",\"code\":\"HNNL00001\",\"name\":\"P.101\",\"parent_id\":\"2\",\"level\":1}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:00:45'),
(74, 1, 1, 2, 'Cập nhật đơn vị ID: 3', '{\"id\":\"3\",\"department_id\":\"2\",\"code\":\"HNNL00002\",\"name\":\"P.103\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:01:33'),
(75, 1, 1, 2, 'Cập nhật đơn vị ID: 16', '{\"id\":\"16\",\"department_id\":\"2\",\"code\":\"HNNL00003\",\"name\":\"Ph\\u00f2ng QTTB\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:01:51'),
(76, 1, 1, 2, 'Cập nhật đơn vị ID: 2', '{\"id\":\"2\",\"department_id\":\"2\",\"code\":\"HNN00004\",\"name\":\"P.102\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:02:10'),
(77, 1, 1, 1, 'Thêm vị trí ID: 17', '{\"id\":\"17\",\"department_id\":\"2\",\"code\":\"HNN00005\",\"name\":\"P.104\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:03:19'),
(78, 1, 1, 2, 'Cập nhật đơn vị ID: 17', '{\"id\":\"17\",\"department_id\":\"2\",\"code\":\"HNNL00005\",\"name\":\"P.104\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:03:38'),
(79, 1, 1, 1, 'Thêm vị trí ID: 18', '{\"id\":\"18\",\"department_id\":\"2\",\"code\":\"HNNL00006\",\"name\":\"P.105\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:04:05'),
(80, 1, 1, 1, 'Thêm vị trí ID: 19', '{\"id\":\"19\",\"department_id\":\"2\",\"code\":\"HNNL00007\",\"name\":\"P.106\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:04:49'),
(81, 1, 1, 1, 'Thêm vị trí ID: 20', '{\"id\":\"20\",\"department_id\":\"2\",\"code\":\"HNNL00008\",\"name\":\"P.107\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:05:21'),
(82, 1, 1, 1, 'Thêm vị trí ID: 21', '{\"id\":\"21\",\"department_id\":\"2\",\"code\":\"HNNL00009\",\"name\":\"P.107\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:06:04'),
(83, 1, 1, 2, 'Cập nhật đơn vị ID: 21', '{\"id\":\"21\",\"department_id\":\"2\",\"code\":\"HNNL00009\",\"name\":\"P.108\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:06:15'),
(84, 1, 1, 1, 'Thêm vị trí ID: 22', '{\"id\":\"22\",\"department_id\":\"2\",\"code\":\"HNNL000010\",\"name\":\"P.109\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:06:55'),
(85, 1, 1, 2, 'Cập nhật đơn vị ID: 16', '{\"id\":\"16\",\"department_id\":\"9\",\"code\":\"HNNL00003\",\"name\":\"P.110\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:21:15'),
(86, 1, 1, 2, 'Cập nhật đơn vị ID: 22', '{\"id\":\"22\",\"department_id\":\"8\",\"code\":\"HNNL000010\",\"name\":\"P.109\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:21:29'),
(87, 1, 1, 2, 'Cập nhật đơn vị ID: 21', '{\"id\":\"21\",\"department_id\":\"11\",\"code\":\"HNNL00009\",\"name\":\"P.108\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:21:44'),
(88, 1, 1, 2, 'Cập nhật đơn vị ID: 19', '{\"id\":\"19\",\"department_id\":\"11\",\"code\":\"HNNL00007\",\"name\":\"P.106\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:22:06'),
(89, 1, 1, 2, 'Cập nhật đơn vị ID: 17', '{\"id\":\"17\",\"department_id\":\"19\",\"code\":\"HNNL00005\",\"name\":\"P.104\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:22:20'),
(90, 1, 1, 2, 'Cập nhật đơn vị ID: 17', '{\"id\":\"17\",\"department_id\":\"19\",\"code\":\"HNNL00005\",\"name\":\"P.104\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:23:07'),
(91, 1, 1, 2, 'Cập nhật đơn vị ID: 1', '{\"id\":\"1\",\"department_id\":\"2\",\"code\":\"HNNL00001\",\"name\":\"P.101\",\"parent_id\":\"2\",\"level\":1}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:23:20'),
(92, 1, 1, 2, 'Cập nhật đơn vị ID: 1', '{\"id\":\"1\",\"department_id\":\"2\",\"code\":\"HNNL00001\",\"name\":\"P.101\",\"parent_id\":\"2\",\"level\":1}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:23:25'),
(93, 1, 1, 2, 'Cập nhật đơn vị ID: 1', '{\"id\":\"1\",\"department_id\":\"2\",\"code\":\"HNNL00001\",\"name\":\"P.101\",\"parent_id\":\"2\",\"level\":1}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:24:04'),
(94, 1, 1, 2, 'Cập nhật đơn vị ID: 1', '{\"id\":\"1\",\"department_id\":\"2\",\"code\":\"HNNL00001\",\"name\":\"P.101\",\"parent_id\":\"2\",\"level\":1}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:24:19'),
(95, 1, 1, 2, 'Cập nhật đơn vị ID: 1', '{\"id\":\"1\",\"department_id\":\"2\",\"code\":\"HNNL00001\",\"name\":\"P.101\",\"parent_id\":\"2\",\"level\":1}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:24:29'),
(96, 1, 1, 2, 'Cập nhật đơn vị ID: 3', '{\"id\":\"3\",\"department_id\":\"12\",\"code\":\"HNNL00002\",\"name\":\"P.103\",\"parent_id\":0,\"level\":0}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 08:24:46'),
(97, 27, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 09:32:31'),
(98, 27, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 09:34:29'),
(99, 27, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-20 09:36:08'),
(100, 34, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 09:37:55'),
(101, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 09:40:36'),
(102, 1, 1, 1, 'Thêm tài sản ID: 20', '{\"id\":\"20\",\"code\":\"HNNP00001\",\"name\":\"Laptop\",\"descrip1\":\"DEll-5557\",\"descrip2\":\"Chu\\u1ed9t\",\"bill_num\":\"123456\",\"buy_date\":\"2016-10-28\",\"expired_guarantee_date\":\"2018-10-28\",\"used_date\":\"2016-10-29\",\"used_year\":\"2016\",\"price\":15000000,\"status\":\"0\",\"department_id\":\"2\",\"class_id\":\"44\",\"manager_id\":\"1\",\"location_id\":\"2\",\"depreciation_time\":\"30\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 09:46:41'),
(103, 1, 1, 1, 'Thêm tài sản ID: 21', '{\"id\":\"21\",\"code\":\"HNNP00002\",\"name\":\"Laptop\",\"descrip1\":\"DEll-5557\",\"descrip2\":\"Chu\\u1ed9t\",\"bill_num\":\"123456\",\"buy_date\":\"2016-10-28\",\"expired_guarantee_date\":\"2018-10-28\",\"used_date\":\"2016-10-29\",\"used_year\":\"2016\",\"price\":15000000,\"status\":\"0\",\"department_id\":\"2\",\"class_id\":\"44\",\"manager_id\":\"1\",\"location_id\":\"2\",\"depreciation_time\":\"30\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 09:52:05'),
(104, 1, 1, 1, 'Thêm tài sản ID: 22', '{\"id\":\"22\",\"code\":\"HNNP00003\",\"name\":\"B\\u00e0n\",\"descrip1\":\"123456\",\"descrip2\":\"No\",\"bill_num\":\"123456\",\"buy_date\":\"2015-10-29\",\"expired_guarantee_date\":\"2016-11-08\",\"used_date\":\"2015-10-30\",\"used_year\":\"2015\",\"price\":1000000,\"status\":\"1\",\"department_id\":\"2\",\"class_id\":\"44\",\"manager_id\":\"11\",\"location_id\":\"2\",\"depreciation_time\":\"1\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"2\",\"evaluated\":null,\"balance_data\":\"[]\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 09:55:43'),
(105, 1, 1, 1, 'Thêm tài sản ID: 23', '{\"id\":\"23\",\"code\":\"HNNP00006\",\"name\":\"Gh\\u1ebf\",\"descrip1\":\"GH005\",\"descrip2\":\"Kh\\u00f4ng\",\"bill_num\":\"136566\",\"buy_date\":\"2015-10-29\",\"expired_guarantee_date\":\"2016-11-08\",\"used_date\":\"2015-10-30\",\"used_year\":\"2015\",\"price\":500000,\"status\":\"1\",\"department_id\":\"2\",\"class_id\":\"44\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"2\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"2\",\"evaluated\":null,\"balance_data\":\"[]\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 10:02:58'),
(106, 1, 1, 1, 'Thêm tài sản ID: 24', '{\"id\":\"24\",\"code\":\"HNNP00008\",\"name\":\"M\\u00e1y l\\u1ea1nh\",\"descrip1\":\"ML004\",\"descrip2\":\"kh\\u00f4ng\",\"bill_num\":\"1885652\",\"buy_date\":\"2017-11-01\",\"expired_guarantee_date\":\"2018-11-08\",\"used_date\":\"2018-11-02\",\"used_year\":\"2018\",\"price\":7000000,\"status\":\"0\",\"department_id\":\"2\",\"class_id\":\"44\",\"manager_id\":\"3\",\"location_id\":\"2\",\"depreciation_time\":\"2\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 10:08:10'),
(107, 1, 1, 1, 'Thêm tài sản ID: 25', '{\"id\":\"25\",\"code\":\"HNNP000010\",\"name\":\"\\u0110\\u00e8n\",\"descrip1\":\"15866\",\"descrip2\":\"Kh\\u00f4ng\",\"bill_num\":\"1548665\",\"buy_date\":\"2018-09-29\",\"expired_guarantee_date\":\"2018-12-08\",\"used_date\":\"2018-09-30\",\"used_year\":\"2018\",\"price\":50000,\"status\":\"0\",\"department_id\":\"2\",\"class_id\":\"44\",\"manager_id\":\"1\",\"location_id\":\"2\",\"depreciation_time\":\"1\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 10:14:29'),
(108, 1, 1, 1, 'Thêm tài sản ID: 26', '{\"id\":\"26\",\"code\":\"HNNP000011\",\"name\":\"Qu\\u1ea1t\",\"descrip1\":\"Q1548552\",\"descrip2\":\"Kh\\u00f4ng\",\"bill_num\":\"159896\",\"buy_date\":\"2016-10-28\",\"expired_guarantee_date\":\"2017-10-29\",\"used_date\":\"2016-10-30\",\"used_year\":\"2016\",\"price\":1500000,\"status\":\"0\",\"department_id\":\"2\",\"class_id\":\"44\",\"manager_id\":\"2\",\"location_id\":\"2\",\"depreciation_time\":\"1\",\"depreciation_total\":null,\"depreciation_type\":\"2\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 10:15:52'),
(109, 1, 1, 1, 'Thêm tài sản ID: 27', '{\"id\":\"27\",\"code\":\"HNNP000012\",\"name\":\"T\\u1ee7\",\"descrip1\":\"T055465\",\"descrip2\":\"Kh\\u00f4ng\",\"bill_num\":\"321678866\",\"buy_date\":\"2017-10-31\",\"expired_guarantee_date\":\"2018-11-01\",\"used_date\":\"2017-10-30\",\"used_year\":\"2017\",\"price\":5500000,\"status\":\"0\",\"department_id\":\"2\",\"class_id\":\"44\",\"manager_id\":\"10\",\"location_id\":\"2\",\"depreciation_time\":\"3\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 10:18:11'),
(110, 1, 1, 1, 'Thêm tài sản ID: 28', '{\"id\":\"28\",\"code\":\"HNNP000014\",\"name\":\"M\\u00e1y t\\u00ednh b\\u00e0n\",\"descrip1\":\"2565\",\"descrip2\":\"CPU + Chu\\u1ed9t\",\"bill_num\":\"316598989\",\"buy_date\":\"2015-10-29\",\"expired_guarantee_date\":\"2016-11-08\",\"used_date\":\"2015-10-30\",\"used_year\":\"2015\",\"price\":7000000,\"status\":\"0\",\"department_id\":\"2\",\"class_id\":\"44\",\"manager_id\":\"11\",\"location_id\":\"2\",\"depreciation_time\":\"2\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '2018-11-20 10:22:22'),
(111, 27, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-20 11:46:23'),
(112, 27, 1, 4, 'Tài khoản đã đăng nhập', NULL, '103.88.120.6', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-20 11:57:21'),
(113, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '58.186.140.229', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-20 20:32:53'),
(114, 27, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-20 21:39:08'),
(115, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-20 21:40:32'),
(116, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-21 00:53:43'),
(117, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-23 01:52:06'),
(118, 1, 1, 1, 'Thêm tài khoản ID: 37', '{\"id\":\"37\",\"name\":\"Nguyen Duy\",\"username\":\"admin1234\",\"password\":\"$2y$08$dzJPU09YVWZubisyWnFvTeNk\\/ilLiatbBhRf9MvJOzd3ZARM\\/ruMa\",\"mail\":\"admin1@gmail.com\",\"phone\":\"0323456985\",\"avatar\":null,\"role\":\"2\",\"department_id\":\"2\",\"status\":\"1\",\"created_at\":\"2018-11-23 10:17:32\",\"updated_at\":null}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-23 03:17:32'),
(119, 1, 1, 2, 'Cập nhật tài khoản ID: 27', '{\"id\":\"27\",\"name\":\"QTV\",\"username\":\"qtvvp\",\"password\":\"h@neynet.vn2018\",\"mail\":\"qtv@vnuhcm.edu.vn\",\"phone\":\"0352254987\",\"avatar\":\"\",\"role\":\"2\",\"department_id\":\"2\",\"status\":\"1\",\"created_at\":\"2018-10-10 14:19:41\",\"updated_at\":\"2018201820182018-NovNov-FriFri 10:41:11\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-23 03:41:11'),
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
(136, 1, 1, 1, 'Thêm tài khoản ID: 38', '{\"id\":\"38\",\"name\":\"aaaaaaaaa\",\"username\":\"aaaaaa\",\"password\":\"$2y$08$dG54TTFmUTJZTmUyb1RUOOFBhikCJYaWgIkHzB3O0JyD9ZD.7ykRm\",\"mail\":\"aaa@aaaa\",\"phone\":\"0323456754\",\"avatar\":null,\"role\":\"2\",\"department_id\":\"8\",\"department_mg\":null,\"status\":\"1\",\"created_at\":\"2018-11-26 00:29:50\",\"updated_at\":null}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-25 17:29:50');
INSERT INTO `log_history` (`id`, `user_id`, `page`, `type`, `name`, `detail`, `ip`, `device`, `created_at`) VALUES
(137, 1, 1, 1, 'Thêm tài khoản ID: 39', '{\"id\":\"39\",\"name\":\"aaaa\",\"username\":\"aaaaaaaaaaa\",\"password\":\"$2y$08$MDc3RWZUaXpGSWVtQlMwT.3cD\\/8\\/QmV0RWwVvLfk8JVxRCX8kQnK.\",\"mail\":\"aaaaaaaa@aaaaaaa\",\"phone\":\"0365455122\",\"avatar\":null,\"role\":\"2\",\"department_id\":\"8\",\"department_mg\":\"null\",\"status\":\"1\",\"created_at\":\"2018-11-26 12:05:35\",\"updated_at\":null}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 05:05:35'),
(138, 1, 1, 1, 'Thêm tài khoản ID: 40', '{\"id\":\"40\",\"name\":\"aaaaaaaaa\",\"username\":\"aaaaaaaaa\",\"password\":\"$2y$08$Vng4Z21scnRVY21sYi8rOOEdLv0kD6AGDdzOBgGn7fFK3GJIJtVcC\",\"mail\":\"aaaaaaaa@aaaaaaaaa\",\"phone\":\"0345678998\",\"avatar\":null,\"role\":\"2\",\"department_id\":\"8\",\"department_mg\":\"null\",\"status\":\"1\",\"created_at\":\"2018-11-26 12:07:34\",\"updated_at\":null}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 05:07:34'),
(139, 1, 1, 1, 'Thêm tài khoản ID: 41', '{\"id\":\"41\",\"name\":\"aaaaaaaaaaaa\",\"username\":\"aaaaaaaaaaaaaa\",\"password\":\"$2y$08$SG5HdDh3VFRiWXVnRlZiS.oEBpgr30BMMOj87A3g8FdyWIxASu2iG\",\"mail\":\"aaaaaaa@gail.com\",\"phone\":\"0355555555\",\"avatar\":null,\"role\":\"2\",\"department_id\":\"8\",\"department_mg\":\"[\\\"9\\\",\\\"23\\\",\\\"10\\\",\\\"2\\\",\\\"18\\\",\\\"19\\\",\\\"14\\\",\\\"11\\\",\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 12:13:46\",\"updated_at\":\"2018-11-26 12:13:46\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 05:13:46'),
(140, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 05:15:52'),
(141, 1, 1, 2, 'Cập nhật tài khoản ID: 41', '{\"id\":\"41\",\"name\":\"aaaaaaaaaaaa\",\"username\":\"aaaaaaaaaaaaaa\",\"password\":\"$2y$08$SG5HdDh3VFRiWXVnRlZiS.oEBpgr30BMMOj87A3g8FdyWIxASu2iG\",\"mail\":\"aaaaaaa@gail.com\",\"phone\":\"0355555555\",\"avatar\":\"aaaaaaaaaaaa\",\"role\":\"2\",\"department_id\":\"8\",\"department_mg\":\"[\\\"9\\\",\\\"23\\\",\\\"10\\\",\\\"2\\\",\\\"18\\\",\\\"19\\\",\\\"14\\\",\\\"11\\\",\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 12:13:46\",\"updated_at\":\"2018201820182018-NovNov-MonMon 13:31:54\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 06:31:54'),
(142, 1, 1, 2, 'Cập nhật tài khoản ID: 41', '{\"id\":\"41\",\"name\":\"aaaaaaaaaaaa\",\"username\":\"aaaaaaaaaaaaaa\",\"password\":\"$2y$08$SG5HdDh3VFRiWXVnRlZiS.oEBpgr30BMMOj87A3g8FdyWIxASu2iG\",\"mail\":\"aaaaaaa@gail.com\",\"phone\":\"0355555555\",\"avatar\":\"aaaaaaaaaaaa\",\"role\":\"2\",\"department_id\":\"8\",\"department_mg\":\"[\\\"9\\\",\\\"23\\\",\\\"10\\\",\\\"2\\\",\\\"18\\\",\\\"19\\\",\\\"14\\\",\\\"11\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 12:13:46\",\"updated_at\":\"2018201820182018-NovNov-MonMon 13:32:04\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 06:32:04'),
(143, 1, 1, 2, 'Cập nhật tài khoản ID: 41', '{\"id\":\"41\",\"name\":\"aaaaaaaaaaaa\",\"username\":\"aaaaaaaaaaaaaa\",\"password\":\"$2y$08$SG5HdDh3VFRiWXVnRlZiS.oEBpgr30BMMOj87A3g8FdyWIxASu2iG\",\"mail\":\"aaaaaaa@gail.com\",\"phone\":\"0355555555\",\"avatar\":\"aaaaaaaaaaaa\",\"role\":\"2\",\"department_id\":\"8\",\"department_mg\":\"[\\\"9\\\",\\\"23\\\",\\\"10\\\",\\\"2\\\",\\\"18\\\",\\\"19\\\",\\\"14\\\",\\\"11\\\",\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 12:13:46\",\"updated_at\":\"2018201820182018-NovNov-MonMon 13:32:11\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 06:32:11'),
(144, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 06:59:40'),
(145, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 07:05:02'),
(146, 26, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 07:07:40'),
(147, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 07:08:30'),
(148, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 07:57:55'),
(149, 1, 1, 2, 'Cập nhật tài khoản ID: 41', '{\"id\":\"41\",\"name\":\"aaaaaaaaaaaa\",\"username\":\"aaaaaaaaaaaaaa\",\"password\":\"$2y$08$SG5HdDh3VFRiWXVnRlZiS.oEBpgr30BMMOj87A3g8FdyWIxASu2iG\",\"mail\":\"aaaaaaa@gail.com\",\"phone\":\"0355555555\",\"avatar\":\"aaaaaaaaaaaa\",\"role\":\"2\",\"department_id\":\"8\",\"department_mg\":\"[\\\"9\\\",\\\"23\\\",\\\"10\\\",\\\"2\\\",\\\"18\\\",\\\"19\\\",\\\"14\\\",\\\"11\\\",\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 12:13:46\",\"updated_at\":\"2018201820182018-NovNov-MonMon 14:58:16\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 07:58:16'),
(150, 1, 1, 2, 'Cập nhật tài khoản ID: 41', '{\"id\":\"41\",\"name\":\"aaaaaaaaaaaa\",\"username\":\"aaaaaaaaaaaaaa\",\"password\":\"$2y$08$SG5HdDh3VFRiWXVnRlZiS.oEBpgr30BMMOj87A3g8FdyWIxASu2iG\",\"mail\":\"aaaaaaa@gail.com\",\"phone\":\"0355555555\",\"avatar\":\"aaaaaaaaaaaa\",\"role\":\"2\",\"department_id\":\"8\",\"department_mg\":\"[\\\"9\\\",\\\"23\\\",\\\"10\\\",\\\"2\\\",\\\"18\\\",\\\"19\\\",\\\"14\\\",\\\"11\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 12:13:46\",\"updated_at\":\"2018201820182018-NovNov-MonMon 14:58:23\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 07:58:23'),
(151, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 07:59:12'),
(152, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 07:59:29'),
(153, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 07:59:45'),
(154, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 07:59:55'),
(155, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 08:00:00'),
(156, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 08:00:05'),
(157, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 08:00:10'),
(158, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 08:00:16'),
(159, 1, 1, 1, 'Thêm tài khoản ID: 42', '{\"id\":\"42\",\"name\":\"Nguyen Van Test 1\",\"username\":\"test1\",\"password\":\"$2y$08$eG1nbncxQUwvazZidkw1VOlyGiW6.6BbyNfeap41nBXBFx5ci4LgG\",\"mail\":\"test1@gmail.com\",\"phone\":\"0352222333\",\"avatar\":null,\"role\":\"2\",\"department_id\":\"2\",\"department_mg\":\"[\\\"23\\\",\\\"10\\\",\\\"2\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 15:01:50\",\"updated_at\":\"2018-11-26 15:01:50\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 08:01:50'),
(160, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 08:02:01'),
(161, 42, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 08:02:49'),
(162, 42, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 08:03:47'),
(163, 42, 1, 1, 'Thêm tài khoản ID: 43', '{\"id\":\"43\",\"name\":\"aaaaaaaaaaaaaaaaa\",\"username\":\"aaaaaa\",\"password\":\"$2y$08$bzhzSEpzSGtOY2FGTzhiZuiaxOqhIhl.Yqn8b\\/UMc0HtE1EIIYZpO\",\"mail\":\"aaaaaaaaaaaaaaa@aaa\",\"phone\":\"0311111111\",\"avatar\":null,\"role\":\"2\",\"department_id\":\"2\",\"department_mg\":\"[\\\"2\\\",\\\"10\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 15:55:13\",\"updated_at\":\"2018-11-26 15:55:13\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 08:55:13'),
(164, 42, 1, 2, 'Cập nhật tài khoản ID: 43', '{\"id\":\"43\",\"name\":\"aaaaaaaaaaaaaaaaa\",\"username\":\"aaaaaa\",\"password\":\"$2y$08$bzhzSEpzSGtOY2FGTzhiZuiaxOqhIhl.Yqn8b\\/UMc0HtE1EIIYZpO\",\"mail\":\"aaaaaaaaaaaaaaa@aaa\",\"phone\":\"0311111111\",\"avatar\":\"aaaaaaaaaaaaaaaaa\",\"role\":\"2\",\"department_id\":\"2\",\"department_mg\":\"[\\\"2\\\",\\\"10\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 15:55:13\",\"updated_at\":\"2018201820182018-NovNov-MonMon 16:14:48\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:14:48'),
(165, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:21:00'),
(166, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:22:18'),
(167, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:30:22'),
(168, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:30:49'),
(169, 1, 1, 2, 'Cập nhật đơn vị ID: 9', '{\"id\":\"9\",\"code\":\"D001\",\"name\":\"Vi\\u1ec7t Nam\",\"parent_id\":0,\"level\":0,\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:34:18'),
(170, 1, 1, 3, 'Xóa tài khoản', 'null', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:35:44'),
(171, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:37:14'),
(172, 2, 1, 1, 'Thêm tài khoản ID: 44', '{\"id\":\"44\",\"name\":\"Nguyen Van Test 2\",\"username\":\"test2\",\"password\":\"$2y$08$TXoyNE9rR0dpU1M0cE9ieONkxhPn2zrwK5FuKak7PMfaebqZL\\/0p.\",\"mail\":\"test2@gmail.com\",\"phone\":\"0356666666\",\"avatar\":null,\"role\":\"3\",\"department_id\":\"2\",\"department_mg\":\"[\\\"2\\\"]\",\"status\":\"0\",\"created_at\":\"2018-11-26 16:39:20\",\"updated_at\":\"2018-11-26 16:39:20\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:39:20'),
(173, 2, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:39:47'),
(174, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:40:09'),
(175, 1, 1, 2, 'Cập nhật tài khoản ID: 44', '{\"id\":\"44\",\"name\":\"Nguyen Van Test 2\",\"username\":\"test2\",\"password\":\"$2y$08$TXoyNE9rR0dpU1M0cE9ieONkxhPn2zrwK5FuKak7PMfaebqZL\\/0p.\",\"mail\":\"test2@gmail.com\",\"phone\":\"0356666666\",\"avatar\":\"Nguyen Van Test 2\",\"role\":\"3\",\"department_id\":\"2\",\"department_mg\":\"[\\\"2\\\"]\",\"status\":\"1\",\"created_at\":\"2018-11-26 16:39:20\",\"updated_at\":\"2018201820182018-NovNov-MonMon 16:41:04\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-26 09:41:04'),
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
(186, 2, 1, 1, 'Thêm người sử dụng ID: 15', '{\"id\":\"15\",\"code\":\"12345678\",\"name\":\"Nguyen Van C\",\"department_id\":\"2\",\"note\":null,\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-27 08:22:25'),
(187, 2, 1, 2, 'Cập nhật người sử dụng ID: 15', '{\"id\":\"15\",\"code\":\"12345678\",\"name\":\"Nguyen Van C\",\"department_id\":\"2\",\"note\":null,\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-27 08:28:21'),
(188, 2, 1, 2, 'Cập nhật người sử dụng ID: 15', '{\"id\":\"15\",\"code\":\"12345678\",\"name\":\"Nguyen Van C\",\"department_id\":\"2\",\"location_id\":\"0\",\"note\":null,\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-27 08:30:21'),
(189, 2, 1, 2, 'Cập nhật người sử dụng ID: 15', '{\"id\":\"15\",\"code\":\"12345678\",\"name\":\"Nguyen Van C\",\"department_id\":\"2\",\"location_id\":\"1\",\"note\":null,\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-27 08:31:57'),
(190, 2, 1, 3, 'Xóa người sử dụng', '{\"id\":\"2\",\"code\":\"234\",\"name\":\"Tr\\u1ea7n V\\u0103n C\",\"department_id\":\"2\",\"location_id\":\"0\",\"note\":\"\",\"status\":4}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-27 08:46:17'),
(191, 2, 1, 2, 'Cập nhật vị trí ID: 20', '{\"id\":\"20\",\"department_id\":\"2\",\"code\":\"HNNL00008\",\"name\":\"P.107\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/75.4.124 Chrome/69.4.3497.124 Safari/537.36', '2018-11-27 09:07:34'),
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
(281, 1, 1, 2, 'Cập nhật người dùng ID: 2', '{\"id\":\"2\",\"code\":\"234\",\"name\":\"Tr\\u1ea7n V\\u0103n C\",\"department_id\":\"2\",\"location_id\":\"1\",\"note\":\"\",\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-03 08:54:28'),
(282, 1, 1, 2, 'Cập nhật người dùng ID: 2', '{\"id\":\"2\",\"code\":\"234\",\"name\":\"Tr\\u1ea7n V\\u0103n C\",\"department_id\":\"2\",\"location_id\":\"1\",\"note\":\"\",\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-03 08:55:15');
INSERT INTO `log_history` (`id`, `user_id`, `page`, `type`, `name`, `detail`, `ip`, `device`, `created_at`) VALUES
(283, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.102 Chrome/70.0.3538.102 Safari/537.36', '2018-12-04 01:12:31'),
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
(321, 1, 1, 1, 'Thêm tài sản ID: 1', '{\"id\":\"1\",\"code\":\"M123456\",\"name\":\"Laptop HP 15 da0054TU\",\"descrip1\":\"i3 7020U\\/4GB\\/500GB\\/Win10\\/(4ME68PA)\",\"descrip2\":\"Chu\\u1ed9t Misusi\",\"bill_num\":\"123456\",\"buy_date\":\"2018-12-12\",\"expired_guarantee_date\":\"2023-12-12\",\"used_date\":\"2018-12-12\",\"used_year\":\"2018\",\"price\":10000000,\"class_id\":\"1\",\"unit_id\":\"1\",\"producer_id\":\"1\",\"supplier_id\":\"1\",\"status\":\"0\",\"department_id\":\"2\",\"manager_id\":\"1\",\"location_id\":\"1\",\"depreciation_time\":\"10\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 00:52:30'),
(322, 1, 1, 1, 'Thêm tài sản ID: 2', '{\"id\":\"2\",\"code\":\"M654321\",\"name\":\"Laptop Dell Inspiron 3576\",\"descrip1\":\"i5 8250U\\/4GB\\/1TB\\/Win10\\/(P63F002N76F)\",\"descrip2\":\"Chu\\u1ed9t Misusi\",\"bill_num\":\"2345678\",\"buy_date\":\"2018-12-13\",\"expired_guarantee_date\":\"2018-12-12\",\"used_date\":\"2018-12-01\",\"used_year\":\"2018\",\"price\":1000000,\"class_id\":\"1\",\"unit_id\":\"1\",\"producer_id\":\"1\",\"supplier_id\":\"1\",\"status\":\"0\",\"department_id\":\"2\",\"manager_id\":\"1\",\"location_id\":\"1\",\"depreciation_time\":\"10\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 00:58:52'),
(323, 1, 1, 1, 'Thêm mới danh mục ID: 2', '{\"id\":\"2\",\"cat_id\":\"9\",\"name\":\"Dell\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 00:59:28'),
(324, 1, 1, 1, 'Thêm mới danh mục ID: 3', '{\"id\":\"3\",\"cat_id\":\"9\",\"name\":\"HP\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 00:59:45'),
(325, 1, 1, 1, 'Thêm mới danh mục ID: 4', '{\"id\":\"4\",\"cat_id\":\"9\",\"name\":\"Assus\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 00:59:56'),
(326, 1, 1, 1, 'Thêm mới danh mục ID: 5', '{\"id\":\"5\",\"cat_id\":\"9\",\"name\":\"Sony\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 01:00:10'),
(327, 1, 1, 1, 'Thêm mới danh mục ID: 2', '{\"id\":\"2\",\"cat_id\":\"10\",\"name\":\"Sony\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 01:00:33'),
(328, 1, 1, 1, 'Thêm mới danh mục ID: 3', '{\"id\":\"3\",\"cat_id\":\"10\",\"name\":\"HP\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 01:00:39'),
(329, 1, 1, 1, 'Thêm mới danh mục ID: 4', '{\"id\":\"4\",\"cat_id\":\"10\",\"name\":\"Dell\",\"status\":\"1\",\"note\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 01:00:58'),
(330, 1, 1, 1, 'Thêm tài sản ID: 3', '{\"id\":\"3\",\"code\":\"M2341456\",\"name\":\"Laptop Asus VivoBook S15 S510UA\",\"descrip1\":\"i3 8130U\\/4GB\\/1TB\\/Win10\\/(BQ222T)\",\"descrip2\":\"Chu\\u1ed9t Misusi\",\"bill_num\":\"321654\",\"buy_date\":\"2018-12-12\",\"expired_guarantee_date\":\"2018-12-12\",\"used_date\":\"2018-12-12\",\"used_year\":\"2018\",\"price\":1000000,\"class_id\":\"1\",\"unit_id\":\"1\",\"producer_id\":\"2\",\"supplier_id\":\"4\",\"status\":\"0\",\"department_id\":\"2\",\"manager_id\":\"1\",\"location_id\":\"1\",\"depreciation_time\":\"10\",\"depreciation_total\":null,\"depreciation_type\":\"1\",\"depreciation_tm\":\"1\",\"evaluated\":null,\"balance_data\":\"[]\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.112 Chrome/70.0.3538.112 Safari/537.36', '2018-12-12 01:03:52'),
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
(366, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NhaKho0111\",\"name\":\"Nh\\u00e0 Kho K\\u1ef9 thu\\u1eadt\",\"department_id\":\"2\",\"manager_id\":\"1\",\"description\":\"\",\"diagram\":null,\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2018-12-17 06:46:44'),
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
(390, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NhaKho0111\",\"name\":\"Nh\\u00e0 Kho K\\u1ef9 thu\\u1eadt\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"5\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"500\",\"pallet_used\":\"0\",\"description\":\"\",\"gates_in\":\"0\",\"gates_out\":\"0\",\"status\":\"1\",\"created_at\":\"2018-12-25 10:05:02\",\"updated_at\":\"2018-12-25 10:05:02\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-02 09:22:05'),
(391, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NhaKho0111\",\"name\":\"Nh\\u00e0 Kho K\\u1ef9 thu\\u1eadt\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"5\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"500\",\"pallet_used\":\"0\",\"description\":\"\",\"gates_in\":\"[{\\\"name\\\":\\\"C\\u1ed5ng 1\\\",\\\"size\\\":\\\"10\\\"}]\",\"gates_out\":\"[{\\\"name\\\":\\\"C\\u1ed5ng 2\\\",\\\"size\\\":\\\"10\\\"}]\",\"status\":\"1\",\"created_at\":\"2018-12-25 10:05:02\",\"updated_at\":\"2018-12-25 10:05:02\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-02 09:27:25'),
(392, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NhaKho0111\",\"name\":\"Nh\\u00e0 Kho K\\u1ef9 thu\\u1eadt\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"5\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"500\",\"pallet_used\":\"0\",\"description\":\"\",\"gates_in\":\"[{\\\"name\\\":\\\"C\\u1ed5ng 1\\\",\\\"size\\\":\\\"10\\\"}]\",\"gates_out\":\"[{\\\"name\\\":\\\"C\\u1ed5ng 2\\\",\\\"size\\\":\\\"10\\\"}]\",\"status\":\"1\",\"created_at\":\"2018-12-25 10:05:02\",\"updated_at\":\"2018-12-25 10:05:02\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/76.0.114 Chrome/70.0.3538.114 Safari/537.36', '2019-01-02 09:33:25'),
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
(432, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 1\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 03:45:21'),
(433, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 1\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 03:53:31'),
(434, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 1\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 03:53:45'),
(435, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 2\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 03:58:33'),
(436, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 2\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:00:28'),
(437, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 2\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:01:08'),
(438, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 2\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:01:26'),
(439, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 3\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:03:45'),
(440, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 3\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:03:54'),
(441, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 2\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:11:36'),
(442, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 2\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:11:41'),
(443, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 3\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:11:48'),
(444, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 1\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:12:44'),
(445, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 2\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:25:26'),
(446, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 3\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:26:45'),
(447, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 4\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:30:08'),
(448, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 4\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:30:24'),
(449, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 1\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:56:50'),
(450, 1, 1, 1, 'Cập nhật cổng của kho có ID1 với ID cổng là2', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-30 04:57:15'),
(451, 1, 1, 2, 'Cập nhật kho ID: 1', '{\"id\":\"1\",\"code\":\"NK00001\",\"name\":\"Nh\\u00e0 Kho Qu\\u1eadn 1\",\"department_id\":\"2\",\"manager_id\":\"1\",\"shelves_num\":\"16\",\"floor_per_shelves\":\"10\",\"pallet_per_floor\":\"10\",\"pallet_num\":\"1600\",\"pallet_used\":\"0\",\"description\":\"Th\\u00f4ng tin kh\\u00e1c\",\"status\":\"1\",\"created_at\":\"2019-01-14 03:26:00\",\"updated_at\":\"2019-01-14 03:26:00\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-01-31 01:14:18'),
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
(478, 1, 1, 1, 'Thêm tài khoản ID: 45', '{\"id\":\"45\",\"name\":\"nvst\",\"username\":\"nvst\",\"password\":\"$2y$08$c3hZdlZ4SnNjTlZJTExoM.7jBuhQEhZuJ03zF.NuLvjN8jAzlKZwe\",\"mail\":\"nvst@gmail.com\",\"phone\":\"0369858545\",\"avatar\":null,\"role\":\"7\",\"department_id\":null,\"department_mg\":\"[]\",\"status\":\"1\",\"created_at\":\"2019-03-11 08:42:58\",\"updated_at\":\"2019-03-11 08:42:58\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-03-11 01:42:58'),
(479, 1, 1, 1, 'Thêm tài khoản ID: 46', '{\"id\":\"46\",\"name\":\"Nguyen Van Truong Phong\",\"username\":\"tp\",\"password\":\"$2y$08$U09FOTRnV3N5NWhTRGNOcuyvfKfFGxdu3pOvOaJPfJgrEX0.kH6ZW\",\"mail\":\"tp@gmail.com\",\"phone\":\"0356985456\",\"avatar\":null,\"role\":\"8\",\"department_id\":\"25\",\"department_mg\":\"[\\\"25\\\"]\",\"status\":\"1\",\"created_at\":\"2019-03-11 08:47:38\",\"updated_at\":\"2019-03-11 08:47:38\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-03-11 01:47:38'),
(480, 45, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-03-11 01:52:45'),
(481, 45, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-03-11 02:22:42'),
(482, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/77.0.126 Chrome/71.0.3578.126 Safari/537.36', '2019-03-11 03:24:50'),
(483, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '2019-03-12 00:38:32'),
(484, 1, 1, 4, 'Tài khoản đã đăng nhập', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '2019-03-12 01:47:27');

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
  `id` int(5) NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `status` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `managers`
--

INSERT INTO `managers` (`id`, `code`, `name`, `department_id`, `note`, `status`) VALUES
(1, '003', 'Nguyễn Văn B', 25, '', 1),
(2, '234', 'Trần Văn C', 25, '', 1),
(3, '001', 'Lê Ngọc A', 25, '', 1),
(10, '002', 'Huỳnh Thị B', 25, '', 1),
(11, '004', 'Lê Kim A', 25, '', 1),
(12, '005', 'Nguyễn Thị T', 25, '', 1),
(13, '006', 'Lê Thị H', 25, '', 1),
(14, '007', 'Nguyễn Thị Q', 25, '', 1),
(15, '12345678', 'Nguyen Van C', 25, NULL, 1);

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
  `department_id` int(11) NOT NULL COMMENT 'Don vi mua sam',
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

INSERT INTO `offers` (`id`, `create_date`, `code`, `department_id`, `content`, `status`, `step`, `created_user`, `note`, `created_at`, `updated_at`) VALUES
(1, '2019-03-12', 'SS123456', 25, 'Đề nghị mua điện thoại', 1, 1, 1, 'Ghí chú', '2019-03-12 14:04:45', '2019-03-12 14:21:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `offers_pelf`
--

CREATE TABLE `offers_pelf` (
  `id` int(11) NOT NULL,
  `assets_id` int(11) NOT NULL,
  `offers_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
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
(10, 'properties', '', 'Toàn quyền quản lý tài sản', 'Toàn quyền quản lý tài sản', 'QL Tài sản', 1, '2019-02-25 14:20:45'),
(11, 'properties', 'index', 'Xem danh sách tài sản', 'Xem danh sách tài sản', 'QL Tài sản', 1, '2019-02-25 14:20:45'),
(12, 'properties', 'add', 'Thêm danh sách tài sản', 'Thêm danh sách tài sản', 'QL Tài sản', 1, '2019-02-25 14:20:45'),
(13, 'properties', 'edit', 'Cập nhật tài sản', 'Cập nhật tài sản', 'QL Tài sản', 1, '2019-02-25 14:20:45'),
(14, 'properties', 'delete', 'Xóa tài sản', 'Xóa tài sản', 'QL Tài sản', 1, '2019-02-25 14:20:45'),
(15, 'properties', 'evaluate', 'Đánh giá lại tài sản', 'Đánh giá lại tài sản', 'QL Tài sản', 1, '2019-02-25 14:20:45'),
(16, 'properties', 'getpriceevaluate', 'Lấy giá tài sản đánh giá', 'Lấy giá tài sản đánh giá', 'QL Tài sản', 1, '2019-02-25 14:20:45'),
(17, 'properties', 'getevaluate', 'Xem danh sách tài sản đánh giá', 'Xem danh sách tài sản đánh giá', 'QL Tài sản', 1, '2019-02-25 14:20:45'),
(18, 'properties', 'getdataevaluate', 'Lấy ngày đánh giá tài sản', 'Lấy ngày đánh giá tài sản', 'QL Tài sản', 1, '2019-02-25 14:20:45'),
(19, 'properties', 'excel', 'Xuất file excel', 'Xuất file exel', 'QL Tài sản', 1, '2019-02-25 14:20:45'),
(20, 'properties', 'getdata', 'Lấy dữ liệu tài sản', 'Lấy dữ liệu tài sản', 'QL Tài sản', 1, '2019-02-25 14:20:45'),
(21, 'properties', 'trash', 'Xem tài sản trong thùng rác', 'Xem tài sản trong thùng rác', 'QL Tài sản', 1, '2019-02-25 14:20:45'),
(22, 'properties', 'enventtrash', 'Đưa tài sản trong thùng rác', 'Đưa tài sản trong thùng rác', 'QL Tài sản', 1, '2019-02-25 14:20:45'),
(24, 'properties', 'restore', 'Khôi phục tài sản', 'Khôi phục tài sản', 'QL Tài sản', 1, '2019-02-25 14:20:45'),
(30, 'classes', '', 'Toàn quyền quản lý nhóm tài sản', 'Toàn quyền quản lý nhóm tài sản', 'QL Nhóm tài sản', 1, '2019-02-25 14:20:45'),
(31, 'classes', 'index', 'Xem danh sách nhóm tài sản', 'Xem danh sách nhóm tài sản', 'QL Nhóm tài sản', 1, '2019-02-25 14:20:45'),
(32, 'classes', 'add', 'Thêm nhóm tài sản', 'Thêm nhóm tài sản', 'QL Nhóm tài sản', 1, '2019-02-25 14:20:45'),
(33, 'classes', 'edit', 'Cập nhật nhóm tài sản', 'Cập nhật nhóm tài sản', 'QL Nhóm tài sản', 1, '2019-02-25 14:20:45'),
(34, 'classes', 'delete', 'Xóa nhóm tài sản', 'Xóa nhóm tài sản', 'QL Nhóm tài sản', 1, '2019-02-25 14:20:45'),
(35, 'classes', 'addmodal', 'Thêm nhóm tài sản qua modal', 'Thêm nhóm tài sản qua modal', 'QL Nhóm tài sản', 1, '2019-02-25 14:20:45'),
(50, 'departments', '', 'Toàn quyền đơn vị', 'Toàn quyền đơn vị', 'QL Đơn vị', 1, '2019-02-25 14:20:45'),
(51, 'departments', 'index', 'Xem dánh sách đơn vị', 'Xem danh sách đơn vị', 'QL Đơn vị', 1, '2019-02-25 14:20:45'),
(52, 'departments', 'add', 'Thêm đơn vị', 'Thêm đơn vị', 'QL Đơn vị', 1, '2019-02-25 14:20:45'),
(53, 'departments', 'edit', 'Cập nhật đơn vị', 'Cập nhật đơn vị', 'QL Đơn vị', 1, '2019-02-25 14:20:45'),
(54, 'departments', 'delete', 'Xóa đơn vị', 'Xóa đơn vị', 'QL Đơn vị', 1, '2019-02-25 14:20:45'),
(55, 'departments', 'addmodal', 'Thêm đơn vị qua modal', 'Thêm đơn vị qua modal', 'QL Đơn vị', 1, '2019-02-25 14:20:45'),
(70, 'depreciation', '', 'Toàn quyền khấu hao tài sản', 'Toàn quyền khấu hao tài sản', 'QL Khấu hao tài sản', 1, '2019-02-25 14:20:45'),
(71, 'depreciation', 'index', 'Xem danh sách khấu hao tài sản', 'Xem danh sách khấu hao tài sản', 'QL Khấu hao tài sản', 1, '2019-02-25 14:20:45'),
(72, 'depreciation', 'detail', 'Xem chi tiết khấu hao tài sản', 'Xem chi tiết khấu hao tài sản', 'QL Khấu hao tài sản', 1, '2019-02-25 14:20:45'),
(90, 'liquidation', '', 'Toàn quyền thanh lý tài sản', 'Toàn quyền thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45'),
(91, 'liquidation', 'index', 'Xem danh sách thanh lý tài sản', 'Xem danh sách thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45'),
(92, 'liquidation', 'offers', 'Danh sách đề nghị thanh lý tài sản', 'Danh sách đề nghị thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45'),
(93, 'liquidation', 'getdatalist', 'Lấy danh sách đề nghị thanh lý tài sản', 'Lấy danh sách đề nghị thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45'),
(94, 'liquidation', 'editoffer', 'Cập nhật đề nghị thanh lý tài sản', 'Cập nhật đề nghị thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45'),
(95, 'liquidation', 'confirm', 'Xác nhận đề nghị thanh lý tài sản', 'Xác nhận đề nghị thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45'),
(96, 'liquidation', 'getdata', 'Lấy dữ liệu thanh lý tài sản', 'Lấy dữ liệu thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45'),
(97, 'liquidation', 'add', 'Thêm thanh lý tài sản', 'Thêm thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45'),
(98, 'liquidation', 'edit', 'Cập nhật thanh lý tài sản', 'Cập nhật thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45'),
(99, 'liquidation', 'delete', 'Xóa thanh lý tài sản', 'Xóa thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45'),
(100, 'liquidation', 'item', 'Khôi phục tài sản', 'Khôi phục tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45'),
(101, 'liquidation', 'reject', 'Từ chối thanh lý tài sản', 'Từ chối thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45'),
(102, 'liquidation', 'confirm', 'Chấp nhận thanh lý tài sản', 'Chấp nhận thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45'),
(103, 'liquidation', 'trash', 'Đưa tài sản vào thùng rác', 'Đưa tài sản vào thùng rác', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45'),
(110, 'plan', '', 'Toàn quyền vị trí sử dụng tài sản', 'Toàn quyền vị trí sử dụng tài sản', 'QL Kế hoạch', 1, '2019-02-25 14:20:45'),
(111, 'plan', 'index', 'Xem danh sách vị trí sử dụng tài sản', 'Xem danh sách vị trí sử dụng tài sản', 'QL Kế hoạch', 1, '2019-02-25 14:20:45'),
(112, 'plan', 'add', 'Thêm vị trí sử dụng tài sản', 'Thêm vị trí sử dụng tài sản', 'QL Kế hoạch', 1, '2019-02-25 14:20:45'),
(113, 'plan', 'edit', 'Cập nhật vị trí sử dụng tài sản', 'Cập nhật vị trí sử dụng tài sản', 'QL Kế hoạch', 1, '2019-02-25 14:20:45'),
(114, 'plan', 'delete', 'Xóa kế hoạch', 'Xóa kế hoạch', 'QL Kế hoạch', 1, '2019-02-25 14:20:45'),
(115, 'plan', 'check', 'Kiểm tra kế hoạch', 'Kiểm tra kế hoạch', 'QL Kế hoạch', 1, '2019-02-25 14:20:45'),
(116, 'plan', 'affirmation', 'Phê duyệt kế hoạch', 'Phê duyệt kế hoạch', 'QL Kế hoạch', 1, '2019-02-25 14:20:45'),
(117, 'plan', 'handover', 'Bàn giao kế hoạch', 'Bàn giao kế hoạch', 'QL Kế hoạch', 1, '2019-02-25 14:20:45'),
(118, 'plan', 'acceptance', 'Nghiệm thu kế hoạch', 'Nghiệm thu kế hoạch', 'QL Kế hoạch', 1, '2019-02-25 14:20:45'),
(119, 'plan', 'print', 'Kiểm tra kế hoạch', 'Kiểm tra kế hoạch', 'QL Kế hoạch', 1, '2019-02-25 14:20:45'),
(130, 'maintenance', '', 'Toàn quyền bảo trì tài sản', 'Toàn quyền bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45'),
(131, 'maintenance', 'index', 'Xem danh sách bảo trì tài sản', 'Xem danh sách bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45'),
(132, 'maintenance', 'add', 'Thêm bảo trì tài sản', 'Thêm bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45'),
(133, 'maintenance', 'edit', 'Cập nhật bảo trì tài sản', 'Cập nhật bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45'),
(134, 'maintenance', 'delete', 'Xóa bảo trì tài sản', 'Xóa bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45'),
(135, 'maintenance', 'getdata', 'Lấy dữ liệu bảo trì tài sản', 'Lấy dữ liệu bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45'),
(136, 'maintenance', 'confirm', 'Xác nhận đã bảo trì tài sản', 'Xác nhận đã bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45'),
(137, 'maintenance', 'notification', 'Lấy thông báo bảo trì tài sản', 'Lấy thông báo bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45'),
(150, 'managers', '', 'Toàn quyền người sử dụng', 'Toàn quyền người sử dụng', 'QL người sử dụng', 1, '2019-02-25 14:20:45'),
(151, 'managers', 'index', 'Xem danh sách người sử dụng', 'Xem danh sách người sử dụng', 'QL người sử dụng', 1, '2019-02-25 14:20:45'),
(152, 'managers', 'add', 'Thêm người sử dụng', 'Thêm người sử dụng', 'QL người sử dụng', 1, '2019-02-25 14:20:45'),
(153, 'managers', 'edit', 'Cập nhật người sử dụng', 'Cập nhật người sử dụng', 'QL người sử dụng', 1, '2019-02-25 14:20:45'),
(154, 'managers', 'delete', 'Xóa người sử dụng', 'Xóa người sử dụng', 'QL người sử dụng', 1, '2019-02-25 14:20:45'),
(155, 'managers', 'addmodal', 'Thêm người sử dụng qua modal', 'Thêm người sử dụng qua modal', 'QL người sử dụng', 1, '2019-02-25 14:20:45'),
(170, 'offers', '', 'Toàn quyền đề nghị trang cấp', 'Toàn quyền đề nghị trang cấp', 'QL Đề nghị trang cấp tài sản', 1, '2019-02-25 14:20:45'),
(171, 'offers', 'index', 'Xem danh sách đề nghị trang cấp', 'Xem danh sách đề nghị trang cấp', 'QL Đề nghị trang cấp tài sản', 1, '2019-02-25 14:20:45'),
(172, 'offers', 'add', 'Thêm đề nghị trang cấp', 'Thêm đề nghị trang cấp', 'QL Đề nghị trang cấp tài sản', 1, '2019-02-25 14:20:45'),
(173, 'offers', 'edit', 'Cập nhật đề nghị trang cấp', 'Cập nhật nghị trang cấp', 'QL Đề nghị trang cấp tài sản', 1, '2019-02-25 14:20:45'),
(174, 'offers', 'delete', 'Xóa đề nghị trang cấp', 'Xóa đề nghị trang cấp', 'QL Đề nghị trang cấp tài sản', 1, '2019-02-25 14:20:45'),
(175, 'offers', 'getdata', 'Lấy dữ liệu đề nghị trang cấp', 'Lấy dữ liệu đề nghị trang cấp', 'QL Đề nghị trang cấp tài sản', 1, '2019-02-25 14:20:45'),
(190, 'roles', '', 'Toàn quyền phân quyền', 'Toàn quyền phân quyên', 'QL phân quyền', 1, '2019-02-25 14:20:45'),
(191, 'roles', 'index', 'Xem danh sách các nhóm quyền', 'Xem danh sách các nhóm quyền', 'QL phân quyền', 1, '2019-02-25 14:20:45'),
(210, 'users', '', 'Toàn quyền quản lý tài khoản', 'Toàn quyền quản lý tài khoản', 'QL Tài khoản', 1, '2019-02-25 14:20:45'),
(211, 'users', 'index', 'Xem danh sách tài khoản', 'Xem danh sách tài khoản', 'QL Tài khoản', 1, '2019-02-25 14:20:45'),
(212, 'users', 'add', 'Thêm tài khoản', 'Thêm tài khoản', 'QL Tài khoản', 1, '2019-02-25 14:20:45'),
(213, 'users', 'edit', 'Cập nhật tài khoản', 'Cập nhật tài khoản', 'QL Tài khoản', 1, '2019-02-25 14:20:45'),
(214, 'users', 'delete', 'Xóa tài khoản', 'Xóa tài khoản', 'QL Tài khoản', 1, '2019-02-25 14:20:45'),
(230, 'transfers', '', 'Toàn quyền luân chuyển tài sản', 'Toàn quyền luân chuyển tài sản', 'QL Luân chuyển', 1, '2019-02-25 14:20:45'),
(234, 'transfers', 'index', 'Xem danh sách luân chuyển tài sản', 'Xem danh sách luân chuyển tài sản', 'QL Luân chuyển', 1, '2019-02-25 14:20:45'),
(235, 'transfers', 'add', 'Thêm luân chuyển tài sản', 'Thêm luân chuyển tài sản', 'QL Luân chuyển', 1, '2019-02-25 14:20:45'),
(250, 'stores', '', 'Toàn quyền quản lý kho', 'Toàn quyền quản lý kho', 'QL Kho', 1, '2019-02-25 14:20:45'),
(251, 'stores', 'index', 'Xem danh sách kho', 'Xem danh sách kho', 'QL kho', 1, '2019-02-25 14:20:45'),
(252, 'stores', 'add', 'Thêm kho', 'Thêm kho', 'QL kho', 1, '2019-02-25 14:20:45'),
(253, 'stores', 'edit', 'Cập nhật kho', 'Cập nhật kho', 'QL kho', 1, '2019-02-25 14:20:45'),
(254, 'stores', 'delete', 'Xóa kho', 'Xóa kho', 'QL kho', 1, '2019-02-25 14:20:45'),
(255, 'stores', 'getdata', 'Lấy dữ liệu kho', 'Lấy dữ liệu kho', 'QL kho', 1, '2019-02-25 14:20:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `plan`
--

CREATE TABLE `plan` (
  `id` int(11) NOT NULL,
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ma de nghi mua sam',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT 'Trang thai cua buoc ke hoach',
  `step` int(11) NOT NULL,
  `department_id` int(11) NOT NULL COMMENT 'Don vi mua sam',
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

INSERT INTO `plan` (`id`, `code`, `status`, `step`, `department_id`, `content`, `created_user`, `year`, `note`, `created_at`, `updated_at`) VALUES
(1, 'MUA2019', 1, 1, 25, 'aaaaaaaaaaaaaaaaaaaa', 1, 2019, NULL, '2019-03-09 16:45:31', '2019-03-09 16:45:31'),
(2, '2019DN1', 1, 2, 25, 'Đề nghị mua đồ đầu năm', 1, 2019, NULL, '2019-03-11 17:30:06', '2019-03-11 17:30:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `plan_pelf`
--

CREATE TABLE `plan_pelf` (
  `id` int(11) NOT NULL,
  `assets_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
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

INSERT INTO `plan_pelf` (`id`, `assets_id`, `plan_id`, `department_id`, `purpose`, `quantity`, `price_ex`, `unit_price_ex`, `used_date_ex`, `buy_method`, `created_user`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 25, 'Sử dụng liên lạc', 2, 24000000, 12000000, '2019-03-11', 1, 1, 0, '2019-03-11 13:37:54', '2019-03-11 13:37:54'),
(2, 1, 2, 25, '', 2, 10000000, 0, '2019-03-11', 1, 1, 0, '2019-03-11 13:37:54', '2019-03-11 13:37:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `properties`
--

CREATE TABLE `properties` (
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
  `department_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `depreciation_time` int(11) DEFAULT NULL,
  `depreciation_total` int(25) DEFAULT NULL,
  `depreciation_type` int(11) DEFAULT NULL,
  `depreciation_tm` int(2) DEFAULT NULL,
  `evaluated` int(11) DEFAULT NULL,
  `quality` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `properties`
--

INSERT INTO `properties` (`id`, `code`, `assets_id`, `descrip2`, `bill_num`, `buy_date`, `expired_guarantee_date`, `used_date`, `unit_price_pro`, `price_pro`, `supplier_id`, `status`, `department_id`, `manager_id`, `depreciation_time`, `depreciation_total`, `depreciation_type`, `depreciation_tm`, `evaluated`, `quality`, `quantity`) VALUES
(1, 'SS123456', 1, 'tai nghe jjjj', '123456', '2019-02-25', '2019-02-26', '2019-02-25', 10000000, 20000000, 1, 1, 25, 1, 0, NULL, 0, 0, NULL, 'Tốt', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(5) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `permission_id` text COLLATE utf8_unicode_ci NOT NULL,
  `active` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `permission_id`, `active`) VALUES
(1, 'Supper Admin', '[1]', 'Y'),
(2, 'Quản trị viên', '[10,20,30,70,90,110,130,150,170,210,230,250]', 'Y'),
(3, 'Nhân viên', '[10,31,92,93,94,97,111,130,151]', 'Y'),
(4, 'An ninh kho', '[10,20,30,70,90,110,130,150,170,210,230,250]', 'Y'),
(5, 'Thủ kho', '[10,20,30,70,90,110,130,150,170,210,230,250]', 'Y'),
(6, 'Kế toán kho', '[10,20,30,70,90,110,130,150,170,210,230,250]', 'Y'),
(7, 'Nhân viên soạn thảo', '[111,112,113,114,119]', 'Y'),
(8, 'Trưởng phòng', '[111,115]', 'Y'),
(9, 'Giám đốc', '[111,116]', 'Y');

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
  `department_id` int(5) NOT NULL,
  `department_id_2` int(5) NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `transfers`
--

INSERT INTO `transfers` (`id`, `code`, `transfer_date`, `end_date`, `recovery_num`, `handover_num`, `department_id`, `department_id_2`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'LC123456', '2019-02-26', NULL, '1234567', '123456', 2, 2, 'Ghi chú', 1, '2019-02-25 15:41:34', '2019-02-26 15:12:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transfer_pelf`
--

CREATE TABLE `transfer_pelf` (
  `id` int(10) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `properties_id` int(11) NOT NULL,
  `department_id` int(5) NOT NULL,
  `location_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `department_id_2` int(5) NOT NULL,
  `location_id_2` int(11) NOT NULL,
  `manager_id_2` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `pelf_quantity` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `transfer_pelf`
--

INSERT INTO `transfer_pelf` (`id`, `transfer_id`, `properties_id`, `department_id`, `location_id`, `manager_id`, `department_id_2`, `location_id_2`, `manager_id_2`, `note`, `pelf_quantity`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 1, 2, 2, 1, 10, 'Ghi chu', 2, 1, '2019-02-26 10:08:14', '2019-02-26 10:08:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `mail` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` text COLLATE utf8_unicode_ci,
  `role` int(5) NOT NULL,
  `department_id` int(11) NOT NULL,
  `department_mg` text COLLATE utf8_unicode_ci,
  `status` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `mail`, `phone`, `avatar`, `role`, `department_id`, `department_mg`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', '$2y$08$cXRmK2VuMEdnTng1djdNUuenzqcmeseBNXJU8mFV/9wZXILFsd2eK', 'admin@gmail.com', '01234567890', '', 1, -1, '', 1, '2016-10-13 22:05:35', '2018-11-23 08:25:16'),
(2, 'Nguyen Van Test 1', 'test1', '$2y$08$a0lzVHRnaS9OVTZlenljbuNcvYJ6RjhUcCJHRnrFVfMbwf9xkUDwC', 'test1@gmail.com', '0352222333', NULL, 2, 2, '[\"23\",\"10\",\"2\"]', 1, '2018-11-26 15:01:50', '2018-11-26 15:01:50'),
(44, 'Nguyen Van Test 2', 'test2', '$2y$08$blpjV0NlWHpCNStyVWhqW.yZeDO0EAmARUgkZQwJU1Kz3DQN0udim', 'test2@gmail.com', '0356666666', '', 3, 2, '[\"2\"]', 1, '2018-11-26 16:39:20', '0000-00-00 00:00:00'),
(45, 'nvst', 'nvst', '$2y$08$c3hZdlZ4SnNjTlZJTExoM.7jBuhQEhZuJ03zF.NuLvjN8jAzlKZwe', 'nvst@gmail.com', '0369858545', NULL, 7, 25, '[\"25\"]', 1, '2019-03-11 08:42:58', '2019-03-11 08:42:58'),
(46, 'Nguyen Van Truong Phong', 'tp', '$2y$08$U09FOTRnV3N5NWhTRGNOcuyvfKfFGxdu3pOvOaJPfJgrEX0.kH6ZW', 'tp@gmail.com', '0356985456', NULL, 8, 25, '[\"25\"]', 1, '2019-03-11 08:47:38', '2019-03-11 08:47:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouseex`
--

CREATE TABLE `warehouseex` (
  `id` int(11) NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `move` text COLLATE utf8_unicode_ci NOT NULL,
  `manager_id` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `reason` int(1) NOT NULL,
  `reason_other` text COLLATE utf8_unicode_ci,
  `output_type` int(1) NOT NULL,
  `output_doc` text COLLATE utf8_unicode_ci,
  `value_status` int(1) NOT NULL,
  `value_doc` text COLLATE utf8_unicode_ci,
  `created_user` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouseex1`
--

CREATE TABLE `warehouseex1` (
  `id` int(11) NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `move` text COLLATE utf8_unicode_ci NOT NULL,
  `manager_id` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `reason` int(1) NOT NULL,
  `reason_other` text COLLATE utf8_unicode_ci,
  `output_type` int(1) NOT NULL,
  `output_doc` text COLLATE utf8_unicode_ci,
  `value_status` int(1) NOT NULL,
  `value_doc` text COLLATE utf8_unicode_ci,
  `created_user` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehousegateinput`
--

CREATE TABLE `warehousegateinput` (
  `id` int(11) NOT NULL,
  `type` int(1) NOT NULL,
  `warehousing_id` int(11) NOT NULL,
  `gate` int(11) DEFAULT NULL,
  `time_in` datetime DEFAULT NULL,
  `time_out` datetime DEFAULT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehousegateinput1`
--

CREATE TABLE `warehousegateinput1` (
  `id` int(11) NOT NULL,
  `type` int(1) NOT NULL,
  `warehousing_id` int(11) NOT NULL,
  `gate` int(11) DEFAULT NULL,
  `time_in` datetime DEFAULT NULL,
  `time_out` datetime DEFAULT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehousegatelist`
--

CREATE TABLE `warehousegatelist` (
  `id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` int(2) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) DEFAULT NULL,
  `class_id` text COLLATE utf8_unicode_ci,
  `status` int(1) NOT NULL,
  `detail` text COLLATE utf8_unicode_ci,
  `status_now` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehousegatelist1`
--

CREATE TABLE `warehousegatelist1` (
  `id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` int(2) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) DEFAULT NULL,
  `class_id` text COLLATE utf8_unicode_ci,
  `detail` text COLLATE utf8_unicode_ci,
  `status` int(1) NOT NULL,
  `status_now` int(1) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `warehousegatelist1`
--

INSERT INTO `warehousegatelist1` (`id`, `warehouse_id`, `type`, `name`, `size`, `class_id`, `detail`, `status`, `status_now`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '(Chưa đến)', NULL, '', '', 1, 1, '2019-01-14 03:26:01', '2019-01-14 03:26:01'),
(2, 1, 1, 'I1', NULL, '[\"0\"]', '', 1, 1, '2019-01-14 03:26:01', '2019-01-14 03:26:01'),
(3, 1, 2, 'O2', NULL, '[\"0\"]', '', 1, 1, '2019-01-15 10:44:12', '2019-01-15 10:44:12'),
(4, 1, 1, 'I2', NULL, '[\"0\"]', '', 1, 1, '2019-01-15 11:02:55', '2019-01-15 11:02:55'),
(5, 1, 2, 'O1', NULL, '[\"0\"]', '', 1, 1, '2019-01-15 11:08:03', '2019-01-15 11:08:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehousegateoutput`
--

CREATE TABLE `warehousegateoutput` (
  `id` int(11) NOT NULL,
  `type` int(1) NOT NULL,
  `warehouseex_id` int(11) NOT NULL,
  `gate` int(11) DEFAULT NULL,
  `time_in` datetime DEFAULT NULL,
  `time_out` datetime DEFAULT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehousegateoutput1`
--

CREATE TABLE `warehousegateoutput1` (
  `id` int(11) NOT NULL,
  `type` int(1) NOT NULL,
  `warehouseex_id` int(11) NOT NULL,
  `gate` int(11) DEFAULT NULL,
  `time_in` datetime DEFAULT NULL,
  `time_out` datetime DEFAULT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouseinput`
--

CREATE TABLE `warehouseinput` (
  `id` int(11) NOT NULL,
  `code_save` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `assets_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `warehousing_id` int(11) NOT NULL,
  `buy_date` date DEFAULT NULL,
  `expired_guarantee_date` date DEFAULT NULL,
  `descrip2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `quality` text COLLATE utf8_unicode_ci NOT NULL,
  `unit_price` double NOT NULL,
  `price` double NOT NULL,
  `status` int(2) DEFAULT '0',
  `line` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shelf` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `floor` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pallet` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `portion` int(11) DEFAULT NULL,
  `shelves` int(11) DEFAULT NULL,
  `created_user` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouseinput1`
--

CREATE TABLE `warehouseinput1` (
  `id` int(11) NOT NULL,
  `code_save` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `assets_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `warehousing_id` int(11) NOT NULL,
  `buy_date` date DEFAULT NULL,
  `expired_guarantee_date` date DEFAULT NULL,
  `descrip2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `quality` text COLLATE utf8_unicode_ci NOT NULL,
  `bill_num` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` double NOT NULL,
  `price` double NOT NULL,
  `status` int(2) DEFAULT '0',
  `line` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shelf` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `floor` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pallet` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_user` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `warehouseinput1`
--

INSERT INTO `warehouseinput1` (`id`, `code_save`, `assets_id`, `warehouse_id`, `warehousing_id`, `buy_date`, `expired_guarantee_date`, `descrip2`, `quantity`, `quality`, `bill_num`, `unit_price`, `price`, `status`, `line`, `shelf`, `floor`, `pallet`, `created_user`, `created_at`, `updated_at`) VALUES
(1, 'SS1234561', 1, 1, 1, '2019-01-16', '2019-01-17', 'A', 10, 'Mới', '12345', 13000000, 130000000, 0, NULL, NULL, NULL, NULL, 1, '2019-01-16 10:41:16', '2019-01-16 10:41:16'),
(2, 'SS1234562', 1, 1, 1, '2019-01-16', '2019-01-17', 'A', 10, 'Mới', '12345', 13000000, 130000000, 2, '1', '1', '1', '1', 1, '2019-01-16 10:41:16', '2019-01-16 10:41:16'),
(3, '1235443', 1, 1, 1, '2019-02-08', '2019-02-08', '', 10, 'Tốt', 'aaaaaaaaa', 1000, 10000, 0, NULL, NULL, NULL, NULL, 1, '2019-02-08 20:49:58', '2019-02-08 20:49:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouselist`
--

CREATE TABLE `warehouselist` (
  `id` int(11) NOT NULL,
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `shelves_num` int(11) NOT NULL,
  `floor_per_shelves` int(11) NOT NULL,
  `pallet_per_floor` int(11) NOT NULL,
  `pallet_num` int(11) NOT NULL,
  `pallet_used` int(11) DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `warehouselist`
--

INSERT INTO `warehouselist` (`id`, `code`, `name`, `department_id`, `manager_id`, `shelves_num`, `floor_per_shelves`, `pallet_per_floor`, `pallet_num`, `pallet_used`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'NK00001', 'Nhà Kho Quận 1', 2, 1, 16, 10, 10, 1600, 0, 'Thông tin khác', 1, '2019-01-14 03:26:00', '2019-01-14 03:26:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouseoutput`
--

CREATE TABLE `warehouseoutput` (
  `id` int(11) NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `warehouseex_id` int(11) NOT NULL,
  `buy_date` date DEFAULT NULL,
  `expired_guarantee_date` date DEFAULT NULL,
  `descrip1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descrip2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `quality` text COLLATE utf8_unicode_ci NOT NULL,
  `bill_num` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `class_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `currencies_id` int(11) NOT NULL,
  `producer_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `created_user` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouseoutput1`
--

CREATE TABLE `warehouseoutput1` (
  `id` int(11) NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `warehouseex_id` int(11) NOT NULL,
  `buy_date` date DEFAULT NULL,
  `expired_guarantee_date` date DEFAULT NULL,
  `descrip1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descrip2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `quality` text COLLATE utf8_unicode_ci NOT NULL,
  `bill_num` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `class_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `currencies_id` int(11) NOT NULL,
  `producer_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `created_user` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehousezone`
--

CREATE TABLE `warehousezone` (
  `id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `symbol_zone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `manager_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `pallet_bg_zone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pallet_end_zone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pallet_py_bg` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pallet_py_en` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehousezone1`
--

CREATE TABLE `warehousezone1` (
  `id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `symbol_zone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `manager_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `pallet_bg_zone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pallet_end_zone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pallet_py_bg` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pallet_py_en` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehousing`
--

CREATE TABLE `warehousing` (
  `id` int(11) NOT NULL,
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `move` text COLLATE utf8_unicode_ci,
  `move_type` int(2) NOT NULL DEFAULT '1',
  `move_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `reason` text COLLATE utf8_unicode_ci NOT NULL,
  `time_expected` datetime DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `input_type` int(1) NOT NULL,
  `input_doc` text COLLATE utf8_unicode_ci,
  `order_doc` text COLLATE utf8_unicode_ci NOT NULL,
  `delivery_type` int(2) NOT NULL,
  `delivery_info` text COLLATE utf8_unicode_ci,
  `delivery_doc` text COLLATE utf8_unicode_ci,
  `security_id` int(11) DEFAULT NULL,
  `value_status` int(1) DEFAULT NULL,
  `value_doc` text COLLATE utf8_unicode_ci,
  `created_user` int(11) NOT NULL,
  `status` int(1) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehousing1`
--

CREATE TABLE `warehousing1` (
  `id` int(11) NOT NULL,
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `move` text COLLATE utf8_unicode_ci,
  `move_type` int(2) NOT NULL DEFAULT '1',
  `move_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `reason` text COLLATE utf8_unicode_ci NOT NULL,
  `time_expected` datetime DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `input_type` int(1) NOT NULL,
  `input_doc` text COLLATE utf8_unicode_ci,
  `order_doc` text COLLATE utf8_unicode_ci NOT NULL,
  `delivery_type` int(2) NOT NULL,
  `delivery_info` text COLLATE utf8_unicode_ci,
  `delivery_doc` text COLLATE utf8_unicode_ci,
  `security_id` int(11) DEFAULT NULL,
  `value_status` int(1) DEFAULT NULL,
  `value_doc` text COLLATE utf8_unicode_ci,
  `created_user` int(11) NOT NULL,
  `status` int(1) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `warehousing1`
--

INSERT INTO `warehousing1` (`id`, `code`, `warehouse_id`, `move`, `move_type`, `move_id`, `manager_id`, `reason`, `time_expected`, `datetime`, `input_type`, `input_doc`, `order_doc`, `delivery_type`, `delivery_info`, `delivery_doc`, `security_id`, `value_status`, `value_doc`, `created_user`, `status`, `note`, `created_at`, `updated_at`) VALUES
(1, 'NK00001', 1, '', 2, 1, NULL, 'Mới', '2019-02-01 11:12:15', NULL, 1, '0_1547543354test.txt', '1_1547543354test.txt', 1, 'Họ & Tên: Nguyen Van A\r\nSĐT: 012345678\r\nBiển số xe: 72K1-12345', NULL, NULL, NULL, NULL, 1, 0, '', '2019-01-15 16:09:14', '2019-02-01 11:12:15');

--
-- Chỉ mục cho các bảng đã đổ
--

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
-- Chỉ mục cho bảng `cat_employees`
--
ALTER TABLE `cat_employees`
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
-- Chỉ mục cho bảng `commute`
--
ALTER TABLE `commute`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `constraints_4` (`department_id`),
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
  ADD KEY `constraints_4` (`department_id`),
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
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `constraints_4` (`department_id`),
  ADD KEY `status` (`status`),
  ADD KEY `status_2` (`status`);

--
-- Chỉ mục cho bảng `offers_pelf`
--
ALTER TABLE `offers_pelf`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_id` (`offers_id`),
  ADD KEY `assets_id` (`assets_id`),
  ADD KEY `department_id` (`department_id`);

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
  ADD KEY `constraints_4` (`department_id`),
  ADD KEY `status` (`status`),
  ADD KEY `status_2` (`status`);

--
-- Chỉ mục cho bảng `plan_pelf`
--
ALTER TABLE `plan_pelf`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_id` (`plan_id`),
  ADD KEY `assets_id` (`assets_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Chỉ mục cho bảng `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `constraints_4` (`department_id`),
  ADD KEY `constraints_6` (`manager_id`),
  ADD KEY `status` (`status`),
  ADD KEY `status_2` (`status`),
  ADD KEY `assets_id` (`assets_id`);

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
  ADD KEY `constraints_11` (`department_id`),
  ADD KEY `constraints_12` (`department_id_2`);

--
-- Chỉ mục cho bảng `transfer_pelf`
--
ALTER TABLE `transfer_pelf`
  ADD PRIMARY KEY (`id`),
  ADD KEY `constraints_11` (`department_id`),
  ADD KEY `constraints_12` (`department_id_2`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `constraints_13` (`role`);

--
-- Chỉ mục cho bảng `warehouseex`
--
ALTER TABLE `warehouseex`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `warehouseex1`
--
ALTER TABLE `warehouseex1`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `warehousegatelist`
--
ALTER TABLE `warehousegatelist`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `warehousegatelist1`
--
ALTER TABLE `warehousegatelist1`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `warehouseinput`
--
ALTER TABLE `warehouseinput`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `warehouseinput1`
--
ALTER TABLE `warehouseinput1`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `warehouselist`
--
ALTER TABLE `warehouselist`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `warehouseoutput`
--
ALTER TABLE `warehouseoutput`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Chỉ mục cho bảng `warehouseoutput1`
--
ALTER TABLE `warehouseoutput1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Chỉ mục cho bảng `warehousezone`
--
ALTER TABLE `warehousezone`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `warehousezone1`
--
ALTER TABLE `warehousezone1`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `warehousing`
--
ALTER TABLE `warehousing`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `warehousing1`
--
ALTER TABLE `warehousing1`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `cat_assets`
--
ALTER TABLE `cat_assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `cat_classes`
--
ALTER TABLE `cat_classes`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `cat_contracts`
--
ALTER TABLE `cat_contracts`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cat_countries`
--
ALTER TABLE `cat_countries`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `cat_currencies`
--
ALTER TABLE `cat_currencies`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `cat_division`
--
ALTER TABLE `cat_division`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `cat_employees`
--
ALTER TABLE `cat_employees`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cat_position`
--
ALTER TABLE `cat_position`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `cat_produceres`
--
ALTER TABLE `cat_produceres`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `cat_species`
--
ALTER TABLE `cat_species`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `cat_status`
--
ALTER TABLE `cat_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `cat_supplieres`
--
ALTER TABLE `cat_supplieres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `cat_units`
--
ALTER TABLE `cat_units`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `evaluate`
--
ALTER TABLE `evaluate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `liquidations`
--
ALTER TABLE `liquidations`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `liquidation_pelf`
--
ALTER TABLE `liquidation_pelf`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `log_history`
--
ALTER TABLE `log_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=485;

--
-- AUTO_INCREMENT cho bảng `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `managers`
--
ALTER TABLE `managers`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT cho bảng `plan`
--
ALTER TABLE `plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `plan_pelf`
--
ALTER TABLE `plan_pelf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `transfer_pelf`
--
ALTER TABLE `transfer_pelf`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `warehouseex`
--
ALTER TABLE `warehouseex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehouseex1`
--
ALTER TABLE `warehouseex1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehousegatelist`
--
ALTER TABLE `warehousegatelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehousegatelist1`
--
ALTER TABLE `warehousegatelist1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `warehouseinput`
--
ALTER TABLE `warehouseinput`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehouseinput1`
--
ALTER TABLE `warehouseinput1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `warehouselist`
--
ALTER TABLE `warehouselist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `warehouseoutput`
--
ALTER TABLE `warehouseoutput`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehouseoutput1`
--
ALTER TABLE `warehouseoutput1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehousezone`
--
ALTER TABLE `warehousezone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehousezone1`
--
ALTER TABLE `warehousezone1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehousing`
--
ALTER TABLE `warehousing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehousing1`
--
ALTER TABLE `warehousing1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `constraints_13` FOREIGN KEY (`role`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
