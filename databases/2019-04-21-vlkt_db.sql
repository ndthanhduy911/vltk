-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 21, 2019 lúc 02:34 PM
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
-- Cơ sở dữ liệu: `vltk_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `path`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Giới thiệu', 'about', 1, '2019-04-04 00:00:00', '2019-04-04 00:00:00'),
(2, 'Tổ chức - Nhân sự', 'teams', 1, '2019-04-04 00:00:00', '2019-04-04 00:00:00'),
(3, 'Liên hệ', 'contact', 1, '2019-04-04 00:00:00', '2019-04-04 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` int(1) NOT NULL DEFAULT '1',
  `cretaed_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `status`, `cretaed_at`, `updated_at`) VALUES
(1, 'Tin giáo vụ', 'tin-giao-vu', 'Tin giáo vụ', 1, '2019-03-29 00:00:00', '2019-03-29 00:00:00'),
(2, 'Tin NCKH - Serminar', 'tin-nckh-serminar', 'Tin NCKH - Serminar', 1, '2019-03-29 00:00:00', '2019-03-29 00:00:00'),
(3, 'Tin CB - VC Khoa', 'tin-cb-vc-khoa', 'Tin CB - VC Khoa', 1, '2019-03-29 00:00:00', '2019-03-29 00:00:00'),
(4, 'Tin Tuyển Dụng', 'tin-tuyen-dung', 'Tin Tuyển Dụng', 1, '2019-03-29 00:00:00', '2019-03-29 00:00:00');

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
-- Cấu trúc bảng cho bảng `default_tb`
--

CREATE TABLE `default_tb` (
  `id` int(11) NOT NULL,
  `created_user` int(11) NOT NULL COMMENT 'ID tai khoan tao',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `departments`
--

CREATE TABLE `departments` (
  `id` int(5) NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) DEFAULT NULL,
  `level` int(2) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `departments`
--

INSERT INTO `departments` (`id`, `code`, `name`, `slug`, `image`, `parent_id`, `level`, `status`) VALUES
(1, 'VLTH', 'Vật Lý Tin Học', 'vat-ly-tin-hoc', NULL, NULL, 0, 1),
(2, 'VLLT', 'Vật Lý Lý Thuyết', 'vat-ly-ly-thuyet', NULL, NULL, 0, 1),
(3, 'VLHN', 'Vật Lý Hạt Nhân - KTHN', 'vat-ly-hat-nhan', NULL, NULL, 0, 1),
(4, 'VLCR', 'Vật Lý Chất Rắn', 'vat-ly-chat-ran', NULL, NULL, 0, 1),
(5, 'VLUD', 'Vật Lý Ứng Dụng', 'vat-ly-ung-dung', NULL, NULL, 0, 1),
(6, 'VLDT', 'Vật Lý Điện Tử', 'vat-ly-dien-tu', NULL, NULL, 0, 1),
(7, 'VLDC', 'Vật Lý Địa Cầu', 'vat-ly-dia-cau', NULL, NULL, 0, 1),
(8, 'VLHD', 'Vật Lý Hải Dương', 'vat-ly-hai-duong', NULL, NULL, 0, 1);

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
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `language`
--

INSERT INTO `language` (`id`, `name`, `short_name`, `path`, `icon`, `status`, `actived`, `created_at`, `updated_at`) VALUES
(1, 'VIET NAM', 'VIE', '/language_file/vie', 'vietnam.png', 1, 1, '2019-03-15 23:06:18', '2019-03-15 23:06:18');

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
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `attribute_id` int(4) DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `status` int(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `attribute_id`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Giới thiệu', 'gioi-thieu', 1, NULL, 1, '2019-03-23 20:16:25', '2019-03-23 20:16:25'),
(2, 'Tổ chức - Nhân sự', 'to-chuc-nhan-su', 2, NULL, 1, '2019-03-23 20:16:42', '2019-03-23 20:16:42'),
(3, 'Hợp tác đào tạo', 'hop-tac-dao-tao', NULL, NULL, 1, '2019-03-23 20:16:42', '2019-03-23 20:16:42'),
(4, 'Nghiên cứu khoa học', 'nghien-cuu-khoa-hoc', NULL, NULL, 1, '2019-03-23 20:16:42', '2019-03-23 20:16:42'),
(5, 'Phòng thi nghiệm', 'phong-thi-nghiem', NULL, NULL, 1, '2019-03-23 20:16:42', '2019-03-23 20:16:42'),
(6, 'Sản phẩm nghiên cứu', 'san-pham-nghien-cuu', NULL, NULL, 1, '2019-03-23 20:16:42', '2019-03-23 20:16:42'),
(7, 'Đoàn hội', 'doan-hoi', NULL, NULL, 1, '2019-03-23 20:16:42', '2019-03-23 20:16:42'),
(9, 'Liên hệ', 'lien-he', 3, NULL, 1, '2019-04-04 00:00:00', '2019-04-04 00:00:00');

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
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permission`
--

