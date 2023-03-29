-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2023 at 03:57 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbegwyokxaeygv2`
--

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(3668, 'default', '{\"uuid\":\"99228487-081c-4d23-908a-ee8b4518a518\",\"displayName\":\"App\\\\Jobs\\\\Crawler\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Crawler\",\"command\":\"O:16:\\\"App\\\\Jobs\\\\Crawler\\\":1:{s:26:\\\"\\u0000App\\\\Jobs\\\\Crawler\\u0000code_saq\\\";s:8:\\\"11073758\\\";}\"}}', 1, 1680055057, 1680039292, 1680039292),
(3669, 'default', '{\"uuid\":\"dd751540-692a-45ee-b690-34484ec4412d\",\"displayName\":\"App\\\\Jobs\\\\Crawler\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Crawler\",\"command\":\"O:16:\\\"App\\\\Jobs\\\\Crawler\\\":1:{s:26:\\\"\\u0000App\\\\Jobs\\\\Crawler\\u0000code_saq\\\";s:8:\\\"12858055\\\";}\"}}', 0, NULL, 1680039292, 1680039292),
(3670, 'default', '{\"uuid\":\"6b155013-c1a6-446c-8dc7-1159d228676f\",\"displayName\":\"App\\\\Jobs\\\\Crawler\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Crawler\",\"command\":\"O:16:\\\"App\\\\Jobs\\\\Crawler\\\":1:{s:26:\\\"\\u0000App\\\\Jobs\\\\Crawler\\u0000code_saq\\\";s:8:\\\"13920771\\\";}\"}}', 0, NULL, 1680039292, 1680039292),
(3671, 'default', '{\"uuid\":\"cd39790c-7292-456b-bc69-4c81aa9ae351\",\"displayName\":\"App\\\\Jobs\\\\Crawler\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Crawler\",\"command\":\"O:16:\\\"App\\\\Jobs\\\\Crawler\\\":1:{s:26:\\\"\\u0000App\\\\Jobs\\\\Crawler\\u0000code_saq\\\";s:8:\\\"14919940\\\";}\"}}', 0, NULL, 1680039292, 1680039292);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7968;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
