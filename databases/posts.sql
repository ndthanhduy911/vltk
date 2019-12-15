-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 15, 2019 lúc 06:49 PM
-- Phiên bản máy phục vụ: 10.4.10-MariaDB
-- Phiên bản PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `test`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cat_id` int(4) DEFAULT 1,
  `status` int(1) NOT NULL,
  `featured_image` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `calendar` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `slug`, `cat_id`, `status`, `featured_image`, `author`, `dept_id`, `calendar`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'c', 2, 0, '/uploads/khoa-vat-ly/logo96x96.png', 1, 1, '2019-09-08 09:58:00', '2019-09-08 09:58:40', '2019-10-03 22:32:17', 0),
(2, 'aaaaaaaaaaaaaaaaa', 2, 0, '', 1, 1, '2019-09-29 11:19:00', '2019-09-29 11:20:05', '2019-10-03 22:32:06', 0),
(3, 'recruitment-information-from-the-nano-structure-and-material-research-center-inomar', 5, 1, '', 1, 1, '2019-08-31 11:00:00', '2019-10-03 21:52:57', '2019-10-06 12:45:00', 0),
(4, 'recruitment-information-from-onsky-vietnam-company', 5, 1, '', 1, 1, '2019-08-19 09:50:00', '2019-10-03 21:59:55', '2019-10-06 12:45:21', 0),
(5, 'recruitment-information-from-dong-hai-company', 5, 1, '', 1, 1, '2019-08-18 10:00:00', '2019-10-03 22:10:08', '2019-10-05 09:06:49', 0),
(6, 'recruitment-information-of-mitsuba-company-102019', 5, 1, '', 1, 1, '2019-07-22 08:50:00', '2019-10-03 22:12:44', '2019-10-06 12:44:25', 0),
(7, 'dssv-bi-canh-cao-hoc-vu-va-buoc-thoi-hoc-tu-hk12019-2020', 2, 1, '', 1, 1, '2019-09-28 22:37:00', '2019-10-03 22:38:23', '2019-10-03 22:38:48', 0),
(8, 'thong-bao-vv-thay-doi-phong-hoc-cac-lop-ham-phuc', 2, 1, '', 1, 1, '2019-08-28 22:44:00', '2019-10-03 22:45:49', '2019-10-03 22:45:49', 0),
(9, 'bang-chuyen-doi-hoc-phan-k2018-ve-truoc-cac-mon-ly-luan-chinh-tri', 2, 1, '', 1, 1, '2019-08-24 22:47:00', '2019-10-03 22:47:36', '2019-10-03 22:48:19', 0),
(10, 'thoi-khoa-bieu-hk12019-2020-bac-dai-hoc-he-chinh-quy-khoa-2018-va-2019', 2, 1, '', 1, 1, '2019-08-22 22:49:00', '2019-10-03 22:49:26', '2019-10-03 22:49:26', 0),
(11, 'thoi-khoa-bieu-hk-i-2019-2020-va-lich-dang-ky-hoc-phan-cap-nhat', 2, 1, '', 1, 1, '2019-08-31 22:50:00', '2019-10-03 22:51:17', '2019-10-03 22:51:17', 0),
(12, 'thong-bao-seminar-ve-chu-de-y-hoc-hat---vat-ly-va-vat-lieu', 3, 1, '', 1, 1, '2019-10-01 22:54:00', '2019-10-03 22:54:25', '2019-10-03 22:54:25', 0),
(13, 'moi-tham-du-hoi-nghi-vat-ly-y-khoa-toan-quoc-lan-thu-3', 3, 1, '', 1, 1, '2019-07-08 22:57:00', '2019-10-03 22:58:13', '2019-10-03 22:58:13', 0),
(14, 'thu-moi-tham-gia-hoi-nghi-khoa-hoc-truong-dh-khtn-lan-thu-xi-0910112018', 3, 1, '', 1, 1, '2019-09-03 22:59:00', '2019-10-03 22:59:42', '2019-10-03 22:59:42', 0),
(15, 'seminar-chu-de-science-at-the-frontier-cua-gs-yuan-tseh-lee', 3, 1, '', 1, 1, '2019-06-08 23:01:00', '2019-10-03 23:01:56', '2019-10-03 23:01:56', 0),
(16, 'thong-bao-seminar-ve-vat-ly-y-khoa---ky-thuat-y-sinh', 3, 1, '', 1, 1, '2019-07-01 23:02:00', '2019-10-03 23:03:21', '2019-10-03 23:03:21', 0),
(17, 'trung-tam-toan-tu-duy-sylvan-learning-tuyen-dung', 5, 1, '', 1, 1, '2019-07-20 23:04:00', '2019-10-03 23:05:22', '2019-10-09 22:18:46', 0),
(18, 'thong-bao-cap-nhat-lich-thi-hkii-2012-2013', 2, 1, '', 1, 1, '2013-03-02 00:00:00', '2019-10-04 13:13:10', '2019-10-04 13:14:04', 0),
(19, 'thong-bao-ve-viec-nop-ho-so-xet-tot-nghiep-dai-hoc', 2, 1, '', 1, 1, '2019-10-04 13:15:00', '2019-10-04 13:15:03', '2019-10-04 13:15:03', 0),
(20, 'thong-bao-danh-sach-sinh-vien-nhan-hoc-bong-itahashi-va-mitsuba-viet-nam-nam-2013', 2, 1, '', 1, 1, '2013-07-04 13:18:00', '2019-10-04 13:18:28', '2019-10-04 13:18:36', 0),
(21, 'thong-bao-ve-viec-huong-dan-kich-hoat-tai-khoan-sinh-vien-tren-he-thong-quan-ly-moi', 2, 1, '', 1, 1, '2013-12-27 13:19:00', '2019-10-04 13:20:20', '2019-10-04 13:20:20', 0),
(22, 'thong-bao-ve-viec-trien-khai-tai-khoan-sinh-vien-tren-he-thong-quan-ly-moi', 2, 1, '', 1, 1, '2013-12-18 00:00:00', '2019-10-04 13:22:33', '2019-10-04 13:22:33', 0),
(23, 'thong-bao-mot-so-luu-y-ve-viec-kich-hoat-tai-khoan-sinh-vien-tren-he-thong-quan-ly-moi', 2, 1, '', 1, 1, '2013-12-30 13:24:00', '2019-10-04 13:24:25', '2019-10-04 13:24:25', 0),
(24, 'thong-bao-ve-tinh-hinh-kich-hoat-tai-khoan-sinh-vien-tren-he-thong-quan-ly-moi', 2, 1, '', 1, 1, '2014-01-09 13:25:00', '2019-10-04 13:25:48', '2019-10-04 13:25:48', 0),
(25, 'thong-bao-ve-lich-sinh-hoat-cong-dan-cuoi-khoa-nam-hoc-2013--2014', 2, 1, '', 1, 1, '2014-02-26 13:27:00', '2019-10-04 13:27:29', '2019-10-04 13:27:29', 0),
(26, 'danh-sach-tot-nghiep-dot-thang-32014', 2, 1, '', 1, 1, '2014-03-17 13:28:00', '2019-10-04 13:28:49', '2019-10-04 13:28:49', 0),
(27, 'thong-bao-dong-hoc-phi-hk213-14---dai-hoc-chinh-quy', 2, 1, '', 1, 1, '2014-03-25 13:29:00', '2019-10-04 13:29:45', '2019-10-04 13:29:45', 0),
(28, 'phieu-dang-ky-hoc-phan-va-dong-hoc-phi-cua-sinh-vien-trong-hoc-ky-213-14', 2, 1, '', 1, 1, '2014-03-31 13:30:00', '2019-10-04 13:31:04', '2019-10-04 13:31:04', 0),
(29, 'thong-bao-tuyen-dung-cua-cong-ty-renesas', 5, 1, '', 1, 1, '2013-07-04 09:10:00', '2019-10-05 09:11:15', '2019-10-09 22:17:38', 0),
(30, 'thong-bao-tuyen-dung-cua-cong-ty-sinh-hung', 5, 1, '', 1, 1, '2013-07-11 09:12:00', '2019-10-05 09:13:11', '2019-10-09 22:19:46', 0),
(31, 'thong-bao-tuyen-dung-cua-cong-ty-renesas---thang-7', 5, 1, '', 1, 1, '2013-07-21 09:15:00', '2019-10-05 09:15:47', '2019-10-09 22:20:24', 0),
(32, 'thong-bao-tuyen-dung-cua-cong-ty-renesas-thang-12', 5, 1, '', 1, 1, '2013-12-14 09:21:00', '2019-10-05 09:22:12', '2019-10-09 22:21:22', 0),
(33, 'thong-bao-tuyen-dung-cua-cong-ty-fairfield-vietnam', 5, 1, '', 1, 1, '2014-01-20 09:24:00', '2019-10-05 09:24:25', '2019-10-09 22:22:38', 0),
(34, 'cty-sony-nhat-ban-tuyen-dung-nhan-su-chuyen-nganh-quang-hoc', 5, 1, '', 1, 1, '2014-02-12 09:26:00', '2019-10-05 09:27:09', '2019-10-09 22:23:24', 0),
(35, 'cong-ty-renesas-tuyen-thuc-tap-sinh-nam-2014', 5, 1, '', 1, 1, '2014-03-20 09:30:00', '2019-10-05 09:30:58', '2019-10-09 22:24:03', 0),
(36, 'renesas-tuyen-ky-su-vat-ly-chu-nhat-672014', 5, 1, '', 1, 1, '2014-07-06 09:33:00', '2019-10-05 09:33:24', '2019-10-09 22:24:47', 0),
(37, 'cty-uniquify-tuyen-dung-sinh-vien-vat-ly-sap-ra-truong', 5, 1, '', 1, 1, '2014-06-22 09:35:00', '2019-10-05 09:35:37', '2019-10-09 22:26:48', 0),
(38, 'tuyen-chuyen-vien-ky-thuat-may-phan-tich-quang-pho-x-ray', 5, 1, '', 1, 1, '2014-06-24 09:37:00', '2019-10-05 09:37:22', '2019-10-09 22:29:29', 0),
(39, 'thong-bao-tuyen-dung-cua-cong-ty-mitsuba', 5, 1, '', 1, 1, '2014-07-13 09:39:00', '2019-10-05 09:39:55', '2019-10-09 22:30:19', 0),
(40, 'renesas-tuyen-ky-su-vat-ly-chu-nhat-382014', 5, 1, '', 1, 1, '2014-07-27 09:41:00', '2019-10-05 09:41:48', '2019-10-09 22:30:56', 0),
(41, 'renesas-tuyen-ky-su-vat-ly-chu-nhat-1782014', 5, 1, '', 1, 1, '2014-08-04 09:42:00', '2019-10-05 09:42:58', '2019-10-09 22:31:25', 0),
(42, 'tuyen-dung-tu-cong-ty-uniquify-viet-nam', 5, 1, '', 1, 1, '2014-09-25 09:44:00', '2019-10-05 09:44:48', '2019-10-09 22:32:16', 0),
(43, 'cong-ti-renesas-tuyen-ky-su', 5, 1, '', 1, 1, '2014-10-25 09:47:00', '2019-10-05 09:47:55', '2019-10-09 22:33:21', 0),
(51, 'thong-bao-vv-trien-khai-thuc-hien-tam-thoi-che-do-mien-giam-hoc-phi-nam-hoc-2013-2014', 2, 1, '', 1, 1, '2014-05-01 20:42:00', '2019-10-05 20:43:10', '2019-10-05 20:43:10', 0),
(55, 'cong-ty-uvp-tuyen-ki-su-ban-dan', 5, 1, '', 1, 1, '2014-11-19 12:28:00', '2019-10-06 12:30:18', '2019-10-09 22:34:12', 0),
(57, 'thong-bao-tuyen-dung-cua-cong-ty-tnhh-arrive-technologies-viet-nam', 5, 1, '', 1, 1, '2014-09-17 12:21:00', '2019-10-06 12:36:17', '2019-10-09 22:35:20', 0),
(58, 'cong-ty-tnhh-tbgd-hong-anh-tuyen-dung-vi-tri-nhan-vien-nghiep-vu-kcs-chuyen-nganh-vat-ly', 5, 1, '', 1, 1, '2014-11-20 12:38:00', '2019-10-06 12:38:50', '2019-10-09 22:35:54', 0),
(59, 'just-information-technology-ha-noi-tuyen-ki-su', 5, 1, '', 1, 1, '2015-01-06 12:47:00', '2019-10-06 12:47:32', '2019-10-09 22:36:36', 0),
(60, 'thong-tin-tuyen-dung-cua-fpt-software-hcm', 5, 1, '', 1, 1, '2015-03-11 12:53:00', '2019-10-06 12:53:17', '2019-10-09 22:40:05', 0),
(61, 'fpt-software-hcm-tuyen-dung', 5, 1, '', 1, 1, '2015-03-17 12:55:00', '2019-10-06 12:55:20', '2019-10-06 12:55:20', 0),
(62, 'tuyen-dung-cua-vien-ky-thuat-cong-nghe-cao-ntt--dh-nguyen-tat-thanh', 5, 1, '', 1, 1, '2015-04-23 12:56:00', '2019-10-06 12:56:36', '2019-10-09 22:40:43', 0),
(63, 'trung-tam-ky-thuat-tieu-chuan-do-luong-chat-luong-3-tuyen-dung', 5, 1, '', 1, 1, '2015-05-02 12:57:00', '2019-10-06 12:58:14', '2019-10-09 22:41:57', 0),
(64, 'thong-tin-tuyen-dung-cua-cong-ty-renesas', 5, 1, '', 1, 1, '2015-06-03 13:01:00', '2019-10-06 13:02:05', '2019-10-09 22:42:57', 0),
(65, 'ptn-ailab-tuyen-dung-internship', 5, 1, '', 1, 1, '2015-06-21 13:03:00', '2019-10-06 13:03:55', '2019-10-09 22:44:07', 0),
(66, 'cong-ty-renesas-to-chuc-thi-tuyen-ky-su-dot-2-tai-tphcm', 5, 1, '', 1, 1, '2015-06-22 13:05:00', '2019-10-06 13:05:52', '2019-10-09 22:44:35', 0),
(67, 'cong-ty-mitsuba-tuyen-dung-nam-2015-dot-2', 5, 1, '', 1, 1, '2015-07-20 13:07:00', '2019-10-06 13:07:35', '2019-10-09 22:45:14', 0),
(68, 'cong-ty-pin-nang-luong-mat-troi-bao-toan-a-tuyen-ky-su-chinh', 5, 1, '', 1, 1, '2015-08-08 13:10:00', '2019-10-06 13:10:41', '2019-10-09 22:46:02', 0),
(69, 'cong-ty-bridgestone-tuyen-dung-thuc-tap-vien-it--helpdesk', 5, 1, '', 1, 1, '2015-08-12 13:12:00', '2019-10-06 13:12:34', '2019-10-09 22:47:19', 0),
(70, 'cong-ty-ryomo-vietnam-solutions-tuyen-dung', 5, 1, '', 1, 1, '2015-09-28 13:13:00', '2019-10-06 13:14:02', '2019-10-09 22:48:20', 0),
(71, 'thong-bao-tuyen-dung-cua-cong-ty-uniquify-viet-nam', 5, 1, '', 1, 1, '2015-12-06 13:15:00', '2019-10-06 13:16:09', '2019-10-09 22:48:45', 0),
(72, 'cong-ty-mitsuba-thong-bao-tuyen-dung-sinh-vien-khoa-vat-ly-vat-ly-ky-thuat', 5, 1, '', 1, 1, '2016-03-06 13:19:00', '2019-10-06 13:19:48', '2019-10-09 22:49:36', 0),
(73, 'tuyen-dung-giao-vien-day-cac-mon-khtn-bang-tieng-anh', 5, 1, '', 1, 1, '2016-03-24 13:22:00', '2019-10-06 13:23:18', '2019-10-09 22:50:25', 0),
(74, 'cong-ty-gameloft-thong-bao-tuyen-dung', 5, 1, '', 1, 1, '2016-04-14 13:27:00', '2019-10-06 13:27:47', '2019-10-09 22:15:27', 0),
(75, 'trung-tam-nghien-cuu-va-phat-trien-nidec-servo-viet-nam-tuyen-dung', 5, 1, '', 1, 1, '2016-05-18 13:32:00', '2019-10-06 13:32:31', '2019-10-09 22:13:19', 0),
(76, 'thong-bao-tuyen-dung-cua-cong-ty-mitsuba-trong-thang-8', 5, 1, '', 1, 1, '2016-08-10 13:38:00', '2019-10-06 13:38:45', '2019-10-09 22:12:24', 0),
(77, 'cong-ty-thiet-bi-giao-duc-hong-anh-thong-bao-tuyen-dung-sinh-vien-nganh-vat-ly-han-chot-3011', 5, 1, '', 1, 1, '2016-11-20 13:43:00', '2019-10-06 13:43:42', '2019-10-09 22:11:34', 0),
(78, 'thong-bao-vv-cap-nhat-thong-tin-tai-khoan-sinh-vien-tren-web-portal', 2, 1, '', 1, 1, '2014-05-06 19:54:00', '2019-10-06 19:54:40', '2019-10-06 19:54:40', 0),
(79, 'lich-hk-ii-nam-hoc-2013-2014-cap-nhat', 2, 1, '', 1, 1, '2014-05-16 19:55:00', '2019-10-06 19:56:08', '2019-10-06 19:56:08', 0),
(80, 'thong-bao-vv-thuc-hien-che-do-mien-giam-hoc-phi-nam-hoc-2013-2014-chinh-thuc', 2, 1, '', 1, 1, '2014-06-06 19:56:00', '2019-10-06 19:57:04', '2019-10-06 19:57:04', 0),
(81, 'thong-bao-xet-tot-nghiep-dot-thang-9-2014', 2, 1, '', 1, 1, '2014-06-18 19:57:00', '2019-10-06 19:58:02', '2019-10-06 19:58:02', 0),
(82, 'lich-on-thi-cao-hoc-khoa-vat-ly-vat-ly-ky-thuat-2014', 2, 1, '', 1, 1, '2014-06-26 19:58:00', '2019-10-06 19:59:13', '2019-10-06 19:59:13', 0),
(83, 'thong-bao-le-tot-nghiep-khoa-2010-dot-thang-09-2014', 2, 1, '', 1, 1, '2014-09-06 20:00:00', '2019-10-06 20:00:19', '2019-10-06 20:00:19', 0),
(84, 'announcement-schedule-of-computational-physics', 2, 1, '', 1, 1, '2014-10-13 20:01:00', '2019-10-06 20:02:09', '2019-10-06 20:02:09', 0),
(85, 'announcement-of-english-class-3-schedule-and-2014-class-schedule', 2, 1, '', 1, 1, '2014-10-15 20:03:00', '2019-10-06 20:03:34', '2019-10-06 20:03:34', 0),
(86, 'notice-of-general-law-subjects-schedule', 2, 1, '', 1, 1, '2015-01-06 20:04:00', '2019-10-06 20:04:58', '2019-10-06 20:04:58', 0),
(87, 'list-of-students-registering-for-the-module-failed', 2, 1, '', 1, 1, '2015-01-10 20:06:00', '2019-10-06 20:06:41', '2019-10-06 20:06:41', 0),
(88, 'notice-of-application-for-consideration-of-graduated-university', 2, 1, '', 1, 1, '2015-01-13 20:07:00', '2019-10-06 20:07:56', '2019-10-06 20:07:56', 0),
(89, 'graduation-ceremony-2014', 2, 1, '', 1, 1, '2015-03-16 20:09:00', '2019-10-06 20:09:57', '2019-10-06 20:09:57', 0),
(90, 'list-of-students-whose-academic-warnings-and-suspension-of-education', 2, 1, '', 1, 1, '2015-03-20 20:11:00', '2019-10-06 20:12:02', '2019-10-06 20:12:02', 0),
(91, 'notify-v-v-considered-as-thesis-graduation-exam-for-students-of-2012-class', 2, 1, '', 1, 1, '2016-01-12 20:12:00', '2019-10-06 20:13:33', '2019-10-06 20:13:33', 0),
(92, 'regulations-learning-english-and-english-proficiency-standards-for-full-time-undergraduate-students', 2, 1, '', 1, 1, '2016-01-18 20:14:00', '2019-10-06 20:15:06', '2019-10-06 20:15:06', 0),
(93, 'notice-of-graduation-submission-in-march-2016', 2, 1, '', 1, 1, '2016-02-22 20:15:00', '2019-10-06 20:16:23', '2019-10-06 20:16:23', 0),
(94, 'notice-of-registration-for-improving-returning-exam', 2, 1, '', 1, 1, '2016-04-06 20:17:00', '2019-10-06 20:18:08', '2019-10-06 20:18:08', 0),
(95, 'list-of-students-receiving-alumni-scholarships-2014', 2, 1, '', 1, 1, '2014-04-21 20:19:00', '2019-10-06 20:19:34', '2019-10-06 20:19:34', 0),
(96, 'list-of-graduating-students-in-march-2016', 2, 1, '', 1, 1, '2016-02-06 20:20:00', '2019-10-06 20:20:47', '2019-10-06 20:20:47', 0),
(97, 'cong-ty-tnhh-binh-tien-dong-nai-tuyen-dung-sinh-vien-khoa-vat-ly-vat-ly-tin-hoc-va-cong-nghe-thong-tin', 5, 1, '', 1, 1, '2016-12-08 08:35:00', '2019-10-06 20:35:47', '2019-10-09 22:10:23', 0),
(98, 'cong-ty-co-phan-thep-nam-kim-tuyen-dung', 5, 1, '', 1, 1, '2016-12-18 08:50:00', '2019-10-06 20:37:26', '2019-10-09 22:09:30', 0),
(99, 'cong-ty-arrive-technologies-thong-bao-tuyen-dung', 5, 1, '', 1, 1, '2017-03-12 09:50:00', '2019-10-06 20:39:53', '2019-10-09 22:08:27', 0),
(100, 'list-of-students-warned-and-forced-to-leave-school', 2, 1, '', 1, 1, '2016-03-25 20:40:00', '2019-10-06 20:40:36', '2019-10-06 20:40:36', 0),
(101, 'test-schedule-for-semester-i-of-the-2016-2017-school-year-updated', 2, 1, '', 1, 1, '2016-12-19 20:42:00', '2019-10-06 20:42:34', '2019-10-06 20:42:34', 0),
(102, 'cong-ty-mitsuba-tuyen-dung-sinh-vien-khoa-vat-ly-da-tot-nghiep-han-chot-223', 5, 1, '', 1, 1, '2017-03-14 09:10:00', '2019-10-06 20:42:56', '2019-10-09 22:07:59', 0),
(103, 'thong-bao-tuyen-dung-cua-tap-doan-bosch-trong-thang-5', 5, 1, '', 1, 1, '2017-05-08 10:00:00', '2019-10-06 20:44:32', '2019-10-09 22:07:31', 0),
(104, 'yuanch-viet-nam-thong-bao-tuyen-dung', 5, 1, '', 1, 1, '2017-05-15 11:50:00', '2019-10-06 20:45:38', '2019-10-09 22:06:56', 0),
(105, 'notice-of-online-registration-of-hk-ii-modules-for-the-academic-year-2016-2017', 2, 1, '', 1, 1, '2017-01-27 20:46:00', '2019-10-06 20:46:40', '2019-10-06 20:46:40', 0),
(106, 'tap-doan-horiba-thong-bao-tuyen-dung', 5, 1, '', 1, 1, '2017-06-12 20:46:00', '2019-10-06 20:46:48', '2019-10-09 22:05:42', 0),
(107, 'announcement-regarding-the-evaluation-of-the-1st-semester-of-the-2016-2017-school-year', 2, 1, '', 1, 1, '2017-02-28 20:47:00', '2019-10-06 20:48:07', '2019-10-06 20:48:07', 0),
(108, 'cong-ty-mitsuba-thong-bao-tuyen-dung-sinh-vien-khoa-vat-ly-sap-tot-nghiep', 5, 1, '', 1, 1, '2017-07-03 09:50:00', '2019-10-06 20:48:18', '2019-10-09 22:04:53', 0),
(109, 'notice-of-changing-the-schedule-of-basic-electronics-and-atomic-physics', 2, 1, '', 1, 1, '2017-02-28 20:49:00', '2019-10-06 20:49:47', '2019-10-06 20:49:47', 0),
(110, 'arrive-technologies-tuyen-5-ky-su-design-validation', 5, 1, '', 1, 1, '2017-12-04 09:50:00', '2019-10-06 20:50:08', '2019-10-09 22:04:29', 0),
(111, 'list-of-students-studying-basic-electronics-and-calculating-methods', 2, 1, '', 1, 1, '2017-03-09 20:50:00', '2019-10-06 20:51:05', '2019-10-06 20:51:05', 0),
(112, 'tuyen-dung-ky-su-cho-nhieu-vi-tri-tai-cong-ty-olympus', 5, 1, '', 1, 1, '2017-12-18 08:00:00', '2019-10-06 20:51:35', '2019-10-09 22:03:56', 0),
(113, 'regulations-on-learning-english-and-standard-of-english', 2, 1, '', 1, 1, '2017-04-15 20:52:00', '2019-10-06 20:52:31', '2019-10-06 20:52:31', 0),
(114, 'notice-of-registration-for-the-hk-i-module-for-the-2017-2018-academic-year', 2, 1, '', 1, 1, '2017-08-07 20:53:00', '2019-10-06 20:53:53', '2019-10-06 20:53:53', 0),
(115, 'nhieu-co-hoi-viec-lam-danh-cho-sinh-vien-nganh-vat-ly', 5, 1, '', 1, 1, '2018-01-08 08:50:00', '2019-10-06 20:53:53', '2019-10-09 22:03:02', 0),
(116, 'tuyen-dung-cu-nhan-thac-sy-tien-si-vat-ly', 5, 1, '', 1, 1, '2018-03-12 09:00:00', '2019-10-06 20:55:54', '2019-10-09 22:02:23', 0),
(117, 'truong-thpt-dinh-thien-ly-tuyen-dung-giao-vien-vat-ly', 5, 1, '', 1, 1, '2018-06-04 09:10:00', '2019-10-06 20:57:18', '2019-10-09 22:01:42', 0),
(118, 'cong-ty-pin-mat-troi-first-solar-tuyen-dung-nhieu-vi-tri', 5, 1, '', 1, 1, '2018-06-18 08:10:00', '2019-10-06 21:01:05', '2019-10-09 22:00:41', 0),
(119, 'list-of-specialized-students-of-course-2015-official', 2, 1, '', 1, 1, '2017-08-15 21:01:00', '2019-10-06 21:01:54', '2019-10-06 21:01:54', 0),
(120, '2017-hk-i-timetable-2017-2018-and-schedule-for-enrollment-of-classes-updated-on-august-21', 2, 1, '', 1, 1, '2017-08-18 21:03:00', '2019-10-06 21:03:42', '2019-10-06 21:03:42', 0),
(121, 'cong-ty-mitsuba-thong-bao-tuyen-dung-sinh-vien-khoa-vat-ly', 5, 1, '', 1, 1, '2018-07-02 08:50:00', '2019-10-06 21:04:16', '2019-10-09 22:00:02', 0),
(122, 'tap-doan-bosch-thong-bao-tuyen-dung', 5, 1, '', 1, 1, '2018-07-16 21:06:00', '2019-10-06 21:06:34', '2019-10-09 21:59:22', 0),
(123, 'announcement-no-1-v-v-recruitment-of-the-2017-bachelor-of-talent', 2, 1, '', 1, 1, '2017-08-18 21:06:00', '2019-10-06 21:07:18', '2019-10-06 21:07:18', 0),
(124, 'cong-ty-new-ocean-thong-bao-tuyen-dung-sinh-vien-khoa-vat-ly', 5, 1, '', 1, 1, '2018-08-13 21:08:00', '2019-10-06 21:08:48', '2019-10-09 21:58:08', 0),
(125, 'notice-of-re-enrollment-of-algebra-b2-subject', 2, 1, '', 1, 1, '2017-08-25 21:08:00', '2019-10-06 21:08:49', '2019-10-06 21:08:49', 0),
(126, 'tuyen-dung-2-ky-thuat-vien-gamma-scan', 5, 1, '', 1, 1, '2018-09-04 08:50:00', '2019-10-06 21:10:00', '2019-10-09 21:57:16', 0),
(127, 'notice-of-basic-electronics-class-cancellation-vlh105', 2, 1, '', 1, 1, '2017-08-28 21:09:00', '2019-10-06 21:10:15', '2019-10-06 21:10:15', 0),
(128, 'tuyen-1-cu-nhan-vat-ly-ly-thuyet', 5, 1, '', 1, 1, '2018-09-17 08:00:00', '2019-10-06 21:11:22', '2019-10-09 21:56:06', 0),
(129, 'notify-v-v-update-class-schedule', 2, 1, '', 1, 1, '2017-09-08 21:11:00', '2019-10-06 21:11:40', '2019-10-06 21:11:40', 0),
(130, 'ges-tuyen-5-ky-su-quang-hoc', 5, 1, '', 1, 1, '2018-10-15 09:50:00', '2019-10-06 21:12:29', '2019-10-09 21:55:02', 0),
(131, 'notice-of-class-reopening-algebra-b2-tth004-dhcq', 2, 1, '', 1, 1, '2017-09-14 21:12:00', '2019-10-06 21:13:26', '2019-10-06 21:13:26', 0),
(132, 'cong-ty-cp-vinh-nam-thong-bao-tuyen-dung', 5, 1, '', 1, 1, '2018-11-12 08:00:00', '2019-10-06 21:14:02', '2019-10-09 21:54:38', 0),
(133, 'ascenx-technologies-thong-bao-tuyen-dung', 5, 1, '', 1, 1, '2018-11-15 09:00:00', '2019-10-06 21:15:02', '2019-10-09 21:53:52', 0),
(134, 'announcement-of-class-schedule-for-bachelor-of-talent-physics---2017', 2, 1, '', 1, 1, '2017-09-12 21:15:00', '2019-10-06 21:15:28', '2019-10-06 21:15:28', 0),
(135, 'vinschool-tuyen-giao-vien-cac-bo-mon', 5, 1, '', 1, 1, '2018-11-26 10:00:00', '2019-10-06 21:16:10', '2019-10-09 21:48:58', 0),
(136, 'the-teacher-changes-the-classroom-to-the-calculating-method-subject', 2, 1, '', 1, 1, '2019-10-25 21:16:00', '2019-10-06 21:16:39', '2019-10-06 21:16:39', 0),
(137, 'thong-tin-tuyen-dung-cong-ty-cp-vinh-nam', 5, 1, '', 1, 1, '2018-12-03 11:00:00', '2019-10-06 21:17:19', '2019-10-09 21:53:03', 0),
(138, 'ge3f-optics-tuyen-dung-vi-tri-optics-engineer', 5, 1, '', 1, 1, '2019-03-25 11:00:00', '2019-10-06 21:19:11', '2019-10-09 21:52:43', 0),
(142, 'announcement-about-rewarding-and-selecting-students-to-attend-the-university-level-graduation-ceremony-in-september-2017-at-the-regular-university-level', 2, 1, '', 1, 1, '2017-10-10 21:22:00', '2019-10-06 21:23:09', '2019-10-06 21:23:09', 0),
(143, 'announcement-about-organizing-specialized-festival-and-registration-guide-for-students-in-class-2016', 2, 1, '', 1, 1, '2017-11-29 21:27:00', '2019-10-06 21:27:41', '2019-10-06 21:27:41', 0),
(144, 'notice-of-registration-for-the-hk-ii-module-2017-2018', 2, 1, '', 1, 1, '2018-01-05 21:28:00', '2019-10-06 21:29:04', '2019-10-06 21:29:04', 0),
(145, 'notification-of-additional-unit-registration-phase-2', 2, 1, '', 1, 1, '2018-01-25 21:30:00', '2019-10-06 21:30:45', '2019-10-06 21:30:45', 0),
(146, 'notice-of-changing-classrooms-in-nuclear-physics-and-calculation-methods', 2, 1, '', 1, 1, '2018-01-29 21:31:00', '2019-10-06 21:32:04', '2019-10-06 21:32:04', 0),
(147, 'list-of-practice-groups-for-basic-subjects-class-of-2016', 2, 1, '', 1, 1, '2018-02-22 21:32:00', '2019-10-06 21:33:18', '2019-10-06 21:33:18', 0),
(148, 'notice-of-changing-classrooms-in-calculating-subjects', 2, 1, '', 1, 1, '2018-05-15 21:34:00', '2019-10-06 21:34:30', '2019-10-06 21:34:30', 0),
(149, 'notice-of-additional-registration-of-the-english-language-exam-for-the-hp-k2016-professional-registration', 2, 1, '', 1, 1, '2018-06-02 21:35:00', '2019-10-06 21:35:52', '2019-10-06 21:35:52', 0),
(150, 'tma-solutions-recruited-trainees-in-april-2019', 5, 1, '', 1, 1, '2019-04-15 11:00:00', '2019-10-06 21:36:56', '2019-10-06 21:36:56', 0),
(151, 'notice-of-specialized-registration-for-the-2016-class', 2, 1, '', 1, 1, '2018-06-30 21:38:00', '2019-10-06 21:38:25', '2019-10-06 21:38:25', 0),
(152, 'robert-bosch-engineering-and-business-solutions-vietnam-recruited-engineers', 5, 1, '', 1, 1, '2019-04-22 10:00:00', '2019-10-06 21:39:11', '2019-10-09 21:47:03', 0),
(153, 'notice-of-applying-for-hk-ii-2017-2018-appeal', 2, 1, '', 1, 1, '2018-07-14 21:39:00', '2019-10-06 21:39:50', '2019-10-06 21:39:50', 0),
(154, 'register-for-vnu-ept-certificate-exam-updated-speaking-topic-in-august', 2, 1, '', 1, 1, '2019-07-10 21:42:00', '2019-10-06 21:42:39', '2019-10-06 21:42:39', 0),
(155, 'list-of-students-majoring-in-physics-in-2016-official', 2, 1, '', 1, 1, '2018-08-02 21:43:00', '2019-10-06 21:44:01', '2019-10-06 21:44:01', 0),
(156, 'list-of-2017-bachelor-of-talents-classes', 2, 1, '', 1, 1, '2018-08-06 21:44:00', '2019-10-06 21:45:10', '2019-10-06 21:45:10', 0),
(157, 'announcement-about-registration-for-repayment-of-algebra-b2-course', 2, 1, '', 1, 1, '2018-08-25 21:45:00', '2019-10-06 21:46:23', '2019-10-06 21:46:23', 0),
(158, 'schedule-hk-i-2018-2019-and-register-for-the-module-updated-on-august-28-2018', 2, 1, '', 1, 1, '2018-08-28 21:47:00', '2019-10-06 21:47:39', '2019-10-06 21:47:39', 0),
(159, 'notice-of-absence-from-the-beginning-of-the-term', 2, 1, '', 1, 1, '2018-08-28 21:48:00', '2019-10-06 21:48:50', '2019-10-06 21:48:50', 0),
(160, 'notice-of-classroom-changes', 2, 1, '', 1, 1, '2017-07-15 21:50:00', '2019-10-06 21:50:40', '2019-10-06 21:50:40', 0),
(161, 'final-notice-of-opening-algebra-b2-class-tth004-for-students-who-still-owe-the-subject', 2, 1, '', 1, 1, '2018-09-22 21:52:00', '2019-10-06 21:52:45', '2019-10-06 21:52:45', 0),
(162, 'list-of-students-forced-to-leave-school-and-academic-warnings', 2, 1, '', 1, 1, '2018-09-24 21:53:00', '2019-10-06 21:54:08', '2019-10-06 21:54:08', 0),
(163, 'pictures-of-graduation-ceremony-and-scholarship-award-on-november-4-2018', 2, 1, '', 1, 1, '2018-11-04 21:57:00', '2019-10-06 21:57:39', '2019-10-06 21:57:39', 0),
(164, 'announcement-about-organization-of-specialized-industry-day-and-course-registration-for-students-in-2017', 2, 1, '', 1, 1, '2018-11-21 21:58:00', '2019-10-06 21:58:57', '2019-10-06 21:58:57', 0),
(165, 'english-learning-standards-and-standards-for-the-2018-course', 2, 1, '', 1, 1, '2018-10-15 22:00:00', '2019-10-06 22:00:35', '2019-10-06 22:00:35', 0),
(166, 'notice-of-registration-for-hk-ii-module-2018-2019', 2, 1, '', 1, 1, '2018-12-26 22:01:00', '2019-10-06 22:01:45', '2019-10-06 22:01:45', 0),
(167, 'hk-ii-timetable-for-the-school-year-2018-2019', 2, 1, '', 1, 1, '2019-01-30 22:02:00', '2019-10-06 22:03:07', '2019-10-06 22:03:07', 0),
(168, 'thong-bao-vv-nop-don-xet-tot-nghiep-va-xet-hoan-tat-chuong-trinh-dao-tao-dot-12019', 2, 1, '', 1, 1, '2019-02-25 22:03:00', '2019-10-06 22:04:30', '2019-10-06 22:04:30', 0),
(169, 'notice-of-applying-for-the-hk1-18-19-apprenticeship-application-form-regular-college-and-university', 2, 1, '', 1, 1, '2019-02-17 22:05:00', '2019-10-06 22:05:52', '2019-10-06 22:05:52', 0),
(170, 'announcement-no-3-v-v-considering-students-to-cutting-buddhism-for-learning-in-physics---course-2017-in-the-year-2018-2019', 2, 1, '', 1, 1, '2019-02-11 22:06:00', '2019-10-06 22:07:05', '2019-10-06 22:07:05', 0),
(171, 'announcement-no-4-v-v-considering-students-to-cutting-the-buddhism-of-learning-in-physics---course-in-2018-school-year-2018-2019', 2, 1, '', 1, 1, '2019-02-11 22:08:00', '2019-10-06 22:08:33', '2019-10-06 22:08:33', 0),
(172, 'notice-regarding-the-registration-of-additional-hkii-2018-2019-modules', 2, 1, '', 1, 1, '2019-02-25 22:09:00', '2019-10-06 22:09:50', '2019-10-06 22:09:50', 0),
(173, 'list-of-2017-class-practice-classes', 2, 1, '', 1, 1, '2019-03-01 22:10:00', '2019-10-06 22:11:18', '2019-10-06 22:11:18', 0),
(174, 'list-of-students-doing-graduation-thesis-seminar-and-schedule-of-hk-ii-2018-2019-updated-on-february-28-2019', 2, 1, '', 1, 1, '2019-02-28 22:12:00', '2019-10-06 22:12:50', '2019-10-06 22:12:50', 0),
(175, 'civil-activity-week---final-students-for-the-year-2018---2019', 2, 1, '', 1, 1, '2019-03-02 22:13:00', '2019-10-06 22:14:06', '2019-10-06 22:14:06', 0),
(176, 'list-of-forced-suspension-and-academic-warnings-hk2-18-19', 2, 1, '', 1, 1, '2019-03-12 22:15:00', '2019-10-06 22:16:00', '2019-10-06 22:16:00', 0),
(177, 'notice-of-payment-of-tuition-fees-hk2-2018-2019--dhcq', 2, 1, '', 1, 1, '2019-03-16 22:17:00', '2019-10-06 22:17:31', '2019-10-06 22:17:31', 0),
(178, 'notice-of-discontinuing-complex-classes-on-24052019', 2, 1, '', 1, 1, '2019-05-20 22:18:00', '2019-10-06 22:19:23', '2019-10-06 22:19:23', 0),
(179, 'notice-about-the-masters-and-doctoral-graduation-ceremonies-in-2019', 2, 1, '', 1, 1, '2019-05-29 22:20:00', '2019-10-06 22:20:41', '2019-10-06 22:20:41', 0),
(180, 'notice-of-registration-for-the-2017-course', 2, 1, '', 1, 1, '2019-08-15 22:23:00', '2019-10-06 22:23:30', '2019-10-06 22:23:30', 0),
(181, 'announcement-to-update-specialized-information-for-2015-and-2016-courses', 2, 1, '', 1, 1, '2019-08-15 22:24:00', '2019-10-06 22:25:17', '2019-10-06 22:25:17', 0),
(182, 'notice-of-submission-to-the-general-meeting-of-shareholders-in-september-2019', 2, 1, '', 1, 1, '2019-08-15 22:26:00', '2019-10-06 22:26:25', '2019-10-06 22:26:25', 0),
(183, 'new-recruitment-information-vinh-nam-joint-stock-company', 5, 1, '', 1, 1, '2019-05-14 08:50:00', '2019-10-07 22:31:57', '2019-10-09 21:46:22', 0),
(184, 'ampere-computing-recruitment-introduction', 5, 1, '', 1, 1, '2019-05-15 09:11:00', '2019-10-07 22:33:40', '2019-10-09 21:45:54', 0),
(185, 'recruitment-information-from-ryomo-vietnam-solutions-co-ltd', 5, 1, '', 1, 1, '2019-05-16 10:50:00', '2019-10-07 22:36:29', '2019-10-09 21:45:43', 0),
(186, 'recruitment-information-from-hong-anh-education-equipment-company', 5, 1, '', 1, 1, '2019-06-10 10:00:00', '2019-10-07 22:38:42', '2019-10-07 22:38:42', 0),
(187, 'career-postdoc-of-university-of-cardiff-uk', 5, 1, '', 1, 1, '2019-06-17 08:00:00', '2019-10-07 22:42:22', '2019-10-09 21:45:19', 0),
(188, 'renesas-engineer-recruitment-information', 5, 1, '', 1, 1, '2019-06-24 09:50:00', '2019-10-07 22:45:54', '2019-10-07 22:45:54', 0),
(189, 'recruitment-information-of-vinh-nam-joint-stock-company-11072019', 5, 1, '', 1, 1, '2019-07-11 09:00:00', '2019-10-07 22:48:16', '2019-10-07 22:48:16', 0),
(190, 'sylvan-learning-vietnam-teacher-and-teacher-information', 5, 1, '', 1, 1, '2019-07-15 12:00:00', '2019-10-07 22:53:20', '2019-10-07 22:53:52', 0),
(191, 'the-international-workshop-on-the-development-trend-in-microelectronic-devices-and-technology', 3, 1, '', 1, 1, '2013-10-10 11:20:00', '2019-10-10 11:20:20', '2019-10-10 11:20:20', 0),
(192, 'announcement-protection-of-doctoral-thesis-level-at-phd-level-le-cong-hao-2', 3, 1, '', 1, 1, '2013-06-12 11:23:00', '2019-10-10 11:23:51', '2019-10-10 11:23:51', 0),
(193, 'notice-preserving-doctoral-thesis-at-phd-level-le-cong-hao', 3, 1, '', 1, 1, '2013-06-13 11:29:00', '2019-10-10 11:29:27', '2019-10-10 11:29:27', 0),
(194, 'announcement-vllt-seminar-department', 3, 1, '', 1, 1, '2013-05-22 11:34:00', '2019-10-10 11:35:01', '2019-10-10 11:35:01', 0),
(195, 'notice-seminar-of-ts-le-bao-tran-and-ts-nguyen-ha-hung-chuong', 3, 1, '', 1, 1, '2013-06-14 11:36:00', '2019-10-10 11:36:18', '2019-10-10 11:36:18', 0),
(196, 'national-conference-on-engineering-and-applied-physics', 3, 1, '', 1, 1, '2019-10-05 11:37:00', '2019-10-10 11:37:46', '2019-10-10 11:37:46', 0),
(197, 'announcement-of-selection-of-olympic-physics-team-for-students', 3, 1, '', 1, 1, '2017-04-02 11:39:00', '2019-10-10 11:39:51', '2019-10-10 11:39:51', 0),
(198, 'doctoral-thesis-protection-schedule-of-phd-student-nguyen-chi-nhan-and-trinh-hoa-lang', 3, 1, '', 1, 1, '2013-12-10 11:40:00', '2019-10-10 11:40:56', '2019-10-10 11:40:56', 0),
(199, 'seminar-announcement---wednesday-september-4-2013', 3, 1, '', 1, 1, '2013-09-02 11:41:00', '2019-10-10 11:41:52', '2019-10-10 11:41:52', 0),
(200, 'tb-doctoral-thesis-defense-session-of-phd-student-tran-hoang-cao-son', 1, 1, '', 1, 1, '2013-11-10 11:42:00', '2019-10-10 11:43:05', '2019-10-10 11:43:05', 0),
(201, 'announcement-august-10-attend-a-meeting-and-talk-with-american-nobel-professor-of-physics-david-jonathan-gross', 3, 1, '', 1, 1, '2013-08-10 11:45:00', '2019-10-10 11:46:18', '2019-10-10 11:46:18', 0),
(202, 'announcing-5-scholarship-programs-of-taiwan-china-and-belgium', 3, 1, '', 1, 1, '2013-12-23 11:47:00', '2019-10-10 11:47:57', '2019-10-10 11:47:57', 0),
(203, 'invitation-to-attend-the-doctoral-thesis-defense-at-ho-chi-minh-citys-doctoral-thesis', 3, 1, '', 1, 1, '2014-06-24 11:51:00', '2019-10-10 11:51:31', '2019-10-10 11:51:31', 0),
(204, 'prof-seminar-ts-vo-van-hoang-on-some-soft-skills-in-scientific-research-and-introduction-to-new-disciplines', 3, 1, '', 1, 1, '2014-06-16 11:56:00', '2019-10-10 11:56:16', '2019-10-10 11:56:16', 0),
(205, 'information-about-korean-scholarships', 3, 1, '', 1, 1, '2014-06-22 11:57:00', '2019-10-10 11:57:51', '2019-10-10 11:57:51', 0),
(206, 'specialized-physics-class-in-particle-physics-astronomy-cosmology', 3, 1, '', 1, 1, '2014-07-17 12:08:00', '2019-10-10 12:08:38', '2019-10-10 12:08:38', 0),
(207, 'notice-mext-scholarship-introduction', 4, 1, '', 1, 1, '2013-05-10 08:50:00', '2019-10-10 20:33:19', '2019-10-10 20:33:19', 0),
(208, 'registered-member-of-ho-chi-minh-city-physics-association-hcm', 4, 1, '', 1, 1, '2013-08-14 09:50:00', '2019-10-10 20:34:45', '2019-10-10 20:34:45', 0),
(209, 'acknowledgments-from-the-organization-committee-of-the-fine-trade-day-2742014', 4, 1, '', 1, 1, '2014-04-27 09:00:00', '2019-10-10 20:36:21', '2019-10-10 20:36:21', 0),
(210, 'decision-on-appointing-department-heads', 4, 1, '', 1, 1, '2014-07-01 10:00:00', '2019-10-10 20:39:30', '2019-10-10 20:39:30', 0),
(211, 'congratulations-to-the-womens-soccer-team-of-the-faculty-that-won-the-2014-championship', 4, 1, '', 1, 1, '2014-09-15 08:00:00', '2019-10-10 20:51:48', '2019-10-10 20:51:48', 0),
(212, 'seminar-on-career-opportunities-in-semiconductors-amcc-vn', 3, 1, '', 1, 1, '2014-05-16 15:52:00', '2019-10-14 15:52:33', '2019-10-14 15:52:33', 0),
(213, 'invitation-for-academic-seminar-of-professor-fumio-hasebe', 3, 1, '', 1, 1, '2014-11-11 15:53:00', '2019-10-14 15:54:00', '2019-10-14 15:54:00', 0),
(214, 'scientific-seminar-by-dr-le-thuy-thanh-giang', 3, 1, '', 1, 1, '2014-10-14 15:54:00', '2019-10-14 15:55:06', '2019-10-14 15:55:06', 0),
(215, 'invitation-to-attend-siminar-science-by-prof-tran-vinh-hung', 3, 1, '', 1, 1, '2014-10-24 15:57:00', '2019-10-14 15:57:25', '2019-10-14 15:57:25', 0),
(216, 'notice-of-seagull-2015-program', 3, 1, '', 1, 1, '2014-10-25 15:59:00', '2019-10-14 15:59:41', '2019-10-14 15:59:41', 0),
(217, 'attend-ictp-physics-without-frontiers-class', 3, 1, '', 1, 1, '2014-10-30 16:01:00', '2019-10-14 16:01:36', '2019-10-14 16:01:36', 0),
(218, 'invite-to-the-talk-of-professor-friedman-nobel-physics', 3, 1, '', 1, 1, '2015-05-16 16:02:00', '2019-10-14 16:03:18', '2019-10-14 16:03:18', 0),
(219, 'seminar-announcement-on-seismicism-for-oil-and-gas-and-tsunami-earthquakes', 3, 1, '', 1, 1, '2015-03-14 16:07:00', '2019-10-14 16:07:27', '2019-10-14 16:07:27', 0),
(220, 'announcement-of-the-2015-competition-olympic-physics-team-selection', 3, 1, '', 1, 1, '2015-01-20 16:08:00', '2019-10-14 16:08:45', '2019-10-14 16:08:45', 0),
(221, 'list-of-9-team-in-the-bigbang-2015-single-round', 3, 1, '', 1, 1, '2015-03-25 16:10:00', '2019-10-14 16:11:18', '2019-10-14 16:11:18', 0),
(222, 'invite-to-attend-the-doctoral-thesis-defense-sessions-of-phd-students-tran-hoang-cao-son-and-ho-minh-trung', 3, 1, '', 1, 1, '2014-12-09 16:12:00', '2019-10-14 16:12:38', '2019-10-14 16:12:38', 0),
(223, 'invitation-to-the-scientific-seminar-of-professor-philippe-quentin', 3, 1, '', 1, 1, '2016-12-08 16:13:00', '2019-10-14 16:13:37', '2019-10-14 16:13:37', 0),
(224, 'science-research-student-award---2016', 3, 1, '', 1, 1, '2016-08-15 16:14:00', '2019-10-14 16:14:51', '2019-10-14 16:14:51', 0),
(225, 'invitation-to-the-scientific-seminar-of-dr-phan-thi-minh-diep', 3, 1, '', 1, 1, '2015-11-15 16:15:00', '2019-10-14 16:15:43', '2019-10-14 16:15:43', 0),
(226, 'information-about-international-class-specializing-in-real-time-systems-the-international-real-time-school-2016', 3, 1, '', 1, 1, '2016-10-16 16:17:00', '2019-10-14 16:17:52', '2019-10-14 16:17:52', 0),
(231, 'invitation-to-the-scientific-seminar-of-dr-le-duc-ninh', 3, 1, '', 1, 1, '2017-01-07 16:30:00', '2019-10-14 16:31:15', '2019-10-14 16:31:15', 0),
(232, 'invitation-to-the-seminar-of-prof-hajime-shimizu', 3, 1, '', 1, 1, '2016-12-18 17:07:00', '2019-10-14 17:07:38', '2019-10-14 17:07:38', 0),
(233, 'invitation-join-a-scientific-cooperation-discussion-with-professors-from-national-tsing-hua-university-tsinghua-university-in-taiwan', 3, 1, '', 1, 1, '2016-12-01 17:12:00', '2019-10-14 17:13:00', '2019-10-14 17:13:00', 0),
(234, 'change-scientific-seminar-schedule-of-prof-hajime-shimizu', 3, 1, '', 1, 1, '2016-12-29 17:14:00', '2019-10-14 17:14:43', '2019-10-14 17:14:43', 0),
(235, 'invitation-to-the-scientific-seminar-of-department-of-nuclear-physics-engineering', 3, 1, '', 1, 1, '2017-01-02 17:16:00', '2019-10-14 17:17:12', '2019-10-14 17:17:12', 0),
(236, 'notice-of-medical-physics-workshop', 3, 1, '', 1, 1, '2017-10-01 17:21:00', '2019-10-14 17:22:04', '2019-10-14 17:22:04', 0),
(237, 'announcement-of-recruitment-of-graduate-students-working-in-french-research-institutions', 3, 1, '', 1, 1, '2017-04-10 17:26:00', '2019-10-14 17:27:09', '2019-10-14 17:27:09', 0),
(238, 'sign-up-for-a-summer-course-in-atomic-molecular-and-optics-physics-amo-2017', 3, 1, '', 1, 1, '2017-08-08 17:29:00', '2019-10-14 17:29:42', '2019-10-14 17:29:42', 0),
(239, 'invitation-to-attend-the-seminar-on-quantitative-finance-of-john-von-neumann-institute-vnu-hcmc', 3, 1, '', 1, 1, '2017-06-03 17:31:00', '2019-10-14 17:32:13', '2019-10-14 17:32:13', 0),
(240, 'invitation-to-attend-seminar-on-medical-physics-of-professor-tsi-chian-chao-and-shu-ju-tu-chang-gung-university-taiwan', 3, 1, '', 1, 1, '2017-01-31 17:38:00', '2019-10-14 17:38:32', '2019-10-14 17:38:32', 0),
(241, 'invitation-to-the-3rd-national-medical-physics-conference', 3, 1, '', 1, 1, '2018-07-08 17:42:00', '2019-10-14 17:42:48', '2019-10-14 17:42:48', 0),
(242, 'invitation-for-participation-in-the-11th-science-science-conference-09-10112018', 3, 1, '', 1, 1, '2018-09-03 17:43:00', '2019-10-14 17:44:14', '2019-10-14 17:44:14', 0),
(243, 'seminar-on-the-topic-science-at-the-frontier-by-gs-yuan-tseh-lee', 3, 1, '', 1, 1, '2019-06-08 17:48:00', '2019-10-14 17:48:56', '2019-10-14 17:48:56', 0),
(244, 'seminar-notice-on-physical-physical---medical-technique', 3, 1, '', 1, 1, '2019-07-01 17:49:00', '2019-10-14 17:50:11', '2019-10-14 17:50:11', 0),
(245, 'seminar-notice-on-the-topic-of-nuclear-medicine---physical-and-material', 3, 1, '', 1, 1, '2019-10-01 17:51:00', '2019-10-14 17:51:12', '2019-10-14 17:51:12', 0),
(246, 'xzx', 9, 1, '', 4, 2, '2019-10-19 16:44:00', '2019-10-19 16:44:52', '2019-10-19 16:44:52', 0),
(247, 'vlth-scholarship-2018-notice-of-document-review', 7, 1, '', 4, 2, '2018-10-01 12:46:00', '2019-10-22 12:46:55', '2019-10-22 12:46:55', 0),
(248, 'welcome-to-welcome-the-day-of-vietnamese-teachers-with-the-family-physics-physics-and-give-21-scholarships-from-the-vlth-support-fund', 7, 1, '', 4, 2, '2018-11-19 12:55:00', '2019-10-22 12:56:11', '2019-10-22 12:56:11', 0),
(249, 'k15-notice-of-submission-for-thesis-and-seminar', 7, 1, '', 4, 2, '2019-05-25 12:57:00', '2019-10-22 12:57:31', '2019-10-22 12:57:31', 0),
(250, 'vlth-scholarship-2019-notice-of-document-review', 7, 1, '', 4, 2, '2019-09-17 12:58:00', '2019-10-22 12:58:40', '2019-10-22 12:58:40', 0),
(251, 'k16---summer-internship-2019', 31, 1, '/uploads/vat-ly-tin-hoc/hinh%201.jpg', 4, 2, '2019-10-20 13:03:00', '2019-10-22 13:03:51', '2019-11-26 17:47:53', 0),
(252, 'notice-seminar', 8, 1, '', 4, 2, '2013-05-11 13:06:00', '2019-10-22 13:06:40', '2019-10-22 13:06:40', 0),
(253, 'ho-chi-minh-city-physics-conference', 8, 1, '', 4, 2, '2013-06-12 13:07:00', '2019-10-22 13:07:44', '2019-10-22 13:07:44', 0),
(254, 'national-instrument-company-workshop-ni', 8, 1, '', 4, 2, '2014-03-07 13:08:00', '2019-10-22 13:09:03', '2019-10-22 13:09:03', 0),
(255, 'seminar-of-career-opportunities-in-semiconductor-field', 8, 1, '', 4, 2, '2014-05-11 13:10:00', '2019-10-22 13:10:37', '2019-10-22 13:10:37', 0),
(256, 'gioi-thieu-khoa', 11, 1, '', 1, 1, '2019-11-20 14:29:00', '2019-11-20 14:29:48', '2019-11-26 17:42:27', 0),
(257, 'ki-niem-ngay-nha-giao-viet-nam-2019', 2, 1, '/uploads/vat-ly-tin-hoc/H1.jpg', 1, 1, '2019-11-17 17:57:00', '2019-11-26 17:57:35', '2019-11-26 17:57:53', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `attribute_id` (`cat_id`),
  ADD KEY `status` (`status`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
