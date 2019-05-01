-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 01, 2019 lúc 03:43 AM
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
-- Cơ sở dữ liệu: `phys_db`
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
  `author` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `status`, `author`, `created_at`, `updated_at`) VALUES
(1, 'Tin giáo vụ', 'tin-giao-vu', 'Tin giáo vụ', 1, 1, '2019-03-29 00:00:00', '2019-03-29 00:00:00'),
(2, 'Tin NCKH - Serminar', 'tin-nckh-serminar', 'Tin NCKH - Serminar', 1, 1, '2019-03-29 00:00:00', '2019-03-29 00:00:00'),
(3, 'Tin CB - VC Khoa', 'tin-cb-vc-khoa', 'Tin CB - VC Khoa', 1, 1, '2019-03-29 00:00:00', '2019-03-29 00:00:00'),
(4, 'Tin Tuyển Dụng', 'tin-tuyen-dung', 'Tin Tuyển Dụng', 1, 1, '2019-03-29 00:00:00', '2019-03-29 00:00:00');

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
(1, 'VLKT', 'Khoa Vật Lý - Vật Lý Kỹ Thuật', '/', NULL, NULL, 0, 1),
(2, 'VLTH', 'Vật Lý Tin Học', 'vat-ly-tin-hoc', NULL, NULL, 0, 1),
(3, 'VLLT', 'Vật Lý Lý Thuyết', 'vat-ly-ly-thuyet', NULL, NULL, 0, 1),
(4, 'VLHN', 'Vật Lý Hạt Nhân - KTHN', 'vat-ly-hat-nhan', NULL, NULL, 0, 1),
(5, 'VLCR', 'Vật Lý Chất Rắn', 'vat-ly-chat-ran', NULL, NULL, 0, 1),
(6, 'VLUD', 'Vật Lý Ứng Dụng', 'vat-ly-ung-dung', NULL, NULL, 0, 1),
(7, 'VLDT', 'Vật Lý Điện Tử', 'vat-ly-dien-tu', NULL, NULL, 0, 1),
(8, 'VLDC', 'Vật Lý Địa Cầu', 'vat-ly-dia-cau', NULL, NULL, 0, 1),
(9, 'VLHD', 'Vật Lý Hải Dương', 'vat-ly-hai-duong', NULL, NULL, 0, 1);

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

--
-- Đang đổ dữ liệu cho bảng `log_history`
--

INSERT INTO `log_history` (`id`, `user_id`, `page`, `type`, `name`, `detail`, `ip`, `device`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 'Đã thay đổi mật khẩu', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/78.0.136 Chrome/72.0.3626.136 Safari/537.36', '2019-04-30 22:42:50', NULL);

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
  `except` text COLLATE utf8_unicode_ci NOT NULL,
  `author` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `attribute_id`, `content`, `status`, `except`, `author`, `dept_id`, `created_at`, `updated_at`) VALUES
