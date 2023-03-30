-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2023 at 10:05 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbegwyokxaeygv`
--

-- --------------------------------------------------------

--
-- Table structure for table `progres__crawler`
--

CREATE TABLE `progres__crawler` (
                                   `id` int(11) NOT NULL AUTO_INCREMENT,
                                   `temps_debut` varchar(200) DEFAULT NULL,
                                   `nb_pages_completees` int(11) DEFAULT NULL,
                                   `nb_pages_totales` int(11) DEFAULT NULL,
                                   PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Table structure for table `bouteilles`
--

CREATE TABLE `bouteilles` (
  `id` int(11) NOT NULL,
  `date_achat` date DEFAULT NULL,
  `garde_jusqua` varchar(200) DEFAULT NULL,
  `notes` varchar(200) DEFAULT NULL,
  `prix` float DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `millesime` int(11) DEFAULT NULL,
  `id_bouteille` int(11) DEFAULT NULL,
  `celliers_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_mes_bouteilles` int(11) DEFAULT NULL,
  `commentaires` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `celliers`
--

CREATE TABLE `celliers` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `celliers`
--

INSERT INTO `celliers` (`id`, `nom`, `users_id`, `created_at`, `updated_at`) VALUES
(50, 'Mon premier cellier', 3, '2023-03-21 00:26:07', '2023-03-21 00:26:07'),
(52, 'Mon cellier', 2, '2023-03-21 00:28:25', '2023-03-21 00:28:25');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mes_bouteilles`
--

CREATE TABLE `mes_bouteilles` (
  `id_bouteillePerso` int(11) NOT NULL,
  `nom_bouteillePerso` varchar(200) DEFAULT NULL,
  `image_bouteillePerso` varchar(200) DEFAULT NULL,
  `pays_bouteillePerso` varchar(50) DEFAULT NULL,
  `description_bouteillePerso` varchar(200) DEFAULT NULL,
  `prix_bouteillePerso` float DEFAULT NULL,
  `url_img_bouteillePerso` varchar(200) DEFAULT NULL,
  `format_bouteillePerso` varchar(20) DEFAULT NULL,
  `type_bouteillePerso` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mes_bouteilles`
--

INSERT INTO `mes_bouteilles` (`id_bouteillePerso`, `nom_bouteillePerso`, `image_bouteillePerso`, `pays_bouteillePerso`, `description_bouteillePerso`, `prix_bouteillePerso`, `url_img_bouteillePerso`, `format_bouteillePerso`, `type_bouteillePerso`, `created_at`, `updated_at`) VALUES
(16, 'Ma bouteille', NULL, 'États-Unis', NULL, 28.4, NULL, NULL, 1, '2023-03-17 01:35:12', '2023-03-17 01:35:12'),
(17, 'Mon vin', NULL, 'États-Unis', NULL, NULL, NULL, NULL, 2, '2023-03-17 22:04:06', '2023-03-17 22:04:06'),
(18, 'awef', NULL, 'États-Unis', NULL, NULL, NULL, NULL, 1, '2023-03-20 21:39:42', '2023-03-20 21:39:42'),
(19, 'fewafw', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-03-20 21:44:34', '2023-03-20 21:44:34'),
(20, 'awef', NULL, NULL, NULL, NULL, NULL, NULL, 2, '2023-03-20 21:56:26', '2023-03-20 21:56:26');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--


-- --------------------------------------------------------

--
-- Table structure for table `vino__type`
--

CREATE TABLE `vino__type` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vino__type`
--

INSERT INTO `vino__type` (`id`, `type`) VALUES
(1, 'Vin rouge'),
(2, 'Vin blanc'),
(3, 'Vin rosé');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bouteilles`
--
ALTER TABLE `bouteilles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bouteilles_vino__bouteille1_idx` (`id_bouteille`),
  ADD KEY `fk_bouteilles_celliers1_idx` (`celliers_id`),
  ADD KEY `fk_bouteilles_id_bouteillePerso` (`id_mes_bouteilles`);

--
-- Indexes for table `celliers`
--
ALTER TABLE `celliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_celliers_users1_idx` (`users_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `mes_bouteilles`
--
ALTER TABLE `mes_bouteilles`
  ADD PRIMARY KEY (`id_bouteillePerso`),
  ADD KEY `fk_mes_bouteilles_type` (`type_bouteillePerso`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vino__bouteille`
--
ALTER TABLE `vino__bouteille`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vino__bouteille_vino__type_idx` (`type`);

--
-- Indexes for table `vino__type`
--
ALTER TABLE `vino__type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bouteilles`
--
ALTER TABLE `bouteilles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `celliers`
--
ALTER TABLE `celliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mes_bouteilles`
--
ALTER TABLE `mes_bouteilles`
  MODIFY `id_bouteillePerso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vino__bouteille`
--
ALTER TABLE `vino__bouteille`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55466;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bouteilles`
--
ALTER TABLE `bouteilles`
  ADD CONSTRAINT `fk_bouteilles_celliers1` FOREIGN KEY (`celliers_id`) REFERENCES `celliers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bouteilles_id_bouteille1` FOREIGN KEY (`id_bouteille`) REFERENCES `vino__bouteille` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bouteilles_id_bouteillePerso` FOREIGN KEY (`id_mes_bouteilles`) REFERENCES `mes_bouteilles` (`id_bouteillePerso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `celliers`
--
ALTER TABLE `celliers`
  ADD CONSTRAINT `fk_celliers_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mes_bouteilles`
--
ALTER TABLE `mes_bouteilles`
  ADD CONSTRAINT `fk_mes_bouteilles_type` FOREIGN KEY (`type_bouteillePerso`) REFERENCES `vino__type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `vino__bouteille`
--
ALTER TABLE `vino__bouteille`
  ADD CONSTRAINT `fk_vino__bouteille_type` FOREIGN KEY (`type`) REFERENCES `vino__type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

CREATE TABLE `vino__bouteille__description` (
                                                `id` int(11) NOT NULL,
                                                `cepages` JSON DEFAULT NULL,
                                                `cup_code` varchar(50) DEFAULT NULL,
                                                PRIMARY KEY (`id`),
                                                CONSTRAINT `fk_vino__bouteille__description_id` FOREIGN KEY (`id`) REFERENCES `vino__bouteille` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `vino__bouteille__description` ADD COLUMN `image_url` VARCHAR(510) DEFAULT NULL;


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

CREATE TABLE `progres__details` (
                                    `id` int(11) NOT NULL AUTO_INCREMENT,
                                    `temps_debut` varchar(200) DEFAULT NULL,
                                    `nb_pages_completees` int(11) DEFAULT NULL,
                                    `nb_pages_totales` int(11) DEFAULT NULL,
                                    PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;