INSERT INTO `permission` (`id`, `controller`, `action`, `name`, `description`, `optgroup`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', '1', 'Toàn quyền', 'Toàn quyền ', 'Toàn quyền', 1, '2019-02-25 14:20:45', NULL),
(10, 'properties', '', 'Toàn quyền quản lý tài sản', 'Toàn quyền quản lý tài sản', 'QL Tài sản', 1, '2019-02-25 14:20:45', NULL),
(11, 'properties', 'index', 'Xem danh sách tài sản', 'Xem danh sách tài sản', 'QL Tài sản', 1, '2019-02-25 14:20:45', NULL),
(12, 'properties', 'add', 'Thêm danh sách tài sản', 'Thêm danh sách tài sản', 'QL Tài sản', 1, '2019-02-25 14:20:45', NULL),
(13, 'properties', 'edit', 'Cập nhật tài sản', 'Cập nhật tài sản', 'QL Tài sản', 1, '2019-02-25 14:20:45', NULL),
(14, 'properties', 'delete', 'Xóa tài sản', 'Xóa tài sản', 'QL Tài sản', 1, '2019-02-25 14:20:45', NULL),
(15, 'properties', 'evaluate', 'Đánh giá lại tài sản', 'Đánh giá lại tài sản', 'QL Tài sản', 1, '2019-02-25 14:20:45', NULL),
(16, 'properties', 'getpriceevaluate', 'Lấy giá tài sản đánh giá', 'Lấy giá tài sản đánh giá', 'QL Tài sản', 1, '2019-02-25 14:20:45', NULL),
(17, 'properties', 'getevaluate', 'Xem danh sách tài sản đánh giá', 'Xem danh sách tài sản đánh giá', 'QL Tài sản', 1, '2019-02-25 14:20:45', NULL),
(18, 'properties', 'getdataevaluate', 'Lấy ngày đánh giá tài sản', 'Lấy ngày đánh giá tài sản', 'QL Tài sản', 1, '2019-02-25 14:20:45', NULL),
(19, 'properties', 'excel', 'Xuất file excel', 'Xuất file exel', 'QL Tài sản', 1, '2019-02-25 14:20:45', NULL),
(20, 'properties', 'getdata', 'Lấy dữ liệu tài sản', 'Lấy dữ liệu tài sản', 'QL Tài sản', 1, '2019-02-25 14:20:45', NULL),
(21, 'properties', 'trash', 'Xem tài sản trong thùng rác', 'Xem tài sản trong thùng rác', 'QL Tài sản', 1, '2019-02-25 14:20:45', NULL),
(22, 'properties', 'enventtrash', 'Đưa tài sản trong thùng rác', 'Đưa tài sản trong thùng rác', 'QL Tài sản', 1, '2019-02-25 14:20:45', NULL),
(24, 'properties', 'restore', 'Khôi phục tài sản', 'Khôi phục tài sản', 'QL Tài sản', 1, '2019-02-25 14:20:45', NULL),
(30, 'classes', '', 'Toàn quyền quản lý nhóm tài sản', 'Toàn quyền quản lý nhóm tài sản', 'QL Nhóm tài sản', 1, '2019-02-25 14:20:45', NULL),
(31, 'classes', 'index', 'Xem danh sách nhóm tài sản', 'Xem danh sách nhóm tài sản', 'QL Nhóm tài sản', 1, '2019-02-25 14:20:45', NULL),
(32, 'classes', 'add', 'Thêm nhóm tài sản', 'Thêm nhóm tài sản', 'QL Nhóm tài sản', 1, '2019-02-25 14:20:45', NULL),
(33, 'classes', 'edit', 'Cập nhật nhóm tài sản', 'Cập nhật nhóm tài sản', 'QL Nhóm tài sản', 1, '2019-02-25 14:20:45', NULL),
(34, 'classes', 'delete', 'Xóa nhóm tài sản', 'Xóa nhóm tài sản', 'QL Nhóm tài sản', 1, '2019-02-25 14:20:45', NULL),
(35, 'classes', 'addmodal', 'Thêm nhóm tài sản qua modal', 'Thêm nhóm tài sản qua modal', 'QL Nhóm tài sản', 1, '2019-02-25 14:20:45', NULL),
(50, 'departments', '', 'Toàn quyền đơn vị', 'Toàn quyền đơn vị', 'QL Đơn vị', 1, '2019-02-25 14:20:45', NULL),
(51, 'departments', 'index', 'Xem dánh sách đơn vị', 'Xem danh sách đơn vị', 'QL Đơn vị', 1, '2019-02-25 14:20:45', NULL),
(52, 'departments', 'add', 'Thêm đơn vị', 'Thêm đơn vị', 'QL Đơn vị', 1, '2019-02-25 14:20:45', NULL),
(53, 'departments', 'edit', 'Cập nhật đơn vị', 'Cập nhật đơn vị', 'QL Đơn vị', 1, '2019-02-25 14:20:45', NULL),
(54, 'departments', 'delete', 'Xóa đơn vị', 'Xóa đơn vị', 'QL Đơn vị', 1, '2019-02-25 14:20:45', NULL),
(55, 'departments', 'addmodal', 'Thêm đơn vị qua modal', 'Thêm đơn vị qua modal', 'QL Đơn vị', 1, '2019-02-25 14:20:45', NULL),
(70, 'depreciation', '', 'Toàn quyền khấu hao tài sản', 'Toàn quyền khấu hao tài sản', 'QL Khấu hao tài sản', 1, '2019-02-25 14:20:45', NULL),
(71, 'depreciation', 'index', 'Xem danh sách khấu hao tài sản', 'Xem danh sách khấu hao tài sản', 'QL Khấu hao tài sản', 1, '2019-02-25 14:20:45', NULL),
(72, 'depreciation', 'detail', 'Xem chi tiết khấu hao tài sản', 'Xem chi tiết khấu hao tài sản', 'QL Khấu hao tài sản', 1, '2019-02-25 14:20:45', NULL),
(90, 'liquidation', '', 'Toàn quyền thanh lý tài sản', 'Toàn quyền thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45', NULL),
(91, 'liquidation', 'index', 'Xem danh sách thanh lý tài sản', 'Xem danh sách thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45', NULL),
(92, 'liquidation', 'offers', 'Danh sách đề nghị thanh lý tài sản', 'Danh sách đề nghị thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45', NULL),
(93, 'liquidation', 'getdatalist', 'Lấy danh sách đề nghị thanh lý tài sản', 'Lấy danh sách đề nghị thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45', NULL),
(94, 'liquidation', 'editoffer', 'Cập nhật đề nghị thanh lý tài sản', 'Cập nhật đề nghị thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45', NULL),
(95, 'liquidation', 'confirm', 'Xác nhận đề nghị thanh lý tài sản', 'Xác nhận đề nghị thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45', NULL),
(96, 'liquidation', 'getdata', 'Lấy dữ liệu thanh lý tài sản', 'Lấy dữ liệu thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45', NULL),
(97, 'liquidation', 'add', 'Thêm thanh lý tài sản', 'Thêm thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45', NULL),
(98, 'liquidation', 'edit', 'Cập nhật thanh lý tài sản', 'Cập nhật thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45', NULL),
(99, 'liquidation', 'delete', 'Xóa thanh lý tài sản', 'Xóa thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45', NULL),
(100, 'liquidation', 'item', 'Khôi phục tài sản', 'Khôi phục tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45', NULL),
(101, 'liquidation', 'reject', 'Từ chối thanh lý tài sản', 'Từ chối thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45', NULL),
(102, 'liquidation', 'confirm', 'Chấp nhận thanh lý tài sản', 'Chấp nhận thanh lý tài sản', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45', NULL),
(103, 'liquidation', 'trash', 'Đưa tài sản vào thùng rác', 'Đưa tài sản vào thùng rác', 'QL Thanh lý tài sản', 1, '2019-02-25 14:20:45', NULL),
(110, 'plan', '', 'Toàn quyền vị trí sử dụng tài sản', 'Toàn quyền vị trí sử dụng tài sản', 'QL Kế hoạch', 1, '2019-02-25 14:20:45', NULL),
(111, 'plan', 'index', 'Xem danh sách vị trí sử dụng tài sản', 'Xem danh sách vị trí sử dụng tài sản', 'QL Kế hoạch', 1, '2019-02-25 14:20:45', NULL),
(112, 'plan', 'add', 'Thêm vị trí sử dụng tài sản', 'Thêm vị trí sử dụng tài sản', 'QL Kế hoạch', 1, '2019-02-25 14:20:45', NULL),
(113, 'plan', 'edit', 'Cập nhật vị trí sử dụng tài sản', 'Cập nhật vị trí sử dụng tài sản', 'QL Kế hoạch', 1, '2019-02-25 14:20:45', NULL),
(114, 'plan', 'delete', 'Xóa kế hoạch', 'Xóa kế hoạch', 'QL Kế hoạch', 1, '2019-02-25 14:20:45', NULL),
(115, 'plan', 'check', 'Kiểm tra kế hoạch', 'Kiểm tra kế hoạch', 'QL Kế hoạch', 1, '2019-02-25 14:20:45', NULL),
(116, 'plan', 'affirmation', 'Phê duyệt kế hoạch', 'Phê duyệt kế hoạch', 'QL Kế hoạch', 1, '2019-02-25 14:20:45', NULL),
(117, 'plan', 'handover', 'Bàn giao kế hoạch', 'Bàn giao kế hoạch', 'QL Kế hoạch', 1, '2019-02-25 14:20:45', NULL),
(118, 'plan', 'acceptance', 'Nghiệm thu kế hoạch', 'Nghiệm thu kế hoạch', 'QL Kế hoạch', 1, '2019-02-25 14:20:45', NULL),
(119, 'plan', 'print', 'Kiểm tra kế hoạch', 'Kiểm tra kế hoạch', 'QL Kế hoạch', 1, '2019-02-25 14:20:45', NULL),
(130, 'maintenance', '', 'Toàn quyền bảo trì tài sản', 'Toàn quyền bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45', NULL),
(131, 'maintenance', 'index', 'Xem danh sách bảo trì tài sản', 'Xem danh sách bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45', NULL),
(132, 'maintenance', 'add', 'Thêm bảo trì tài sản', 'Thêm bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45', NULL),
(133, 'maintenance', 'edit', 'Cập nhật bảo trì tài sản', 'Cập nhật bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45', NULL),
(134, 'maintenance', 'delete', 'Xóa bảo trì tài sản', 'Xóa bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45', NULL),
(135, 'maintenance', 'getdata', 'Lấy dữ liệu bảo trì tài sản', 'Lấy dữ liệu bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45', NULL),
(136, 'maintenance', 'confirm', 'Xác nhận đã bảo trì tài sản', 'Xác nhận đã bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45', NULL),
(137, 'maintenance', 'notification', 'Lấy thông báo bảo trì tài sản', 'Lấy thông báo bảo trì tài sản', 'QL Bảo trì tài sản', 1, '2019-02-25 14:20:45', NULL),
(150, 'managers', '', 'Toàn quyền người sử dụng', 'Toàn quyền người sử dụng', 'QL người sử dụng', 1, '2019-02-25 14:20:45', NULL),
(151, 'managers', 'index', 'Xem danh sách người sử dụng', 'Xem danh sách người sử dụng', 'QL người sử dụng', 1, '2019-02-25 14:20:45', NULL),
(152, 'managers', 'add', 'Thêm người sử dụng', 'Thêm người sử dụng', 'QL người sử dụng', 1, '2019-02-25 14:20:45', NULL),
(153, 'managers', 'edit', 'Cập nhật người sử dụng', 'Cập nhật người sử dụng', 'QL người sử dụng', 1, '2019-02-25 14:20:45', NULL),
(154, 'managers', 'delete', 'Xóa người sử dụng', 'Xóa người sử dụng', 'QL người sử dụng', 1, '2019-02-25 14:20:45', NULL),
(155, 'managers', 'addmodal', 'Thêm người sử dụng qua modal', 'Thêm người sử dụng qua modal', 'QL người sử dụng', 1, '2019-02-25 14:20:45', NULL),
(170, 'offers', '', 'Toàn quyền đề nghị trang cấp', 'Toàn quyền đề nghị trang cấp', 'QL Đề nghị trang cấp tài sản', 1, '2019-02-25 14:20:45', NULL),
(171, 'offers', 'index', 'Xem danh sách đề nghị trang cấp', 'Xem danh sách đề nghị trang cấp', 'QL Đề nghị trang cấp tài sản', 1, '2019-02-25 14:20:45', NULL),
(172, 'offers', 'add', 'Thêm đề nghị trang cấp', 'Thêm đề nghị trang cấp', 'QL Đề nghị trang cấp tài sản', 1, '2019-02-25 14:20:45', NULL),
(173, 'offers', 'edit', 'Cập nhật đề nghị trang cấp', 'Cập nhật nghị trang cấp', 'QL Đề nghị trang cấp tài sản', 1, '2019-02-25 14:20:45', NULL),
(174, 'offers', 'delete', 'Xóa đề nghị trang cấp', 'Xóa đề nghị trang cấp', 'QL Đề nghị trang cấp tài sản', 1, '2019-02-25 14:20:45', NULL),
(175, 'offers', 'getdata', 'Lấy dữ liệu đề nghị trang cấp', 'Lấy dữ liệu đề nghị trang cấp', 'QL Đề nghị trang cấp tài sản', 1, '2019-02-25 14:20:45', NULL),
(190, 'roles', '', 'Toàn quyền phân quyền', 'Toàn quyền phân quyên', 'QL phân quyền', 1, '2019-02-25 14:20:45', NULL),
(191, 'roles', 'index', 'Xem danh sách các nhóm quyền', 'Xem danh sách các nhóm quyền', 'QL phân quyền', 1, '2019-02-25 14:20:45', NULL),
(210, 'users', '', 'Toàn quyền quản lý tài khoản', 'Toàn quyền quản lý tài khoản', 'QL Tài khoản', 1, '2019-02-25 14:20:45', NULL),
(211, 'users', 'index', 'Xem danh sách tài khoản', 'Xem danh sách tài khoản', 'QL Tài khoản', 1, '2019-02-25 14:20:45', NULL),
(212, 'users', 'add', 'Thêm tài khoản', 'Thêm tài khoản', 'QL Tài khoản', 1, '2019-02-25 14:20:45', NULL),
(213, 'users', 'edit', 'Cập nhật tài khoản', 'Cập nhật tài khoản', 'QL Tài khoản', 1, '2019-02-25 14:20:45', NULL),
(214, 'users', 'delete', 'Xóa tài khoản', 'Xóa tài khoản', 'QL Tài khoản', 1, '2019-02-25 14:20:45', NULL),
(230, 'transfers', '', 'Toàn quyền luân chuyển tài sản', 'Toàn quyền luân chuyển tài sản', 'QL Luân chuyển', 1, '2019-02-25 14:20:45', NULL),
(234, 'transfers', 'index', 'Xem danh sách luân chuyển tài sản', 'Xem danh sách luân chuyển tài sản', 'QL Luân chuyển', 1, '2019-02-25 14:20:45', NULL),
(235, 'transfers', 'add', 'Thêm luân chuyển tài sản', 'Thêm luân chuyển tài sản', 'QL Luân chuyển', 1, '2019-02-25 14:20:45', NULL),
(250, 'stores', '', 'Toàn quyền quản lý kho', 'Toàn quyền quản lý kho', 'QL Kho', 1, '2019-02-25 14:20:45', NULL),
(251, 'stores', 'index', 'Xem danh sách kho', 'Xem danh sách kho', 'QL kho', 1, '2019-02-25 14:20:45', NULL),
(252, 'stores', 'add', 'Thêm kho', 'Thêm kho', 'QL kho', 1, '2019-02-25 14:20:45', NULL),
(253, 'stores', 'edit', 'Cập nhật kho', 'Cập nhật kho', 'QL kho', 1, '2019-02-25 14:20:45', NULL),
(254, 'stores', 'delete', 'Xóa kho', 'Xóa kho', 'QL kho', 1, '2019-02-25 14:20:45', NULL),
(255, 'stores', 'getdata', 'Lấy dữ liệu kho', 'Lấy dữ liệu kho', 'QL kho', 1, '2019-02-25 14:20:45', NULL);

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
(3, 'Nhân viên', '[10,31,92,93,94,97,111,130,151]', 'Y');

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
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` text COLLATE utf8_unicode_ci,
  `role` int(5) NOT NULL,
  `department_id` int(11) NOT NULL,
  `department_mg` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `email`, `phone`, `avatar`, `role`, `department_id`, `department_mg`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', '$2y$08$cXRmK2VuMEdnTng1djdNUuenzqcmeseBNXJU8mFV/9wZXILFsd2eK', 'admin@gmail.com', '01234567890', '', 1, -1, '', 1, '2016-10-13 22:05:35', '2018-11-23 08:25:16');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`slug`);

--
-- Chỉ mục cho bảng `cat_status`
--
ALTER TABLE `cat_status`
  ADD PRIMARY KEY (`id`);

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
-- Chỉ mục cho bảng `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `log_history`
--
ALTER TABLE `log_history`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_id` (`attribute_id`),
  ADD KEY `status` (`status`);

--
-- Chỉ mục cho bảng `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

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
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `constraints_13` (`role`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `cat_status`
--
ALTER TABLE `cat_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `default_tb`
--
ALTER TABLE `default_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `log_history`
--
ALTER TABLE `log_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
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