(1, 'Giới thiệu', 'gioi-thieu', 1, '<p style=\"text-align: justify\">\r\n                            Lịch sử phát triển của Khoa Vật lý-Vật lý Kỹ thuật gắn liền với lịch sử phát triển của Trường\r\n                            Đại học Khoa học Tự nhiên TP. Hồ Chí Minh. Hiện Khoa đang giữ nhiệm vụ đào tạo và nghiên cứu\r\n                            khoa học ở một số lãnh vực về Vật lý và các ứng dụng liên quan.\r\n                        </p>\r\n\r\n                        <p style=\"text-align: justify\">\r\n                            Khoa có 8 Bộ môn: Vật lý Chất rắn, Vật lý Điện tử, Vật lý Hạt nhân, Vật lý Lý thuyết, Vật lý Tin\r\n                            học, Vật lý Địa cầu, Vật lý Ứng dụng, và bộ môn Hải dương, khí tượng và Thủy văn.\r\n                        </p>\r\n                        \r\n                        <p style=\"text-align: justify\">\r\n                            Khoa có hơn 80 cán bộ giảng dạy, trong đó có 37 cán bộ có trình độ Tiến sĩ (1 giáo sư, 12 PGS),\r\n                            43 cán bộ có trình đô Thạc sĩ.\r\n                            Có 14 phòng thí nghiệm, trong đó có 5 phòng thí nghiệm giảng dạy vật lý đại cương cho sinh viên\r\n                            của Trường Đại học Khoa học Tự nhiên và các Trường Đại học khác; 1 phòng máy tính phục vụ giảng\r\n                            dạy cho sinh viên của Khoa và 9 phòng thí nghiệm chuyên ngành vừa phục vụ giảng dạy vừa phục vụ\r\n                            nghiên cứu khoa học.\r\n                        </p>\r\n\r\n\r\n                        <p style=\"text-align: justify\">\r\n                            Khoa đào tạo ba bậc: Cử nhân, Thạc sĩ và Tiến sĩ. Hiện có gần 1000 sinh viên bậc đại học, 100\r\n                            học viên cao học và 15 nghiên cứu sinh đang theo học. Tính trung bình cho mỗi năm có 200 sinh\r\n                            viên tốt nghiệp bậc đại học, 30 học viên cao học tốt nghiệp và 3 nghiên cứu sinh tốt nghiệp tiến\r\n                            sĩ.\r\n                        </p>\r\n\r\n                        <p style=\"text-align: justify\">\r\n                            Hầu hết các cán bộ đề tham gia nghiên cứu khoa học trong các chương trình nghiên cứu khoa học cơ\r\n                            bản, cấp Bộ và cấp Trường và của các cơ quan khác. Có nhiều bài báo đăng trong các tạp chí có uy\r\n                            tín trong và ngoài nước.\r\n                        </p>\r\n\r\n                        <p style=\"text-align: justify\">\r\n                            Khoa đã ký hợp tác chính thức với Trung tâm quốc tế về Vật lý lý thuyết (ICTP, Ý) và Trường Sau\r\n                            Đại học Osaka (Nhật) và có các liên hệ tốt với các Đại học Liège (Bĩ), Đại học Swinburne (Trung\r\n                            tâm Quang học nguyên tử và phổ siêu nhanh (CAOUS), Úc), Đại học Saskatchewan (Canada), Đại học\r\n                            Chungbuk, Đại học Sungkyunkwan (Đại Hàn). Khoa có các mối quan hệ chặt chẽ với các Viện, Trung\r\n                            tâm nghiên cứu Khoa học và Công ty sản xuất trong nước. Hiện có 21 cán bộ giảng dạy trẻ đang học\r\n                            tập và nghiên cứu tại các nước Pháp, Úc, Nhật, Đại Hàn...\r\n                        </p>', 1, 'Khoa Vật lý-Vật lý Kỹ', 1, 1, '2019-03-23 20:16:25', '2019-03-23 20:16:25'),
(2, 'Tổ chức - Nhân sự', 'to-chuc-nhan-su', 2, NULL, 1, 'Tóm tắt', 1, 1, '2019-03-23 20:16:42', '2019-04-30 21:30:42'),
(3, 'Hợp tác đào tạo', 'hop-tac-dao-tao', NULL, '                    <div>\r\n                        <h2>\r\n                            <strong><span style=\"color:#ff0000; text-transform: uppercase\">Vật Lý Lý\r\n                                    Thuyết</span></strong></h2>\r\n                        <h3>\r\n                            <strong><span style=\"font-size: 24px; color: #007bff\">A. &nbsp; &nbsp;Hướng\r\n                                    HEP:</span></strong></h3>\r\n                        <h4 style=\"color: black; font-size: 16px\">\r\n                            1. &nbsp; &nbsp;Precision calculations for the LHC in the Standard Model and its\r\n                            extensions</h4>\r\n                        <ul>\r\n                            <li>TS. Đỗ Hoàng Sơn, hợp tác với LAPTH, CNRS, CH Pháp</li>\r\n                            <li>Hiện có 3 sv CH, và 1 nghiên cứu sinh (phía VN) tham gia dự án.</li>\r\n                            <li>Dự án hợp tác này là một phần của chương trình nghiên cứu quốc tế về tìm\r\n                                kiếm Higgs boson và cơ chế phá vỡ đối xứng tự phát trong vật lý hạt cơ bản. Nghiên cứa\r\n                                này có liên hệ mật thiết với các thực nghiệm tại LHC. Quá trình sinh Higgs kèm các tổ\r\n                                hợp quarks nặng (bottom hay top quarks) là đối tượgn nghiên cứu chính của dự án hợp tác\r\n                                này.</li>\r\n                        </ul>\r\n                        <h4 style=\"color: black; font-size: 16px\">\r\n                            2. &nbsp; &nbsp;ATLAS-VN project</h4>\r\n                        <ul>\r\n                            <li>TS. Đỗ Hoàng Sơn, hợp tác với LAPP, IN2P3, CNRS, CH Pháp</li>\r\n                            <li>Mục tiêu của dự án là đưa VN trở thành thành viên chính thức của dự án\r\n                                    nghiên cứu quốc tế về năng lượng cao tại LHC, CERN.</li>\r\n                            <li>Dự án đang trong giai đoạn đầu, đào tạo nguồn nhân lực. Hiện đang đào tạo\r\n                                    3 NCS tại Pháp (trong đó 1 từ bộ môn), &nbsp;2 sv CH tại Pháp. Bắt đầu từ năm 2008, hàng\r\n                                    năm dự án tổ chức lớp học mùa đông LHCS cho sv toàn quốc.</li>\r\n                        </ul>\r\n                        <h4 style=\"color: black; font-size: 16px\">\r\n                            3. &nbsp; &nbsp;XLOOPS-GiNaC</h4>\r\n                        <ul>\r\n                            <li>TS. Đỗ Hoàng Sơn, hợp tác với LAPTH, IN2P3, CNRS, CH Pháp và ĐH Johannes\r\n                                    Gutenberg, Mainz, CH LB Đức</li>\r\n                            <li>Phát triển một phương pháp và bộ công cụ mới (XLOOPS-GiNaC) cho phép tính\r\n                                    toán tự động các bổ chính một vòng vào các quá trình tán xạ trong máy gia tốc hạt tại\r\n                                    LHC.</li>\r\n                        </ul>\r\n\r\n                        <h3>\r\n                            <strong><span style=\"font-size: 24px; color: #007bff\">B. &nbsp; &nbsp;Hướng\r\n                                    Bio-Physics:</span></strong></h3>\r\n                        <h4 style=\"color: black; font-size: 16px\">\r\n                            1. &nbsp; &nbsp;Protein folding:</h4>\r\n                        <ul>\r\n                            <li>PGS. TS. Hoàng Dũng, hợp tác với ĐH Warsaw, Poland</li>\r\n                            <li>Hướng nghiên cứu sự ảnh hưởng của cuộn của các protein tới một số bệnh\r\n                                    như Alzheimer, Parkingson</li>\r\n                        </ul>\r\n                        <h4 style=\"color: black; font-size: 16px\">\r\n                            2. &nbsp; &nbsp;Drug design:</h4>\r\n                        <ul>\r\n                            <li>PGS. TS. Hoàng Dũng, hợp tác với trung tâm nghiên cứu SISSA, Italia</li>\r\n                            <li>Nội dung:</li>\r\n                            <li>Hướng nghiên cứu cơ chế ức chế sự sinh sản của virus HIV trong tế bào\r\n                                    người từ đó điều chế thuốc chữa AIDS.</li>\r\n                            <li>Hướng nghiên cứu cơ chế nhận biết mùi của cơ quan khứu giác ở mức độ phân\r\n                                    tử.</li>\r\n                            <li>Hiện nhóm có 2 sinh viên đang làm NCS tại SISSA, Italia. Nhóm cũng tổ\r\n                                    chức các lớp học về BIO-Physics hàng năm tại HCMUNS.</li>\r\n                        </ul>\r\n\r\n                        <h2>\r\n                            <span style=\"color:#ff0000; text-transform: uppercase\">Vật Lý Hạt Nhân</span></h2>\r\n                        <h3>\r\n                            - &nbsp; &nbsp;Hợp tác trong nước:</h3>\r\n                        <div>\r\n                            (1) Viện năng lượng nguyên tử Việt Nam, VAEC,</div>\r\n                        <div>\r\n                            (2) Viện khoa học và kỹ thuật hạt nhân Hà Nội,</div>\r\n                        <div>\r\n                            (3) Trung tâm hạt nhân Tp.HCM,</div>\r\n                        <div>\r\n                            (4) Trung tâm nghiên cứu và triển khai công nghệ bức xạ Tp.HCM,</div>\r\n                        <div>\r\n                            (5) Trung tâm Ung bướu Tp.HCM,</div>\r\n                        <div>\r\n                            (6) Viện nghiên cứu hạt nhân Đà lạt,</div>\r\n                        <div>\r\n                            (7) Phân Viện Vật lý Y Sinh Tp.HCM,</div>\r\n                        <div>\r\n                            (8) Bệnh viện Chợ Rẫy,</div>\r\n                        <div>\r\n                            &nbsp;</div>\r\n                        <h3>\r\n                            - &nbsp; &nbsp;Hợp tác nước ngoài:</h3>\r\n                        <div>\r\n                            Đã tạo dựng được mối quan hệ, cũng như hợp tác khoa học với các cơ quan quốc tế sau:\r\n                        </div>\r\n                        <div>\r\n                            (1) MEXT/NRSA - Japan,</div>\r\n                        <div>\r\n                            (2) Korean Nuclear physics Society - Korea,</div>\r\n                        <div>\r\n                            (3) Saskatchewan University – Canada,</div>\r\n                        <div>\r\n                            (4) Tokai University – Japan,</div>\r\n                        <div>\r\n                            (5) Swinburne University – Australia,</div>\r\n                        <div>\r\n                            (6) LIA (Associated International Lab.), France Vietnam Particle Physics Lab.,</div>\r\n                        <div>\r\n                            (7) Osaka University – Japan,</div>\r\n                        <div>\r\n                            (8) ICTP (International Ceter for Theoretical Physics) – Italy.</div>\r\n                        <br/>\r\n                        <h2>\r\n                            <span style=\"color:#ff0000; text-transform: uppercase\">Vật Lý Ứng Dụng</span></h2>\r\n                        <div>\r\n                            Bộ môn hợp tác với một số cơ quan:</div>\r\n                        <div>\r\n                            1. Viện Vật Lý Thành phố Hồ Chí Minh</div>\r\n                        <div>\r\n                            2. Phòng thí nghiệm nano - Đại học Quốc Gia Thành phố Hồ Chí Minh</div>\r\n                        <div>\r\n                            3. Liên Đoàn Địa Chất 6 - Tp.HCM</div>\r\n                        <div>\r\n                            Và các trường Đại học trong và ngoài nước.</div>\r\n                        <div>\r\n                            &nbsp;</div>\r\n                        <h2>\r\n                            <span style=\"color:#ff0000; text-transform: uppercase\">Vật Lý Chất Rắn</span></h2>\r\n                        <h3>- &nbsp; &nbsp;Hợp tác trong ngoài:</h3>\r\n                        <div>\r\n                            Khoa Công nghệ - Đại học Công nghệ - ĐHQG Hà nội</div>\r\n                        <div>\r\n                            Phòng Quang học – Ngọc học – Viện Khoa học VN</div>\r\n                        <h3>- &nbsp; &nbsp;Hợp tác nước ngoài:</h3>\r\n                        <div>\r\n                            Viện Vật lý – Viện Khoa học Prague – Công hòa Czech</div>\r\n                        <div>\r\n                            Nano Lab – Đại học kỹ thuật Prague (CTU) – Cộng hòa Czech</div>\r\n                        <div>\r\n                            Khoa Vật Lý – Đại học Moncton – Canada</div>\r\n                        <div>\r\n                            Đang tiến hành xây dựng hợp tác với Khoa Vật lý – Đại học LaTrobe – Úc, khoa Vật lý –\r\n                            Đại học Ulsan – Hàn quốc</div>\r\n                        <div>\r\n                            &nbsp;</div>\r\n                        <h2>\r\n                            <span style=\"color:#ff0000; text-transform: uppercase\">Vật Lý Địa Cầu</span></h2>\r\n                        <div>\r\n                            -. Phân viện Vật lý - Trung tâm Khoa học và Công nghệ Quốc gia</div>\r\n                        <div>\r\n                            - &nbsp;Phân viện Địa lý - Trung tâm Khoa học và Công nghệ Quốc gia</div>\r\n                        <div>\r\n                            -. Trung tâm Địa vật lý – Liên đoàn Bản đồ Miền nam</div>\r\n                        <div>\r\n                            -. Trung tâm Kỹ thuật Hạt nhân TP. Hồ Chí Minh</div>\r\n                        <div>\r\n                            -. Liên đoàn Địa chất 8</div>\r\n                        <div>\r\n                            -. Sở Công nghệ Môi trường TP.HCM và các tỉnh bạn</div>\r\n                        <div>\r\n                            -. Viện Nghiên cứu Dầu khí – Tổng cục Dầu khí</div>\r\n                        <div>\r\n                            -. Trường ĐH. AGH, Balan</div>\r\n                        <div>\r\n                            &nbsp;</div>\r\n                        <h2>\r\n                            <span style=\"color:#ff0000; text-transform: uppercase\">Vật Lý Tin Học</span></h2>\r\n                        <div>\r\n                            Bộ môn có hợp tác đào tạo với một số đại học nước ngoài như:</div>\r\n                        <div>\r\n                            - &nbsp; &nbsp;Khoa Kỹ sư Điện của Đại học Saskatchewan (Canada) (http://www.usask.ca/ )\r\n                        </div>\r\n                        <div>\r\n                            - &nbsp; &nbsp;Khoa Kỹ sư Điện của Đại học Alberta (Canada) (http://www.ualberta.ca/ )\r\n                        </div>\r\n                        <div>\r\n                            - &nbsp; &nbsp;Khoa Kỹ sư Điện và Hệ thống máy tính của Đại học Osaka Prefecture (Nhật)\r\n                            (http://www.pref.osaka.jp/en/ )</div>\r\n                        <div>\r\n                            - &nbsp; &nbsp;Khoa Kỹ sư Điện của Đại học Ajou (Hàn Quốc) (http://\r\n                            www.ajou.ac.kr/english/ )</div>\r\n                        <div>\r\n                            &nbsp;</div>\r\n                        <h2>\r\n                            <span style=\"color:#ff0000; text-transform: uppercase\">Hải Dương Học - Khí Tượng và Thủy\r\n                                Văn</span></h2>\r\n                        <div>\r\n                            Bộ môn có hợp tác đào tạo với một số đại học trong và ngoài nước như sau:</div>\r\n                        <div>\r\n                            &nbsp;</div>\r\n                        <div>\r\n                            Trong nước: ngoài các trường thành viên ĐHQG và Viện KHCN Tính toán Tp. HCM, bộ môn có\r\n                            liên hệ và cộng tác chặt chẽ với các cơ quan nghiên cứu về Khí tượng, Thủy văn, Hải\r\n                            dương học, &nbsp;để phối hợp nghiên cứu và gửi sinh viên đại học và sau đại học của\r\n                            ngành đến thực tập.</div>\r\n                        <div>\r\n                            · Trường ĐHKHTN-ĐHQG HN; Trường Cao đẳng Tài nguyên &amp; Môi trường, Trường Đại học Nha\r\n                            Trang</div>\r\n                        <div>\r\n                            · Đài Khí tượng Thủy văn Khu vực Nam Bộ, Phân Viện Khí tượng Thủy văn và Môi trường phía\r\n                            Nam, Phân viện Vật lý Tp. HCM, Viện Cơ học Ứng dụng Tp. HCM, Viện Cơ và TT Tư Vấn Động\r\n                            Lực Môi Trường Biển - HN, TT Nghiên Cứu Ứng Dụng Công Nghệ Mới, Viện Khoa học Khí Tượng\r\n                            Thủy Văn và Môi trường, HN, Viện Hải Dương Học, Viện Nghiên cứu Thủy lợi miền Nam …\r\n                        </div>\r\n                        <div>\r\n                            · TT Dự Báo KTTV tỉnh An Giang, các Sở Khoa học Công nghệ địa phương như Tp. HCM, Bình\r\n                            Thuận, Bến Tre</div>\r\n                        <div>\r\n                            Ngoài nước:</div>\r\n                        <div>\r\n                            · Trường đại học Kiel, Đức;</div>\r\n                        <div>\r\n                            · TT Khí tượng Hoàng Gia, Bỉ;</div>\r\n                        <div>\r\n                            · TT Thời tiết Oklahoma thuộc Trường đại học Oklahoma, Mỹ;</div>\r\n                        <div>\r\n                            · Khoa Khoa học khí tượng, Trường đại học Yonsei, Hàn quốc;</div>\r\n                        <div>\r\n                            · Viện Hải dương học Sopot thuộc Viện Hàn lâm Khoa học Ba Lan; Viện Khí tượng Đan Mạch;\r\n                        </div>\r\n                        <div>\r\n                            · Viện Quốc gia về quản lý đất đai và cơ sở hạ tầng thuộc bộ Cơ sở hạ tầng, Đất đai và\r\n                            Giao thông của Nhật Bản …</div>\r\n                        <div>\r\n                            &nbsp;</div>\r\n                        <p>\r\n                            &nbsp;</p>\r\n                    </div>', 1, '', 1, 1, '2019-03-23 20:16:42', '2019-03-23 20:16:42'),
(4, 'Nghiên cứu khoa học', 'nghien-cuu-khoa-hoc', NULL, NULL, 1, '', 1, 1, '2019-03-23 20:16:42', '2019-03-23 20:16:42'),
(5, 'Phòng thi nghiệm', 'phong-thi-nghiem', NULL, NULL, 1, '', 1, 1, '2019-03-23 20:16:42', '2019-03-23 20:16:42'),
(6, 'Sản phẩm nghiên cứu', 'san-pham-nghien-cuu', NULL, NULL, 1, '', 1, 1, '2019-03-23 20:16:42', '2019-03-23 20:16:42'),
(7, 'Đoàn hội', 'doan-hoi', NULL, NULL, 1, '', 1, 1, '2019-03-23 20:16:42', '2019-03-23 20:16:42'),
(9, 'Liên hệ', 'lien-he', 3, NULL, 1, '', 1, 1, '2019-04-04 00:00:00', '2019-04-04 00:00:00');

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
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `cat_id` int(4) DEFAULT '1',
  `content` text COLLATE utf8_unicode_ci,
  `status` int(1) NOT NULL,
  `except` text COLLATE utf8_unicode_ci NOT NULL,
  `featured_image` text COLLATE utf8_unicode_ci,
  `author` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(1, 'Supper Admin', '[1]', '1'),
(2, 'Quản trị viên', '[10,20,30,70,90,110,130,150,170,210,230,250]', '1');

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
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_id` (`cat_id`),
  ADD KEY `status` (`status`);

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
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `log_history`
--
ALTER TABLE `log_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
