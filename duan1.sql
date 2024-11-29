-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 26, 2024 lúc 11:12 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `duan1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `title`, `image_url`, `status`, `created_at`) VALUES
(1, 'Banner 1', 'b1.png', 1, '2024-11-16 14:19:01'),
(2, 'Banner 2', 'b2.png', 1, '2024-11-16 16:36:32'),
(3, 'Banner 3', 'b3.png', 1, '2024-11-16 16:36:53'),
(4, 'Banner 4', 'b4.png', 1, '2024-11-16 16:37:22'),
(5, 'Banner 5', 'b5.png', 1, '2024-11-16 16:37:54'),
(6, 'Banner 6', 'b6.png', 1, '2024-11-16 16:38:11'),
(7, 'Banner 7', 'b7.png', 1, '2024-11-21 16:03:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `import_date` date DEFAULT NULL,
  `storage_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `cate_id` int(11) NOT NULL,
  `cate_name` varchar(50) NOT NULL,
  `img` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `cate_status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`cate_id`, `cate_name`, `img`, `description`, `cate_status`) VALUES
(1, 'iPhone 11', 'Uploads/Category/apple.webp', '', 1),
(3, 'iPhone 13', 'Uploads/Category/apple.webp', '', 1),
(4, 'iPhone 14', 'Uploads/Category/apple.webp', '', 1),
(5, 'iPhone 15', 'Uploads/Category/apple.webp', '', 1),
(6, 'iPhone 16', 'Uploads/Category/apple.webp', '', 1),
(7, 'iPhone 12', 'Uploads/Category/apple.webp', '', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `com_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `import_date` datetime DEFAULT current_timestamp(),
  `cmt_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Chờ duyệt, 1: Đã duyệt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`com_id`, `content`, `user_id`, `pro_id`, `import_date`, `cmt_status`) VALUES
(1, 'Sản phẩm tốt', 1, 1, '2024-11-13 14:46:48', 1),
(2, 'iPhone chạy rất mượt, pin trâu. Camera chụp đẹp trong mọi điều kiện ánh sáng.', 2, 1, '2024-03-15 08:30:00', 1),
(3, 'Mình đã dùng được 2 tháng, máy hoạt động tốt. Tuy nhiên giá hơi cao.', 3, 1, '2024-03-14 15:45:00', 0),
(4, 'Thiết kế đẹp, cầm vừa tay. Màn hình hiển thị sắc nét.', 4, 2, '2024-03-13 10:20:00', 1),
(5, 'Sản phẩm tốt, đóng gói cẩn thận. Nhân viên tư vấn nhiệt tình.', 5, 2, '2024-03-12 14:15:00', 1),
(6, 'Face ID nhận diện nhanh và chính xác. Chơi game không bị giật lag.', 6, 3, '2024-03-11 09:30:00', 1),
(7, 'Máy đẹp, chụp ảnh xóa phông tốt. Tuy nhiên pin hơi tụt nhanh khi chơi game.', 7, 3, '2024-03-10 16:40:00', 1),
(8, 'Mua về dùng rất hài lòng. Giao hàng nhanh, đúng mẫu như hình.', 8, 4, '2024-03-09 11:25:00', 0),
(9, 'Sạc nhanh, màn hình 120Hz mượt mà. Khuyên mọi người nên mua.', 9, 4, '2024-03-08 13:50:00', 1),
(10, 'Camera chụp đêm rất tốt. Màu sắc trung thực, chi tiết cao.', 2, 5, '2024-03-07 10:15:00', 0),
(11, 'Máy mỏng nhẹ, thời lượng pin đủ dùng cả ngày dài.', 3, 5, '2024-03-06 15:30:00', 1),
(15, 'Sản phẩm tốt', 1, 28, '2024-11-26 15:36:26', 0),
(16, 'Rất đẹp\r\n', 1, 28, '2024-11-26 15:36:35', 0),
(17, 'Tốt', 1, 23, '2024-11-26 15:38:13', 0),
(18, 'Sản phẩm xịn', 1, 23, '2024-11-26 15:38:21', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_code` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `shipping_address` text NOT NULL,
  `shipping_phone` varchar(20) NOT NULL,
  `shipping_email` varchar(255) DEFAULT NULL,
  `bank_code` varchar(50) DEFAULT NULL,
  `status` enum('pending','confirmed','processing','shipping','delivered','cancelled','returned','refunded','failed','awaiting_payment') NOT NULL DEFAULT 'pending',
  `payment_method` varchar(50) NOT NULL DEFAULT 'cod',
  `payment_status` varchar(50) NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `return_reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `order_code`, `user_id`, `receiver_name`, `total_amount`, `shipping_address`, `shipping_phone`, `shipping_email`, `bank_code`, `status`, `payment_method`, `payment_status`, `created_at`, `updated_at`, `return_reason`) VALUES
(1, 'DH001', 1, NULL, 25990000.00, '123 Nguyễn Văn A, Q.1, TP.HCM', '0901234567', 'user1@gmail.com', NULL, 'confirmed', 'cod', 'unpaid', '2024-11-24 10:16:53', '2024-11-25 17:46:01', NULL),
(2, 'DH002', 2, NULL, 31990000.00, '456 Lê Lợi, Q.5, TP.HCM', '0912345678', 'user2@gmail.com', NULL, 'confirmed', 'cod', 'unpaid', '2024-11-24 10:16:53', '2024-11-25 17:46:01', NULL),
(3, 'DH003', 3, NULL, 19990000.00, '789 Trần Hưng Đạo, Q.3, TP.HCM', '0923456789', 'user3@gmail.com', NULL, 'processing', 'cod', 'unpaid', '2024-11-24 10:16:53', '2024-11-25 17:46:01', NULL),
(4, 'DH004', 1, NULL, 45990000.00, '321 Võ Văn Tần, Q.10, TP.HCM', '0934567890', 'user4@gmail.com', NULL, 'pending', 'cod', 'unpaid', '2024-11-24 10:16:53', '2024-11-25 17:46:01', NULL),
(5, 'DH005', 2, NULL, 28990000.00, '654 Nguyễn Thị Minh Khai, Q.3, TP.HCM', '0945678901', 'user5@gmail.com', NULL, 'confirmed', 'cod', 'unpaid', '2024-11-24 10:16:53', '2024-11-25 17:46:01', NULL),
(6, 'DH006', 3, NULL, 33990000.00, '987 Điện Biên Phủ, Q.Bình Thạnh, TP.HCM', '0956789012', 'user6@gmail.com', NULL, 'processing', 'cod', 'unpaid', '2024-11-24 10:16:53', '2024-11-25 17:46:01', NULL),
(7, 'DH007', 1, NULL, 22990000.00, '147 Cách Mạng Tháng 8, Q.3, TP.HCM', '0967890123', 'user7@gmail.com', NULL, 'confirmed', 'cod', 'unpaid', '2024-11-24 10:16:53', '2024-11-25 17:46:01', NULL),
(8, 'DH008', 2, NULL, 41990000.00, '258 Nam Kỳ Khởi Nghĩa, Q.3, TP.HCM', '0978901234', 'user8@gmail.com', NULL, 'confirmed', 'cod', 'unpaid', '2024-11-24 10:16:53', '2024-11-25 17:46:01', NULL),
(9, 'DH009', 3, NULL, 37990000.00, '369 Hai Bà Trưng, Q.1, TP.HCM', '0989012345', 'user9@gmail.com', NULL, 'processing', 'cod', 'unpaid', '2024-11-24 10:16:53', '2024-11-25 17:46:01', NULL),
(10, 'DH010', 1, NULL, 29990000.00, '159 Lý Tự Trọng, Q.1, TP.HCM', '0990123456', 'user10@gmail.com', NULL, 'confirmed', 'cod', 'unpaid', '2024-11-24 10:16:53', '2024-11-25 15:52:51', NULL),
(30, 'ORD17324413551284', 1, 'Bùi Đức Dương', 23490000.00, 'Thanh Liêm-Hà Nam', '0355032605', NULL, NULL, 'confirmed', 'cod', 'unpaid', '2024-11-24 10:16:53', '2024-11-25 17:46:01', NULL),
(35, 'ORD17324428217003', 1, 'Bùi Đức Dương', 23490000.00, 'Thanh Liêm-Hà Nam', '0355032605', NULL, NULL, 'processing', 'cod', 'unpaid', '2024-11-24 10:16:53', '2024-11-25 17:46:01', NULL),
(38, '', 1, 'Bùi Đức Dương', 23490000.00, 'Thanh Liêm-Hà Nam', '0355032605', NULL, NULL, 'confirmed', 'cod', 'unpaid', '2024-11-24 10:20:18', '2024-11-25 17:46:01', NULL),
(50, '', 1, 'Bùi Đức Dương', 23490000.00, 'Thanh Liêm-Hà Nam', '0355032605', NULL, NULL, 'confirmed', 'cod', 'unpaid', '2024-11-24 11:11:28', '2024-11-25 17:46:01', NULL),
(52, 'ORD17324472918940', 1, 'Bùi Đức Dương', 23490000.00, 'Thanh Liêm-Hà Nam', '0355032605', NULL, NULL, 'confirmed', 'cod', 'unpaid', '2024-11-24 11:21:31', '2024-11-25 17:46:01', NULL),
(54, '', 1, 'Bùi Đức Dương', 23490000.00, 'Thanh Liêm-Hà Nam', '0355032605', NULL, NULL, 'pending', 'cod', 'unpaid', '2024-11-24 05:24:15', '2024-11-24 11:24:15', NULL),
(59, 'ORD1732448935', 1, 'Bùi Đức Dương', 23490000.00, 'Thanh Liêm-Hà Nam', '0355032605', NULL, NULL, 'pending', 'cod', 'unpaid', '2024-11-24 11:48:55', '2024-11-24 11:48:55', NULL),
(61, 'ORD1732448961', 1, 'Bùi Đức Dương', 23490000.00, 'Thanh Liêm-Hà Nam', '0355032605', NULL, NULL, 'pending', 'cod', 'unpaid', '2024-11-24 11:49:21', '2024-11-24 11:49:21', NULL),
(62, 'ORD1732448977', 1, 'Bùi Đức Dương', 23490000.00, 'Thanh Liêm-Hà Nam', '0355032605', NULL, NULL, 'pending', 'cod', 'unpaid', '2024-11-24 11:49:37', '2024-11-24 11:49:37', NULL),
(65, 'ORD1732449709', 1, 'Bùi Đức Dương', 23490000.00, 'Thanh Liêm-Hà Nam', '0355032605', NULL, NULL, 'pending', 'cod', 'unpaid', '2024-11-24 12:01:49', '2024-11-24 12:01:49', NULL),
(66, 'ORD1732459511', 1, 'Bùi Đức Dương', 23490000.00, 'Thanh Liêm-Hà Nam', '0355032605', NULL, NULL, 'pending', 'cod', 'unpaid', '2024-11-24 14:45:11', '2024-11-24 14:45:11', NULL),
(68, 'ORD1732460276', 2, 'Bùi Đức Dương', 34290000.00, 'Hà Nam', '0355032605', NULL, NULL, 'pending', 'cod', 'unpaid', '2024-11-24 14:57:56', '2024-11-24 14:57:56', NULL),
(70, 'ORD1732461980', 2, 'Bùi Đức Dương', 34290000.00, 'Hà Nam', '0355032605', NULL, NULL, 'pending', 'cod', 'unpaid', '2024-11-24 15:26:20', '2024-11-24 15:26:20', NULL),
(71, 'ORD1732463437', 2, 'Bùi Đức Dương', 34290000.00, 'Hà Nam', '0355032605', NULL, NULL, 'pending', 'cod', 'unpaid', '2024-11-24 15:50:37', '2024-11-24 15:50:37', NULL),
(72, 'ORD1732466950', 2, 'Bùi Đức Dương', 23490000.00, 'Hà Nam', '0355032605', NULL, NULL, 'pending', 'cod', 'unpaid', '2024-11-24 16:49:10', '2024-11-24 16:49:10', NULL),
(73, 'ORD1732467414', 2, 'Bùi Đức Dương', 23490000.00, 'Hà Nam', '0355032605', NULL, NULL, 'pending', 'cod', 'unpaid', '2024-11-24 16:56:54', '2024-11-24 16:56:54', NULL),
(74, 'ORD1732468917', 2, 'Bùi Đức Dương', 23490000.00, 'Hà Nam', '0355032605', NULL, NULL, 'pending', 'cod', 'unpaid', '2024-11-24 17:21:57', '2024-11-24 17:21:57', NULL),
(76, 'ORD1732514667', 2, 'Bùi Đức Dương', 28790000.00, 'Hà Nam', '0355032605', NULL, NULL, 'processing', 'cod', 'unpaid', '2024-11-25 06:04:27', '2024-11-25 17:46:01', NULL),
(78, 'ORD1732524854', 2, 'Bùi Đức Dương', 23490000.00, 'Hà Nam', '0355032605', NULL, NULL, 'pending', 'cod', 'unpaid', '2024-11-25 08:54:14', '2024-11-25 08:54:14', NULL),
(79, 'ORD1732525380', 2, 'Bùi Đức Dương', 23490000.00, 'Hà Nam', '0355032605', NULL, NULL, 'pending', 'cod', 'unpaid', '2024-11-25 09:03:00', '2024-11-25 09:03:00', NULL),
(80, 'ORD1732525421', 2, 'Bùi Đức Dương', 23490000.00, 'Hà Nam', '0355032605', NULL, NULL, 'pending', 'cod', 'unpaid', '2024-11-25 09:03:41', '2024-11-25 09:03:41', NULL),
(81, 'ORD1732525668', 2, 'Bùi Đức Dương', 23490000.00, 'Hà Nam', '0355032605', NULL, NULL, 'pending', 'cod', 'unpaid', '2024-11-25 09:07:48', '2024-11-25 09:07:48', NULL),
(82, 'ORD1732525897', 20, 'đỗ trung kiên ', 23490000.00, 'văn khúc ', '0998766765633', NULL, NULL, 'refunded', 'cod', 'unpaid', '2024-11-25 09:11:37', '2024-11-25 16:36:01', NULL),
(83, 'ORD1732537512', 2, 'Bùi Đức Dương', 23490000.00, 'Hà Nam', '0355032605', NULL, NULL, 'pending', 'cod', 'unpaid', '2024-11-25 12:25:12', '2024-11-25 12:25:12', NULL),
(84, 'ORD1732538170', 2, 'Bùi Đức Dương', 23490000.00, 'Hà Nam', '0355032605', NULL, NULL, 'confirmed', 'cod', 'unpaid', '2024-11-25 12:36:10', '2024-11-25 16:39:01', NULL),
(85, 'ORD1732538223', 2, 'Bùi Đức Dương', 23490000.00, 'Hà Nam', '0355032605', NULL, NULL, 'confirmed', 'cod', 'unpaid', '2024-11-25 12:37:03', '2024-11-25 15:47:50', NULL),
(86, 'ORD1732538275', 2, 'Bùi Đức Dương', 23490000.00, 'Hà Nam', '0355032605', NULL, NULL, 'confirmed', 'cod', 'unpaid', '2024-11-25 12:37:55', '2024-11-25 15:52:13', NULL),
(87, 'ORD1732549009', 20, 'đỗ trung kiên ', 23490000.00, 'văn khúc ', '0998766765633', NULL, NULL, 'cancelled', 'cod', 'unpaid', '2024-11-25 15:36:49', '2024-11-25 16:11:57', NULL),
(88, 'ORD1732551269', 20, 'đỗ trung kiên ', 23490000.00, 'văn khúc ', '0998766765633', NULL, NULL, 'returned', 'cod', 'unpaid', '2024-11-25 16:14:29', '2024-11-25 17:13:22', 'dfd'),
(89, 'ORD1732553568', 20, 'đỗ trung kiên ', 23490000.00, 'văn khúc ', '0998766765633', NULL, NULL, 'cancelled', 'cod', 'unpaid', '2024-11-25 16:52:48', '2024-11-25 16:52:54', NULL),
(90, 'ORD1732555223', 20, 'đỗ trung kiên ', 29490000.00, 'văn khúc ', '0998766765633', NULL, NULL, 'refunded', 'cod', 'unpaid', '2024-11-25 17:20:23', '2024-11-25 17:31:50', 'fdsasfsdf'),
(99, 'ORD1732557809', 20, 'đỗ trung kiên ', 23490000.00, 'văn khúc ', '0998766765633', NULL, NULL, 'returned', 'cod', 'unpaid', '2024-11-25 18:03:29', '2024-11-25 18:04:12', 'dfdfsf'),
(100, 'ORD1732557887', 20, 'đỗ trung kiên ', 23490000.00, 'văn khúc ', '0998766765633', NULL, NULL, 'cancelled', 'cod', 'unpaid', '2024-11-25 18:04:47', '2024-11-25 18:37:52', NULL),
(101, 'ORD1732558429', 20, 'đỗ trung kiên ', 29490000.00, 'văn khúc ', '0998766765633', NULL, NULL, 'cancelled', 'cod', 'unpaid', '2024-11-25 18:13:49', '2024-11-25 18:13:54', NULL),
(102, 'ORD1732610445', 1, 'Bùi Đức Dương', 46980000.00, 'Thanh Liêm-Hà Nam', '0355032605', NULL, NULL, 'pending', 'cod', 'unpaid', '2024-11-26 08:40:45', '2024-11-26 08:40:45', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `detail_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`detail_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(11, 1, 1, 1, 25990000.00),
(12, 2, 2, 1, 31990000.00),
(13, 3, 3, 1, 19990000.00),
(14, 4, 4, 1, 45990000.00),
(15, 5, 5, 1, 28990000.00),
(16, 6, 6, 1, 33990000.00),
(17, 7, 7, 1, 22990000.00),
(18, 8, 8, 1, 41990000.00),
(19, 9, 9, 1, 37990000.00),
(20, 10, 10, 1, 29990000.00),
(25, 30, 25, 1, 23490000.00),
(30, 35, 25, 1, 23490000.00),
(33, 38, 25, 1, 23490000.00),
(45, 50, 25, 1, 23490000.00),
(47, 52, 25, 1, 23490000.00),
(49, 54, 25, 1, 23490000.00),
(54, 59, 25, 1, 23490000.00),
(56, 61, 25, 1, 23490000.00),
(57, 62, 25, 1, 23490000.00),
(60, 65, 25, 1, 23490000.00),
(61, 66, 25, 1, 23490000.00),
(63, 68, 1, 1, 34290000.00),
(65, 70, 1, 1, 34290000.00),
(66, 71, 1, 1, 34290000.00),
(67, 72, 25, 1, 23490000.00),
(68, 73, 25, 1, 23490000.00),
(69, 74, 25, 1, 23490000.00),
(71, 76, 3, 1, 28790000.00),
(73, 78, 25, 1, 23490000.00),
(74, 79, 26, 1, 23490000.00),
(75, 80, 26, 1, 23490000.00),
(76, 81, 26, 1, 23490000.00),
(77, 82, 25, 1, 23490000.00),
(78, 83, 24, 1, 23490000.00),
(79, 84, 24, 1, 23490000.00),
(80, 85, 24, 1, 23490000.00),
(81, 86, 26, 1, 23490000.00),
(82, 87, 25, 1, 23490000.00),
(83, 88, 27, 1, 23490000.00),
(84, 89, 24, 1, 23490000.00),
(85, 90, 2, 1, 29490000.00),
(94, 99, 25, 1, 23490000.00),
(95, 100, 25, 1, 23490000.00),
(96, 101, 2, 1, 29490000.00),
(97, 102, 23, 1, 23490000.00),
(98, 102, 28, 1, 23490000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `pay_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `import_date` datetime DEFAULT current_timestamp(),
  `status` tinyint(1) DEFAULT 1,
  `total` int(11) DEFAULT NULL,
  `pay_method` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_logs`
--

CREATE TABLE `payment_logs` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 0,
  `img` varchar(255) NOT NULL,
  `import_date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pro_view` int(11) DEFAULT 0,
  `pro_status` tinyint(1) DEFAULT 1,
  `cate_id` int(11) NOT NULL,
  `storage_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`pro_id`, `pro_name`, `price`, `quantity`, `img`, `import_date`, `description`, `pro_view`, `pro_status`, `cate_id`, `storage_id`, `color_id`) VALUES
