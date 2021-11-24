-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2021 at 03:44 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_inven`
--

-- --------------------------------------------------------

--
-- Table structure for table `component`
--

CREATE TABLE `component` (
  `component_id` int(11) NOT NULL,
  `component_name` varchar(30) NOT NULL COMMENT 'Component Name',
  `component_page` varchar(100) NOT NULL COMMENT 'Component Page',
  `component_type` enum('system','standard') NOT NULL DEFAULT 'standard' COMMENT 'Component Type',
  `active` enum('yes','no') NOT NULL DEFAULT 'yes' COMMENT 'Active Status',
  `created_by` varchar(30) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `updated_date` datetime NOT NULL,
  `revision` tinyint(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `component`
--

INSERT INTO `component` (`component_id`, `component_name`, `component_page`, `component_type`, `active`, `created_by`, `created_date`, `updated_by`, `updated_date`, `revision`) VALUES
(1, 'User Management', 'user_management.php', 'system', 'yes', 'admin', '2015-12-04 07:54:58', 'admin', '2015-12-22 14:46:59', 2),
(2, 'Component Management', 'component_management.php', 'system', 'yes', 'admin', '2015-12-04 07:54:58', 'admin', '2015-12-22 14:46:29', 2),
(3, 'System Log', 'system_log.php', 'system', 'yes', 'admin', '2015-12-04 07:54:58', 'admin', '2015-12-22 14:46:55', 2),
(4, 'System Settings', 'system_settings.php', 'system', 'yes', 'admin', '2015-12-04 07:54:58', 'admin', '2015-12-22 14:46:57', 2),
(5, 'Device Management', 'device_management.php', 'system', 'yes', 'admin', '2015-12-03 15:01:55', 'admin', '2015-12-22 14:46:47', 2),
(6, 'Location Management', 'location_management.php', 'system', 'yes', 'admin', '2015-12-03 15:01:55', 'admin', '2015-12-22 14:46:52', 2),
(7, 'Report', 'report.php', 'system', 'yes', 'admin', '2015-12-22 11:17:36', 'admin', '2016-02-17 14:14:29', 4);

-- --------------------------------------------------------

--
-- Table structure for table `device_changes`
--

CREATE TABLE `device_changes` (
  `changes_id` int(12) UNSIGNED ZEROFILL NOT NULL,
  `device_id` int(11) NOT NULL,
  `changes` text DEFAULT NULL,
  `updated_by` varchar(30) NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `device_changes`
--

INSERT INTO `device_changes` (`changes_id`, `device_id`, `changes`, `updated_by`, `updated_date`) VALUES
(000000000003, 18, 'Dev status : new -> in use. Dev building id :  -> 15. Dev place id :  -> 6. Dev location id : 0 -> 5. ', 'imustofa', '2021-02-07 13:16:35'),
(000000000004, 6, 'Dev status : new -> in use. Dev building id :  -> 17. Dev place id :  -> 4. Dev location id : 0 -> 12. ', 'imustofa', '2021-02-07 13:54:24'),
(000000000005, 8, 'Dev status : new -> in use. Dev building id :  -> 13. Dev place id :  -> 9. Dev location id : 0 -> 7. ', 'imustofa', '2021-02-07 13:54:50'),
(000000000006, 9, 'Dev status : new -> in use. Dev building id :  -> 17. Dev place id :  -> 8. Dev location id : 0 -> 20. ', 'imustofa', '2021-02-07 13:55:53'),
(000000000007, 10, 'Dev status : new -> in use. Dev building id :  -> 17. Dev place id :  -> 7. Dev location id : 0 -> 38. ', 'imustofa', '2021-02-07 13:57:37'),
(000000000008, 11, 'Dev status : new -> in use. Dev building id :  -> 17. Dev place id :  -> 5. Dev location id : 0 -> 15. ', 'imustofa', '2021-02-07 13:58:24'),
(000000000009, 12, 'Dev status : new -> in use. Dev building id :  -> 17. Dev place id :  -> 6. Dev location id : 0 -> 23. ', 'imustofa', '2021-02-07 13:59:25'),
(000000000010, 13, 'Dev building id :  -> 15. Dev place id :  -> 6. Dev location id : 0 -> 23. ', 'imustofa', '2021-02-07 19:53:37'),
(000000000011, 14, 'Dev status : new -> in use. Dev building id :  -> 17. Dev place id :  -> 10. Dev location id : 0 -> 37. ', 'imustofa', '2021-02-07 19:54:25'),
(000000000012, 15, 'Dev status : new -> in use. Dev building id :  -> 12. Dev place id :  -> 3. Dev location id : 0 -> 10. ', 'imustofa', '2021-02-07 19:54:58'),
(000000000013, 16, 'Dev status : new -> in use. Dev building id :  -> 15. Dev place id :  -> 10. Dev location id : 0 -> 31. ', 'imustofa', '2021-02-07 19:55:30'),
(000000000014, 17, 'Dev status : new -> in use. Dev building id :  -> 12. Dev place id :  -> 10. Dev location id : 0 -> 28. ', 'imustofa', '2021-02-07 19:56:08'),
(000000000015, 19, 'Dev status : new -> in use. Dev building id :  -> 17. Dev place id :  -> 10. Dev location id : 0 -> 6. ', 'imustofa', '2021-02-07 19:56:34'),
(000000000016, 20, 'Dev status : new -> in use. Dev building id :  -> 13. Dev place id :  -> 9. Dev location id : 0 -> 7. ', 'imustofa', '2021-02-07 19:57:28'),
(000000000017, 21, 'Dev status : new -> in use. Dev building id :  -> 17. Dev place id :  -> 8. Dev location id : 0 -> 20. ', 'imustofa', '2021-02-07 19:57:59'),
(000000000018, 22, 'Dev status : new -> in use. Dev building id :  -> 15. Dev place id :  -> 6. Dev location id : 0 -> 23. ', 'imustofa', '2021-02-07 19:58:24'),
(000000000019, 23, 'Dev status : new -> in use. Dev building id :  -> 12. Dev place id :  -> 3. Dev location id : 0 -> 8. ', 'imustofa', '2021-02-07 19:58:46'),
(000000000020, 27, 'Dev status : new -> in use. Dev building id :  -> 17. Dev place id :  -> 5. Dev location id : 0 -> 15. ', 'imustofa', '2021-02-07 20:07:50'),
(000000000021, 26, 'Dev description :  -> <p>Pengadaan Kabupaten</p>. Dev status : new -> in use. Dev building id :  -> 12. Dev place id :  -> 3. Dev location id : 0 -> 28. ', 'imustofa', '2021-02-07 20:11:10'),
(000000000022, 24, 'Dev description :  -> <p>Pengadaan Kabupaten</p>. Dev building id :  -> 15. Dev place id :  -> 6. Dev location id : 0 -> 23. ', 'imustofa', '2021-02-07 20:11:45'),
(000000000023, 25, 'Dev description :  -> <p>Pengadaan Kabupaten</p>. Dev building id :  -> 15. Dev place id :  -> 6. Dev location id : 0 -> 23. ', 'imustofa', '2021-02-07 20:12:14'),
(000000000024, 36, 'Dev description :  -> <p>Pengadaan Kabupaten</p>. Dev building id : 0 -> 17. ', 'imustofa', '2021-02-07 20:30:56'),
(000000000025, 24, 'Dev status : new -> in use. Dev building id : 0 -> 16. ', 'imustofa', '2021-02-07 20:43:06'),
(000000000026, 25, 'Dev status : new -> in use. Dev building id : 0 -> 16. ', 'imustofa', '2021-02-07 20:43:27'),
(000000000027, 39, 'Dev building id : 0 -> 22. ', 'imustofa', '2021-02-07 20:44:15'),
(000000000028, 38, 'Dev status : new -> in use. Dev building id : 0 -> 22. ', 'imustofa', '2021-02-07 20:44:39'),
(000000000029, 41, 'Dev status : new -> in use. Dev building id : 0 -> 22. ', 'imustofa', '2021-02-07 20:45:02'),
(000000000030, 42, 'Dev bmn : 3.10.01.02.002.009 -> 3.10.01.02.002.018. Dev model : ThinkPad L412 -> ThinkPad T420. Dev serial : LR-XGFYX -> PB-CKVK5. Dev building id : 0 -> 0. ', 'imustofa', '2021-02-25 15:01:07');

-- --------------------------------------------------------

--
-- Table structure for table `device_list`
--

CREATE TABLE `device_list` (
  `device_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL COMMENT 'FK Device Type',
  `device_code` varchar(100) NOT NULL COMMENT 'Unique Code (5 digit number in the back)',
  `device_bmn` varchar(50) DEFAULT NULL,
  `device_tahun` int(4) DEFAULT NULL,
  `device_brand` varchar(100) NOT NULL,
  `device_model` varchar(100) DEFAULT NULL,
  `device_serial` varchar(255) NOT NULL,
  `device_color` varchar(100) NOT NULL COMMENT 'Color',
  `device_description` text DEFAULT NULL,
  `device_photo` text DEFAULT NULL,
  `device_status` enum('new','in use','damaged','repaired','discarded') NOT NULL DEFAULT 'new',
  `building_id` int(11) DEFAULT NULL COMMENT 'FK Ruang',
  `place_id` int(11) DEFAULT NULL COMMENT 'FK Sub/Koordinator',
  `location_id` int(11) DEFAULT NULL COMMENT 'FK PJ',
  `device_deployment_date` datetime DEFAULT NULL COMMENT 'Fill this field when assigned to a location',
  `created_by` varchar(30) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `updated_date` datetime NOT NULL,
  `revision` tinyint(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `device_list`
--

INSERT INTO `device_list` (`device_id`, `type_id`, `device_code`, `device_bmn`, `device_tahun`, `device_brand`, `device_model`, `device_serial`, `device_color`, `device_description`, `device_photo`, `device_status`, `building_id`, `place_id`, `location_id`, `device_deployment_date`, `created_by`, `created_date`, `updated_by`, `updated_date`, `revision`) VALUES
(6, 10, '3317/2021/LPT/1', '3.10.01.02.002.031', 2020, 'Lenovo', 'Ideapad 5 14IIL05', 'MP1VDQLE', 'Grey', '', './assets/images/device_photos/standard_device.jpg', 'in use', 17, 4, 12, '2021-02-07 13:54:25', 'imustofa', '2021-02-06 20:46:13', 'imustofa', '2021-02-07 13:54:25', 1),
(8, 10, '3317/2021/LPT/2', '3.10.01.02.002.032', 2020, 'Lenovo', 'Ideapad 5 14IIL05', 'MP1VDBL1', 'Grey', '', './assets/images/device_photos/standard_device.jpg', 'in use', 13, 9, 7, '2021-02-07 13:54:50', 'imustofa', '2021-02-06 20:51:36', 'imustofa', '2021-02-07 13:54:50', 1),
(9, 10, '3317/2021/LPT/3', '3.10.01.02.002.033', 2020, 'Lenovo', 'Ideapad 5 14IIL05', 'MP1VDQR9', 'Grey', '', './assets/images/device_photos/standard_device.jpg', 'in use', 17, 8, 20, '2021-02-07 13:55:53', 'imustofa', '2021-02-06 20:52:31', 'imustofa', '2021-02-07 13:55:53', 1),
(10, 10, '3317/2021/LPT/4', '3.10.01.02.002.034', 2020, 'Lenovo', 'Ideapad 5 14IIL05', 'MP1VDVSC', 'Grey', '', './assets/images/device_photos/standard_device.jpg', 'in use', 17, 7, 38, '2021-02-07 13:57:37', 'imustofa', '2021-02-06 20:54:11', 'imustofa', '2021-02-07 13:57:37', 1),
(11, 10, '3317/2021/LPT/5', '3.10.01.02.002.035', 2020, 'Lenovo', 'Ideapad 5 14IIL05', 'MP1VD94Z', 'Grey', '', './assets/images/device_photos/standard_device.jpg', 'in use', 17, 5, 15, '2021-02-07 13:58:24', 'imustofa', '2021-02-06 20:55:17', 'imustofa', '2021-02-07 13:58:24', 1),
(12, 10, '3317/2021/LPT/6', '3.10.01.02.002.036', 2020, 'Lenovo', 'Ideapad 5 14IIL05', 'MP1VD940', 'Grey', '', './assets/images/device_photos/standard_device.jpg', 'in use', 17, 6, 23, '2021-02-07 13:59:26', 'imustofa', '2021-02-06 21:05:23', 'imustofa', '2021-02-07 13:59:26', 1),
(13, 10, '3317/2021/LPT/7', '3.10.01.02.002.026', 2020, 'Asus', 'A412F', 'LAN0CV06R066420', 'Grey', '', './assets/images/device_photos/standard_device.jpg', 'new', 15, 6, 23, '2021-02-07 19:53:37', 'imustofa', '2021-02-06 21:06:28', 'imustofa', '2021-02-07 19:53:37', 1),
(14, 10, '3317/2021/LPT/8', '3.10.01.02.002.027', 2020, 'Asus', 'A412F', 'L9N0CV21N91540E', 'Grey', '', './assets/images/device_photos/standard_device.jpg', 'in use', 17, 10, 37, '2021-02-07 19:54:25', 'imustofa', '2021-02-06 21:07:09', 'imustofa', '2021-02-07 19:54:25', 1),
(15, 10, '3317/2021/LPT/9', '3.10.01.02.002.028', 2020, 'Asus', 'A412F', 'L9N0CV21N88440B', 'Grey', '', './assets/images/device_photos/standard_device.jpg', 'in use', 12, 3, 10, '2021-02-07 19:54:58', 'imustofa', '2021-02-06 21:08:09', 'imustofa', '2021-02-07 19:54:58', 1),
(16, 10, '3317/2021/LPT/10', '3.10.01.02.002.029', 2020, 'Asus', 'A412F', 'L9N0CV21N886403', 'Grey', '', './assets/images/device_photos/standard_device.jpg', 'in use', 15, 10, 31, '2021-02-07 19:55:31', 'imustofa', '2021-02-06 21:09:09', 'imustofa', '2021-02-07 19:55:31', 1),
(17, 10, '3317/2021/LPT/11', '3.10.01.02.002.030', 2020, 'Lenovo', 'A412F', 'LAN0CV06P982425', 'Grey', '', './assets/images/device_photos/standard_device.jpg', 'in use', 12, 10, 28, '2021-02-07 19:56:09', 'imustofa', '2021-02-06 21:09:42', 'imustofa', '2021-02-07 19:56:09', 1),
(18, 10, '3317/2021/LPT/12', '3.10.01.02.002.037', 2020, 'Acer', 'ASPIRE 5 A514-52G-547A', 'NXHMJSN004034059922N00', 'Purple', '', './assets/images/device_photos/standard_device.jpg', 'in use', 15, 6, 5, '2021-02-07 13:16:35', 'imustofa', '2021-02-06 21:10:33', 'imustofa', '2021-02-07 13:16:35', 1),
(19, 10, '3317/2021/LPT/13', '3.10.01.02.002.038', 2020, 'Acer', 'ASPIRE 5 A514-52G-547A', 'NXHMJSN004034058762N00', 'Purple', '', './assets/images/device_photos/standard_device.jpg', 'in use', 17, 10, 6, '2021-02-07 19:56:34', 'imustofa', '2021-02-06 21:11:19', 'imustofa', '2021-02-07 19:56:34', 1),
(20, 5, '3317/2021/PRT/14', '3.10.02.03.003.014', 2020, 'Canon', 'LaserShot LBP 2900', 'NMYA451321', 'Putih', '', './assets/images/device_photos/standard_device.jpg', 'in use', 13, 9, 7, '2021-02-07 19:57:28', 'imustofa', '2021-02-06 21:13:06', 'imustofa', '2021-02-07 19:57:28', 1),
(21, 5, '3317/2021/PRT/15', '3.10.02.03.003.015', 2020, 'Canon', 'LaserShot LBP 2900', 'NMYA469944', 'Putih', '', './assets/images/device_photos/standard_device.jpg', 'in use', 17, 8, 20, '2021-02-07 19:57:59', 'imustofa', '2021-02-06 21:13:42', 'imustofa', '2021-02-07 19:57:59', 1),
(22, 5, '3317/2021/PRT/16', '3.10.02.03.003.016', 2020, 'Canon', 'LaserShot LBP 2900', 'NMYA503429', 'Putih', '', './assets/images/device_photos/standard_device.jpg', 'in use', 15, 6, 23, '2021-02-07 19:58:24', 'imustofa', '2021-02-06 21:14:17', 'imustofa', '2021-02-07 19:58:24', 1),
(23, 5, '3317/2021/PRT/17', '3.10.02.03.003.017', 2020, 'Epson', 'L3110', 'X6NX550316', 'Hitam', '', './assets/images/device_photos/standard_device.jpg', 'in use', 12, 3, 8, '2021-02-07 19:58:46', 'imustofa', '2021-02-06 21:14:57', 'imustofa', '2021-02-07 19:58:46', 1),
(24, 7, '3317/2021/UPS/18', '3.05.02.06.017.050', 2020, 'ICA', 'CE 1200', '1B1D22017653', 'Hitam', '<p>Pengadaan Kabupaten</p>', './assets/images/device_photos/standard_device.jpg', 'in use', 16, 6, 23, '2021-02-07 20:43:06', 'imustofa', '2021-02-06 21:17:07', 'imustofa', '2021-02-07 20:43:06', 2),
(25, 7, '3317/2021/UPS/19', '3.05.02.06.017.051', 2020, 'ICA', 'CE 1200', '1B1D22017684', 'Hitam', '<p>Pengadaan Kabupaten</p>', './assets/images/device_photos/standard_device.jpg', 'in use', 16, 6, 23, '2021-02-07 20:43:27', 'imustofa', '2021-02-06 21:17:41', 'imustofa', '2021-02-07 20:43:27', 2),
(26, 7, '3317/2021/UPS/20', '3.05.02.06.017.036', 2020, 'Prolink', 'PRO1201SFCU', '553801203600784', 'Hitam', '<p>Pengadaan Kabupaten</p>', './assets/images/device_photos/standard_device.jpg', 'in use', 12, 3, 28, '2021-02-07 20:11:10', 'imustofa', '2021-02-06 21:18:23', 'imustofa', '2021-02-07 20:11:10', 1),
(27, 11, '3317/2021/SCN/21', '3.10.02.03.004.004', 2020, 'Epson', 'WorkForce DS-410', 'X43E010425', 'Putih', '', './assets/images/device_photos/standard_device.jpg', 'in use', 17, 5, 15, '2021-02-07 20:07:50', 'imustofa', '2021-02-07 20:04:42', 'imustofa', '2021-02-07 20:07:50', 1),
(28, 11, '3317/2021/SCN/22', '3.10.02.03.004.003', 2020, 'Epson', 'WorkForce DS-410', 'X43E010436', 'Putih', '', './assets/images/device_photos/standard_device.jpg', 'in use', 12, 3, 8, '0000-00-00 00:00:00', 'imustofa', '2021-02-07 20:07:22', 'imustofa', '2021-02-07 20:07:22', 0),
(29, 7, '3317/2021/UPS/23', '3.05.02.06.017.037', 2020, 'Prolink', 'PRO1201SFCU', '553801203100003', 'Hitam', '', './assets/images/device_photos/standard_device.jpg', 'in use', 13, 9, 7, '0000-00-00 00:00:00', 'imustofa', '2021-02-07 20:09:56', 'imustofa', '2021-02-07 20:09:56', 0),
(30, 7, '3317/2021/UPS/24', '3.05.02.06.017.038', 2020, 'Prolink', 'PRO1201SFCU', '553801203600517', 'Hitam', '<p>Pengadaan Kabupaten</p>', './assets/images/device_photos/standard_device.jpg', 'in use', 12, 3, 10, '0000-00-00 00:00:00', 'imustofa', '2021-02-07 20:14:00', 'imustofa', '2021-02-07 20:14:00', 0),
(31, 7, '3317/2021/UPS/25', '3.05.02.06.017.039', 2020, 'Prolink', 'PRO1201SFCU', '553801203600538', 'Hitam', '<p>Pengadaan Kabupaten</p>', './assets/images/device_photos/standard_device.jpg', 'in use', 17, 5, 15, '0000-00-00 00:00:00', 'imustofa', '2021-02-07 20:15:05', 'imustofa', '2021-02-07 20:15:05', 0),
(32, 7, '3317/2021/UPS/26', '3.05.02.06.017.040', 2020, 'Prolink', 'PRO1201SFCU', '553801203600540', 'Hitam', '', './assets/images/device_photos/standard_device.jpg', 'in use', 17, 7, 19, '0000-00-00 00:00:00', 'imustofa', '2021-02-07 20:15:56', 'imustofa', '2021-02-07 20:15:56', 0),
(33, 7, '3317/2021/UPS/27', '3.05.02.06.017.041', 2020, 'Prolink', 'PRO1201SFCU', '553801203600772', 'Hitam', '<p>Pengadaan Kabupaten</p>', './assets/images/device_photos/standard_device.jpg', 'in use', 17, 7, 38, '0000-00-00 00:00:00', 'imustofa', '2021-02-07 20:17:05', 'imustofa', '2021-02-07 20:17:05', 0),
(34, 7, '3317/2021/UPS/28', '3.05.02.06.017.042', 2020, 'Prolink', 'PRO1201SFCU', '553801203600539', 'Hitam', '<p>Pengadaan Kabupaten</p>', './assets/images/device_photos/standard_device.jpg', 'in use', 17, 4, 12, '0000-00-00 00:00:00', 'imustofa', '2021-02-07 20:26:52', 'imustofa', '2021-02-07 20:26:52', 0),
(35, 7, '3317/2021/UPS/29', '3.05.02.06.017.043', 2020, 'Prolink', 'PRO1201SFCU', '538701201200707', 'Hitam', '<p>Pengadaan Kabupaten</p>', './assets/images/device_photos/standard_device.jpg', 'in use', 17, 4, 14, '0000-00-00 00:00:00', 'imustofa', '2021-02-07 20:28:27', 'imustofa', '2021-02-07 20:28:27', 0),
(36, 7, '3317/2021/UPS/30', '3.05.02.06.017.044', 2020, 'Prolink', 'PRO1201SFCU', '553801203600688', 'Hitam', '<p>Pengadaan Kabupaten</p>', './assets/images/device_photos/standard_device.jpg', 'in use', 17, 8, 21, '2021-02-07 20:30:56', 'imustofa', '2021-02-07 20:30:14', 'imustofa', '2021-02-07 20:30:56', 1),
(37, 7, '3317/2021/UPS/31', '3.05.02.06.017.045', 2020, 'Prolink', 'PRO1201SFCU', '553801203600750', 'Hitam', '<p>Pengadaan Kabupaten</p>', './assets/images/device_photos/standard_device.jpg', 'in use', 17, 8, 20, '0000-00-00 00:00:00', 'imustofa', '2021-02-07 20:31:55', 'imustofa', '2021-02-07 20:31:55', 0),
(38, 7, '3317/2021/UPS/32', '3.05.02.06.017.046', 2020, 'Prolink', 'PRO1201SFCU', '538701196802284', 'Hitam', '<p>Pengadaan Kabupaten</p>', './assets/images/device_photos/standard_device.jpg', 'in use', 22, 6, 23, '2021-02-07 20:44:40', 'imustofa', '2021-02-07 20:33:21', 'imustofa', '2021-02-07 20:44:40', 1),
(39, 7, '3317/2021/UPS/33', '3.05.02.06.017.047', 2020, 'Prolink', 'PRO1201SFCU', '553801203600537', 'Hitam', '', './assets/images/device_photos/standard_device.jpg', 'in use', 22, 6, 23, '2021-02-07 20:44:15', 'imustofa', '2021-02-07 20:34:26', 'imustofa', '2021-02-07 20:44:15', 1),
(40, 7, '3317/2021/UPS/34', '3.05.02.06.017.048', 2020, 'Prolink', 'PRO1201SFCU', '553801203600761', 'Hitam', '<p>Pengadaan Kabupaten</p>', './assets/images/device_photos/standard_device.jpg', 'in use', 17, 5, 17, '0000-00-00 00:00:00', 'imustofa', '2021-02-07 20:37:28', 'imustofa', '2021-02-07 20:37:28', 0),
(41, 7, '3317/2021/UPS/35', '3.05.02.06.017.049', 2020, 'Prolink', 'PRO1201SFCU', '553801203600687', 'Hitam', '<p>Pengadaan Kabupaten</p>', './assets/images/device_photos/standard_device.jpg', 'in use', 22, 6, 23, '2021-02-07 20:45:02', 'imustofa', '2021-02-07 20:38:27', 'imustofa', '2021-02-07 20:45:02', 1),
(42, 10, '3317/2021/LPT/36', '3.10.01.02.002.018', 2010, 'Lenovo', 'ThinkPad T420', 'PB-CKVK5', 'Hitam', '', './assets/images/device_photos/standard_device.jpg', 'in use', 0, 0, 34, '2021-02-25 15:01:07', 'imustofa', '2021-02-25 14:59:22', 'imustofa', '2021-02-25 15:01:07', 1),
(43, 10, '3317/2021/LPT/37', '3.10.01.02.002.006', 2010, 'Lenovo', 'ThinkPad L412', 'LR-XLVHH', 'Hitam', '', './assets/images/device_photos/standard_device.jpg', 'in use', 0, 0, 27, '0000-00-00 00:00:00', 'imustofa', '2021-02-25 15:02:17', 'imustofa', '2021-02-25 15:02:17', 0),
(44, 10, '3317/2021/LPT/38', '3.10.01.02.002.010', 2010, 'Lenovo', 'ThinkPad L412', 'LR-XGEBF', 'Hitam', '', './assets/images/device_photos/standard_device.jpg', 'in use', 0, 0, 33, '0000-00-00 00:00:00', 'imustofa', '2021-02-25 15:03:28', 'imustofa', '2021-02-25 15:03:28', 0),
(45, 10, '3317/2021/LPT/39', '3.10.01.02.002.013', 2010, 'Lenovo', 'ThinkPad L412', 'LR-XGARF', 'Hitam', '', './assets/images/device_photos/standard_device.jpg', 'in use', 0, 0, 35, '0000-00-00 00:00:00', 'imustofa', '2021-02-25 15:04:13', 'imustofa', '2021-02-25 15:04:13', 0),
(46, 10, '3317/2021/LPT/40', '-', 2014, 'Lenovo', 'G40-80', 'PF09JJPE', 'Hitam', '', './assets/images/device_photos/standard_device.jpg', 'new', 0, 0, 32, '0000-00-00 00:00:00', 'imustofa', '2021-02-25 15:05:44', 'imustofa', '2021-02-25 15:05:44', 0),
(47, 10, '3317/2021/LPT/41', '-', 2014, 'Lenovo', 'G40-45', 'PF0EG3FK', 'Hitam', '', './assets/images/device_photos/standard_device.jpg', 'in use', 0, 0, 29, '0000-00-00 00:00:00', 'imustofa', '2021-02-25 15:06:40', 'imustofa', '2021-02-25 15:06:40', 0),
(48, 10, '3317/2021/LPT/42', '-', 2014, 'Toshiba', 'Sattelite C800', '3D057244C', 'Hitam', '', './assets/images/device_photos/standard_device.jpg', 'in use', 0, 0, 26, '0000-00-00 00:00:00', 'imustofa', '2021-02-25 15:07:40', 'imustofa', '2021-02-25 15:07:40', 0),
(49, 10, '3317/2021/LPT/43', '3.10.01.02.002.022', 2018, 'Lenovo', 'Ideapad 320', 'PF0Z8DL4', 'Silver', '', './assets/images/device_photos/standard_device.jpg', 'in use', 0, 0, 36, '0000-00-00 00:00:00', 'imustofa', '2021-02-25 15:08:46', 'imustofa', '2021-02-25 15:08:46', 0),
(50, 10, '3317/2021/LPT/44', '3.10.01.02.002.023', 2018, 'HP', 'HP14', 'CG8331RDT', 'Silver', '', './assets/images/device_photos/standard_device.jpg', 'in use', 0, 0, 24, '0000-00-00 00:00:00', 'imustofa', '2021-02-25 15:09:33', 'imustofa', '2021-02-25 15:09:33', 0),
(51, 10, '3317/2021/LPT/45', '3.10.01.02.002.024', 2018, 'Acer', 'Swift Blue', 'NXGYNSN001832015D56600', 'Biru', '', './assets/images/device_photos/standard_device.jpg', 'new', 0, 0, 30, '0000-00-00 00:00:00', 'imustofa', '2021-02-25 15:10:29', 'imustofa', '2021-02-25 15:10:29', 0),
(52, 10, '3317/2021/LPT/46', '3.10.01.02.002.025', 2018, 'HP', 'Swift Blue', 'NXGYNSN001827065576600', 'Biru', '', './assets/images/device_photos/standard_device.jpg', 'in use', 0, 0, 9, '0000-00-00 00:00:00', 'imustofa', '2021-02-25 15:11:09', 'imustofa', '2021-02-25 15:11:09', 0),
(53, 10, '3317/2021/LPT/47', '3.10.01.02.002.004', 2018, 'HP', 'Business Notebook 348 G4', '5CG8482T88', 'Silver', '', './assets/images/device_photos/standard_device.jpg', 'in use', 0, 0, 8, '0000-00-00 00:00:00', 'imustofa', '2021-02-25 15:16:23', 'imustofa', '2021-02-25 15:16:23', 0);

-- --------------------------------------------------------

--
-- Table structure for table `device_type`
--

CREATE TABLE `device_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(30) NOT NULL COMMENT 'Device Type Name',
  `type_code` varchar(30) NOT NULL COMMENT 'Device Type Code',
  `active` enum('yes','no') NOT NULL DEFAULT 'yes' COMMENT 'Device Type Active Status',
  `created_by` varchar(30) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `updated_date` datetime NOT NULL,
  `revision` tinyint(3) NOT NULL DEFAULT 0 COMMENT 'Total Device Type Changes'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `device_type`
--

INSERT INTO `device_type` (`type_id`, `type_name`, `type_code`, `active`, `created_by`, `created_date`, `updated_by`, `updated_date`, `revision`) VALUES
(1, 'Monitor', 'MTR', 'yes', 'admin', '2016-01-19 15:35:01', 'admin', '2016-02-17 10:43:01', 2),
(2, 'Mouse', 'MSE', 'yes', 'admin', '2016-01-19 15:37:36', 'admin', '2016-01-19 15:37:36', 0),
(3, 'Keyboard', 'KBD', 'yes', 'admin', '2016-01-19 15:37:45', 'admin', '2016-02-17 10:43:11', 2),
(4, 'Personal Computer', 'PC', 'yes', 'admin', '2016-01-19 15:38:01', 'admin', '2016-01-19 15:38:01', 0),
(5, 'Printer', 'PRT', 'yes', 'admin', '2016-01-19 15:38:15', 'admin', '2016-01-19 15:38:15', 0),
(6, 'Harddisk external', 'HDX', 'yes', 'admin', '2016-05-20 07:24:50', 'admin', '2016-06-07 11:02:05', 2),
(7, 'Ups', 'UPS', 'yes', 'admin', '2016-11-11 09:20:17', 'admin', '2016-11-11 10:37:48', 2),
(8, 'Switch', 'SWT', 'yes', 'admin', '2016-11-12 12:11:51', 'admin', '2016-11-12 12:11:51', 0),
(9, 'Global Positioning System', 'GPS', 'yes', 'imustofa', '2021-02-04 20:36:26', 'imustofa', '2021-02-04 20:36:26', 0),
(10, 'Laptop', 'LPT', 'yes', 'imustofa', '2021-02-06 14:08:49', 'imustofa', '2021-02-06 14:09:47', 0),
(11, 'Scaner', 'SCN', 'yes', 'imustofa', '2021-02-07 20:02:05', 'imustofa', '2021-02-07 20:02:05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `location_name` varchar(30) NOT NULL COMMENT 'Location Name',
  `location_photo` text DEFAULT NULL COMMENT 'Location Photo - If available',
  `active` enum('yes','no') NOT NULL DEFAULT 'yes' COMMENT 'Location Active Status',
  `created_by` varchar(30) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `updated_date` datetime NOT NULL,
  `revision` tinyint(3) NOT NULL DEFAULT 0 COMMENT 'Total Device Type Changes'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `location_name`, `location_photo`, `active`, `created_by`, `created_date`, `updated_by`, `updated_date`, `revision`) VALUES
(5, 'Imam Mustofa', NULL, 'yes', 'imustofa', '2021-02-06 23:48:29', 'imustofa', '2021-02-06 23:48:29', 0),
(6, 'M. Dwi Priyanto', NULL, 'yes', 'imustofa', '2021-02-07 13:18:59', 'imustofa', '2021-02-07 13:18:59', 0),
(7, 'Henri Wagiyanto', NULL, 'yes', 'imustofa', '2021-02-07 13:19:30', 'imustofa', '2021-02-07 13:19:30', 0),
(8, 'Muncar Cahyono', NULL, 'yes', 'imustofa', '2021-02-07 13:19:47', 'imustofa', '2021-02-07 13:19:47', 0),
(9, 'Moh. Asrori', NULL, 'yes', 'imustofa', '2021-02-07 13:20:03', 'imustofa', '2021-02-07 13:20:03', 0),
(10, 'Suci Ismadyaliana', NULL, 'yes', 'imustofa', '2021-02-07 13:20:21', 'imustofa', '2021-02-07 13:20:21', 0),
(11, 'Erlinda', NULL, 'yes', 'imustofa', '2021-02-07 13:20:31', 'imustofa', '2021-02-07 13:20:31', 0),
(12, 'Herhardana', NULL, 'yes', 'imustofa', '2021-02-07 13:20:50', 'imustofa', '2021-02-07 13:20:50', 0),
(13, 'Senthir Bawono', NULL, 'yes', 'imustofa', '2021-02-07 13:21:01', 'imustofa', '2021-02-07 13:21:01', 0),
(14, 'Faisal Luthfi Arief', NULL, 'yes', 'imustofa', '2021-02-07 13:21:23', 'imustofa', '2021-02-07 13:21:23', 0),
(15, 'Sumitro', NULL, 'yes', 'imustofa', '2021-02-07 13:21:31', 'imustofa', '2021-02-07 13:21:31', 0),
(16, 'Dhinata Hindra S', NULL, 'yes', 'imustofa', '2021-02-07 13:21:47', 'imustofa', '2021-02-07 13:21:47', 0),
(17, 'Mustaqhwiroh', NULL, 'yes', 'imustofa', '2021-02-07 13:22:00', 'imustofa', '2021-02-07 13:22:00', 0),
(18, 'Nanda Ilyas Syukur', NULL, 'yes', 'imustofa', '2021-02-07 13:22:26', 'imustofa', '2021-02-07 13:22:26', 0),
(19, 'Wahyu Sri Lestari', NULL, 'yes', 'imustofa', '2021-02-07 13:22:36', 'imustofa', '2021-02-07 13:22:36', 0),
(20, 'Miyan Andi Irawan', NULL, 'yes', 'imustofa', '2021-02-07 13:22:46', 'imustofa', '2021-02-07 13:22:46', 0),
(21, 'Respati Adi Wicaksono', NULL, 'yes', 'imustofa', '2021-02-07 13:23:00', 'imustofa', '2021-02-07 13:23:00', 0),
(22, 'Sri Rejeki', NULL, 'yes', 'imustofa', '2021-02-07 13:23:07', 'imustofa', '2021-02-07 13:23:07', 0),
(23, 'Khaerul Anwar', NULL, 'yes', 'imustofa', '2021-02-07 13:23:21', 'imustofa', '2021-02-07 13:23:21', 0),
(24, 'Sukaryo', NULL, 'yes', 'imustofa', '2021-02-07 13:23:56', 'imustofa', '2021-02-07 13:23:56', 0),
(25, 'Muhamad Buchori', NULL, 'yes', 'imustofa', '2021-02-07 13:24:13', 'imustofa', '2021-02-07 13:24:13', 0),
(26, 'Gani Sri Anawati', NULL, 'yes', 'imustofa', '2021-02-07 13:24:24', 'imustofa', '2021-02-07 13:24:24', 0),
(27, 'Adi M. Umar', NULL, 'yes', 'imustofa', '2021-02-07 13:24:38', 'imustofa', '2021-02-07 13:24:38', 0),
(28, 'Ekha Jaya P', NULL, 'yes', 'imustofa', '2021-02-07 13:24:50', 'imustofa', '2021-02-07 13:24:50', 0),
(29, 'Roni Rijanto', NULL, 'yes', 'imustofa', '2021-02-07 13:25:00', 'imustofa', '2021-02-07 13:25:00', 0),
(30, 'Zakaria', NULL, 'yes', 'imustofa', '2021-02-07 13:25:07', 'imustofa', '2021-02-07 13:25:07', 0),
(31, 'Sophan Hidayatna', NULL, 'yes', 'imustofa', '2021-02-07 13:25:25', 'imustofa', '2021-02-07 13:25:25', 0),
(32, 'Mochtar Rahmadi', NULL, 'yes', 'imustofa', '2021-02-07 13:25:37', 'imustofa', '2021-02-07 13:25:37', 0),
(33, 'Didik Permono', NULL, 'yes', 'imustofa', '2021-02-07 13:25:45', 'imustofa', '2021-02-07 13:25:45', 0),
(34, 'Amir Murtono', NULL, 'yes', 'imustofa', '2021-02-07 13:25:54', 'imustofa', '2021-02-07 13:25:54', 0),
(35, 'Kristiyanti', NULL, 'yes', 'imustofa', '2021-02-07 13:26:06', 'imustofa', '2021-02-07 13:26:06', 0),
(36, 'Slamet Purwoko', NULL, 'yes', 'imustofa', '2021-02-07 13:26:16', 'imustofa', '2021-02-07 13:26:16', 0),
(37, 'Agus Susanto', NULL, 'yes', 'imustofa', '2021-02-07 13:52:06', 'imustofa', '2021-02-07 13:52:06', 0),
(38, 'Winarso', NULL, 'yes', 'imustofa', '2021-02-07 13:57:11', 'imustofa', '2021-02-07 13:57:11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `location_building`
--

CREATE TABLE `location_building` (
  `building_id` int(11) NOT NULL,
  `building_name` varchar(30) NOT NULL,
  `active` enum('yes','no') NOT NULL DEFAULT 'yes',
  `created_by` varchar(30) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `updated_date` datetime NOT NULL,
  `revision` tinyint(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location_building`
--

INSERT INTO `location_building` (`building_id`, `building_name`, `active`, `created_by`, `created_date`, `updated_by`, `updated_date`, `revision`) VALUES
(12, 'TU', 'yes', 'imustofa', '2021-02-06 14:45:19', 'imustofa', '2021-02-06 14:45:19', 0),
(13, 'Kepala', 'yes', 'imustofa', '2021-02-06 14:45:24', 'imustofa', '2021-02-06 14:45:24', 0),
(14, 'PST', 'yes', 'imustofa', '2021-02-06 14:45:31', 'imustofa', '2021-02-06 14:45:31', 0),
(15, 'IPDS', 'yes', 'imustofa', '2021-02-06 14:45:36', 'imustofa', '2021-02-06 14:45:36', 0),
(16, 'Server', 'yes', 'imustofa', '2021-02-06 14:45:58', 'imustofa', '2021-02-06 14:45:58', 0),
(17, 'Teknis', 'yes', 'imustofa', '2021-02-06 14:46:05', 'imustofa', '2021-02-06 14:46:05', 0),
(18, 'Aula', 'yes', 'imustofa', '2021-02-06 14:46:12', 'imustofa', '2021-02-06 14:46:12', 0),
(19, 'CAN', 'yes', 'imustofa', '2021-02-06 14:46:27', 'imustofa', '2021-02-06 14:46:27', 0),
(20, 'Resepsionis', 'yes', 'imustofa', '2021-02-06 14:46:35', 'imustofa', '2021-02-06 14:46:35', 0),
(21, 'Lorong', 'yes', 'imustofa', '2021-02-06 14:46:40', 'imustofa', '2021-02-06 14:46:40', 0),
(22, 'Pengolahan', 'yes', 'imustofa', '2021-02-07 20:39:48', 'imustofa', '2021-02-07 20:39:48', 0);

-- --------------------------------------------------------

--
-- Table structure for table `location_details`
--

CREATE TABLE `location_details` (
  `detail_id` int(15) NOT NULL,
  `location_id` int(11) NOT NULL COMMENT 'FK location',
  `place_id` int(11) NOT NULL COMMENT 'FK place',
  `building_id` int(11) NOT NULL COMMENT 'FK building',
  `floor_id` int(11) NOT NULL COMMENT 'FK floor',
  `active` enum('yes','no') NOT NULL DEFAULT 'yes',
  `created_by` varchar(30) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `updated_date` datetime NOT NULL,
  `revision` tinyint(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location_details`
--

INSERT INTO `location_details` (`detail_id`, `location_id`, `place_id`, `building_id`, `floor_id`, `active`, `created_by`, `created_date`, `updated_by`, `updated_date`, `revision`) VALUES
(5, 5, 0, 0, 0, 'yes', 'imustofa', '2021-02-06 23:48:29', 'imustofa', '2021-02-06 23:48:29', 0),
(6, 6, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:19:00', 'imustofa', '2021-02-07 13:19:00', 0),
(7, 7, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:19:31', 'imustofa', '2021-02-07 13:19:31', 0),
(8, 8, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:19:47', 'imustofa', '2021-02-07 13:19:47', 0),
(9, 9, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:20:03', 'imustofa', '2021-02-07 13:20:03', 0),
(10, 10, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:20:21', 'imustofa', '2021-02-07 13:20:21', 0),
(11, 11, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:20:31', 'imustofa', '2021-02-07 13:20:31', 0),
(12, 12, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:20:50', 'imustofa', '2021-02-07 13:20:50', 0),
(13, 13, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:21:01', 'imustofa', '2021-02-07 13:21:01', 0),
(14, 14, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:21:23', 'imustofa', '2021-02-07 13:21:23', 0),
(15, 15, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:21:32', 'imustofa', '2021-02-07 13:21:32', 0),
(16, 16, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:21:47', 'imustofa', '2021-02-07 13:21:47', 0),
(17, 17, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:22:00', 'imustofa', '2021-02-07 13:22:00', 0),
(18, 18, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:22:26', 'imustofa', '2021-02-07 13:22:26', 0),
(19, 19, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:22:36', 'imustofa', '2021-02-07 13:22:36', 0),
(20, 20, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:22:46', 'imustofa', '2021-02-07 13:22:46', 0),
(21, 21, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:23:00', 'imustofa', '2021-02-07 13:23:00', 0),
(22, 22, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:23:07', 'imustofa', '2021-02-07 13:23:07', 0),
(23, 23, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:23:21', 'imustofa', '2021-02-07 13:23:21', 0),
(24, 24, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:23:57', 'imustofa', '2021-02-07 13:23:57', 0),
(25, 25, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:24:13', 'imustofa', '2021-02-07 13:24:13', 0),
(26, 26, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:24:24', 'imustofa', '2021-02-07 13:24:24', 0),
(27, 27, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:24:38', 'imustofa', '2021-02-07 13:24:38', 0),
(28, 28, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:24:50', 'imustofa', '2021-02-07 13:24:50', 0),
(29, 29, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:25:01', 'imustofa', '2021-02-07 13:25:01', 0),
(30, 30, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:25:07', 'imustofa', '2021-02-07 13:25:07', 0),
(31, 31, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:25:25', 'imustofa', '2021-02-07 13:25:25', 0),
(32, 32, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:25:37', 'imustofa', '2021-02-07 13:25:37', 0),
(33, 33, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:25:45', 'imustofa', '2021-02-07 13:25:45', 0),
(34, 34, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:25:54', 'imustofa', '2021-02-07 13:25:54', 0),
(35, 35, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:26:06', 'imustofa', '2021-02-07 13:26:06', 0),
(36, 36, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:26:16', 'imustofa', '2021-02-07 13:26:16', 0),
(37, 37, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:52:07', 'imustofa', '2021-02-07 13:52:07', 0),
(38, 38, 0, 0, 0, 'yes', 'imustofa', '2021-02-07 13:57:11', 'imustofa', '2021-02-07 13:57:11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `location_floor`
--

CREATE TABLE `location_floor` (
  `floor_id` int(11) NOT NULL,
  `floor_name` varchar(30) NOT NULL,
  `active` enum('yes','no') NOT NULL DEFAULT 'yes',
  `created_by` varchar(30) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `updated_date` datetime NOT NULL,
  `revision` tinyint(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location_floor`
--

INSERT INTO `location_floor` (`floor_id`, `floor_name`, `active`, `created_by`, `created_date`, `updated_by`, `updated_date`, `revision`) VALUES
(1, 'Lantai 1', 'no', 'admin', '2016-10-31 13:46:37', 'admin', '2021-01-28 23:34:11', 2);

-- --------------------------------------------------------

--
-- Table structure for table `location_place`
--

CREATE TABLE `location_place` (
  `place_id` int(11) NOT NULL,
  `place_name` varchar(30) NOT NULL,
  `active` enum('yes','no') NOT NULL DEFAULT 'yes',
  `created_by` varchar(30) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `updated_date` datetime NOT NULL,
  `revision` tinyint(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location_place`
--

INSERT INTO `location_place` (`place_id`, `place_name`, `active`, `created_by`, `created_date`, `updated_by`, `updated_date`, `revision`) VALUES
(3, 'Tata Usaha', 'yes', 'imustofa', '2021-02-06 14:47:02', 'imustofa', '2021-02-06 14:47:02', 0),
(4, 'Sosial', 'yes', 'imustofa', '2021-02-06 14:47:08', 'imustofa', '2021-02-06 14:47:08', 0),
(5, 'Produksi', 'yes', 'imustofa', '2021-02-06 14:47:14', 'imustofa', '2021-02-06 14:47:14', 0),
(6, 'IPDS', 'yes', 'imustofa', '2021-02-06 14:47:20', 'imustofa', '2021-02-06 14:47:20', 0),
(7, 'Distribusi', 'yes', 'imustofa', '2021-02-06 14:47:26', 'imustofa', '2021-02-06 14:47:26', 0),
(8, 'Nerwilis', 'yes', 'imustofa', '2021-02-06 14:47:50', 'imustofa', '2021-02-06 14:47:50', 0),
(9, 'Kepala', 'yes', 'imustofa', '2021-02-06 14:47:56', 'imustofa', '2021-02-06 14:47:56', 0),
(10, 'KSK', 'yes', 'imustofa', '2021-02-07 11:17:02', 'imustofa', '2021-02-07 11:17:02', 0),
(11, 'Zoom', 'yes', 'imustofa', '2021-02-07 13:52:54', 'imustofa', '2021-02-07 13:52:54', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `RecId` int(11) NOT NULL,
  `OpsiLoginId` int(11) NOT NULL,
  `Username` text NOT NULL,
  `Email` text NOT NULL,
  `Nama` text NOT NULL,
  `UrlPicture` text NOT NULL,
  `SatkerId` int(11) NOT NULL,
  `OrganisasiId` int(11) NOT NULL,
  `IsAktif` enum('0','1','','') NOT NULL DEFAULT '0',
  `IsAdmin` int(11) NOT NULL DEFAULT 0,
  `AtasanId` int(11) NOT NULL,
  `NipBaru` text NOT NULL,
  `Jabatan` text NOT NULL,
  `NipLama` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`RecId`, `OpsiLoginId`, `Username`, `Email`, `Nama`, `UrlPicture`, `SatkerId`, `OrganisasiId`, `IsAktif`, `IsAdmin`, `AtasanId`, `NipBaru`, `Jabatan`, `NipLama`) VALUES
(0, 3, '', 'achiruzaman@bps.go.id', 'Mohamad Achiruzaman S.ST, M.T', 'https://community.bps.go.id/images/avatar/340053328_20190724105413.jpg', 0, 0, '0', 0, 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `RecId` int(11) NOT NULL,
  `Role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`RecId`, `Role`) VALUES
(1, 'Admin'),
(2, 'Biasa');

-- --------------------------------------------------------

--
-- Table structure for table `role_pengguna`
--

CREATE TABLE `role_pengguna` (
  `RecId` int(11) NOT NULL,
  `RoleId` int(11) NOT NULL,
  `PenggunaId` int(11) NOT NULL,
  `Cakupan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `system_logs`
--

CREATE TABLE `system_logs` (
  `log_id` int(11) NOT NULL,
  `log_date` datetime NOT NULL COMMENT 'Date',
  `username` varchar(30) NOT NULL COMMENT 'Username',
  `description` text NOT NULL COMMENT 'Log Descriptions'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_logs`
--

INSERT INTO `system_logs` (`log_id`, `log_date`, `username`, `description`) VALUES
(1, '2021-01-28 23:27:29', 'admin', 'admin update data :  setting_value=\'disable\' where  setting_name=\'location_details\' from system_settings table on 2021/01/28 23:27:29'),
(2, '2021-01-28 23:27:38', 'admin', 'admin update data :  setting_value=\'enable\' where  setting_name=\'location_details\' from system_settings table on 2021/01/28 23:27:38'),
(3, '2021-01-28 23:27:44', 'admin', 'admin update data :  setting_value=\'site-mint.min.css\' where  setting_name=\'color_scheme\' from system_settings table on 2021/01/28 23:27:44'),
(4, '2021-01-28 23:33:45', 'admin', 'admin update data :  active=\'no\' where  location_id=\'1\' from location table on 2021/01/28 23:33:45'),
(5, '2021-01-28 23:33:55', 'admin', 'admin update data :  active=\'yes\' where  location_id=\'1\' from location table on 2021/01/28 23:33:55'),
(6, '2021-01-28 23:34:02', 'admin', 'admin update data :  active=\'no\' where  floor_id=\'3\' from location_floor table on 2021/01/28 23:34:02'),
(7, '2021-01-28 23:34:07', 'admin', 'admin update data :  active=\'no\' where  floor_id=\'2\' from location_floor table on 2021/01/28 23:34:07'),
(8, '2021-01-28 23:34:12', 'admin', 'admin update data :  active=\'no\' where  floor_id=\'1\' from location_floor table on 2021/01/28 23:34:12'),
(9, '2021-01-28 23:38:35', 'admin', 'admin update data :  first_name=\'Noerman\', last_name=\'Agustiyan\', password=\'new password\', salt=\'new salt\',  updated_by=\'admin\', updated_date=NOW(), revision = revision+1  where  username = \'anoerman\' from users table on 2021/01/28 23:38:35'),
(10, '2021-01-28 23:38:35', 'admin', 'admin update data :  privileges=\'5,6,7\' where  username=\'anoerman\' from user_privileges table on 2021/01/28 23:38:35'),
(11, '2021-01-28 23:42:59', 'admin', 'admin update data :  setting_value=\'3317/year/devtype\' where  setting_name=\'device_code_format\' from system_settings table on 2021/01/28 23:42:59'),
(12, '2021-02-01 20:29:59', 'admin', 'admin insert new data into the users table on 2021/02/01 20:29:59'),
(13, '2021-02-01 20:29:59', 'admin', 'admin insert new data into the user_privileges table on 2021/02/01 20:29:59'),
(14, '2021-02-01 20:30:27', 'admin', 'admin update data :  active=\'no\' where  username=\'anoerman\' from users table on 2021/02/01 20:30:27'),
(15, '2021-02-01 20:30:33', 'admin', 'admin update data :  active=\'yes\' where  username=\'anoerman\' from users table on 2021/02/01 20:30:33'),
(16, '2021-02-01 20:30:38', 'admin', 'admin update data :  active=\'no\' where  username=\'anoerman\' from users table on 2021/02/01 20:30:38'),
(17, '2021-02-01 20:46:43', 'imustofa', 'imustofa update data :  setting_value=\'Sistem Informasi Peralatan TIK\' where  setting_name=\'inventory_name\' from system_settings table on 2021/02/01 20:46:43'),
(18, '2021-02-02 00:33:47', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/02 00:33:47'),
(19, '2021-02-04 19:32:33', 'imustofa', 'imustofa update data :  setting_value=\'Sistem Manajemen Peralatan TI\' where  setting_name=\'inventory_name\' from system_settings table on 2021/02/04 19:32:33'),
(20, '2021-02-04 19:32:33', 'imustofa', 'imustofa update data :  setting_value=\'<p><strong>General Inventory is still under construction!</strong></p>\' where  setting_name=\'inventory_description\' from system_settings table on 2021/02/04 19:32:33'),
(21, '2021-02-04 19:37:21', 'imustofa', 'imustofa update data :  setting_value=\'<p><em>Sistem Informasi dan Manajemen Peralatan Elektronik yang Berhubungan Dengan Teknologi Informasi. Adanya Sistem Ini Diharapkan Segala Tentang Peralatan Dapat Diketahui Baik Keberadaan Maupun Kondisi.</em></p>\' where  setting_name=\'inventory_description\' from system_settings table on 2021/02/04 19:37:21'),
(22, '2021-02-04 19:37:21', 'imustofa', 'imustofa update data :  setting_value=\'<p>IPDS BPS Kabupaten Rembang</p>\' where  setting_name=\'inventory_location\' from system_settings table on 2021/02/04 19:37:21'),
(23, '2021-02-04 19:37:21', 'imustofa', 'imustofa update data :  setting_value=\'(0295) 691040\' where  setting_name=\'inventory_phone_number\' from system_settings table on 2021/02/04 19:37:21'),
(24, '2021-02-04 19:37:21', 'imustofa', 'imustofa update data :  setting_value=\'(0295) 691040\' where  setting_name=\'inventory_fax_number\' from system_settings table on 2021/02/04 19:37:21'),
(25, '2021-02-04 19:37:21', 'imustofa', 'imustofa update data :  setting_value=\'ipds3317@bps.go.id\' where  setting_name=\'inventory_email\' from system_settings table on 2021/02/04 19:37:21'),
(26, '2021-02-04 19:37:21', 'imustofa', 'imustofa update data :  setting_value=\'rembangkab.bps.go.id\' where  setting_name=\'inventory_website\' from system_settings table on 2021/02/04 19:37:21'),
(27, '2021-02-04 19:37:53', 'imustofa', 'imustofa update data :  setting_value=\'<p><strong>IPDS BPS Kabupaten Rembang</strong></p>\' where  setting_name=\'inventory_location\' from system_settings table on 2021/02/04 19:37:53'),
(28, '2021-02-04 19:37:53', 'imustofa', 'imustofa update data :  setting_value=\'site-aqua.min.css\' where  setting_name=\'color_scheme\' from system_settings table on 2021/02/04 19:37:53'),
(29, '2021-02-04 19:38:39', 'imustofa', 'imustofa update data :  updated_by=\'imustofa\', updated_date=NOW(), revision=revision+1  where  setting_name=\'inventory_logo\' from system_settings table on 2021/02/04 19:38:39'),
(30, '2021-02-04 19:40:33', 'imustofa', 'imustofa update data :  updated_by=\'imustofa\', updated_date=NOW(), revision=revision+1  where  setting_name=\'inventory_logo\' from system_settings table on 2021/02/04 19:40:33'),
(31, '2021-02-04 19:55:26', 'imustofa', 'imustofa insert new data into the component table on 2021/02/04 19:55:26'),
(32, '2021-02-05 19:17:47', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/05 19:17:47'),
(33, '2021-02-05 20:21:10', 'imustofa', 'imustofa insert new data into the users table on 2021/02/05 20:21:10'),
(34, '2021-02-05 20:21:10', 'imustofa', 'imustofa insert new data into the user_privileges table on 2021/02/05 20:21:10'),
(35, '2021-02-06 12:44:27', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2014\',\n							device_bmn = \'\',\n							device_brand = \'DELL\', \n							device_model = \'Optiplex 3090\', \n							device_color = \'Hitam\', \n							device_serial = \'444GHVB8\', \n							device_description = \'<p>Pengadaan Pusat</p>\', \n							  \n							device_status = \'in use\', \n							location_id = \'1\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'5\'  from device_list table on 2021/02/06 12:44:27'),
(36, '2021-02-06 14:02:29', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2014\',\n							device_bmn = \'ggffff\',\n							device_brand = \'DELL\', \n							device_model = \'Optiplex 3090\', \n							device_color = \'Hitam\', \n							device_serial = \'444GHVB8\', \n							device_description = \'<p>Pengadaan Pusat</p>\', \n							  \n							device_status = \'in use\', \n							location_id = \'1\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'5\'  from device_list table on 2021/02/06 14:02:29'),
(37, '2021-02-06 14:24:26', 'imustofa', 'imustofa insert new data into the location_building table on 2021/02/06 14:24:26'),
(38, '2021-02-06 14:25:10', 'imustofa', 'imustofa insert new data into the location_building table on 2021/02/06 14:25:10'),
(39, '2021-02-06 14:25:18', 'imustofa', 'imustofa insert new data into the location_building table on 2021/02/06 14:25:18'),
(40, '2021-02-06 14:25:29', 'imustofa', 'imustofa insert new data into the location_building table on 2021/02/06 14:25:29'),
(41, '2021-02-06 14:25:38', 'imustofa', 'imustofa insert new data into the location_building table on 2021/02/06 14:25:38'),
(42, '2021-02-06 14:25:44', 'imustofa', 'imustofa insert new data into the location_building table on 2021/02/06 14:25:44'),
(43, '2021-02-06 14:25:59', 'imustofa', 'imustofa insert new data into the location_building table on 2021/02/06 14:25:59'),
(44, '2021-02-06 14:26:06', 'imustofa', 'imustofa insert new data into the location_building table on 2021/02/06 14:26:06'),
(45, '2021-02-06 14:26:53', 'imustofa', 'imustofa insert new data into the location_building table on 2021/02/06 14:26:53'),
(46, '2021-02-06 14:39:19', 'admin', 'admin insert new data into the users table on 2021/02/06 14:39:19'),
(47, '2021-02-06 14:43:34', 'admin', 'admin insert new data into the users table on 2021/02/06 14:43:34'),
(48, '2021-02-06 14:43:35', 'admin', 'admin insert new data into the user_privileges table on 2021/02/06 14:43:35'),
(49, '2021-02-06 14:45:19', 'imustofa', 'imustofa insert new data into the location_building table on 2021/02/06 14:45:19'),
(50, '2021-02-06 14:45:24', 'imustofa', 'imustofa insert new data into the location_building table on 2021/02/06 14:45:24'),
(51, '2021-02-06 14:45:31', 'imustofa', 'imustofa insert new data into the location_building table on 2021/02/06 14:45:31'),
(52, '2021-02-06 14:45:36', 'imustofa', 'imustofa insert new data into the location_building table on 2021/02/06 14:45:36'),
(53, '2021-02-06 14:45:58', 'imustofa', 'imustofa insert new data into the location_building table on 2021/02/06 14:45:58'),
(54, '2021-02-06 14:46:05', 'imustofa', 'imustofa insert new data into the location_building table on 2021/02/06 14:46:05'),
(55, '2021-02-06 14:46:12', 'imustofa', 'imustofa insert new data into the location_building table on 2021/02/06 14:46:12'),
(56, '2021-02-06 14:46:27', 'imustofa', 'imustofa insert new data into the location_building table on 2021/02/06 14:46:27'),
(57, '2021-02-06 14:46:35', 'imustofa', 'imustofa insert new data into the location_building table on 2021/02/06 14:46:35'),
(58, '2021-02-06 14:46:40', 'imustofa', 'imustofa insert new data into the location_building table on 2021/02/06 14:46:40'),
(59, '2021-02-06 14:47:02', 'imustofa', 'imustofa insert new data into the location_place table on 2021/02/06 14:47:02'),
(60, '2021-02-06 14:47:08', 'imustofa', 'imustofa insert new data into the location_place table on 2021/02/06 14:47:08'),
(61, '2021-02-06 14:47:14', 'imustofa', 'imustofa insert new data into the location_place table on 2021/02/06 14:47:14'),
(62, '2021-02-06 14:47:20', 'imustofa', 'imustofa insert new data into the location_place table on 2021/02/06 14:47:20'),
(63, '2021-02-06 14:47:26', 'imustofa', 'imustofa insert new data into the location_place table on 2021/02/06 14:47:26'),
(64, '2021-02-06 14:47:50', 'imustofa', 'imustofa insert new data into the location_place table on 2021/02/06 14:47:50'),
(65, '2021-02-06 14:47:56', 'imustofa', 'imustofa insert new data into the location_place table on 2021/02/06 14:47:56'),
(66, '2021-02-06 16:10:49', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/06 16:10:49'),
(67, '2021-02-06 20:46:14', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/06 20:46:14'),
(68, '2021-02-06 20:51:36', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/06 20:51:36'),
(69, '2021-02-06 20:52:31', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/06 20:52:31'),
(70, '2021-02-06 20:54:12', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/06 20:54:12'),
(71, '2021-02-06 20:55:17', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/06 20:55:17'),
(72, '2021-02-06 21:05:25', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/06 21:05:25'),
(73, '2021-02-06 21:06:28', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/06 21:06:28'),
(74, '2021-02-06 21:07:09', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/06 21:07:09'),
(75, '2021-02-06 21:08:09', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/06 21:08:09'),
(76, '2021-02-06 21:09:09', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/06 21:09:09'),
(77, '2021-02-06 21:09:42', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/06 21:09:42'),
(78, '2021-02-06 21:10:34', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/06 21:10:34'),
(79, '2021-02-06 21:11:20', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/06 21:11:20'),
(80, '2021-02-06 21:13:06', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/06 21:13:06'),
(81, '2021-02-06 21:13:42', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/06 21:13:42'),
(82, '2021-02-06 21:14:18', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/06 21:14:18'),
(83, '2021-02-06 21:14:57', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/06 21:14:57'),
(84, '2021-02-06 21:17:08', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/06 21:17:08'),
(85, '2021-02-06 21:17:42', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/06 21:17:42'),
(86, '2021-02-06 21:18:24', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/06 21:18:24'),
(87, '2021-02-06 22:24:33', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/06 22:24:33'),
(88, '2021-02-06 22:26:31', 'imustofa', 'imustofa update data :  setting_value=\'disable\' where  setting_name=\'location_details\' from system_settings table on 2021/02/06 22:26:31'),
(89, '2021-02-06 22:30:39', 'imustofa', 'imustofa update data :  setting_value=\'enable\' where  setting_name=\'location_details\' from system_settings table on 2021/02/06 22:30:39'),
(90, '2021-02-06 23:01:23', 'imustofa', 'imustofa update data :  setting_value=\'disable\' where  setting_name=\'location_details\' from system_settings table on 2021/02/06 23:01:23'),
(91, '2021-02-06 23:03:39', 'imustofa', 'imustofa update data :  setting_value=\'enable\' where  setting_name=\'location_details\' from system_settings table on 2021/02/06 23:03:39'),
(92, '2021-02-06 23:48:29', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/06 23:48:29'),
(93, '2021-02-07 11:17:02', 'imustofa', 'imustofa insert new data into the location_place table on 2021/02/07 11:17:02'),
(94, '2021-02-07 13:16:35', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.10.01.02.002.037\',\n							device_brand = \'Acer\', \n							device_model = \'ASPIRE 5 A514-52G-547A\', \n							device_color = \'Purple\', \n							device_serial = \'NXHMJSN004034059922N00\', \n							device_description = \'\', \n							  \n							device_status = \'in use\', \n							building_id = \'15\',\n							place_id = \'6\',\n							location_id = \'5\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'18\'  from device_list table on 2021/02/07 13:16:35'),
(95, '2021-02-07 13:19:00', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:19:00'),
(96, '2021-02-07 13:19:31', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:19:31'),
(97, '2021-02-07 13:19:47', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:19:47'),
(98, '2021-02-07 13:20:03', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:20:03'),
(99, '2021-02-07 13:20:21', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:20:21'),
(100, '2021-02-07 13:20:31', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:20:31'),
(101, '2021-02-07 13:20:50', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:20:50'),
(102, '2021-02-07 13:21:01', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:21:01'),
(103, '2021-02-07 13:21:23', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:21:23'),
(104, '2021-02-07 13:21:32', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:21:32'),
(105, '2021-02-07 13:21:47', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:21:47'),
(106, '2021-02-07 13:22:00', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:22:00'),
(107, '2021-02-07 13:22:26', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:22:26'),
(108, '2021-02-07 13:22:36', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:22:36'),
(109, '2021-02-07 13:22:46', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:22:46'),
(110, '2021-02-07 13:23:00', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:23:00'),
(111, '2021-02-07 13:23:07', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:23:07'),
(112, '2021-02-07 13:23:21', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:23:21'),
(113, '2021-02-07 13:23:57', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:23:57'),
(114, '2021-02-07 13:24:13', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:24:13'),
(115, '2021-02-07 13:24:24', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:24:24'),
(116, '2021-02-07 13:24:38', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:24:38'),
(117, '2021-02-07 13:24:50', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:24:50'),
(118, '2021-02-07 13:25:01', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:25:01'),
(119, '2021-02-07 13:25:07', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:25:07'),
(120, '2021-02-07 13:25:25', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:25:25'),
(121, '2021-02-07 13:25:37', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:25:37'),
(122, '2021-02-07 13:25:45', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:25:45'),
(123, '2021-02-07 13:25:54', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:25:54'),
(124, '2021-02-07 13:26:06', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:26:06'),
(125, '2021-02-07 13:26:16', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:26:16'),
(126, '2021-02-07 13:52:07', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:52:07'),
(127, '2021-02-07 13:52:54', 'imustofa', 'imustofa insert new data into the location_place table on 2021/02/07 13:52:54'),
(128, '2021-02-07 13:54:25', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.10.01.02.002.031\',\n							device_brand = \'Lenovo\', \n							device_model = \'Ideapad 5 14IIL05\', \n							device_color = \'Grey\', \n							device_serial = \'MP1VDQLE\', \n							device_description = \'\', \n							  \n							device_status = \'in use\', \n							building_id = \'17\',\n							place_id = \'4\',\n							location_id = \'12\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'6\'  from device_list table on 2021/02/07 13:54:25'),
(129, '2021-02-07 13:54:51', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.10.01.02.002.032\',\n							device_brand = \'Lenovo\', \n							device_model = \'Ideapad 5 14IIL05\', \n							device_color = \'Grey\', \n							device_serial = \'MP1VDBL1\', \n							device_description = \'\', \n							  \n							device_status = \'in use\', \n							building_id = \'13\',\n							place_id = \'9\',\n							location_id = \'7\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'8\'  from device_list table on 2021/02/07 13:54:51'),
(130, '2021-02-07 13:55:53', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.10.01.02.002.033\',\n							device_brand = \'Lenovo\', \n							device_model = \'Ideapad 5 14IIL05\', \n							device_color = \'Grey\', \n							device_serial = \'MP1VDQR9\', \n							device_description = \'\', \n							  \n							device_status = \'in use\', \n							building_id = \'17\',\n							place_id = \'8\',\n							location_id = \'20\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'9\'  from device_list table on 2021/02/07 13:55:53'),
(131, '2021-02-07 13:57:11', 'imustofa', 'imustofa insert new data into the location_details table on 2021/02/07 13:57:11'),
(132, '2021-02-07 13:57:37', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.10.01.02.002.034\',\n							device_brand = \'Lenovo\', \n							device_model = \'Ideapad 5 14IIL05\', \n							device_color = \'Grey\', \n							device_serial = \'MP1VDVSC\', \n							device_description = \'\', \n							  \n							device_status = \'in use\', \n							building_id = \'17\',\n							place_id = \'7\',\n							location_id = \'38\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'10\'  from device_list table on 2021/02/07 13:57:37'),
(133, '2021-02-07 13:58:24', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.10.01.02.002.035\',\n							device_brand = \'Lenovo\', \n							device_model = \'Ideapad 5 14IIL05\', \n							device_color = \'Grey\', \n							device_serial = \'MP1VD94Z\', \n							device_description = \'\', \n							  \n							device_status = \'in use\', \n							building_id = \'17\',\n							place_id = \'5\',\n							location_id = \'15\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'11\'  from device_list table on 2021/02/07 13:58:24'),
(134, '2021-02-07 13:59:26', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.10.01.02.002.036\',\n							device_brand = \'Lenovo\', \n							device_model = \'Ideapad 5 14IIL05\', \n							device_color = \'Grey\', \n							device_serial = \'MP1VD940\', \n							device_description = \'\', \n							  \n							device_status = \'in use\', \n							building_id = \'17\',\n							place_id = \'6\',\n							location_id = \'23\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'12\'  from device_list table on 2021/02/07 13:59:26'),
(135, '2021-02-07 19:53:37', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.10.01.02.002.026\',\n							device_brand = \'Asus\', \n							device_model = \'A412F\', \n							device_color = \'Grey\', \n							device_serial = \'LAN0CV06R066420\', \n							device_description = \'\', \n							  \n							device_status = \'new\', \n							building_id = \'15\',\n							place_id = \'6\',\n							location_id = \'23\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'13\'  from device_list table on 2021/02/07 19:53:37'),
(136, '2021-02-07 19:54:25', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.10.01.02.002.027\',\n							device_brand = \'Asus\', \n							device_model = \'A412F\', \n							device_color = \'Grey\', \n							device_serial = \'L9N0CV21N91540E\', \n							device_description = \'\', \n							  \n							device_status = \'in use\', \n							building_id = \'17\',\n							place_id = \'10\',\n							location_id = \'37\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'14\'  from device_list table on 2021/02/07 19:54:25'),
(137, '2021-02-07 19:54:58', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.10.01.02.002.028\',\n							device_brand = \'Asus\', \n							device_model = \'A412F\', \n							device_color = \'Grey\', \n							device_serial = \'L9N0CV21N88440B\', \n							device_description = \'\', \n							  \n							device_status = \'in use\', \n							building_id = \'12\',\n							place_id = \'3\',\n							location_id = \'10\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'15\'  from device_list table on 2021/02/07 19:54:58'),
(138, '2021-02-07 19:55:31', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.10.01.02.002.029\',\n							device_brand = \'Asus\', \n							device_model = \'A412F\', \n							device_color = \'Grey\', \n							device_serial = \'L9N0CV21N886403\', \n							device_description = \'\', \n							  \n							device_status = \'in use\', \n							building_id = \'15\',\n							place_id = \'10\',\n							location_id = \'31\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'16\'  from device_list table on 2021/02/07 19:55:31'),
(139, '2021-02-07 19:56:09', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.10.01.02.002.030\',\n							device_brand = \'Lenovo\', \n							device_model = \'A412F\', \n							device_color = \'Grey\', \n							device_serial = \'LAN0CV06P982425\', \n							device_description = \'\', \n							  \n							device_status = \'in use\', \n							building_id = \'12\',\n							place_id = \'10\',\n							location_id = \'28\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'17\'  from device_list table on 2021/02/07 19:56:09'),
(140, '2021-02-07 19:56:34', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.10.01.02.002.038\',\n							device_brand = \'Acer\', \n							device_model = \'ASPIRE 5 A514-52G-547A\', \n							device_color = \'Purple\', \n							device_serial = \'NXHMJSN004034058762N00\', \n							device_description = \'\', \n							  \n							device_status = \'in use\', \n							building_id = \'17\',\n							place_id = \'10\',\n							location_id = \'6\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'19\'  from device_list table on 2021/02/07 19:56:34'),
(141, '2021-02-07 19:57:28', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.10.02.03.003.014\',\n							device_brand = \'Canon\', \n							device_model = \'LaserShot LBP 2900\', \n							device_color = \'Putih\', \n							device_serial = \'NMYA451321\', \n							device_description = \'\', \n							  \n							device_status = \'in use\', \n							building_id = \'13\',\n							place_id = \'9\',\n							location_id = \'7\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'20\'  from device_list table on 2021/02/07 19:57:28'),
(142, '2021-02-07 19:57:59', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.10.02.03.003.015\',\n							device_brand = \'Canon\', \n							device_model = \'LaserShot LBP 2900\', \n							device_color = \'Putih\', \n							device_serial = \'NMYA469944\', \n							device_description = \'\', \n							  \n							device_status = \'in use\', \n							building_id = \'17\',\n							place_id = \'8\',\n							location_id = \'20\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'21\'  from device_list table on 2021/02/07 19:57:59'),
(143, '2021-02-07 19:58:25', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.10.02.03.003.016\',\n							device_brand = \'Canon\', \n							device_model = \'LaserShot LBP 2900\', \n							device_color = \'Putih\', \n							device_serial = \'NMYA503429\', \n							device_description = \'\', \n							  \n							device_status = \'in use\', \n							building_id = \'15\',\n							place_id = \'6\',\n							location_id = \'23\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'22\'  from device_list table on 2021/02/07 19:58:25'),
(144, '2021-02-07 19:58:46', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.10.02.03.003.017\',\n							device_brand = \'Epson\', \n							device_model = \'L3110\', \n							device_color = \'Hitam\', \n							device_serial = \'X6NX550316\', \n							device_description = \'\', \n							  \n							device_status = \'in use\', \n							building_id = \'12\',\n							place_id = \'3\',\n							location_id = \'8\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'23\'  from device_list table on 2021/02/07 19:58:46'),
(145, '2021-02-07 20:04:42', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/07 20:04:42'),
(146, '2021-02-07 20:07:23', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/07 20:07:23'),
(147, '2021-02-07 20:07:50', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.10.02.03.004.004\',\n							device_brand = \'Epson\', \n							device_model = \'WorkForce DS-410\', \n							device_color = \'Putih\', \n							device_serial = \'X43E010425\', \n							device_description = \'\', \n							  \n							device_status = \'in use\', \n							building_id = \'17\',\n							place_id = \'5\',\n							location_id = \'15\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'27\'  from device_list table on 2021/02/07 20:07:50'),
(148, '2021-02-07 20:09:57', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/07 20:09:57'),
(149, '2021-02-07 20:11:10', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.05.02.06.017.036\',\n							device_brand = \'Prolink\', \n							device_model = \'PRO1201SFCU\', \n							device_color = \'Hitam\', \n							device_serial = \'553801203600784\', \n							device_description = \'<p>Pengadaan Kabupaten</p>\', \n							  \n							device_status = \'in use\', \n							building_id = \'12\',\n							place_id = \'3\',\n							location_id = \'28\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'26\'  from device_list table on 2021/02/07 20:11:10'),
(150, '2021-02-07 20:11:45', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.05.02.06.017.050\',\n							device_brand = \'ICA\', \n							device_model = \'CE 1200\', \n							device_color = \'Hitam\', \n							device_serial = \'1B1D22017653\', \n							device_description = \'<p>Pengadaan Kabupaten</p>\', \n							  \n							device_status = \'new\', \n							building_id = \'15\',\n							place_id = \'6\',\n							location_id = \'23\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'24\'  from device_list table on 2021/02/07 20:11:45'),
(151, '2021-02-07 20:12:14', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.05.02.06.017.051\',\n							device_brand = \'ICA\', \n							device_model = \'CE 1200\', \n							device_color = \'Hitam\', \n							device_serial = \'1B1D22017684\', \n							device_description = \'<p>Pengadaan Kabupaten</p>\', \n							  \n							device_status = \'new\', \n							building_id = \'15\',\n							place_id = \'6\',\n							location_id = \'23\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'25\'  from device_list table on 2021/02/07 20:12:14'),
(152, '2021-02-07 20:14:00', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/07 20:14:00'),
(153, '2021-02-07 20:15:05', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/07 20:15:05'),
(154, '2021-02-07 20:15:57', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/07 20:15:57'),
(155, '2021-02-07 20:17:05', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/07 20:17:05'),
(156, '2021-02-07 20:26:53', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/07 20:26:53'),
(157, '2021-02-07 20:28:28', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/07 20:28:28'),
(158, '2021-02-07 20:30:14', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/07 20:30:14'),
(159, '2021-02-07 20:30:56', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.05.02.06.017.044\',\n							device_brand = \'Prolink\', \n							device_model = \'PRO1201SFCU\', \n							device_color = \'Hitam\', \n							device_serial = \'553801203600688\', \n							device_description = \'<p>Pengadaan Kabupaten</p>\', \n							  \n							device_status = \'in use\', \n							building_id = \'17\',\n							place_id = \'8\',\n							location_id = \'21\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'36\'  from device_list table on 2021/02/07 20:30:56'),
(160, '2021-02-07 20:31:56', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/07 20:31:56'),
(161, '2021-02-07 20:33:22', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/07 20:33:22'),
(162, '2021-02-07 20:34:27', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/07 20:34:27'),
(163, '2021-02-07 20:37:29', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/07 20:37:29'),
(164, '2021-02-07 20:38:28', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/07 20:38:28'),
(165, '2021-02-07 20:39:48', 'imustofa', 'imustofa insert new data into the location_building table on 2021/02/07 20:39:48'),
(166, '2021-02-07 20:43:06', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.05.02.06.017.050\',\n							device_brand = \'ICA\', \n							device_model = \'CE 1200\', \n							device_color = \'Hitam\', \n							device_serial = \'1B1D22017653\', \n							device_description = \'<p>Pengadaan Kabupaten</p>\', \n							  \n							device_status = \'in use\', \n							building_id = \'16\',\n							place_id = \'6\',\n							location_id = \'23\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'24\'  from device_list table on 2021/02/07 20:43:06'),
(167, '2021-02-07 20:43:27', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.05.02.06.017.051\',\n							device_brand = \'ICA\', \n							device_model = \'CE 1200\', \n							device_color = \'Hitam\', \n							device_serial = \'1B1D22017684\', \n							device_description = \'<p>Pengadaan Kabupaten</p>\', \n							  \n							device_status = \'in use\', \n							building_id = \'16\',\n							place_id = \'6\',\n							location_id = \'23\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'25\'  from device_list table on 2021/02/07 20:43:27'),
(168, '2021-02-07 20:44:16', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.05.02.06.017.047\',\n							device_brand = \'Prolink\', \n							device_model = \'PRO1201SFCU\', \n							device_color = \'Hitam\', \n							device_serial = \'553801203600537\', \n							device_description = \'\', \n							  \n							device_status = \'in use\', \n							building_id = \'22\',\n							place_id = \'6\',\n							location_id = \'23\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'39\'  from device_list table on 2021/02/07 20:44:15'),
(169, '2021-02-07 20:44:40', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.05.02.06.017.046\',\n							device_brand = \'Prolink\', \n							device_model = \'PRO1201SFCU\', \n							device_color = \'Hitam\', \n							device_serial = \'538701196802284\', \n							device_description = \'<p>Pengadaan Kabupaten</p>\', \n							  \n							device_status = \'in use\', \n							building_id = \'22\',\n							place_id = \'6\',\n							location_id = \'23\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'38\'  from device_list table on 2021/02/07 20:44:40'),
(170, '2021-02-07 20:45:02', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2020\',\n							device_bmn = \'3.05.02.06.017.049\',\n							device_brand = \'Prolink\', \n							device_model = \'PRO1201SFCU\', \n							device_color = \'Hitam\', \n							device_serial = \'553801203600687\', \n							device_description = \'<p>Pengadaan Kabupaten</p>\', \n							  \n							device_status = \'in use\', \n							building_id = \'22\',\n							place_id = \'6\',\n							location_id = \'23\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'41\'  from device_list table on 2021/02/07 20:45:02'),
(171, '2021-02-09 16:22:43', 'imustofa', 'imustofa update data :  first_name=\'Imam\', last_name=\'Mustofa\', password=\'new password\', salt=\'new salt\',  updated_by=\'imustofa\', updated_date=NOW(), revision = revision+1  where  username = \'imustofa\' from users table on 2021/02/09 16:22:43'),
(172, '2021-02-10 10:47:23', 'imustofa', 'imustofa update data :  first_name=\'Imam\', last_name=\'Mustofa\', password=\'new password\', salt=\'new salt\',  updated_by=\'imustofa\', updated_date=NOW(), revision = revision+1  where  username = \'imustofa\' from users table on 2021/02/10 10:47:23'),
(173, '2021-02-25 14:59:22', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/25 14:59:22'),
(174, '2021-02-25 15:01:07', 'imustofa', 'imustofa update data :  \n							device_tahun = \'2010\',\n							device_bmn = \'3.10.01.02.002.018\',\n							device_brand = \'Lenovo\', \n							device_model = \'ThinkPad T420\', \n							device_color = \'Hitam\', \n							device_serial = \'PB-CKVK5\', \n							device_description = \'\', \n							  \n							device_status = \'in use\', \n							building_id = \'0\',\n							place_id = \'0\',\n							location_id = \'34\', \n							device_deployment_date = NOW(), \n							updated_by = \'imustofa\', \n							updated_date = NOW(), \n							revision = revision+1 \n							 where  device_id = \'42\'  from device_list table on 2021/02/25 15:01:07'),
(175, '2021-02-25 15:02:17', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/25 15:02:17'),
(176, '2021-02-25 15:03:28', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/25 15:03:28'),
(177, '2021-02-25 15:04:13', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/25 15:04:13'),
(178, '2021-02-25 15:05:44', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/25 15:05:44'),
(179, '2021-02-25 15:06:40', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/25 15:06:40'),
(180, '2021-02-25 15:07:40', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/25 15:07:40'),
(181, '2021-02-25 15:08:46', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/25 15:08:46'),
(182, '2021-02-25 15:09:33', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/25 15:09:33'),
(183, '2021-02-25 15:10:29', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/25 15:10:29'),
(184, '2021-02-25 15:11:09', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/25 15:11:09'),
(185, '2021-02-25 15:16:23', 'imustofa', 'imustofa insert new data into the device_list table on 2021/02/25 15:16:23'),
(186, '2021-11-02 11:00:49', 'admin', 'admin insert new data into the users table on 2021/11/02 11:00:49'),
(187, '2021-11-02 11:00:49', 'admin', 'admin insert new data into the user_privileges table on 2021/11/02 11:00:49'),
(188, '2021-11-02 11:19:41', 'admin', 'admin update data :  first_name=\'Mohamad\', last_name=\'Achiruzaman\',  updated_by=\'admin\', updated_date=NOW(), revision = revision+1  where  username = \'achiruzaman\' from users table on 2021/11/02 11:19:41'),
(189, '2021-11-02 11:19:41', 'admin', 'admin update data :  privileges=\'5,6,7\' where  username=\'achiruzaman\' from user_privileges table on 2021/11/02 11:19:41'),
(190, '2021-11-02 22:25:43', 'admin', 'admin insert new data into the users table on 2021/11/02 22:25:43'),
(191, '2021-11-02 22:26:49', 'admin', 'admin insert new data into the users table on 2021/11/02 22:26:49'),
(192, '2021-11-02 22:27:48', 'admin', 'admin insert new data into the users table on 2021/11/02 22:27:48'),
(193, '2021-11-02 22:27:48', 'admin', 'admin insert new data into the user_privileges table on 2021/11/02 22:27:48'),
(194, '2021-11-02 22:29:48', 'admin', 'admin update data :  active=\'no\' where  username=\'nia_aprillyana\' from users table on 2021/11/02 22:29:48'),
(195, '2021-11-02 22:29:55', 'admin', 'admin update data :  active=\'no\' where  username=\'achiruzaman\' from users table on 2021/11/02 22:29:55'),
(196, '2021-11-02 22:30:21', 'admin', 'admin insert new data into the users table on 2021/11/02 22:30:21'),
(197, '2021-11-02 22:32:47', 'admin', 'admin insert new data into the users table on 2021/11/02 22:32:47');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `setting_name` varchar(50) NOT NULL COMMENT 'Setting Name',
  `setting_value` text NOT NULL COMMENT 'Values',
  `active` enum('yes','no') NOT NULL DEFAULT 'yes',
  `created_by` varchar(30) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `updated_date` datetime NOT NULL,
  `revision` tinyint(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`setting_name`, `setting_value`, `active`, `created_by`, `created_date`, `updated_by`, `updated_date`, `revision`) VALUES
('admin_email', 'admin@is_inventory.com', 'yes', 'system', '2015-12-10 09:33:16', 'system', '2015-12-10 09:33:16', 0),
('body_background', 'symphony.png', 'yes', 'system', '2015-12-10 09:33:16', 'admin', '2016-01-06 11:33:54', 4),
('color_scheme', 'site-aqua.min.css', 'yes', 'system', '2015-12-10 09:33:16', 'imustofa', '2021-02-04 19:37:53', 6),
('device_code_format', '3317/year/devtype', 'yes', 'system', '2016-11-09 10:48:25', 'admin', '2021-01-28 23:42:59', 1),
('favicon', 'favicon.ico', 'no', 'system', '2015-12-10 09:33:16', 'system', '2015-12-10 09:33:16', 0),
('inventory_description', '<p><em>Sistem Informasi dan Manajemen Peralatan Elektronik yang Berhubungan Dengan Teknologi Informasi. Adanya Sistem Ini Diharapkan Segala Tentang Peralatan Dapat Diketahui Baik Keberadaan Maupun Kondisi.</em></p>', 'yes', 'system', '2015-12-10 09:33:16', 'imustofa', '2021-02-04 19:37:21', 3),
('inventory_email', 'ipds3317@bps.go.id', 'yes', 'system', '2015-12-10 09:33:16', 'imustofa', '2021-02-04 19:37:21', 2),
('inventory_fax_number', '(0295) 691040', 'yes', 'system', '2015-12-10 09:33:16', 'imustofa', '2021-02-04 19:37:21', 2),
('inventory_location', '<p><strong>IPDS BPS Kabupaten Rembang</strong></p>', 'yes', 'system', '2015-12-10 09:33:16', 'imustofa', '2021-02-04 19:37:53', 3),
('inventory_logo', 'sclogo.png', 'yes', 'system', '2015-12-10 09:33:16', 'imustofa', '2021-02-04 19:40:33', 4),
('inventory_name', 'Sistem Manajemen Peralatan TI', 'yes', 'system', '2015-12-10 09:33:16', 'imustofa', '2021-02-04 19:32:33', 2),
('inventory_phone_number', '(0295) 691040', 'yes', 'system', '2015-12-10 09:33:16', 'imustofa', '2021-02-04 19:37:21', 2),
('inventory_slogan', 'General Inventory | Standard Edition', 'yes', 'system', '2015-12-10 09:33:16', 'admin', '2015-12-15 15:46:47', 0),
('inventory_website', 'rembangkab.bps.go.id', 'yes', 'system', '2015-12-10 09:33:16', 'imustofa', '2021-02-04 19:37:21', 2),
('location_details', 'enable', 'yes', 'system', '2016-11-02 11:14:23', 'imustofa', '2021-02-06 23:03:39', 14);

-- --------------------------------------------------------

--
-- Table structure for table `users_ori`
--

CREATE TABLE `users_ori` (
  `username` varchar(30) NOT NULL COMMENT 'Unique Username',
  `password` varchar(128) NOT NULL COMMENT 'SHA512',
  `opsi_login` enum('septi','jateng','','') NOT NULL DEFAULT 'septi',
  `salt` varchar(64) NOT NULL COMMENT 'Random String SHA256',
  `level` enum('admin','user') NOT NULL DEFAULT 'user' COMMENT 'User Level',
  `active` enum('yes','no') NOT NULL DEFAULT 'yes' COMMENT 'User Active Status',
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `photo` text DEFAULT NULL COMMENT 'User Photo Profile - Set default if empty',
  `created_by` varchar(30) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `updated_date` datetime NOT NULL,
  `revision` tinyint(3) NOT NULL DEFAULT 0 COMMENT 'Total Profile Changes/Revision'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_ori`
--

INSERT INTO `users_ori` (`username`, `password`, `opsi_login`, `salt`, `level`, `active`, `first_name`, `last_name`, `photo`, `created_by`, `created_date`, `updated_by`, `updated_date`, `revision`) VALUES
('achiruzaman', '1e6a18c67d0994cf92c70369bb15528503507d165ef0cd27e93c8e82b76011ce23f8f663ce604942e359dff90d844d9839b04bd8612c90038b5eb61b7cf1ba8f', 'septi', 'd8c2515c6258110de62bc1f9c21f6fbd526002e055f376b77a000ca24cb81e28', 'user', 'no', 'Mohamad', 'a', './assets/images/user_photos/standard_photo.jpg', 'admin', '2021-11-02 22:26:49', 'admin', '2021-11-02 22:29:55', 1),
('admin', '24ce1033bdfe226997340a7104d79eeb43a54a27c101da24a5eb465c90a10800d6f8671346158f0ecf2efb4f1440f45e9c16fbc3e45d3e53e2bb94839781e95f', 'septi', '1f78147ac76487d519cdf84a31df14b84948c6a01f763b522df896c75a5d7e4f', 'admin', 'yes', 'Super', 'User', './assets/images/user_photos/standard_photo.jpg', 'admin', '2015-12-02 11:26:49', 'admin', '2015-12-02 11:26:49', 0),
('imustofa', '085181e328864d1ab86cac498a7bf1c2c8e241832a22a92ed226b2fb2f67c615e61ea049068186fe0e17b82b382d27d51d86afe37e48a010acd574a6705a7b91', 'septi', 'ddd922ed2dc93cf02a8ae9bfdf08e1f4ce88b824afd0d802f5fd652b32495fd4', 'admin', 'yes', 'Imam', 'Mustofa', './assets/images/user_photos/imustofa.jpg', 'admin', '2021-02-06 14:43:34', 'imustofa', '2021-02-10 10:47:23', 2),
('nia_aprillyana', 'f4de8390f384b82a8166bf1da8d66b6a84ddbb7383f0a332368d37cf91a1f03cd531ef6e50907f43a7b2f1d06debed88c9cbfa9e6e55d512d9106eba6ed53a4b', 'jateng', '278e41e980a244998e9a8f7ba3f681291285bcb8c39da925d115a1a5ccfea23e', 'user', 'yes', 'Nia Aprillyana', 'A', './assets/images/user_photos/standard_photo.jpg', 'admin', '2021-11-02 22:32:47', 'admin', '2021-11-02 22:32:47', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_privileges`
--

CREATE TABLE `user_privileges` (
  `username` varchar(30) NOT NULL,
  `privileges` text NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `updated_date` datetime NOT NULL,
  `revision` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_privileges`
--

INSERT INTO `user_privileges` (`username`, `privileges`, `created_by`, `created_date`, `updated_by`, `updated_date`, `revision`) VALUES
('achiruzaman', '5,6,7', 'admin', '2021-11-02 11:00:49', 'admin', '2021-11-02 11:19:41', 1),
('admin', '*', 'admin', '2015-12-10 08:00:24', 'admin', '2015-12-10 08:00:24', 0),
('imustofa', '*', 'admin', '2021-02-06 14:43:35', 'admin', '2021-02-06 14:43:35', 0),
('nia_aprillyana', '5,6,7', 'admin', '2021-11-02 22:27:48', 'admin', '2021-11-02 22:27:48', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `component`
--
ALTER TABLE `component`
  ADD PRIMARY KEY (`component_id`);

--
-- Indexes for table `device_changes`
--
ALTER TABLE `device_changes`
  ADD PRIMARY KEY (`changes_id`);

--
-- Indexes for table `device_list`
--
ALTER TABLE `device_list`
  ADD PRIMARY KEY (`device_id`);

--
-- Indexes for table `device_type`
--
ALTER TABLE `device_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `location_building`
--
ALTER TABLE `location_building`
  ADD PRIMARY KEY (`building_id`);

--
-- Indexes for table `location_details`
--
ALTER TABLE `location_details`
  ADD PRIMARY KEY (`detail_id`);

--
-- Indexes for table `location_floor`
--
ALTER TABLE `location_floor`
  ADD PRIMARY KEY (`floor_id`);

--
-- Indexes for table `location_place`
--
ALTER TABLE `location_place`
  ADD PRIMARY KEY (`place_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`RecId`);

--
-- Indexes for table `system_logs`
--
ALTER TABLE `system_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`setting_name`);

--
-- Indexes for table `users_ori`
--
ALTER TABLE `users_ori`
  ADD UNIQUE KEY `username` (`username`,`opsi_login`) USING BTREE;

--
-- Indexes for table `user_privileges`
--
ALTER TABLE `user_privileges`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `component`
--
ALTER TABLE `component`
  MODIFY `component_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `device_changes`
--
ALTER TABLE `device_changes`
  MODIFY `changes_id` int(12) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `device_list`
--
ALTER TABLE `device_list`
  MODIFY `device_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `device_type`
--
ALTER TABLE `device_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `location_building`
--
ALTER TABLE `location_building`
  MODIFY `building_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `location_details`
--
ALTER TABLE `location_details`
  MODIFY `detail_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `location_floor`
--
ALTER TABLE `location_floor`
  MODIFY `floor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `location_place`
--
ALTER TABLE `location_place`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `RecId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `system_logs`
--
ALTER TABLE `system_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