(1, 'iPhone 16 Pro Max 256GB | Chính hãng VN/A', 34290000, 47, 'iphone-16-den.png', '2024-11-13', '', 0, 1, 6, 2, 1),
(2, 'iPhone 15 Pro Max 256GB | Chính hãng VN/A', 29490000, 48, 'iphone-15-den.png', '2024-11-17', '', 0, 1, 5, 2, 1),
(3, 'iPhone 16 Pro 128GB | Chính hãng VN/A', 28790000, 49, 'iphone-16-den.png', '2024-11-17', '', 0, 1, 6, 1, 1),
(4, 'iPhone 16 128GB | Chính hãng VN/A', 22090000, 50, 'iphone-16-xanhluuly.png', '2024-11-17', '', 0, 1, 6, 1, 4),
(5, 'iPhone 15 128GB | Chính hãng VN/A', 19690000, 50, 'iphone-15-hong.png', '2024-11-17', '', 0, 1, 5, 1, 6),
(6, 'iPhone 13 128GB | Chính hãng VN/A', 13450000, 50, 'iphone-13-hong.png', '2024-11-17', '', 0, 1, 3, 1, 6),
(7, 'iPhone 14 Pro Max 128GB | Chính hãng VN/A', 25590000, 50, 'iphone-14-den.png', '2024-11-17', '', 0, 1, 4, 1, 1),
(8, 'iPhone 16 Pro Max 512GB | Chính hãng VN/A', 40790000, 50, 'iphone-16-den.png', '2024-11-17', '', 0, 1, 6, 3, 1),
(9, 'iPhone 15 Plus 128GB | Chính hãng VN/A', 22690000, 50, 'iphone-15-hong.png', '2024-11-17', '', 0, 1, 5, 1, 6),
(10, 'iPhone 14 Pro 128GB | Chính hãng VN/A', 22990000, 50, 'iphone-14-den.png', '2024-11-17', '', 0, 1, 4, 1, 1),
(11, 'iPhone 15 Pro 128GB | Chính hãng VN/A', 26690000, 50, 'iphone-15-den.png', '2024-11-17', '', 0, 1, 5, 1, 1),
(13, 'iPhone 13 Pro Max 128GB | Chính hãng VN/A', 22990000, 50, 'iphone-13-xanhmongket.png', '2024-11-17', '', 0, 1, 3, 1, 5),
(14, 'iPhone 16 Plus 128GB | Chính hãng VN/A', 25490000, 50, 'iphone-16-xanhluuly.png', '2024-11-17', '', 0, 1, 6, 1, 4),
(15, 'iPhone 14 Pro Max 256GB | Chính hãng VN/A', 27990000, 50, 'iphone-14-vangkim.png', '2024-11-17', '', 0, 1, 4, 2, 3),
(16, 'iPhone 11 64GB | Chính hãng VN/A', 8990000, 50, 'iphone-11-trang.png', '2024-11-17', '', 0, 1, 1, 1, 2),
(17, 'iPhone 14 128GB | Chính hãng VN/A', 17390000, 50, 'iphone-14-vang.png', '2024-11-17', '', 0, 1, 4, 1, 3),
(19, 'iPhone 13 256GB | Chính hãng VN/A', 17290000, 50, 'iphone-13-xanhmongket.png', '2024-11-17', '', 0, 1, 3, 2, 5),
(20, 'iPhone 11 128GB | Chính hãng VN/A', 10090000, 50, 'iphone-11-do.png', '2024-11-17', '', 0, 1, 1, 1, 7),
(21, 'iPhone 12 Pro Max 128GB I Chính hãng VN/A', 23490000, 50, 'iphone-12-vangkim.png', '2024-11-21', '', 0, 1, 7, 1, 3),
(23, 'iPhone 12 Pro Max 128GB I Chính hãng VN/A', 23490000, 49, 'iphone-12-den.png', '2024-11-21', '', 0, 1, 7, 1, 1),
(24, 'iPhone 12 Pro Max 256GB I Chính hãng VN/A', 23490000, 46, 'iphone-12-den.png', '2024-11-22', '', 0, 1, 7, 2, 1),
(25, 'iPhone 12 Pro Max 512GB I Chính hãng VN/A', 23490000, 31, 'iphone-12-den.png', '2024-11-22', '', 0, 1, 7, 3, 1),
(26, 'iPhone 12 Pro Max 256GB I Chính hãng VN/A', 23490000, 46, 'iphone-12-vangkim.png', '2024-11-22', '', 0, 1, 7, 2, 3),
(27, 'iPhone 12 Pro Max 512GB I Chính hãng VN/A', 23490000, 49, 'iphone-12-vangkim.png', '2024-11-22', '', 0, 1, 7, 3, 3),
(28, 'iPhone 12 Pro Max 128GB I Chính hãng VN/A', 23490000, 49, 'iphone-12-xanhmongket.png', '2024-11-22', '', 0, 1, 7, 1, 5),
(29, 'iPhone 12 Pro Max 256GB I Chính hãng VN/A', 23490000, 50, 'iphone-12-xanhmongket.png', '2024-11-22', '', 0, 1, 7, 2, 5),
(30, 'iPhone 12 Pro Max 512GB I Chính hãng VN/A', 23490000, 50, 'iphone-12-xanhmongket.png', '2024-11-22', '', 0, 1, 7, 3, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_color`
--

CREATE TABLE `product_color` (
  `color_id` int(11) NOT NULL,
  `color_type` varchar(50) NOT NULL,
  `color_price` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_color`
--

INSERT INTO `product_color` (`color_id`, `color_type`, `color_price`, `created_at`) VALUES
(1, 'Đen', 0.00, '2024-11-12 20:16:16'),
(2, 'Trắng', 0.00, '2024-11-12 20:16:16'),
(3, 'Vàng Kim', 500000.00, '2024-11-12 20:16:16'),
(4, 'Xanh Lưu Ly', 500000.00, '2024-11-16 17:08:22'),
(5, 'Xanh Mòng Két', 500000.00, '2024-11-16 17:08:35'),
(6, 'Hồng', 0.00, '2024-11-16 17:08:57'),
(7, 'Đỏ', 0.00, '2024-11-16 17:27:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_deals`
--

CREATE TABLE `product_deals` (
  `deal_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `discount` decimal(5,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_deals`
--

INSERT INTO `product_deals` (`deal_id`, `pro_id`, `discount`, `start_date`, `end_date`, `status`) VALUES
(2, 20, 21.00, '2024-11-06', '2024-11-30', 1),
(3, 24, 20.00, '2024-11-07', '2024-11-29', 1),
(4, 19, 25.00, '2024-11-07', '2024-12-01', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_storage`
--

CREATE TABLE `product_storage` (
  `storage_id` int(11) NOT NULL,
  `storage_type` varchar(50) NOT NULL,
  `storage_price` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_storage`
--

INSERT INTO `product_storage` (`storage_id`, `storage_type`, `storage_price`, `created_at`) VALUES
(1, '128GB', 0.00, '2024-11-12 20:16:16'),
(2, '256GB', 200000.00, '2024-11-12 20:16:16'),
(3, '512GB', 500000.00, '2024-11-12 20:16:16'),
(4, '64GB', 0.00, '2024-11-17 16:53:31'),
(5, '1TB', 2000000.00, '2024-11-17 21:19:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `description`, `created_at`) VALUES
(1, 'Admin', 'Quản trị viên hệ thống', '2024-11-12 20:16:16'),
(2, 'User', 'Người dùng thông thường', '2024-11-12 20:16:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thumbnails`
--

CREATE TABLE `thumbnails` (
  `thumb_id` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `thumb_status` tinyint(1) DEFAULT 1,
  `pro_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `transaction_code` varchar(50) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `payment_method` varchar(20) NOT NULL COMMENT 'momo, zalopay, bank_transfer',
  `bank_code` varchar(20) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending' COMMENT 'pending, completed, failed, refunded',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `birthday` date DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL COMMENT '0: Nữ, 1: Nam'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `fullname`, `phone`, `address`, `avatar`, `role_id`, `status`, `created_at`, `birthday`, `gender`) VALUES
(1, 'Sora', 'sora123', 'soramidori843@gmail.com', '', '', '', 'Uploads/User/user.png', 1, 1, '2024-11-13 07:46:27', NULL, NULL),
(2, 'duongbd', 'duong123', 'duongbdph50213@gmail.com', '', '', '', 'Uploads/User/user.png', 2, 1, '2024-11-17 21:00:12', NULL, NULL),
(3, 'nguyenthanhnam', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'thanhnam@gmail.com', 'Nguyễn Thành Nam', '0912345678', 'Quận 1, TP.HCM', 'Uploads/User/nam.jpg', 2, 1, '2024-11-17 21:30:55', NULL, NULL),
(4, 'tranthihuong', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'huong.tran@gmail.com', 'Trần Thị Hương', '0923456789', 'Cầu Giấy, Hà Nội', 'Uploads/User/nam.jpg', 2, 1, '2024-11-17 21:30:55', NULL, NULL),
(5, 'levanminh', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'minhle@gmail.com', 'Lê Văn Minh', '0934567890', 'Hải Châu, Đà Nẵng', 'Uploads/User/nam.jpg', 2, 1, '2024-11-17 21:30:55', NULL, NULL),
(6, 'phamthihoa', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hoapham@gmail.com', 'Phạm Thị Hoa', '0945678901', 'Ninh Kiều, Cần Thơ', 'Uploads/User/nam.jpg', 2, 1, '2024-11-17 21:30:55', NULL, NULL),
(7, 'hoangvantuan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tuanhoang@gmail.com', 'Hoàng Văn Tuấn', '0956789012', 'Ngô Quyền, Hải Phòng', 'Uploads/User/nam.jpg', 2, 1, '2024-11-17 21:30:55', NULL, NULL),
(8, 'nguyenthilan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lan.nguyen@gmail.com', 'Nguyễn Thị Lan', '0967890123', 'Lê Chân, Hải Phòng', 'Uploads/User/nam.jpg', 2, 1, '2024-11-17 21:30:55', NULL, NULL),
(9, 'vuducmanh', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'manhvu@gmail.com', 'Vũ Đức Mạnh', '0978901234', 'Thanh Xuân, Hà Nội', 'Uploads/User/nam.jpg', 2, 1, '2024-11-17 21:30:55', NULL, NULL),
(10, 'tranthihien', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hientran@gmail.com', 'Trần Thị Hiền', '0989012345', 'Sơn Trà, Đà Nẵng', 'Uploads/User/nam.jpg', 2, 1, '2024-11-17 21:30:55', NULL, NULL),
(20, 'kien', '1', 'kien49182@gmail.com', 'đỗ trung kiên ', '0998766765633', 'văn khúc ', 'Uploads/User/nam.jpg', 1, 1, '2024-11-25 09:10:43', NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pro_id` (`pro_id`),
  ADD KEY `storage_id` (`storage_id`),
  ADD KEY `color_id` (`color_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cate_id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`com_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pro_id` (`pro_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`pay_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `payment_logs`
--
ALTER TABLE `payment_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `cate_id` (`cate_id`),
  ADD KEY `storage_id` (`storage_id`),
  ADD KEY `color_id` (`color_id`);

--
-- Chỉ mục cho bảng `product_color`
--
ALTER TABLE `product_color`
  ADD PRIMARY KEY (`color_id`);

--
-- Chỉ mục cho bảng `product_deals`
--
ALTER TABLE `product_deals`
  ADD PRIMARY KEY (`deal_id`),
  ADD KEY `pro_id` (`pro_id`);

--
-- Chỉ mục cho bảng `product_storage`
--
ALTER TABLE `product_storage`
  ADD PRIMARY KEY (`storage_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Chỉ mục cho bảng `thumbnails`
--
ALTER TABLE `thumbnails`
  ADD PRIMARY KEY (`thumb_id`),
  ADD KEY `pro_id` (`pro_id`);

--
-- Chỉ mục cho bảng `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_code_UNIQUE` (`transaction_code`),
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `cate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
  MODIFY `pay_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `payment_logs`
--
ALTER TABLE `payment_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `product_color`
--
ALTER TABLE `product_color`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `product_deals`
--
ALTER TABLE `product_deals`
  MODIFY `deal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `product_storage`
--
ALTER TABLE `product_storage`
  MODIFY `storage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `thumbnails`
--
ALTER TABLE `thumbnails`
  MODIFY `thumb_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `products` (`pro_id`),
  ADD CONSTRAINT `cart_ibfk_3` FOREIGN KEY (`storage_id`) REFERENCES `product_storage` (`storage_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cart_ibfk_4` FOREIGN KEY (`color_id`) REFERENCES `product_color` (`color_id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `products` (`pro_id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`pro_id`);

--
-- Các ràng buộc cho bảng `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `payment_logs`
--
ALTER TABLE `payment_logs`
  ADD CONSTRAINT `payment_logs_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cate_id`) REFERENCES `categories` (`cate_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`storage_id`) REFERENCES `product_storage` (`storage_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`color_id`) REFERENCES `product_color` (`color_id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `product_deals`
--
ALTER TABLE `product_deals`
  ADD CONSTRAINT `product_deals_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `products` (`pro_id`);

--
-- Các ràng buộc cho bảng `thumbnails`
--
ALTER TABLE `thumbnails`
  ADD CONSTRAINT `thumbnails_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `products` (`pro_id`);

--
-- Các ràng buộc cho bảng `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
