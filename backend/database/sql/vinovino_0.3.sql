-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2023 at 11:26 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e0859973`
--
CREATE DATABASE IF NOT EXISTS `vinovino` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `e0859973`;
--
-- Database: `forge`
--
CREATE DATABASE IF NOT EXISTS `forge` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `forge`;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_01_13_141542_create_blog_posts_table', 1);

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
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Pedro Contreras Avendano', 'pedro.contreras.avendano@gmail.com', NULL, '$2y$10$1Yx5vSuK.tgo1XPUZwdITONOF1E61edPaURcZ8sbmp23lhg1MocMG', NULL, '2023-02-24 00:16:37', '2023-02-24 00:16:37'),
(2, 'Pedro Contreras Avendano', 'pedro@pedro.com', NULL, '$2y$10$cmyUejs5Z5Lu7J0e0Be0m' ||
                                                          '.D8usSqd6t9ndxRKF7vZ8pZUdLLCl7cS', NULL, '2023-02-28 08:12:01', '2023-02-28 08:12:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'e0859973', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"etudiants\",\"failed_jobs\",\"migrations\",\"password_resets\",\"personal_access_tokens\",\"users\",\"villes\"],\"table_structure[]\":[\"etudiants\",\"failed_jobs\",\"migrations\",\"password_resets\",\"personal_access_tokens\",\"users\",\"villes\"],\"table_data[]\":[\"etudiants\",\"failed_jobs\",\"migrations\",\"password_resets\",\"personal_access_tokens\",\"users\",\"villes\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(2, 'root', 'database', 'social_1_mars', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"categorys\",\"etudiants\",\"failed_jobs\",\"forum_posts\",\"migrations\",\"password_resets\",\"personal_access_tokens\",\"profiles\",\"types\",\"users\",\"villes\"],\"table_structure[]\":[\"categorys\",\"etudiants\",\"failed_jobs\",\"forum_posts\",\"migrations\",\"password_resets\",\"personal_access_tokens\",\"profiles\",\"types\",\"users\",\"villes\"],\"table_data[]\":[\"categorys\",\"etudiants\",\"failed_jobs\",\"forum_posts\",\"migrations\",\"password_resets\",\"personal_access_tokens\",\"profiles\",\"types\",\"users\",\"villes\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"vinovino\",\"table\":\"users\"},{\"db\":\"saq\",\"table\":\"vino__bouteille\"},{\"db\":\"social_a\",\"table\":\"users\"},{\"db\":\"social_a\",\"table\":\"etudiants\"},{\"db\":\"forge\",\"table\":\"users\"},{\"db\":\"forge\",\"table\":\"blog_posts\"},{\"db\":\"forge\",\"table\":\"password_resets\"},{\"db\":\"e0859973\",\"table\":\"etudiants\"},{\"db\":\"e0859973\",\"table\":\"villes\"},{\"db\":\"e0859973\",\"table\":\"users\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2023-03-09 22:16:52', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `saq`
--
CREATE DATABASE IF NOT EXISTS `saq` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `saq`;

-- --------------------------------------------------------

--
-- Table structure for table `vino__bouteille`
--

CREATE TABLE `vino__bouteille` (
  `id` int(11) NOT NULL,
  `nom` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `code_saq` varchar(50) DEFAULT NULL,
  `pays` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `prix_saq` float DEFAULT NULL,
  `url_saq` varchar(200) DEFAULT NULL,
  `url_img` varchar(200) DEFAULT NULL,
  `format` varchar(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vino__bouteille`
--

INSERT INTO `vino__bouteille` (`id`, `nom`, `image`, `code_saq`, `pays`, `description`, `prix_saq`, `url_saq`, `url_img`, `format`, `type`) VALUES
(1, 'Borsao Seleccion', '//s7d9.scene7.com/is/image/SAQ/10324623_is?$saq-rech-prod-gril$', '10324623', 'Espagne', 'Vin rouge\r\n         \r\n      \r\n      \r\n      Espagne, 750 ml\r\n      \r\n      \r\n      Code SAQ : 10324623', 11, 'https://www.saq.com/page/fr/saqcom/vin-rouge/borsao-seleccion/10324623', '//s7d9.scene7.com/is/image/SAQ/10324623_is?$saq-rech-prod-gril$', ' 750 ml', 1),
(2, 'Monasterio de Las Vinas Gran Reserva', '//s7d9.scene7.com/is/image/SAQ/10359156_is?$saq-rech-prod-gril$', '10359156', 'Espagne', 'Vin rouge\r\n         \r\n      \r\n      \r\n      Espagne, 750 ml\r\n      \r\n      \r\n      Code SAQ : 10359156', 19, 'https://www.saq.com/page/fr/saqcom/vin-rouge/monasterio-de-las-vinas-gran-reserva/10359156', '//s7d9.scene7.com/is/image/SAQ/10359156_is?$saq-rech-prod-gril$', ' 750 ml', 1),
(3, 'Castano Hecula', '//s7d9.scene7.com/is/image/SAQ/11676671_is?$saq-rech-prod-gril$', '11676671', 'Espagne', 'Vin rouge\r\n         \r\n      \r\n      \r\n      Espagne, 750 ml\r\n      \r\n      \r\n      Code SAQ : 11676671', 12, 'https://www.saq.com/page/fr/saqcom/vin-rouge/castano-hecula/11676671', '//s7d9.scene7.com/is/image/SAQ/11676671_is?$saq-rech-prod-gril$', ' 750 ml', 1),
(4, 'Campo Viejo Tempranillo Rioja', '//s7d9.scene7.com/is/image/SAQ/11462446_is?$saq-rech-prod-gril$', '11462446', 'Espagne', 'Vin rouge\r\n         \r\n      \r\n      \r\n      Espagne, 750 ml\r\n      \r\n      \r\n      Code SAQ : 11462446', 14, 'https://www.saq.com/page/fr/saqcom/vin-rouge/campo-viejo-tempranillo-rioja/11462446', '//s7d9.scene7.com/is/image/SAQ/11462446_is?$saq-rech-prod-gril$', ' 750 ml', 1),
(5, 'Bodegas Atalaya Laya 2017', '//s7d9.scene7.com/is/image/SAQ/12375942_is?$saq-rech-prod-gril$', '12375942', 'Espagne', 'Vin rouge\r\n         \r\n      \r\n      \r\n      Espagne, 750 ml\r\n      \r\n      \r\n      Code SAQ : 12375942', 17, 'https://www.saq.com/page/fr/saqcom/vin-rouge/bodegas-atalaya-laya-2017/12375942', '//s7d9.scene7.com/is/image/SAQ/12375942_is?$saq-rech-prod-gril$', ' 750 ml', 1),
(6, 'Vin Vault Pinot Grigio', '//s7d9.scene7.com/is/image/SAQ/13467048_is?$saq-rech-prod-gril$', '13467048', 'États-Unis', 'Vin blanc\r\n         \r\n      \r\n      \r\n      États-Unis, 3 L\r\n      \r\n      \r\n      Code SAQ : 13467048', NULL, 'https://www.saq.com/page/fr/saqcom/vin-blanc/vin-vault-pinot-grigio/13467048', '//s7d9.scene7.com/is/image/SAQ/13467048_is?$saq-rech-prod-gril$', ' 3 L', 2),
(7, 'Huber Riesling Engelsberg 2017', '//s7d9.scene7.com/is/image/SAQ/13675841_is?$saq-rech-prod-gril$', '13675841', 'Autriche', 'Vin blanc\r\n         \r\n      \r\n      \r\n      Autriche, 750 ml\r\n      \r\n      \r\n      Code SAQ : 13675841', 22, 'https://www.saq.com/page/fr/saqcom/vin-blanc/huber-riesling-engelsberg-2017/13675841', '//s7d9.scene7.com/is/image/SAQ/13675841_is?$saq-rech-prod-gril$', ' 750 ml', 2),
(8, 'Dominio de Tares Estay Castilla y Léon 2015', '//s7d9.scene7.com/is/image/SAQ/13802571_is?$saq-rech-prod-gril$', '13802571', 'Espagne', 'Vin rouge\r\n         \r\n      \r\n      \r\n      Espagne, 750 ml\r\n      \r\n      \r\n      Code SAQ : 13802571', 18, 'https://www.saq.com/page/fr/saqcom/vin-rouge/dominio-de-tares-estay-castilla-y-leon-2015/13802571', '//s7d9.scene7.com/is/image/SAQ/13802571_is?$saq-rech-prod-gril$', ' 750 ml', 1),
(9, 'Tessellae Old Vines Côtes du Roussillon 2016', '//s7d9.scene7.com/is/image/SAQ/12216562_is?$saq-rech-prod-gril$', '12216562', 'France', 'Vin rouge\r\n         \r\n      \r\n      \r\n      France, 750 ml\r\n      \r\n      \r\n      Code SAQ : 12216562', 21, 'https://www.saq.com/page/fr/saqcom/vin-rouge/tessellae-old-vines-cotes-du-roussillon-2016/12216562', '//s7d9.scene7.com/is/image/SAQ/12216562_is?$saq-rech-prod-gril$', ' 750 ml', 1),
(10, 'Tenuta Il Falchetto Bricco Paradiso -... 2015', '//s7d9.scene7.com/is/image/SAQ/13637422_is?$saq-rech-prod-gril$', '13637422', 'Italie', 'Vin rouge\r\n         \r\n      \r\n      \r\n      Italie, 750 ml\r\n      \r\n      \r\n      Code SAQ : 13637422', 34, 'https://www.saq.com/page/fr/saqcom/vin-rouge/tenuta-il-falchetto-bricco-paradiso---barbera-dasti-superiore-docg-2015/13637422', '//s7d9.scene7.com/is/image/SAQ/13637422_is?$saq-rech-prod-gril$', ' 750 ml', 1),
(11, '1000 Stories Zinfandel Californie', 'https://www.saq.com/media/catalog/product/1/3/13584455-1_1674499266.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13584455', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 30, 'https://www.saq.com/fr/13584455', 'https://www.saq.com/media/catalog/product/1/3/13584455-1_1674499266.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(12, '11th Hour Cellars Pinot Noir', 'https://www.saq.com/media/catalog/product/1/3/13966470-1_1578546924.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13966470', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 17, 'https://www.saq.com/fr/13966470', 'https://www.saq.com/media/catalog/product/1/3/13966470-1_1578546924.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(13, '13th Street Winery Gamay 2019', 'https://www.saq.com/media/catalog/product/1/2/12705631-1_1582140016.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12705631', 'Canada', 'Vin rouge | 750 ml | Canada', 20, 'https://www.saq.com/fr/12705631', 'https://www.saq.com/media/catalog/product/1/2/12705631-1_1582140016.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(14, '14 Hands Cabernet-Sauvignon Columbia Valley', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '13876247', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 16, 'https://www.saq.com/fr/13876247', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(15, '19 Crimes Cabernet-Sauvignon Limestone Coast', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '12824197', 'Australie', 'Vin rouge | 750 ml | Australie', 19, 'https://www.saq.com/fr/12824197', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(16, '19 Crimes Shiraz/Grenache/Mataro', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '12073995', 'Australie', 'Vin rouge | 750 ml | Australie', 18, 'https://www.saq.com/fr/12073995', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(17, '19 Crimes The Warden 2017', 'https://www.saq.com/media/catalog/product/1/3/13846179-1_1578543327.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13846179', 'Australie', 'Vin rouge | 750 ml | Australie', 30, 'https://www.saq.com/fr/13846179', 'https://www.saq.com/media/catalog/product/1/3/13846179-1_1578543327.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(18, '3 Badge Leese-Fitch Merlot 2015', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '13523011', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 18, 'https://www.saq.com/fr/13523011', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '750 ml', 1),
(19, '3 de Valandraud 2016', 'https://www.saq.com/media/catalog/product/1/3/13392031-1_1578535218.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13392031', 'France', 'Vin rouge | 750 ml | France', 53, 'https://www.saq.com/fr/13392031', 'https://www.saq.com/media/catalog/product/1/3/13392031-1_1578535218.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(20, '3 de Valandraud St-Émilion Grand Cru 2015', 'https://www.saq.com/media/catalog/product/1/4/14767616-1_1631204434.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14767616', 'France', 'Vin rouge | 750 ml | France', 51, 'https://www.saq.com/fr/14767616', 'https://www.saq.com/media/catalog/product/1/4/14767616-1_1631204434.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(21, '350° de Bellevue 2019', 'https://www.saq.com/media/catalog/product/1/5/15004178-1_1659717339.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15004178', 'France', 'Vin rouge | 750 ml | France', 44, 'https://www.saq.com/fr/15004178', 'https://www.saq.com/media/catalog/product/1/5/15004178-1_1659717339.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(22, '655 Miles Cabernet Sauvignon Lodi', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '14139863', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 15, 'https://www.saq.com/fr/14139863', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(23, 'A Mandria di Signadore Patrimonio 2019', 'https://www.saq.com/media/catalog/product/1/4/14736271-1_1624654560.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14736271', 'France', 'Vin rouge | 750 ml | France', 42, 'https://www.saq.com/fr/14736271', 'https://www.saq.com/media/catalog/product/1/4/14736271-1_1624654560.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(24, 'A Mandria di Signadore Patrimonio 2018', 'https://www.saq.com/media/catalog/product/1/1/11908161-1_1580629223.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '11908161', 'France', 'Vin rouge | 750 ml | France', 41, 'https://www.saq.com/fr/11908161', 'https://www.saq.com/media/catalog/product/1/1/11908161-1_1580629223.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(25, 'A Occhipinti Rosso Arcaico 2021', 'https://www.saq.com/media/catalog/product/1/4/14651867-1_1612271137.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14651867', 'Italie', 'Vin rouge | 750 ml | Italie', 29, 'https://www.saq.com/fr/14651867', 'https://www.saq.com/media/catalog/product/1/4/14651867-1_1612271137.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(26, 'A thousand Lives Cabernet-Sauvignon Mendoza', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '14250211', 'Argentine', 'Vin rouge | 750 ml | Argentine', 10, 'https://www.saq.com/fr/14250211', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(27, 'A. Christmann Pfalz Spätburgunder 2018', 'https://www.saq.com/media/catalog/product/1/4/14959941-1_1652993436.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14959941', 'Allemagne', 'Vin rouge | 750 ml | Allemagne', 32, 'https://www.saq.com/fr/14959941', 'https://www.saq.com/media/catalog/product/1/4/14959941-1_1652993436.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(28, 'A.A. Badenhorst The Curator 2020', 'https://www.saq.com/media/catalog/product/1/2/12819435-1_1589314084.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12819435', 'Afrique du Sud', 'Vin rouge | 750 ml | Afrique du Sud', 14, 'https://www.saq.com/fr/12819435', 'https://www.saq.com/media/catalog/product/1/2/12819435-1_1589314084.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(29, 'AA Badenhorst Ramnasgras Cinsault 2019', 'https://www.saq.com/media/catalog/product/1/4/14991538-1_1659447049.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14991538', 'Afrique du Sud', 'Vin rouge | 750 ml | Afrique du Sud', 48, 'https://www.saq.com/fr/14991538', 'https://www.saq.com/media/catalog/product/1/4/14991538-1_1659447049.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(30, 'Aalto Ribera del Duero 2020', 'https://www.saq.com/media/catalog/product/1/5/15104620-1_1675442770.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15104620', 'Espagne', 'Vin rouge | 750 ml | Espagne', 71, 'https://www.saq.com/fr/15104620', 'https://www.saq.com/media/catalog/product/1/5/15104620-1_1675442770.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(31, 'Abad Dom Bueno Mencia Bierzo Joven 2019', 'https://www.saq.com/media/catalog/product/1/3/13794129-1_1626143125.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13794129', 'Espagne', 'Vin rouge | 750 ml | Espagne', 16, 'https://www.saq.com/fr/13794129', 'https://www.saq.com/media/catalog/product/1/3/13794129-1_1626143125.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(32, 'Abbaye St-Hilaire Les Cerisiers 2019', 'https://www.saq.com/media/catalog/product/9/1/913558-1_1635862860.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '913558', 'France', 'Vin rouge | 750 ml | France', 19, 'https://www.saq.com/fr/913558', 'https://www.saq.com/media/catalog/product/9/1/913558-1_1635862860.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(33, 'Abbia Nova Senza Vandalismi Cesanese del Piglio 2021', 'https://www.saq.com/media/catalog/product/1/4/14497871-1_1623254467.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14497871', 'Italie', 'Vin rouge | 750 ml | Italie', 26, 'https://www.saq.com/fr/14497871', 'https://www.saq.com/media/catalog/product/1/4/14497871-1_1623254467.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(34, 'Abreu Cappella Rutherford 2012', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '13319141', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 967, 'https://www.saq.com/fr/13319141', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '750 ml', 1),
(35, 'Abreu Las Posadas North Coast 2012', 'https://www.saq.com/media/catalog/product/1/3/13319096-1_1625772640.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13319096', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 967, 'https://www.saq.com/fr/13319096', 'https://www.saq.com/media/catalog/product/1/3/13319096-1_1625772640.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(36, 'Acaibo Sonoma Valley 2016', 'https://www.saq.com/media/catalog/product/1/5/15041454-1_1666105866.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15041454', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 113, 'https://www.saq.com/fr/15041454', 'https://www.saq.com/media/catalog/product/1/5/15041454-1_1666105866.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(37, 'Achaval Ferrer Finca Altamira 2016', 'https://www.saq.com/media/catalog/product/1/2/12361647-1_1662669063.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12361647', 'Argentine', 'Vin rouge | 750 ml | Argentine', 112, 'https://www.saq.com/fr/12361647', 'https://www.saq.com/media/catalog/product/1/2/12361647-1_1662669063.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(38, 'Adega De Pegões Colheita Seleccionada 2016', 'https://www.saq.com/media/catalog/product/1/3/13679892-1_1578540618.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13679892', 'Portugal', 'Vin rouge | 750 ml | Portugal', 18, 'https://www.saq.com/fr/13679892', 'https://www.saq.com/media/catalog/product/1/3/13679892-1_1578540618.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(39, 'Adega de Penalva Dão', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '13746485', 'Portugal', 'Vin rouge | 750 ml | Portugal', 11, 'https://www.saq.com/fr/13746485', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', 1),
(40, 'Agiorgitiko Natur Domaine Tetramythos 2019', 'https://www.saq.com/media/catalog/product/1/2/12178957-1_1659973535.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12178957', 'Grèce', 'Vin rouge | 750 ml | Grèce', 18, 'https://www.saq.com/fr/12178957', 'https://www.saq.com/media/catalog/product/1/2/12178957-1_1659973535.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(41, 'Aglianico Donnachiara Irpinia 2018', 'https://www.saq.com/media/catalog/product/1/2/12001852-1_1580658610.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12001852', 'Italie', 'Vin rouge | 750 ml | Italie', 23, 'https://www.saq.com/fr/12001852', 'https://www.saq.com/media/catalog/product/1/2/12001852-1_1580658610.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(42, 'Agnes Paquet Bourgogne Pinot noir Le Croquamots 2020', 'https://www.saq.com/media/catalog/product/1/1/11510268-1_1580622325.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '11510268', 'France', 'Vin rouge | 750 ml | France', 28, 'https://www.saq.com/fr/11510268', 'https://www.saq.com/media/catalog/product/1/1/11510268-1_1580622325.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(43, 'Agostino Wines Uma Mendoza 2021', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '14501068', 'Argentine', 'Vin rouge | 750 ml | Argentine', 12, 'https://www.saq.com/fr/14501068', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', 1),
(44, 'Agricola Falset-Marca Ètim El Viatge Montsant 2019', 'https://www.saq.com/media/catalog/product/1/3/13800752-1_1578542425.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13800752', 'Espagne', 'Vin rouge | 750 ml | Espagne', 19, 'https://www.saq.com/fr/13800752', 'https://www.saq.com/media/catalog/product/1/3/13800752-1_1578542425.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(45, 'Agro Turistica Marella Podere Marella Fiammetta Sangiovese 2018', 'https://www.saq.com/media/catalog/product/1/3/13675496-1_1578540321.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13675496', 'Italie', 'Vin rouge | 750 ml | Italie', 24, 'https://www.saq.com/fr/13675496', 'https://www.saq.com/media/catalog/product/1/3/13675496-1_1578540321.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(46, 'Agterpaaie Swartland 2020', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '15071477', 'Afrique du Sud', 'Vin rouge | 750 ml | Afrique du Sud', 20, 'https://www.saq.com/fr/15071477', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(47, 'Ah-So Red Navarra', 'https://www.saq.com/media/catalog/product/1/4/14715445-1_1623705128.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14715445', 'Espagne', 'Vin rouge | 250 ml | Espagne', 6, 'https://www.saq.com/fr/14715445', 'https://www.saq.com/media/catalog/product/1/4/14715445-1_1623705128.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '250 ml', 1),
(48, 'Akarua Rua Pinot Noir 2021', 'https://www.saq.com/media/catalog/product/1/2/12205100-1_1650453034.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12205100', 'Nouvelle-Zélande', 'Vin rouge | 750 ml | Nouvelle-Zélande', 28, 'https://www.saq.com/fr/12205100', 'https://www.saq.com/media/catalog/product/1/2/12205100-1_1650453034.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(49, 'Al di l? del Fiume Dagamo Colli Bolognesi 2021', 'https://www.saq.com/media/catalog/product/1/4/14460331-1_1590004537.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14460331', 'Italie', 'Vin rouge | 750 ml | Italie', 32, 'https://www.saq.com/fr/14460331', 'https://www.saq.com/media/catalog/product/1/4/14460331-1_1590004537.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(50, 'Alain Brumont Madiran Tour Bouscassé 2019', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '12284303', 'France', 'Vin rouge | 750 ml | France', 19, 'https://www.saq.com/fr/12284303', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(51, 'Alain Jaume Côtes du Rhône Grand Veneur 2020', 'https://www.saq.com/media/catalog/product/1/4/14278839-1_1630686035.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14278839', 'France', 'Vin rouge | 750 ml | France', 19, 'https://www.saq.com/fr/14278839', 'https://www.saq.com/media/catalog/product/1/4/14278839-1_1630686035.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(52, 'Alain Lorieux Chinon Expression 2019', 'https://www.saq.com/media/catalog/product/8/7/873257-1_1629320456.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '873257', 'France', 'Vin rouge | 750 ml | France', 19, 'https://www.saq.com/fr/873257', 'https://www.saq.com/media/catalog/product/8/7/873257-1_1629320456.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(53, 'Alain Voge Cornas Les Chailles 2019', 'https://www.saq.com/media/catalog/product/1/4/14798885-1_1643315150.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14798885', 'France', 'Vin rouge | 750 ml | France', 73, 'https://www.saq.com/fr/14798885', 'https://www.saq.com/media/catalog/product/1/4/14798885-1_1643315150.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(54, 'Alain Voge Vieilles Vignes 2019', 'https://www.saq.com/media/catalog/product/1/4/14798893-1_1643315150.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14798893', 'France', 'Vin rouge | 750 ml | France', 107, 'https://www.saq.com/fr/14798893', 'https://www.saq.com/media/catalog/product/1/4/14798893-1_1643315150.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(55, 'Alain Voge Vieilles Vignes 2018', 'https://www.saq.com/media/catalog/product/1/4/14587789-1_1604681434.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14587789', 'France', 'Vin rouge | 750 ml | France', 109, 'https://www.saq.com/fr/14587789', 'https://www.saq.com/media/catalog/product/1/4/14587789-1_1604681434.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(56, 'Alamos Seleccion Malbec Mendoza 2019', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '11015726', 'Argentine', 'Vin rouge | 750 ml | Argentine', 17, 'https://www.saq.com/fr/11015726', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(57, 'Albert Bichot Beaujolais Villages Mr No Sulfite', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/flg_small.png?width=20&height=20', '14879546', 'France', 'Vin rouge | 750 ml | France', 16, 'https://www.saq.com/fr/14879546', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/flg_small.png?width=20&height=20', '750 ml', 1),
(58, 'Albert Bichot Bourgogne Vieilles Vignes', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/flg_small.png?width=20&height=20', '10667474', 'France', 'Vin rouge | 750 ml | France', 23, 'https://www.saq.com/fr/10667474', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/flg_small.png?width=20&height=20', '750 ml', 1),
(59, 'Albert Bichot Domaine Adélie Mercurey Premier Cru Champs Martin 2020', 'https://www.saq.com/media/catalog/product/1/4/14571710-1_1644852637.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14571710', 'France', 'Vin rouge | 750 ml | France', 66, 'https://www.saq.com/fr/14571710', 'https://www.saq.com/media/catalog/product/1/4/14571710-1_1644852637.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(60, 'Albert Bichot Domaine du Pavillon Beaune Les Epenottes 2020', 'https://www.saq.com/media/catalog/product/1/4/14800842-1_1643897132.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14800842', 'France', 'Vin rouge | 750 ml | France', 60, 'https://www.saq.com/fr/14800842', 'https://www.saq.com/media/catalog/product/1/4/14800842-1_1643897132.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(61, 'Albert Bichot Horizon De Bichot Pinot Noir 2020', 'https://www.saq.com/media/catalog/product/1/3/13922080-1_1578546034.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13922080', 'France', 'Vin rouge | 750 ml | France', 19, 'https://www.saq.com/fr/13922080', 'https://www.saq.com/media/catalog/product/1/3/13922080-1_1578546034.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(62, 'Albert Grivault Pommard Premier Cru Clos Blanc 2019', 'https://www.saq.com/media/catalog/product/1/3/13192806-1_1605810337.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13192806', 'France', 'Vin rouge | 750 ml | France', 84, 'https://www.saq.com/fr/13192806', 'https://www.saq.com/media/catalog/product/1/3/13192806-1_1605810337.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(63, 'Albert Morot Beaune Premier Cru Les Bressandes 2020', 'https://www.saq.com/media/catalog/product/1/4/14978229-1_1659627967.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14978229', 'France', 'Vin rouge | 750 ml | France', 87, 'https://www.saq.com/fr/14978229', 'https://www.saq.com/media/catalog/product/1/4/14978229-1_1659627967.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(64, 'Albert Morot Beaune Premier Cru Les Cent-Vignes 2020', 'https://www.saq.com/media/catalog/product/1/4/14817361-1_1634574945.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14817361', 'France', 'Vin rouge | 750 ml | France', 80, 'https://www.saq.com/fr/14817361', 'https://www.saq.com/media/catalog/product/1/4/14817361-1_1634574945.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(65, 'Albert Morot Savigny les Beaune Premier Cru La Bataillère 2020', 'https://www.saq.com/media/catalog/product/1/4/14821281-1_1634654761.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14821281', 'France', 'Vin rouge | 750 ml | France', 70, 'https://www.saq.com/fr/14821281', 'https://www.saq.com/media/catalog/product/1/4/14821281-1_1634654761.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(66, 'Albet i Noya Curios Tempranillo Classic 2020', 'https://www.saq.com/media/catalog/product/1/0/10985801-1_1580611220.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '10985801', 'Espagne', 'Vin rouge | 750 ml | Espagne', 18, 'https://www.saq.com/fr/10985801', 'https://www.saq.com/media/catalog/product/1/0/10985801-1_1580611220.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(67, 'Albet i Noya Les Timbes Penedès 2018', 'https://www.saq.com/media/catalog/product/1/4/14921134-1_1648500645.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14921134', 'Espagne', 'Vin rouge | 750 ml | Espagne', 25, 'https://www.saq.com/fr/14921134', 'https://www.saq.com/media/catalog/product/1/4/14921134-1_1648500645.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(68, 'Albino Armani Ripasso Valpolicella Superiore 2019', 'https://www.saq.com/media/catalog/product/1/3/13893178-1_1578544817.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13893178', 'Italie', 'Vin rouge | 750 ml | Italie', 21, 'https://www.saq.com/fr/13893178', 'https://www.saq.com/media/catalog/product/1/3/13893178-1_1578544817.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(69, 'Albino Rocca Barbaresco Ovello Vigna Loreto 2019', 'https://www.saq.com/media/catalog/product/1/3/13851980-1_1603295449.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13851980', 'Italie', 'Vin rouge | 750 ml | Italie', 89, 'https://www.saq.com/fr/13851980', 'https://www.saq.com/media/catalog/product/1/3/13851980-1_1603295449.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(70, 'Aldo Conterno Conca Tre Pile 2019', 'https://www.saq.com/media/catalog/product/1/4/14581985-1_1604421791.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14581985', 'Italie', 'Vin rouge | 750 ml | Italie', 51, 'https://www.saq.com/fr/14581985', 'https://www.saq.com/media/catalog/product/1/4/14581985-1_1604421791.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(71, 'Aldo Conterno Langhe Quartetto 2019', 'https://www.saq.com/media/catalog/product/1/5/15031310-1_1674681963.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15031310', 'Italie', 'Vin rouge | 750 ml | Italie', 59, 'https://www.saq.com/fr/15031310', 'https://www.saq.com/media/catalog/product/1/5/15031310-1_1674681963.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(72, 'Alessandro Berselli Signature Collection Salento Primitivo 2018', 'https://www.saq.com/media/catalog/product/1/3/13487188-1_1675105259.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13487188', 'Italie', 'Vin rouge | 750 ml | Italie', 20, 'https://www.saq.com/fr/13487188', 'https://www.saq.com/media/catalog/product/1/3/13487188-1_1675105259.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(73, 'Alex Foillard Beaujolais Villages 2021', 'https://www.saq.com/media/catalog/product/1/4/14786198-1_1639503353.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14786198', 'France', 'Vin rouge | 750 ml | France', 30, 'https://www.saq.com/fr/14786198', 'https://www.saq.com/media/catalog/product/1/4/14786198-1_1639503353.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(74, 'Alex Foillard Brouilly 2020', 'https://www.saq.com/media/catalog/product/1/4/14786180-1_1626294629.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14786180', 'France', 'Vin rouge | 750 ml | France', 43, 'https://www.saq.com/fr/14786180', 'https://www.saq.com/media/catalog/product/1/4/14786180-1_1626294629.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(75, 'Alex Foillard Côte de Brouilly 2020', 'https://www.saq.com/media/catalog/product/1/4/14786171-1_1626284447.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14786171', 'France', 'Vin rouge | 750 ml | France', 43, 'https://www.saq.com/fr/14786171', 'https://www.saq.com/media/catalog/product/1/4/14786171-1_1626284447.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(76, 'Alex Gambal Savigny-les-Beaune 2019', 'https://www.saq.com/media/catalog/product/1/3/13903575-1_1661230838.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13903575', 'France', 'Vin rouge | 750 ml | France', 59, 'https://www.saq.com/fr/13903575', 'https://www.saq.com/media/catalog/product/1/3/13903575-1_1661230838.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(77, 'Alfasi Merlot 2018', 'https://www.saq.com/media/catalog/product/1/0/10678771-1_1580598909.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '10678771', 'Argentine', 'Vin rouge | 750 ml | Argentine', 16, 'https://www.saq.com/fr/10678771', 'https://www.saq.com/media/catalog/product/1/0/10678771-1_1580598909.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(78, 'Alfredo Roca Pinot Noir Mendoza 2020', 'https://www.saq.com/media/catalog/product/1/2/12671320-1_1586861107.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12671320', 'Argentine', 'Vin rouge | 750 ml | Argentine', 17, 'https://www.saq.com/fr/12671320', 'https://www.saq.com/media/catalog/product/1/2/12671320-1_1586861107.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(79, 'Alias Croizet-Bages Pauillac 2019', 'https://www.saq.com/media/catalog/product/1/5/15036014-1_1667404562.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15036014', 'France', 'Vin rouge | 750 ml | France', 56, 'https://www.saq.com/fr/15036014', 'https://www.saq.com/media/catalog/product/1/5/15036014-1_1667404562.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(80, 'Allegrini Amarone della Valpolicella Classico 2018', 'https://www.saq.com/media/catalog/product/1/3/13183491-1_1630686035.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13183491', 'Italie', 'Vin rouge | 750 ml | Italie', 99, 'https://www.saq.com/fr/13183491', 'https://www.saq.com/media/catalog/product/1/3/13183491-1_1630686035.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(81, 'Allegrini Corte Giara Valpolicella', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '13190317', 'Italie', 'Vin rouge | 750 ml | Italie', 16, 'https://www.saq.com/fr/13190317', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', 1),
(82, 'Allegrini Di Fumane Veneto Rosso', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '13358247', 'Italie', 'Vin rouge | 750 ml | Italie', 15, 'https://www.saq.com/fr/13358247', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(83, 'Allegrini La Bragia Veneto 2018', 'https://www.saq.com/media/catalog/product/1/3/13419441-1_1578535516.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13419441', 'Italie', 'Vin rouge | 750 ml | Italie', 19, 'https://www.saq.com/fr/13419441', 'https://www.saq.com/media/catalog/product/1/3/13419441-1_1578535516.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(84, 'Allegrini La Grola 2019', 'https://www.saq.com/media/catalog/product/1/3/13246704-1_1578443114.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13246704', 'Italie', 'Vin rouge | 750 ml | Italie', 32, 'https://www.saq.com/fr/13246704', 'https://www.saq.com/media/catalog/product/1/3/13246704-1_1578443114.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(85, 'Allegrini Palazzo della Torre Veronese 2019', 'https://www.saq.com/media/catalog/product/9/0/907477-1_1580607615.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '907477', 'Italie', 'Vin rouge | 750 ml | Italie', 24, 'https://www.saq.com/fr/907477', 'https://www.saq.com/media/catalog/product/9/0/907477-1_1580607615.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(86, 'Allegrini Valpolicella Classico 2021', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '15082926', 'Italie', 'Vin rouge | 750 ml | Italie', 22, 'https://www.saq.com/fr/15082926', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', 1),
(87, 'Allegrini Villa Cavarena Valpolicella Ripasso', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '14003544', 'Italie', 'Vin rouge | 750 ml | Italie', 23, 'https://www.saq.com/fr/14003544', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(88, 'Alleno & Chapoutier Côtes du Rhône 2017', 'https://www.saq.com/media/catalog/product/1/3/13568480-1_1578537911.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13568480', 'France', 'Vin rouge | 750 ml | France', 19, 'https://www.saq.com/fr/13568480', 'https://www.saq.com/media/catalog/product/1/3/13568480-1_1578537911.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(89, 'Alma Negra M Blend Mendoza 2019', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '11156895', 'Argentine', 'Vin rouge | 750 ml | Argentine', 21, 'https://www.saq.com/fr/11156895', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(90, 'Almaviva Epu 2019', 'https://www.saq.com/media/catalog/product/1/4/14954681-1_1651853749.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14954681', 'Chili', 'Vin rouge | 750 ml | Chili', 96, 'https://www.saq.com/fr/14954681', 'https://www.saq.com/media/catalog/product/1/4/14954681-1_1651853749.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(91, 'Alois Lageder Conus Lagrein 2019', 'https://www.saq.com/media/catalog/product/1/5/15089327-1_1674747069.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15089327', 'Italie', 'Vin rouge | 750 ml | Italie', 35, 'https://www.saq.com/fr/15089327', 'https://www.saq.com/media/catalog/product/1/5/15089327-1_1674747069.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(92, 'Alpha Box & Dice Tarot 2019', 'https://www.saq.com/media/catalog/product/1/3/13491081-1_1604605549.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13491081', 'Australie', 'Vin rouge | 750 ml | Australie', 22, 'https://www.saq.com/fr/13491081', 'https://www.saq.com/media/catalog/product/1/3/13491081-1_1604605549.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(93, 'Alpha Domus Syrah The Barnstormer 2019', 'https://www.saq.com/media/catalog/product/1/3/13353251-1_1589488813.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13353251', 'Nouvelle-Zélande', 'Vin rouge | 750 ml | Nouvelle-Zélande', 26, 'https://www.saq.com/fr/13353251', 'https://www.saq.com/media/catalog/product/1/3/13353251-1_1589488813.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(94, 'Alphonse Mellot Côte de la Charité Rouge Les Pénitents 2016', 'https://www.saq.com/media/catalog/product/1/3/13235811-1_1578443108.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13235811', 'France', 'Vin rouge | 750 ml | France', 41, 'https://www.saq.com/fr/13235811', 'https://www.saq.com/media/catalog/product/1/3/13235811-1_1578443108.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(95, 'Alphonse Mellot Sancerre La Moussière 2019', 'https://www.saq.com/media/catalog/product/1/4/14299023-1_1600789566.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14299023', 'France', 'Vin rouge | 750 ml | France', 67, 'https://www.saq.com/fr/14299023', 'https://www.saq.com/media/catalog/product/1/4/14299023-1_1600789566.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(96, 'Alta Alella GX Catalunya 2021', 'https://www.saq.com/media/catalog/product/1/4/14223791-1_1648475427.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14223791', 'Espagne', 'Vin rouge | 750 ml | Espagne', 17, 'https://www.saq.com/fr/14223791', 'https://www.saq.com/media/catalog/product/1/4/14223791-1_1648475427.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(97, 'Altamente Jumilla 2020', 'https://www.saq.com/media/catalog/product/1/3/13632365-1_1580934012.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13632365', 'Espagne', 'Vin rouge | 750 ml | Espagne', 14, 'https://www.saq.com/fr/13632365', 'https://www.saq.com/media/catalog/product/1/3/13632365-1_1580934012.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(98, 'Altamente Monastrell Jumilla 2019', 'https://www.saq.com/media/catalog/product/1/4/14504955-1_1603113024.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14504955', 'Espagne', 'Vin rouge | 1,5 L | Espagne', 30, 'https://www.saq.com/fr/14504955', 'https://www.saq.com/media/catalog/product/1/4/14504955-1_1603113024.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '1,5 L', 1),
(99, 'Altamente Vinos Volalto Jumilla 2020', 'https://www.saq.com/media/catalog/product/1/4/14265755-1_1578554719.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14265755', 'Espagne', 'Vin rouge | 750 ml | Espagne', 18, 'https://www.saq.com/fr/14265755', 'https://www.saq.com/media/catalog/product/1/4/14265755-1_1578554719.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(100, 'Altano Vin Biologique Douro 2020', 'https://www.saq.com/media/catalog/product/1/4/14381318-1_1588617318.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14381318', 'Portugal', 'Vin rouge | 750 ml | Portugal', 17, 'https://www.saq.com/fr/14381318', 'https://www.saq.com/media/catalog/product/1/4/14381318-1_1588617318.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(101, 'Altesino Alte d\'Altesi 2018', 'https://www.saq.com/media/catalog/product/1/3/13016933-1_1581312325.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13016933', 'Italie', 'Vin rouge | 750 ml | Italie', 51, 'https://www.saq.com/fr/13016933', 'https://www.saq.com/media/catalog/product/1/3/13016933-1_1581312325.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(102, 'Altesino Brunello-di-Montalcino 2017', 'https://www.saq.com/media/catalog/product/1/0/10221763-1_1603832154.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '10221763', 'Italie', 'Vin rouge | 750 ml | Italie', 63, 'https://www.saq.com/fr/10221763', 'https://www.saq.com/media/catalog/product/1/0/10221763-1_1603832154.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(103, 'Altesino Palazzo Altesi Toscana 2017', 'https://www.saq.com/media/catalog/product/1/3/13016925-1_1666639848.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13016925', 'Italie', 'Vin rouge | 750 ml | Italie', 51, 'https://www.saq.com/fr/13016925', 'https://www.saq.com/media/catalog/product/1/3/13016925-1_1666639848.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(104, 'Altesino Rosso di Montalcino 2020', 'https://www.saq.com/media/catalog/product/1/1/11472345-1_1603832154.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '11472345', 'Italie', 'Vin rouge | 750 ml | Italie', 27, 'https://www.saq.com/fr/11472345', 'https://www.saq.com/media/catalog/product/1/1/11472345-1_1603832154.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(105, 'Altesino Rosso Toscana 2020', 'https://www.saq.com/media/catalog/product/1/0/10969763-1_1594925115.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '10969763', 'Italie', 'Vin rouge | 750 ml | Italie', 18, 'https://www.saq.com/fr/10969763', 'https://www.saq.com/media/catalog/product/1/0/10969763-1_1594925115.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(106, 'Alto Moncayo Garnacha 2019', 'https://www.saq.com/media/catalog/product/1/0/10860944-1_1580609417.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '10860944', 'Espagne', 'Vin rouge | 750 ml | Espagne', 51, 'https://www.saq.com/fr/10860944', 'https://www.saq.com/media/catalog/product/1/0/10860944-1_1580609417.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(107, 'Altolandon Mil Historia Bobal Manchuela 2020', 'https://www.saq.com/media/catalog/product/1/4/14921071-1_1646927155.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14921071', 'Espagne', 'Vin rouge | 750 ml | Espagne', 17, 'https://www.saq.com/fr/14921071', 'https://www.saq.com/media/catalog/product/1/4/14921071-1_1646927155.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(108, 'Altolandon Mil Historias Garnacha Manchuela 2021', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '13794111', 'Espagne', 'Vin rouge | 750 ml | Espagne', 16, 'https://www.saq.com/fr/13794111', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(109, 'Altolandon Rayuelo Manchuela 2017', 'https://www.saq.com/media/catalog/product/1/5/15032363-1_1663795853.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15032363', 'Espagne', 'Vin rouge | 750 ml | Espagne', 24, 'https://www.saq.com/fr/15032363', 'https://www.saq.com/media/catalog/product/1/5/15032363-1_1663795853.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(110, 'Altolandon Rosalia Manchuela 2017', 'https://www.saq.com/media/catalog/product/1/5/15032380-1_1674072348.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15032380', 'Espagne', 'Vin rouge | 750 ml | Espagne', 29, 'https://www.saq.com/fr/15032380', 'https://www.saq.com/media/catalog/product/1/5/15032380-1_1674072348.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(111, 'Altoona Hills Cabernet / Merlot 2021', 'https://www.saq.com/media/catalog/product/1/0/10518903-1_1580597708.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '10518903', 'Australie', 'Vin rouge | 750 ml | Australie', 18, 'https://www.saq.com/fr/10518903', 'https://www.saq.com/media/catalog/product/1/0/10518903-1_1580597708.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(112, 'Altos Las Hormigas Colonia Las Lenbres Malbec 2020', 'https://www.saq.com/media/catalog/product/1/4/14918761-1_1661226635.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14918761', 'Argentine', 'Vin rouge | 750 ml | Argentine', 17, 'https://www.saq.com/fr/14918761', 'https://www.saq.com/media/catalog/product/1/4/14918761-1_1661226635.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(113, 'Alvaro Palacios Camins 2021', 'https://www.saq.com/media/catalog/product/1/1/11180351-1_1580666711.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '11180351', 'Espagne', 'Vin rouge | 750 ml | Espagne', 28, 'https://www.saq.com/fr/11180351', 'https://www.saq.com/media/catalog/product/1/1/11180351-1_1580666711.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(114, 'Álvaro Palacios Finca Dofí 2020', 'https://www.saq.com/media/catalog/product/1/4/14990113-1_1675442766.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14990113', 'Espagne', 'Vin rouge | 750 ml | Espagne', 104, 'https://www.saq.com/fr/14990113', 'https://www.saq.com/media/catalog/product/1/4/14990113-1_1675442766.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(115, 'Alvaro Palacios Finca Dofi Priorat 2020', 'https://www.saq.com/media/catalog/product/1/4/14990121-1_1675442766.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14990121', 'Espagne', 'Vin rouge | 1,5 L | Espagne', 235, 'https://www.saq.com/fr/14990121', 'https://www.saq.com/media/catalog/product/1/4/14990121-1_1675442766.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '1,5 L', 1),
(116, 'Alvaro Palacios L\'Ermita 2019', 'https://www.saq.com/media/catalog/product/1/4/14731138-1_1637329511.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14731138', 'Espagne', 'Vin rouge | 750 ml | Espagne', 1, 'https://www.saq.com/fr/14731138', 'https://www.saq.com/media/catalog/product/1/4/14731138-1_1637329511.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(117, 'Alvaro Palacios L\'Ermita 2018', 'https://www.saq.com/media/catalog/product/1/4/14296463-1_1605726649.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14296463', 'Espagne', 'Vin rouge | 750 ml | Espagne', 1, 'https://www.saq.com/fr/14296463', 'https://www.saq.com/media/catalog/product/1/4/14296463-1_1605726649.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(118, 'Alvaro Palacios L\'Ermita 2015', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '13114058', 'Espagne', 'Vin rouge | 750 ml | Espagne', 1, 'https://www.saq.com/fr/13114058', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '750 ml', 1),
(119, 'Alvaro Palacios Les Aubaguetes Priorat 2019', 'https://www.saq.com/media/catalog/product/1/4/14731120-1_1637329510.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14731120', 'Espagne', 'Vin rouge | 750 ml | Espagne', 420, 'https://www.saq.com/fr/14731120', 'https://www.saq.com/media/catalog/product/1/4/14731120-1_1637329510.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(120, 'Alvaro Palacios Les Aubaguetes Priorat 2018', 'https://www.saq.com/media/catalog/product/1/4/14295989-1_1605726649.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14295989', 'Espagne', 'Vin rouge | 750 ml | Espagne', 459, 'https://www.saq.com/fr/14295989', 'https://www.saq.com/media/catalog/product/1/4/14295989-1_1605726649.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(121, 'Alvaro Palacios Les Aubaguetes Priorat 2016', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '13500311', 'Espagne', 'Vin rouge | 750 ml | Espagne', 393, 'https://www.saq.com/fr/13500311', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '750 ml', 1),
(122, 'Alvear Palacio Quemado la Zarcita 2020', 'https://www.saq.com/media/catalog/product/1/3/13844350-1_1578543322.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13844350', 'Espagne', 'Vin rouge | 750 ml | Espagne', 21, 'https://www.saq.com/fr/13844350', 'https://www.saq.com/media/catalog/product/1/3/13844350-1_1578543322.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(123, 'Alves de Sousa Gaivosa Primeros Anos 2019', 'https://www.saq.com/media/catalog/product/1/4/14072611-1_1578550820.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14072611', 'Portugal', 'Vin rouge | 750 ml | Portugal', 23, 'https://www.saq.com/fr/14072611', 'https://www.saq.com/media/catalog/product/1/4/14072611-1_1578550820.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1);
INSERT INTO `vino__bouteille` (`id`, `nom`, `image`, `code_saq`, `pays`, `description`, `prix_saq`, `url_saq`, `url_img`, `format`, `type`) VALUES
(124, 'Ama Chianti Classico 2020', 'https://www.saq.com/media/catalog/product/1/2/12019083-1_1584984920.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12019083', 'Italie', 'Vin rouge | 750 ml | Italie', 30, 'https://www.saq.com/fr/12019083', 'https://www.saq.com/media/catalog/product/1/2/12019083-1_1584984920.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(125, 'Ambasciata del Buon Vino Valpolicella Classico 2020', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '14744342', 'Italie', 'Vin rouge | 750 ml | Italie', 18, 'https://www.saq.com/fr/14744342', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', 1),
(126, 'Ambo Nero Provincia di Pavia 2018', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '14215379', 'Italie', 'Vin rouge | 1,5 L | Italie', 27, 'https://www.saq.com/fr/14215379', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '1,5 L', 1),
(127, 'Ambo Nero Provincia di Pavia', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '13487161', 'Italie', 'Vin rouge | 750 ml | Italie', 15, 'https://www.saq.com/fr/13487161', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', 1),
(128, 'AMI Bourgogne La Tête dans les Nuages 2020', 'https://www.saq.com/media/catalog/product/1/5/15086855-1_1675283150.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15086855', 'France', 'Vin rouge | 750 ml | France', 45, 'https://www.saq.com/fr/15086855', 'https://www.saq.com/media/catalog/product/1/5/15086855-1_1675283150.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(129, 'AMI Gaminot 2021', 'https://www.saq.com/media/catalog/product/1/5/15086871-1_1675892452.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15086871', 'France', 'Vin rouge | 750 ml | France', 36, 'https://www.saq.com/fr/15086871', 'https://www.saq.com/media/catalog/product/1/5/15086871-1_1675892452.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(130, 'Amora Brava Indio Rei Dão 2018', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '14492616', 'Portugal', 'Vin rouge | 750 ml | Portugal', 15, 'https://www.saq.com/fr/14492616', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(131, 'Ampeleia 2018', 'https://www.saq.com/media/catalog/product/1/3/13710950-1_1676299869.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13710950', 'Italie', 'Vin rouge | 750 ml | Italie', 47, 'https://www.saq.com/fr/13710950', 'https://www.saq.com/media/catalog/product/1/3/13710950-1_1676299869.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(132, 'Ampeleia Alicante Costa Toscana 2020', 'https://www.saq.com/media/catalog/product/1/3/13668878-1_1578540309.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13668878', 'Italie', 'Vin rouge | 750 ml | Italie', 38, 'https://www.saq.com/fr/13668878', 'https://www.saq.com/media/catalog/product/1/3/13668878-1_1578540309.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(133, 'Ampeleia Unlitro 2021', 'https://www.saq.com/media/catalog/product/1/4/14110500-1_1623358842.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14110500', 'Italie', 'Vin rouge | 1 L | Italie', 25, 'https://www.saq.com/fr/14110500', 'https://www.saq.com/media/catalog/product/1/4/14110500-1_1623358842.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '1 L', 1),
(134, 'Anakena Cabernet-Sauvignon', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '13284858', 'Chili', 'Vin rouge | 750 ml | Chili', 13, 'https://www.saq.com/fr/13284858', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(135, 'Anatolikos Mv Mavroudi of Thrace 2018', 'https://www.saq.com/media/catalog/product/1/4/14887571-1_1644269155.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14887571', 'Grèce', 'Vin rouge | 750 ml | Grèce', 30, 'https://www.saq.com/fr/14887571', 'https://www.saq.com/media/catalog/product/1/4/14887571-1_1644269155.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(136, 'Anciano Reserva Rioja Reserva 2016', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '14980724', 'Espagne', 'Vin rouge | 750 ml | Espagne', 17, 'https://www.saq.com/fr/14980724', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(137, 'André Perret St-Joseph 2020', 'https://www.saq.com/media/catalog/product/1/5/15025032-1_1666098964.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15025032', 'France', 'Vin rouge | 750 ml | France', 47, 'https://www.saq.com/fr/15025032', 'https://www.saq.com/media/catalog/product/1/5/15025032-1_1666098964.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(138, 'Andreas Gsellmann Zu Tisch Burgenland 2018', 'https://www.saq.com/media/catalog/product/1/4/14887597-1_1644269155.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14887597', 'Autriche', 'Vin rouge | 750 ml | Autriche', 24, 'https://www.saq.com/fr/14887597', 'https://www.saq.com/media/catalog/product/1/4/14887597-1_1644269155.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(139, 'Angeline Pinot Noir 2020', 'https://www.saq.com/media/catalog/product/1/3/13234754-1_1646859346.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13234754', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 22, 'https://www.saq.com/fr/13234754', 'https://www.saq.com/media/catalog/product/1/3/13234754-1_1646859346.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(140, 'Angove Long Row Shiraz 2019', 'https://www.saq.com/media/catalog/product/1/1/11325732-1_1580616016.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '11325732', 'Australie', 'Vin rouge | 750 ml | Australie', 16, 'https://www.saq.com/fr/11325732', 'https://www.saq.com/media/catalog/product/1/1/11325732-1_1580616016.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(141, 'Angove Organic South Australia', 'https://www.saq.com/media/catalog/product/1/4/14198169-1_1580352318.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14198169', 'Australie', 'Vin rouge | 750 ml | Australie', 16, 'https://www.saq.com/fr/14198169', 'https://www.saq.com/media/catalog/product/1/4/14198169-1_1580352318.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(142, 'Angove Wild Olive McLaren Vale Shiraz Méridionale 2020', 'https://www.saq.com/media/catalog/product/1/4/14910347-1_1661223038.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14910347', 'Australie', 'Vin rouge | 750 ml | Australie', 22, 'https://www.saq.com/fr/14910347', 'https://www.saq.com/media/catalog/product/1/4/14910347-1_1661223038.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(143, 'Animus Douro', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '11133239', 'Portugal', 'Vin rouge | 750 ml | Portugal', 13, 'https://www.saq.com/fr/11133239', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(144, 'Anita Kuhnel Moulin-? -Vent Reine de Nuit 2020', 'https://www.saq.com/media/catalog/product/1/3/13212563-1_1578442515.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13212563', 'France', 'Vin rouge | 750 ml | France', 34, 'https://www.saq.com/fr/13212563', 'https://www.saq.com/media/catalog/product/1/3/13212563-1_1578442515.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(145, 'Anseillan Pauillac 2018', 'https://www.saq.com/media/catalog/product/1/5/15097301-1_1675890952.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15097301', 'France', 'Vin rouge | 750 ml | France', 89, 'https://www.saq.com/fr/15097301', 'https://www.saq.com/media/catalog/product/1/5/15097301-1_1675890952.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(146, 'Anselmo Mendes Pardusco 2020', 'https://www.saq.com/media/catalog/product/1/4/14347574-1_1600272063.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14347574', 'Portugal', 'Vin rouge | 750 ml | Portugal', 15, 'https://www.saq.com/fr/14347574', 'https://www.saq.com/media/catalog/product/1/4/14347574-1_1600272063.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(147, 'Anthony Road Cabernet Franc - Lemberger Finger Lakes 2019', 'https://www.saq.com/media/catalog/product/1/4/14984178-1_1659636350.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14984178', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 30, 'https://www.saq.com/fr/14984178', 'https://www.saq.com/media/catalog/product/1/4/14984178-1_1659636350.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(148, 'Antigal Uno Cabernet Sauvignon Mendoza 2018', 'https://www.saq.com/media/catalog/product/1/4/14273739-1_1580336115.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14273739', 'Argentine', 'Vin rouge | 750 ml | Argentine', 23, 'https://www.saq.com/fr/14273739', 'https://www.saq.com/media/catalog/product/1/4/14273739-1_1580336115.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(149, 'Antinori Peppoli Chianti Classico 2020', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '10270928', 'Italie', 'Vin rouge | 750 ml | Italie', 25, 'https://www.saq.com/fr/10270928', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(150, 'Antinori Pian delle Vigne Rosso di Montalcino 2020', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '14719876', 'Italie', 'Vin rouge | 750 ml | Italie', 28, 'https://www.saq.com/fr/14719876', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(151, 'Antiyal Pura Fe Carmenere Valle el Maipo 2020', 'https://www.saq.com/media/catalog/product/1/4/14691375-1_1626973234.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14691375', 'Chili', 'Vin rouge | 750 ml | Chili', 28, 'https://www.saq.com/fr/14691375', 'https://www.saq.com/media/catalog/product/1/4/14691375-1_1626973234.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(152, 'Antoine Bonet Merlot', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/flg_small.png?width=20&height=20', '447334', 'France', 'Vin rouge | 4 L | France', 51, 'https://www.saq.com/fr/447334', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/flg_small.png?width=20&height=20', '4 L', 1),
(153, 'Antoine Moueix La Grande Chapelle Bordeaux', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '36012', 'France', 'Vin rouge | 750 ml | France', 14, 'https://www.saq.com/fr/36012', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', 1),
(154, 'Antoine Sanzay Saumur-Champigny La Paterne 2019', 'https://www.saq.com/media/catalog/product/1/4/14988937-1_1656599530.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14988937', 'France', 'Vin rouge | 750 ml | France', 30, 'https://www.saq.com/fr/14988937', 'https://www.saq.com/media/catalog/product/1/4/14988937-1_1656599530.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(155, 'Antoine Sanzay Saumur-Champigny Les Poyeux 2018', 'https://www.saq.com/media/catalog/product/1/4/14703743-1_1619097066.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14703743', 'France', 'Vin rouge | 750 ml | France', 61, 'https://www.saq.com/fr/14703743', 'https://www.saq.com/media/catalog/product/1/4/14703743-1_1619097066.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(156, 'Antoine Sunier Morgon 2020', 'https://www.saq.com/media/catalog/product/1/4/14984231-1_1650399339.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14984231', 'France', 'Vin rouge | 750 ml | France', 35, 'https://www.saq.com/fr/14984231', 'https://www.saq.com/media/catalog/product/1/4/14984231-1_1650399339.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(157, 'Antoine Sunier Régnié 2020', 'https://www.saq.com/media/catalog/product/1/4/14040556-1_1613401223.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14040556', 'France', 'Vin rouge | 750 ml | France', 32, 'https://www.saq.com/fr/14040556', 'https://www.saq.com/media/catalog/product/1/4/14040556-1_1613401223.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(158, 'Antoine Sunier Régnié Cuvée Montmerond 2020', 'https://www.saq.com/media/catalog/product/1/4/14793494-1_1634591430.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14793494', 'France', 'Vin rouge | 750 ml | France', 38, 'https://www.saq.com/fr/14793494', 'https://www.saq.com/media/catalog/product/1/4/14793494-1_1634591430.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(159, 'Antonin Rodet Coteaux Bourguignons', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/flg_small.png?width=20&height=20', '13188815', 'France', 'Vin rouge | 750 ml | France', 16, 'https://www.saq.com/fr/13188815', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/flg_small.png?width=20&height=20', '750 ml', 1),
(160, 'Antonin Rodet Gevrey-Chambertin 2009', 'https://www.saq.com/media/catalog/product/1/0/10295308-1_1580595616.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '10295308', 'France', 'Vin rouge | 750 ml | France', 42, 'https://www.saq.com/fr/10295308', 'https://www.saq.com/media/catalog/product/1/0/10295308-1_1580595616.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(161, 'Antonio Lopes Ribeiro Casa de Mouraz Dao 2016', 'https://www.saq.com/media/catalog/product/1/4/14731277-1_1627416946.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14731277', 'Portugal', 'Vin rouge | 750 ml | Portugal', 22, 'https://www.saq.com/fr/14731277', 'https://www.saq.com/media/catalog/product/1/4/14731277-1_1627416946.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(162, 'Antu Cabernet Sauvignon Carmenère Valle de Colchagua', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '11386885', 'Chili', 'Vin rouge | 750 ml | Chili', 19, 'https://www.saq.com/fr/11386885', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(163, 'Antu Syrah 2020', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '11966370', 'Chili', 'Vin rouge | 750 ml | Chili', 20, 'https://www.saq.com/fr/11966370', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(164, 'Apex Cellars The Catalyst Columbia Valley 2017', 'https://www.saq.com/media/catalog/product/1/3/13563857-1_1578537615.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13563857', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 29, 'https://www.saq.com/fr/13563857', 'https://www.saq.com/media/catalog/product/1/3/13563857-1_1578537615.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(165, 'Apothic Cabernet Sauvignon 2020', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '14682372', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 14, 'https://www.saq.com/fr/14682372', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(166, 'Apothic Merlot 2020', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '15108073', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 16, 'https://www.saq.com/fr/15108073', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(167, 'Apothic Red 2020', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '14467373', 'États-Unis', 'Vin rouge | 3 L | États-Unis', 50, 'https://www.saq.com/fr/14467373', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '3 L', 1),
(168, 'Apothic Red', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '11315497', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 16, 'https://www.saq.com/fr/11315497', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', 1),
(169, 'Appétit de France Syrah Grenache', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '12990195', 'France', 'Vin rouge | 1 L | France', 11, 'https://www.saq.com/fr/12990195', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '1 L', 1),
(170, 'Aquinas Pinot Noir North Coast 2018', 'https://www.saq.com/media/catalog/product/1/3/13699711-1_1583867726.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13699711', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 24, 'https://www.saq.com/fr/13699711', 'https://www.saq.com/media/catalog/product/1/3/13699711-1_1583867726.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(171, 'Ar Pe Pe Il Pettirosso Valtellina Superiore 2018', 'https://www.saq.com/media/catalog/product/1/4/14254503-1_1580352618.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14254503', 'Italie', 'Vin rouge | 750 ml | Italie', 52, 'https://www.saq.com/fr/14254503', 'https://www.saq.com/media/catalog/product/1/4/14254503-1_1580352618.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(172, 'Ar Pe Pe Ultimi Raggi Valtellina Superiore 2013', 'https://www.saq.com/media/catalog/product/1/4/14254571-1_1580352618.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14254571', 'Italie', 'Vin rouge | 750 ml | Italie', 124, 'https://www.saq.com/fr/14254571', 'https://www.saq.com/media/catalog/product/1/4/14254571-1_1580352618.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(173, 'Ar.Pe.Pe. Grumello Rocca de Piro 2017', 'https://www.saq.com/media/catalog/product/1/3/13587883-1_1578538515.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13587883', 'Italie', 'Vin rouge | 750 ml | Italie', 62, 'https://www.saq.com/fr/13587883', 'https://www.saq.com/media/catalog/product/1/3/13587883-1_1578538515.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(174, 'Aranleon Blés Valencia', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '10856427', 'Espagne', 'Vin rouge | 750 ml | Espagne', 15, 'https://www.saq.com/fr/10856427', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', 1),
(175, 'Aranléon Solo Utiel-Requena 2020', 'https://www.saq.com/media/catalog/product/1/4/14346740-1_1674510365.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14346740', 'Espagne', 'Vin rouge | 750 ml | Espagne', 19, 'https://www.saq.com/fr/14346740', 'https://www.saq.com/media/catalog/product/1/4/14346740-1_1674510365.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(176, 'Araucano Carmenère Reserva Vallée de Colchagua 2020', 'https://www.saq.com/media/catalog/product/1/0/10694413-1_1580599213.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '10694413', 'Chili', 'Vin rouge | 750 ml | Chili', 15, 'https://www.saq.com/fr/10694413', 'https://www.saq.com/media/catalog/product/1/0/10694413-1_1580599213.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(177, 'Araucano Humo Blanco Vallée de Lolol 2020', 'https://www.saq.com/media/catalog/product/1/4/14204320-1_1622473241.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14204320', 'Chili', 'Vin rouge | 750 ml | Chili', 20, 'https://www.saq.com/fr/14204320', 'https://www.saq.com/media/catalog/product/1/4/14204320-1_1622473241.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(178, 'Arbois-Pupillin Trousseau ? la Dame 2021', 'https://www.saq.com/media/catalog/product/1/4/14545280-1_1593101766.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14545280', 'France', 'Vin rouge | 750 ml | France', 25, 'https://www.saq.com/fr/14545280', 'https://www.saq.com/media/catalog/product/1/4/14545280-1_1593101766.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(179, 'Arboleda Cabernet-Sauvignon Valle de Aconcagua', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '10967434', 'Chili', 'Vin rouge | 750 ml | Chili', 19, 'https://www.saq.com/fr/10967434', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(180, 'Arcanum Il Fauno 2019', 'https://www.saq.com/media/catalog/product/1/3/13264646-1_1578443416.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13264646', 'Italie', 'Vin rouge | 750 ml | Italie', 49, 'https://www.saq.com/fr/13264646', 'https://www.saq.com/media/catalog/product/1/3/13264646-1_1578443416.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(181, 'Argatia Xinomavro Naoussa 2015', 'https://www.saq.com/media/catalog/product/1/4/14099970-1_1580352312.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14099970', 'Grèce', 'Vin rouge | 750 ml | Grèce', 31, 'https://www.saq.com/fr/14099970', 'https://www.saq.com/media/catalog/product/1/4/14099970-1_1580352312.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(182, 'Argentiera Bolgheri Superiore 2018', 'https://www.saq.com/media/catalog/product/1/1/11547378-1_1580622918.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '11547378', 'Italie', 'Vin rouge | 750 ml | Italie', 108, 'https://www.saq.com/fr/11547378', 'https://www.saq.com/media/catalog/product/1/1/11547378-1_1580622918.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(183, 'Argiano Brunello-di-Montalcino 2017', 'https://www.saq.com/media/catalog/product/1/0/10252658-1_1580594716.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '10252658', 'Italie', 'Vin rouge | 750 ml | Italie', 67, 'https://www.saq.com/fr/10252658', 'https://www.saq.com/media/catalog/product/1/0/10252658-1_1580594716.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(184, 'Argiano Non Confunditur 2020', 'https://www.saq.com/media/catalog/product/1/1/11269401-1_1661224530.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '11269401', 'Italie', 'Vin rouge | 750 ml | Italie', 22, 'https://www.saq.com/fr/11269401', 'https://www.saq.com/media/catalog/product/1/1/11269401-1_1661224530.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(185, 'Argiano Rosso di Montalcino 2020', 'https://www.saq.com/media/catalog/product/1/0/10252869-1_1634862089.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '10252869', 'Italie', 'Vin rouge | 750 ml | Italie', 31, 'https://www.saq.com/fr/10252869', 'https://www.saq.com/media/catalog/product/1/0/10252869-1_1634862089.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(186, 'Argiano Solengo 2019', 'https://www.saq.com/media/catalog/product/1/4/14771623-1_1626357625.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14771623', 'Italie', 'Vin rouge | 750 ml | Italie', 91, 'https://www.saq.com/fr/14771623', 'https://www.saq.com/media/catalog/product/1/4/14771623-1_1626357625.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(187, 'Argiolas Cardanera Carignano del Sulcis 2021', 'https://www.saq.com/media/catalog/product/1/4/14501480-1_1595609148.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14501480', 'Italie', 'Vin rouge | 750 ml | Italie', 20, 'https://www.saq.com/fr/14501480', 'https://www.saq.com/media/catalog/product/1/4/14501480-1_1595609148.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(188, 'Arianna Occhipinti Il Frappato 2020', 'https://www.saq.com/media/catalog/product/1/4/14577206-1_1604431838.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14577206', 'Italie', 'Vin rouge | 750 ml | Italie', 53, 'https://www.saq.com/fr/14577206', 'https://www.saq.com/media/catalog/product/1/4/14577206-1_1604431838.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(189, 'Arianna Occhipinti Siccagno 2019', 'https://www.saq.com/media/catalog/product/1/2/12613955-1_1578359416.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12613955', 'Italie', 'Vin rouge | 750 ml | Italie', 52, 'https://www.saq.com/fr/12613955', 'https://www.saq.com/media/catalog/product/1/2/12613955-1_1578359416.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(190, 'Arianna Occhipinti SP68 2021', 'https://www.saq.com/media/catalog/product/1/2/12429470-1_1604431834.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12429470', 'Italie', 'Vin rouge | 1,5 L | Italie', 68, 'https://www.saq.com/fr/12429470', 'https://www.saq.com/media/catalog/product/1/2/12429470-1_1604431834.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '1,5 L', 1),
(191, 'Arianna Occhipinti, Passo Nero Terre Sic 2019', 'https://www.saq.com/media/catalog/product/1/4/14495569-1_1590615025.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14495569', 'Italie', 'Vin rouge | 500 ml | Italie', 67, 'https://www.saq.com/fr/14495569', 'https://www.saq.com/media/catalog/product/1/4/14495569-1_1590615025.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '500 ml', 1),
(192, 'Armas Karmrahyut 2016', 'https://www.saq.com/media/catalog/product/1/3/13497458-1_1578536716.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13497458', 'Arménie (République d\')', 'Vin rouge | 750 ml | Arménie (République d\')', 23, 'https://www.saq.com/fr/13497458', 'https://www.saq.com/media/catalog/product/1/3/13497458-1_1578536716.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(193, 'Armenia 2020', 'https://www.saq.com/media/catalog/product/1/3/13110090-1_1606768839.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13110090', 'Arménie (République d\')', 'Vin rouge | 750 ml | Arménie (République d\')', 19, 'https://www.saq.com/fr/13110090', 'https://www.saq.com/media/catalog/product/1/3/13110090-1_1606768839.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(194, 'Arnaldo Caprai Montefalco Sagrantino 25 Anni 2012', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '13840359', 'Italie', 'Vin rouge | 1,5 L | Italie', 261, 'https://www.saq.com/fr/13840359', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '1,5 L', 1),
(195, 'Arnaldo Rivera Bussia Barolo 2017', 'https://www.saq.com/media/catalog/product/1/5/15089618-1_1669306269.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15089618', 'Italie', 'Vin rouge | 750 ml | Italie', 85, 'https://www.saq.com/fr/15089618', 'https://www.saq.com/media/catalog/product/1/5/15089618-1_1669306269.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(196, 'Arnaldo Rivera Castello Barolo 2017', 'https://www.saq.com/media/catalog/product/1/5/15089634-1_1673559069.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15089634', 'Italie', 'Vin rouge | 750 ml | Italie', 85, 'https://www.saq.com/fr/15089634', 'https://www.saq.com/media/catalog/product/1/5/15089634-1_1673559069.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(197, 'Arnaldo Rivera Ravera Barolo 2017', 'https://www.saq.com/media/catalog/product/1/5/15089626-1_1669901458.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15089626', 'Italie', 'Vin rouge | 750 ml | Italie', 85, 'https://www.saq.com/fr/15089626', 'https://www.saq.com/media/catalog/product/1/5/15089626-1_1669901458.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(198, 'Arnaldo Rivera Undicicomuni Barolo 2016', 'https://www.saq.com/media/catalog/product/1/4/14027087-1_1578549617.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14027087', 'Italie', 'Vin rouge | 750 ml | Italie', 50, 'https://www.saq.com/fr/14027087', 'https://www.saq.com/media/catalog/product/1/4/14027087-1_1578549617.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(199, 'Arnoux Père et Fils Savigny-Les-Beaune Les Pimentiers 2018', 'https://www.saq.com/media/catalog/product/1/5/15002439-1_1660757150.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15002439', 'France', 'Vin rouge | 750 ml | France', 41, 'https://www.saq.com/fr/15002439', 'https://www.saq.com/media/catalog/product/1/5/15002439-1_1660757150.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(200, 'ArPePe Rosso di Valtellina 2020', 'https://www.saq.com/media/catalog/product/1/2/12257997-1_1580661919.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12257997', 'Italie', 'Vin rouge | 750 ml | Italie', 40, 'https://www.saq.com/fr/12257997', 'https://www.saq.com/media/catalog/product/1/2/12257997-1_1580661919.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(201, 'Arpepe Stella Retica Riserva 2017', 'https://www.saq.com/media/catalog/product/1/3/13587832-1_1603915851.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13587832', 'Italie', 'Vin rouge | 750 ml | Italie', 62, 'https://www.saq.com/fr/13587832', 'https://www.saq.com/media/catalog/product/1/3/13587832-1_1603915851.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(202, 'Art\'s de France Beaujolais', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '13189041', 'France', 'Vin rouge | 750 ml | France', 13, 'https://www.saq.com/fr/13189041', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', 1),
(203, 'Artezin Zinfandel Mendocino County 2019', 'https://www.saq.com/media/catalog/product/1/0/10754148-1_1580599816.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '10754148', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 25, 'https://www.saq.com/fr/10754148', 'https://www.saq.com/media/catalog/product/1/0/10754148-1_1580599816.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(204, 'Arthur Metz Pinot Noir 2020', 'https://www.saq.com/media/catalog/product/1/5/15045009-1_1668697858.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15045009', 'France', 'Vin rouge | 750 ml | France', 20, 'https://www.saq.com/fr/15045009', 'https://www.saq.com/media/catalog/product/1/5/15045009-1_1668697858.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(205, 'Artis Merlot Vin de France', 'https://www.saq.com/media/catalog/product/1/4/14323871-1_1590615021.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14323871', 'France', 'Vin rouge | 750 ml | France', 9, 'https://www.saq.com/fr/14323871', 'https://www.saq.com/media/catalog/product/1/4/14323871-1_1590615021.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(206, 'Artisans Partisans Les Sentiers Pinot Noir Alicante 2020', 'https://www.saq.com/media/catalog/product/1/4/14783704-1_1628520625.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14783704', 'France', 'Vin rouge | 750 ml | France', 17, 'https://www.saq.com/fr/14783704', 'https://www.saq.com/media/catalog/product/1/4/14783704-1_1628520625.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(207, 'Arzuaga Reserva 2017', 'https://www.saq.com/media/catalog/product/9/0/902841-1_1604435154.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '902841', 'Espagne', 'Vin rouge | 750 ml | Espagne', 63, 'https://www.saq.com/fr/902841', 'https://www.saq.com/media/catalog/product/9/0/902841-1_1604435154.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(208, 'Ashwood Estate Sidewood Stablemate Cabernet-Sauvignon Adelaide Hills 2019', 'https://www.saq.com/media/catalog/product/1/4/14731816-1_1634060125.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14731816', 'Australie', 'Vin rouge | 750 ml | Australie', 19, 'https://www.saq.com/fr/14731816', 'https://www.saq.com/media/catalog/product/1/4/14731816-1_1634060125.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(209, 'Ashwood Sidewood Estate Shiraz Australie 2019', 'https://www.saq.com/media/catalog/product/1/3/13699421-1_1578540923.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13699421', 'Australie', 'Vin rouge | 750 ml | Australie', 22, 'https://www.saq.com/fr/13699421', 'https://www.saq.com/media/catalog/product/1/3/13699421-1_1578540923.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(210, 'Astorre Noti Chianti', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '14444930', 'Italie', 'Vin rouge | 750 ml | Italie', 14, 'https://www.saq.com/fr/14444930', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', 1),
(211, 'Astorre Noti Chianti Riserva 2014', 'https://www.saq.com/media/catalog/product/1/3/13870179-1_1578544510.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13870179', 'Italie', 'Vin rouge | 1,5 L | Italie', 35, 'https://www.saq.com/fr/13870179', 'https://www.saq.com/media/catalog/product/1/3/13870179-1_1578544510.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '1,5 L', 1),
(212, 'Astorre Noti Chianti Riserva 2017', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '13460655', 'Italie', 'Vin rouge | 750 ml | Italie', 18, 'https://www.saq.com/fr/13460655', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(213, 'Au Bon Climat Isabelle Pinot Noir 2019', 'https://www.saq.com/media/catalog/product/1/4/14558873-1_1594231230.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14558873', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 78, 'https://www.saq.com/fr/14558873', 'https://www.saq.com/media/catalog/product/1/4/14558873-1_1594231230.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(214, 'Au Bon Climat Pinot Noir Santa Barbara 2020', 'https://www.saq.com/media/catalog/product/1/1/11604192-1_1613401221.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '11604192', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 37, 'https://www.saq.com/fr/11604192', 'https://www.saq.com/media/catalog/product/1/1/11604192-1_1613401221.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(215, 'Au Pied du Mont Chauve Chassagne-Montrachet 2018', 'https://www.saq.com/media/catalog/product/1/4/14995627-1_1659537956.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14995627', 'France', 'Vin rouge | 750 ml | France', 66, 'https://www.saq.com/fr/14995627', 'https://www.saq.com/media/catalog/product/1/4/14995627-1_1659537956.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(216, 'Au Pied du Mont Chauve Hautes-Côtes de Beaune 2019', 'https://www.saq.com/media/catalog/product/1/4/14994931-1_1659553564.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14994931', 'France', 'Vin rouge | 750 ml | France', 38, 'https://www.saq.com/fr/14994931', 'https://www.saq.com/media/catalog/product/1/4/14994931-1_1659553564.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(217, 'Au Pied du Mont Chauve Saint-Aubin Premier Cru Le Charmois 2018', 'https://www.saq.com/media/catalog/product/1/4/14994915-1_1659553564.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14994915', 'France', 'Vin rouge | 750 ml | France', 61, 'https://www.saq.com/fr/14994915', 'https://www.saq.com/media/catalog/product/1/4/14994915-1_1659553564.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(218, 'Aubert & Mathieu Corbières Marie Antoinette 2021', 'https://www.saq.com/media/catalog/product/1/4/14713061-1_1620249350.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14713061', 'France', 'Vin rouge | 750 ml | France', 21, 'https://www.saq.com/fr/14713061', 'https://www.saq.com/media/catalog/product/1/4/14713061-1_1620249350.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(219, 'Aubert & Mathieu Hautes Pistes Pinot Noir 2021', 'https://www.saq.com/media/catalog/product/1/5/15082758-1_1669992659.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15082758', 'France', 'Vin rouge | 750 ml | France', 18, 'https://www.saq.com/fr/15082758', 'https://www.saq.com/media/catalog/product/1/5/15082758-1_1669992659.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(220, 'Aupa Pipeño Pais Carignan 2021', 'https://www.saq.com/media/catalog/product/1/4/14939035-1_1666639849.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14939035', 'Chili', 'Vin rouge | 750 ml | Chili', 19, 'https://www.saq.com/fr/14939035', 'https://www.saq.com/media/catalog/product/1/4/14939035-1_1666639849.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(221, 'Aurélie et Fabien Romany Beaujolais Le Moulin 2021', 'https://www.saq.com/media/catalog/product/1/5/15048939-1_1673016658.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15048939', 'France', 'Vin rouge | 750 ml | France', 24, 'https://www.saq.com/fr/15048939', 'https://www.saq.com/media/catalog/product/1/5/15048939-1_1673016658.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(222, 'Austin Hope Cabernet-Sauvignon Paso Robles 2020', 'https://www.saq.com/media/catalog/product/1/5/15081641-1_1664398267.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15081641', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 75, 'https://www.saq.com/fr/15081641', 'https://www.saq.com/media/catalog/product/1/5/15081641-1_1664398267.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(223, 'Austin Hope Troublemaker Central Coast 2018', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '11509582', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 25, 'https://www.saq.com/fr/11509582', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(224, 'Ava Grace Merlot 2015', 'https://www.saq.com/media/catalog/product/1/3/13554694-1_1580668213.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13554694', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 17, 'https://www.saq.com/fr/13554694', 'https://www.saq.com/media/catalog/product/1/3/13554694-1_1580668213.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(225, 'Aveleda Regional Lisboa 2020', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '14907949', 'Portugal', 'Vin rouge | 750 ml | Portugal', 14, 'https://www.saq.com/fr/14907949', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(226, 'Avondale Jonty\'s Duck Pekin Paarl 2017', 'https://www.saq.com/media/catalog/product/1/4/14446089-1_1595969716.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14446089', 'Afrique du Sud', 'Vin rouge | 750 ml | Afrique du Sud', 17, 'https://www.saq.com/fr/14446089', 'https://www.saq.com/media/catalog/product/1/4/14446089-1_1595969716.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(227, 'Axel Pauly Fruhburgunder Pinot Noir Mosel 2019', 'https://www.saq.com/media/catalog/product/1/4/14147628-1_1654864840.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14147628', 'Allemagne', 'Vin rouge | 750 ml | Allemagne', 48, 'https://www.saq.com/fr/14147628', 'https://www.saq.com/media/catalog/product/1/4/14147628-1_1654864840.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(228, 'Azelia Barolo 2018', 'https://www.saq.com/media/catalog/product/1/3/13686128-1_1673300461.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13686128', 'Italie', 'Vin rouge | 750 ml | Italie', 58, 'https://www.saq.com/fr/13686128', 'https://www.saq.com/media/catalog/product/1/3/13686128-1_1673300461.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(229, 'Azelia Barolo Margheria 2017', 'https://www.saq.com/media/catalog/product/1/4/14148436-1_1624377341.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14148436', 'Italie', 'Vin rouge | 750 ml | Italie', 111, 'https://www.saq.com/fr/14148436', 'https://www.saq.com/media/catalog/product/1/4/14148436-1_1624377341.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(230, 'Azelia San Rocco 2000', 'https://www.saq.com/media/catalog/product/1/3/13685811-1_1664807759.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13685811', 'Italie', 'Vin rouge | 1,5 L | Italie', 378, 'https://www.saq.com/fr/13685811', 'https://www.saq.com/media/catalog/product/1/3/13685811-1_1664807759.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '1,5 L', 1),
(231, 'Azienda Agricola Biscaris Principuzzu Cerasuolo di Vittoria', 'https://www.saq.com/media/catalog/product/1/4/14924010-1_1647350141.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14924010', 'Italie', 'Vin rouge | 750 ml | Italie', 30, 'https://www.saq.com/fr/14924010', 'https://www.saq.com/media/catalog/product/1/4/14924010-1_1647350141.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(232, 'Azienda Agricola COS Frappato 2021', 'https://www.saq.com/media/catalog/product/1/2/12461488-1_1580665815.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12461488', 'Italie', 'Vin rouge | 750 ml | Italie', 32, 'https://www.saq.com/fr/12461488', 'https://www.saq.com/media/catalog/product/1/2/12461488-1_1580665815.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(233, 'Azienda Agricola Falletto Asili Barbaresco 2017', 'https://www.saq.com/media/catalog/product/1/4/14510950-1_1593533118.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14510950', 'Italie', 'Vin rouge | 750 ml | Italie', 299, 'https://www.saq.com/fr/14510950', 'https://www.saq.com/media/catalog/product/1/4/14510950-1_1593533118.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(234, 'Azienda Agricola Falletto Asili Barbaresco 2015', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '13755496', 'Italie', 'Vin rouge | 750 ml | Italie', 278, 'https://www.saq.com/fr/13755496', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '750 ml', 1),
(235, 'Azienda Agricola Falletto Barbaresco Rabaj? 2016', 'https://www.saq.com/media/catalog/product/1/4/14510925-1_1593533118.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14510925', 'Italie', 'Vin rouge | 750 ml | Italie', 327, 'https://www.saq.com/fr/14510925', 'https://www.saq.com/media/catalog/product/1/4/14510925-1_1593533118.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(236, 'Azienda Agricola Fiorano Marche Sangiovese 2020', 'https://www.saq.com/media/catalog/product/1/4/14930751-1_1654014640.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14930751', 'Italie', 'Vin rouge | 750 ml | Italie', 21, 'https://www.saq.com/fr/14930751', 'https://www.saq.com/media/catalog/product/1/4/14930751-1_1654014640.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(237, 'Azienda Agricola Fiorano Terre Di Giobbe Rosso Piceno Superiore 2018', 'https://www.saq.com/media/catalog/product/1/4/14928740-1_1654014640.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14928740', 'Italie', 'Vin rouge | 750 ml | Italie', 25, 'https://www.saq.com/fr/14928740', 'https://www.saq.com/media/catalog/product/1/4/14928740-1_1654014640.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(238, 'Azienda Agricola Fontefico Cocca di Casa 2017', 'https://www.saq.com/media/catalog/product/1/4/14930735-1_1649261143.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14930735', 'Italie', 'Vin rouge | 750 ml | Italie', 30, 'https://www.saq.com/fr/14930735', 'https://www.saq.com/media/catalog/product/1/4/14930735-1_1649261143.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(239, 'Azienda Agricola Frank Cornelissen MunJebel BB 2018', 'https://www.saq.com/media/catalog/product/1/4/14979897-1_1653419739.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14979897', 'Italie', 'Vin rouge | 750 ml | Italie', 126, 'https://www.saq.com/fr/14979897', 'https://www.saq.com/media/catalog/product/1/4/14979897-1_1653419739.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(240, 'Azienda Agricola Frank Cornelissen MunJebel Calderara Sottana 2018', 'https://www.saq.com/media/catalog/product/1/4/14979900-1_1653061848.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14979900', 'Italie', 'Vin rouge | 750 ml | Italie', 89, 'https://www.saq.com/fr/14979900', 'https://www.saq.com/media/catalog/product/1/4/14979900-1_1653061848.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(241, 'Azienda Agricola Frank Cornelissen Munjebel CR 2018', 'https://www.saq.com/media/catalog/product/1/4/14973065-1_1653419739.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14973065', 'Italie', 'Vin rouge | 750 ml | Italie', 89, 'https://www.saq.com/fr/14973065', 'https://www.saq.com/media/catalog/product/1/4/14973065-1_1653419739.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(242, 'Azienda Agricola Frank Cornelissen MunJebel CS 2018', 'https://www.saq.com/media/catalog/product/1/4/14973073-1_1653416476.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14973073', 'Italie', 'Vin rouge | 750 ml | Italie', 89, 'https://www.saq.com/fr/14973073', 'https://www.saq.com/media/catalog/product/1/4/14973073-1_1653416476.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(243, 'Azienda Agricola Frank Cornelissen MunJebel FM 2018', 'https://www.saq.com/media/catalog/product/1/4/14973081-1_1653419739.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14973081', 'Italie', 'Vin rouge | 750 ml | Italie', 89, 'https://www.saq.com/fr/14973081', 'https://www.saq.com/media/catalog/product/1/4/14973081-1_1653419739.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(244, 'Azienda Agricola Frank Cornelissen Munjebel MC 2018', 'https://www.saq.com/media/catalog/product/1/4/14973090-1_1653416476.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14973090', 'Italie', 'Vin rouge | 750 ml | Italie', 89, 'https://www.saq.com/fr/14973090', 'https://www.saq.com/media/catalog/product/1/4/14973090-1_1653416476.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(245, 'Azienda Agricola Frank Cornelissen MunJebel PA 2018', 'https://www.saq.com/media/catalog/product/1/4/14979918-1_1653419740.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14979918', 'Italie', 'Vin rouge | 750 ml | Italie', 89, 'https://www.saq.com/fr/14979918', 'https://www.saq.com/media/catalog/product/1/4/14979918-1_1653419740.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(246, 'Azienda Agricola Frank Cornelissen MunJebel Perpetuum', 'https://www.saq.com/media/catalog/product/1/4/14979889-1_1653419739.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14979889', 'Italie', 'Vin rouge | 750 ml | Italie', 126, 'https://www.saq.com/fr/14979889', 'https://www.saq.com/media/catalog/product/1/4/14979889-1_1653419739.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(247, 'Azienda Agricola Frank Cornelissen MunJebel PU 2018', 'https://www.saq.com/media/catalog/product/1/4/14979926-1_1653419740.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14979926', 'Italie', 'Vin rouge | 750 ml | Italie', 89, 'https://www.saq.com/fr/14979926', 'https://www.saq.com/media/catalog/product/1/4/14979926-1_1653419740.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1);
INSERT INTO `vino__bouteille` (`id`, `nom`, `image`, `code_saq`, `pays`, `description`, `prix_saq`, `url_saq`, `url_img`, `format`, `type`) VALUES
(248, 'Azienda Agricola Marchesi Incisa della Rocchetta Valmorena 2020', 'https://www.saq.com/media/catalog/product/1/2/12661480-1_1643759136.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12661480', 'Italie', 'Vin rouge | 750 ml | Italie', 21, 'https://www.saq.com/fr/12661480', 'https://www.saq.com/media/catalog/product/1/2/12661480-1_1643759136.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(249, 'Azienda Agricola Poliziano Rosso di Montepulciano 2021', 'https://www.saq.com/media/catalog/product/1/3/13630343-1_1634748032.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13630343', 'Italie', 'Vin rouge | 750 ml | Italie', 23, 'https://www.saq.com/fr/13630343', 'https://www.saq.com/media/catalog/product/1/3/13630343-1_1634748032.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(250, 'Azienda Agricola Sottimano Bric del Salto 2021', 'https://www.saq.com/media/catalog/product/1/0/10856558-1_1660239047.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '10856558', 'Italie', 'Vin rouge | 750 ml | Italie', 24, 'https://www.saq.com/fr/10856558', 'https://www.saq.com/media/catalog/product/1/0/10856558-1_1660239047.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(251, 'Azienda Agricola Valentina Cubi Amarone Morar 2012', 'https://www.saq.com/media/catalog/product/1/4/14933979-1_1646859642.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14933979', 'Italie', 'Vin rouge | 750 ml | Italie', 78, 'https://www.saq.com/fr/14933979', 'https://www.saq.com/media/catalog/product/1/4/14933979-1_1646859642.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(252, 'Azienda Vinicola Rivera Castel Del Monte Rosso Riserva 2016', 'https://www.saq.com/media/catalog/product/1/3/13026701-1_1581312613.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13026701', 'Italie', 'Vin rouge | 1,5 L | Italie', 50, 'https://www.saq.com/fr/13026701', 'https://www.saq.com/media/catalog/product/1/3/13026701-1_1581312613.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '1,5 L', 1),
(253, 'Azul y Garanza Cabirol Montsant 2021', 'https://www.saq.com/media/catalog/product/1/3/13632349-1_1578539713.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13632349', 'Espagne', 'Vin rouge | 750 ml | Espagne', 18, 'https://www.saq.com/fr/13632349', 'https://www.saq.com/media/catalog/product/1/3/13632349-1_1578539713.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(254, 'Azul y Garanza Naturaleza Salvaje Navarra 2020', 'https://www.saq.com/media/catalog/product/1/4/14432672-1_1585241416.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14432672', 'Espagne', 'Vin rouge | 750 ml | Espagne', 25, 'https://www.saq.com/fr/14432672', 'https://www.saq.com/media/catalog/product/1/4/14432672-1_1585241416.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(255, 'B par Maucaillou Bordeaux Supérieur 2018', 'https://www.saq.com/media/catalog/product/1/5/15011423-1_1661966746.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15011423', 'France', 'Vin rouge | 750 ml | France', 18, 'https://www.saq.com/fr/15011423', 'https://www.saq.com/media/catalog/product/1/5/15011423-1_1661966746.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(256, 'B.IO Nero d\'Avola Cabernet Sauvignon 2020', 'https://www.saq.com/media/catalog/product/1/3/13950515-1_1615827640.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13950515', 'Italie', 'Vin rouge | 750 ml | Italie', 19, 'https://www.saq.com/fr/13950515', 'https://www.saq.com/media/catalog/product/1/3/13950515-1_1615827640.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(257, 'Bacalhôa Catarina 2019', 'https://www.saq.com/media/catalog/product/1/4/14064101-1_1578550524.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14064101', 'Portugal', 'Vin rouge | 750 ml | Portugal', 15, 'https://www.saq.com/fr/14064101', 'https://www.saq.com/media/catalog/product/1/4/14064101-1_1578550524.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(258, 'Bacalhôa Quatro Ventos Douro Superior 2018', 'https://www.saq.com/media/catalog/product/1/1/11317177-1_1582217432.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '11317177', 'Portugal', 'Vin rouge | 750 ml | Portugal', 15, 'https://www.saq.com/fr/11317177', 'https://www.saq.com/media/catalog/product/1/1/11317177-1_1582217432.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(259, 'Bacalhôa Quinta da Garrida Reserva Touriga nacional Dão E Lafões 2016', 'https://www.saq.com/media/catalog/product/1/1/11845316-1_1661219732.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '11845316', 'Portugal', 'Vin rouge | 750 ml | Portugal', 18, 'https://www.saq.com/fr/11845316', 'https://www.saq.com/media/catalog/product/1/1/11845316-1_1661219732.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(260, 'Bachelder Gamay Wismer Foxcroft Vineyard 2020', 'https://www.saq.com/media/catalog/product/1/3/13993822-1_1626182724.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13993822', 'Canada', 'Vin rouge | 750 ml | Canada', 33, 'https://www.saq.com/fr/13993822', 'https://www.saq.com/media/catalog/product/1/3/13993822-1_1626182724.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(261, 'Bachelder Hanck Pinot Noir Twenty Mile Bench 2020', 'https://www.saq.com/media/catalog/product/1/4/14880011-1_1634574946.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14880011', 'Canada', 'Vin rouge | 750 ml | Canada', 50, 'https://www.saq.com/fr/14880011', 'https://www.saq.com/media/catalog/product/1/4/14880011-1_1634574946.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(262, 'Bachelder L\'Insouciant Gamay Péninsule de Niagara 2020', 'https://www.saq.com/media/catalog/product/1/4/14822363-1_1633611624.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14822363', 'Canada', 'Vin rouge | 750 ml | Canada', 24, 'https://www.saq.com/fr/14822363', 'https://www.saq.com/media/catalog/product/1/4/14822363-1_1633611624.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(263, 'Bachelder Les Villages Gamay Noir Péninsule du Niagara 2019', 'https://www.saq.com/media/catalog/product/1/4/14555411-1_1634154359.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14555411', 'Canada', 'Vin rouge | 750 ml | Canada', 25, 'https://www.saq.com/fr/14555411', 'https://www.saq.com/media/catalog/product/1/4/14555411-1_1634154359.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(264, 'Bachelder Les Villages Pinot Noir Niagara 2020', 'https://www.saq.com/media/catalog/product/1/4/14555584-1_1605537046.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14555584', 'Canada', 'Vin rouge | 750 ml | Canada', 40, 'https://www.saq.com/fr/14555584', 'https://www.saq.com/media/catalog/product/1/4/14555584-1_1605537046.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(265, 'Bachelder Lowrey Vineyard St David\'s Bench 2020', 'https://www.saq.com/media/catalog/product/1/4/14555576-1_1634060124.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14555576', 'Canada', 'Vin rouge | 750 ml | Canada', 55, 'https://www.saq.com/fr/14555576', 'https://www.saq.com/media/catalog/product/1/4/14555576-1_1634060124.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(266, 'Bachelder Parfum de Niagara 2020', 'https://www.saq.com/media/catalog/product/1/4/14559551-1_1628165432.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14559551', 'Canada', 'Vin rouge | 750 ml | Canada', 28, 'https://www.saq.com/fr/14559551', 'https://www.saq.com/media/catalog/product/1/4/14559551-1_1628165432.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(267, 'Bachelder Wismer Parke Vineyard 2020', 'https://www.saq.com/media/catalog/product/1/4/14232620-1_1605537042.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14232620', 'Canada', 'Vin rouge | 750 ml | Canada', 55, 'https://www.saq.com/fr/14232620', 'https://www.saq.com/media/catalog/product/1/4/14232620-1_1605537042.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(268, 'Badenhorst Family Wines Papegaai Red Swartland 2021', 'https://www.saq.com/media/catalog/product/1/5/15015580-1_1674482744.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15015580', 'Afrique du Sud', 'Vin rouge | 750 ml | Afrique du Sud', 21, 'https://www.saq.com/fr/15015580', 'https://www.saq.com/media/catalog/product/1/5/15015580-1_1674482744.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(269, 'Baglio di Pianetto Syrah 2019', 'https://www.saq.com/media/catalog/product/1/0/10960734-1_1605793228.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '10960734', 'Italie', 'Vin rouge | 750 ml | Italie', 15, 'https://www.saq.com/fr/10960734', 'https://www.saq.com/media/catalog/product/1/0/10960734-1_1605793228.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(270, 'Ballade de la Pointe Pomerol 2019', 'https://www.saq.com/media/catalog/product/1/4/14959677-1_1663272040.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14959677', 'France', 'Vin rouge | 750 ml | France', 42, 'https://www.saq.com/fr/14959677', 'https://www.saq.com/media/catalog/product/1/4/14959677-1_1663272040.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(271, 'Baltasar Grancian Crianza 2018', 'https://www.saq.com/media/catalog/product/1/3/13601964-1_1583268307.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13601964', 'Espagne', 'Vin rouge | 750 ml | Espagne', 23, 'https://www.saq.com/fr/13601964', 'https://www.saq.com/media/catalog/product/1/3/13601964-1_1583268307.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(272, 'Banfi Centine 2020', 'https://www.saq.com/media/catalog/product/1/1/11164457-1_1580614212.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '11164457', 'Italie', 'Vin rouge | 5 L | Italie', 141, 'https://www.saq.com/fr/11164457', 'https://www.saq.com/media/catalog/product/1/1/11164457-1_1580614212.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '5 L', 1),
(273, 'Barbi Brunello di Montalcino Riserva 2015', 'https://www.saq.com/media/catalog/product/1/3/13621674-1_1580352019.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13621674', 'Italie', 'Vin rouge | 750 ml | Italie', 112, 'https://www.saq.com/fr/13621674', 'https://www.saq.com/media/catalog/product/1/3/13621674-1_1580352019.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(274, 'Barefoot Shiraz', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '10915036', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 12, 'https://www.saq.com/fr/10915036', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', 1),
(275, 'Barefoot Zinfandel', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '11133175', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 12, 'https://www.saq.com/fr/11133175', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(276, 'Barkan Classic Cabernet-Sauvignon Galil 2021', 'https://www.saq.com/media/catalog/product/1/1/11375692-1_1605726644.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '11375692', 'Israël', 'Vin rouge | 750 ml | Israël', 22, 'https://www.saq.com/fr/11375692', 'https://www.saq.com/media/catalog/product/1/1/11375692-1_1605726644.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(277, 'Barkan Classic Shiraz 2019', 'https://www.saq.com/media/catalog/product/1/0/10961180-1_1580610916.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '10961180', 'Israël', 'Vin rouge | 750 ml | Israël', 22, 'https://www.saq.com/fr/10961180', 'https://www.saq.com/media/catalog/product/1/0/10961180-1_1580610916.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(278, 'Baron de Brane Margaux 2014', 'https://www.saq.com/media/catalog/product/1/5/15008232-1_1655910063.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15008232', 'France', 'Vin rouge | 750 ml | France', 50, 'https://www.saq.com/fr/15008232', 'https://www.saq.com/media/catalog/product/1/5/15008232-1_1655910063.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(279, 'Baron de Brane Margaux 2015', 'https://www.saq.com/media/catalog/product/1/5/15005883-1_1655842539.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15005883', 'France', 'Vin rouge | 750 ml | France', 58, 'https://www.saq.com/fr/15005883', 'https://www.saq.com/media/catalog/product/1/5/15005883-1_1655842539.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(280, 'Baron de Ley Gran Reserva 2015', 'https://www.saq.com/media/catalog/product/7/3/738997-1_1635771331.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '738997', 'Espagne', 'Vin rouge | 750 ml | Espagne', 32, 'https://www.saq.com/fr/738997', 'https://www.saq.com/media/catalog/product/7/3/738997-1_1635771331.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(281, 'Baron de Ley Reserva', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '868729', 'Espagne', 'Vin rouge | 750 ml | Espagne', 21, 'https://www.saq.com/fr/868729', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(282, 'Baron de Ley Reserva 2016', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '13760631', 'Espagne', 'Vin rouge | 1,5 L | Espagne', 42, 'https://www.saq.com/fr/13760631', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '1,5 L', 1),
(283, 'Baron de Ley Reserva 2017', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '11067737', 'Espagne', 'Vin rouge | 500 ml | Espagne', 16, 'https://www.saq.com/fr/11067737', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '500 ml', 1),
(284, 'Baron Herzog Cabernet-Sauvignon Californie 2020', 'https://www.saq.com/media/catalog/product/1/1/11092377-1_1644432335.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '11092377', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 20, 'https://www.saq.com/fr/11092377', 'https://www.saq.com/media/catalog/product/1/1/11092377-1_1644432335.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(285, 'Baron Herzog Jeunesse Black Muscat 2021', 'https://www.saq.com/media/catalog/product/1/2/12336353-1_1603910770.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12336353', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 20, 'https://www.saq.com/fr/12336353', 'https://www.saq.com/media/catalog/product/1/2/12336353-1_1603910770.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(286, 'Baron Herzog Old Vine Zinfandel Californie 2020', 'https://www.saq.com/media/catalog/product/1/1/11092342-1_1622473240.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '11092342', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 20, 'https://www.saq.com/fr/11092342', 'https://www.saq.com/media/catalog/product/1/1/11092342-1_1622473240.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(287, 'Baron Philippe de Rothschild La Bèlière 2021', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '15108241', 'France', 'Vin rouge | 750 ml | France', 16, 'https://www.saq.com/fr/15108241', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', 1),
(288, 'Baron Philippe de Rothschild Mapu Cabernet-Sauvignon/Carmenere', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '10530283', 'Chili', 'Vin rouge | 750 ml | Chili', 11, 'https://www.saq.com/fr/10530283', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(289, 'Baron Philippe de Rothschild Merlot / Cabernet-Sauvignon Pays d\'Oc 2021', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '11579513', 'France', 'Vin rouge | 750 ml | France', 14, 'https://www.saq.com/fr/11579513', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', 1),
(290, 'Baron Philippe de Rothschild Pays d\'Oc Pinot Noir', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/flg_small.png?width=20&height=20', '10915247', 'France', 'Vin rouge | 750 ml | France', 14, 'https://www.saq.com/fr/10915247', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/flg_small.png?width=20&height=20', '750 ml', 1),
(291, 'Barone Cornacchia Montepulciano d\'Abruzzo Casanova 2020', 'https://www.saq.com/media/catalog/product/9/7/979039-1_1603832158.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '979039', 'Italie', 'Vin rouge | 750 ml | Italie', 19, 'https://www.saq.com/fr/979039', 'https://www.saq.com/media/catalog/product/9/7/979039-1_1603832158.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(292, 'Barone Ricasoli Brolio Chianti-Classico', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '3962', 'Italie', 'Vin rouge | 750 ml | Italie', 24, 'https://www.saq.com/fr/3962', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(293, 'Barone Ricasoli Chianti', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '13188858', 'Italie', 'Vin rouge | 750 ml | Italie', 16, 'https://www.saq.com/fr/13188858', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(294, 'Barone Ricasoli Rocca Guicciarda Chianti Classico Riserva 2019', 'https://www.saq.com/media/catalog/product/1/0/10253440-1_1580594718.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '10253440', 'Italie', 'Vin rouge | 750 ml | Italie', 25, 'https://www.saq.com/fr/10253440', 'https://www.saq.com/media/catalog/product/1/0/10253440-1_1580594718.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(295, 'Barone Ricasoli Roncicone Chianti Classico 2017', 'https://www.saq.com/media/catalog/product/1/4/14350941-1_1581017114.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14350941', 'Italie', 'Vin rouge | 750 ml | Italie', 75, 'https://www.saq.com/fr/14350941', 'https://www.saq.com/media/catalog/product/1/4/14350941-1_1581017114.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(296, 'Barossa Boy Little Tacker Barossa Valley 2017', 'https://www.saq.com/media/catalog/product/1/4/14205197-1_1580352320.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14205197', 'Australie', 'Vin rouge | 750 ml | Australie', 23, 'https://www.saq.com/fr/14205197', 'https://www.saq.com/media/catalog/product/1/4/14205197-1_1580352320.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(297, 'Bartolo Mazzi Vittori Montepulciano d\'Abruzzo', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '12990179', 'Italie', 'Vin rouge | 750 ml | Italie', 9, 'https://www.saq.com/fr/12990179', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', 1),
(298, 'BDX Bordeaux', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '14375292', 'France', 'Vin rouge | 750 ml | France', 17, 'https://www.saq.com/fr/14375292', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(299, 'Beamsville Bench Meritage Terroir Caché Hidden Bench 2018', 'https://www.saq.com/media/catalog/product/1/2/12306411-1_1603910769.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12306411', 'Canada', 'Vin rouge | 750 ml | Canada', 50, 'https://www.saq.com/fr/12306411', 'https://www.saq.com/media/catalog/product/1/2/12306411-1_1603910769.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(300, 'Beau Bonhomme Jumilla', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '13284313', 'Espagne', 'Vin rouge | 750 ml | Espagne', 13, 'https://www.saq.com/fr/13284313', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(301, 'Beaulieu Vineyard Coastal Estates Cabernet Sauvignon', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '13640120', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 12, 'https://www.saq.com/fr/13640120', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(302, 'Beauty in Chaos Syrah Washington State', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '14375760', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 16, 'https://www.saq.com/fr/14375760', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(303, 'Belle Glos Las Alturas 2018', 'https://www.saq.com/media/catalog/product/1/2/12833940-1_1578411612.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12833940', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 60, 'https://www.saq.com/fr/12833940', 'https://www.saq.com/media/catalog/product/1/2/12833940-1_1578411612.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(304, 'Bellechaume Pierre Morin Sancerre 2019', 'https://www.saq.com/media/catalog/product/1/2/12202187-1_1677084657.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12202187', 'France', 'Vin rouge | 750 ml | France', 36, 'https://www.saq.com/fr/12202187', 'https://www.saq.com/media/catalog/product/1/2/12202187-1_1677084657.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(305, 'Ben Ami Wines Cabernet-Sauvignon Galil 2019', 'https://www.saq.com/media/catalog/product/1/1/11096888-1_1580612719.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '11096888', 'Israël', 'Vin rouge | 750 ml | Israël', 20, 'https://www.saq.com/fr/11096888', 'https://www.saq.com/media/catalog/product/1/1/11096888-1_1580612719.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(306, 'Ben-Ami Merlot Galil 2021', 'https://www.saq.com/media/catalog/product/1/3/13112503-1_1581314117.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13112503', 'Israël', 'Vin rouge | 750 ml | Israël', 20, 'https://www.saq.com/fr/13112503', 'https://www.saq.com/media/catalog/product/1/3/13112503-1_1581314117.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(307, 'Benanti Etna Rosso 2020', 'https://www.saq.com/media/catalog/product/1/3/13507716-1_1664371838.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13507716', 'Italie', 'Vin rouge | 750 ml | Italie', 31, 'https://www.saq.com/fr/13507716', 'https://www.saq.com/media/catalog/product/1/3/13507716-1_1664371838.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(308, 'Beni di Batasiolo Barolo 2018', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '10856777', 'Italie', 'Vin rouge | 750 ml | Italie', 33, 'https://www.saq.com/fr/10856777', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(309, 'Beni di Batasiolo Langhe 2020', 'https://www.saq.com/media/catalog/product/6/1/611251-1_1580603421.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '611251', 'Italie', 'Vin rouge | 750 ml | Italie', 18, 'https://www.saq.com/fr/611251', 'https://www.saq.com/media/catalog/product/6/1/611251-1_1580603421.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(310, 'Beni di Batasiolo Riserva Barolo 2013', 'https://www.saq.com/media/catalog/product/1/1/11599231-1_1627484464.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '11599231', 'Italie', 'Vin rouge | 750 ml | Italie', 45, 'https://www.saq.com/fr/11599231', 'https://www.saq.com/media/catalog/product/1/1/11599231-1_1627484464.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(311, 'Benjamin Brunel Rasteau', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '123778', 'France', 'Vin rouge | 750 ml | France', 21, 'https://www.saq.com/fr/123778', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(312, 'Benjamin de Beauregard Pomerol 2019', 'https://www.saq.com/media/catalog/product/1/4/14965508-1_1659642055.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14965508', 'France', 'Vin rouge | 750 ml | France', 48, 'https://www.saq.com/fr/14965508', 'https://www.saq.com/media/catalog/product/1/4/14965508-1_1659642055.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(313, 'Berardenga Felsina Chianti Classico 2019', 'https://www.saq.com/media/catalog/product/8/9/898122-1_1647399038.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '898122', 'Italie', 'Vin rouge | 750 ml | Italie', 29, 'https://www.saq.com/fr/898122', 'https://www.saq.com/media/catalog/product/8/9/898122-1_1647399038.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(314, 'Beringer Founders Estate Cab.-Sauvignon', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '12383264', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 18, 'https://www.saq.com/fr/12383264', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(315, 'Beringer Founders\' Estate Pinot Noir', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '903245', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 17, 'https://www.saq.com/fr/903245', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(316, 'Beringer Knights Valley Cabernet-Sauvignon Californie 2020', 'https://www.saq.com/media/catalog/product/3/5/352583-1_1595278817.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '352583', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 43, 'https://www.saq.com/fr/352583', 'https://www.saq.com/media/catalog/product/3/5/352583-1_1595278817.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(317, 'Beringer Main & Vine Cabernet-Sauvignon', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '11133132', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 11, 'https://www.saq.com/fr/11133132', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(318, 'Bernabeleva Camino de Navaherreros Vinos de Madrid 2020', 'https://www.saq.com/media/catalog/product/1/4/14127651-1_1578552309.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14127651', 'Espagne', 'Vin rouge | 750 ml | Espagne', 19, 'https://www.saq.com/fr/14127651', 'https://www.saq.com/media/catalog/product/1/4/14127651-1_1578552309.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(319, 'Bernabeleva Navaherreros Vinos De Madrid 2019', 'https://www.saq.com/media/catalog/product/1/4/14045525-1_1578550219.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14045525', 'Espagne', 'Vin rouge | 750 ml | Espagne', 26, 'https://www.saq.com/fr/14045525', 'https://www.saq.com/media/catalog/product/1/4/14045525-1_1578550219.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(320, 'Bernard Baudry Les Grézeaux Chinon 2019', 'https://www.saq.com/media/catalog/product/1/0/10257555-1_1580595009.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '10257555', 'France', 'Vin rouge | 750 ml | France', 31, 'https://www.saq.com/fr/10257555', 'https://www.saq.com/media/catalog/product/1/0/10257555-1_1580595009.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(321, 'Bernard et Benoît Landron Coteaux d\'Ancenis Esprit Détente 2021', 'https://www.saq.com/media/catalog/product/1/4/14172612-1_1578553218.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14172612', 'France', 'Vin rouge | 750 ml | France', 20, 'https://www.saq.com/fr/14172612', 'https://www.saq.com/media/catalog/product/1/4/14172612-1_1578553218.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(322, 'Bernard Magrez La Bienvenida Mendoza 2019', 'https://www.saq.com/media/catalog/product/1/2/12395425-1_1650999950.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12395425', 'Argentine', 'Vin rouge | 750 ml | Argentine', 27, 'https://www.saq.com/fr/12395425', 'https://www.saq.com/media/catalog/product/1/2/12395425-1_1650999950.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(323, 'Beronia Rioja', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '13188831', 'Espagne', 'Vin rouge | 750 ml | Espagne', 14, 'https://www.saq.com/fr/13188831', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(324, 'Beronia Rioja Reserva 2018', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '11667231', 'Espagne', 'Vin rouge | 750 ml | Espagne', 22, 'https://www.saq.com/fr/11667231', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(325, 'Berretta Maremma Toscana 2020', 'https://www.saq.com/media/catalog/product/1/2/12054217-1_1659490840.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12054217', 'Italie', 'Vin rouge | 750 ml | Italie', 20, 'https://www.saq.com/fr/12054217', 'https://www.saq.com/media/catalog/product/1/2/12054217-1_1659490840.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(326, 'Bersano Costalunga Barbera d\'Asti Superiore', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '506824', 'Italie', 'Vin rouge | 750 ml | Italie', 16, 'https://www.saq.com/fr/506824', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', 1),
(327, 'Bertani Tenuta Novare Valpolicella Ripasso', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '13359119', 'Italie', 'Vin rouge | 750 ml | Italie', 19, 'https://www.saq.com/fr/13359119', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(328, 'Berte & Cordini Pinot Nero dell Oltrepo Pavese 2019', 'https://www.saq.com/media/catalog/product/1/4/14432015-1_1595005216.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14432015', 'Italie', 'Vin rouge | 750 ml | Italie', 19, 'https://www.saq.com/fr/14432015', 'https://www.saq.com/media/catalog/product/1/4/14432015-1_1595005216.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(329, 'Berton Metal Label Range Durif 2020', 'https://www.saq.com/media/catalog/product/1/3/13699498-1_1578540923.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13699498', 'Australie', 'Vin rouge | 750 ml | Australie', 17, 'https://www.saq.com/fr/13699498', 'https://www.saq.com/media/catalog/product/1/3/13699498-1_1578540923.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(330, 'Betz Bésoleil Columbia Valley 2018', 'https://www.saq.com/media/catalog/product/1/5/15113278-1_1676584253.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15113278', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 58, 'https://www.saq.com/fr/15113278', 'https://www.saq.com/media/catalog/product/1/5/15113278-1_1676584253.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(331, 'Betz Clos de Betz Columbia Valley 2018', 'https://www.saq.com/media/catalog/product/1/3/13513278-1_1635771329.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13513278', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 74, 'https://www.saq.com/fr/13513278', 'https://www.saq.com/media/catalog/product/1/3/13513278-1_1635771329.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(332, 'Betz La Serenne 2011', 'https://www.saq.com/media/catalog/product/1/2/12236301-1_1581116724.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12236301', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 70, 'https://www.saq.com/fr/12236301', 'https://www.saq.com/media/catalog/product/1/2/12236301-1_1581116724.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(333, 'Betz Père de Famille 2018', 'https://www.saq.com/media/catalog/product/1/5/15108516-1_1670331646.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15108516', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 99, 'https://www.saq.com/fr/15108516', 'https://www.saq.com/media/catalog/product/1/5/15108516-1_1670331646.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(334, 'Betz The Untold Story Columbia Valley 2018', 'https://www.saq.com/media/catalog/product/1/3/13997794-1_1627419644.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13997794', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 37, 'https://www.saq.com/fr/13997794', 'https://www.saq.com/media/catalog/product/1/3/13997794-1_1627419644.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(335, 'Bevan Cellars Tench Vineyard Cabernet Sauvignon 2016', 'https://www.saq.com/media/catalog/product/1/4/14494873-1_1594925118.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14494873', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 310, 'https://www.saq.com/fr/14494873', 'https://www.saq.com/media/catalog/product/1/4/14494873-1_1594925118.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(336, 'Bevan Cellars Tench Vineyard EE 2018', 'https://www.saq.com/media/catalog/product/1/4/14494881-1_1594925118.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14494881', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 326, 'https://www.saq.com/fr/14494881', 'https://www.saq.com/media/catalog/product/1/4/14494881-1_1594925118.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(337, 'Big House Red', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '308999', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 14, 'https://www.saq.com/fr/308999', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(338, 'BiNaume La Plante d\'? Coté 2021', 'https://www.saq.com/media/catalog/product/1/4/14292315-1_1582896315.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14292315', 'France', 'Vin rouge | 750 ml | France', 37, 'https://www.saq.com/fr/14292315', 'https://www.saq.com/media/catalog/product/1/4/14292315-1_1582896315.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(339, 'Bindi Original Vineyard Pinot Noir 2011', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '11637373', 'Australie', 'Vin rouge | 750 ml | Australie', 113, 'https://www.saq.com/fr/11637373', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '750 ml', 1),
(340, 'Biodynamic Lirac Domaine des Carabiniers 2020', 'https://www.saq.com/media/catalog/product/1/4/14056970-1_1578550509.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14056970', 'France', 'Vin rouge | 750 ml | France', 25, 'https://www.saq.com/fr/14056970', 'https://www.saq.com/media/catalog/product/1/4/14056970-1_1578550509.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(341, 'Biodynamic Wine ++-- Côtes du Rhône 2021', 'https://www.saq.com/media/catalog/product/1/4/14056988-1_1578550510.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14056988', 'France', 'Vin rouge | 750 ml | France', 21, 'https://www.saq.com/fr/14056988', 'https://www.saq.com/media/catalog/product/1/4/14056988-1_1578550510.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(342, 'Biscaris Barunieddu 2020', 'https://www.saq.com/media/catalog/product/1/2/12848826-1_1578411916.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12848826', 'Italie', 'Vin rouge | 750 ml | Italie', 23, 'https://www.saq.com/fr/12848826', 'https://www.saq.com/media/catalog/product/1/2/12848826-1_1578411916.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(343, 'Black Sage Cabernet-sauvignon 2019', 'https://www.saq.com/media/catalog/product/1/3/13887376-1_1655997343.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13887376', 'Canada', 'Vin rouge | 750 ml | Canada', 30, 'https://www.saq.com/fr/13887376', 'https://www.saq.com/media/catalog/product/1/3/13887376-1_1655997343.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(344, 'Black Stallion Cabernet-Sauvignon Napa Valley 2019', 'https://www.saq.com/media/catalog/product/1/3/13574505-1_1578537925.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13574505', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 45, 'https://www.saq.com/fr/13574505', 'https://www.saq.com/media/catalog/product/1/3/13574505-1_1578537925.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(345, 'Blackstone Pinot Noir 2014', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '10544811', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 17, 'https://www.saq.com/fr/10544811', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1),
(346, 'Blason D\'Issan Margaux 2015', 'https://www.saq.com/media/catalog/product/1/4/14955764-1_1652373359.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14955764', 'France', 'Vin rouge | 750 ml | France', 57, 'https://www.saq.com/fr/14955764', 'https://www.saq.com/media/catalog/product/1/4/14955764-1_1652373359.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(347, 'Blason de L\'Évangile Pomerol 2020', 'https://www.saq.com/media/catalog/product/1/5/15134343-1_1674482749.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15134343', 'France', 'Vin rouge | 750 ml | France', 114, 'https://www.saq.com/fr/15134343', 'https://www.saq.com/media/catalog/product/1/5/15134343-1_1674482749.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(348, 'Block Nine Pinot Noir 2020', 'https://www.saq.com/media/catalog/product/1/2/12982451-1_1649796958.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12982451', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 23, 'https://www.saq.com/fr/12982451', 'https://www.saq.com/media/catalog/product/1/2/12982451-1_1649796958.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(349, 'Bloody Beautiful Syrah Washington State 2018', 'https://www.saq.com/media/catalog/product/1/4/14808385-1_1628698523.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14808385', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 13, 'https://www.saq.com/fr/14808385', 'https://www.saq.com/media/catalog/product/1/4/14808385-1_1628698523.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(350, 'Bloody Temptation Columbia Valley Washington 2018', 'https://www.saq.com/media/catalog/product/1/5/15073325-1_1666639852.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15073325', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 14, 'https://www.saq.com/fr/15073325', 'https://www.saq.com/media/catalog/product/1/5/15073325-1_1666639852.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(351, 'Bodega Albero Cortadera 2021', 'https://www.saq.com/media/catalog/product/1/4/14921097-1_1651170342.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14921097', 'Espagne', 'Vin rouge | 750 ml | Espagne', 18, 'https://www.saq.com/fr/14921097', 'https://www.saq.com/media/catalog/product/1/4/14921097-1_1651170342.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(352, 'Bodega Chacra Cincuenta y Cinco Pinot Noir 2021', 'https://www.saq.com/media/catalog/product/1/5/15018692-1_1677696644.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15018692', 'Argentine', 'Vin rouge | 750 ml | Argentine', 73, 'https://www.saq.com/fr/15018692', 'https://www.saq.com/media/catalog/product/1/5/15018692-1_1677696644.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(353, 'Bodega Contador Contador 2015', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '14558460', 'Espagne', 'Vin rouge | 750 ml | Espagne', 559, 'https://www.saq.com/fr/14558460', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '750 ml', 1),
(354, 'Bodega Contador Contador 2016', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '14557432', 'Espagne', 'Vin rouge | 750 ml | Espagne', 533, 'https://www.saq.com/fr/14557432', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '750 ml', 1),
(355, 'Bodega Contador Contador 2014', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '13158966', 'Espagne', 'Vin rouge | 750 ml | Espagne', 432, 'https://www.saq.com/fr/13158966', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '750 ml', 1),
(356, 'Bodega Contador Contador 2011', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '12385374', 'Espagne', 'Vin rouge | 750 ml | Espagne', 392, 'https://www.saq.com/fr/12385374', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '750 ml', 1),
(357, 'Bodega Contador Nº 2 La Canoca Rioja Alta 2011', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '14559032', 'Espagne', 'Vin rouge | 750 ml | Espagne', 277, 'https://www.saq.com/fr/14559032', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '750 ml', 1),
(358, 'Bodega DiamAndes Malbec Gran Reserva Valle de Uco 2008', 'https://www.saq.com/media/catalog/product/1/3/13986032-1_1618581049.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13986032', 'Argentine', 'Vin rouge | 750 ml | Argentine', 142, 'https://www.saq.com/fr/13986032', 'https://www.saq.com/media/catalog/product/1/3/13986032-1_1618581049.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(359, 'Bodega Garzón Estate Cabernet de Corte 2020', 'https://www.saq.com/media/catalog/product/1/4/14898608-1_1646337367.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14898608', 'Uruguay', 'Vin rouge | 750 ml | Uruguay', 19, 'https://www.saq.com/fr/14898608', 'https://www.saq.com/media/catalog/product/1/4/14898608-1_1646337367.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(360, 'Bodega Garzón Marselan Reserva 2020', 'https://www.saq.com/media/catalog/product/1/4/14683922-1_1623960341.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14683922', 'Uruguay', 'Vin rouge | 750 ml | Uruguay', 23, 'https://www.saq.com/fr/14683922', 'https://www.saq.com/media/catalog/product/1/4/14683922-1_1623960341.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(361, 'Bodega Garzón Tannat Reserva 2020', 'https://www.saq.com/media/catalog/product/1/3/13621228-1_1608062824.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13621228', 'Uruguay', 'Vin rouge | 750 ml | Uruguay', 24, 'https://www.saq.com/fr/13621228', 'https://www.saq.com/media/catalog/product/1/3/13621228-1_1608062824.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(362, 'Bodega Monteviejo Festivo Valle de Uco 2019', 'https://www.saq.com/media/catalog/product/1/4/14312064-1_1582736711.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14312064', 'Argentine', 'Vin rouge | 750 ml | Argentine', 18, 'https://www.saq.com/fr/14312064', 'https://www.saq.com/media/catalog/product/1/4/14312064-1_1582736711.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(363, 'Bodega Monteviejo Petite Fleur Valle de Uco 2019', 'https://www.saq.com/media/catalog/product/1/2/12088273-1_1605794129.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12088273', 'Argentine', 'Vin rouge | 750 ml | Argentine', 24, 'https://www.saq.com/fr/12088273', 'https://www.saq.com/media/catalog/product/1/2/12088273-1_1605794129.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(364, 'Bodega Palacios Remondo Finca La Montesa Rioja 2019', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '10556993', 'Espagne', 'Vin rouge | 750 ml | Espagne', 21, 'https://www.saq.com/fr/10556993', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(365, 'Bodega Palacios Remondo Propiedad 2019', 'https://www.saq.com/media/catalog/product/1/4/14867334-1_1642002351.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14867334', 'Espagne', 'Vin rouge | 750 ml | Espagne', 39, 'https://www.saq.com/fr/14867334', 'https://www.saq.com/media/catalog/product/1/4/14867334-1_1642002351.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(366, 'Bodega Piedra Negra Gran Lurton Reserve Valle de Uco 2017', 'https://www.saq.com/media/catalog/product/1/1/11375596-1_1580616918.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '11375596', 'Argentine', 'Vin rouge | 750 ml | Argentine', 26, 'https://www.saq.com/fr/11375596', 'https://www.saq.com/media/catalog/product/1/1/11375596-1_1580616918.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(367, 'Bodega Trapiche Broquel 2020', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '10318160', 'Argentine', 'Vin rouge | 750 ml | Argentine', 16, 'https://www.saq.com/fr/10318160', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(368, 'Bodega Villa d\'Orta Crianza 2016', 'https://www.saq.com/media/catalog/product/1/3/13566679-1_1580668213.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13566679', 'Espagne', 'Vin rouge | 750 ml | Espagne', 18, 'https://www.saq.com/fr/13566679', 'https://www.saq.com/media/catalog/product/1/3/13566679-1_1580668213.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(369, 'Bodega Villa d\'Orta Marebell Somontano 2021', 'https://www.saq.com/media/catalog/product/1/4/14685098-1_1619553046.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14685098', 'Espagne', 'Vin rouge | 750 ml | Espagne', 15, 'https://www.saq.com/fr/14685098', 'https://www.saq.com/media/catalog/product/1/4/14685098-1_1619553046.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(370, 'Bodegas Aessir Syrah 2020', 'https://www.saq.com/media/catalog/product/1/4/14930680-1_1648500645.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14930680', 'Espagne', 'Vin rouge | 750 ml | Espagne', 22, 'https://www.saq.com/fr/14930680', 'https://www.saq.com/media/catalog/product/1/4/14930680-1_1648500645.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(371, 'Bodegas Altanza Lealtanza Rioja Reserva 2015', 'https://www.saq.com/media/catalog/product/1/3/13113709-1_1581314122.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13113709', 'Espagne', 'Vin rouge | 750 ml | Espagne', 24, 'https://www.saq.com/fr/13113709', 'https://www.saq.com/media/catalog/product/1/3/13113709-1_1581314122.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(372, 'Bodegas Aroa le Naturel Navarra 2021', 'https://www.saq.com/media/catalog/product/1/4/14438636-1_1614194739.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14438636', 'Espagne', 'Vin rouge | 750 ml | Espagne', 16, 'https://www.saq.com/fr/14438636', 'https://www.saq.com/media/catalog/product/1/4/14438636-1_1614194739.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1);
INSERT INTO `vino__bouteille` (`id`, `nom`, `image`, `code_saq`, `pays`, `description`, `prix_saq`, `url_saq`, `url_img`, `format`, `type`) VALUES
(373, 'Bodegas Arraez Vivir Sin Dormir 2020', 'https://www.saq.com/media/catalog/product/1/3/13581300-1_1578538219.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13581300', 'Espagne', 'Vin rouge | 750 ml | Espagne', 17, 'https://www.saq.com/fr/13581300', 'https://www.saq.com/media/catalog/product/1/3/13581300-1_1578538219.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(374, 'Bodegas Atalaya La Atalaya del Camino Almansa 2020', 'https://www.saq.com/media/catalog/product/1/2/12163835-1_1580660711.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12163835', 'Espagne', 'Vin rouge | 750 ml | Espagne', 23, 'https://www.saq.com/fr/12163835', 'https://www.saq.com/media/catalog/product/1/2/12163835-1_1580660711.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(375, 'Bodegas Ateca Atteca Calatayud 2020', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '10856873', 'Espagne', 'Vin rouge | 750 ml | Espagne', 22, 'https://www.saq.com/fr/10856873', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(376, 'Bodegas Barahonda Barahonda Barrica 2021', 'https://www.saq.com/media/catalog/product/1/2/12408134-1_1660615237.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12408134', 'Espagne', 'Vin rouge | 750 ml | Espagne', 19, 'https://www.saq.com/fr/12408134', 'https://www.saq.com/media/catalog/product/1/2/12408134-1_1660615237.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(377, 'Bodegas Barahonda Carro 2020', 'https://www.saq.com/media/catalog/product/1/2/12662968-1_1647435952.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '12662968', 'Espagne', 'Vin rouge | 750 ml | Espagne', 16, 'https://www.saq.com/fr/12662968', 'https://www.saq.com/media/catalog/product/1/2/12662968-1_1647435952.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(378, 'Bodegas Bocopa Castillo de Alicante 2020', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '14729898', 'Espagne', 'Vin rouge | 750 ml | Espagne', 9, 'https://www.saq.com/fr/14729898', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', 1),
(379, 'Bodegas Borsao Viña Borgia Garnacha 2020', 'https://www.saq.com/media/catalog/product/1/4/14955609-1_1652982343.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14955609', 'Espagne', 'Vin rouge | 750 ml | Espagne', 15, 'https://www.saq.com/fr/14955609', 'https://www.saq.com/media/catalog/product/1/4/14955609-1_1652982343.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(380, 'Bodegas Campillo Rioja Reserva 2018', 'https://www.saq.com/media/catalog/product/8/9/898809-1_1580607319.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '898809', 'Espagne', 'Vin rouge | 750 ml | Espagne', 21, 'https://www.saq.com/fr/898809', 'https://www.saq.com/media/catalog/product/8/9/898809-1_1580607319.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(381, 'Bodegas Carchelo Jumilla 2019', 'https://www.saq.com/media/catalog/product/1/4/14273915-1_1583155510.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14273915', 'Espagne', 'Vin rouge | 750 ml | Espagne', 18, 'https://www.saq.com/fr/14273915', 'https://www.saq.com/media/catalog/product/1/4/14273915-1_1583155510.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(382, 'Bodegas Carrau Tannat Reserva 2019', 'https://www.saq.com/media/catalog/product/1/0/10293847-1_1590614713.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '10293847', 'Uruguay', 'Vin rouge | 750 ml | Uruguay', 16, 'https://www.saq.com/fr/10293847', 'https://www.saq.com/media/catalog/product/1/0/10293847-1_1590614713.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(383, 'Bodegas Casa Primicia Carravalseca Rioja 2018', 'https://www.saq.com/media/catalog/product/1/4/14035941-1_1578549914.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14035941', 'Espagne', 'Vin rouge | 750 ml | Espagne', 24, 'https://www.saq.com/fr/14035941', 'https://www.saq.com/media/catalog/product/1/4/14035941-1_1578549914.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(384, 'Bodegas Castano Solanera Vinas Viejas 2019', 'https://www.saq.com/media/catalog/product/1/1/11664902-1_1580625316.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '11664902', 'Espagne', 'Vin rouge | 750 ml | Espagne', 20, 'https://www.saq.com/fr/11664902', 'https://www.saq.com/media/catalog/product/1/1/11664902-1_1580625316.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(385, 'Bodegas Catena Adrianna Vineyard Fortuna Terrae 2019', 'https://www.saq.com/media/catalog/product/1/5/15070036-1_1671114049.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '15070036', 'Argentine', 'Vin rouge | 750 ml | Argentine', 135, 'https://www.saq.com/fr/15070036', 'https://www.saq.com/media/catalog/product/1/5/15070036-1_1671114049.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(386, 'Bodegas de Nobella Monastrell Yecla', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '13188962', 'Espagne', 'Vin rouge | 3 L | Espagne', 31, 'https://www.saq.com/fr/13188962', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '3 L', 1),
(387, 'Bodegas de Nobella Monastrell Yecla', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '12989936', 'Espagne', 'Vin rouge | 750 ml | Espagne', 8, 'https://www.saq.com/fr/12989936', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/fg_small.png?width=20&height=20', '750 ml', 1),
(388, 'Bodegas Gil Luna Tres Lunas 2019', 'https://www.saq.com/media/catalog/product/1/3/13485297-1_1578536419.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13485297', 'Espagne', 'Vin rouge | 750 ml | Espagne', 20, 'https://www.saq.com/fr/13485297', 'https://www.saq.com/media/catalog/product/1/3/13485297-1_1578536419.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(389, 'Bodegas Juan Gil Jumilla 2020', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '10758325', 'Espagne', 'Vin rouge | 750 ml | Espagne', 22, 'https://www.saq.com/fr/10758325', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/ac_small.png?width=20&height=20', '750 ml', 1),
(390, 'Alter Ego Margaux 2019', 'https://www.saq.com/media/catalog/product/1/4/14553095-1_1671741967.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '14553095', 'France', 'Vin rouge | 750 ml | France', 128, 'https://www.saq.com/fr/14553095', 'https://www.saq.com/media/catalog/product/1/4/14553095-1_1671741967.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(391, 'Artadi El Carretil 2015', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '13214382', 'Espagne', 'Vin rouge | 750 ml | Espagne', 253, 'https://www.saq.com/fr/13214382', 'https://www.saq.com/media/wysiwyg/placeholder/category/06.png', '750 ml', 1),
(392, 'Artesa Pinot Noir Los Carneros 2018', 'https://www.saq.com/media/catalog/product/1/3/13920711-1_1578546027.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '13920711', 'États-Unis', 'Vin rouge | 750 ml | États-Unis', 34, 'https://www.saq.com/fr/13920711', 'https://www.saq.com/media/catalog/product/1/3/13920711-1_1578546027.png?quality=80&fit=bounds&height=166&width=111&canvas=111:166', '750 ml', 1),
(393, 'Baron Philippe de Rothschild Pays d\'Oc Merlot', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '407544', 'France', 'Vin rouge | 750 ml | France', 13, 'https://www.saq.com/fr/407544', 'https://www.saq.com/media/wysiwyg/product_tags/pastille_gout/as_small.png?width=20&height=20', '750 ml', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vino__cellier`
--

CREATE TABLE `vino__cellier` (
  `id` int(11) NOT NULL,
  `id_bouteille` int(11) DEFAULT NULL,
  `date_achat` date DEFAULT NULL,
  `garde_jusqua` varchar(200) DEFAULT NULL,
  `notes` varchar(200) DEFAULT NULL,
  `prix` float DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `millesime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vino__cellier`
--

INSERT INTO `vino__cellier` (`id`, `id_bouteille`, `date_achat`, `garde_jusqua`, `notes`, `prix`, `quantite`, `millesime`) VALUES
(1, 10, '0000-00-00', '', '', 0, 13, 0),
(2, 10, '0000-00-00', '', '', 0, 3, 0),
(3, 5, '2019-01-16', '2020', '2019-01-16', 22, 10, 1999),
(4, 5, '0000-00-00', '', '', 0, 1, 0),
(5, 5, '0000-00-00', '', '', 0, 1, 0),
(6, 0, '0000-00-00', '', '', 0, 1, 0),
(7, 0, '0000-00-00', '', '', 0, 1, 0),
(8, 5, '0000-00-00', '', '', 0, 10, 2000),
(9, 3, '2019-01-26', 'non', '2019-01-26', 23.52, 1, 2015);

-- --------------------------------------------------------

--
-- Table structure for table `vino__type`
--

CREATE TABLE `vino__type` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vino__type`
--

INSERT INTO `vino__type` (`id`, `type`) VALUES
(1, 'Vin rouge'),
(2, 'Vin blanc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `vino__bouteille`
--
ALTER TABLE `vino__bouteille`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vino__cellier`
--
ALTER TABLE `vino__cellier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vino__type`
--
ALTER TABLE `vino__type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `vino__bouteille`
--
ALTER TABLE `vino__bouteille`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=394;

--
-- AUTO_INCREMENT for table `vino__cellier`
--
ALTER TABLE `vino__cellier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Database: `social`
--
CREATE DATABASE IF NOT EXISTS `social` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `social`;

-- --------------------------------------------------------

--
-- Table structure for table `categorys`
--

CREATE TABLE `categorys` (
  `id` int(11) NOT NULL,
  `category` varchar(45) NOT NULL,
  `category_fr` varchar(45) DEFAULT NULL,
  `category_en` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categorys`
--

INSERT INTO `categorys` (`id`, `category`, `category_fr`, `category_en`) VALUES
(1, 'Chemistry', 'Chimie', 'Chemistry'),
(2, 'Mathematics', 'Vêtement', 'Mathematics'),
(3, 'IT', 'Informatique', 'IT'),
(4, 'Philosophy', 'Philosophie', 'Philosophy');

-- --------------------------------------------------------

--
-- Table structure for table `etudiants`
--

CREATE TABLE `etudiants` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_de_naissance` date NOT NULL,
  `villeId` int(11) NOT NULL,
  `categorieId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `etudiants`
--

INSERT INTO `etudiants` (`id`, `nom`, `adresse`, `phone`, `email`, `image`, `date_de_naissance`, `villeId`, `categorieId`, `created_at`, `updated_at`) VALUES
(106759, 'Kayleigh Dickinson PhD', '7515 Hermann Shore Apt. 299\nEast Lemuelfort, DC 69225-6338', '561-938-1802', 'toy.kali@example.net', 'https://faces-img.xcdn.link/image-lorem-face-3019.jpg', '1956-11-16', 51425, 3, '2023-03-02 09:28:19', '2023-03-02 10:43:30'),
(107242, 'Jillian Schowalter', '217 Boehm Meadows\nSpencerchester, AZ 84250', '(364) 330-1252', 'abernathy.efren@example.net', 'https://faces-img.xcdn.link/image-lorem-face-796.jpg', '2021-09-17', 70315, 864145, '2023-03-03 04:39:52', '2023-03-02 11:30:47'),
(107296, 'Dr. Tomasa Armstrong I', '779 Jolie Street\nGoldnertown, FL 15583-0850', '+1.346.424.1861', 'juanita.walsh@example.org', 'https://faces-img.xcdn.link/image-lorem-face-4633.jpg', '1999-09-12', 57781, 779240, '2023-03-02 15:28:44', '2023-03-02 22:53:18'),
(117763, 'Prof. Golda Mante Jr.', '163 Bauch Freeway Suite 300\nKenhaven, SD 85700-7090', '1-424-665-8112', 'baylee90@example.net', 'https://faces-img.xcdn.link/image-lorem-face-6245.jpg', '1925-06-10', 93170, 991961, '2023-03-02 12:45:24', '2023-03-02 07:38:04'),
(118808, 'Jocelyn Lemke', '6939 Adrian Summit Suite 100\nMuellertown, CT 52174-1674', '(906) 815-1124', 'macejkovic.elsa@example.com', 'https://faces-img.xcdn.link/image-lorem-face-6683.jpg', '1949-01-09', 70315, 2, '2023-03-03 03:45:31', '2023-03-02 06:46:34'),
(127133, 'Xzavier Auer', '947 Johnnie Divide Suite 293\nNorth Erick, NY 22474', '+1 (262) 910-0359', 'leta.fisher@example.net', 'https://faces-img.xcdn.link/image-lorem-face-1455.jpg', '1962-11-30', 43577, 208976, '2023-03-02 06:58:52', '2023-03-02 13:18:55'),
(134532, 'Lois Mann II', '61575 Krystel Groves\nNorth Adelle, MI 37635-7800', '+1 (740) 527-3047', 'ava64@example.org', 'https://faces-img.xcdn.link/image-lorem-face-2936.jpg', '2020-09-20', 16631, 864145, '2023-03-02 07:01:01', '2023-03-02 06:38:07'),
(137371, 'Lemuel Funk', '5182 Steuber Mews\nPort Gretchenland, HI 85047-4093', '+17274518807', 'smitham.cleveland@example.org', 'https://faces-img.xcdn.link/image-lorem-face-725.jpg', '1993-09-20', 16631, 1, '2023-03-02 17:19:22', '2023-03-03 00:00:46'),
(139939, 'Flo Stokes', '2309 Jessie Spur Suite 102\nSandraside, ME 37619-4018', '+14587596553', 'xhermiston@example.com', 'https://faces-img.xcdn.link/image-lorem-face-5409.jpg', '2010-10-14', 70315, 1, '2023-03-02 12:03:43', '2023-03-03 03:58:23'),
(156415, 'Juliet Howe', '9364 Aglae Field\nMargefurt, RI 96352', '260-320-6289', 'elna02@example.net', 'https://faces-img.xcdn.link/image-lorem-face-4388.jpg', '1985-02-08', 51425, 208976, '2023-03-02 08:59:18', '2023-03-02 16:37:01'),
(168806, 'Caden Okuneva Jr.', '8237 Harber Station\nWelchborough, TN 21648', '+14589644191', 'paolo92@example.org', 'https://faces-img.xcdn.link/image-lorem-face-6206.jpg', '2001-02-12', 73896, 208976, '2023-03-03 00:27:29', '2023-03-02 11:27:35'),
(170211, 'Dr. Nash Rice', '7721 Bartell Crescent\nVergieburgh, MI 91775', '+1-585-262-9318', 'qjohns@example.com', 'https://faces-img.xcdn.link/image-lorem-face-1525.jpg', '1995-10-13', 43577, 3, '2023-03-02 12:35:53', '2023-03-02 23:09:58'),
(181555, 'Lorine Connelly', '194 Von Groves Suite 406\nParkerton, OR 30172-5569', '+16897483249', 'myah.stark@example.net', 'https://faces-img.xcdn.link/image-lorem-face-6629.jpg', '1997-06-10', 93170, 991961, '2023-03-02 11:28:46', '2023-03-02 07:12:01'),
(202725, 'Cynthia Wehner', '7160 Cummings Prairie Suite 082\nAylinberg, DE 57098-5300', '+1.281.492.5481', 'sblick@example.com', 'https://faces-img.xcdn.link/image-lorem-face-4856.jpg', '1998-11-23', 41630, 991961, '2023-03-02 09:50:41', '2023-03-02 14:08:52'),
(208363, 'Guido Parker', '9579 Dudley Fords\nLake Rasheed, UT 79051-8548', '(714) 698-9739', 'lmcglynn@example.net', 'https://faces-img.xcdn.link/image-lorem-face-2329.jpg', '1946-12-10', 57781, 991961, '2023-03-02 06:37:21', '2023-03-02 13:29:50'),
(216107, 'Hipolito Willms', '170 Percy Islands Apt. 725\nPort Rudyshire, IN 15081-9424', '1-832-580-1188', 'clarabelle74@example.com', 'https://faces-img.xcdn.link/image-lorem-face-6172.jpg', '1951-05-12', 57781, 864145, '2023-03-02 14:15:05', '2023-03-02 18:39:21'),
(225527, 'Omari Rohan', '84909 Zemlak Motorway\nPort Martinabury, RI 73399-1699', '+1-380-556-3515', 'heathcote.berta@example.net', 'https://faces-img.xcdn.link/image-lorem-face-2713.jpg', '2012-10-17', 51425, 208976, '2023-03-02 12:07:44', '2023-03-03 03:41:33'),
(227769, 'Adam Weissnat', '908 Constantin Mills\nLake Winifredberg, TN 20841-2375', '+1-321-823-2253', 'franecki.armando@example.org', 'https://faces-img.xcdn.link/image-lorem-face-1904.jpg', '1996-11-23', 19400, 991961, '2023-03-02 14:11:31', '2023-03-02 19:12:12'),
(252303, 'Ernest Medhurst DDS', '83332 Johnathan Court\nWest Eddieshire, IN 07941', '(947) 655-9485', 'baumbach.holly@example.net', 'https://faces-img.xcdn.link/image-lorem-face-1638.jpg', '1979-03-19', 41630, 1, '2023-03-03 04:51:13', '2023-03-02 21:14:21'),
(254777, 'Hank Hayes', '2924 Gibson Mountains\nSouth Richardburgh, SC 81972-2473', '+19365482229', 'ibosco@example.net', 'https://faces-img.xcdn.link/image-lorem-face-4925.jpg', '1978-07-18', 69859, 1, '2023-03-02 20:31:50', '2023-03-02 20:34:38'),
(256768, 'Clara Purdy', '21367 Johnston Centers Suite 526\nKohlerland, CA 46224', '1-484-557-9555', 'carlos.macejkovic@example.net', 'https://faces-img.xcdn.link/image-lorem-face-436.jpg', '2006-05-10', 16631, 3, '2023-03-02 15:35:17', '2023-03-02 18:11:02'),
(273531, 'Maverick Wolf', '626 Reilly Plains Suite 967\nSouth Tessieshire, LA 39204-5369', '803.432.2436', 'garry37@example.org', 'https://faces-img.xcdn.link/image-lorem-face-2706.jpg', '1966-08-27', 70315, 991961, '2023-03-02 19:25:57', '2023-03-02 06:16:58'),
(280554, 'Leonie Carter Sr.', '954 Zulauf Hill\nEast Joseberg, MI 12495-5093', '+1-458-620-5859', 'lkuphal@example.org', 'https://faces-img.xcdn.link/image-lorem-face-889.jpg', '1960-08-29', 43577, 208976, '2023-03-03 01:41:43', '2023-03-02 17:20:54'),
(289617, 'Jarrell Koelpin', '871 Schowalter Circle\nEnolaville, NC 96681', '(928) 849-0987', 'lourdes.kunze@example.net', 'https://faces-img.xcdn.link/image-lorem-face-5014.jpg', '1977-08-10', 19400, 208976, '2023-03-02 07:23:19', '2023-03-03 04:22:37'),
(300151, 'Zena McLaughlin DVM', '67902 Claude Ranch\nNew Angelaton, CA 94817-5591', '+1 (678) 577-2783', 'skyla88@example.net', 'https://faces-img.xcdn.link/image-lorem-face-3129.jpg', '1933-05-22', 57781, 864145, '2023-03-03 01:16:11', '2023-03-02 08:21:50'),
(300623, 'Lavonne Reilly', '1697 Marcelle Trace Apt. 662\nDaronhaven, IN 16131', '213.704.9982', 'johnnie.fay@example.net', 'https://faces-img.xcdn.link/image-lorem-face-780.jpg', '1985-10-21', 70315, 1, '2023-03-02 15:09:26', '2023-03-02 16:25:35'),
(321342, 'Isobel O\'Hara', '56039 Adelle Ports\nToreytown, MI 19826', '563.935.7162', 'ressie45@example.org', 'https://faces-img.xcdn.link/image-lorem-face-6421.jpg', '1923-04-11', 41630, 2, '2023-03-02 18:28:18', '2023-03-02 09:45:13'),
(334893, 'Emmanuelle Green', '124 Lucile Falls\nHermistonmouth, DE 33869', '760.683.4975', 'hoppe.elisa@example.com', 'https://faces-img.xcdn.link/image-lorem-face-4182.jpg', '1992-09-23', 93170, 771259, '2023-03-02 22:02:35', '2023-03-02 15:15:50'),
(335236, 'Naomi Hahn', '44194 Maye Canyon\nEast Marielle, DE 77758', '+1-520-996-6429', 'odietrich@example.com', 'https://faces-img.xcdn.link/image-lorem-face-443.jpg', '2011-01-22', 16631, 779240, '2023-03-02 11:36:43', '2023-03-02 06:55:35'),
(336739, 'Patsy McGlynn', '289 Eichmann Plains Apt. 977\nSouth Irma, TX 77534', '+1 (854) 859-1697', 'kilback.kayleigh@example.org', 'https://faces-img.xcdn.link/image-lorem-face-1868.jpg', '1929-11-20', 51425, 779240, '2023-03-03 01:02:50', '2023-03-02 05:20:50'),
(342987, 'Kayla Stanton', '865 Cade Cliffs Apt. 214\nNew Jevonborough, NM 70433-8208', '+14424413345', 'rmueller@example.net', 'https://faces-img.xcdn.link/image-lorem-face-6786.jpg', '1999-05-20', 70315, 3, '2023-03-02 10:06:15', '2023-03-03 00:14:12'),
(364066, 'Owen Lehner', '2742 Shaina Garden\nMillston, CO 40506', '(678) 587-9738', 'sheridan.spinka@example.com', 'https://faces-img.xcdn.link/image-lorem-face-4064.jpg', '1969-06-18', 93170, 1, '2023-03-02 20:43:01', '2023-03-03 00:36:08'),
(365770, 'Miss Piper Kihn Sr.', '555 Strosin Club Suite 120\nJuliaport, IL 49264-7736', '520-902-1370', 'larkin.willy@example.net', 'https://faces-img.xcdn.link/image-lorem-face-3490.jpg', '1939-05-04', 57781, 208976, '2023-03-02 11:51:58', '2023-03-02 16:34:49'),
(378878, 'Ms. Krystal Dibbert Sr.', '783 Kole Track\nNorth Cordelia, MO 82631-6783', '+1.351.952.3898', 'okuneva.may@example.com', 'https://faces-img.xcdn.link/image-lorem-face-409.jpg', '1938-12-24', 57781, 3, '2023-03-02 17:15:32', '2023-03-02 23:08:49'),
(395828, 'Dr. Nadia Donnelly', '62779 Hermann Harbors\nLake Winonaton, OR 24839-9956', '+1 (937) 733-6129', 'percival.daugherty@example.com', 'https://faces-img.xcdn.link/image-lorem-face-5834.jpg', '2018-03-28', 16631, 208976, '2023-03-03 03:26:04', '2023-03-02 17:59:44'),
(401313, 'Seth Aufderhar DVM', '28335 Shana Overpass\nCandelariochester, DC 91957-3183', '+1 (386) 644-9224', 'angela52@example.com', 'https://faces-img.xcdn.link/image-lorem-face-931.jpg', '2001-08-10', 70315, 3, '2023-03-02 22:26:54', '2023-03-02 05:54:13'),
(404467, 'Katharina Pouros', '734 Kayley Center Suite 703\nDaughertyborough, WV 85571', '614-688-3909', 'eulalia31@example.net', 'https://faces-img.xcdn.link/image-lorem-face-6433.jpg', '1977-12-15', 41630, 779240, '2023-03-02 16:46:28', '2023-03-02 08:10:32'),
(405390, 'Deangelo Olson', '1181 Parker Vista\nNorth Coramouth, AL 55240-1231', '463.868.0683', 'kiley04@example.com', 'https://faces-img.xcdn.link/image-lorem-face-5289.jpg', '1964-09-01', 16631, 208976, '2023-03-02 09:50:58', '2023-03-02 15:31:36'),
(415955, 'Michelle Strosin', '294 Tremblay Vista\nNorth Eugenialand, MN 45525-1835', '445-853-4337', 'ametz@example.org', 'https://faces-img.xcdn.link/image-lorem-face-2836.jpg', '1980-08-14', 16631, 991961, '2023-03-02 20:43:33', '2023-03-02 21:40:47'),
(425264, 'Roel Kub', '7207 Angelo Roads Apt. 710\nPort Clotilde, TX 56629', '(802) 582-6006', 'kristian17@example.net', 'https://faces-img.xcdn.link/image-lorem-face-3986.jpg', '1940-06-17', 41630, 864145, '2023-03-02 05:39:43', '2023-03-02 07:37:24'),
(431167, 'Trever Rau', '44873 Maggio Motorway\nNew Berenice, ID 47200', '+1 (716) 648-1823', 'nkassulke@example.org', 'https://faces-img.xcdn.link/image-lorem-face-6178.jpg', '1993-08-15', 51425, 208976, '2023-03-02 05:32:11', '2023-03-02 09:06:06'),
(441200, 'Dr. Margarita Moore DVM', '9787 Cassin Causeway\nReecefurt, PA 17830-1160', '(847) 949-9712', 'marquardt.janet@example.com', 'https://faces-img.xcdn.link/image-lorem-face-785.jpg', '1935-11-13', 57781, 3, '2023-03-02 20:59:35', '2023-03-02 05:59:20'),
(445755, 'Tony Bayer', '7094 Karianne Keys Suite 624\nFisherfort, HI 14587', '+1-347-382-4069', 'virginia.pagac@example.net', 'https://faces-img.xcdn.link/image-lorem-face-2917.jpg', '2010-04-02', 16631, 991961, '2023-03-02 23:15:55', '2023-03-02 05:26:10'),
(452094, 'Mr. Kenneth Macejkovic', '79161 Kerluke Ridge Suite 441\nNorth Dameonburgh, OH 61048-7054', '1-941-392-1121', 'flatley.ronaldo@example.org', 'https://faces-img.xcdn.link/image-lorem-face-3110.jpg', '2000-07-21', 69859, 864145, '2023-03-02 10:40:21', '2023-03-02 19:51:31'),
(463908, 'Kendall Jacobson II', '2712 Jaqueline Rue Apt. 728\nNorth Asia, NJ 29623-5968', '724-714-3976', 'nichole85@example.org', 'https://faces-img.xcdn.link/image-lorem-face-2568.jpg', '1965-05-16', 19400, 3, '2023-03-02 21:55:06', '2023-03-02 07:43:23'),
(466871, 'Bertram Murazik', '4467 Gudrun Forest\nNew Pollytown, HI 14557-5085', '531.885.9980', 'cortney11@example.org', 'https://faces-img.xcdn.link/image-lorem-face-1176.jpg', '1935-05-30', 16631, 779240, '2023-03-02 19:40:38', '2023-03-02 10:10:52'),
(468306, 'Karl Kuhlman', '2302 Lindgren Views Apt. 175\nChamplinside, UT 75659-5405', '1-850-613-0233', 'mhill@example.com', 'https://faces-img.xcdn.link/image-lorem-face-6108.jpg', '1938-08-27', 16631, 208976, '2023-03-02 17:35:04', '2023-03-02 09:34:32'),
(474441, 'Prof. Paula Prohaska I', '491 Tremblay Roads Suite 621\nPort Annabel, NY 60329', '+1-928-856-9340', 'maurice.oreilly@example.net', 'https://faces-img.xcdn.link/image-lorem-face-5080.jpg', '1977-11-27', 51425, 779240, '2023-03-02 07:05:40', '2023-03-02 12:17:56'),
(491806, 'Armando Kautzer', '87313 Tabitha Harbor\nBritneyside, FL 65365-7065', '920-519-6976', 'rnolan@example.com', 'https://faces-img.xcdn.link/image-lorem-face-5706.jpg', '1932-07-21', 41630, 2, '2023-03-03 00:27:18', '2023-03-02 10:22:39'),
(493748, 'Ms. Karelle Paucek IV', '1319 Effertz Fork Suite 802\nWest Alisha, DC 81424', '1-337-899-8566', 'ilittel@example.org', 'https://faces-img.xcdn.link/image-lorem-face-606.jpg', '1946-08-26', 69859, 991961, '2023-03-02 17:28:13', '2023-03-02 14:23:16'),
(515193, 'Lavinia Konopelski', '3133 Johnnie Road Apt. 593\nLake Ariel, IL 31193', '1-206-738-8728', 'rskiles@example.com', 'https://faces-img.xcdn.link/image-lorem-face-896.jpg', '1993-09-02', 41630, 864145, '2023-03-03 01:09:03', '2023-03-02 23:58:56'),
(522208, 'Benjamin Lehner', '79054 Delpha Landing\nPort Augusta, MI 75845-7183', '+1-947-812-3969', 'melissa36@example.net', 'https://faces-img.xcdn.link/image-lorem-face-132.jpg', '1985-01-10', 57781, 1, '2023-03-03 01:37:09', '2023-03-03 02:51:10'),
(522510, 'Loraine Hickle', '54432 Berenice Path\nEast Concepcion, AK 77891-4970', '(609) 709-7128', 'botsford.glennie@example.net', 'https://faces-img.xcdn.link/image-lorem-face-1845.jpg', '1970-12-19', 57781, 864145, '2023-03-03 03:22:34', '2023-03-02 08:03:54'),
(523649, 'Dr. Leonie Abshire III', '600 Linnea Ferry Apt. 506\nSouth Kenneth, TX 60836', '+1.857.861.8371', 'qferry@example.net', 'https://faces-img.xcdn.link/image-lorem-face-5750.jpg', '1942-08-18', 57781, 1, '2023-03-03 01:19:33', '2023-03-02 23:20:23'),
(525939, 'Sigrid Buckridge', '8460 Brown Plaza\nSouth Mauricio, RI 81542-8257', '984-214-6941', 'zoe36@example.net', 'https://faces-img.xcdn.link/image-lorem-face-749.jpg', '1988-11-23', 41630, 1, '2023-03-02 17:36:05', '2023-03-02 07:30:52'),
(529829, 'Anna Bogisich', '58389 Janet Camp\nLeonardview, HI 96809', '1-706-796-8505', 'heber.abbott@example.org', 'https://faces-img.xcdn.link/image-lorem-face-622.jpg', '1982-09-27', 70315, 991961, '2023-03-02 05:26:42', '2023-03-02 17:13:29'),
(544247, 'Alan Tromp', '125 Hoeger Gateway\nWest Kathleentown, IA 20639-6017', '+1-706-335-8769', 'kaycee99@example.com', 'https://faces-img.xcdn.link/image-lorem-face-4966.jpg', '1946-07-19', 16631, 771259, '2023-03-03 03:12:06', '2023-03-02 13:22:14'),
(548591, 'Dr. Wilfred Padberg', '73165 Altenwerth Flat Suite 204\nLake Emanuelfort, NY 06008-6930', '562-236-2347', 'joe.waters@example.com', 'https://faces-img.xcdn.link/image-lorem-face-6624.jpg', '2001-07-11', 73896, 3, '2023-03-02 17:17:05', '2023-03-02 17:32:06'),
(552520, 'Augustine Emard', '567 Marks Land Suite 676\nLangoshfort, MO 90825', '+1 (781) 635-1566', 'buck70@example.net', 'https://faces-img.xcdn.link/image-lorem-face-5898.jpg', '2002-01-07', 43577, 864145, '2023-03-02 19:57:03', '2023-03-02 21:11:13'),
(572251, 'Leda Lesch', '698 Lyda Locks\nNorth Zula, NJ 19301', '(740) 331-2767', 'madilyn59@example.net', 'https://faces-img.xcdn.link/image-lorem-face-625.jpg', '1958-05-28', 19400, 208976, '2023-03-02 16:13:00', '2023-03-02 21:14:01'),
(596087, 'Evert Sanford', '5532 Hodkiewicz Ford Apt. 350\nNew Lottieshire, NV 95332-4230', '269.606.0922', 'maggio.lina@example.com', 'https://faces-img.xcdn.link/image-lorem-face-2628.jpg', '1948-12-11', 19400, 991961, '2023-03-02 14:40:00', '2023-03-02 21:01:28'),
(602271, 'Otis Barton III', '127 Gulgowski Islands\nNew Gabrielmouth, KS 12676-7509', '+1 (307) 936-4081', 'missouri18@example.org', 'https://faces-img.xcdn.link/image-lorem-face-143.jpg', '2022-02-20', 19400, 3, '2023-03-02 11:30:01', '2023-03-02 10:35:56'),
(606842, 'Aletha Haag', '883 Blick Burg\nPort Judychester, AK 02310-8049', '1-661-566-7232', 'funk.keyshawn@example.com', 'https://faces-img.xcdn.link/image-lorem-face-3966.jpg', '1956-03-20', 73896, 864145, '2023-03-03 03:46:18', '2023-03-02 11:17:19'),
(611343, 'Mrs. Amelie Schuster', '4963 Ronny Trace Apt. 576\nNew Ashlyport, DC 29195-7448', '+1.872.877.7080', 'rschulist@example.net', 'https://faces-img.xcdn.link/image-lorem-face-5019.jpg', '2014-01-23', 70315, 1, '2023-03-02 08:31:13', '2023-03-02 19:07:27'),
(615780, 'Hattie Sauer', '308 Marquardt Lights\nReichertview, NC 56171', '+16404274774', 'juana84@example.net', 'https://faces-img.xcdn.link/image-lorem-face-1012.jpg', '1959-05-08', 57781, 864145, '2023-03-02 22:15:55', '2023-03-02 10:21:46'),
(618332, 'Claudie Ernser', '30275 Swaniawski Trace\nNorth Willard, IL 03689-5165', '1-859-214-1822', 'oconnell.manuela@example.net', 'https://faces-img.xcdn.link/image-lorem-face-5157.jpg', '1954-06-20', 16631, 991961, '2023-03-02 19:08:38', '2023-03-02 08:08:30'),
(622732, 'Wiley Morissette', '475 Velda Rapid\nGislasonshire, UT 12625', '937-926-2367', 'cbeatty@example.net', 'https://faces-img.xcdn.link/image-lorem-face-4514.jpg', '1947-08-29', 70315, 2, '2023-03-03 03:32:32', '2023-03-02 09:05:17'),
(627436, 'Prof. Deondre Ferry Sr.', '5879 Aron Estates Apt. 953\nHerbertmouth, OR 05051', '+1-469-435-3415', 'floy.klocko@example.com', 'https://faces-img.xcdn.link/image-lorem-face-6337.jpg', '1987-07-04', 57781, 208976, '2023-03-02 12:03:21', '2023-03-03 03:08:59'),
(631405, 'Mrs. Mona Kiehn Jr.', '6784 Angel Circle Apt. 992\nPort Holdenstad, ID 11204-8634', '540-513-8266', 'alberto.collins@example.net', 'https://faces-img.xcdn.link/image-lorem-face-4199.jpg', '1996-11-07', 51425, 1, '2023-03-02 19:37:06', '2023-03-02 19:37:11'),
(636366, 'Curtis Cummings III', '9049 King Valley\nAlexzanderfort, HI 49233-8555', '+1-820-205-3721', 'terry.felicita@example.net', 'https://faces-img.xcdn.link/image-lorem-face-298.jpg', '2011-04-12', 93170, 208976, '2023-03-02 10:14:16', '2023-03-03 03:14:06'),
(648981, 'Shaniya Glover', '196 Neoma Cove Suite 911\nNorth Toby, RI 22638', '+1-401-291-8202', 'tjones@example.org', 'https://faces-img.xcdn.link/image-lorem-face-485.jpg', '2002-10-30', 73896, 864145, '2023-03-02 15:46:26', '2023-03-03 01:13:51'),
(677193, 'Prof. Sigmund Conn I', '81188 Marcellus Glen Suite 651\nKeltonmouth, UT 52501', '1-401-593-2354', 'elinore.ernser@example.net', 'https://faces-img.xcdn.link/image-lorem-face-5562.jpg', '1938-03-03', 41630, 1, '2023-03-02 17:55:34', '2023-03-02 10:53:58'),
(686575, 'Leland Murazik', '71493 Antonette Spurs Apt. 205\nConniechester, ID 78434-4089', '+12034616168', 'norberto.cole@example.net', 'https://faces-img.xcdn.link/image-lorem-face-2131.jpg', '2014-01-12', 93170, 779240, '2023-03-02 12:03:21', '2023-03-02 14:12:28'),
(717832, 'Nicola Hayes', '821 Swift Mission Suite 964\nLake Dolly, NC 92444-9707', '(865) 492-7208', 'consuelo.mccullough@example.org', 'https://faces-img.xcdn.link/image-lorem-face-1021.jpg', '2021-09-07', 69859, 771259, '2023-03-02 21:11:28', '2023-03-02 19:32:12'),
(720829, 'Janis Feil', '2095 Bogisich Fork\nNorth Fionafort, MT 34696', '+1-878-203-6654', 'elisabeth.pouros@example.com', 'https://faces-img.xcdn.link/image-lorem-face-2486.jpg', '1964-08-23', 73896, 779240, '2023-03-02 13:31:10', '2023-03-02 05:08:52'),
(721799, 'Reina Bergstrom', '780 Lottie Cliffs\nStromanstad, IA 90507', '1-380-734-4399', 'luis.goldner@example.com', 'https://faces-img.xcdn.link/image-lorem-face-1493.jpg', '1968-04-06', 57781, 771259, '2023-03-02 20:29:52', '2023-03-02 13:25:12'),
(727082, 'Sibyl Brown IV', '7883 Rey Street Apt. 730\nWest Tanyaville, IN 65465', '(240) 467-3698', 'pete.hessel@example.net', 'https://faces-img.xcdn.link/image-lorem-face-6720.jpg', '2022-04-19', 69859, 2, '2023-03-02 12:07:42', '2023-03-03 00:41:01'),
(735638, 'Rosina Grady', '2674 Arlo Lake Suite 632\nDaughertyfort, MD 77743', '+1-267-319-2175', 'rleannon@example.com', 'https://faces-img.xcdn.link/image-lorem-face-3962.jpg', '1951-02-26', 19400, 1, '2023-03-02 05:08:40', '2023-03-02 10:35:40'),
(779940, 'Bryana Schumm', '551 Braun Mountain\nMillershire, NY 66876', '+1-307-367-2566', 'roscoe82@example.org', 'https://faces-img.xcdn.link/image-lorem-face-663.jpg', '2010-07-06', 93170, 208976, '2023-03-02 14:46:35', '2023-03-02 08:41:58'),
(783924, 'Ardella Sporer', '332 Leuschke Expressway Suite 022\nPort Jesusville, NE 80649', '445.495.2005', 'schoen.dee@example.net', 'https://faces-img.xcdn.link/image-lorem-face-5046.jpg', '1987-02-12', 69859, 779240, '2023-03-02 13:47:30', '2023-03-02 06:15:56'),
(798220, 'Ozella Watsica', '67317 O\'Conner Trace\nHettiehaven, NH 58443-5464', '+13478155589', 'wkonopelski@example.net', 'https://faces-img.xcdn.link/image-lorem-face-2344.jpg', '1925-08-29', 93170, 991961, '2023-03-02 10:50:26', '2023-03-02 10:57:14'),
(799679, 'Dr. Noemy Haag', '1668 Myrtice Street\nLake Dylan, KS 17668-0632', '+1-563-618-5799', 'jennyfer38@example.com', 'https://faces-img.xcdn.link/image-lorem-face-5971.jpg', '2017-11-27', 19400, 208976, '2023-03-03 03:01:39', '2023-03-02 14:51:01'),
(809450, 'Dr. Allen Hane DVM', '343 Claire Prairie Suite 498\nGloverbury, SC 43732-7761', '1-954-753-2693', 'bradford63@example.com', 'https://faces-img.xcdn.link/image-lorem-face-709.jpg', '1996-06-22', 70315, 771259, '2023-03-02 16:04:32', '2023-03-02 20:18:55'),
(812831, 'Prof. Edna Kertzmann PhD', '46849 Gerard Locks Apt. 854\nLakinburgh, SC 62358', '+18575322784', 'pfeffer.gia@example.net', 'https://faces-img.xcdn.link/image-lorem-face-2720.jpg', '2011-03-22', 43577, 1, '2023-03-03 04:36:32', '2023-03-02 05:28:21'),
(819256, 'Maureen Hahn', '3707 Yadira Pike\nPort Roxanne, CT 08528-4352', '1-831-642-7956', 'ismith@example.net', 'https://faces-img.xcdn.link/image-lorem-face-6403.jpg', '1956-06-02', 73896, 2, '2023-03-02 15:35:33', '2023-03-02 08:16:56'),
(838705, 'Mr. Alessandro Considine MD', '820 West Station\nNew Tate, AK 29455-7110', '+1-469-692-2591', 'bernard.mcclure@example.org', 'https://faces-img.xcdn.link/image-lorem-face-6085.jpg', '1931-06-17', 69859, 2, '2023-03-02 22:53:18', '2023-03-02 06:42:55'),
(841209, 'Mr. Mathias Johnson', '1971 Stehr Divide Apt. 742\nKobyshire, MS 79983', '+1.986.344.3107', 'zkshlerin@example.net', 'https://faces-img.xcdn.link/image-lorem-face-2013.jpg', '1999-12-29', 93170, 208976, '2023-03-02 21:17:18', '2023-03-02 07:53:26'),
(852787, 'Velma Stoltenberg', '661 Aric Meadow\nTurnerstad, NC 08350', '+1-951-602-3978', 'mmiller@example.com', 'https://faces-img.xcdn.link/image-lorem-face-1942.jpg', '1979-02-24', 19400, 208976, '2023-03-02 23:25:58', '2023-03-02 19:53:35'),
(861899, 'Mr. Haskell Satterfield', '987 Eichmann Field Suite 184\nLake Zoilaview, RI 76548', '539-375-8098', 'issac.fahey@example.com', 'https://faces-img.xcdn.link/image-lorem-face-5212.jpg', '2004-06-29', 41630, 2, '2023-03-02 14:40:10', '2023-03-02 09:57:04'),
(862765, 'Irma Schinner', '43429 Yazmin Extensions Suite 086\nNew Dortha, NC 85006', '848-463-1033', 'ferry.floy@example.org', 'https://faces-img.xcdn.link/image-lorem-face-1102.jpg', '1987-04-24', 19400, 208976, '2023-03-02 22:08:09', '2023-03-02 19:32:41'),
(888533, 'Ms. Earline Pollich', '3511 Arvilla Knolls\nLuzmouth, ND 62974-5568', '314.813.2769', 'koss.destany@example.net', 'https://faces-img.xcdn.link/image-lorem-face-2658.jpg', '1993-12-29', 43577, 991961, '2023-03-02 10:23:19', '2023-03-02 14:45:45'),
(894482, 'Mrs. Clarissa Bernier Jr.', '69110 Jazmyne Ville Apt. 821\nEast Emelia, OH 70758-0385', '(341) 709-8526', 'cindy45@example.org', 'https://faces-img.xcdn.link/image-lorem-face-5610.jpg', '1992-07-30', 16631, 2, '2023-03-02 12:25:10', '2023-03-02 14:08:00'),
(915851, 'Deven Hirthe', '542 Elmira Village Apt. 974\nMosciskitown, CO 36230-1948', '+1.281.687.8483', 'yhartmann@example.com', 'https://faces-img.xcdn.link/image-lorem-face-2469.jpg', '1955-08-10', 41630, 991961, '2023-03-02 10:09:07', '2023-03-03 02:25:14'),
(916984, 'Cesar Bednar', '378 Hessel Unions\nLake Pattiebury, AL 24361', '+1.561.524.6016', 'gerlach.andy@example.net', 'https://faces-img.xcdn.link/image-lorem-face-2669.jpg', '1991-04-04', 70315, 1, '2023-03-02 17:17:41', '2023-03-02 20:39:20'),
(924900, 'Dr. Ryley Paucek', '92936 Reilly Key Apt. 969\nHeaneyville, IL 40400-7273', '1-660-972-3758', 'devin98@example.org', 'https://faces-img.xcdn.link/image-lorem-face-6316.jpg', '1928-04-21', 51425, 991961, '2023-03-03 01:30:14', '2023-03-03 00:02:41'),
(942392, 'Dannie McKenzie', '5551 Kassulke Tunnel Suite 374\nFaheyborough, GA 66685-6021', '+1.231.277.5289', 'jones.lilyan@example.net', 'https://faces-img.xcdn.link/image-lorem-face-122.jpg', '1990-08-18', 43577, 3, '2023-03-03 02:06:51', '2023-03-02 14:09:15'),
(946518, 'Tremaine Zemlak', '7851 Ethel Fords\nLake Sofiachester, UT 87570-6175', '+1-458-272-3411', 'qrodriguez@example.net', 'https://faces-img.xcdn.link/image-lorem-face-6695.jpg', '1935-09-30', 70315, 208976, '2023-03-02 07:46:24', '2023-03-02 16:28:21'),
(966023, 'Blake Russel', '67157 Gleichner Loaf Suite 721\nPort Shayne, NH 46253', '262-258-1524', 'kattie.rowe@example.com', 'https://faces-img.xcdn.link/image-lorem-face-3957.jpg', '1941-01-27', 41630, 771259, '2023-03-03 02:39:37', '2023-03-02 11:53:05'),
(989256, 'Akeem Kemmer', '7797 Fay Crossing\nIsabellemouth, WV 68778-6769', '931.494.0402', 'mlemke@example.com', 'https://faces-img.xcdn.link/image-lorem-face-4812.jpg', '1970-05-26', 16631, 208976, '2023-03-02 09:21:30', '2023-03-02 10:51:04'),
(990516, 'Prof. Ayla Schuppe II', '94460 Kevon Neck\nLorenaport, DE 89510', '1-501-682-1786', 'percy29@example.net', 'https://faces-img.xcdn.link/image-lorem-face-6570.jpg', '1987-07-18', 57781, 771259, '2023-03-02 16:24:34', '2023-03-02 23:34:29');

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
-- Table structure for table `forum_posts`
--

CREATE TABLE `forum_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `categorys_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forum_posts`
--

INSERT INTO `forum_posts` (`id`, `title`, `body`, `user_id`, `created_at`, `updated_at`, `categorys_id`) VALUES
(102873, 'Distinctio aliquam facilis laboriosam consequuntur quisquam et eveniet.', 'Maxime laborum expedita veritatis vel nemo quas. Voluptas exercitationem voluptatibus voluptatum pariatur. Dicta at in aut error nesciunt laboriosam quia. Ea dolorum dolore dolore error. Nulla culpa accusantium ut quidem. Et optio harum dicta sunt. Reprehenderit ex aut dolores quaerat est praesentium veniam. Ullam sequi enim ab voluptate. Assumenda magni atque et ratione quasi. Sit voluptates voluptatem quam ut laudantium. Officiis aut cum voluptates minima deserunt excepturi nihil. Id in velit laboriosam corrupti fugiat et. Qui provident porro necessitatibus molestias. Voluptas corporis eum sequi nemo veniam. Reiciendis quam recusandae velit dicta ipsa aut accusantium. Qui tempore iure atque non facere autem dolorum. Provident error adipisci consequuntur consequatur. Soluta quibusdam repellendus tempora omnis eum adipisci magnam. Qui natus iusto consequuntur velit voluptas. Hic sit quod commodi. Quas dolore nobis alias rerum. Fugit placeat itaque suscipit cum est. Qui laborum et quis. Voluptatem rem quisquam debitis fugiat rerum quae ut. Fugit excepturi atque et sit libero quia itaque. Ut quidem pariatur quia tempora non suscipit.', 32, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(104259, 'Natus quam dolorum fuga numquam.', 'Recusandae optio qui sunt repudiandae similique exercitationem. Est consequatur corrupti ut. Illo qui ducimus inventore similique voluptates inventore aperiam. Aspernatur debitis ut molestiae modi ea voluptatem. Laborum temporibus doloribus at explicabo enim sit tenetur. Est iure sit facere impedit alias quis. Error aut vero hic nesciunt ea. Laboriosam perspiciatis et dolor occaecati dicta quisquam consequatur iste. Tempore ducimus totam commodi consequatur aut modi reiciendis laboriosam. Nulla sunt voluptas magni. A quam occaecati ea omnis harum dolore. Assumenda quibusdam voluptatem eum aspernatur sapiente voluptates. Nemo blanditiis modi modi dolorem soluta. Sunt tenetur delectus dolor. Cum quisquam voluptate sit quam eligendi aliquid aliquid.', 29, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(114455, 'Est voluptates praesentium incidunt exercitationem est recusandae eaque.', 'Modi est incidunt aut quasi ducimus veniam minima voluptatibus. Recusandae consequatur modi fugit esse. Magnam nihil voluptates velit ea sed. Architecto amet minus ut sint saepe. Occaecati debitis voluptatem vel voluptatem. Quam quidem aliquam iusto laborum. Et velit nihil eaque at reprehenderit. Sed in quos nemo illo nihil ut sint tenetur. Ea ut excepturi ad. Quia laborum nesciunt et iusto voluptatem delectus quia qui. Provident pariatur molestiae voluptatem dolor neque. Ut amet voluptas magnam ut tempore aut. Qui distinctio amet assumenda voluptatibus. Velit quibusdam aut quis totam atque sunt qui. Expedita necessitatibus omnis est est et vero enim. Voluptatem dolores voluptatem numquam voluptas doloremque laboriosam dolore. Similique est consequatur quia distinctio. Adipisci magni dicta veniam temporibus. Quis minima dicta et dolor. Ea quis vel fuga pariatur asperiores porro. Optio voluptatibus eum accusamus quaerat et adipisci autem et. Nisi quo commodi ut voluptates est eos corrupti. Doloremque aut non eum ullam.', 82, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(117877, 'Ut similique laborum ex aperiam.', 'Debitis atque iste maxime et. Quas minus voluptatem et nemo non eum voluptatum omnis. Quisquam omnis ut itaque neque. Blanditiis hic quaerat maxime sapiente. Est saepe in enim et consequatur necessitatibus non. Tempora tempore nostrum at id consequatur sed. Modi consequuntur quis totam autem possimus consequuntur. Provident recusandae asperiores ipsam rem quis eum. Culpa delectus non sapiente sed. Ipsa dolorem cum possimus animi ratione qui at perspiciatis. Molestiae nesciunt aut alias excepturi. Ea minus aut accusamus ut odit ad beatae. Odio fugit sapiente cum sit id pariatur. Quibusdam aut et maxime illum voluptas eaque beatae. Fugit amet minus nihil esse maxime. Minima minima sunt ut est animi maxime et. Amet repellat impedit voluptas consectetur et et. Accusantium sed atque veniam illum. Voluptatem magni quisquam ab ex est voluptatem et. Dolorem optio perspiciatis numquam voluptatem ullam saepe voluptate. Et quidem est molestias illo quos rerum qui. Est nostrum fugiat aut qui exercitationem reiciendis et.', 108, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(137336, 'Vel odio ipsa praesentium adipisci temporibus ut.', 'Laudantium perspiciatis non dolor expedita perferendis sapiente omnis. Nihil suscipit magnam ut alias voluptas quos provident exercitationem. Nobis impedit itaque ipsum labore quibusdam molestiae. Temporibus eum eius qui et officiis neque alias. Et quae voluptas quia magnam explicabo omnis. Officia rerum a molestiae repudiandae. Voluptatibus a recusandae atque qui qui sit libero et. Error aliquam ipsam id consequatur qui qui cumque. Sint architecto quisquam sunt et. Dicta expedita reiciendis repellendus maiores. Excepturi laborum accusantium perspiciatis molestiae omnis tenetur qui. Aut dicta similique commodi sunt et tempora. Commodi dolor ipsum qui et. Totam voluptatibus laboriosam doloremque molestiae consequatur esse temporibus. Ducimus quae voluptas voluptas vitae neque perferendis dolor dolor. Quis eius odio magni ipsam dolore vel est. Quia est quia repudiandae occaecati praesentium soluta illo. Nihil eligendi sed eum nihil eos. Itaque aut ratione nulla impedit exercitationem aliquam velit. Sapiente et aliquid sed beatae.', 44, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(138349, 'Qui facilis molestiae iste dolores quaerat in sit enim.', 'Sint tenetur sapiente atque molestiae nam voluptatem totam quos. Tenetur repudiandae similique aut voluptates. Nam rerum exercitationem mollitia id autem voluptas praesentium porro. Velit accusamus debitis natus. Molestiae impedit sunt occaecati quaerat nobis repudiandae. Ipsam et nihil et qui. Voluptas voluptate ab assumenda consectetur amet consequatur. Est eius aut et provident repellat quos temporibus. Recusandae quo est exercitationem nemo omnis minima facere. Quisquam dolorum mollitia aut suscipit rerum sed. Impedit amet minima quam aliquam pariatur consequatur molestiae magnam. Pariatur veniam autem est. Voluptatem temporibus voluptas quia enim voluptate. Minima ut sint reprehenderit tenetur assumenda rerum. Nostrum modi repellat similique eos nulla. Sit et optio architecto enim ea. Ut consequatur sequi dolorem reiciendis esse atque. Sequi culpa quis maiores rerum architecto. Adipisci saepe quam ab qui vel maiores. Ex laboriosam quam omnis esse rem voluptas laboriosam. Sit dolorum sit id ut. Fugit explicabo et dolor cumque expedita sequi dolorem. Et numquam facilis quas excepturi unde. Qui ducimus rerum soluta dolorem consequatur et.', 67, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(143499, 'Nostrum dignissimos sapiente minus.', 'Voluptatem eos consequuntur saepe vero. Non nobis debitis odio quo ea dolor minima. Harum ut et iusto maiores est. Cupiditate magnam voluptas aliquam. Veniam voluptatem harum eius libero. Ratione recusandae omnis aspernatur aliquam quidem. Accusamus debitis iste consequatur nemo repellendus. Culpa quo animi qui quasi temporibus. Numquam ab consequatur quaerat qui labore neque molestiae. Quo vitae quasi ut qui soluta molestiae recusandae. Quo sint quia eos omnis cupiditate rerum qui. Tempore asperiores impedit qui error. Cumque consequatur sunt veritatis vitae adipisci eius vitae. Provident quia qui nesciunt in. Tenetur perferendis rerum architecto. Aliquam eveniet accusantium qui soluta qui nam. Asperiores non omnis sunt voluptatibus eum eius. Quis magnam nesciunt accusamus. Nihil quia repudiandae necessitatibus enim cum doloremque vitae minima. Possimus in quod excepturi est facere. Ullam accusantium iusto ut quisquam velit. Aperiam dignissimos distinctio sed quam voluptatum. Sit aut debitis sit nam eius deserunt sed. Aperiam sed beatae sequi dignissimos animi aspernatur. Id sint qui nemo laudantium atque. Tenetur praesentium quis molestiae et.', 65, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(148289, 'Aspernatur et aut expedita ea.', 'Rerum fuga itaque ut officia aut aut. Fuga cupiditate quam ut quaerat modi nam. Explicabo hic voluptas et in est quo recusandae quod. Distinctio in porro eius architecto officia nobis aut. Cumque enim molestiae consectetur rerum. A quasi eaque quas tenetur nostrum. Beatae expedita velit molestiae excepturi. Distinctio sed rerum officia. Nihil laborum quaerat ut est qui quos quia. Odit delectus iusto molestiae ea. Aut sunt iste reiciendis vel. Consequatur dolor sed quia nam expedita. Dolore error et earum rerum nihil esse enim. Ipsam itaque corrupti veritatis aspernatur delectus quo. Sint nihil consequatur nulla. Velit saepe eveniet earum. Aut id vero qui corporis provident quisquam. Dicta accusantium omnis id dolores. Iusto deleniti eius sit dolorum ea. Voluptas soluta mollitia dicta non alias explicabo. Suscipit iusto a omnis quaerat consequatur illum sunt. Commodi et aperiam neque voluptate.', 185, '2023-03-02 06:52:13', '2023-03-02 06:52:13', 3),
(151987, 'Consequatur voluptatem vel sed ullam quam placeat.', 'Itaque nam quaerat architecto iure. Qui quo deserunt qui enim. Iusto culpa aut quia sed est. Magnam adipisci eaque vitae ut dolore vitae. Dicta illum velit quia molestiae. Quasi labore voluptatibus libero blanditiis. Quod qui perferendis voluptate libero quis facilis. Beatae aut ut et officia. Sed debitis voluptas quas voluptatem. Porro ipsum placeat autem quibusdam. Totam soluta minima ab officia. Architecto ipsa quia nostrum est provident sunt nesciunt. Sint labore adipisci ratione non. Reiciendis nulla neque facere repellat ad. Ut ut id praesentium assumenda molestiae. Odit ipsum voluptatem inventore quam quas mollitia iusto. Dolor et quis accusamus nemo. Quibusdam optio enim omnis a. Error aliquam nemo iure ut autem neque. Facilis architecto et provident similique autem. Voluptatum et id labore omnis. Quibusdam modi et ad nam reprehenderit quo possimus. Sit dolores sed sint. Veniam ex quia illum laborum.', 16, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(156861, 'Ipsam veniam dolor quis soluta.', 'Eum sint accusamus enim omnis. Modi quibusdam atque atque corporis recusandae nobis rem quaerat. Veritatis qui qui quisquam. Facilis officiis atque eum. Voluptate at optio dolorem. Consequatur iusto inventore facere fugit iste beatae. Ipsum sint aspernatur corporis qui dolores officia. Consequatur dolor error enim ad beatae recusandae repudiandae. Veritatis autem accusantium ea. Nobis impedit consequatur eligendi aut delectus aperiam qui. Odit ad et iusto et sint. Est velit dolor nisi deleniti. Nostrum quo dolorum eum dolore dolore.', 90, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(166954, 'Maiores voluptas repudiandae sed voluptatum repudiandae architecto.', 'Consectetur reiciendis voluptate odit ducimus ab quo. Dolorum ullam officiis voluptatem voluptatem vel. Saepe quo voluptatem deleniti. Sit laborum consectetur ut rem dolore magni. Ut sunt optio maxime. Magni provident cupiditate sit. Mollitia saepe voluptatum inventore quis omnis sit alias. Sed in mollitia quaerat enim architecto quis. Natus non temporibus distinctio optio nostrum. Aliquid nisi rerum et cumque hic. Sapiente recusandae non eveniet ea dolore nisi culpa sed. Et quia distinctio similique. Sequi iusto qui veritatis enim. Odio aspernatur voluptas natus et. Consequatur voluptatem dolorum aut impedit. Et ipsa deserunt corporis debitis necessitatibus ad. Corporis ipsam sit rem perferendis.', 199, '2023-03-02 06:52:13', '2023-03-02 06:52:13', 2),
(167144, 'Delectus perferendis debitis asperiores vel et ducimus.', 'Magni officia atque quas esse temporibus. Nulla est ut doloribus voluptas inventore aut. Eligendi accusamus magnam ad quod cupiditate. Soluta et explicabo quasi dolorum. Ducimus est ut aut blanditiis est recusandae reprehenderit. Quasi commodi a esse. Molestiae recusandae praesentium autem assumenda incidunt. Est delectus repellendus odit enim praesentium. Debitis eaque vitae et reiciendis dolor possimus. Debitis nobis sunt ut. Magni aliquid ratione reprehenderit repellat aliquid voluptatem. Non praesentium nisi non quidem aut qui reiciendis. Quo quia id cum ut expedita. Explicabo magni corrupti error voluptas odit. Illo ut sit maiores aut. Deserunt debitis laborum inventore autem dolor tempore.', 5, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(174918, 'Et quibusdam laudantium laboriosam ab molestiae soluta.', 'Omnis veniam qui ratione vel et id. Ipsum consequatur numquam laborum aut. Dolorum eum dolor et saepe vitae. Modi consequatur similique sed est amet repellat. Et iste illum omnis atque. Sunt quae illo cum iste. Quo dolorem nesciunt magni est ut quam et. Iusto vel ex nobis repellendus cum eaque saepe. Ullam qui non est vero cum. Quaerat commodi eaque accusamus voluptas possimus explicabo consequatur. Deserunt dolorem nihil quisquam quisquam suscipit accusamus sed facilis. Quidem est totam eveniet quibusdam. A qui tempora modi illo harum vel velit. Iste esse dolore id rerum. Iusto vel accusamus odit quam.', 106, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(175421, 'Quia qui nostrum numquam qui et molestiae.', 'Sed ut hic soluta quae velit quidem. Voluptatem quaerat quasi quia fuga deleniti. Iusto voluptatibus non aliquid dolorem omnis quaerat at enim. Nam porro nostrum qui quam odit rem. Autem corrupti ab vero quo quia mollitia aspernatur voluptatem. Id eaque adipisci sit et. Odit quidem sed id. Ea est veritatis omnis sit pariatur quas. Voluptas sit repudiandae tempore asperiores occaecati. Error autem dolor labore incidunt blanditiis consectetur voluptatibus. Quia provident nemo ipsa dicta recusandae sed. Aspernatur atque quos veritatis eligendi consequatur rerum qui totam. Ab et sed qui sint nihil numquam provident. Est dolor rerum et sunt et ut sequi. Quia rerum sed atque facere porro id. Sit sunt sint ut. Et magni rem id est qui quas. Suscipit in dolor quaerat voluptate. Sequi aspernatur unde voluptatum fuga et eligendi ut. Optio voluptas eligendi omnis minus ut maiores sit. Provident maxime consequuntur necessitatibus at. Nostrum nemo excepturi eos eveniet accusamus voluptatem qui. Et voluptate fugiat sit qui ut. Delectus sit esse harum perferendis voluptate.', 149, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(186043, 'Consequuntur vitae rerum omnis.', 'Molestiae optio odio amet et cupiditate maiores. Unde unde rem magni dolore molestiae in. Laborum impedit rem repudiandae atque. Vel eligendi et non et at dolorum harum. Fugit placeat distinctio minima adipisci. Praesentium facilis iusto dolores debitis sed dolores. Omnis et magni qui dolorem similique. Ut dolor at quo. Aliquid necessitatibus eum corrupti fuga voluptates officiis sit commodi. Vero nemo voluptas quaerat omnis ullam magnam. Autem laudantium nihil a deserunt earum ut. Libero quas iste consequatur facilis. Et soluta quibusdam sed perspiciatis doloremque. Vero perspiciatis debitis quisquam quis eaque. Deleniti aut esse nihil ducimus qui. Voluptate aut neque vero qui. Est repudiandae nobis aut quo. Fugit nihil explicabo voluptatem. Eligendi voluptates quasi veniam at. Quis sed delectus eaque et dignissimos nemo. Reprehenderit quod aspernatur consequuntur et nostrum voluptatem laudantium atque. Adipisci molestias eveniet eum voluptatem perspiciatis molestiae blanditiis necessitatibus. Neque pariatur commodi nesciunt debitis et molestias. Odit praesentium tempore ut cupiditate velit consequatur. Aut exercitationem id rerum veritatis consequatur libero earum. Illum officiis pariatur molestiae dolor commodi. Aliquid et rem et repellat occaecati sed ex.', 85, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(189526, 'Nobis laboriosam debitis voluptatum quo doloremque laborum esse.', 'Ipsa vero voluptas autem. Quis aut corrupti blanditiis iste. Aut tenetur aut cumque autem ullam nihil nesciunt. Autem cupiditate iure eos sapiente. Rerum ut optio et maxime laudantium illum qui. Blanditiis nobis optio voluptatem dolores eos est voluptatem. Explicabo iure voluptatibus omnis consequatur occaecati accusantium. Perspiciatis voluptate quia et ullam. Et voluptatem quisquam totam ea nulla. Nesciunt vero est dolore consequatur sapiente ut ut at. Fugit omnis soluta perspiciatis atque quaerat. Minus nobis enim in est commodi ad. Qui molestias praesentium debitis itaque. Ut eos nulla architecto et sunt maxime. Et ducimus unde dolorem voluptas porro voluptatibus similique. Qui hic quas aut quo. Nihil eveniet natus consequuntur. Ea occaecati eligendi quasi aut laboriosam. Quasi ullam nobis laborum dolorem autem eaque. Est et doloremque modi maiores ea. Repellendus qui et quaerat tempore sit ad. Et non rerum sunt. Sunt qui voluptate quas nemo aperiam id. Quia impedit nemo temporibus et placeat. Vero et nemo ex quis cum. Qui dicta non quod debitis nam non. Culpa dolorem et inventore corrupti asperiores pariatur sed quo.', 143, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(189894, 'Ducimus sequi reiciendis illum sit sunt exercitationem.', 'Dignissimos libero ratione voluptatem neque voluptas voluptas enim. Sed dolore enim consequatur hic voluptas. Aut accusamus laboriosam odio. Ipsum quibusdam excepturi hic non accusamus amet sunt. Aut laboriosam quia tempora eligendi id. Est suscipit quis non aut rem corrupti. Rerum numquam voluptatem cum eum voluptatem numquam. Blanditiis ratione non laboriosam a aspernatur dolorem provident. Aut illo quibusdam quis ad vel libero. Aut autem voluptatem recusandae molestias. Iste enim nesciunt sequi sequi. Quo aut veritatis veritatis inventore quam commodi nesciunt. Ad earum corporis quidem eos fugiat tempora. Deleniti magnam non nobis nihil. Officiis velit at natus laboriosam. Est molestiae quam deserunt quam. Cumque asperiores laboriosam blanditiis. Quaerat excepturi amet consectetur blanditiis. Non enim qui accusantium eos velit. Autem velit ea labore corporis quod officia officia. Ea quisquam nemo fuga earum.', 78, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(192693, 'Totam minus eius qui neque aut soluta.', 'Sit dolore est dolorem eos. Eos a ratione aliquam animi architecto quia exercitationem. Laboriosam sequi animi cum quibusdam. Explicabo aut iusto fuga voluptas reiciendis. Tenetur neque omnis consequatur culpa maxime vero odio. Quis maxime nesciunt iure. Voluptatem sed ipsa consectetur non rem. Et illum molestiae ipsam quia voluptatem libero cupiditate. Maxime in quibusdam sunt asperiores explicabo et. Culpa rerum molestias qui veniam aut commodi laboriosam autem. Sequi quaerat dolores minima similique architecto. Atque enim dolorum sapiente corrupti quia consequatur. Impedit voluptas eius optio quis. Nesciunt explicabo et dolor rerum. Tenetur quidem voluptatem voluptatibus est. Voluptatum quos iusto fuga fugiat quis est aut. Debitis est ullam autem et. Error repellat commodi beatae praesentium voluptas ad eum.', 91, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(193784, 'Non voluptas voluptatem ab.', 'Fugiat dolor amet voluptatem eius repellendus quia dolore et. A ab vitae dolorum impedit vel sit dolorem. Porro totam rerum earum possimus. Neque earum provident illum non. Sapiente debitis sint tempora voluptatibus. Doloribus at aperiam eaque provident provident dolorum. Eos eligendi tenetur officiis et at labore. Assumenda occaecati laudantium dolores rerum rem quam. Rerum tempora rem et dolor facilis alias. Nemo corrupti non sint id vel. Enim molestiae molestiae nisi dolorem amet. Rem animi ipsa veniam fugit necessitatibus quae culpa. Placeat aut aperiam aut fugiat. Dolore deleniti id ipsa sit perferendis deleniti neque ut. Quis aut maxime totam laudantium. Repellendus occaecati reprehenderit libero nobis.', 181, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(194334, 'Enim soluta voluptatem sint tempora aspernatur in modi.', 'Sequi quas sit repellat repellat hic. Velit voluptatem ex incidunt aperiam sequi ut. Atque praesentium consectetur fugit eum nobis. Nihil et a ut ab temporibus impedit ex. Sed minima sed ratione doloribus voluptatem illum. Accusamus laboriosam aliquam saepe quaerat. Dolore odio qui minima saepe molestias et modi. Rerum deleniti est unde voluptate necessitatibus ex fuga maiores. Cumque vel delectus amet laboriosam occaecati. Est eius nisi error rem dignissimos eum. Quod ullam sint est doloremque voluptatum non cum dolores. Velit molestiae deserunt dolor. Esse blanditiis dolorem veritatis vitae perspiciatis eaque. Laboriosam sunt nemo voluptatem. Ducimus eligendi rem fuga neque. Atque molestiae non et quod culpa. Aut fugiat dolorem illo quibusdam consequatur autem. Nobis voluptate fuga a dolorem omnis rerum sint qui. Libero exercitationem excepturi doloribus non ut commodi. Tenetur aut assumenda eos atque sed neque. Velit rerum blanditiis maiores.', 163, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(204576, 'Ut excepturi quia fuga possimus.', 'Quia nobis earum maxime quia. Et ut laborum unde nisi. Animi quo non labore. Et enim voluptate sed non velit. Et beatae unde iusto. Commodi sed fugiat facilis qui est adipisci ut. Quia qui alias veniam consectetur. Incidunt voluptates corrupti eum aut et unde nisi aut. Ab tempore eaque doloremque quia. Voluptatem est et ducimus commodi. Eligendi qui error provident fugit. Autem at maiores tenetur consequatur. Assumenda quisquam et laboriosam a suscipit a ipsa nam. Ex nihil aut doloremque rem sit dolorum sapiente. Voluptate optio veniam deleniti ipsum sed amet commodi. Debitis velit rerum aut nisi incidunt repellat vel cum.', 136, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(205922, 'Aliquid labore voluptates cupiditate at quam hic repudiandae dicta.', 'Et excepturi veritatis dolores asperiores perferendis. Sed vitae et voluptate eius blanditiis earum qui ullam. Ullam dolor ullam ullam id modi tempora. Voluptatem deleniti fuga nostrum numquam. At voluptatem vero nostrum. Soluta voluptatem et odio reiciendis. Error expedita consequatur sequi aliquid quis incidunt magnam. Tenetur aliquid ducimus modi eum eum atque. Velit perspiciatis doloribus excepturi rerum soluta. Consectetur id vel voluptas. Est et dolores fugit sit. Perspiciatis quibusdam ut rerum expedita ipsa consequatur neque. Quaerat voluptates provident expedita laboriosam. Fugiat adipisci voluptatem voluptas dolorum ducimus. Molestiae rerum rerum et alias. Sit sit itaque saepe modi et. Nesciunt et rerum quisquam itaque rerum voluptatem error. Qui inventore quisquam eum animi officia assumenda minus. Accusamus assumenda ut rem tenetur architecto sapiente odio. Mollitia consequatur et facere quisquam quam velit. Et quaerat aut id nobis molestiae in. Repellat pariatur libero beatae voluptatem dolores. Explicabo aut sint pariatur tempora.', 94, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(209028, 'Mollitia nostrum qui quo amet nobis non.', 'Aut minima dolorem officia est illo perspiciatis et totam. Consectetur sed nobis molestiae nobis rerum. Eos explicabo error aliquid unde quo sunt. Officiis harum aperiam ex necessitatibus sed ab illo. Eos tempore maxime voluptatem sit voluptatem beatae sed. Eos est vero at. Voluptatem eveniet ut id quas delectus. Aut asperiores voluptatem esse. Ducimus aut aperiam doloremque nihil fugit ut perspiciatis. Est aspernatur repellendus esse. Quos aut natus libero quis. Occaecati laboriosam quisquam sunt laborum nemo voluptate modi. Consequatur qui sit placeat voluptates quis assumenda. Facere excepturi vitae dolor sit qui deleniti. Impedit voluptatem fugit voluptatem similique saepe omnis et. Quod iusto et necessitatibus iusto sit impedit voluptatem. Maiores qui sit quis fugiat et earum qui. Unde beatae repellat dolor nostrum vel et. Molestiae quaerat in placeat consectetur et velit. Doloribus commodi tenetur cum cumque perferendis et. Neque voluptas quia velit voluptatem consequatur eos. Consequatur aut vel dolorem reprehenderit aut mollitia. Possimus ut asperiores aut dolorem eos rerum voluptatem. Iusto aut atque nihil ut ut iusto. Ipsa rerum voluptas sint nostrum ad beatae. Eligendi et ut unde natus laboriosam animi ut. Aut voluptatum harum vel asperiores voluptas.', 133, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(215306, 'Ut et a nostrum dignissimos quia fugiat laboriosam.', 'Est expedita sit exercitationem officia delectus rem. Quae quos delectus delectus sed tempora delectus dignissimos cumque. Facilis dicta aut facere odio unde modi voluptas. Cum maiores tempora exercitationem quia. Dolor qui quia magnam tempora architecto et. Repudiandae et modi exercitationem corporis temporibus et. Quo distinctio perferendis quo accusamus. Voluptatibus ea ut sapiente rerum. Dolor enim consequatur in aliquam blanditiis recusandae eius eum. Sit voluptas eveniet pariatur earum. Vel vitae doloremque sequi nihil consequatur aliquam. Velit quasi porro laudantium omnis quae. Dolorem similique blanditiis amet debitis optio pariatur reprehenderit. Vel repellat ullam id nihil eveniet et minima. Non dolorem corporis et cupiditate cupiditate distinctio. Aut non voluptatem maiores. Voluptas corrupti laudantium magnam fuga dolore accusamus est amet. Ut itaque sed et rerum ad sed. Enim ut delectus ad reiciendis pariatur ad. Velit id reprehenderit voluptatem sunt quidem repudiandae sed impedit.', 183, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(216987, 'Deserunt ea dolor cum aut unde.', 'Eaque aspernatur excepturi mollitia corporis. Ab magnam aut qui dolorem quo nobis quaerat. Enim autem dolor suscipit a ut. Voluptate est laudantium quod iusto delectus. Cumque rerum eaque corrupti numquam. Est dolores qui et. Est nihil omnis molestiae et voluptate. Placeat saepe et aut. Odio dolor nobis architecto ut. Non dolore amet qui necessitatibus voluptas quis earum. Inventore quibusdam provident eligendi alias quod beatae dicta. Accusamus ab recusandae tempora ut voluptatem. Voluptatem culpa reprehenderit velit voluptas. Cumque molestiae eveniet cum eum impedit quasi. Praesentium eum labore dolorum asperiores iste eveniet voluptatibus voluptates. Soluta expedita et eum vel omnis et quam architecto. Consequuntur eligendi odit incidunt laudantium excepturi quia eveniet.', 23, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(218558, 'Aliquid debitis nihil consequuntur ea.', 'Sed et praesentium et error laborum libero non. Atque voluptatum velit cum ipsam. Ex nesciunt fugit commodi recusandae. Voluptatem voluptatibus facilis corrupti. Quia dolorem dicta corporis ut culpa minima aut consequuntur. Sed molestias vero nobis rerum earum aut. Porro alias amet sequi unde aut. Vero laboriosam labore voluptas sit sequi amet beatae. Possimus veniam quo ipsam praesentium qui rerum. Sed aut nesciunt sint velit laboriosam dicta ratione. Quia adipisci ut voluptatem ipsum modi. Minima laborum ipsa voluptatem porro. Eum ut quasi omnis aut in quia recusandae. Minus minima culpa nulla similique inventore. Labore iusto consequatur tempore in quos. Ut eum enim deserunt culpa. Quidem necessitatibus consequuntur aliquid est. Quibusdam pariatur distinctio natus quam sequi a nesciunt. Aut nostrum possimus eos in. Asperiores sed necessitatibus est natus. Voluptas blanditiis nulla magnam laudantium est illum est.', 19, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(223415, 'Officiis necessitatibus iusto non voluptatem ratione aut corrupti.', 'Suscipit ad provident ut at perspiciatis est culpa. Consequatur corporis voluptatibus minus. Nostrum quia at cupiditate et quos vero omnis. Rerum et iste ut fugit alias excepturi. Dolor consequatur fuga voluptatem inventore ut et optio. Porro quas quidem dolorem saepe. Voluptatem accusamus officiis voluptatum voluptatem atque consectetur. Dicta molestiae eaque ea facere eius dolorum excepturi a. Accusantium et error repellendus minima magnam. Voluptas eos et laborum temporibus voluptatem. Ea nesciunt iste repudiandae sed ullam expedita. Quaerat libero voluptatem sed facilis. Numquam doloremque esse molestiae ea fuga id porro. Quos nihil cupiditate omnis quam rerum voluptate sunt. Sint et nobis est et dignissimos consequatur. Ratione aperiam inventore voluptatum aut quia corporis eveniet. Nobis consequatur aliquid quidem illum harum. Asperiores quia quidem sit optio at sit. Et qui ut excepturi consequatur repellendus est. Ut corrupti quia nisi sapiente qui. Corrupti ipsa veritatis molestiae culpa nihil est pariatur. Qui quibusdam culpa error iure quos adipisci. Et alias nihil tenetur culpa. Minima nam voluptas veritatis non fugit rerum voluptas qui. Ut ea consequatur sunt illum tempora facere quibusdam. Maiores numquam iure quis ullam accusamus culpa eos cumque.', 184, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(225887, 'Fuga autem deleniti aut.', 'Aut eum et ipsam animi aliquam ipsa veniam. Provident eos reprehenderit ut quia pariatur cum voluptatem. Recusandae veniam et veritatis quia ut in. Ut voluptatem illo vitae delectus. Harum iure quo et animi. In eaque quidem nihil aut. Similique odit magni nemo delectus. Facilis fugit explicabo rerum magnam. Autem laudantium asperiores sint nisi voluptatibus voluptatem mollitia sint. Aspernatur recusandae in at sapiente sed magnam eius. Commodi eum aperiam dignissimos non laudantium. Eos molestiae nobis aspernatur explicabo similique eum perspiciatis eaque. Non assumenda voluptatem qui rerum. Quia sed deserunt molestiae modi. Doloribus ex aliquid non qui et rerum ea. Dicta aut consequuntur aut sed consequatur culpa ut. Odit animi voluptatem velit temporibus nulla. Quae et eum nesciunt est maxime. Ratione officiis reprehenderit repellendus incidunt ea est. Eveniet in in delectus qui perspiciatis. Eius ratione ducimus corporis corrupti est quis voluptatibus. Blanditiis dolor fuga et officiis ut facere eum. Dolorem quidem excepturi non fugiat nulla. Dignissimos optio et ullam est ipsa recusandae laborum. Sint sed non numquam cumque tenetur. Est voluptatum minus odit itaque ut consectetur deleniti et. Laborum id beatae enim quis enim. Nobis perferendis necessitatibus dolores explicabo omnis ratione quo. Accusamus sequi accusamus aliquam ullam.', 120, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(226645, 'Tempore aliquid ipsa vero culpa minima vel sit.', 'Itaque eaque accusantium ipsam nobis. Quas in ducimus numquam eaque. Saepe tempora in repellendus tempore consequatur reiciendis ipsam. Et assumenda ex minus magnam necessitatibus. Itaque tempore assumenda pariatur odit et atque. Et qui temporibus in dolor. Vel hic sunt culpa iste. Modi dolores debitis labore magnam a fugiat ipsum ut. Reiciendis fuga quibusdam placeat blanditiis. Occaecati in non culpa tempora quis. Quis magnam velit tempore ab eum ex nesciunt tenetur. Distinctio iure rem corporis voluptate voluptas autem ducimus. Aut velit et quia est. Necessitatibus similique minima quo voluptas. Aut modi neque maiores est dolor sequi suscipit. Non et omnis voluptatem non deleniti quaerat. Ipsam autem delectus id ea. Saepe aut voluptatem asperiores qui quam aut. Distinctio adipisci natus enim omnis qui voluptatem alias natus. Sed nihil vitae ducimus libero. Cupiditate sunt sit aut voluptatem accusamus quaerat. Facere nobis iure temporibus consequatur omnis. In repudiandae sequi cumque magni quae sed. Quia in dolores est tenetur est placeat.', 125, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(226669, 'Voluptatem tenetur enim quaerat dolor deleniti tempore saepe.', 'Est quia voluptatem laudantium nesciunt assumenda. Officia vel molestiae ea vitae odio unde sapiente. Dicta aut placeat aut amet. Et sit sint quidem reiciendis. Eius explicabo reprehenderit soluta velit assumenda. Aut cupiditate fuga quam repudiandae placeat excepturi voluptas. Molestiae qui voluptatem quo quas odio sed quo. Soluta nulla inventore ratione occaecati facere molestiae. Soluta iste dolores aut sequi velit. Doloribus molestiae laboriosam rerum itaque adipisci blanditiis voluptatem. Corporis occaecati sed sapiente voluptatum ea atque. Voluptas ea sit ipsam suscipit quasi et sint. Mollitia tempore temporibus eveniet quam vero odit. Numquam qui rem dolores aliquam provident porro. Aut corrupti necessitatibus molestias repudiandae. Architecto corporis quibusdam et sed tempora dolorem exercitationem assumenda. Quas autem harum exercitationem fuga. Tempora beatae quis tempora autem. Laboriosam accusamus error non rerum totam et quia. Expedita ut nobis excepturi et amet velit voluptates. Ducimus et iure repellat inventore et nostrum dolores voluptatum. Perferendis doloremque ex perferendis assumenda. Debitis sint aut et provident magni animi possimus et. Necessitatibus et itaque similique error. Perspiciatis nihil dolorem velit corporis sed optio voluptatum.', 159, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(226770, 'Ut atque dolorem corporis.', 'Blanditiis sit quibusdam dolorem veniam at consectetur. Qui qui qui dolorum delectus. Consequuntur sapiente non debitis eum voluptatem. Dolorem ea quas sunt omnis. Qui esse repudiandae ut voluptatem non aut temporibus veniam. Sit facilis exercitationem sit nihil et dignissimos. Non et illum repellat a sit et omnis. Nihil itaque sed nemo optio officia repellat molestiae. Nam alias qui quis rerum. Exercitationem nihil provident sint sed. Hic corporis aut nemo molestias ad. Velit sunt quia repellat necessitatibus corporis iusto odio quis. Minus beatae voluptatem aut nihil facere similique consequatur. Eos molestias at eligendi illum nisi ut culpa. In qui rem nam enim est. Asperiores deleniti praesentium voluptatem voluptatem assumenda magnam magni. Fugit accusamus similique ut nesciunt quo ea. Harum sit qui harum numquam ipsam dignissimos ullam rerum. Rerum temporibus quo asperiores porro natus. Vitae ut ullam omnis est nihil. Consequatur optio tempora rerum temporibus. Aut harum molestiae ea corporis at assumenda. Quia fugiat et ipsa quae repellendus reiciendis nemo. Quisquam minus voluptatibus quia sint neque reiciendis quia aspernatur. Sed odio autem eos quidem eos provident dolore. Nulla sunt dolor voluptatum fuga autem. Consequatur qui quo et consequatur expedita impedit aliquam.', 50, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(229362, 'Ut ullam eius sunt minima aut.', 'Assumenda sit amet quia quidem velit quo. Tempora voluptas saepe facilis accusamus veniam vitae. Ipsum id quis delectus ab blanditiis qui sint. Minima nobis vel omnis unde harum. Quisquam dolorem tempore sequi facere tempore. Ex qui tempora quasi. Et ratione modi ipsum iusto et. Iusto beatae quis vel quia dolores. Magnam officiis est nihil voluptatem illum eius. Enim distinctio aliquid minus deserunt ut id. Perferendis est velit architecto consequatur distinctio voluptatem quod. Cum sed quo quia sunt et qui nostrum dignissimos. Magni beatae deserunt illum quod est. Exercitationem quod magnam velit dignissimos iste deleniti iste voluptates. Quod et tempora commodi deleniti est. Accusamus placeat illum facilis iure possimus. Necessitatibus sequi repellat fuga velit vitae. Ducimus est animi vero architecto enim aperiam. Soluta harum ducimus at nostrum ab. Sit vero et provident fuga error exercitationem quod. Doloribus quas culpa modi et qui eius. Assumenda culpa eum molestiae non unde. Vero quis nesciunt ut odio ratione ea alias modi. Rerum inventore id molestiae consequatur sit. Quaerat aut voluptate temporibus est perspiciatis ut. Voluptatem fuga sit in libero reprehenderit magni exercitationem. Nemo illum qui nihil ducimus.', 195, '2023-03-02 06:52:13', '2023-03-02 06:52:13', 1),
(232353, 'Dolorem sit quis consequuntur cumque cupiditate et quaerat.', 'Ut quia magni qui voluptatum qui temporibus. Ipsum quos qui ut quos temporibus. Est quidem amet tenetur. Autem a ut modi dolorem similique dolores. Laboriosam aut facere qui totam voluptatem rem sed ea. Quia qui libero a autem et modi illum. Placeat corrupti exercitationem soluta velit. Quis officiis sapiente quam beatae sunt. Sint quaerat harum blanditiis. Laboriosam aperiam vel vitae aliquam veritatis. Incidunt tenetur illo corrupti nam dolor nihil ex et. Voluptatem dolorem aliquid velit aspernatur quo qui natus. Sint ut atque omnis nesciunt. Minima aut similique sunt voluptas. Illo temporibus similique est illo iste rerum. Deleniti voluptas autem reiciendis qui distinctio occaecati. Aperiam minus qui autem architecto et.', 35, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(246881, 'Id nulla officia et minus.', 'Natus quam quo nesciunt. Voluptatem voluptas est nihil vero rem est quibusdam ut. Aut animi totam error sint itaque animi unde ipsum. Sit ex laudantium autem eveniet dignissimos. Est cupiditate molestias in totam. Perferendis est autem doloribus omnis sapiente veritatis sed. Minus quo enim sunt. Nostrum libero sunt quidem qui commodi qui. Reiciendis quo sunt officiis perferendis. Architecto error qui culpa dolorem soluta natus alias. Et et adipisci optio itaque. Voluptatem saepe recusandae enim animi est nemo sit. Ut itaque libero aperiam aliquam voluptatem quis repellat. Aspernatur nam voluptas accusantium facere vitae perspiciatis ab dolore. Sunt nesciunt excepturi qui omnis voluptates. Sit optio omnis dolor minima impedit tempore impedit. Iure incidunt possimus illum tenetur ut similique ex. Itaque ex maiores et et. Recusandae id ut molestiae. Optio mollitia voluptas aut officia sint. Consectetur veniam autem enim perferendis culpa aut dolor. Itaque voluptatum aliquid eum cum enim est. Cupiditate et incidunt at quasi quasi.', 131, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(256909, 'Sapiente est occaecati iure quia voluptatum.', 'Perferendis perferendis non sunt pariatur qui suscipit dolorem. Quasi sint non dolor omnis numquam omnis rerum accusantium. Deserunt neque qui odit itaque soluta provident iusto qui. Ducimus omnis fugit fuga rerum assumenda beatae itaque. Distinctio tempore sit enim sequi facere qui. Voluptas quisquam quae quis temporibus. Fuga accusantium minima eligendi. Voluptas perspiciatis sed eaque sit doloribus asperiores. Quo et voluptas labore sit. Debitis quaerat eligendi omnis aut. Sunt alias sint voluptatem sed animi ut commodi tempora. Deleniti possimus aut iure earum. Soluta facilis reprehenderit consequuntur suscipit. Et mollitia ea pariatur mollitia magnam. Vel libero sunt molestias voluptatum. Deserunt rerum voluptas nostrum commodi. Soluta veniam perferendis doloribus sit. Placeat voluptas aliquid a aut magnam vel nihil ut. Ea at nihil architecto similique dolorem aspernatur voluptatem. Autem cupiditate aperiam ratione laborum consectetur. Praesentium non dolorem ut odio sapiente commodi adipisci. Natus sunt deleniti quasi laudantium ab corporis.', 107, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(260960, 'Maiores voluptatibus aperiam eligendi totam dolores.', 'Iusto fuga enim et non qui eos nihil aspernatur. Corrupti maiores necessitatibus aut omnis laborum et. Eum qui dolorem et beatae ullam et. Excepturi quis et amet placeat quia. Perspiciatis vel explicabo ullam similique temporibus. Ducimus unde beatae aut adipisci nesciunt eos. Deleniti dolores voluptates similique quisquam pariatur dolores. Soluta rerum rerum et dolore. Dolore eaque nulla harum deserunt impedit. Dolores qui sequi eum tempore dolorum et. Quasi enim ut distinctio vel facere. Nostrum quis quam et reprehenderit. Voluptatem sunt vel iure adipisci non voluptas ratione. Suscipit tempore nihil natus iusto nam.', 192, '2023-03-02 06:52:13', '2023-03-02 06:52:13', 4),
(262259, 'Perferendis laudantium omnis quo quaerat repellat nemo dolor.', 'Laudantium numquam dignissimos culpa similique. Consequatur omnis temporibus dolorem quasi ut. Eveniet cupiditate reprehenderit velit vel. Qui autem repudiandae temporibus saepe occaecati et. Totam natus eum vero aut sunt eum doloribus. Nulla veniam deleniti vel vel quasi. Eligendi ex natus blanditiis eligendi cupiditate. Harum esse omnis asperiores corporis. Voluptas sunt neque pariatur consequuntur quidem rerum. Vel sint reprehenderit et vitae ut. Velit sit ab quia voluptatem. Dolor quis aut alias aspernatur eos odit in. Illo similique facilis velit maiores sed.', 171, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(276770, 'Quaerat soluta sed officiis in.', 'Rerum deserunt cupiditate repellat corrupti et omnis. Sed neque aliquam optio sunt. Est inventore pariatur rerum omnis quae ea numquam qui. Est architecto cum maiores doloribus consequatur. Minima ut quasi quia atque non et velit. Asperiores et vitae voluptate nisi explicabo vel quas perferendis. Tenetur velit iure fuga aliquam animi omnis. Quia similique et sunt est. Est quaerat tempora libero incidunt nisi reprehenderit sed. Et autem omnis numquam enim aliquam sapiente ratione. Sit culpa atque rem minima suscipit iste. Voluptas repellat odit debitis rerum quidem. Hic quis nostrum et voluptas quia. Neque qui qui aspernatur iusto. Similique repellendus magnam molestiae et voluptatem vero. Distinctio fugit a sed nam. Impedit optio qui quia dicta ab. Velit qui eligendi tempora ut animi voluptas architecto exercitationem. Voluptas sed cumque et aspernatur voluptatibus. Molestias eos blanditiis reiciendis aliquam. Laboriosam aut sed et sit aspernatur et est. Ut ea ut a quo et quas quia. Ut occaecati et id quaerat consequuntur ipsum voluptatem.', 100, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(281727, 'Suscipit sunt expedita repellendus quas laborum sit doloremque.', 'Temporibus labore voluptas omnis unde laboriosam provident. Deserunt qui soluta sunt optio corporis ut. Omnis a et eum numquam quas et sed soluta. Voluptate optio ipsum et qui ea cupiditate ipsa. Blanditiis soluta ex quibusdam est deleniti. Voluptate occaecati laboriosam ut dolorem placeat sapiente. Animi dolorem exercitationem ducimus eum et laboriosam iste. Enim voluptas rerum quia eos nihil in. Aliquam aut odio eveniet accusantium maiores omnis atque. Vitae sit sint ducimus reiciendis ipsa sequi enim. Voluptatibus omnis optio dolorem incidunt qui voluptatum repudiandae. Voluptas quae a qui ipsam. Nesciunt eius pariatur culpa consectetur voluptas rerum nesciunt et. Est ex voluptas et ab officia. Id est pariatur possimus dolorum repudiandae. Culpa beatae et omnis quaerat. Vel sint cupiditate quo sapiente sint doloribus. Quia veritatis et et aspernatur perspiciatis est. Soluta nostrum aliquam ut veritatis dolores sequi. Dicta animi voluptatem praesentium vitae consectetur non. Minus eos aut natus ut tenetur. Enim provident quaerat quia impedit. Consequatur voluptates totam temporibus omnis dicta quo nesciunt voluptatum. Aliquam aut tempora dolorem autem suscipit cum officiis. Laudantium accusantium quasi omnis et. Qui odio dolor temporibus. Odit aliquam aut commodi rerum iste aut. Labore non omnis magnam quam veritatis.', 36, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(290663, 'Sit et sed possimus ut.', 'Dolores qui asperiores minus. Assumenda omnis molestiae maxime aut non odit distinctio. Distinctio occaecati cumque expedita nisi ut. Sunt quo autem at velit nam. Qui consequatur ratione eum non culpa at. Perferendis voluptas fugiat commodi odio sit amet eligendi vero. Quae quis hic voluptates corrupti eveniet. Beatae eius numquam iure aut perferendis incidunt. Est sed enim rerum saepe. Laborum dignissimos eum rerum quis reiciendis. Illum enim voluptatem qui quia expedita iste ad et. Minima temporibus velit perspiciatis aut debitis autem. Consequuntur sint expedita quos. Quo ut id saepe ea sed in. Aperiam esse autem dignissimos omnis.', 161, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(298501, 'Sit sint modi quam recusandae explicabo.', 'Odit minus sit enim veniam accusantium consequuntur. Consectetur quae repudiandae doloribus aperiam cumque laudantium fuga officia. Officia voluptatibus aut dolorem quam. Consequatur vel possimus tenetur natus debitis quis quo. Ea molestiae dolorem hic. Nisi impedit aut saepe sed. Sit illo amet dolorem et repellat ullam natus. Qui omnis aut at et nostrum. Eum minus dolores vero hic magni ab at provident. Totam id corrupti repellat nobis facilis qui. Sunt ut natus temporibus labore praesentium consequuntur ut. Delectus et quisquam pariatur vel tenetur perferendis sapiente. Nihil veritatis temporibus alias facere. Et accusantium et voluptatem labore in laboriosam. Est numquam odit delectus. Sunt illum aut excepturi fuga et perspiciatis. Soluta fuga ipsa quas eum delectus eum necessitatibus. Repellendus veritatis aut nam. Incidunt exercitationem iste quaerat nihil dolores aut quam. Ut dolorem consectetur porro et qui. Esse suscipit in porro suscipit. Sequi voluptatem et sunt ex praesentium dolorem rerum. Ullam odit voluptas dolorem dicta.', 12, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(302345, 'Dolores perspiciatis iste dolorem.', 'Est veniam id repellat deleniti. Culpa alias quia voluptatem est et autem reprehenderit. Deserunt nemo harum et libero. Animi voluptatem vel suscipit quo nostrum. Ut repellat tempore qui. Veniam itaque quibusdam qui fuga eum architecto eos. Necessitatibus sit placeat sequi asperiores numquam assumenda. Ex facere id laboriosam molestias rerum. Nobis ducimus tenetur recusandae nemo. Optio aliquid quo ipsum ut accusamus. Molestiae cupiditate numquam id nihil dolorem aliquid nulla tenetur. Qui recusandae non at soluta officiis quam. Ducimus cum accusamus vitae distinctio aspernatur recusandae. Consequatur officiis non consequatur est ea delectus. Quam et sit eos nam aspernatur quia eaque. Quae optio dolor ducimus sed deserunt facere. Eum laboriosam expedita hic vitae. Incidunt sit dolorum et blanditiis nihil. Occaecati fugiat consequuntur voluptate aut in cum.', 167, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(303021, 'Nulla voluptatum voluptas aperiam.', 'Accusantium rem repellendus non iure. Ut nam aspernatur dolores repellendus iste. Repellat expedita in omnis. Ea excepturi ad qui recusandae tempore. Eum qui neque aut ex iure repellendus exercitationem. Ab tempora incidunt delectus quo sed voluptate in quam. Aut dolorem aut et voluptatem ea. Itaque reprehenderit ut officia delectus temporibus itaque. Voluptas sed consequatur reiciendis iusto. Ad ut quisquam voluptatem iure in. Aut quos facere officia non praesentium. Et aliquid qui laborum. Molestiae voluptate totam qui impedit. Neque possimus qui nihil minima neque ut unde quaerat. Nihil et eius qui quis perferendis ut. Quidem qui officiis magnam enim doloremque. Qui aspernatur et explicabo totam hic adipisci. Modi in sit excepturi blanditiis.', 200, '2023-03-02 06:52:13', '2023-03-02 06:52:13', 1),
(305554, 'Facilis sit ut suscipit nihil laudantium rerum eligendi.', 'Suscipit magnam laborum quidem sapiente. Dolorem accusantium ex consectetur quos. Est harum et explicabo aut corporis aut. Voluptates quod suscipit sit sit atque. Ut qui doloribus magnam sequi enim earum. Iste sint laboriosam natus facere veritatis. Quis esse sunt distinctio est qui. Porro quisquam adipisci numquam rerum voluptas. Quia et inventore sit eos nesciunt quo voluptatem. Quos incidunt adipisci dolorem dignissimos voluptatum quisquam. Ex ut officia rerum ut et quod reiciendis voluptatem. Qui quibusdam soluta quis quia. Enim qui sit sed eum modi sint. Quo in minima quasi tenetur est. Et eum nobis mollitia qui omnis tenetur. Rerum sit nihil voluptatum laborum blanditiis. Ducimus excepturi officiis ipsa cumque quia quos.', 145, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(309986, 'Nostrum labore quo quo.', 'Nulla quia quibusdam facilis aut occaecati odit. Repudiandae minima omnis odit et repellat. Nulla voluptas et omnis voluptates temporibus enim voluptas. Rerum autem qui qui ad pariatur accusamus. Aut ipsa voluptate tempora asperiores rerum ipsa. Eaque aperiam aspernatur nihil est sunt. Molestiae laudantium sapiente facilis ut dolores voluptatem consequatur consequatur. In similique aperiam enim consequuntur velit qui fugit. Sit sint consequatur pariatur provident praesentium maiores. Voluptate minus quia eius vero rem quia et atque. Omnis corrupti autem enim est. Commodi quia odio quod ea commodi assumenda aliquid vel. Quia qui repellendus aut nisi. Fugiat eum animi sapiente consequuntur. Doloribus exercitationem ipsum ab quis itaque sed dolores maxime. Non sunt dolorem porro quam voluptas facilis. Consequatur non voluptatem quis omnis illo fuga. Ducimus id et autem optio et. Vel repellendus sunt ea odio perspiciatis est possimus. Rerum voluptates aliquid cumque ut fugit voluptatum ab. Architecto in sit qui esse labore magni temporibus. Sint dolor perferendis tempore eveniet. Officia provident placeat quis nihil sit consequuntur. Rem mollitia dolorem non enim enim. Et voluptas voluptas ut nihil accusamus iste similique. Dignissimos doloremque magni et eius ut. Accusantium ipsam autem quia sit reprehenderit qui. Nihil officiis vitae ad esse sequi.', 139, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1);
INSERT INTO `forum_posts` (`id`, `title`, `body`, `user_id`, `created_at`, `updated_at`, `categorys_id`) VALUES
(310806, 'Aspernatur pariatur nihil optio cum quia expedita dolores provident.', 'Nihil quos quos provident cum deserunt quia ut eius. Rerum quo eius eaque magnam quo voluptatibus sint. Odio aut ut quis temporibus molestiae est laborum. Cum officia et eaque non non repudiandae hic dolorem. Enim perferendis repellat accusantium placeat in ex. Iure fugit blanditiis voluptas voluptatem itaque quis. Laboriosam nulla voluptatem dolore quam inventore earum ad. Accusamus quia excepturi voluptates accusamus doloribus corrupti eos sed. Quis et magni quia ea assumenda expedita. Sint aut rerum officia iste iusto. Itaque numquam natus eius amet. Aperiam quod est in et veritatis non rerum possimus. Error voluptate fugiat laboriosam nulla aspernatur. Quisquam doloribus quia sit facere est non sapiente molestias. Ut voluptas sapiente omnis harum ducimus. Ut cum id beatae sapiente. Natus deleniti nam et quia officiis rerum rerum temporibus. Labore necessitatibus voluptatem quis consequatur dolorem. Aut sunt ut officia numquam aspernatur assumenda hic. Nulla nemo impedit ea laborum. Quibusdam aut optio quibusdam porro accusantium et delectus saepe. Praesentium quia nam ad et repellat. Perspiciatis officia quisquam doloribus. Odio laborum inventore quod asperiores assumenda alias. Accusantium accusantium voluptates dolores et ea molestias. Sint ex minus deserunt et. Et debitis in corrupti officia voluptas corrupti. Asperiores harum assumenda dolore. Quia magnam cumque accusamus architecto nostrum.', 84, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(312421, 'Porro aut minus deleniti fugiat et quo.', 'Quia inventore sint labore nobis et non sunt. Eaque tempora aut est doloremque ratione. Optio asperiores quas optio sunt. Ullam culpa dolorum cum labore omnis tempore cum. Velit incidunt assumenda est nostrum. Maxime consequatur voluptates sequi voluptas veritatis nobis ipsum. Perferendis quisquam maiores qui ducimus sed omnis. Quisquam voluptatem qui numquam dolores. Unde minus aperiam placeat eveniet ullam iusto ut. Velit unde nostrum beatae perspiciatis est. Et voluptas assumenda neque necessitatibus dolorem corporis. Sed excepturi et sunt quos consequatur modi. Voluptatibus voluptas officiis pariatur excepturi qui a. Et quaerat est ex temporibus nemo est. Voluptatem rem adipisci dolorem adipisci cumque ut aut. Ullam quia cupiditate sint suscipit eos. Et aliquam autem fugit laudantium quo ut cupiditate. Rerum voluptas repudiandae sapiente molestiae perspiciatis corrupti aliquid. Deleniti nulla et optio atque minus porro et. Blanditiis ullam sequi ducimus necessitatibus necessitatibus quos. Repellendus iusto quibusdam sit non dolorem ut ducimus totam. Vero natus vitae libero veniam.', 61, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(312427, 'Error consequatur laborum sunt rem adipisci ullam.', 'Maiores quia harum sint voluptas facere et esse molestiae. Natus maiores voluptatem architecto blanditiis. Incidunt rerum placeat cumque voluptate. Repudiandae sit rerum et qui voluptatum et quidem sit. Repellat est voluptatum quia quod maiores et. Eos qui quibusdam sequi aut ea. Ea temporibus adipisci deserunt neque. Dignissimos dolore adipisci sed modi asperiores. Minus assumenda eligendi fugit aut. Sunt quis dolor magnam sed alias dolorum ex. Dolorem exercitationem ut dolorum. Voluptatem illum nihil aut nulla voluptate similique vitae pariatur. Ut dolorum asperiores non. Autem asperiores voluptatem quod culpa ullam officia omnis voluptate. Consequatur nisi ut laudantium quod. Ratione consequuntur nulla molestias blanditiis accusantium autem similique. Dignissimos ab aut enim aut iusto cumque. Dolorem ipsa fugit nam in nobis ullam hic. Hic asperiores dolor a ratione soluta. Aliquid cum commodi et id commodi mollitia.', 109, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(315733, 'Excepturi magnam deserunt odit sit.', 'Non et est dolor deleniti. Hic ut laudantium non doloremque voluptas et. Enim voluptatem excepturi nesciunt consequatur ducimus. Nisi expedita expedita accusamus. Velit minima perferendis atque in ratione accusantium deserunt necessitatibus. Sit aut quo accusantium ut molestiae commodi neque. Iusto nam modi odio cupiditate et et. Ipsa eveniet quam quis architecto dolores. Quam porro occaecati a nesciunt quis. Illo sit pariatur soluta eos et distinctio molestias. Magni nihil et ut molestiae dolorem repudiandae est. Quod dolore sequi tenetur sed. Rerum recusandae commodi cum consequatur sapiente ut magni sunt. Ipsum ad autem ducimus sit voluptatibus blanditiis. Aut nemo repudiandae ipsam maxime saepe cupiditate consequatur. Placeat laborum sapiente aliquid similique.', 97, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(316047, 'Ut sint minima ut dolorem sapiente.', 'Doloribus consectetur cupiditate rerum voluptas. Aut officiis rem nihil neque consectetur ut. At adipisci laborum at atque. Sunt voluptas et ab. Nobis iste eligendi quo iure quo et consequatur. Tenetur voluptatum et quia saepe dolores dolores dolor. Amet magni reiciendis ut aut. Soluta sint praesentium consequatur vel temporibus molestias est qui. Iusto odio fugit pariatur in at nostrum assumenda. Recusandae dolores aut ut aliquid. Et voluptatum sunt magnam fugiat. Accusamus blanditiis non laborum similique aut. Qui ut maxime sit odio quod perferendis. Non ad perferendis enim doloribus saepe. Illo ullam repellendus qui animi iure explicabo sapiente. Laborum nam qui in asperiores accusantium magnam. Aperiam in aut ratione culpa molestiae ullam fugiat. Officiis occaecati et rerum quaerat nam optio itaque. Accusamus molestiae et aperiam adipisci quos voluptatem.', 38, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(324590, 'Commodi voluptates ut eveniet dolores libero.', 'Earum voluptates facere ratione iusto. Aut illum eum fugiat numquam. Sed quisquam assumenda aut. Neque id iste dicta ipsum laborum. Vel aut deserunt recusandae quidem praesentium quia. Omnis dolorum fugit est ab quod minus temporibus. Et in omnis nisi natus aut. Excepturi qui adipisci fugit sint illo voluptas. Enim itaque est voluptatibus rerum optio atque. Et ut quasi et quos et. Esse aliquid a harum. Distinctio quae quos impedit aut deserunt qui. Illum nisi natus consectetur qui corporis dolore autem atque. Qui assumenda neque neque illo necessitatibus. Consequatur non rerum velit esse. Minima dignissimos ut excepturi quasi fuga delectus soluta quia. Dolor nemo qui aspernatur aut minima a perferendis qui. Ut placeat ipsam fugit tempore nulla tempora. Dolor vel nihil labore quasi est soluta. Saepe voluptatibus qui voluptate perferendis non recusandae quis. Recusandae voluptatum sed iure inventore. Debitis in earum itaque. Temporibus voluptas quibusdam est. Assumenda et recusandae quia consequatur nisi occaecati animi. Facere debitis unde iure nihil sint beatae debitis rerum. Aliquam sed laboriosam iure odio quae qui.', 124, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(326104, 'Voluptas et et omnis illo et hic ut aut.', 'Voluptatum vero omnis quidem laborum sed occaecati magni. Est cum provident possimus cum quia. Qui nulla deleniti delectus voluptatem nostrum aspernatur distinctio. Dolor et incidunt dolor est quisquam quo. Exercitationem quia dignissimos accusantium deserunt ipsum rerum. Sit non dignissimos sunt facilis. Consectetur commodi nemo nihil numquam sed nobis doloremque rerum. Hic harum autem qui voluptatem porro ratione. Laudantium excepturi illo ea repellendus. Officia tenetur doloribus dolores quos voluptas incidunt. Qui et et ut molestiae nisi voluptatem consequatur porro. Ut eius sed aut similique at quo dolor. Consectetur ut in corporis debitis. Assumenda adipisci porro qui voluptas.', 196, '2023-03-02 06:52:13', '2023-03-02 06:52:13', 2),
(331121, 'Rem perspiciatis magnam ab dolores eveniet.', 'Quasi deleniti sed porro enim odio est. Laborum maiores sunt soluta explicabo fuga voluptatem voluptate. Beatae unde illo vero. Iste consequatur omnis quaerat ratione qui et molestias. Sint sed voluptatum modi sed nam voluptatem. Dolor omnis nostrum dolorem dolor eius vel. Voluptatum eveniet nisi incidunt quidem quia dolorem. Libero corrupti omnis magnam placeat et. Unde ea quis qui nisi et. Voluptas est sed dolore perferendis sit quod. Doloremque consectetur sed quaerat ut. Earum itaque iste aut iste suscipit sint autem ex. Omnis est inventore dolor ducimus vel ut voluptatem nulla.', 73, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(335688, 'Voluptas doloribus iure repellendus quis repudiandae ab soluta.', 'Numquam molestiae saepe ipsam. Culpa assumenda et quasi est modi cumque. Nobis delectus sit neque id. Aliquid consectetur odio corporis aut. Dolores vero molestiae repellendus nesciunt debitis. Sit cum consequuntur omnis ipsum temporibus ipsam consectetur. Aut odit rerum ipsa molestiae. Omnis eum molestias tempora totam veniam. Voluptas sed qui maxime repudiandae. Nam magnam illum dolores veniam quis unde nam. Commodi veniam sapiente numquam qui. Possimus delectus quos sed in ut. Iste tempora numquam exercitationem repudiandae. Aut earum similique beatae pariatur et est. Praesentium rerum laboriosam dolores excepturi officiis. Est maxime in ducimus.', 25, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(343231, 'Nostrum omnis velit nihil repellendus.', 'Asperiores voluptatem facilis libero error est. Tempora neque accusantium nobis sapiente. Sint a et quaerat aut enim. Ut maxime consequuntur odit. Reiciendis voluptates facilis natus. Excepturi aliquam voluptas minus totam. Itaque eaque pariatur earum cum quaerat nihil quasi. Earum dolor recusandae distinctio. Voluptatibus et soluta eligendi culpa molestiae. Quaerat totam culpa iure sed vitae ex et. Fuga placeat iure corrupti qui minus quia. Accusamus qui quasi distinctio eveniet tempora consequatur. Ducimus magnam ut quae ut. Aliquam molestiae et quaerat possimus tenetur. Itaque minima et sit. Veniam aliquam omnis soluta ex quos. Eius aspernatur et qui culpa suscipit ratione unde. Repellat earum minus ea doloremque neque. Et rerum non sunt qui tenetur delectus tempore. Illo vero et eaque officia consequatur. Atque dolor aliquid tempora laborum sed. Quae cumque architecto cumque velit qui.', 118, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(348071, 'Similique quos libero tenetur expedita.', 'Rerum rem iure veniam. Sint quos ipsam distinctio qui nihil animi autem corporis. Quasi non veniam explicabo doloremque. Numquam at aperiam eum molestiae et veritatis. Rem vitae aut dolor vel autem consectetur sapiente. Illo repellat accusamus et quia maxime distinctio et. Sit et saepe consequuntur dignissimos dolores blanditiis dolore. Aperiam quis quasi nesciunt magni adipisci. Et dolore dolorum voluptas quis in doloremque omnis. Quia autem et reprehenderit quasi et vero. Similique dolor earum et suscipit at qui. Inventore non rerum rerum debitis expedita. Velit nemo error minima aliquam voluptatum.', 42, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(349171, 'Mollitia harum explicabo et est.', 'Omnis autem soluta vitae. Optio tempore quisquam et soluta sit aut et facilis. Autem accusantium quis quos dolorem ut. Optio unde numquam similique neque impedit inventore qui. Rerum qui dolorem illum perferendis quaerat voluptatibus magnam. Distinctio cupiditate dolorem maxime deserunt fugiat beatae velit est. Consequatur non est doloremque rerum culpa ratione officiis quaerat. Repudiandae dolorem deserunt ratione magnam beatae aliquid voluptatem. Dicta provident rerum dignissimos voluptatibus aspernatur illum. Ipsa et quasi quaerat et reprehenderit dolor. Sapiente veniam illum veritatis provident neque vel. Rem ullam qui cupiditate mollitia ea saepe nihil. Quo aliquam ut totam dolorem non qui illum. Sunt laudantium ullam perspiciatis sapiente.', 99, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(352174, 'Ut nobis voluptatibus vero iure quas non.', 'Aut facere mollitia omnis amet. Fugiat quaerat voluptas aut fugiat velit. Saepe corporis consequatur aut deleniti quod voluptas omnis eaque. Placeat est culpa praesentium. Aliquid qui quia et distinctio. Ut quia saepe alias occaecati et. Sint eos voluptates quod non cupiditate necessitatibus voluptatem quos. Et ut repellendus perferendis non recusandae iure. Quas fuga et reprehenderit eligendi nihil ut eaque. Maiores minus harum rerum et. Ut occaecati molestiae ea tenetur id dolorem. Tempora perspiciatis sit similique consequatur eum dolor eum. Voluptatem sint non eos non cupiditate. Ducimus quo est dolorem atque minus voluptatem distinctio magnam. Ut laborum qui velit ut. Eligendi delectus tenetur libero ut. Rem in ut nobis repudiandae vitae.', 115, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(355903, 'Incidunt harum voluptas aut aut tenetur autem.', 'Provident magnam sequi veniam est ipsum non. Harum aut delectus fugit explicabo perspiciatis repudiandae. Pariatur repellat illo tenetur non dignissimos inventore. Et ea dolores voluptas aliquam quae eius rerum. Voluptatem suscipit dolorem cumque architecto et omnis. Quia voluptas magni ullam at dolorem incidunt sed. Modi iusto non fugit. Eos nihil nemo eos sunt asperiores ipsum unde temporibus. Soluta aliquam rerum ut. Voluptatem unde est perspiciatis ipsa et nostrum odio. Rerum voluptas autem vel qui. Ratione est quis ad rerum iusto nemo et. Ut et est autem ullam tenetur qui. A sint laboriosam ut ut. Sit architecto officiis ad itaque optio ipsa. Molestias omnis aspernatur magnam beatae. Quod ducimus aut et. Laboriosam natus perspiciatis ullam aut eum nam sed. Quasi eveniet et modi distinctio qui. Totam sed iusto accusantium et provident. Consequatur odio ipsa veritatis fuga laboriosam rerum. Saepe tempore tempora est laborum occaecati. Sunt reiciendis iusto odio repellat fuga odit. Esse voluptas expedita quia vel dolorum qui eius. Sapiente dignissimos consequatur quam voluptatem et sint est.', 178, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(371607, 'Voluptatem voluptatem magnam vitae nostrum.', 'Deleniti sit facere eius. Tempore et officia voluptates molestiae eum numquam. Omnis iusto dolores et quidem at eligendi voluptatem commodi. Culpa dolorem est commodi odit quo minima. Et quo recusandae rerum. Commodi et ipsam quidem veritatis. Illo incidunt et fuga. Et error magnam numquam quibusdam suscipit. Sapiente molestias ducimus rerum sunt. Numquam corporis aut vel. Voluptatem sapiente veritatis ut nisi. Aliquam cum esse dolorem similique sequi rerum. Consequatur omnis explicabo deserunt optio dolorem molestias. Neque sint maxime cumque unde. Temporibus ut quibusdam dolores atque eaque. Doloribus blanditiis quae minus consequuntur. Excepturi rerum qui officia. Molestiae omnis velit sed non quos. Eligendi repellendus fugit mollitia voluptatibus. Deserunt quia quo sit rerum aut est. Et voluptates eos esse voluptas explicabo consequuntur optio.', 62, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(374635, 'Quaerat nam magnam tempora at deleniti non eos reprehenderit.', 'Quaerat corporis ad rem vero itaque sint consequatur. Voluptatem dolor qui sequi. Perferendis dignissimos cumque iure et est consectetur deleniti magnam. Alias voluptatem mollitia sed in at accusantium. Perferendis odit neque sint. Ut ut consequatur adipisci totam et sint amet. Quasi amet distinctio architecto. Sequi molestias officiis perspiciatis iusto. Consequuntur possimus laudantium nemo consequatur molestiae modi. Et et vitae voluptatum quidem. Accusamus inventore excepturi consectetur non id eos. Sunt et nihil officiis omnis cum nemo. Voluptatum facere consectetur dignissimos. Rem et voluptatem ullam mollitia qui sint ratione. Vel distinctio vitae et debitis. Ut tenetur commodi sit. Molestiae ullam quis omnis voluptatem iure et perspiciatis. Sequi reiciendis cumque sit architecto sint non et. Ut autem at error est cumque. Soluta ut assumenda fuga ipsum. Cupiditate explicabo sunt numquam molestiae sed nesciunt quidem autem. Adipisci adipisci libero nihil accusantium aspernatur vel.', 166, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(376980, 'Dolores suscipit vel molestias quasi sed.', 'Fugiat est officiis et quo debitis. Occaecati incidunt nam quia dolorem vero sunt distinctio. Rerum aut sint officiis aperiam inventore id nostrum. Itaque quod assumenda molestiae quis. Et tempore quis harum nesciunt natus ratione facere accusantium. Quas distinctio dolores cumque qui nam nam et. Blanditiis voluptas repudiandae repudiandae qui. Ipsam dolorum nisi inventore voluptatem sunt placeat. At dignissimos sunt non repudiandae nemo. Consequatur et recusandae aspernatur et laboriosam qui dicta voluptatum. Enim atque tenetur enim architecto et. Quia expedita quis inventore numquam magni aspernatur accusamus ullam. Tempore consectetur sapiente placeat similique animi et nihil. Voluptas enim natus tempora architecto. Blanditiis magni eligendi magni similique. Quo sed deleniti ipsa aspernatur occaecati adipisci et. Maxime nemo rem sed quaerat incidunt eos ipsa. Ducimus quisquam doloremque sit aut dolores similique dolorum. Aut qui voluptas aliquid doloremque sunt in necessitatibus occaecati. Soluta et dolorum deleniti corporis natus aut consequuntur.', 27, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(378012, 'Exercitationem doloribus adipisci laudantium inventore eveniet iusto.', 'Quae consequatur deleniti placeat ipsam. Excepturi id esse blanditiis optio. Assumenda enim impedit quisquam dolorum dolorem. Eveniet velit fuga minima aliquid rerum blanditiis. Eveniet voluptatibus necessitatibus consectetur tempora perspiciatis molestiae eveniet. Officiis facere et repudiandae asperiores dignissimos. Et dolores cumque omnis fugiat nostrum aut sunt. Tenetur est sed facere. Facilis explicabo natus magni quam ut. Ut culpa laboriosam officiis reiciendis est sint nihil. Enim tempora adipisci quia nemo. Molestiae et modi blanditiis. Saepe eum accusamus fugit itaque deleniti. Quae autem sunt quidem molestiae veritatis corrupti et. Est quibusdam sit culpa ut quasi similique rerum ut. Molestiae qui harum quibusdam quas qui quam. Maxime ipsam accusamus id aspernatur est eos doloribus. Corrupti voluptatem fuga dignissimos ea. Soluta amet quia hic. Omnis blanditiis officiis commodi. Minima iste ea itaque ducimus tempora quia. At animi aliquid asperiores est. Dicta et vero doloremque sit. Et commodi in ipsa tempore distinctio laudantium. Vel aut officia maxime similique ex nihil. Ipsum qui temporibus animi.', 194, '2023-03-02 06:52:13', '2023-03-02 06:52:13', 3),
(392515, 'In ut voluptatem atque aliquid.', 'Molestiae molestias aut suscipit laudantium mollitia. Sit rerum repudiandae sit deleniti. Et vel quod non cumque est. Fugit officiis non id ut molestias consequuntur. Minus sed et ratione. Aut quidem consequuntur impedit laudantium vitae voluptate. Ut autem nobis voluptas sunt et saepe. Ad facere ipsa in voluptatibus aut. Facere dicta odio atque cumque temporibus qui. Officia ipsam impedit dolorem molestias voluptatibus qui. Et maxime facilis animi harum. Cum in omnis aut. Laborum aspernatur nam dolore aut. Explicabo ad quae quae hic molestiae. Omnis id perferendis recusandae dignissimos consequuntur. Aut est pariatur voluptas exercitationem perspiciatis necessitatibus maiores ipsa. Sit eos incidunt laudantium praesentium suscipit porro eius omnis. Ad velit enim amet explicabo inventore quo voluptas. Ea ut quidem officia laboriosam. Magnam corporis omnis repudiandae magni. Et natus ipsum modi corrupti quis. Sint illum eveniet aut reprehenderit velit atque minus. Quia eum natus cupiditate quibusdam.', 3, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(394336, 'Eos dolore sunt est alias.', 'Et et omnis labore quis. Dolorem qui sequi non iusto beatae aperiam. Nobis minus et ut non est. Laudantium explicabo quis eum molestiae inventore eligendi. Nobis enim consequatur atque repudiandae praesentium ut velit. Nihil beatae error saepe blanditiis minus rem nulla. Natus id quibusdam nihil enim. Officiis quam numquam corporis. Nulla ad doloribus asperiores. Cupiditate beatae est laboriosam sed sint quos. Et debitis eaque ut quas aperiam suscipit quaerat. Voluptatum consequatur omnis magni quae quia optio consequatur. Facilis ut delectus et.', 54, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(404523, 'Qui necessitatibus molestias commodi quaerat.', 'Quos sequi est nihil praesentium sed eligendi aperiam. Labore dolorum similique id odit exercitationem consequuntur. Sint labore repellendus consectetur dicta explicabo fugiat. Quis ut illum in vero sed possimus voluptatem. Itaque animi tenetur eos omnis eveniet quo. Qui a nobis optio. Dolor debitis natus excepturi quia mollitia temporibus quidem. Et odit perferendis ea quidem occaecati. Non dolore consectetur velit vero magni. Ut consectetur ut maiores ipsa. Ut eveniet aspernatur asperiores ex nihil doloribus. Occaecati vel quasi nemo corrupti animi similique non minus. Provident tempore inventore non aut. Cumque dicta vitae quia est. Amet cum a et porro sunt aut laudantium. Commodi ut sequi ea harum consequuntur maxime. Earum est praesentium vel nihil voluptas. Esse sit labore dolorem ad. Omnis aut facere totam voluptatum nihil ut occaecati ex. Beatae eaque blanditiis ad dicta vitae.', 51, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(417831, 'Harum repellat suscipit est dolorum.', 'Fuga est consequuntur aut quos eligendi soluta. Voluptate qui est alias. Dicta corrupti vel omnis dicta dolores ducimus. Officiis voluptatibus voluptatem expedita provident sed sequi. Omnis earum ipsa deserunt. Nam autem fugiat omnis quod. Et distinctio non et perspiciatis reprehenderit. Animi corporis nobis magnam in dolor et doloremque. Minima consectetur adipisci officia cupiditate. Omnis debitis ab tempore. Amet quos incidunt aliquam atque dolorem harum sunt. Voluptate iste quis ut vel nihil. Ea numquam sed et blanditiis. Quibusdam dicta corrupti quia aliquid. Officia tempora occaecati voluptas cumque voluptatibus. Vel sint aliquam accusantium dicta in iste corporis quisquam.', 168, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(424143, 'Est corporis illo consequatur distinctio fuga.', 'Dolores cumque non porro dolorem et hic aliquam. Et quisquam aliquam sed voluptatibus magnam non beatae. Ut impedit necessitatibus iste quo quidem quas sequi. Nulla repellat iusto qui architecto non aut velit. Facilis quis nesciunt sit officia hic rem. Voluptate quisquam quam et voluptate vel aspernatur. Veniam nihil at sed est adipisci voluptatem et. Cumque animi porro quas qui est consequatur. Aperiam at omnis consequatur illo perferendis illo eligendi. Cum repudiandae illum et. Nostrum quas quidem officia est expedita autem et expedita. Consequuntur enim repellendus et omnis vel. Similique sit consectetur eum rerum. Nesciunt laborum fugit fuga aut ad quia. Et et id earum voluptatem voluptatibus non. Nisi laudantium non ut asperiores.', 24, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(427306, 'Porro quisquam adipisci sed perspiciatis.', 'Iure quod eos harum. Blanditiis inventore impedit nobis sapiente. Expedita numquam quasi qui distinctio. Voluptatem ipsam iusto consequatur et qui. Autem eaque laudantium et soluta dicta laborum voluptatibus. Beatae odio qui nostrum. Ut voluptates rem rerum culpa ad. Deserunt aut nemo et occaecati facere quod. In dolorem doloremque porro qui corporis. Saepe quibusdam corporis delectus quaerat et. Omnis quos molestias beatae nam. Molestias non distinctio facere nisi. Sed dolores incidunt consectetur magnam qui vitae. Possimus quia alias est aut alias rem dignissimos. Et voluptas dignissimos quia temporibus. Totam nulla ullam architecto corporis velit. Tenetur atque dolore laboriosam reiciendis. Ipsa quos voluptate perspiciatis qui. Natus tempore et provident molestiae consequuntur qui. Illum delectus assumenda unde repellat. Non non eum nulla optio illo aut earum. Qui recusandae rem aut quia omnis enim dicta dolores.', 101, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(428737, 'Debitis quia rerum et cupiditate enim et ipsa ullam.', 'Ut nihil dolor consequuntur veritatis. Velit vitae aperiam voluptatem. Et et debitis est rerum rem. Repellendus libero modi omnis voluptas ut nisi. Accusantium optio quia sed eveniet hic sequi quasi. Ullam rerum itaque quo sit enim ex tempore. Autem voluptate consequuntur sunt id sed corporis et corrupti. Sunt sint ullam voluptates facere. Nobis vero ea in est. Deserunt nisi dicta earum qui molestias et et. Ut nostrum saepe ut nulla vel. Occaecati quasi mollitia similique laboriosam nulla quia eos. Aut officia dolor fugiat nesciunt quisquam est. Sunt temporibus animi harum aliquam dignissimos accusamus.', 95, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(434136, 'Laboriosam numquam quo ab velit sint explicabo vitae dolor.', 'A architecto non itaque dicta ipsa voluptatem et. Repellendus facere magni cumque accusantium quidem maxime labore. Asperiores eum dolore expedita omnis animi incidunt. Saepe vitae nostrum laboriosam qui et quis. Deserunt nesciunt repellat consequatur exercitationem dolores. Et delectus accusamus placeat nobis praesentium. Doloribus culpa ut omnis tenetur quaerat. Iure odit quia et sed. Dolor harum dolor at reprehenderit et ipsa. Vel iure dolorem ducimus incidunt. Sed non autem autem provident rerum. Ab mollitia consectetur qui autem ut velit impedit. Provident ut sint asperiores. Beatae reprehenderit fuga voluptatem. Ut praesentium nobis atque est debitis et. Saepe rerum doloremque velit eius id eveniet eveniet. Qui est aliquid iure repudiandae doloremque molestiae reprehenderit qui. Itaque alias hic commodi quo. Nam magni ea cumque alias veritatis. Tenetur sed velit rem cumque officia ut. Quia quisquam repellat est assumenda id unde magnam voluptatem. Blanditiis nemo error impedit doloribus expedita qui. Et voluptatem accusamus et laboriosam voluptas voluptas aut. Nobis quia provident consectetur deserunt. Molestias molestiae perspiciatis deserunt asperiores eos aliquam neque quod.', 176, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(439075, 'Quam aut aut dicta ullam ratione recusandae perspiciatis.', 'Omnis natus iste molestiae neque explicabo neque. Autem a cum inventore. Est ipsam atque ipsum fuga dolorem non animi odio. Provident ut laboriosam aut sit est est voluptate nesciunt. Saepe ea autem sed ab mollitia est. Necessitatibus labore non explicabo velit quis voluptates. Laborum ex molestias esse aut placeat. Temporibus sapiente quibusdam beatae repudiandae dignissimos. Voluptas nam voluptatem sequi. Hic ab aut aut cumque ut tenetur molestiae. Magni voluptas atque enim. Quos nobis aliquam reprehenderit modi. Fugit magnam ipsum voluptates officiis et ea. Ea vel et aspernatur in rerum. Est voluptates id quia nihil tempora provident. Incidunt amet dolorem quisquam ut. Numquam unde sunt dignissimos architecto ipsam. Sint cumque rerum unde et. Maiores ut inventore similique earum. Ab pariatur occaecati exercitationem repudiandae accusamus ad doloribus.', 187, '2023-03-02 06:52:13', '2023-03-02 06:52:13', 2),
(443990, 'Odit quasi laborum ea enim id.', 'Harum velit ducimus architecto dolore. Optio voluptatem asperiores voluptas velit nostrum assumenda. Libero ut dolorum veniam aut debitis ex deleniti. Sed ullam voluptas qui eum et. Deleniti inventore et et odio ea esse. Est aliquam sequi ea itaque ut. Corporis et sunt nobis aut dolor quis. Et repellat repudiandae aspernatur at sint. Cupiditate velit mollitia excepturi accusantium voluptatem voluptatem quis ducimus. Ut et fuga aliquam animi ut. Velit facere qui adipisci enim sunt. Voluptatem rerum praesentium earum non aspernatur asperiores. Voluptatem doloremque dolores perspiciatis sunt quos qui non et. Voluptatem aspernatur aut ut. Qui qui perferendis iste aut quis quidem. Magni quo modi voluptatem autem expedita. Occaecati nostrum ut enim omnis quidem aperiam. Nesciunt animi minus accusantium id molestiae impedit tenetur. Vitae labore minima incidunt et atque velit. Perspiciatis explicabo delectus accusantium eum soluta nihil. Tempore perferendis est rem nemo nobis. Quaerat nesciunt nisi consequatur. Ipsam enim rem enim neque accusamus dolorem blanditiis sint.', 92, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(445171, 'Nulla quod ab vero repellendus fugiat eveniet.', 'Nesciunt saepe aperiam ratione ipsum maxime. Sequi ut consequatur voluptatum ut eveniet saepe veritatis dolor. At sed aut voluptatem tempora vitae doloremque eligendi. Impedit voluptatibus amet et ducimus. Quo fugiat cupiditate architecto laboriosam accusantium sit. Voluptate quas enim sed laborum. Dolorum amet ut suscipit consequuntur rerum provident et. Et consequuntur qui quidem rerum voluptas dolorem et. In consequatur culpa reprehenderit est. Consequuntur quia facilis et eius perferendis placeat. Dolorem exercitationem debitis quo ad. Provident et et expedita sit. Perferendis non consectetur non libero ut accusamus maxime. Voluptas omnis est dolore placeat totam. Et deleniti reprehenderit ut debitis et. Veniam ut occaecati deleniti voluptas. Voluptatibus aut harum quia autem molestiae ut iusto. Placeat sint eaque quo dolorem qui quisquam qui ab. Fugit sit natus accusantium sint exercitationem pariatur reprehenderit. Rerum corporis accusamus cum numquam voluptatem minima. Quasi repudiandae voluptate quod harum rerum id adipisci. Impedit molestiae nisi veritatis eos consectetur officiis. Et et repellat nobis molestiae dolores. Non quaerat itaque nihil cum. Non pariatur debitis quidem delectus. Tempore sequi sequi soluta molestias velit aut. Dicta quia in maxime odit. Ducimus veniam libero ipsa.', 162, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(450995, 'Laborum reprehenderit dolores minus.', 'Velit enim voluptas facilis vel qui ipsum. Quisquam voluptatibus illo quisquam odio impedit fugiat. Commodi voluptatem quidem fuga reprehenderit adipisci. Nam voluptatem dolor fuga. Distinctio ipsum quibusdam nemo delectus totam et. Tempora maiores autem ad similique aut ut quam. Illo et qui odit iure non. Sunt eveniet rerum cupiditate ut qui. Ea minima placeat in repellendus est. Reiciendis molestiae et quia. Ducimus quos ab sed veritatis eum assumenda. Consequatur officia temporibus omnis sit ratione aut deserunt. Iusto veniam incidunt reiciendis iste ad. Ipsum ipsum magni libero aut non velit in optio. Et ab tempore ut qui nihil.', 17, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(454670, 'Eaque cupiditate nobis ipsa asperiores.', 'Saepe sed id non minima. Nisi et quos aut architecto rerum saepe repellat omnis. Perferendis accusantium id quasi ut aut voluptas totam. Ad omnis in aut ab nisi. Tenetur sint aspernatur ratione quisquam aut quia. Ut iure quos necessitatibus corporis. Veniam quidem odio rerum temporibus. Esse quod velit et sequi distinctio libero laboriosam. Labore laudantium aliquam sequi qui. Corporis consectetur impedit nam ipsum distinctio illo qui. Dolores vero fuga vero officiis commodi autem iure. Nam aperiam dolores magni qui quidem totam. Est suscipit maiores id neque id natus architecto. Ducimus ipsam minima velit a aspernatur nulla. At consequatur ducimus ut at nobis aut.', 87, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(458161, 'Culpa dignissimos assumenda sint nemo cum eum ullam.', 'Ipsam enim et similique ut modi vero facere iure. Iusto eligendi quasi aliquam necessitatibus rerum facilis totam. Nam omnis odio suscipit ipsa nesciunt et. Odio voluptatem velit et perferendis. Dolores sunt ut laborum odit. Enim dolorem repellat voluptas quis facere qui distinctio. Nesciunt esse ad dolores molestiae optio vero. Sit aut mollitia repellat velit. Aliquid ut dolorem et modi accusantium. Animi aut rem est et. Laboriosam similique dicta laboriosam harum facere rerum quia. Error qui voluptatem rem totam nemo neque qui. Sed quidem voluptatem necessitatibus et. Quisquam quas dolores consequatur. Cumque necessitatibus quod praesentium architecto perferendis totam. Ea optio fugiat vel autem molestias et corporis. Eligendi id quos quasi. Dolores maiores sapiente dolores aut eligendi. Corrupti laboriosam at quos laborum dolores qui. Numquam blanditiis corporis tempore quae enim. Temporibus expedita eum non vitae deleniti nostrum et et. Dolores temporibus occaecati nulla modi. Tempore tenetur doloremque necessitatibus labore ipsam accusantium et. Dignissimos ut tenetur molestias aliquam qui itaque ullam. Molestias quis veritatis repellat ratione odit recusandae. Exercitationem veniam est est fugit qui qui sequi laborum. Mollitia aperiam corrupti esse ut.', 137, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(460315, 'Distinctio expedita voluptate eius blanditiis qui.', 'Sit non aut fugit. Explicabo architecto dolorum non eaque aut consequatur consequatur. Ut voluptatem in voluptas. Sit dolor recusandae voluptas nulla sint sed voluptas. Id ea nemo qui quia qui tempore dolorem suscipit. Delectus soluta esse vel molestiae eligendi. Eveniet reiciendis placeat ducimus qui laborum est. Et et accusantium architecto velit velit hic quis. Commodi et nihil quam et. Est rem laborum doloremque sapiente. Et soluta minima veniam ut. Quis qui est enim. Hic tempora in aut. Sequi error ut eos quo ut dolores quis. Illum sit error illo. Possimus quae eveniet sit nobis magnam. Blanditiis sequi quae aliquam maiores voluptas. Numquam sit alias consectetur animi id consectetur. Enim inventore id id repellendus ducimus quisquam. Rerum libero illum ut distinctio. Temporibus sunt corporis unde vitae ut. Quasi ut qui consectetur facere suscipit.', 160, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(464353, 'Exercitationem dolore dolore qui nihil cumque facere eius.', 'Repellendus eos esse voluptate non voluptates quos. Dolore similique quis maxime distinctio. Amet non error sunt labore. Tempore vel alias omnis a omnis dolores. Rem necessitatibus aut assumenda repellat. Quo ea quas molestias id cum voluptatem aut. Quod tempora qui nostrum ut. Optio dolores porro dolores quia ad velit necessitatibus. Veritatis illo nobis est molestiae veniam reprehenderit. Vel et harum itaque porro. Harum ut laborum eveniet illo. Rem possimus et maiores tempore commodi minus distinctio. Reprehenderit ab corporis consequuntur similique officia. Explicabo minus et placeat ut.', 186, '2023-03-02 06:52:13', '2023-03-02 06:52:13', 2),
(472626, 'Vero officiis molestiae nam alias.', 'Eius porro doloribus repudiandae laudantium et voluptatem velit. Voluptas quia ut suscipit quia voluptas minima nihil aut. Aut voluptas doloremque ipsam et consectetur qui quibusdam. Voluptas et natus a voluptatem quis non. Impedit deleniti veniam eius omnis qui. Blanditiis soluta quasi temporibus quia. Non cupiditate distinctio sed dolorem enim iste non. Pariatur est dicta corrupti quas. Dolorem vel quisquam dicta voluptatibus rerum omnis voluptates a. Nobis qui temporibus unde est voluptate. Sed quia distinctio aut aperiam. Iste tenetur qui et omnis. Id unde laboriosam quo hic assumenda. Natus voluptatem eos odio inventore deleniti error. Exercitationem non vel maiores eaque dolorem. Quas consequatur sed atque quis maiores eaque dicta. Unde iste placeat possimus aliquid pariatur aut vel porro. Tempora et ut velit repellat iste. Ut veritatis commodi incidunt ullam nulla odio ut architecto.', 105, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(473320, 'Alias reiciendis sit et accusamus.', 'Ipsam vitae aut provident in. Eius quam debitis quaerat. Distinctio reprehenderit cupiditate harum magni voluptas itaque. Non quidem ratione voluptatum aut deserunt pariatur inventore. Facere voluptatum nihil saepe ducimus. Impedit quia sint perspiciatis quam. Quae corporis rem et rerum sunt iste. Quaerat quia nihil et eligendi fuga nostrum ratione. Dolorum suscipit voluptatem in nulla ea voluptatem voluptatem. Aut magnam est corporis harum illum natus. Autem voluptates laborum in delectus assumenda. Et ipsum eos qui minima ut. Occaecati at quibusdam quas voluptas consequuntur et. Et assumenda enim et quos et.', 128, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(477880, 'Voluptatum soluta et quia error voluptates.', 'At sequi in provident cumque ea consequatur quia mollitia. Et ipsa neque voluptatibus. In blanditiis temporibus facere quia. Sunt dolores exercitationem ea molestias molestiae exercitationem. Ut quia cumque laudantium voluptate cumque deserunt. Necessitatibus et amet sed maiores sed. Odio id aut rerum libero dolor dolores. Non corrupti fuga enim fugit perferendis dolore blanditiis. Vero qui aperiam dolore quia necessitatibus earum. Eveniet ut sapiente perferendis voluptas ut. Doloremque eum dolorem tempore qui. Exercitationem reiciendis asperiores dolorem ut culpa est. Totam nesciunt incidunt quas et nemo libero non. Voluptates id distinctio ab aut quidem. Alias dicta est vel accusantium sit. Quisquam sed maiores nostrum vel omnis. Facilis ut ut itaque laborum sit. Rerum consequatur quo velit et. Et aspernatur quaerat consequuntur sint. Ut quis quae et quibusdam voluptatibus deserunt. Dolores tempore voluptate cumque ad cumque porro dolorum. At facere rem ullam in fugit omnis. Earum molestias voluptatem laborum consequatur necessitatibus aspernatur officiis.', 121, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(479528, 'Cum inventore sunt vel est.', 'Tempore nihil est corporis enim nostrum quia. Ad sed alias sapiente autem provident autem velit minus. Quia possimus perspiciatis eos vitae ipsam omnis. Ab maiores non culpa voluptate dignissimos asperiores. Explicabo beatae itaque possimus quod sed. Odio ut sit excepturi et. Iusto architecto ut sed perferendis suscipit. Dolorem qui qui corrupti consequatur fugit perspiciatis. Consequuntur et nam sunt sit et voluptas. Et sit nemo sapiente qui. Quia ut excepturi dolores hic eaque est et. Modi vero officia reiciendis et ut corporis sint repudiandae. Veritatis sit placeat qui ea laudantium expedita magnam nostrum. Deleniti sunt velit dolorum commodi dolores et consequuntur. Ex magnam voluptas beatae laudantium voluptatum. Eveniet magnam facere facilis accusantium dolorum. Rerum placeat nulla id voluptates quas nemo. Incidunt omnis repellat magnam.', 53, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(480203, 'Laudantium nulla aut nesciunt nobis voluptas earum blanditiis.', 'Necessitatibus consequatur ipsum amet autem. Qui eaque veniam ab provident est. Inventore mollitia voluptas deserunt exercitationem debitis aliquid natus. Labore excepturi voluptatem sit perspiciatis. Aut eligendi qui occaecati tenetur autem ut sed. Voluptate in corrupti nam totam voluptas. Dolores aliquid in non ipsum. Aliquam in quia quisquam. Temporibus qui a cum corrupti. Quisquam commodi officia dolores voluptatem porro. Magnam eligendi ut quia. Veritatis non recusandae deserunt est voluptate fugiat. Perspiciatis eligendi ullam amet pariatur ipsam. Quisquam velit sequi quis eius quo sint. Beatae molestiae iusto sit quasi velit. Ut quo libero doloremque esse mollitia sapiente. Similique impedit minima quo dolore quos doloribus dolor labore. Blanditiis in incidunt enim illo voluptatem voluptate dicta. Architecto rerum rerum architecto ipsum ab sit. Quod aut quia qui ut. Ut explicabo dolorem sunt distinctio. Rerum cumque dolore debitis molestiae soluta voluptatibus officia. Dignissimos at et dicta esse eligendi omnis natus. Cupiditate fugit excepturi sit voluptatem adipisci nesciunt.', 126, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(482951, 'Veniam rem temporibus temporibus deleniti amet provident est.', 'Eum iusto quod est accusamus distinctio. Ipsam possimus assumenda aut ut quaerat placeat aut. Eum quasi possimus velit. Omnis sed molestiae adipisci perferendis sint. Sed quaerat esse odio nostrum. Ut nemo aspernatur magnam qui. Voluptas aliquam voluptatem aut nesciunt maxime voluptatibus esse. Voluptatem maxime quo sit quia. Omnis voluptatibus et est voluptas reiciendis fugiat. Aperiam voluptas beatae praesentium aut. Et eaque laborum eveniet deserunt. Eaque et aut quis molestias occaecati. Vel et odio incidunt amet architecto eveniet excepturi. Non quia rerum vel tenetur ut voluptatum consectetur. Consequatur delectus porro iure. Laborum aliquid nostrum quo quia cumque suscipit aut est. Non accusantium repudiandae doloribus consequatur. Suscipit laborum nam autem eius facere laudantium necessitatibus. Explicabo dolor ut sunt eveniet vitae. Fuga est culpa optio aut in temporibus. Enim fuga fugit odio ut. Sunt sit natus non non. Modi ut explicabo odit dicta. Eum qui et enim similique nulla.', 179, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(487695, 'Eius dolor incidunt aliquam voluptas.', 'Quia repudiandae exercitationem facilis veritatis quo consequuntur veniam aut. Rem ad eos facere ab eos. Omnis quos nihil enim reprehenderit. Vel rerum earum odit aut ratione autem. Sed praesentium sit reprehenderit quod. Temporibus necessitatibus at voluptatem et. Ut laboriosam consectetur voluptas laboriosam mollitia quia. Iure perspiciatis rerum corporis quis unde. Earum sed hic cumque dolor natus cumque voluptas odio. Deserunt earum est laboriosam est. Rerum animi est illum ut. Consequatur architecto omnis esse reiciendis sunt et totam voluptatum. Neque soluta aut voluptatem aperiam ut voluptatum.', 153, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(495962, 'Exercitationem ullam error nulla nemo ea officia.', 'Assumenda dignissimos fugiat temporibus. Quae et voluptates cum rerum. Quidem nam accusantium pariatur minus beatae nihil. Molestiae rerum dolor sunt expedita dolores beatae quas. Saepe iure porro pariatur corporis est. A aspernatur ipsa aliquam quisquam architecto nulla eos. Incidunt reprehenderit qui libero autem ut vitae. Quibusdam iste dolores aspernatur minus quos. Suscipit ipsam quas perspiciatis perspiciatis aspernatur. Dolorum libero tenetur sit delectus et ea. Blanditiis sequi quis facilis repellat. Qui impedit commodi voluptatum aliquid dolor consequuntur ipsam. Voluptates reiciendis aut est fuga aut saepe. Voluptate eligendi maxime quis. Quos illo ipsa nihil saepe veritatis aspernatur. Nihil iste quidem sed quisquam et ratione. Incidunt voluptatem est consequatur fuga. Commodi quis delectus et enim incidunt eum sint voluptatibus.', 132, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(496035, 'Corrupti veniam et eos repudiandae.', 'Quo molestiae ipsa asperiores magni minus suscipit quia maxime. Odio provident quaerat alias nulla provident fuga aut qui. Non illum distinctio sint eum exercitationem fugit. Maiores incidunt minus occaecati ipsa et. Non occaecati exercitationem nesciunt nobis. Explicabo voluptatibus illum qui quos rem quaerat asperiores quis. Enim ut architecto similique iure est in eos maiores. Animi facere vel similique eius accusantium harum ut. Beatae ipsa nobis ut optio nisi. At est magni suscipit enim ipsum. Atque dicta in id dolore est blanditiis. Sint perferendis molestias ut voluptatem et maiores laudantium totam. Sit sed quaerat alias excepturi. Sed quos non nam sequi repudiandae voluptatibus modi. Impedit non sint eligendi culpa. Corporis voluptas animi vero. Fugiat et eligendi repellendus non quaerat natus. Qui est sequi dignissimos consequatur id a dolores. Rerum dolorem et magni excepturi. Maiores minima itaque aut sit. Suscipit ea et magni facilis. Nulla non autem corporis omnis eaque voluptas. Tempore est iusto illo sunt labore. Libero minus dolorem est temporibus deserunt eos. Culpa aut voluptas aut. Facere suscipit quia qui quia quasi. Aut odio dolore doloremque hic quam aut. Repellendus omnis illo ullam.', 103, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(500937, 'Aliquid recusandae minus rerum exercitationem ipsam sed.', 'Eum harum ad quia qui dolorem molestias. Eveniet rerum neque occaecati sed. Blanditiis aspernatur accusantium magni et mollitia sit. Saepe voluptas totam dolor tempore nobis possimus. Explicabo quibusdam fugit voluptatem totam aut neque. Iusto id id possimus ut non quam. Quasi blanditiis non voluptatibus quasi doloremque. Corrupti excepturi ipsa sed fugiat itaque vel et. Id dolores consequatur ratione quidem beatae sed maxime. Dolores enim impedit a voluptatibus explicabo. Iusto et delectus in enim quisquam. Numquam tempore minus quo deserunt. Officiis odio eos non rerum. Mollitia magnam omnis aut cum et. Et libero occaecati soluta maxime sed maiores impedit qui. Sapiente iure ipsa et adipisci. Animi excepturi nobis voluptas. Consequuntur officiis qui autem aliquam quia quidem. Quod iusto magni non doloribus veniam natus. Vel quibusdam aut corrupti tempore incidunt libero. Qui totam aut aliquam eaque molestiae ut. Quisquam perspiciatis debitis autem voluptas. Eius qui quis ut accusantium sed. Accusantium est modi similique quo et eos repellat. Accusamus aut sed nihil eligendi est architecto inventore. Sunt qui aut explicabo eos qui explicabo facilis iusto.', 7, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(503919, 'Et neque enim aut iusto omnis voluptatibus.', 'Unde aliquid illum et. Enim nulla sequi est. Voluptatem enim ut sed possimus ad dolores. Consequatur facilis quibusdam explicabo. Maxime quo qui occaecati animi. Animi reprehenderit earum quia dolor accusantium in quas dolor. Alias ut modi sit vero quos. Id est sunt rem. Est tenetur aut omnis quia dolorum eum. Velit quisquam odio vel aut aut esse. Fugiat quos optio quasi numquam deserunt sunt. Odio itaque dicta enim deleniti laudantium et rerum dolorem. Sed quidem similique maiores vel voluptate sed dolore. Consequatur ut enim officiis impedit accusamus. Delectus officia rem minus iste distinctio cum. Non ut voluptas a et aperiam possimus necessitatibus. Accusantium sed ut in. Cupiditate quod ex quisquam. Sed unde doloremque alias. Nihil velit commodi repellat quod qui asperiores sit. Aut delectus dolores a aut praesentium illo quia consectetur. Enim quis repellat quisquam pariatur sit in vel. Ipsa iusto sit qui.', 154, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(511542, 'Quidem velit quibusdam quidem harum iure qui.', 'Ut qui aliquam aut minima veritatis blanditiis officiis. Ut quia quia voluptas praesentium accusantium eum ad. Vero et ipsum et velit delectus. Laboriosam esse aperiam fugit. Est soluta repellat enim corrupti debitis modi. Consequatur reiciendis doloremque eos. Labore consequuntur doloremque ut aliquid. Voluptate nostrum corrupti ut minus. Autem cupiditate ut voluptas soluta beatae odio. Omnis voluptate nostrum reprehenderit repellat nemo soluta amet. Et libero ad voluptas dolores expedita molestiae. Dolores perspiciatis necessitatibus et sit dolor. Neque ipsam tempora reprehenderit et. Delectus neque voluptatem magnam. Explicabo id magnam omnis in aut corporis voluptatem. Debitis perferendis porro consequatur earum ut. Voluptatem dolores quibusdam ut enim omnis commodi unde. Est nesciunt officia nihil. Id excepturi adipisci et omnis et autem fugiat. Accusantium hic et eos quo doloribus aperiam. Dolores quasi doloremque illo. Saepe non facere non consectetur. Architecto dolor alias officia molestiae neque enim praesentium. Ut ullam cum sed ipsa beatae.', 81, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(515237, 'Laborum dolore eos ut ab.', 'Ea dolores vel dolorem unde id qui possimus. Non optio velit cupiditate magni libero sint. Architecto et omnis consequatur neque facilis illum rem. Eum beatae eius sit. Voluptas fuga qui eaque voluptatibus quaerat qui debitis voluptas. Laboriosam in nisi consequatur reiciendis molestias. Est et praesentium dolor eaque suscipit ut. Vitae sapiente minima excepturi. Dolorem aspernatur ipsa praesentium recusandae. Qui et non adipisci molestiae et. Esse dolores officia recusandae doloribus. Excepturi omnis explicabo repellendus quasi ut recusandae quibusdam. Sunt quia est vel enim a. Explicabo commodi suscipit perspiciatis. Labore nam aut aut ea doloribus. Aut neque cum dolorum ea eos aut facilis. Maiores commodi voluptatem reiciendis debitis rem. Similique labore quibusdam minus amet sed quos. Quo deleniti molestiae ut et dolores nesciunt quo. Maxime autem temporibus et est quisquam. Temporibus sunt recusandae animi quibusdam veniam. Aut numquam blanditiis qui illum. Libero deleniti doloremque ullam excepturi. Voluptas quibusdam excepturi adipisci ratione harum non. Qui doloribus sint nemo ad harum. Nihil non ipsam odit quam qui ut. Occaecati ut saepe dignissimos qui expedita. Adipisci nisi facere amet id temporibus eum.', 130, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(515468, 'Qui aspernatur nostrum laboriosam commodi eos totam optio voluptatem.', 'Vitae aliquam commodi illo quis consequatur facilis sed. Voluptatum ipsum eos dolor tempore veniam recusandae beatae quo. Et quas dolor accusantium ex ducimus natus eaque. Nihil perferendis nobis voluptate quis possimus quam. Dignissimos et hic enim unde. Odit ipsam magnam aut eaque. Ducimus est est aut ut et. Et est nisi illum necessitatibus amet distinctio possimus. Omnis autem et velit ex id sit. Voluptates numquam quisquam veritatis dolorem. Mollitia tempore porro nostrum. Quidem sunt in omnis qui itaque dignissimos. Voluptatum eum facilis earum asperiores delectus animi velit ut. Voluptatem maiores doloribus ut consequatur ipsum dolorem expedita.', 93, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3);
INSERT INTO `forum_posts` (`id`, `title`, `body`, `user_id`, `created_at`, `updated_at`, `categorys_id`) VALUES
(528304, 'Amet laborum eos dolorem corporis illum saepe.', 'Est omnis sit et hic maiores. Sit blanditiis laborum similique recusandae quasi aut. Aut iure minus qui nihil sed eum. Ex saepe odio iusto neque expedita dicta. Quis voluptatum cum aut incidunt labore quia officia. Est ipsum deleniti dicta temporibus doloremque quas nisi. Quos et porro voluptatum eos. Eveniet odio voluptatem reiciendis quos quod. Amet delectus vel culpa voluptates sit. Voluptatem voluptatum quisquam officia commodi magnam possimus non voluptatum. Nemo voluptas quia harum voluptates debitis molestiae beatae. Provident doloribus consectetur non ex minima voluptas. Eaque voluptatum qui et autem dolor dolores. Eaque maiores laborum provident saepe id. Et quos fugiat aut explicabo quae quia corrupti. Rerum aut vero voluptas ipsam dignissimos. Vitae non et deserunt porro voluptas. Voluptates molestiae illum aut labore sequi ut inventore. Nisi voluptatem qui at veniam. Quis eum ut ut similique tempore. Quae harum est aliquid et. Reiciendis architecto quo dolores fuga qui sapiente soluta. Pariatur dolor quas molestiae et ea cumque. Totam est ipsa qui quasi. Placeat quis dolorem qui explicabo facere rerum quia. Est ut corporis quas ipsa.', 134, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(532349, 'Qui hic qui eum.', 'Asperiores et sint et reprehenderit dolor illo. Dolorem officia ratione eius facere dolores maxime. Et molestias optio est ipsum minima quasi. Adipisci expedita dolorem ipsam. Nulla magni eaque debitis quia quia expedita et. Sed optio et beatae non soluta quibusdam voluptatem. Error quia quos illo quia earum deserunt dolorem nobis. Sed alias repellendus nisi unde laborum autem. Laboriosam ut aliquam deleniti ut ab adipisci maxime. Doloremque repellendus magnam qui vel. Itaque et nam blanditiis labore quia. Id veniam et rem ut inventore consequatur corporis. Eligendi cum sit eligendi quos ipsa. Blanditiis dolorum odit ut quo laboriosam. Sunt et delectus dignissimos perspiciatis. Dolores illo iste et aut. Enim iste libero sunt tenetur enim est. Aspernatur dolores laborum consequatur voluptatem hic. Rerum omnis dolore unde vitae fugit. Cum dolore sit debitis dolorum et facilis. Illum odio recusandae at sed. Mollitia voluptas ut molestiae est dolore officia. Quia velit aliquam quisquam mollitia sit dolores. Nobis quia dolores et fuga rerum quod. Et qui aliquam aliquam nostrum vero velit. Quo corrupti quam nobis. Distinctio est iusto vel consequuntur quae. Quibusdam consequatur dicta tenetur unde nobis repellat.', 170, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(537882, 'Autem perspiciatis sit maxime quo.', 'Et alias aut error consequuntur. Aut praesentium optio blanditiis voluptates. Mollitia quis et non consequuntur. Cupiditate qui sunt et. Reprehenderit culpa non ullam in deserunt porro. Fugit voluptatem maiores in ullam voluptatem non modi perferendis. Consequatur provident labore qui aut voluptatem. Quo rerum repudiandae delectus sit quibusdam iste corrupti. Ut explicabo enim non odio. Rerum vitae neque est nemo. Laudantium aut enim quia iste est enim ducimus. Autem nulla commodi qui quisquam similique. Provident est occaecati ad enim nisi. Saepe mollitia et doloribus consequatur soluta. Et sit ut voluptatem culpa. Debitis esse dolor praesentium non qui vel est. Fuga nisi molestias eum deleniti a doloribus autem rerum. Quos nesciunt autem aliquam omnis officiis. Voluptate qui delectus iusto odit dicta rerum. Reprehenderit ullam est cum et sunt nisi. Eligendi quia non velit aut delectus aspernatur laudantium. Officiis quisquam est dolorem doloremque est error dolores.', 31, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(541273, 'Dolor velit ut praesentium a.', 'Laboriosam cupiditate placeat et magni. Occaecati accusantium non quia voluptate dolorem. Dolores aut possimus non aut minima aut. Asperiores libero aut quo dolores. Incidunt nisi possimus perferendis sequi ut suscipit et modi. Magni facere sunt blanditiis est quo quo. Quasi eligendi quaerat laboriosam et repellat. Ut natus est fugit quae sed quod. Quisquam nesciunt a nulla aperiam est. Quam adipisci non culpa quia ratione est. Sed quis dolores in eum fuga alias. Voluptas quia similique earum iure maxime nesciunt. Enim explicabo illum sed reiciendis commodi et labore. Et delectus itaque aut quo eaque. Iusto sit dolorem enim occaecati et molestiae est. Ratione repudiandae sunt voluptas cupiditate in sit consequatur. Deleniti deleniti sequi quia voluptas. Fugiat porro repudiandae natus. Asperiores sed provident reiciendis repellendus saepe. Ex id amet qui quod et veniam aut. Accusantium quibusdam officia officiis vel cumque voluptatem. Distinctio reprehenderit odio corrupti rerum recusandae aut. Deleniti eius nihil corporis rerum. Tenetur maxime et saepe doloremque voluptatibus rerum. Commodi iste provident omnis doloremque in tempore. Corrupti soluta assumenda quisquam et labore. Eum ut numquam repellendus blanditiis nihil alias et.', 49, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(546369, 'Suscipit autem incidunt sed ut molestias totam veniam.', 'Laudantium natus ipsum ipsum rerum optio dolores. Nam quas voluptatem labore error sint. Perferendis temporibus quam optio. Nemo sed eos molestiae beatae totam esse consequatur neque. Asperiores dolor laborum rem officia harum odio. Mollitia velit totam perspiciatis dolorem sequi asperiores recusandae. Necessitatibus dolores molestias et qui odit vel architecto ut. Esse ut ratione incidunt quasi soluta autem. Quod esse aut id rem. Blanditiis praesentium autem inventore voluptas. Accusantium illum accusantium molestiae. Quaerat nemo illum vitae qui et asperiores. Dolore occaecati nobis reprehenderit nesciunt omnis. Nemo qui aut aliquam ea hic. Nostrum vel nulla distinctio et reprehenderit in et. Voluptatem sunt suscipit optio possimus. Officia dolorem omnis consectetur enim nesciunt voluptate consequatur. Sequi unde asperiores sed perferendis accusamus eum. Aut voluptatibus consequuntur quia.', 77, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(555151, 'Commodi ab reprehenderit ipsa in.', 'Sapiente rem pariatur quia ad dolorem. Nulla dolor et possimus et sed sequi similique. Est omnis sit et repellendus est est voluptate. Dolorum iste iure neque voluptatum nisi optio. Nulla perspiciatis qui non doloremque in. Aspernatur beatae voluptates est vel expedita delectus. Ullam dolor officia officia reiciendis ut corrupti debitis. Ipsum doloremque rem quia dolor ipsum et. Recusandae illum consequatur a tenetur provident. Minima ut libero dolor illo nemo ut aspernatur. Qui et natus ut. Voluptatum delectus voluptas vero molestiae est tempore. Quia velit amet impedit qui magnam eum est. Velit vitae doloribus nemo et id. Quia voluptas totam id animi.', 64, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(555543, 'Vitae eos ipsa tenetur et dolore et error nostrum.', 'Deserunt eos soluta et aut. Illum id beatae voluptatem est earum facilis perferendis sunt. Autem aspernatur autem et. Et laborum est at molestiae quod laudantium. Est esse quia fugiat ipsam. Minus eveniet quibusdam tenetur optio nam facilis. Et et ullam quo necessitatibus iusto commodi ut vitae. Ipsum dolorum officia dolores quae. Inventore voluptatum impedit modi quia expedita beatae. Quae vero dolores vitae et. Quia reprehenderit asperiores ut sunt. Consequatur distinctio dolorem ut. Optio expedita eaque facilis dolor. Impedit reiciendis et amet ex. Rerum ea molestias inventore perferendis eveniet sed totam natus. Nobis rerum rem rerum tenetur. Corporis reiciendis tempore ab blanditiis excepturi harum accusamus. Autem doloribus qui est asperiores nihil eos. Veritatis maiores quae molestiae ea eius temporibus dolorum. Beatae voluptatibus temporibus perspiciatis et hic. Et necessitatibus voluptas velit dolorem. Ipsa tempora quia ut beatae quo rerum natus. Voluptates ex necessitatibus consequatur velit. Sed aliquam repellendus aliquid error et. Eaque velit porro eius ab voluptate deserunt. Nobis quia mollitia qui vel possimus. Veniam quia optio ipsa voluptate maxime placeat.', 9, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(557765, 'Officia quasi quas odit dolores reprehenderit quibusdam.', 'Ut minima ad nesciunt. Eveniet provident sit fugit natus et. Rerum eveniet et corrupti. Nostrum commodi id dolore velit. Repellendus laboriosam corrupti est officiis veritatis. Esse expedita quaerat in praesentium eum rerum. Vel amet veniam dolores in dolor consectetur. Placeat et similique qui illum dolorem. Dolor amet earum natus voluptatem. Voluptatem et eum consequatur non voluptate. Qui dolorem qui a et nobis et. Beatae odio voluptas repellendus deleniti labore velit unde. Hic molestiae velit sunt error aut exercitationem. Est non temporibus omnis repellat. Est esse enim et architecto nihil dolorum repudiandae. Vel vero velit magni dolor pariatur cupiditate nihil. Fuga deserunt harum est. Fugit facere vitae quisquam voluptates voluptas assumenda voluptas qui. Omnis velit deserunt debitis officia est placeat voluptatem.', 47, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(559599, 'Neque sunt omnis ut quisquam quis delectus.', 'Molestias est molestias qui repellat. Ut in maxime molestiae animi. Quae voluptatum et veniam et maxime harum est. Aliquid non ullam dolore quo nesciunt et. Cupiditate qui commodi quisquam tempore. Ea asperiores saepe veniam et consequatur odio aut. Ut ut non dolores dolorum est ipsa sint. Et ut optio rerum quis. Optio at illum officiis delectus. Reprehenderit voluptates cumque ex. Autem aut incidunt et delectus. Repellat ut eos fugit accusamus ipsam. Adipisci architecto recusandae ut velit. Et illo voluptas consequuntur iusto provident culpa totam. Perferendis eveniet quod sit nihil et quaerat odit. Doloremque aut quas voluptates voluptas culpa est. Et quia excepturi dolores eius maxime molestiae. Ab ex sed ut pariatur voluptas tempora. Facere minus delectus rem magnam eum dolorem. Est est error maxime est. Minima aut sit soluta expedita molestiae. Neque hic provident vero. Consequatur et sunt autem modi.', 156, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(560257, 'Ipsam et et aut voluptatem maiores sit.', 'Voluptatum quia quia nostrum eligendi ut voluptatem. Quibusdam sint in nisi aut distinctio optio nesciunt. Illum quia alias quis distinctio eius id. Non dolorem et est quas ut. Ea dolores dolorem autem necessitatibus maxime. Odit nesciunt dolore dolore sunt. Voluptatibus magni culpa ab eos aspernatur provident. Explicabo exercitationem ex delectus porro explicabo. Id voluptatem voluptate qui exercitationem vel. Expedita maxime porro ullam saepe. Veniam deleniti soluta amet et. Voluptas sunt ut totam voluptas cumque. Magnam libero repellat ea et ratione. Autem fuga et sit unde laudantium quaerat. Rerum neque vel facilis vel dolor. Id tempora in quia cumque quam incidunt. Id hic tempore error ea. Sint cum enim vel rerum et et ut.', 83, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(561100, 'Dolores et culpa consectetur mollitia ut.', 'Quia atque vel quis reiciendis quia odio vel. Aliquid ex eum laboriosam vero sequi. Iste ea numquam nobis at quia. Veniam et excepturi minus et excepturi velit sit. Quo alias dolor laboriosam exercitationem aliquid et. Architecto autem neque quos est. Itaque neque voluptas nostrum consequatur dolorum. Architecto nam vero est aliquam fugiat unde qui soluta. Aliquam numquam fuga non molestiae maxime facere. In sit eius ipsa tempore quidem nihil sunt. Qui et dolores praesentium eos ipsam. Quaerat sit quo assumenda ratione saepe aspernatur. Nesciunt velit autem nesciunt alias repellat. Aut et molestiae cumque id. Voluptas voluptatem consectetur est. Officia deleniti doloremque corporis sed. Velit enim totam non dolorem dolorem. Quis quia dolorem voluptatem. Vel saepe aspernatur ducimus est quaerat vel. Quas et eveniet cumque et. Officiis nemo voluptatem ut exercitationem non sunt quod. Libero quae voluptas qui natus. Soluta consequatur aut asperiores nihil sed possimus quaerat. Tempore itaque possimus excepturi vitae. Aut quis libero et cumque hic et. Doloribus maiores magni libero commodi rerum quia.', 188, '2023-03-02 06:52:13', '2023-03-02 06:52:13', 2),
(566287, 'Itaque voluptas explicabo eveniet est omnis ipsa nemo dolores.', 'Commodi non voluptatum ea eaque deleniti illum nemo. Soluta illum at quia consequatur magnam quasi nihil. Eius qui mollitia aut recusandae. Laboriosam ipsam aspernatur dolorem accusantium. Dolorem ut sunt nostrum sint facilis. Mollitia officiis iusto quod quis commodi ut. Et dolor facilis deleniti. Velit et harum inventore est aliquam. Sequi ratione non quia quo blanditiis. Velit sequi eum sequi dignissimos veniam autem labore odio. Qui quia vel cupiditate quas explicabo dolorem et. Commodi magni quia vel optio perspiciatis id. Qui et illum est fugiat. Sapiente facere ut facilis fuga quis consequuntur. Veritatis a veniam nesciunt beatae minima rerum et.', 21, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(567418, 'Enim atque perferendis rerum iusto non earum.', 'Dolorum maiores minus qui inventore fugit reiciendis vel. Voluptate minima ratione quibusdam alias rerum. Nihil aliquam rerum perspiciatis enim sed est distinctio. In est et consequuntur. Autem blanditiis odit quibusdam ea suscipit voluptas. Eaque vel voluptatem excepturi ipsa sit. Natus cum possimus perspiciatis maiores sit necessitatibus commodi. Iste qui sint rem vitae odio. Praesentium praesentium voluptatem deserunt et corporis qui. Deserunt quae quia optio officiis quia sunt architecto aperiam. Doloremque dicta ipsum expedita nihil corporis labore quis. Officia amet aut id. Delectus magnam voluptatem rerum consequuntur. Explicabo officiis qui nostrum amet. Officia rem alias facere provident nobis dolore. Minima nobis eaque nihil dicta. Ea qui ipsum recusandae. Sapiente quia expedita soluta soluta totam non. Recusandae sed voluptas autem ipsum. Itaque consequuntur at dolorum voluptatibus itaque voluptas laudantium. Dolores id eligendi exercitationem cum. Officiis ab maiores qui nam. Ut non excepturi eius dolorem.', 45, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(569353, 'Repellat aliquid ea sed magnam aut voluptas.', 'Qui dignissimos eaque ut nostrum tenetur expedita iusto. Voluptas corporis sequi quo ut atque dignissimos quis qui. Dignissimos eum odio nobis aliquid enim praesentium. Et voluptas eos at. Consequuntur rem aperiam cupiditate ea. Recusandae perferendis exercitationem ab itaque aliquam quae. Possimus et quia est optio doloremque perferendis. Hic possimus deleniti ducimus voluptate recusandae perferendis illum. Ut magnam veniam doloribus fuga maiores culpa id. Esse rerum non deserunt eum et quo. Rerum velit qui ut nulla nobis dignissimos dolorem non. Et autem voluptatem ratione ullam omnis sit neque. Ullam aspernatur dolorem iste nemo corporis quidem. Optio voluptas rem eligendi sint ut quis. Facere veritatis et laudantium vitae non perspiciatis. Quo voluptates expedita sapiente quam nulla molestiae. Ducimus voluptates omnis cum vero sed incidunt eos. Et aliquam consequatur repudiandae illum. Impedit magni at aut harum debitis. Fugit distinctio beatae enim iure repudiandae et et. Ea aut repudiandae maiores. Quod maiores placeat quae ut. Et hic praesentium voluptas aut nemo rem. Velit eum dolorem quo officia rerum consequatur aut voluptatem. Repudiandae excepturi et cumque est quasi voluptatem. Suscipit illo sit mollitia minus.', 74, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(574225, 'Consequatur pariatur aliquid dolores quo tempora et.', 'Vel ea non reiciendis aperiam id. Quo ut ipsam sed beatae aperiam vel. Dolores ea dolorem nobis aut atque odio. Voluptatem fugiat dolorem accusamus. Voluptatem quia magni nesciunt qui. Non corporis officia odio deleniti libero. Natus saepe incidunt occaecati qui. Aperiam similique dolorum ipsam provident beatae. Reprehenderit repellendus sed aut et velit adipisci. Rerum vel porro laboriosam quaerat illo quo. Dolor ea facilis consectetur dolorem eveniet veritatis recusandae magni. Quisquam delectus consequuntur quo reiciendis voluptatum neque quibusdam. Voluptas qui quod enim harum. Repellendus reprehenderit nihil facere. Doloribus at molestiae possimus. Veniam odit natus deserunt est non omnis doloremque. Nobis distinctio a quo voluptates omnis voluptas qui atque. Dolore corrupti eveniet nulla. Aut consectetur sit quos harum.', 151, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(580712, 'Ea sequi quibusdam dignissimos nulla.', 'Voluptates voluptatem tempora ut fugit voluptatem et blanditiis. Vel non quaerat ipsa consequatur. Voluptatem et adipisci laborum. Quis quod delectus a quidem repudiandae numquam nostrum modi. Et aut ut quibusdam ducimus quis eligendi fugiat. Debitis quis necessitatibus repudiandae assumenda hic. Voluptatem omnis animi impedit quis enim sunt officia. Ut nemo quis cum ea esse accusamus illum earum. Est eaque eligendi sunt dolorum quo. Debitis assumenda aut sed rerum adipisci. Quisquam animi repellendus dolor voluptas. Nihil vel voluptatibus est ut consequatur pariatur. Corporis reprehenderit dolorem reiciendis perferendis. Quo et libero exercitationem aut beatae a dolor. Est aspernatur quia eaque voluptas tempore nihil molestias. Deleniti exercitationem ullam rerum dolore modi aut. Nulla qui dolore veniam. Dolor odit eum numquam aliquid laborum nihil. Nemo excepturi sunt corporis dolore nam perspiciatis totam. Eligendi maiores qui sapiente et necessitatibus non aspernatur. Aliquam explicabo facilis repellendus voluptas. Ut repudiandae soluta dolores laudantium expedita quo qui. Voluptatem atque minima consectetur et tempora non. Suscipit excepturi nostrum et vel ea ex recusandae. Provident officia eaque vel velit. Laboriosam veniam minima voluptatum inventore praesentium. Culpa harum quas error sint assumenda.', 41, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(581967, 'Facere quia aut voluptatum ut.', 'Vitae quia eveniet magni voluptate doloribus quia sapiente dolorum. Velit et quae aperiam ut dolorem quo sed. Sapiente qui eum officia est hic. Iusto molestias veritatis qui vero dolor. Et laborum earum nihil explicabo quo laboriosam. Iure deleniti ea deleniti earum enim iste. Ipsa iste architecto aliquid architecto. Accusantium excepturi consequuntur autem magni dignissimos non quidem. Qui assumenda autem dolores vel error velit. Distinctio sapiente sequi et. Ut accusamus dolores et rerum harum. Tempora aut autem ab enim autem facere. Vel quibusdam cum ut molestias ipsam sequi quia. Et in voluptates ad inventore. Occaecati accusantium laborum quia. Nobis assumenda quos molestiae. Esse enim nostrum enim atque rem.', 56, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(583013, 'Alias velit sed nesciunt expedita illum et.', 'Qui modi dolorem dolorum autem alias architecto. Et labore laudantium nulla omnis minus enim. Quia voluptates at est nihil voluptate vitae neque. Id in aliquam maxime in. Ea nemo minima nesciunt possimus. Ipsam id a quos. Est maxime iusto quia dolorem earum omnis numquam commodi. Vero corporis totam laboriosam quos. Est incidunt quia hic aliquid architecto. Iure reprehenderit deleniti neque architecto. Nulla ipsum eos dolores natus et vitae. Repellat ipsa sed aut blanditiis eveniet. Eos veniam fugiat architecto aperiam. Itaque consequatur voluptas corrupti possimus non. Quod tempore qui sunt veniam dolorem. Ea quas voluptatem vel laudantium est quo et. Voluptatibus modi aspernatur veritatis voluptates aspernatur consequuntur. Et sed quia odit et dolorum. Quis asperiores non vel rem incidunt. Et corrupti rerum assumenda reprehenderit. Fuga corporis omnis odit aspernatur. Quisquam debitis optio cum necessitatibus veniam qui soluta. Quia maiores velit aut ut consequuntur similique voluptate. Quisquam voluptatem dolore pariatur quas.', 189, '2023-03-02 06:52:13', '2023-03-02 06:52:13', 2),
(585428, 'Dignissimos et dignissimos nesciunt ea consequatur magni.', 'Dolores est ex quos labore quos quae impedit tempore. Nostrum provident ipsam quo enim cum corporis omnis. Necessitatibus eaque libero ut excepturi consequatur soluta sit. Explicabo officia dolorem autem. Est est quidem ab molestiae. Perferendis ea id ea possimus nemo et similique. Omnis esse ut eveniet sunt aut. Qui nesciunt a consequatur repellat omnis qui minus. Et eum fugiat est. Consectetur est tenetur quo et et. Perspiciatis iure qui non nemo voluptatum. Numquam voluptates molestiae aliquam cum. Quis quod hic quia minima quam. Non aut possimus excepturi earum. Minus et ex dolores deleniti praesentium illum. Quos sed fuga magnam autem et. Quidem dicta aspernatur enim aut et pariatur est. Delectus officiis inventore magni voluptatum beatae corporis vitae. Velit velit a rerum. Dolor dolore quisquam culpa cum ut dolorem. Consequatur at fugiat vero. Omnis at ut sed eius quo. Quis omnis iste eum recusandae eum itaque nesciunt. Qui consequuntur voluptatum labore et ducimus laudantium. Alias veritatis asperiores quibusdam aliquid dolor. Nemo totam eum odit dolorum et labore magnam. Error quod sed aut molestias fuga quod officiis.', 30, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(585514, 'Suscipit asperiores numquam quasi sed atque quidem.', 'Necessitatibus consectetur architecto saepe. Voluptatum similique natus et quas. Ut praesentium dolorum occaecati et vitae repellendus. Odio hic quasi ad quo ea ex perspiciatis ducimus. Blanditiis numquam eum est est ut. Iure in quo exercitationem illum id. Esse earum officia enim provident ut. Autem et iste odio aut. Delectus quaerat ipsum unde quas eligendi non cum. Tempora adipisci autem ea at facilis occaecati. Minus voluptas et cumque quis repudiandae eum. Consequatur iure adipisci unde labore. Dolorum sit explicabo nobis reiciendis. Labore tempora ex adipisci enim quia sunt. Deserunt quos id cumque porro quia magni. Ea consequatur porro eos ratione omnis impedit qui. Occaecati laudantium eaque voluptatem minima veniam fugiat. Tempore laboriosam animi amet necessitatibus aliquam. Fuga molestiae doloremque est id debitis voluptatem eum. Porro aspernatur repudiandae vitae officiis quis.', 138, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(589284, 'Eum minus minima ut qui a est impedit.', 'Nostrum sed officiis ea porro. Dolores adipisci debitis quo vero sequi. Eum quod quia distinctio perferendis et. Ipsa aut vel ullam repudiandae et rerum sit. Nihil rerum tempore sed quidem repellat. Illo repudiandae error reiciendis totam in. Tempora fuga officia quas consequuntur dolorem. Debitis repellat aliquam cumque vel aut dignissimos omnis quasi. Ullam in tempora velit dolores sit. Non eum consequuntur ad nesciunt maiores in possimus. Reprehenderit dolorem error officia magnam odio sunt reprehenderit possimus. Vel occaecati molestiae rerum. Ducimus blanditiis exercitationem assumenda suscipit et qui. Minima repellendus cumque quidem temporibus est est. Laborum magni unde perferendis est accusamus eius molestiae. Laboriosam sit nesciunt repudiandae ducimus sit. Laborum enim ut totam fuga. Iusto exercitationem nisi non ea et ea. Ut corporis dolor et voluptate. Est illum quia velit temporibus eius. Voluptatem at ut et in assumenda dolor sint. Totam dolorem officia deleniti ut perspiciatis. Eum ad rerum iste blanditiis sint. Vero recusandae laboriosam incidunt quam. Sint quia reiciendis architecto molestiae ipsum optio.', 182, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(593337, 'Dolorem nisi maxime ad voluptates sapiente animi.', 'Distinctio vero tempore a fugiat eos cum rerum. Sit aspernatur minus molestiae quia nesciunt nulla. Repellendus cum aliquam adipisci quam. Ut hic dolores fugit sit voluptatem nulla. Voluptates quod minus aspernatur consequatur. Voluptates id non et maxime iure voluptatem. Voluptatem ea dolores officiis esse. Veritatis modi et hic. Dolorem porro voluptate quam dolores est. Debitis laborum rem consequatur esse non. Eius vel reprehenderit accusamus repellat voluptatem quibusdam minima et. Qui accusantium dolore deserunt. Itaque ut et ab aut mollitia ut modi sit.', 193, '2023-03-02 06:52:13', '2023-03-02 06:52:13', 4),
(594846, 'Accusantium aliquid eligendi possimus illo aut quisquam.', 'Qui ea et nihil tenetur et autem. Porro dicta eum aspernatur recusandae. Amet tempore ea placeat. Voluptates ut animi quia quia deserunt. Voluptatibus rerum ut aspernatur eligendi. Maxime magnam ad dignissimos possimus quo nemo explicabo. Consequatur dolor et quia error. Cumque quo voluptas numquam et. Commodi sit libero voluptates qui et dolor et voluptatum. Explicabo et qui qui similique. Itaque dicta natus sint ut. Id ipsum neque libero reprehenderit. Voluptatem fuga vel eligendi voluptate et. Fugit placeat molestiae cupiditate qui nihil omnis et. Aut debitis dolores officiis quam dolores omnis. Nulla earum occaecati deserunt asperiores quo ab et. Iusto et et blanditiis dolores et. Fugiat quas ut sunt tenetur consequatur mollitia soluta cupiditate. Eum voluptas provident et officiis.', 116, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(622335, 'Est delectus illum quam sequi sequi nobis.', 'Recusandae ipsum alias necessitatibus ducimus harum fuga expedita deserunt. Quo natus rem libero laudantium. Aut quia accusamus quis minima voluptas. Consequatur qui porro assumenda labore esse. Odit voluptas sunt aut corrupti. Iusto vel est accusamus voluptatibus aspernatur et. Doloribus amet voluptatem recusandae molestiae. Beatae cumque optio modi perferendis itaque ut explicabo. Voluptatem facilis cumque enim possimus nemo. Vero tenetur enim dolores. Porro eos eos iure. Consequatur aliquid quisquam esse illo. Cumque maiores doloribus aperiam aliquid doloremque esse qui iure. Et aut aut voluptatem adipisci est minus maiores.', 33, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(625407, 'Ea sit sequi provident omnis ea nemo aut.', 'Voluptatem ea unde quo ut officiis beatae. Temporibus iusto voluptas occaecati et ut. Nesciunt et aut enim hic ut. Libero ea autem nisi similique quia possimus modi. Reiciendis saepe delectus voluptatem. Eos autem vel tempora ullam et exercitationem omnis. Qui delectus non cum quidem. Qui repellendus ipsum est aut. Porro quaerat recusandae id odio. Quia unde error deleniti sequi quod. Voluptatem ratione dignissimos ducimus dolores tempora modi. Id beatae accusantium natus ex laudantium. Ut a natus sed accusantium. Ut reprehenderit fugiat saepe a repudiandae quae.', 88, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(626357, 'Autem necessitatibus officiis aut excepturi soluta sunt.', 'Quo in repellendus et itaque. Quia blanditiis perferendis odio porro occaecati possimus pariatur. Nihil ipsa dolor dolores dolor. Quo sed rerum incidunt a a. Commodi sapiente et aliquam laborum et. Nulla voluptatem sint rerum. Voluptatem perspiciatis cumque voluptas explicabo et. Pariatur tempore est at. Ea odit sit architecto dolores sint dolorem aut. Laudantium sint aut consequatur in ducimus ipsam qui eos. Libero asperiores id debitis qui voluptas. Eos quia necessitatibus a ea. Nihil eligendi harum veniam quae omnis. Fugiat voluptas quo placeat velit. Minima sequi sapiente quaerat quidem sunt id. Et sed libero vel quasi. Provident et nesciunt quidem perspiciatis a dolorem. Sed consectetur quis et aut architecto. Modi pariatur at in in corporis et ut perspiciatis. Ducimus quod recusandae veritatis repellendus sapiente molestias. Accusamus nulla odit neque. Modi autem sequi sed commodi. Doloribus consequuntur nesciunt eaque aut exercitationem in.', 112, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(626922, 'Est quasi omnis sit modi necessitatibus laboriosam et.', 'Ipsum et alias vel in autem occaecati. Natus quasi ullam labore reprehenderit facere. Mollitia non amet eveniet laborum omnis. Eaque et explicabo assumenda dolores inventore assumenda. Assumenda doloremque ut possimus. A voluptate quis est quae sunt aut iusto. Itaque qui numquam fugit possimus laboriosam debitis ut. Qui enim sequi ad esse laborum. Aut voluptatem provident ut sequi voluptates sit. Necessitatibus dicta in et accusantium. Officiis aut voluptatum animi quia non cumque. Possimus totam molestiae quibusdam impedit. Suscipit cupiditate perspiciatis voluptates. Veniam vitae placeat ut aut placeat et. Maxime quos unde illo eius dolor et porro. Aut rem sit similique est dolorum modi. Aut voluptas nihil aut ullam. Explicabo voluptatem dolores porro dolores. Itaque qui similique odit incidunt. Quia sit consequatur hic labore. Explicabo distinctio ipsa exercitationem ut. Quae ratione voluptatibus possimus quia.', 4, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(643255, 'Est cumque nulla quo voluptate est.', 'Id qui dolorem ea alias nihil veniam. Commodi blanditiis in commodi qui distinctio in inventore. Aut magnam aspernatur sed omnis ipsum in qui. Fugit ipsa sunt adipisci totam enim non sed. Vero dolor quas cum voluptatem deleniti in. Non quos ut dolor molestiae. Eum ex voluptas et dignissimos. Consectetur veritatis aut ipsa officiis inventore. Dolor eaque sapiente cupiditate ea in voluptas eos. Voluptates vero neque ipsum commodi sint. Itaque est consequatur tenetur excepturi omnis omnis. Maiores magnam non autem in. Ad totam veritatis accusantium et. Quos eveniet quia quae doloremque. Molestias perspiciatis ut et. Fugiat maiores iste et libero exercitationem deleniti. Sint aut earum ex quo alias. Architecto dolorem sint cupiditate animi vel vero ut. Quae harum voluptatem eaque ipsa rerum. Similique nesciunt doloribus quasi. Deserunt aut unde rem unde quasi magnam totam. Aliquam harum inventore odio eligendi. Natus minima expedita et a in ut vero. Eveniet nobis fuga maxime excepturi asperiores ad repudiandae dolorem. Non quis consequatur dolores. Illum animi soluta iure aut. Reiciendis dolores quae porro iure dignissimos quia quos ex. Fugit itaque voluptatibus aperiam.', 165, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(644978, 'Consequatur architecto sed deleniti debitis.', 'Animi est ab sint cupiditate perspiciatis. Iusto beatae quia excepturi dignissimos. Ducimus error numquam atque dolor dolor mollitia. Vel amet voluptatibus pariatur aut amet officia. Sapiente quas harum explicabo et est. Quis beatae debitis accusantium provident ipsa quas velit. Aut sint voluptate modi ea cum accusamus. Repudiandae labore delectus odit ipsa vero. Animi neque nulla corrupti veniam ut voluptatem. Incidunt veniam omnis corporis quia porro error sapiente. Tempora laboriosam unde reprehenderit officiis est repellat sunt. Culpa dignissimos et deserunt ad neque quia aut. Impedit quae et deleniti voluptatem dolore. Laboriosam beatae et ab qui optio reiciendis aut. Ut molestiae vero incidunt. Explicabo praesentium quasi animi nobis dolor. Consequatur odio voluptas consequatur quia sequi optio. Placeat ut laudantium reprehenderit voluptatem exercitationem. Eum minus impedit iste libero maxime. Unde aut perferendis sint voluptatibus est.', 155, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(645396, 'Hic reiciendis ad quia optio quae.', 'Occaecati excepturi rerum ipsa voluptates. Voluptatem ipsam molestias quod tenetur natus veniam ut. Veniam est omnis facere nisi porro aliquid. Ducimus distinctio architecto maiores voluptatem. Quidem modi beatae molestias sed. Ipsa sunt dolores similique deserunt aliquid aut placeat. Libero natus quia nulla ea officiis. Laudantium labore est autem necessitatibus placeat odit harum. Vero autem suscipit aut aspernatur nisi. Quisquam accusamus odit tempora et ad. Id aut dolorem aut molestias perspiciatis. Repudiandae dolore sapiente laudantium nulla est ducimus. Est et amet illo consequatur consequatur. Facilis ipsam nihil possimus consectetur qui blanditiis rerum aspernatur. Eos qui tempore dolore. Labore dolore qui nam eius sunt.', 68, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(652023, 'Hic amet consequatur consequatur laborum.', 'Porro temporibus maxime sapiente odit. Velit at odio vitae voluptatem tempore. Consequuntur sit suscipit distinctio inventore earum nesciunt praesentium. Et quia reiciendis quis. Necessitatibus eaque nobis fugit illum similique quia. Voluptate ut pariatur qui repellendus. Ducimus quisquam ipsum ut. Laudantium fugit sit qui quod ut. Qui ad blanditiis consequatur non. Voluptates dolorem facilis voluptatem at facilis ea consequuntur. Sed enim itaque aspernatur quo esse. Explicabo repellendus molestiae quaerat perferendis numquam. Autem sint ab cum sed doloribus provident quia natus. Consectetur qui dicta dignissimos fugit sed dolorem sint. Sed ratione officiis quis cum. Fugiat excepturi est officiis. Soluta et dolores repellat asperiores voluptas. Quas fuga odio nostrum dolorem. Vitae est quis sit sint repellat iure quis. Qui et ex eius placeat veniam soluta voluptatum. At molestiae sapiente at odio sit esse. Occaecati eveniet aut error eaque illum quaerat. Consequatur natus autem fugit qui distinctio velit quia. Blanditiis provident deserunt doloremque alias fuga molestiae delectus. Dolor fuga tempore asperiores. Sint blanditiis consequatur reiciendis qui.', 146, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(657168, 'Impedit sit ea vitae et quas perspiciatis.', 'Natus dolor modi ut molestiae non doloribus sed. Ut quidem aut rerum minus quae. Aut ut excepturi voluptas quia. Et architecto repellendus ea. Et quam eum dolore sed omnis natus et. Tempora asperiores rerum maxime voluptatem dolores aliquid non. Porro nemo ullam perspiciatis omnis consequuntur veritatis quis. Ut est beatae aut id nemo natus aut aperiam. Harum maxime rerum itaque sunt. Itaque necessitatibus quia ipsum quisquam est saepe est. Aut molestiae nihil ipsam sunt. Est perspiciatis et id nostrum ipsum ducimus. Quia aut eligendi ut consequuntur voluptas aliquid. Aut incidunt repellat repellendus exercitationem. Sit eligendi reiciendis dolores ad dolore.', 152, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(659977, 'Sint repellat in corrupti eveniet est aut.', 'Qui incidunt error nobis architecto qui nisi. Nulla voluptatem qui et atque eos nisi molestiae. Occaecati ut repudiandae quidem. Hic sit earum distinctio est magni et. Repudiandae et optio voluptate cum omnis repellendus. Natus sequi iusto quo sit minima id at. Ea dolorum qui in dicta quia. Eaque voluptas id nulla officia delectus quod. Iure repudiandae dolorum et et quod id maiores. Ipsam impedit minima sequi debitis ducimus quam. Eum est quibusdam quia eum nemo quam similique. Qui autem porro eos non qui et. Ea velit nesciunt et dignissimos eos. Nam vero eum eum cum. Aut aut atque sed velit. Odit aut debitis expedita maiores voluptas provident. Voluptatem veniam cumque ut eaque magni ratione. Eos dolorem sint et molestiae iste praesentium iure. Sed dolorum dignissimos dolor qui corrupti. Aut dignissimos quisquam tempora a. Neque rerum nam dolores possimus qui ipsam. Dolores iure voluptatibus vero eos pariatur et aut. Et error amet voluptates nihil aspernatur non et. Et aut minima pariatur veniam blanditiis dolor. Explicabo sapiente ea vel sint. Minima et beatae voluptas distinctio. Omnis perspiciatis nihil laudantium deserunt omnis ipsam assumenda. In aliquam et sunt ut repellat mollitia aut.', 60, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(662463, 'Qui minus at tempora perspiciatis.', 'Rerum unde aut possimus iusto illum praesentium in. Tenetur itaque dicta quae rem aliquid qui. Ut itaque sequi reiciendis itaque consequatur animi vero. Sit minus quam illo molestiae. Voluptatem earum esse quia quod itaque. In minima assumenda ab quidem ipsam rerum. Est at vel rem sit necessitatibus laudantium. Quia eum vel corporis doloremque vero laudantium quia. Blanditiis modi magnam accusantium qui enim recusandae. Quia recusandae mollitia enim eius quis. Ut rem cum labore deleniti sit. Perferendis omnis fugit ut qui itaque vel hic. Corporis fuga in quidem totam delectus aut nemo. Voluptas iure rerum ea pariatur porro dicta est. Mollitia alias dicta ipsum ut magnam quod. At est eos voluptatem exercitationem. Omnis est est id quos blanditiis. Asperiores sint assumenda id fugiat soluta nulla.', 20, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(665582, 'Voluptatum qui voluptas laboriosam mollitia.', 'Voluptate ea ex molestiae neque id quis quam. Aperiam maiores adipisci amet sint sed. Laudantium vero ipsa iure. Nulla rerum magnam possimus. Eligendi dolor iusto iste eius molestiae. Voluptas dolorum soluta qui earum ipsam. Vel laudantium tempore nam sapiente. Tenetur tenetur odit voluptatem dolores quam facere. Quis voluptate inventore quidem est eaque ipsum voluptatum. Accusamus ipsa quae et aut nulla cupiditate. Sint et et repudiandae eveniet dolorem officiis. Corporis sit tempora sint odit ad ut. Qui et itaque omnis a sit temporibus distinctio. Aut molestiae nihil doloremque illum vitae recusandae eos. Id harum et dolorem. Fugit distinctio quos enim sit optio. Totam dignissimos quo vero est non quod. Et omnis ipsa illum eos velit exercitationem. Nam molestias exercitationem iste fuga similique eius. Ut sint quam ab quia eveniet debitis totam totam. Aut illo impedit iusto sunt facilis autem. Magni porro beatae inventore exercitationem. Accusamus sint quia nihil et in similique quibusdam. Aut reprehenderit neque voluptatem repellendus dolor et explicabo. Quis dolor praesentium sit deserunt. Placeat ratione mollitia ut quibusdam commodi ad labore pariatur. Nihil exercitationem laboriosam aperiam. Itaque ut consectetur vel quis.', 122, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(668177, 'Sed id eum et.', 'Ipsum dolores vitae aut voluptatum est enim dolores officia. Sit recusandae reiciendis quia reiciendis. Distinctio autem corporis eius fuga vel ex. Illum sed repellat dolorem in velit voluptatem. Delectus sed deleniti ut corrupti unde culpa similique commodi. Velit ipsam blanditiis et rem odit similique voluptates quas. In ea at quia et ut. Architecto velit officiis facilis vel blanditiis. Voluptas et soluta aut eos voluptatem. Molestiae autem neque quasi odit. Et recusandae asperiores dolorem recusandae deserunt. Quisquam est eveniet dicta expedita et repellendus aut. Quidem quam nobis quidem at. Voluptatem molestiae ea numquam facere ducimus. Dicta vel rem quia enim mollitia quaerat. Id omnis quae velit odit. Consectetur et pariatur velit asperiores perferendis. Amet qui animi repellat recusandae magnam sit veritatis. Sunt rerum commodi officiis aut est dolor ipsa. Rerum accusamus explicabo qui error expedita corrupti. Autem omnis fugit sequi quae. Cupiditate voluptas odit aliquam odit aut cum. Necessitatibus porro aut adipisci fuga. Nihil quia dolor quidem odit ut vitae quibusdam. Dolorem dignissimos voluptatum et provident quidem autem ex. Sunt sunt non est deleniti ducimus. Enim inventore dolorem reiciendis qui. Laudantium assumenda quas quia voluptatibus quos voluptatem. Unde placeat ab quia quam.', 2, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(669964, 'Et eum unde itaque.', 'Dolorum sequi molestias dignissimos tenetur impedit. Rem voluptatibus quo dolores quas ipsum. Aut nam quisquam tenetur qui. Rerum maiores quasi consectetur quam excepturi incidunt. Est sint fugit dolores doloribus. Esse et perferendis soluta hic vero ipsa. Sed et occaecati consequuntur hic magnam fuga. Officiis ut distinctio porro ratione blanditiis. Reiciendis soluta ratione temporibus quia ut commodi. Commodi omnis fugiat ab fugit autem repudiandae ducimus. Et enim perspiciatis numquam qui. Unde amet voluptas voluptatem blanditiis. Totam nostrum et qui. Dignissimos harum qui assumenda aut vel. Molestias iste harum unde sequi dolore amet autem. Corporis nihil in omnis eos quidem architecto illo. Sapiente non sit velit voluptatum et esse. Molestiae molestiae maxime similique amet. Molestiae fugit id tempora ut. Odit et id itaque error eum sint rerum. Assumenda aut cum dolor velit. Voluptatem totam ut at quas tenetur. Repellat voluptatum magnam est. Et voluptas minus voluptatem eligendi quia provident.', 147, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(672724, 'Illo totam facilis et ex voluptatibus.', 'Facere accusantium autem cupiditate non at et. Necessitatibus laboriosam eum ullam repellendus. Qui vitae nemo quia veniam modi quo. Quisquam totam doloribus perspiciatis delectus alias officia reiciendis. Distinctio suscipit molestiae illum. Perspiciatis qui qui voluptate eveniet maiores. Et sapiente natus qui laboriosam similique. Non vero qui deleniti veritatis. Quis eveniet ex et sequi maxime et impedit ad. Vero iure aspernatur officia deserunt sequi et est. Dolores atque quidem perspiciatis excepturi. Omnis est et ipsum velit fuga totam. Sed repellat quis magni dignissimos earum magnam temporibus in.', 135, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(676991, 'Molestiae aut excepturi voluptates atque est nemo qui.', 'Possimus ab accusamus alias qui dolores et. Natus quia iusto dolor minima qui. Quae et a a aliquid inventore dolor nulla. Et voluptatem laudantium laborum dolores eum dolor deleniti. Laborum quis dicta quia ut. Dolores iste ipsa voluptas ex at. Voluptas est natus nisi doloremque ea quis. Natus est voluptas voluptates ipsam ex consequatur. Consequatur unde illo iste cumque quia sint. A sit similique odio qui quas dolores adipisci consectetur. Voluptate sit doloremque accusamus animi iste vel. Non rerum impedit autem architecto. Natus mollitia est nostrum est maiores. Enim quas laudantium assumenda delectus incidunt iusto quo. Est quia nihil beatae eum eveniet ea aut aut. Voluptate aut enim dolores dignissimos accusamus officia quia. Cumque quo aut explicabo odio fugit occaecati qui.', 111, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(681016, 'Ut et earum tempore praesentium.', 'Tempora rem magnam saepe quae aperiam. Nihil sint corrupti est necessitatibus. Vel numquam et quaerat aut sint. Mollitia et vel voluptatem qui omnis. Odio quia labore dolores iusto amet. Dolorem aut vel magnam consequatur quidem. Eius aut sed illo et et. A dolorum ut qui ullam perferendis incidunt. Repellat libero vitae dolorum. Molestias ut quisquam ipsam suscipit quia beatae fugiat. Consequatur nisi velit aut fugiat soluta. Quia voluptas non vero et facilis. Quo itaque eaque in sequi libero voluptatibus praesentium. Sequi et laborum itaque repellat ea atque est. Alias fugiat praesentium ullam facilis. Quos nihil nobis reprehenderit qui sed qui magnam.', 76, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(684409, 'Sit sit voluptas ut quisquam magni.', 'Consequatur ullam odit quae rem sit quidem sunt. In dolore eum eaque quia. Consequuntur quaerat distinctio suscipit voluptas. Quos maxime consequatur molestias. Maxime quae et eaque itaque accusamus. Consequatur ut ullam id magnam esse ducimus libero sed. Maxime et quia et veniam veritatis. Iste consectetur dolor itaque molestias voluptatem id vel. Qui perspiciatis dolores officia aut. Qui fuga id quisquam pariatur voluptas aut neque. Ut accusamus molestiae commodi voluptas. Voluptatum sed minima earum culpa mollitia. Eius dicta nisi magni rerum et id ducimus rerum. Vitae beatae porro corrupti rerum pariatur voluptas. Et ea sed sit ducimus necessitatibus molestias enim. Maiores vel nam consequatur. Aliquam nisi quidem et est qui sit fugit. Molestiae quos nisi culpa vel. Amet mollitia rerum sequi magni sunt. Aut sit et perferendis incidunt. Cupiditate sed rerum enim tempora qui ut magnam aspernatur. Consequuntur repudiandae qui atque et voluptas repellat sit. Maiores maiores est reprehenderit est non. Minima animi est vero et neque eius dolorum. Enim et laborum dolorem aut aut facilis. Autem non animi blanditiis sunt ut maxime qui sunt.', 127, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(684541, 'Cum omnis cumque quod voluptatem.', 'Repudiandae ea illum odio natus et. Explicabo voluptatem quo ea rerum dicta. Architecto ratione voluptas autem ex culpa. Eos dolore voluptatum illum assumenda atque. Sed asperiores et error sunt sunt nulla ad voluptas. Eligendi eum alias modi. Est quaerat eos sint odio delectus nam. Voluptate quod laudantium qui optio nulla consequuntur. Ut sequi nisi id et quaerat omnis esse necessitatibus. Maxime beatae sequi soluta aut quia. Et dolore excepturi ullam aut autem tenetur ut. Sapiente et dolores molestiae nihil et quia consequatur. Velit exercitationem voluptas voluptatibus aliquam aliquid. Incidunt dignissimos laborum asperiores quia numquam eaque.', 72, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(687935, 'Autem omnis quis nobis harum esse dolor et reiciendis.', 'Omnis voluptas numquam nulla velit. Quasi voluptatem iure et est quae quae ut quas. Et libero eveniet qui qui. Quasi id dicta vitae eos veniam sit. Soluta qui quis et voluptas. Quidem numquam doloremque soluta repellendus eveniet commodi sequi. Quia a ab officiis in rem. Omnis accusantium dolore earum consequatur eum. Earum optio autem et sequi quod nisi quia. Aspernatur exercitationem itaque facilis suscipit repellat. Eius et sed dolor fugiat. Cum aspernatur est quisquam sit. Est perferendis quo omnis molestiae similique. A nemo dolores et consectetur inventore consectetur. Magnam et perferendis iusto ullam aut soluta. Voluptatibus iure molestiae eum eligendi animi ullam asperiores. Cum iure nam quis magnam placeat id laboriosam est. Fugiat rerum quae iusto facere sequi. Ut possimus libero vero. Aut ipsam odit in similique quia dolores. Facere quam omnis quae perferendis magni nostrum. Dolores qui tempora eius et nam. In autem quas numquam voluptas. Perferendis illum non magni.', 158, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(688869, 'Voluptas fuga delectus aspernatur ut.', 'Corrupti voluptatibus eos rem quam est. Nihil repellendus modi voluptatem. Aut fuga et cum. Molestiae accusantium commodi illum. Molestias debitis ut saepe eum nihil magni eius. Recusandae neque accusantium laboriosam repudiandae exercitationem. Placeat debitis molestias totam pariatur similique. Laborum rerum libero nesciunt est minima omnis illum saepe. Reprehenderit ad quaerat dolorem distinctio optio illo voluptatem. Qui officia aliquam officia consequatur nostrum. Voluptatibus voluptate velit enim ea. Voluptatem voluptas ut ratione in minus. Officiis nesciunt in commodi sed. Dolores qui earum distinctio ex. Repellat consequatur omnis adipisci aliquid dignissimos praesentium. A aut id blanditiis corrupti ea vitae enim debitis. Ab aut dolore optio est. Quia iusto est consequatur facilis aspernatur omnis consequatur. Sunt recusandae beatae et sed eveniet sit. Quis dolores sunt neque. Ut repellat voluptatem aliquid aut minus ex quo voluptas. Quo molestias consectetur aspernatur distinctio aut quis. Nesciunt voluptas aut quo unde qui quam rerum. Molestiae sapiente beatae blanditiis quibusdam reiciendis. Minima voluptates doloremque quod expedita accusamus recusandae. Eveniet voluptatibus voluptas asperiores adipisci dolorem dolorum explicabo. Ex non ut sed et aut ut. Sed quis hic et odit et dolorem vero voluptatem.', 110, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(692778, 'Tempore voluptates ea molestiae quos sed et.', 'Cum eum explicabo et. Nesciunt et aspernatur non sint impedit. Tempora quos sed dicta. In assumenda doloribus labore officiis. Ullam et voluptatem et ullam est. Labore magni aut excepturi officia repellat perspiciatis. Et molestiae alias aut iure voluptas quidem nulla sed. Laboriosam ex eos aliquam. Voluptatum consequatur fuga culpa deleniti nulla est. Animi maxime at nisi ducimus soluta sunt perferendis. Culpa sequi non veniam velit non id quaerat. Quia non minima voluptates magni. Voluptatem vel eum sed amet. Nulla dolor aliquam unde voluptatem. Commodi quidem accusamus nam dolor veritatis est ut et. Labore eligendi fugiat et iusto excepturi natus officiis. Et eum laborum quaerat quo non placeat facere enim. Cumque voluptatem nam maxime unde expedita. Optio id possimus expedita eum est a accusamus. Velit commodi voluptates libero quia voluptatem amet laborum. Tempora dolore dolor beatae ut. Vel sunt quidem non fugiat optio et. Possimus recusandae voluptates facilis qui. Saepe consequatur error labore laborum rerum ipsam pariatur. Quia est itaque et.', 39, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(696967, 'Rerum rem praesentium quo adipisci tempore.', 'Officia asperiores molestiae facilis esse quibusdam earum. Qui non placeat veritatis aut qui laborum. Aut at facilis voluptatibus repellat cum esse. Quia quis molestias sit autem omnis aut totam. Quis numquam architecto itaque laboriosam molestiae et. Porro recusandae expedita consequatur sit iste inventore. Voluptatem voluptatem voluptatem voluptatem dolorem. Ex possimus nesciunt quod veritatis officia in. Vero deleniti dolorum qui amet. Consequatur adipisci aut velit dolores. Voluptas eos veritatis qui esse similique quo et. Laudantium veritatis expedita dolorum quibusdam est et. Sint sunt odio aut consequuntur aut pariatur. Veritatis non quos et.', 55, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2);
INSERT INTO `forum_posts` (`id`, `title`, `body`, `user_id`, `created_at`, `updated_at`, `categorys_id`) VALUES
(697106, 'A cumque provident esse debitis rerum cum optio.', 'Voluptatum voluptatem nulla repellendus porro. Rerum ut facere sapiente aliquam natus officia commodi. Magni ducimus nobis reiciendis et perspiciatis. Voluptas aut necessitatibus vero. Voluptates alias at voluptatem illo et. Est doloremque ex illo a. Debitis nesciunt pariatur eum similique quo nemo. Beatae error est quo animi. Velit sint aliquid possimus explicabo cumque quia. Quidem quos amet voluptatem officiis doloremque id voluptate saepe. Et qui impedit aut similique dolorem. A quia exercitationem quam voluptatem non voluptatibus. Alias dolores sed ut eum. Laboriosam praesentium omnis voluptas dolores. Sapiente reiciendis nisi quia eligendi sint voluptatem nulla. Accusantium accusantium perspiciatis quaerat ut tempora non nihil. Quaerat molestiae et natus occaecati blanditiis. Nisi repellat magnam optio deleniti qui laborum. Sit exercitationem doloremque exercitationem consequuntur quisquam. Natus consectetur perferendis optio nobis autem dolor voluptatum. Itaque voluptates quia alias voluptatum saepe. Neque iusto vero et aut et nemo. Quae iusto velit tenetur ab facilis accusamus.', 79, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(698929, 'Dignissimos enim sunt quia aut.', 'Doloribus aliquam ipsam sint dicta. Voluptatum autem tempore facilis nobis ut est sunt. Voluptatem eius sint ut ea at velit. Dignissimos quas quisquam consequatur libero ullam atque qui deleniti. Tempora dolor molestias quia iusto earum in. Id consequatur quam sapiente. Et dolor consequuntur sapiente voluptatibus ea qui. Totam est deserunt rerum eum adipisci. Sed aut perferendis numquam quo. Nisi amet qui et nemo odio est officiis nemo. Voluptatem non laborum sunt hic assumenda quaerat. Sapiente et aliquam eum. Odit provident laborum dolorum perferendis et magni ipsa molestiae. Ab autem nihil mollitia. Enim ea minima blanditiis dolorum qui voluptatem. Fugiat eos est ut ipsam et. Voluptatibus pariatur hic voluptates qui voluptatibus. Vitae odit quidem dolorum placeat. Sunt sequi nemo fuga alias tenetur. Porro natus aut cum. Aut quis tenetur ea eos rerum qui. Assumenda veritatis vero perferendis nulla. Vero eos veniam veniam deleniti. Commodi consequuntur quia minima aperiam reiciendis. Mollitia quia labore illum. Placeat rerum qui praesentium.', 10, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(703327, 'Dicta id repellendus quisquam voluptates.', 'Exercitationem repudiandae voluptatem esse mollitia. Placeat ut dolores neque est rerum dolores in. Inventore possimus velit fugiat aspernatur saepe. Officia optio est saepe in harum. Doloribus odit eum expedita qui delectus laboriosam qui. Repellat dicta atque aspernatur qui itaque numquam voluptas. Dolorem earum atque vel cupiditate. Hic quidem nesciunt incidunt voluptas. Porro enim a excepturi et voluptas exercitationem. Numquam illo consequatur saepe nihil. Qui repellendus magnam quae nostrum. Harum accusantium fuga tempora voluptates rerum labore. Ut officiis et vel natus. Nihil quae molestiae qui consectetur autem sit. Dignissimos illum commodi iste. Fugit voluptatum autem unde. Qui porro accusamus aperiam quibusdam possimus. Eum ut veritatis placeat aut ipsum culpa ea quia. Aliquam error facilis impedit. Quam maxime et et. Nobis animi mollitia quia magni quo. Pariatur corrupti ut corporis consequatur ea velit. Rerum culpa labore recusandae sunt vel ratione. Temporibus explicabo alias natus impedit minima molestiae.', 6, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(709306, 'Voluptatem ipsam in qui ea dolor ea possimus.', 'Minus illum vero ad repudiandae praesentium sequi. Ab dolorem dolores laboriosam impedit aut beatae et eligendi. Dicta quaerat non atque error harum enim possimus. Voluptatem praesentium cum omnis dolore atque doloremque. Consequatur ducimus dolores praesentium sed sit architecto eius dolor. Numquam ea nihil consectetur et non accusantium id quasi. Perferendis odio quas possimus nam labore. Distinctio nesciunt quibusdam consequatur aut harum officiis. Sapiente ut consequatur voluptatem nesciunt qui ut. Aperiam tempora eum consequuntur quae dolorum autem dicta. Autem odio occaecati hic delectus corporis. Et et molestiae velit repudiandae aut. Sequi cum distinctio explicabo quis voluptas. Dolores et ut totam accusamus et explicabo illo. Corporis veniam suscipit debitis. Doloribus atque quidem voluptas earum nulla sed corrupti voluptatem. Pariatur qui soluta facilis ab et. Sed veniam ut sequi amet. Minima quia quasi perferendis non eligendi dolores architecto autem. Id blanditiis quia quos optio et modi rerum quaerat. Molestias necessitatibus error sed sed odio. Vel quaerat et qui neque. Ea laudantium tempora voluptatem dolores voluptas quia. Quos in at eaque dolor.', 70, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(719184, 'Rerum cumque numquam ratione molestiae temporibus laborum.', 'Minima maiores quidem dolorem officia aut. Libero distinctio dolorem saepe commodi sapiente veritatis a animi. Earum aspernatur ut mollitia animi. Est amet impedit placeat et sint iure veritatis molestiae. Blanditiis rerum vero voluptate. Aut hic velit aspernatur cum vero voluptates quod. Iusto et minima minus sint dolores qui. Ut deleniti accusantium voluptas sapiente eius veniam dolorem neque. Aspernatur blanditiis qui quo nostrum voluptatem facere cupiditate earum. Soluta eos id magnam sit nihil quam nulla. Sit consequatur delectus enim sint. Quis veritatis facere illum. Cupiditate minima voluptatem facere laudantium. Laborum non ratione et laboriosam veritatis cum. Id qui earum perspiciatis molestiae. Ut et eum voluptates. Dignissimos ea unde consequatur qui. Sunt accusamus rem voluptate ullam et. Quia deserunt odit qui pariatur quasi. Nihil et delectus cumque. Fugiat porro tempore voluptatibus error aut. Aut est ea adipisci ratione. Velit minus et pariatur iusto. Quae sed molestias illum non pariatur.', 63, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(721863, 'Et ab exercitationem laboriosam voluptatibus eveniet.', 'Quae ducimus enim nemo placeat reiciendis modi dolorum. In enim alias ex quidem magni animi. Voluptatem perspiciatis necessitatibus ut autem. Voluptas id numquam quo ad rerum iure. Dolor quidem est odio sit pariatur. Occaecati ut vitae architecto error quo quam eius quia. Sequi aut voluptate voluptatem et est consequuntur. Quisquam officia necessitatibus id voluptate. Eaque similique iste dolores ut. Aut quam ut vel a et. Quia ut nemo illo dolorem atque et. Totam vitae quaerat praesentium et. Autem totam iusto ullam fuga. Delectus et odio aperiam. Aut repellendus pariatur facere ut perspiciatis facilis sint. Aut tempore nesciunt earum soluta quis excepturi saepe officiis. Consequatur repellendus aut cumque dolore laboriosam deleniti at. Consequatur est et vel aspernatur in. Pariatur animi tempora et laborum quo molestiae. Est laborum suscipit facilis modi est. Unde et et incidunt perspiciatis dolorem voluptate. Quisquam praesentium officiis officiis officia eos aliquid quos. Id architecto veritatis ad corporis aliquid error placeat.', 180, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(724055, 'Aliquam aut deserunt saepe tempore ducimus ut.', 'Est molestiae quis enim quae aliquam accusantium aut. Ut dolorem corrupti voluptatem qui. Odit rerum laboriosam incidunt voluptates quasi fugiat. Quibusdam consequatur placeat non inventore sunt beatae ut. Delectus praesentium eum eos doloremque necessitatibus consectetur voluptatem. Ex a officiis autem qui aperiam odit velit. Rerum ut numquam debitis ut aut recusandae enim. Ipsam beatae est veritatis assumenda iste fugiat. Aperiam nemo eos sit nostrum exercitationem. Consequatur quasi minima libero iusto molestiae accusantium iure. Corrupti odio dolorem dolores non. Doloribus ut quasi totam labore. Quos et natus dolorum qui et. Commodi omnis eius placeat deleniti quod sed quia. Autem harum cupiditate consequatur cumque veniam necessitatibus. Sed voluptatum non assumenda cumque. Eos et enim saepe. Ea voluptas repellat perferendis id in numquam. Ut quidem vel unde exercitationem. Ea in aliquid veritatis ut est iure. Dolores doloremque ducimus voluptas ducimus esse non vero. Ut velit illo fugit temporibus corrupti labore nemo. Ipsam illo consequuntur velit. Possimus doloribus minima eos rerum enim. Ut error blanditiis consequatur alias omnis assumenda laudantium.', 59, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(724756, 'Explicabo molestiae quis eos voluptatibus nesciunt cumque molestiae recusandae.', 'Ratione sit consectetur sit provident quo. Delectus facere provident aut id accusamus nam. Molestiae ex sapiente atque quis autem exercitationem totam. Non velit laudantium consequuntur repellendus magni omnis. Eum consequatur blanditiis dolores voluptatem. Magni voluptates dicta ea explicabo laborum id dolore. Et quia quo odit deleniti provident. Ipsa omnis aliquam eaque optio corrupti sapiente. Hic sint sint saepe expedita nulla. Laudantium ea deserunt cum. Numquam amet in animi rem atque tenetur. Eum magni et consequatur similique. Ex eos vel fugiat adipisci molestias et.', 148, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(727803, 'Esse consectetur veniam corrupti sed quia aut.', 'Quaerat sed quia ut provident id exercitationem ad. Non eum laudantium quam exercitationem officiis debitis eos. Veniam nostrum rem fugiat alias omnis impedit. Molestiae ea aut ex qui ipsa. Numquam voluptatibus nobis aperiam omnis omnis ipsa nobis. Quam aliquam id provident necessitatibus numquam. Fuga sapiente vitae quaerat accusamus. Aut nobis accusamus eum voluptatem. Ut ut aut ut fuga fuga occaecati. Facilis quibusdam vitae incidunt omnis. Aspernatur optio impedit doloribus ea commodi et. Tempora aperiam recusandae rerum non natus iste optio recusandae. Debitis repellat commodi neque fugit molestiae culpa. Sunt odit consequatur dolor repellendus quasi enim. Ut suscipit et sint voluptas repellat nemo non. Illo rerum quia commodi quo autem officiis voluptatem.', 174, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(730866, 'Architecto qui explicabo voluptas quae occaecati quia.', 'Neque tempore ut dolore qui veniam. Dolores est illum dolorem magnam. Est voluptatibus consectetur ducimus quisquam. Laudantium aut ipsum hic fugit corporis voluptates. Nemo provident quis laborum saepe. Voluptates optio quasi ut perferendis veritatis. Debitis officia recusandae eum esse. Natus sit repellendus rerum dolores qui officiis doloremque. Quaerat nisi deleniti recusandae et qui vitae. Explicabo officia ullam quae totam necessitatibus. Aut facere facere quam est maxime. Qui voluptatem eos maiores tenetur sapiente distinctio. Eius illum voluptatem tempore cumque. Quia impedit similique harum consectetur hic modi. Ullam laudantium voluptatem corrupti recusandae ut non. Rem assumenda soluta ut a perspiciatis rerum. Voluptatibus vel repellendus magni dolores ducimus molestias velit. Dolorem saepe molestias qui ex perferendis. Ad reiciendis harum suscipit aut asperiores. Quis sunt voluptas optio amet porro numquam. Et aut enim qui inventore eius sunt nostrum nemo. Inventore sint est illum ut et natus. Dolorum corrupti odit unde molestiae adipisci tempora deleniti sapiente. Eveniet harum tenetur enim harum qui corporis.', 80, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(741213, 'Quis quibusdam qui laboriosam voluptatum.', 'Eveniet sapiente veritatis neque earum. Velit aspernatur iste iure perspiciatis distinctio dolorem quam. Ut ipsum sint totam debitis molestiae illo temporibus. Occaecati doloribus voluptas aut qui aut in. Fugit aspernatur omnis in ex et iste consectetur. Officiis recusandae placeat repellat in sunt assumenda autem. Fugit voluptates nihil hic voluptas ipsam. Reiciendis iste perferendis minima accusantium dolorum. Qui facilis quae sint ut. Repudiandae sit aspernatur repellendus cumque et ducimus laborum. Repellendus consequuntur nesciunt vel alias veritatis dolores qui. Sequi est commodi commodi laboriosam sunt aut ipsa eum. Soluta ipsum adipisci nesciunt velit. Enim incidunt officiis nihil saepe cupiditate quis nam aut. Ut rerum est ipsum sapiente eius aliquam similique. Sed qui voluptatem delectus id qui et aliquid. Neque voluptatem porro sed assumenda. Sed laudantium tenetur ex repellat possimus ut. Aliquid porro eos sed omnis. Illum ipsam iusto ad atque velit ut deserunt. Voluptatem eum mollitia consequatur. In quia sint molestias rerum dolor eveniet ut. Vitae quibusdam fugit ex cupiditate non et numquam. Quisquam laudantium molestiae quibusdam asperiores aut magni. Occaecati error ut provident quibusdam. Earum neque soluta modi aut et quae. Ut assumenda magni similique est veniam id dolor ipsum.', 8, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(749706, 'Qui ut laboriosam laboriosam.', 'Maiores consequuntur provident dolores dignissimos illum sint. Assumenda voluptas nisi dicta pariatur quasi quibusdam. Qui consectetur velit rerum voluptas eligendi tempora. Quo ab eligendi est unde corporis debitis. Et vitae et doloremque ut esse tempora explicabo. Rerum quis optio veniam. Culpa dolore eveniet quia eveniet eveniet animi atque ipsa. Et consequatur dolore et voluptas velit est debitis enim. Sit sunt qui provident molestias molestias eligendi. Et temporibus mollitia deleniti deleniti reiciendis provident ipsam. Beatae dolor temporibus enim sunt nam et ut sit. Aut velit occaecati assumenda corrupti. Minima et amet quod rerum officia corporis impedit placeat. Voluptas vitae pariatur sint. Velit officiis nihil blanditiis ratione itaque ea aut. Incidunt unde voluptatem et ut. Ut totam mollitia architecto modi voluptatem ipsam voluptas. Laborum dolorem occaecati eaque asperiores fugit. Voluptas sapiente praesentium voluptatem beatae excepturi consequatur. Eos dolores aut illum rerum. Aliquam eveniet veniam enim explicabo temporibus. Aliquam est quod exercitationem quasi quibusdam.', 157, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(760478, 'Ratione nobis repudiandae quas explicabo.', 'Maxime et nemo rerum minus voluptas nemo. Et et corporis repellendus qui inventore temporibus vitae. Ut quibusdam commodi iste voluptatem delectus doloremque hic. Molestiae nostrum nobis maxime velit eius consequuntur error debitis. Aut ut ratione voluptate at aperiam officiis repudiandae odit. Ducimus assumenda similique cum quas non. Voluptate eaque delectus ipsa consequatur ratione dicta dignissimos dolor. Delectus id sapiente in quisquam et cum. Quam ut assumenda autem exercitationem et numquam est. Et ducimus beatae corporis aliquid aut. Officiis accusantium sequi et atque eum ab rerum. Quae debitis error excepturi impedit facere sit. Sint in quidem consequatur voluptas. Eos eaque quisquam dolore magni. Ea repellat dolor quos voluptatem modi eos eum rerum. Sint aut eius et voluptas ullam ut soluta. Neque et sunt voluptates voluptas modi ut libero. Neque ea vel veniam. Ea impedit rem et occaecati eius optio modi. Consequatur et autem sed aut sed explicabo deleniti. Nobis voluptates a aliquid. Impedit autem aliquam similique ipsa commodi. Voluptatem suscipit est mollitia molestiae accusantium tenetur ratione rerum.', 190, '2023-03-02 06:52:13', '2023-03-02 06:52:13', 3),
(768854, 'Voluptatem veritatis officiis aut.', 'Et enim qui eos ipsam optio esse. Doloremque eos minima est explicabo aut incidunt eius. Nam temporibus possimus soluta explicabo accusamus. Voluptates ut nihil nesciunt qui neque aut. Commodi harum porro quasi eius. Nesciunt debitis voluptatem non illo debitis officiis dolor unde. Illo soluta delectus architecto ut eos ipsam ipsum. Suscipit enim distinctio optio commodi eos. Illo aut quaerat necessitatibus soluta ut. At enim dignissimos voluptatibus autem aut facere eos. Eaque labore unde cumque voluptas alias. Odio soluta enim facere rem ipsam blanditiis ex omnis. Quisquam voluptate ut adipisci vitae quia. Dolorem et vel facere autem inventore illum inventore. Quasi eligendi aut quibusdam omnis laboriosam delectus. Officia necessitatibus dolor eum laudantium cum porro. Cum quas veritatis quod quidem. Ut sit praesentium rem qui quos culpa. Animi assumenda ut commodi inventore odio quis. Repellendus aut aut tempore. Explicabo a exercitationem quae modi commodi. Cumque nostrum blanditiis aut et. Molestias velit sed nihil numquam consequatur nihil distinctio doloremque. Sit reiciendis consequatur dolorem assumenda ad. Possimus quod aperiam ea est. Sunt id doloribus est sit quo blanditiis.', 141, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(775459, 'Enim optio odit quasi fugiat officia distinctio sit.', 'In maiores impedit nobis quo molestias sint. Aspernatur est corporis et totam. Quo ut sed nobis accusantium amet. Qui enim et qui ratione voluptatibus in. Sapiente magnam placeat molestiae ipsa. Odit omnis facilis suscipit iste sunt. Necessitatibus quos sed optio sint praesentium. Et autem quaerat ut iste. Iusto ipsam sapiente cumque voluptatibus aspernatur. Est recusandae tempora dolorem vitae impedit quo illo. Placeat ut nihil reiciendis molestiae. Eius ea et consequatur dolorem possimus consequatur voluptas. Facere sit et hic neque commodi labore. Voluptate earum illum nobis qui dignissimos cumque. Eveniet quidem qui quia voluptatem. Soluta dolorem sit dolores. Repellendus voluptas beatae velit aliquid asperiores. Rerum optio nobis aut sapiente error. Laborum quo fuga qui nesciunt. Omnis temporibus porro odio voluptatem sint. Eos ut ex natus quam sapiente sed. Quis voluptatibus ut ut iste. Repudiandae ut sed animi est eos dolor. Ut in asperiores consequuntur voluptas culpa velit.', 104, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(784475, 'Qui rerum voluptatem est facere amet.', 'Quo quidem quasi dolorum perferendis provident. Ut veritatis voluptatem autem est autem totam qui. Qui architecto sunt sit fuga sit inventore vel quasi. Molestiae ea quasi voluptatem reiciendis minima doloribus. Molestias quae architecto magni sunt. Numquam eum corporis ut incidunt veniam. Sapiente similique sequi facilis fugit. Nostrum cumque nemo fugit id aut quas tempora ad. Consectetur at error aut accusamus voluptate molestias accusamus qui. Animi fugiat suscipit laudantium autem ea. Et voluptate eos aliquam est aliquam error. Aspernatur beatae dolorum eos asperiores ut. Sit illum hic et aliquam quod sint. Id voluptatem natus corrupti id. Consequuntur architecto omnis rerum omnis neque aut. Necessitatibus deleniti qui doloribus voluptatem nobis inventore eos. Eaque totam quibusdam cupiditate provident. Aut facilis et odit. Minus similique tenetur consequatur iure laudantium.', 11, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(786060, 'Illum quisquam explicabo commodi rem est dolorem sit sed.', 'Vel qui neque cupiditate quo non amet qui. Quas autem et placeat est nam quo non. Adipisci dolor sint illum. Nobis maxime corrupti quo aut voluptas. Ipsum dicta odit accusantium possimus quis animi. Et velit vero dolores beatae quibusdam autem. Autem aut rerum et perferendis iste eius ut. Eius aut quae ex quidem aut omnis rerum. Impedit recusandae hic et labore amet qui. Dignissimos iste labore totam suscipit voluptatem. Repellat sequi tempora vel sunt porro saepe. Rerum recusandae ea dolores hic sit beatae non. Error voluptas nulla labore voluptatem alias est ut repellendus. Et officiis dicta ut omnis dolores ut. Praesentium ut molestiae cupiditate expedita. Sed est sed expedita in est tenetur. Perspiciatis fuga aut aliquam possimus culpa. At minus et voluptates perspiciatis. Ducimus iusto aut architecto dolor. Voluptatum omnis dolores et nihil quo non et. Sint voluptatum sed sint eaque reiciendis est. Autem accusamus et magnam libero. Repellendus consequatur velit sed et voluptate excepturi pariatur ut. Est aut nostrum corporis nihil eveniet eum minima. Animi quia earum qui dolores sint dolores sunt.', 69, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(795457, 'Aliquid non consequatur quis est.', 'Omnis voluptas repellat ducimus mollitia magni suscipit. Laudantium assumenda ratione tempora. Minima non numquam itaque incidunt. Occaecati voluptas quae sed. Cupiditate ut recusandae ad ipsam. Consequatur culpa et vero quasi. Velit alias quia deserunt. Aut nulla neque ad dolores consectetur fugit atque. Porro nam iure rerum nostrum illo totam perspiciatis. Illum deserunt non blanditiis exercitationem facere est. Aut voluptas impedit et fugit minima. Aliquam et aut est. Et non est unde. Provident voluptate quibusdam in. Sed natus veritatis dolor magnam et id. Tempora repellat excepturi cupiditate laboriosam. Et nostrum sit harum. Fuga rem quas dolores accusantium. Voluptatem architecto commodi corrupti ad debitis architecto. Ea quis amet voluptates placeat ut.', 40, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(798378, 'Voluptate iure cumque harum delectus dolorum excepturi.', 'Voluptatem et vel quia ex minima cupiditate et sunt. Saepe aliquid vel perferendis magni harum vel. Autem itaque soluta cumque distinctio sed. Mollitia corporis sed temporibus saepe eum recusandae. Itaque explicabo ut aut et. In sapiente harum cum et minima inventore rem. Beatae optio est similique pariatur adipisci provident consequuntur dignissimos. Qui quaerat harum quis minima veritatis eaque eius. Earum et rem quibusdam exercitationem consequatur dolorem non. Enim et neque minima excepturi quasi nobis. Eaque quam qui et quia excepturi. Impedit aut quia qui culpa velit. Ducimus temporibus aperiam animi culpa adipisci exercitationem. Magni vero autem rem magnam. Ipsam ea et sed itaque earum nemo quaerat. Qui pariatur ex a iusto debitis minima sed. Enim ut corporis ipsum aspernatur necessitatibus delectus et. Id repellat ut quas perferendis vel aliquid. Ea laboriosam rerum est consectetur. Eveniet hic hic illum ut vel doloribus perferendis. Odio voluptates esse quaerat soluta perferendis harum. Cumque molestiae adipisci aut reprehenderit perspiciatis ut qui. Minus nobis suscipit natus error enim facere. Magnam id rerum harum unde distinctio omnis non voluptatem.', 140, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(798705, 'Ab vel similique ut molestias itaque autem illo.', 'Corrupti debitis a repudiandae. Non praesentium officiis quisquam et consequatur. Dolorum iure hic ex quae. Praesentium et veritatis et. Asperiores quia expedita eveniet atque. Eos voluptates iure quidem dolorem at vel nobis. Perferendis laudantium corporis id minus non. Consequatur ducimus et quia odit inventore voluptatibus saepe. Autem laborum neque et excepturi. Enim distinctio est enim eius molestiae quidem. Mollitia corporis maiores soluta et consequatur. Reprehenderit sed nesciunt velit pariatur quod. Aut quia consequatur quaerat voluptatem. Velit iure cum id possimus. Incidunt qui similique cumque et eos et odit. Itaque fugit maxime recusandae ut consectetur quod maxime. Velit maiores commodi veritatis minima hic. Corporis cupiditate repellat assumenda. Pariatur pariatur omnis nobis est quibusdam. Facilis magni rerum ut. At cumque voluptatibus est quod sed sit enim. Ut repudiandae et quia. Asperiores aut sit voluptatem sunt quo tempora. Optio ullam quibusdam est eos quod quia enim.', 86, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(799970, 'Ab voluptate ut consequatur.', 'Est dolore illum fuga sint autem quo perspiciatis harum. Perferendis aut eos dolorem nesciunt. Quod doloribus maiores est voluptas. Saepe praesentium accusantium sed harum itaque dolores. Aliquam est dolor eveniet impedit. Earum non voluptatem voluptatibus aut. Aut provident velit ducimus saepe quod aut. Repudiandae molestiae quia atque consequatur dolores. Dicta nemo ut eius maxime laboriosam quos corporis. Porro magnam nostrum earum laboriosam. Ea architecto exercitationem esse saepe veritatis reprehenderit tempora in. Eum omnis ex qui voluptatibus. Nostrum et consequatur id asperiores. Id inventore maiores quia dolores debitis animi. Vitae impedit sit vel dolorem. Hic eum recusandae molestias quod ullam sint autem.', 98, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(800741, 'Consectetur maxime laborum cum et praesentium.', 'In aut debitis excepturi et debitis repellat. Culpa at vero nihil dolor cumque adipisci. Voluptate aut dignissimos voluptas soluta neque quae distinctio. Deleniti deserunt sed illum pariatur. Aut libero non et ratione. Delectus voluptatum at a quibusdam. Autem mollitia aut voluptatem. Culpa commodi et sint voluptas ut debitis perspiciatis. Nulla maiores voluptatum molestiae et ipsam sit aut. Optio mollitia labore blanditiis iure nostrum. Dignissimos necessitatibus vero distinctio distinctio beatae consequuntur. Molestiae voluptates aperiam perspiciatis iste excepturi consequatur rerum. Voluptas quod et aut ab. Debitis sunt corporis illo atque et ab nihil. Hic autem voluptatem dolores.', 1, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(805317, 'Omnis sed quia vel voluptatem modi qui dignissimos.', 'Laudantium ea explicabo est sed magnam eos non. Odio non doloribus adipisci ullam. Laudantium corrupti quia distinctio et nisi eaque deserunt odit. Sit quisquam facere maiores quidem illum asperiores. Ut quidem ut nihil asperiores totam. Voluptatem blanditiis aut excepturi quam quo vero natus. Sit repudiandae quas nihil aut veniam. Commodi rem occaecati enim ducimus quo qui. Qui quod consequatur quisquam nostrum qui dolor. Veritatis sint laboriosam praesentium nemo esse adipisci. Quia ut est ut natus. Vero qui ipsam nihil ad dolores officiis itaque. Voluptates ut ut inventore doloremque est. Eaque ut ut aut et consequatur maxime aliquam. Soluta corporis dolor quibusdam molestias nobis ut. Quidem numquam qui cupiditate debitis. Hic ullam omnis expedita omnis nisi quis. Tempore officiis consequatur commodi placeat. Aut sed aliquam sit reprehenderit. Est voluptatum aut iure reiciendis. Aut laborum ab ducimus ullam. Quia ut et provident pariatur numquam voluptas. Nesciunt eveniet excepturi dolore odio.', 191, '2023-03-02 06:52:13', '2023-03-02 06:52:13', 4),
(819576, 'Tenetur ipsa et esse quidem ab dolor est qui.', 'Iusto et cum et numquam pariatur nihil porro. Aut placeat illo mollitia. Eaque esse ullam eaque quas at non. Debitis voluptatem qui reiciendis et perspiciatis odio. Maiores est quod ut enim repellat consectetur blanditiis et. Earum est corporis quia. Omnis quae commodi placeat veniam omnis molestias. Sequi voluptate accusamus qui voluptatibus nobis doloribus sint. Hic eaque aut quam atque. Officia vero cum consequatur blanditiis dolores. Quidem sit incidunt quasi est quod quis voluptatem. Aut earum non molestiae in quis quia et. Nihil dolores ea odit eum eum sunt vel. Aliquam neque delectus libero quam neque iusto. Libero molestiae ullam quia nostrum voluptas. Dolores delectus nam magni aspernatur voluptatum est. Tempora optio saepe delectus. Veritatis est deleniti exercitationem praesentium voluptas animi. Voluptate corporis nisi quia laboriosam aut et temporibus. Et et pariatur assumenda quasi. Neque quae sed corrupti ab ut accusamus. Repellat laudantium veritatis aut iste dolores id. Rem veniam eaque accusamus ullam quod ea eos vel. Inventore sunt non non quae voluptate consequuntur saepe fugiat. Vero ut aspernatur est qui ut est voluptatem. Ut et veniam molestiae quos officia facilis.', 96, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(823685, 'Et asperiores exercitationem dicta.', 'Id dolorum voluptas necessitatibus possimus vel. Consequatur aliquid doloremque laborum doloribus cupiditate culpa eum. Aut culpa alias aperiam. Architecto ut aliquid ut suscipit impedit. Est dolor autem id. Sequi aspernatur ipsum ipsum vero sit architecto. Fuga aliquam mollitia aut est aut distinctio quis. Velit exercitationem quis a ut rerum repellendus. Commodi debitis ipsam consequatur ea sapiente. Repellat quae dolorum ipsam sapiente est sunt alias est. Ut qui delectus aut in aut ut officia. Molestiae qui vitae maxime. Voluptatem aut officia voluptatibus occaecati quo et. Voluptatem praesentium ipsum sed ut ut rerum. Officia architecto adipisci qui eaque doloribus ipsam doloremque. Deleniti similique et sed aperiam. Nulla velit autem aut sed aut. Consequatur enim tempora est non exercitationem. Blanditiis ut tenetur temporibus architecto delectus et ut culpa. Consequatur ratione officiis commodi similique. Optio veritatis rerum in non pariatur debitis est quasi. Voluptatem est perspiciatis eos quos sit porro eligendi. Veniam dolores et iure omnis. Quidem aut dolores fugiat dolorem. Quia provident est aut doloribus voluptatem. Esse assumenda placeat dolorum est nihil quaerat.', 175, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(826679, 'Neque non quis quas ipsam commodi.', 'Et facere impedit impedit eaque et dolore. Et quia qui dolorum necessitatibus quo. Sunt consectetur tenetur nihil. Voluptatum quo distinctio dignissimos. Nihil molestias magnam qui velit quis. Voluptas natus est rerum non nesciunt voluptatem totam. Ipsum aut sed excepturi maxime repellat. Minus earum qui quia cumque placeat eum. Quis in laboriosam est. Nobis deleniti porro deserunt dolores. Nam animi ratione tenetur cumque. Tenetur voluptates quo veritatis ea labore dolor. Ut aliquam quisquam aut delectus soluta iusto. Quaerat ipsum quibusdam fugiat. Fugiat consequatur fugiat aut.', 13, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(828846, 'Est illum placeat est.', 'Id architecto in ullam et odio officia. Sunt non iusto quibusdam et laborum atque tempore voluptatem. Consectetur consequatur qui velit commodi. Illum voluptates officia quis veniam. Numquam delectus est ab qui. Labore quo ut facilis quo sed. Et quam illo voluptatem placeat est ipsa ratione. Explicabo vitae ut quia. Vel quis omnis aut accusamus qui aut. Rerum totam nihil minus expedita voluptatem debitis aut. Cupiditate vitae provident enim possimus qui illo accusantium. Qui placeat quae distinctio officiis cum. Explicabo voluptatem similique adipisci itaque aut est saepe. Assumenda odit omnis qui qui. Similique nobis sapiente at quas.', 123, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(833114, 'Ipsam et voluptatibus molestiae quas inventore omnis sit.', 'Laboriosam qui autem culpa corporis. Labore fuga nisi ducimus temporibus est culpa. Quia aliquid sed architecto id. Est qui non est beatae sint et. Hic reiciendis harum et maiores ea qui. Harum sed harum natus provident ut ratione. Temporibus molestiae consequatur qui cupiditate et. Aperiam excepturi quia explicabo omnis rerum quis praesentium. Deleniti sed repellendus consequatur ut asperiores dolorum. Velit rerum nihil dolores aspernatur rem. Ex qui qui nesciunt. Labore eos totam earum voluptatem ullam. Qui laborum voluptatem minus voluptatem at.', 197, '2023-03-02 06:52:13', '2023-03-02 06:52:13', 3),
(833991, 'Illum voluptas voluptatibus officia.', 'Suscipit qui natus quis recusandae asperiores autem distinctio. Error porro quia quas non sint. Ratione nihil facilis et id eos. Accusamus vel sint recusandae aspernatur corporis. Unde aut aperiam autem. Et sit impedit sunt. Non totam ea illum voluptatem voluptatem harum esse. Accusantium illum recusandae distinctio officia doloremque et. Nihil sequi molestiae architecto ad harum. Hic delectus et eius quasi doloribus voluptatem. Aut nisi autem aspernatur asperiores sed rem. Ratione dolore libero illum tempore tempora asperiores molestias. Distinctio tenetur dignissimos placeat. Voluptatem assumenda porro nulla omnis ipsum. Id atque tempora molestiae animi sint repellat voluptatem. Et reprehenderit est quia aut. Recusandae suscipit omnis ab vel. Quae et consequatur quisquam omnis et veritatis dolor. Porro minima excepturi dolorum reprehenderit est. Enim optio cupiditate fuga hic ipsa eaque quo iste. Blanditiis et natus optio quibusdam nesciunt occaecati. Ut aut est accusantium porro. Fugiat non soluta molestiae minus. In esse eum dolor quos et placeat. Qui vel inventore occaecati tenetur. Expedita nemo impedit dolorem sed magni illo. Nemo non possimus laboriosam rem. Aut fugiat at aut quia.', 14, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(850825, 'Ut hic dicta iste nesciunt.', 'Quibusdam minima vel ipsum. Rerum atque necessitatibus similique eos veritatis. Exercitationem quaerat ducimus vel ut aut. Quidem in nobis consequatur culpa. Sunt ipsam tenetur minus ut nihil sint qui. Facere rerum molestiae aspernatur nihil. Odit et fugit qui. Dignissimos alias labore sequi eum id. Magni rem porro assumenda ad qui hic pariatur. Natus ipsa quia quis ut omnis. Suscipit soluta velit perferendis exercitationem corporis sit. Veritatis sint ad quisquam enim. Dolor cum et et possimus. Rerum tempora excepturi suscipit necessitatibus ratione. Odit quaerat et esse blanditiis omnis est sed at. Ut aut dolores placeat unde aperiam vero. Amet corrupti hic voluptatem nostrum vel. Et optio aperiam eos dolorem. Et sint culpa enim eveniet reiciendis velit. Facilis accusamus molestias delectus animi laboriosam. Et eveniet autem aut et tenetur cumque. Molestias eius et sed consectetur dignissimos nihil non. Maiores facere unde hic optio deleniti sed. Ex aliquid cumque consequuntur quo rerum expedita et. Voluptas fuga sunt dolores earum mollitia reprehenderit quam. Delectus nihil aut qui exercitationem. Eaque inventore est tenetur dolores. Est voluptatem facere voluptas aperiam assumenda.', 119, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(851636, 'Sequi doloribus natus maiores impedit.', 'Qui voluptas et corrupti facere illo. Molestiae nihil facere architecto amet. Quos vero quis voluptatibus consequatur quo dolore. Et sit cupiditate voluptatem earum. Ut alias sit consequuntur beatae aut aut adipisci. Voluptas qui qui eum debitis enim. Officiis animi voluptatum qui. Reiciendis natus laborum quia reiciendis ut. Dolorem minus in itaque vitae. Laborum cupiditate laboriosam ea deleniti odit. Sed sit ad non reiciendis necessitatibus et. Aut alias eos modi maiores architecto enim quos nihil. Eaque qui qui cum delectus qui. Modi eius sapiente velit. Nihil voluptatem dolores unde architecto officiis quia nesciunt itaque. Nam laboriosam quia possimus id. Et accusamus ratione consequatur consequuntur autem quae earum. Similique exercitationem magnam ut doloribus est quia. Ipsum fugiat et ea cumque eum. Accusamus nulla perferendis fuga quos consequatur consectetur repellendus dolorem. Aperiam exercitationem molestiae quae facere at qui. Vero qui hic eum autem quae sit autem. Doloremque consequuntur voluptatem quos perferendis. Ut magni eum amet. Molestias voluptatum soluta aut ipsam assumenda et.', 66, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(854706, 'Nam perferendis possimus ab aspernatur rerum laborum.', 'Tempora quo error quo officiis sit. Facere totam et soluta incidunt ut omnis facilis. Minima velit repellendus dolorem. Expedita laborum omnis deserunt quam facilis voluptatem sunt doloribus. Iste beatae qui sapiente nihil veritatis reiciendis rerum. Omnis tempora exercitationem quis est et numquam expedita quae. Deserunt a nulla animi qui dicta eligendi. Nihil voluptatum et ea nesciunt. Debitis expedita ullam dolor occaecati. Est natus molestiae rerum esse et. Illo aspernatur qui sint pariatur ut omnis. Animi perspiciatis quasi expedita eveniet dignissimos. Voluptatibus reiciendis odio est dolor asperiores et. Perspiciatis repellat eligendi qui voluptatem ea cumque. Hic quia ut provident. Facere harum qui quaerat rerum. Mollitia officia officia eos magni. Eius minima consequatur enim id minima ut praesentium voluptatibus. Quis ducimus ut sed minus itaque. Sint debitis officiis est eaque sint quaerat.', 150, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(855516, 'Autem dolorem assumenda corporis et omnis.', 'Eius magnam esse velit quo quia praesentium fugiat. Rerum voluptas nulla unde itaque pariatur quaerat vero vero. Natus a omnis quidem nesciunt quos. Natus amet cumque assumenda in. Consequatur molestiae eligendi quae voluptatem dolorem. Ipsa voluptate itaque et aperiam voluptatum. Et impedit ex officia ratione recusandae dolorem inventore nulla. Omnis explicabo quibusdam nihil nemo dolore. Delectus quia laborum harum temporibus ullam. Et veniam voluptate voluptatibus iure sit dolor. Totam facilis fugiat inventore non ab ab. Occaecati ex quis aut ipsum quia modi itaque alias. Rerum velit enim dolorem incidunt quo error commodi. Saepe voluptates ut ducimus eius. Quia incidunt ea saepe sit. Qui esse omnis cum deserunt et voluptatem et. Minus suscipit voluptas quae voluptatem labore atque quod. Repudiandae reiciendis praesentium tempore voluptatem animi nihil consequatur vel. Aut in voluptatem voluptas omnis vel. Eos inventore cupiditate quo ut accusamus at qui. Voluptates dolorem facilis eos reiciendis qui non eveniet. Dolor officia quia aut omnis expedita aut.', 89, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(856019, 'Officiis tempora quam reprehenderit id.', 'Ex repudiandae tempore quia. Delectus odit itaque non vitae veniam consequuntur delectus. Voluptate non est esse fugiat aut officiis. Dolorem tempora deserunt iure itaque enim similique vero est. Dicta rerum quod error ut a aut quis ab. Neque magni consequuntur voluptate. Et veritatis qui necessitatibus blanditiis voluptatibus consequuntur veritatis. Quis ipsum placeat voluptatem ab. Architecto minima dolor nobis eius explicabo odio ab. Odit et repellendus sapiente. Cumque quis labore minima quaerat. Delectus placeat aperiam et cum sequi aperiam. Sequi consequatur voluptatem repudiandae. Et ut in amet aut. Distinctio magnam aspernatur perspiciatis enim sed eaque. Optio eos perspiciatis commodi quisquam.', 46, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(865650, 'Qui laborum doloribus dolor rem.', 'Similique nesciunt quia qui quis vel. Eligendi et ex est quo dignissimos modi. Vero cupiditate asperiores aut saepe quod. Neque necessitatibus quia omnis doloremque voluptatum tempora. Non eligendi accusamus mollitia eum ut iste. Est cum eum sint deleniti. Inventore fugiat quod dolore voluptatum perferendis illo nemo. Sint voluptate aliquam laudantium suscipit necessitatibus. Ut nulla quo provident deleniti natus. Rerum qui et non excepturi molestiae aut. Aspernatur reiciendis aspernatur vitae nobis minima unde. Suscipit non voluptatem dolores et est et quasi. Eum magni et ab atque beatae. Expedita dolorem laboriosam maxime sed repellat ut optio nostrum. Voluptatem eum aut earum ab ea qui. Dolorem dolore sit quos blanditiis aut aut.', 37, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(869141, 'Officiis odit ratione dolores eveniet laboriosam magnam est.', 'Et consequatur omnis itaque porro est maiores id. Libero sunt repudiandae sit ut minima eligendi optio. Qui voluptatem est aperiam totam totam. Molestias quam maxime aut sit modi. Eveniet illum eveniet placeat voluptatibus. Voluptatem consequatur placeat ea occaecati saepe dignissimos. Provident at quas facere omnis laboriosam. Ea consequatur non sed ex. Officia qui dolore provident corrupti. Sequi quo veniam repellendus quos voluptatibus et id omnis. Explicabo distinctio rerum molestias laboriosam non aut. Laborum sapiente ex sint consequuntur aut nemo. Cumque debitis fugiat magni provident et.', 117, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(870557, 'Velit nihil sed corporis blanditiis.', 'Maiores aut sit rerum voluptatibus quisquam est. Adipisci excepturi aut iste veritatis sunt et ullam. Voluptatibus voluptatem est ullam blanditiis molestias et error. Repellendus voluptatum nemo earum sint. Doloremque aperiam aut aliquam laudantium aut. Et accusantium qui ipsum magnam. Libero sed et in. Aut ea qui consequatur exercitationem debitis quis. Quaerat eos vel sunt mollitia aut nostrum eveniet. Velit dolores eveniet numquam atque. Omnis ut quaerat mollitia et. Aut voluptate accusamus itaque deleniti. In assumenda est reprehenderit voluptatibus et aspernatur. Tempora asperiores officiis magni nihil. Aperiam facilis a rerum sint. Iure impedit facilis provident architecto. Incidunt repellendus doloremque rerum nam vitae iure ut enim. Et facilis asperiores et velit consequatur eos eligendi. Ex nemo ipsa iste molestias. Aut officia nisi eos quam consequatur non tempore. Dolore corporis sint delectus a cum. Aut fuga est omnis voluptas quisquam neque impedit. Illum accusantium nostrum ex culpa. Perferendis quia est ea repudiandae nostrum non.', 173, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(877128, 'Accusamus molestiae hic vitae aut.', 'Saepe deleniti velit eos nulla optio atque in beatae. Sed dolor placeat et. Et laudantium voluptatum saepe deleniti sequi. Et eum autem et ex quaerat ullam et. Quibusdam error veritatis voluptate aperiam. Ullam architecto molestiae aut earum. Consequatur quisquam magni enim sequi. Nemo illum soluta id vel et ad. Nihil animi et placeat sunt. Sed veritatis qui hic perferendis. Et ut fuga aut quo odit ut voluptate. Molestias voluptatum aut est beatae nam adipisci. Voluptatem et alias cum pariatur similique dolore numquam. Id odio temporibus hic vitae voluptas. Est ut laboriosam tenetur ut. Sit esse est incidunt expedita.', 142, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(886057, 'Sed molestiae iste optio quia nihil deserunt.', 'Quia alias ratione quis modi fuga. Occaecati in porro omnis. Praesentium sit impedit cupiditate dolorum natus occaecati ullam. Aut modi ducimus ut nobis est laborum corrupti. Rem tenetur ea perferendis necessitatibus inventore officia. Doloribus alias suscipit ut laudantium numquam sunt qui. Amet quas quaerat cumque quo soluta aspernatur. Earum occaecati dignissimos consequatur in excepturi quidem repellat. Sequi voluptatem eos vitae omnis libero earum. Hic quasi amet in voluptates. Facilis sapiente voluptate temporibus exercitationem sint tempora. Eveniet est animi dolor aliquam rerum. Aut quo consectetur doloribus. Velit corrupti nobis provident omnis. Ut voluptas fugiat possimus asperiores dolor et a. Sapiente tenetur quia et nisi quis officia quia eligendi. Expedita nam vel adipisci qui. Harum magnam quia a. Inventore sapiente voluptatem quidem eos tempora amet distinctio. Rerum fuga autem suscipit autem fugit minima. Nesciunt quia inventore ut porro nihil perferendis in.', 169, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(890215, 'Facilis perspiciatis officia non qui et aliquam.', 'Quia odio sint maxime soluta. Animi consectetur dicta delectus provident dolore. Et laboriosam non et ut rerum totam aliquam ipsum. Doloribus perspiciatis quo in et. Esse minima quis voluptatem porro. Voluptatem fugiat quam mollitia expedita aspernatur vel vitae. Error earum pariatur sequi animi. Sit qui nulla nemo qui aliquam. Nesciunt ut dicta accusantium iure reprehenderit illo rem. Nihil sunt autem nam voluptas ipsum quas sint. Repellat debitis perspiciatis perspiciatis. Quia neque odio repudiandae a. Enim non sed et asperiores omnis in mollitia. Minima ad ipsa reprehenderit doloremque sunt id nihil. Cumque quo facere ex. Adipisci quibusdam cupiditate laborum in qui ipsa aut.', 57, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(892407, 'Sed alias esse voluptatibus commodi sit.', 'Eligendi itaque veniam labore illum. Dignissimos et aut iure maxime. Repellat voluptatum laborum quia magnam. Sunt dolore id dolorem. Ea in id atque quos tenetur quae aperiam. Nostrum dolore vel odit consectetur sunt. Ut officiis aspernatur est animi officiis. Molestias nemo ab voluptas nobis velit ipsum quia. Eius aperiam autem voluptatem qui nobis qui est est. Voluptatem id commodi et odit omnis. Reiciendis ratione rerum aut perspiciatis sed suscipit sed. Architecto et saepe voluptatibus voluptate laboriosam. Quae eius libero deleniti aut voluptate itaque vitae quia. Nihil est voluptatem rerum dignissimos vel qui exercitationem. Temporibus velit consequatur nulla. Itaque exercitationem et veniam et accusamus suscipit vel ut. Deleniti eaque est voluptatem pariatur aut vel aliquid totam. Quae laudantium vero sunt sed culpa.', 144, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(900330, 'Consequuntur ut aliquam perspiciatis dolor et optio ullam accusamus.', 'Eos vel rerum doloremque exercitationem aut eius. Accusamus odit repudiandae inventore. Eum cum porro et ea voluptas sequi. Perspiciatis tempore nihil adipisci ut quo quos doloremque earum. Rerum illum iusto fuga odio. Eius ullam quas tempora sed debitis quod. Corporis qui molestiae inventore quia aut sint. Quasi tempore mollitia dolores nisi quia. Voluptate officia ex distinctio dolores repudiandae deleniti. Quis sint provident laboriosam id. Consectetur sit quis voluptates dolores. Dolor ut laboriosam suscipit et non. Velit iste modi saepe earum.', 75, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(912357, 'Officia nemo laudantium eius nostrum dolores quidem.', 'Nam non aut rerum nostrum officiis aliquid minus. Repellendus ab asperiores quo incidunt. Cumque voluptatem doloribus suscipit ullam. Qui perspiciatis omnis officiis provident voluptatibus in. Amet unde illo adipisci minus. Molestias sed fugiat voluptates rerum nobis. Et recusandae delectus dolorum rerum possimus ut ipsam. Vero quas voluptas quaerat neque ut vitae. Ab in in tempora suscipit provident tenetur quidem. Perferendis id est possimus neque dolorem quaerat et. Nemo non accusamus debitis non qui et. Assumenda repellendus asperiores ipsum quo. Qui nihil et eveniet ut est sunt voluptates. Aliquid omnis minima qui autem et dignissimos sit. Non amet neque nulla et et itaque. Nam qui quia sed repellendus quas omnis voluptatum. Et dicta qui rerum magni. Officia expedita odit ut laborum facilis sed. Minus necessitatibus pariatur eius accusamus et. Possimus voluptatem ea quis non earum. Aut commodi ratione tenetur aliquid. Consequatur et ea unde dolor. At laudantium labore molestias aut natus sequi iure. Ut suscipit quibusdam animi autem dicta est.', 22, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(913704, 'Sit et libero perferendis atque voluptate delectus quidem.', 'Velit eum animi sed quo beatae. Consequatur atque atque et voluptatem neque aut. Quia nesciunt sit est iure et velit maxime. Ex deserunt et ut illum. Id omnis possimus quod dolorum sapiente. Aut iure sunt qui consequatur veritatis odit ipsam. Molestias voluptatibus dolorem ipsam nemo. Praesentium porro nihil ipsum quaerat nemo voluptas aspernatur. Rem impedit et culpa ut asperiores. Quibusdam similique harum nam eius ut. Molestiae quaerat impedit pariatur qui aperiam repellendus ducimus. Porro minus velit et hic reiciendis. Fugiat qui nostrum minus suscipit necessitatibus libero porro. Consequatur temporibus excepturi dignissimos voluptatibus tenetur fuga. Eaque sed quis ducimus nesciunt fugit officiis voluptatum. Rerum quod amet deserunt doloremque voluptatum labore. Vitae tenetur quidem temporibus non est quo nesciunt. Omnis voluptate architecto cumque non sed consequatur in non. Aut porro nulla omnis architecto fugiat. Ducimus enim sed molestias dolores. Doloribus ipsum qui iusto est. Magni molestiae sed maxime ab ab. Neque sit ea esse fugiat. Aut et ea esse veniam ea labore modi. Iste et dolores sequi quo occaecati molestias voluptates. Temporibus laudantium eos ut tempore suscipit officia.', 172, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(923424, 'Quis perspiciatis et distinctio.', 'Omnis ipsa sapiente quas. Eum quos eaque omnis natus. Voluptas cumque suscipit id non nam adipisci earum. Ea maiores quae tempora quo nesciunt natus et cupiditate. Facilis sapiente cum similique quidem repellat. Veniam culpa et minus esse. Hic ex qui blanditiis dolorum. Ut et harum sunt. Aut ut quis aut earum nihil nulla. Quia alias et et saepe. Qui in voluptatum sunt. Ipsum iste ut voluptatem voluptas natus. Quam deleniti enim animi sunt voluptatem. Omnis ipsa vel corrupti temporibus labore at. Quisquam est totam doloremque et veritatis cupiditate. A rerum est non aut laboriosam voluptatem. Aut qui quia sed pariatur qui assumenda illum. Explicabo eius recusandae soluta quisquam amet tempora. Est maxime pariatur rem error rem minus modi. Culpa consequuntur tempore illum cumque quas numquam voluptas. Ipsum aspernatur repellat rerum provident. Quod sunt qui et. Et et similique quisquam rerum nihil sit dolorem. Et temporibus tempore rerum facilis. Tempore dolor sed nihil.', 71, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(923592, 'Aliquid fuga dolorem fuga incidunt.', 'Nesciunt explicabo dignissimos deserunt ut a veniam. Iste voluptatibus officia est. Ut nam velit quia magni sit delectus aut. Dolor blanditiis magni debitis tenetur. Voluptatum fugit vel voluptatibus unde magni accusamus nam. Unde facilis laboriosam totam non eveniet velit. Et in exercitationem rerum. Assumenda similique rerum est et quo in necessitatibus. Id dolores voluptatem nisi. Voluptas non repudiandae et nam. Minus est libero ab iure. Sit dignissimos autem aut. Illo et quia corrupti ab voluptas vero illum deleniti. Ut quia delectus quam deserunt qui saepe temporibus. Doloremque in in qui sunt corporis similique ad. Aut voluptatem eum ut velit ex. In nulla quia ut maiores. Veritatis voluptatum excepturi mollitia non sequi error. Corrupti ipsa quaerat molestias. Expedita explicabo adipisci aliquam sint voluptas quaerat fugiat nam. Dolores qui et et numquam et expedita. Fuga qui recusandae dolores suscipit corporis accusamus culpa. Non voluptatibus atque qui qui amet et voluptatum. A enim et in dignissimos ratione nobis. Qui optio consequatur amet. Necessitatibus consectetur expedita minus fugit qui molestias est fuga.', 114, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4);
INSERT INTO `forum_posts` (`id`, `title`, `body`, `user_id`, `created_at`, `updated_at`, `categorys_id`) VALUES
(927211, 'Magnam ut totam nisi in.', 'Ipsum voluptatibus explicabo iusto distinctio. Magni molestiae nihil iusto dolorum. Sit eveniet numquam qui velit vel recusandae ducimus. Asperiores qui nihil repudiandae voluptatem doloribus dolorum unde excepturi. Quis ipsa sit molestiae voluptatem. Consequuntur labore cum rerum rerum quos aut. Eveniet sunt itaque dolores accusamus explicabo. Distinctio mollitia quisquam accusamus. Magni et corrupti cumque ex cupiditate odit veritatis. Tempora dolorum quasi hic non sunt aut ut. Est earum laborum ad. Et qui nihil dolorem. Dicta accusamus voluptatem numquam excepturi iusto quo tempora. Laudantium sunt aut aut ullam et quisquam ratione corrupti. Doloremque beatae est et alias vitae. Rerum ullam voluptas fugit ratione distinctio. Ea consequatur corporis suscipit molestiae. Sit est ut soluta non minus laboriosam corporis. Qui enim soluta nihil veniam ipsa incidunt. Ut voluptas tempore aliquam doloremque consequatur quasi et.', 177, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(927495, 'Eaque sit amet dolorum velit corrupti et non.', 'Qui aperiam fuga cum. Ipsam odio tempora occaecati. Ea aperiam facere rerum suscipit. Expedita animi quidem odit vitae. Quis necessitatibus ea fugiat et incidunt id. Explicabo voluptas non consequatur non beatae. Incidunt maiores porro corporis provident dolore consequatur porro quis. Illum sit inventore dolore id enim voluptas dolor. Repudiandae vero dolor aut. Dolorem quas in optio recusandae sint commodi voluptas. Autem maxime provident est fuga. Ut praesentium beatae sit quasi qui corrupti. Blanditiis sit facilis voluptas eligendi ipsum ut. Architecto animi iusto veniam placeat. Ipsum autem ipsa tenetur ut explicabo qui maiores. Aut aliquid beatae ullam. Odio perferendis similique aspernatur et vero corrupti ut.', 129, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(941625, 'Eos veritatis quas dolore quam qui quos illum.', 'Repudiandae non aut ea dolorem aut aut. Et et excepturi aut amet. Minima non autem magnam architecto illo accusamus eum. Qui non voluptatibus provident cumque. Fugiat sapiente ut et et. Sint ad ipsum velit quia repellat placeat aliquam. Optio nobis est eveniet dignissimos. Amet ut magni tempore. Esse distinctio ipsum accusantium quis molestiae nihil. Rerum ea ut ea quia amet alias. Omnis et quibusdam voluptas vel officia in. Cupiditate dolores necessitatibus laboriosam repudiandae tempora. Inventore molestiae veritatis nihil sed et id alias. Et quia reprehenderit distinctio. Ullam inventore enim reprehenderit nam tempora. Quam aspernatur a rerum quia. Omnis provident in dolores itaque. Itaque fuga amet natus impedit. Autem fuga minus repellat. Ab corrupti magnam et. Tempora explicabo velit est. Nihil consequatur culpa et. Iusto dolore quis tenetur libero voluptatum. Labore itaque consequatur vero quaerat. Sed inventore molestiae nemo harum accusamus. Et in quos optio a accusantium molestias. Quo et temporibus nemo aut molestiae.', 113, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(942505, 'Dolorem voluptatum aliquam libero laudantium.', 'Nobis modi quisquam error quisquam. Nihil cum eum tenetur molestiae cumque voluptas. Ut ab alias sed quibusdam et. Illo doloribus iure aspernatur non dolorem. Ex tenetur consequatur repudiandae ducimus. Deserunt minus dolor similique quia a inventore officia. Non quisquam id dolor qui sunt occaecati dolores. Totam sit occaecati facilis sunt soluta quia quisquam blanditiis. Repellendus magni culpa ducimus aut voluptatem illum. Asperiores molestias ducimus quia quia et. Dolorem corporis quidem totam praesentium accusantium consectetur deserunt. Cumque maxime sit laboriosam. Qui facilis eos repellendus quas sint eaque dolore.', 34, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(944543, 'Officia eum reprehenderit architecto quo inventore ratione et.', 'Sapiente qui quos quia iure. Rerum modi repellendus sed. Dicta id deserunt officia impedit et qui. Voluptates iste dolorum et suscipit rem eum magni. Velit excepturi velit doloremque exercitationem nam. Rem dolores dolor consequuntur qui enim quas. Minima saepe est ipsum aspernatur neque architecto. Quia magnam error quia aut nihil. Doloribus id quidem molestiae numquam dolorem. Odit quasi aut quasi voluptatem quo vel. Expedita et qui quod debitis. Blanditiis qui eos blanditiis laboriosam quae. Natus possimus ipsum autem suscipit est optio. Atque sed inventore repellat possimus soluta tenetur totam ad. Autem reiciendis rerum itaque non voluptas in aut. Tempora officiis nulla est dolorem. Numquam ullam corporis doloremque itaque tempora natus. Velit non sunt nostrum. Et aliquam sit debitis molestiae et consectetur aut. Nisi dolores et aut exercitationem dignissimos nemo quasi. Ullam veritatis eveniet nemo numquam nulla. Porro dolorem consequuntur in neque rem. Blanditiis quasi iste voluptatem voluptatem sit at numquam. Illo incidunt unde eaque ea.', 28, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(946723, 'Ea perferendis sequi esse consequatur rerum veritatis.', 'Non accusamus quod hic omnis. Assumenda doloribus necessitatibus optio soluta. Aliquam nemo laboriosam placeat facere suscipit vel. Temporibus ea voluptates qui asperiores delectus. Praesentium illum minus veritatis. Ipsa qui nesciunt enim itaque laudantium est ea. Aut qui minima dolorem voluptatem ut. Alias eligendi doloribus ullam minima. Sed sed nihil iste. Dolores veritatis ut alias magni. Vero quis deserunt commodi. Commodi sint cupiditate nam est ut. Qui soluta corporis earum sed. Fuga voluptatem pariatur numquam commodi. Officia asperiores velit qui voluptatem maiores. Magnam molestias veritatis corrupti quas deleniti et. Neque at dicta numquam aut illo. Consectetur quia amet hic eum ad voluptatum consectetur. Vel non dolores ullam id non in. Repudiandae et unde sunt ut nisi. Voluptas facere et aspernatur illo illo dignissimos asperiores. Quam aliquid quam qui enim.', 48, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(948061, 'Voluptatem magni nulla repellat dicta aut incidunt voluptatibus.', 'Pariatur consequuntur optio porro placeat cumque nihil. Iusto est suscipit animi. Accusantium dolores maiores nobis aperiam rerum illo id. Quisquam error magni repudiandae natus ipsum. Aut ipsa mollitia repellendus aperiam quidem id. Qui assumenda deserunt et. Optio magni earum mollitia quo quisquam vel ut. Labore qui ut totam eum rerum veritatis. Est et sit illum quia dolorem at consequatur tempore. Mollitia explicabo dolores vero id ut quae dicta. Quae et nesciunt quidem vel ut. Dignissimos id quam rem officiis. Aspernatur voluptas est facere odio qui. Magnam totam et unde amet. Sed provident aut dolore ut. Voluptates qui cupiditate ea aliquid. Omnis ab voluptas ratione numquam sequi voluptatibus voluptatem. Placeat sit quo quia omnis. Neque quia facere accusantium nihil quia autem. Eveniet quasi architecto cupiditate aut ullam voluptate ut. Non non et assumenda voluptates nam iusto saepe. Ipsam eum qui consequatur libero deserunt. Maxime iste quae reprehenderit quis. Ex natus nostrum veritatis et. Sunt error est ex voluptatem earum. Voluptatem corrupti voluptatem officiis optio eos consequatur rerum. Laudantium quos blanditiis provident voluptatem.', 52, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(956782, 'Expedita reprehenderit unde consequuntur quisquam culpa aspernatur et.', 'Dolore unde neque iusto eligendi et nam culpa. Alias voluptatem neque corrupti sit. Sunt nostrum iste reiciendis. Sunt enim harum quod autem. Odio consequatur maiores repellendus rerum ut sed. Incidunt accusantium laborum dolor similique maiores. Sint numquam officia et sint velit. Ut qui ex provident possimus cupiditate quia in. Perferendis et aut consequatur iste. Doloremque vero odit itaque consequatur et fuga ullam. Eum sit assumenda dolor nesciunt voluptatum. Dicta eum non enim cumque necessitatibus quia. Fugit quas culpa quibusdam doloribus ut. Ipsum quas quasi voluptatem. Adipisci debitis hic nemo dolorem esse. Officia ratione tenetur alias accusantium sequi amet. Rerum a labore vitae libero minima. Minima deleniti est harum et mollitia ut et.', 43, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 2),
(957592, 'Odit expedita autem eveniet sed nisi consequuntur.', 'Voluptas aut quia est corrupti distinctio esse dicta. Optio odit sunt rerum enim qui rerum molestiae ut. Sed voluptatem enim placeat eligendi occaecati et natus. Est non minima facere officiis quam blanditiis. Dignissimos omnis architecto molestiae tempora quasi. Ad quidem neque non sit. Illo quos ut repellat sed. Architecto quia nisi qui itaque. Animi perferendis quis omnis inventore est. Aut debitis et perspiciatis repellendus. Molestias tenetur delectus a quaerat. Praesentium nobis officiis saepe itaque sint voluptate. Ad quia dolor et nihil quos et repellat. Tempore minus est ipsum quia eius rerum praesentium.', 58, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 4),
(961802, 'Adipisci corrupti excepturi ut omnis ex occaecati amet officiis.', 'Nemo facere in possimus illum. Dolores sit odio ipsam qui possimus itaque aut excepturi. Sit eligendi optio labore pariatur et. Sit et veritatis delectus optio sapiente itaque aut alias. Et ratione dolorem beatae vitae voluptas quis. Dolores corrupti inventore labore iure. Aut tempora rerum est aut omnis magni. Cupiditate recusandae maxime aperiam perspiciatis. Sint modi in doloremque sint aliquid tempora aspernatur cupiditate. Sint et dignissimos nulla laborum autem maiores repudiandae. Eum dicta eum nulla quo. Est non consequatur maiores et cum qui asperiores. Quo assumenda sed modi quo unde. Et aut ea sit ut culpa consequatur et in. Hic ut et possimus ad corrupti. Ut expedita dolorum qui animi omnis fuga. Labore eveniet suscipit repellat eligendi. Modi itaque numquam et sit in consequuntur facilis. Fuga amet quo qui magni consequuntur autem. Reprehenderit qui aut saepe qui aut numquam. Sit nisi veritatis quis soluta porro voluptatum voluptate. Harum id non laudantium optio consequatur perspiciatis. Ut sint veniam deserunt inventore voluptas sit. Vel modi eum aliquam. Aliquam qui quisquam error est exercitationem. Nobis id nam sed voluptas sint illum quae cumque. Reiciendis error architecto nesciunt.', 18, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(964593, 'Est sed dolores deserunt.', 'Voluptatem aut non est maiores similique autem officia. Enim explicabo ipsum quae pariatur deserunt sit provident. Beatae molestiae aut laboriosam rerum blanditiis numquam. Saepe facilis eum delectus ratione omnis vel qui. Exercitationem ducimus asperiores porro dignissimos impedit enim natus provident. Numquam id voluptatum totam distinctio consequatur assumenda dolor. Reiciendis temporibus eos ut temporibus harum consectetur. Aut omnis et nobis vero et sed. Quisquam quidem mollitia assumenda. Est ut ducimus voluptatem est explicabo modi doloribus. Aut quas quas rerum aliquid quas rerum. Non quod facilis repudiandae. Molestiae magnam saepe occaecati adipisci. Amet odit tenetur voluptatum animi ut a hic. Debitis non quam et aut exercitationem et. Dolorem accusamus commodi eaque qui reprehenderit. Ut est non aliquam eligendi perspiciatis.', 26, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(970311, 'Quia non et aut.', 'Et odio eaque et voluptatem natus. Ipsum molestiae ullam aut quae at eaque alias ullam. Quod sint impedit quia numquam voluptas repellat natus. Eum voluptas veniam delectus voluptas odit delectus earum. Et ut doloremque consequatur natus sed sint similique. Aut enim voluptatem quia tempore error. Et incidunt voluptas omnis dolor. Optio sit sint natus accusamus et est velit deserunt. Impedit qui et possimus vitae et laborum veniam quasi. Mollitia at rerum ducimus. Sequi ut ut dolorum eveniet. Error eos reiciendis dolore excepturi qui. Qui distinctio aut fugit dignissimos placeat et eos. Et aut magnam hic dolor enim tempora voluptatibus. Et incidunt amet culpa. Illum et nulla minus laboriosam amet voluptas.', 198, '2023-03-02 06:52:13', '2023-03-02 06:52:13', 2),
(973649, 'Nam ex eligendi aut possimus.', 'Perferendis illo aut ut voluptatem eius sint. Hic dolorum autem possimus enim maiores. Possimus nisi corrupti quo. Voluptatem aut vel voluptatem est. Dolorem qui quia ex consequatur quia sed rerum. Voluptatibus odit eum sed sed iste odio. Voluptatem minima assumenda possimus nisi vero sed. Quaerat sunt tempore aliquid. Nemo quisquam facere tempora. Et quae laudantium voluptates labore accusantium. Non itaque eos ea est ut sint. Quaerat quo et et iusto. Quod aspernatur corrupti veniam accusamus labore dolor. Hic occaecati doloremque voluptas perferendis. Vero et reprehenderit non est.', 164, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1),
(978070, 'Aliquid corrupti labore et error.', 'Autem aut excepturi praesentium architecto saepe repellat. Vel velit quasi cupiditate fugiat. Qui est rerum esse asperiores. Saepe sed exercitationem laboriosam adipisci omnis ut laborum impedit. Temporibus aut nemo voluptates. Sapiente voluptatem fuga tempore debitis. Quisquam eius illo hic numquam. Velit odit sunt et sequi. Sed a sapiente omnis molestias. Veritatis modi reiciendis molestiae in iusto repudiandae facilis. Eveniet et dignissimos asperiores vitae veniam architecto. Quia quaerat commodi incidunt doloremque dolor iste. Accusantium ad porro mollitia facilis non. Laudantium autem sint quaerat sed. Blanditiis numquam enim perspiciatis ipsum dolorum sunt qui omnis. Sed aut quae magni sed sint quia. Delectus nesciunt rerum voluptatem consectetur non illo cupiditate.', 102, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 3),
(997418, 'Voluptatem odit aliquam doloremque amet.', 'Quidem omnis similique ea fugiat. Nihil qui iure omnis ab deleniti. Et nisi eveniet et qui quod possimus. Voluptates dolorem sint totam iusto quia. Quisquam animi esse incidunt. Labore ex aut eos. Est est aut molestiae consectetur. Laboriosam esse inventore eos porro consequatur officia eos. Vero voluptas delectus occaecati delectus blanditiis culpa. Alias odio et magni eveniet alias. Et possimus atque est maxime hic modi eveniet. Dolor et repellendus itaque tempore. Iusto explicabo nesciunt laborum error qui ratione aut. Atque quis harum quidem quia deleniti delectus. Possimus ex quae totam hic. Repellendus optio omnis odio molestiae. Incidunt dolorum rerum exercitationem consequatur incidunt qui. Ut ipsa optio et. Ut sunt aut eum eum error culpa sed. Ipsum ab enim quia fuga sed. Commodi repellat enim et blanditiis. Dicta consequatur voluptatem nobis laborum accusantium officia et. Occaecati voluptatibus inventore consequatur voluptatem dicta enim. Qui nihil iste mollitia assumenda error. Consequatur dolorem similique adipisci et est et et. Perferendis aut et ex voluptatem ipsam. Voluptas cum eius consectetur ad. Sequi doloremque velit laudantium vel consequatur ea non voluptate.', 15, '2023-03-02 06:52:12', '2023-03-02 06:52:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(46, '2014_10_12_000000_create_users_table', 1),
(47, '2014_10_12_100000_create_password_resets_table', 1),
(48, '2019_08_19_000000_create_failed_jobs_table', 1),
(49, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(50, '2023_01_13_141542_create_forum_posts_table', 1),
(51, '2023_01_25_230534_create_etudiants_table', 1),
(52, '2023_02_26_223632_create_types_table', 1),
(53, '2023_03_01_035908_create_villes_table', 1),
(54, '2023_03_01_063939_create_profiles_table', 1);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `prenom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_de_naissance` date NOT NULL,
  `villeId` int(10) UNSIGNED NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `prenom`, `nom`, `adresse`, `phone`, `email`, `image`, `date_de_naissance`, `villeId`, `type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(104923, 'Miss Esperanza Schumm Sr.', 'Hilpert', '2748 Senger Viaduct Apt. 716\nEast August, MO 03838-9104', '+1 (501) 731-4565', 'kauer@example.net', 'https://faces-img.xcdn.link/image-lorem-face-531.jpg', '1962-12-16', 93170, 3, 130, '2023-03-02 23:58:22', '2023-03-03 00:17:34'),
(108801, 'Madisyn Reichert', 'Kemmer', '59038 Telly Viaduct\nRafaelashire, NH 96959-6166', '+1-669-506-4627', 'kemmer.shanel@example.org', 'https://faces-img.xcdn.link/image-lorem-face-722.jpg', '1929-12-04', 43577, 864145, 115, '2023-03-03 03:40:09', '2023-03-02 07:48:28'),
(110774, 'Lea Huel', 'Heidenreich', '684 Larkin Courts Apt. 748\nWest Dave, WV 58641-6889', '+1.662.387.9445', 'kelli.stiedemann@example.com', 'https://faces-img.xcdn.link/image-lorem-face-3806.jpg', '1939-02-13', 51425, 864145, 183, '2023-03-02 07:22:28', '2023-03-02 08:02:28'),
(114026, 'Vicenta Conroy', 'Pollich', '772 Kovacek Viaduct\nLemkemouth, NV 41303-8842', '+1 (814) 204-8663', 'anais.heaney@example.com', 'https://faces-img.xcdn.link/image-lorem-face-3083.jpg', '2000-02-17', 69859, 2, 124, '2023-03-02 13:07:23', '2023-03-02 07:46:19'),
(117817, 'Freddy Beier', 'Streich', '928 Larson Isle\nNew Evangelinefort, CO 60817', '+1 (283) 612-0018', 'jamison07@example.com', 'https://faces-img.xcdn.link/image-lorem-face-1383.jpg', '1964-11-30', 57781, 2, 148, '2023-03-02 07:08:17', '2023-03-02 18:44:16'),
(123110, 'Adriel Reichel', 'Jenkins', '505 Eusebio Hills\nCletusfurt, KY 24018-0837', '+18303246094', 'icie.glover@example.org', 'https://faces-img.xcdn.link/image-lorem-face-2422.jpg', '1954-06-10', 73896, 991961, 179, '2023-03-02 13:43:21', '2023-03-02 07:12:59'),
(147077, 'River Gutkowski', 'Langosh', '7581 Krystina Valleys Suite 141\nGrimesburgh, ID 43929', '985-648-0827', 'kiel.sawayn@example.com', 'https://faces-img.xcdn.link/image-lorem-face-5952.jpg', '1975-02-16', 19400, 1, 123, '2023-03-02 12:25:19', '2023-03-02 18:58:10'),
(163003, 'Melyna Blanda II', 'Nienow', '71684 Ebba Rapid\nSchimmelland, TX 66271-3008', '(580) 581-6092', 'melyssa83@example.net', 'https://faces-img.xcdn.link/image-lorem-face-6684.jpg', '1927-10-20', 19400, 771259, 129, '2023-03-02 15:24:07', '2023-03-02 07:20:46'),
(170627, 'Amina Muller', 'Jacobson', '16606 Beau Fords Apt. 108\nEast Celestinochester, PA 86652-2169', '413.480.2802', 'mgleichner@example.net', 'https://faces-img.xcdn.link/image-lorem-face-3167.jpg', '1976-10-13', 93170, 779240, 156, '2023-03-02 16:23:47', '2023-03-02 22:43:46'),
(189181, 'Tatyana Kautzer', 'Gleichner', '1702 Dietrich Pines\nWatsicaland, NY 01806-2543', '+1-989-847-9431', 'haag.georgianna@example.com', 'https://faces-img.xcdn.link/image-lorem-face-1452.jpg', '1968-08-18', 43577, 3, 121, '2023-03-02 05:36:49', '2023-03-02 20:48:38'),
(210584, 'Keagan Bauch', 'Nitzsche', '4229 Buckridge Loop Apt. 840\nGusikowskifurt, IN 40219', '+1-458-685-4127', 'henriette77@example.org', 'https://faces-img.xcdn.link/image-lorem-face-2068.jpg', '1948-12-09', 93170, 208976, 155, '2023-03-02 17:31:29', '2023-03-03 01:54:29'),
(236945, 'Prof. Sandra McCullough', 'Luettgen', '91873 Valerie Row Suite 613\nGreggshire, GA 58278', '+1-828-818-6917', 'nienow.dora@example.com', 'https://faces-img.xcdn.link/image-lorem-face-4.jpg', '1995-06-27', 43577, 779240, 147, '2023-03-02 22:11:26', '2023-03-02 08:03:30'),
(260863, 'Nathanael Stoltenberg MD', 'Hirthe', '3921 Gislason Ford Apt. 561\nBridgetport, TX 32253', '650.896.8980', 'denesik.viola@example.com', 'https://faces-img.xcdn.link/image-lorem-face-6257.jpg', '1948-02-04', 16631, 771259, 193, '2023-03-02 12:03:09', '2023-03-02 13:34:28'),
(264833, 'Jennyfer Altenwerth', 'Rosenbaum', '4724 Ladarius Inlet Apt. 445\nSouth Frankland, UT 47449', '(458) 770-9998', 'ebba.cronin@example.com', 'https://faces-img.xcdn.link/image-lorem-face-3140.jpg', '1999-12-11', 69859, 1, 139, '2023-03-03 04:51:30', '2023-03-03 03:28:27'),
(266377, 'Danielle Hodkiewicz II', 'Harvey', '44551 Stokes Common Suite 598\nLake Hendersonfurt, DC 84113', '(352) 431-8441', 'padberg.onie@example.org', 'https://faces-img.xcdn.link/image-lorem-face-6144.jpg', '2012-02-17', 57781, 779240, 128, '2023-03-02 11:39:21', '2023-03-02 22:13:00'),
(269087, 'Ms. Lou Gislason', 'Gulgowski', '89098 Ruecker Shores Apt. 356\nLowehaven, IL 80428-7669', '+12539126519', 'adams.kiel@example.com', 'https://faces-img.xcdn.link/image-lorem-face-2595.jpg', '2006-10-12', 51425, 771259, 190, '2023-03-03 02:28:40', '2023-03-02 20:59:00'),
(283009, 'Enid Kovacek', 'Littel', '103 Verlie Mountain Suite 591\nMatteofurt, WV 47827', '(262) 335-9867', 'fleta.funk@example.net', 'https://faces-img.xcdn.link/image-lorem-face-3477.jpg', '1935-12-18', 19400, 208976, 196, '2023-03-02 23:50:50', '2023-03-02 20:22:01'),
(283659, 'Christy Erdman', 'Lesch', '167 Jordy Grove\nEast Lewisburgh, RI 48914-8653', '1-678-697-3324', 'cwillms@example.org', 'https://faces-img.xcdn.link/image-lorem-face-2898.jpg', '2002-11-04', 69859, 1, 171, '2023-03-02 12:03:05', '2023-03-03 03:03:22'),
(286910, 'Dr. Giuseppe Pfannerstill MD', 'Abshire', '42381 Sawayn Canyon Suite 503\nIkemouth, TX 90621-6970', '567-737-9710', 'ross.kirlin@example.com', 'https://faces-img.xcdn.link/image-lorem-face-754.jpg', '1945-12-05', 73896, 779240, 173, '2023-03-02 20:32:28', '2023-03-02 23:39:42'),
(294052, 'Frank Cummings', 'Olson', '8801 Dolores Lights Suite 922\nEast Ellen, VT 44585', '(469) 360-9778', 'kking@example.net', 'https://faces-img.xcdn.link/image-lorem-face-1063.jpg', '1950-11-01', 41630, 991961, 126, '2023-03-02 15:00:32', '2023-03-02 20:28:31'),
(294570, 'Miss Camylle Homenick', 'Hilpert', '2062 Alexie Falls\nEast Gretchen, NH 87165-8278', '+1.743.429.7748', 'xkoss@example.net', 'https://faces-img.xcdn.link/image-lorem-face-1913.jpg', '1970-03-05', 57781, 208976, 175, '2023-03-02 21:59:45', '2023-03-02 09:19:52'),
(310838, 'Frederic Bergstrom Jr.', 'Swift', '88335 Luettgen Ways\nWest Era, SD 04049-0551', '1-210-309-0060', 'stuart81@example.net', 'https://faces-img.xcdn.link/image-lorem-face-3164.jpg', '1931-08-14', 19400, 991961, 185, '2023-03-03 00:26:33', '2023-03-03 02:07:02'),
(312450, 'Minerva Hamill Sr.', 'Schulist', '76314 Gulgowski Isle Apt. 707\nNorth Santiagotown, WA 47117-4399', '+1-743-570-6632', 'leannon.mckenna@example.org', 'https://faces-img.xcdn.link/image-lorem-face-859.jpg', '1950-01-29', 69859, 771259, 153, '2023-03-02 16:58:16', '2023-03-03 04:38:07'),
(313215, 'Melody Hill', 'Cremin', '1183 Lindgren Grove Suite 582\nLeannafort, TN 68325-9604', '719-424-7404', 'pmcdermott@example.net', 'https://faces-img.xcdn.link/image-lorem-face-3428.jpg', '1960-03-26', 73896, 208976, 107, '2023-03-02 16:31:03', '2023-03-03 01:21:51'),
(314018, 'Miles Hoeger I', 'Kerluke', '7436 Connor Stream Suite 208\nGrantfurt, VT 18279-6673', '+1 (650) 369-5845', 'lerdman@example.com', 'https://faces-img.xcdn.link/image-lorem-face-6034.jpg', '1993-02-28', 43577, 2, 111, '2023-03-03 00:55:14', '2023-03-02 22:03:54'),
(351599, 'Ciara Stokes', 'Mante', '172 Casper Prairie Suite 874\nCasperborough, ND 97468', '+1-949-920-4053', 'dmorar@example.net', 'https://faces-img.xcdn.link/image-lorem-face-1589.jpg', '1949-10-16', 73896, 1, 169, '2023-03-02 15:04:41', '2023-03-03 04:20:25'),
(375304, 'Myrna Mosciski', 'Kemmer', '78297 Shanel Squares Suite 390\nPort Savannah, CT 87642', '+1-323-895-9207', 'virgil.friesen@example.org', 'https://faces-img.xcdn.link/image-lorem-face-1693.jpg', '2003-03-12', 43577, 2, 194, '2023-03-02 15:21:57', '2023-03-02 13:44:45'),
(377356, 'Zack Conn', 'Gottlieb', '49557 Devin Branch\nSouth Darwinstad, NY 56176-1579', '+1-253-865-2461', 'jorn@example.com', 'https://faces-img.xcdn.link/image-lorem-face-3725.jpg', '1956-05-02', 19400, 1, 154, '2023-03-02 14:53:08', '2023-03-02 22:25:54'),
(384025, 'Nola Purdy V', 'Prohaska', '438 Ortiz Plaza Apt. 151\nEast Lelashire, WI 90529-8495', '+1-254-989-2060', 'mills.brittany@example.com', 'https://faces-img.xcdn.link/image-lorem-face-131.jpg', '1925-05-23', 70315, 2, 125, '2023-03-02 21:59:24', '2023-03-02 11:42:00'),
(403259, 'Cary Leuschke', 'Rosenbaum', '6578 Adrien Inlet Suite 081\nWest Halie, MN 63964', '574.807.3159', 'jovani.oconner@example.com', 'https://faces-img.xcdn.link/image-lorem-face-3921.jpg', '1985-10-03', 73896, 779240, 141, '2023-03-02 18:15:45', '2023-03-03 01:10:21'),
(406521, 'Jeanette Maggio', 'Carter', '5661 Vicenta Well\nLake Ambrose, AR 03347-4458', '+12313279401', 'okon.grace@example.com', 'https://faces-img.xcdn.link/image-lorem-face-2315.jpg', '2011-02-03', 19400, 3, 197, '2023-03-02 10:46:16', '2023-03-02 20:15:56'),
(414295, 'Dr. Geovanny Lebsack', 'Kassulke', '16566 Keeling Corner Suite 818\nGibsonstad, WI 50248', '1-689-207-6381', 'fmiller@example.com', 'https://faces-img.xcdn.link/image-lorem-face-3528.jpg', '2007-07-14', 57781, 3, 160, '2023-03-02 14:15:02', '2023-03-02 15:50:30'),
(424805, 'Tomasa Schneider', 'Brekke', '35192 Earnestine Pines Suite 596\nWebershire, ME 37371', '+1-872-841-2901', 'dangelo74@example.org', 'https://faces-img.xcdn.link/image-lorem-face-1878.jpg', '2014-08-27', 41630, 779240, 192, '2023-03-02 20:53:35', '2023-03-03 01:04:33'),
(437805, 'Arturo Wilkinson', 'Homenick', '3799 Arnulfo Mews Apt. 603\nVioletborough, SD 09643', '+1-757-816-5836', 'zschneider@example.com', 'https://faces-img.xcdn.link/image-lorem-face-3927.jpg', '1953-07-20', 41630, 1, 178, '2023-03-03 01:06:46', '2023-03-03 02:52:25'),
(441487, 'Kale Durgan', 'Kihn', '74765 Nyasia Glen Apt. 694\nEast Darrellbury, VA 88489', '+1-941-979-1417', 'huel.maci@example.com', 'https://faces-img.xcdn.link/image-lorem-face-3853.jpg', '2020-06-06', 93170, 208976, 162, '2023-03-02 08:31:27', '2023-03-02 08:04:43'),
(448402, 'Prof. Sydney Koelpin', 'Anderson', '51676 Mills Key Apt. 052\nYadirachester, MI 06826', '+15039277676', 'jedidiah.hagenes@example.com', 'https://faces-img.xcdn.link/image-lorem-face-6698.jpg', '1968-04-03', 93170, 2, 195, '2023-03-02 05:28:54', '2023-03-03 00:39:36'),
(451565, 'Deonte Lakin DVM', 'Boehm', '32288 Pagac Drives Suite 468\nProsaccoberg, OR 23104-1616', '1-708-383-3745', 'marks.vern@example.com', 'https://faces-img.xcdn.link/image-lorem-face-938.jpg', '1949-08-09', 41630, 208976, 177, '2023-03-02 08:58:12', '2023-03-03 03:24:54'),
(480946, 'Donavon Larson II', 'Cormier', '580 Marcelino Creek\nPaulineberg, NV 41920', '+18633337796', 'nakia.powlowski@example.org', 'https://faces-img.xcdn.link/image-lorem-face-5675.jpg', '1971-05-21', 73896, 2, 167, '2023-03-03 01:04:33', '2023-03-02 15:38:29'),
(493598, 'Katheryn Doyle', 'Cruickshank', '576 Will Divide\nWest Andersonmouth, KY 96250', '872-940-8478', 'rose.hickle@example.net', 'https://faces-img.xcdn.link/image-lorem-face-3104.jpg', '1955-09-11', 19400, 208976, 103, '2023-03-02 17:21:34', '2023-03-02 23:54:13'),
(496405, 'Bartholome Jenkins', 'Schamberger', '71852 Skyla Ports\nLake Brandt, ND 36828', '+1 (334) 816-0180', 'terrell.nikolaus@example.com', 'https://faces-img.xcdn.link/image-lorem-face-4765.jpg', '1958-06-11', 19400, 208976, 134, '2023-03-03 03:08:03', '2023-03-02 18:26:06'),
(498428, 'Marjolaine Hodkiewicz IV', 'Spinka', '76850 Walter Glen\nCorwinview, KS 34508-2568', '1-347-898-7824', 'tebert@example.net', 'https://faces-img.xcdn.link/image-lorem-face-3393.jpg', '1989-09-05', 93170, 779240, 110, '2023-03-03 02:56:34', '2023-03-02 15:19:54'),
(500162, 'Cassidy Oberbrunner', 'Schmeler', '991 Meghan Plains Apt. 405\nMillsfurt, SC 86819-1499', '(509) 219-7488', 'weimann.isaias@example.com', 'https://faces-img.xcdn.link/image-lorem-face-5303.jpg', '1948-05-07', 43577, 1, 182, '2023-03-02 20:01:18', '2023-03-02 21:29:47'),
(516882, 'Brenda Farrell', 'Wyman', '9219 Ortiz Skyway\nVilmaberg, TX 13450-7496', '+1-530-860-7331', 'langworth.kenneth@example.com', 'https://faces-img.xcdn.link/image-lorem-face-3366.jpg', '1949-11-12', 16631, 771259, 142, '2023-03-03 01:24:36', '2023-03-02 11:50:55'),
(531607, 'Mr. Amos Gottlieb', 'Davis', '53948 Jordane Mountains Suite 843\nAnnabelchester, AR 54347-3676', '225.382.7497', 'lebsack.maudie@example.org', 'https://faces-img.xcdn.link/image-lorem-face-2203.jpg', '1950-12-25', 16631, 1, 144, '2023-03-02 09:52:18', '2023-03-02 07:45:53'),
(565532, 'Mr. Arden Jacobson V', 'Feest', '2210 Rice Causeway\nNew Abbey, TX 78200-5380', '+1-319-246-4760', 'kale.schowalter@example.org', 'https://faces-img.xcdn.link/image-lorem-face-4636.jpg', '1944-05-07', 51425, 779240, 131, '2023-03-02 19:26:30', '2023-03-02 12:19:20'),
(565693, 'Chris Wintheiser', 'Willms', '19745 Luettgen Fort Apt. 411\nPort Sigurdstad, AZ 09390-7787', '737.673.7230', 'kyler.dibbert@example.org', 'https://faces-img.xcdn.link/image-lorem-face-6726.jpg', '1993-12-20', 93170, 1, 161, '2023-03-02 21:17:21', '2023-03-02 21:51:49'),
(567337, 'Annie Rau', 'Rice', '63107 Mayert Flats\nNorth Jamie, OH 51950-4894', '561-585-9806', 'schaden.neil@example.net', 'https://faces-img.xcdn.link/image-lorem-face-1265.jpg', '1953-07-12', 51425, 864145, 157, '2023-03-02 18:34:50', '2023-03-03 01:25:43'),
(571901, 'Pearlie Ryan', 'Collier', '6631 Margaret Villages Apt. 623\nWest Johnathanfort, NV 34574-4889', '475-855-9390', 'csatterfield@example.com', 'https://faces-img.xcdn.link/image-lorem-face-6514.jpg', '1988-06-19', 93170, 1, 106, '2023-03-02 08:01:18', '2023-03-02 18:16:58'),
(576439, 'Brielle Bayer', 'Weissnat', '849 Feil Freeway\nSouth Rosendo, ID 91356', '+13177404478', 'kennedi.brakus@example.com', 'https://faces-img.xcdn.link/image-lorem-face-4017.jpg', '1925-12-17', 19400, 771259, 105, '2023-03-02 12:22:06', '2023-03-02 17:03:16'),
(586830, 'Alyson Swaniawski', 'Wiegand', '137 Little Unions\nAlexandreaberg, NH 61542-7268', '(484) 339-0722', 'tillman.cory@example.org', 'https://faces-img.xcdn.link/image-lorem-face-3316.jpg', '1985-10-06', 43577, 2, 166, '2023-03-02 21:18:01', '2023-03-02 16:33:35'),
(587984, 'Amelie Heller I', 'Heidenreich', '693 Shanon Forge\nKlingborough, MA 62612', '734-720-2593', 'howell04@example.com', 'https://faces-img.xcdn.link/image-lorem-face-3038.jpg', '2002-11-12', 43577, 2, 145, '2023-03-03 00:01:05', '2023-03-02 19:34:43'),
(596329, 'Gretchen Tremblay', 'Smith', '7378 Kuhn Spur\nEmiechester, MI 62282-3506', '+13207670448', 'maggie.abbott@example.com', 'https://faces-img.xcdn.link/image-lorem-face-1572.jpg', '1961-09-14', 69859, 2, 143, '2023-03-02 19:20:26', '2023-03-02 16:23:13'),
(596568, 'Elmira Labadie', 'Farrell', '73876 Eldred Villages Suite 685\nEast Jedidiahshire, SD 06193', '(765) 392-7599', 'nathen96@example.net', 'https://faces-img.xcdn.link/image-lorem-face-5909.jpg', '1950-12-29', 93170, 208976, 137, '2023-03-02 20:54:10', '2023-03-02 16:02:58'),
(611200, 'Rosemarie Dietrich', 'Little', '2184 Steuber Key\nLittelville, DE 06842', '+1-816-982-1048', 'lottie06@example.net', 'https://faces-img.xcdn.link/image-lorem-face-3064.jpg', '1932-02-09', 43577, 779240, 109, '2023-03-02 23:21:48', '2023-03-02 17:09:49'),
(620638, 'Filiberto Steuber', 'Wehner', '48982 Goldner Roads\nTheahaven, ND 55980-2259', '(650) 404-6391', 'kyle.mcglynn@example.net', 'https://faces-img.xcdn.link/image-lorem-face-1082.jpg', '1992-09-20', 51425, 208976, 198, '2023-03-02 18:20:32', '2023-03-03 04:29:32'),
(624782, 'Courtney Kulas PhD', 'Hudson', '382 Alberta Via\nKirlinside, GA 31050', '678-284-1999', 'qdicki@example.com', 'https://faces-img.xcdn.link/image-lorem-face-6524.jpg', '1935-06-28', 43577, 864145, 152, '2023-03-02 08:52:14', '2023-03-03 02:12:05'),
(633407, 'Rhett Denesik', 'Prosacco', '92303 Yvonne Mountain\nSkilesmouth, NV 73210-5505', '+18208972267', 'pinkie.dickens@example.net', 'https://faces-img.xcdn.link/image-lorem-face-3222.jpg', '1948-12-07', 19400, 864145, 170, '2023-03-02 12:13:13', '2023-03-02 16:27:46'),
(635001, 'Colin Carroll', 'Considine', '6603 Senger Parks\nAvistown, PA 25362-0776', '+1-660-220-0333', 'hskiles@example.net', 'https://faces-img.xcdn.link/image-lorem-face-6414.jpg', '2022-04-05', 19400, 1, 119, '2023-03-02 16:32:28', '2023-03-02 11:00:27'),
(649144, 'Kory McDermott', 'Bogisich', '105 Simonis Wall Suite 917\nErikamouth, IN 37098-6190', '680.470.9678', 'ernser.jason@example.com', 'https://faces-img.xcdn.link/image-lorem-face-1152.jpg', '1923-08-04', 19400, 779240, 116, '2023-03-03 00:04:47', '2023-03-02 08:23:32'),
(664281, 'Alessandra Upton PhD', 'Gottlieb', '4669 Pinkie Burgs\nPort Justina, MD 56780', '480-920-9126', 'leila36@example.net', 'https://faces-img.xcdn.link/image-lorem-face-3712.jpg', '1956-05-28', 69859, 3, 138, '2023-03-02 22:29:30', '2023-03-03 00:50:00'),
(666061, 'Georgianna Leuschke', 'Kiehn', '78177 Mohr Fall\nAlfredobury, RI 10452', '+1-364-416-1682', 'alfonso72@example.org', 'https://faces-img.xcdn.link/image-lorem-face-4689.jpg', '2015-11-08', 73896, 779240, 114, '2023-03-02 06:33:58', '2023-03-02 20:34:11'),
(709090, 'Destiney Schinner', 'Becker', '16677 White Port\nEast Melvinamouth, HI 34308-3488', '+1-703-653-5198', 'alberta.jacobs@example.net', 'https://faces-img.xcdn.link/image-lorem-face-4980.jpg', '1970-04-25', 16631, 864145, 189, '2023-03-02 15:18:35', '2023-03-02 23:42:41'),
(718712, 'Mr. Elwyn Krajcik', 'Bartoletti', '72100 Thompson Lodge Suite 038\nPort Osvaldofort, GA 02921', '1-260-550-3378', 'gerhold.olin@example.net', 'https://faces-img.xcdn.link/image-lorem-face-5810.jpg', '1980-12-18', 43577, 3, 186, '2023-03-03 03:31:58', '2023-03-02 13:36:42'),
(736025, 'Jensen Sporer', 'Batz', '24118 Lila Light\nMiaside, KY 33963-2536', '781-232-1842', 'greg.schaefer@example.com', 'https://faces-img.xcdn.link/image-lorem-face-1875.jpg', '1940-04-06', 51425, 991961, 158, '2023-03-03 03:54:06', '2023-03-02 09:32:20'),
(739351, 'Zachariah Bergstrom', 'Schowalter', '8910 Elmo Crossing Apt. 303\nIsraelborough, OK 14486-0890', '1-231-930-7950', 'king.elvie@example.org', 'https://faces-img.xcdn.link/image-lorem-face-6009.jpg', '1991-06-10', 57781, 991961, 122, '2023-03-02 09:07:04', '2023-03-03 03:36:34'),
(753099, 'Caitlyn Russel', 'Hessel', '8874 Jacobs Path Apt. 202\nSouth Fannie, MN 32721-8269', '+1-458-269-8529', 'karlee78@example.net', 'https://faces-img.xcdn.link/image-lorem-face-2044.jpg', '1932-10-15', 51425, 771259, 101, '2023-03-02 12:35:52', '2023-03-02 21:43:25'),
(780553, 'Jamir Champlin', 'Lynch', '717 Daija Drive Suite 704\nWainohaven, MN 98977', '337-524-9748', 'stracke.susie@example.com', 'https://faces-img.xcdn.link/image-lorem-face-4015.jpg', '1937-10-09', 69859, 208976, 132, '2023-03-02 06:08:18', '2023-03-02 19:06:10'),
(791678, 'Hershel Price', 'Wiza', '185 Ledner Club Apt. 941\nVonRuedenborough, PA 10968-1085', '360.212.0623', 'kailyn.steuber@example.com', 'https://faces-img.xcdn.link/image-lorem-face-1408.jpg', '1933-09-21', 93170, 771259, 104, '2023-03-02 08:19:43', '2023-03-02 14:54:37'),
(796062, 'Ms. Arielle Konopelski', 'Bednar', '82918 Brain Manor Apt. 435\nWest Angeline, RI 89314', '+1 (928) 971-4960', 'dolly78@example.com', 'https://faces-img.xcdn.link/image-lorem-face-5034.jpg', '1976-05-09', 16631, 864145, 164, '2023-03-02 14:49:29', '2023-03-02 07:22:16'),
(814255, 'Ms. Allison Moore II', 'Gutmann', '486 Janessa Ramp Suite 056\nProhaskashire, NC 65364', '772-566-2546', 'ijohnson@example.com', 'https://faces-img.xcdn.link/image-lorem-face-5063.jpg', '1991-10-27', 70315, 1, 140, '2023-03-02 21:37:34', '2023-03-02 12:12:03'),
(843379, 'Ms. Mafalda Halvorson', 'Turcotte', '1775 Schaden Cape Suite 635\nNorth Margaritabury, NY 73314', '1-424-723-7555', 'prosacco.hans@example.org', 'https://faces-img.xcdn.link/image-lorem-face-2611.jpg', '1957-05-13', 19400, 771259, 165, '2023-03-03 02:44:20', '2023-03-02 21:40:07'),
(853229, 'Terence Feil', 'Brakus', '4616 Gerhold Locks\nPort Ofeliaborough, AK 38464', '1-747-691-3097', 'ward.moises@example.net', 'https://faces-img.xcdn.link/image-lorem-face-1684.jpg', '1934-12-17', 93170, 991961, 133, '2023-03-02 11:27:34', '2023-03-03 04:43:41'),
(854921, 'Dr. Melvin Gusikowski', 'Hartmann', '613 Justine Ridge Apt. 026\nNorth Emiltown, AK 04287', '+1-878-800-1633', 'larson.geovanni@example.com', 'https://faces-img.xcdn.link/image-lorem-face-5927.jpg', '1950-05-10', 19400, 991961, 112, '2023-03-02 11:05:12', '2023-03-02 21:44:49'),
(855396, 'Dr. Kylee Toy', 'Wehner', '17945 Mayert Skyway Suite 049\nKubberg, OR 61497-5232', '617-625-0750', 'summer.stehr@example.com', 'https://faces-img.xcdn.link/image-lorem-face-1603.jpg', '1941-07-20', 73896, 2, 199, '2023-03-02 09:42:46', '2023-03-02 23:47:40'),
(872564, 'Misael Rohan', 'Jones', '6038 Juliana Pine\nLake Stacyton, MS 01814', '830.695.9884', 'maureen.bruen@example.org', 'https://faces-img.xcdn.link/image-lorem-face-981.jpg', '2010-04-12', 93170, 2, 176, '2023-03-02 13:18:04', '2023-03-02 23:55:25'),
(885741, 'Manuela Murphy V', 'Fadel', '5119 Tommie Groves\nEast Wilfredo, KS 28815', '678.827.1779', 'adams.damion@example.org', 'https://faces-img.xcdn.link/image-lorem-face-4055.jpg', '1929-11-17', 93170, 2, 151, '2023-03-02 09:04:19', '2023-03-02 06:01:44'),
(888559, 'Graciela Schmitt', 'Kuhic', '99752 Adams Keys\nBergstrommouth, MT 95176', '972.697.6411', 'reuben60@example.com', 'https://faces-img.xcdn.link/image-lorem-face-3574.jpg', '1927-06-27', 57781, 771259, 127, '2023-03-02 12:16:45', '2023-03-02 18:59:49'),
(888568, 'Santa Daugherty', 'Schulist', '28070 Marcus Lodge Apt. 722\nNew Fannietown, WA 92339-5408', '+1.980.368.8014', 'rudolph08@example.org', 'https://faces-img.xcdn.link/image-lorem-face-1963.jpg', '1993-10-19', 41630, 991961, 117, '2023-03-02 09:42:59', '2023-03-02 05:11:54'),
(897968, 'Mr. Chaz Mueller', 'Spinka', '6779 Bogisich Ferry\nDonatoport, FL 22253', '843-495-5731', 'scollier@example.org', 'https://faces-img.xcdn.link/image-lorem-face-4855.jpg', '1959-08-29', 93170, 2, 135, '2023-03-02 11:24:09', '2023-03-02 22:58:02'),
(902565, 'Sierra Brown', 'Huel', '8611 Ezra Cliffs Apt. 059\nLake Axel, NH 62532-6670', '1-352-340-4923', 'russell64@example.org', 'https://faces-img.xcdn.link/image-lorem-face-1519.jpg', '1968-02-14', 73896, 3, 168, '2023-03-02 12:37:37', '2023-03-02 10:01:40'),
(905044, 'Rahsaan Lemke', 'Goyette', '5735 Evert Neck\nWest Frida, PA 98456', '+1-516-707-3816', 'igerlach@example.net', 'https://faces-img.xcdn.link/image-lorem-face-3727.jpg', '2011-03-04', 16631, 3, 181, '2023-03-02 14:01:47', '2023-03-02 09:21:31'),
(907572, 'Hermann Schiller', 'Schinner', '5900 Hudson Mills Suite 199\nNew Melany, NC 34678', '+1-423-274-0857', 'vivienne09@example.org', 'https://faces-img.xcdn.link/image-lorem-face-816.jpg', '2021-01-05', 43577, 864145, 180, '2023-03-02 20:40:02', '2023-03-02 11:05:04'),
(908734, 'Miss Skyla Douglas DDS', 'Simonis', '921 Heidenreich Mountain Suite 830\nSouth Micheleville, NY 22282', '(458) 794-1185', 'myrna.leuschke@example.com', 'https://faces-img.xcdn.link/image-lorem-face-6568.jpg', '1923-09-17', 57781, 2, 146, '2023-03-03 04:40:48', '2023-03-02 06:57:26'),
(916613, 'Bobby Bode Sr.', 'Kozey', '39823 Ransom Well\nPeteshire, AK 63235', '380.968.4158', 'joanny.von@example.org', 'https://faces-img.xcdn.link/image-lorem-face-2185.jpg', '1998-08-23', 73896, 779240, 187, '2023-03-03 02:10:34', '2023-03-02 23:30:42'),
(922501, 'Michele Dicki Sr.', 'Corkery', '337 Cyril Track Apt. 005\nJacobsbury, VA 81975-8133', '+1.510.742.3771', 'lenny44@example.org', 'https://faces-img.xcdn.link/image-lorem-face-13.jpg', '1924-12-10', 51425, 2, 149, '2023-03-02 08:11:29', '2023-03-02 19:23:27'),
(926727, 'Vicky Koch MD', 'Cummerata', '99413 Zola Branch Apt. 827\nLake Americofurt, CT 33293', '+17153510514', 'felicity49@example.com', 'https://faces-img.xcdn.link/image-lorem-face-4617.jpg', '1972-04-16', 73896, 864145, 118, '2023-03-03 00:21:59', '2023-03-02 05:25:15'),
(930566, 'Vesta Satterfield II', 'Skiles', '36328 Reichel Hills Apt. 668\nSouth Ethylberg, ND 22610-0478', '+14148553095', 'awolf@example.net', 'https://faces-img.xcdn.link/image-lorem-face-5947.jpg', '1994-12-13', 93170, 208976, 174, '2023-03-02 09:26:45', '2023-03-03 02:56:38'),
(931276, 'Stefanie Eichmann', 'Keeling', '275 Alexa Estates Suite 665\nNew Deannahaven, OK 41361', '(651) 304-7759', 'rowe.haylie@example.net', 'https://faces-img.xcdn.link/image-lorem-face-5640.jpg', '2018-03-18', 93170, 864145, 113, '2023-03-02 15:07:07', '2023-03-03 00:13:23'),
(947856, 'Katelin Roob', 'Smith', '13472 Judge Cape\nNew Kale, WI 18537-9219', '+17633259751', 'gavin.stehr@example.net', 'https://faces-img.xcdn.link/image-lorem-face-6254.jpg', '1951-04-17', 69859, 208976, 172, '2023-03-02 09:18:40', '2023-03-02 21:06:58'),
(951114, 'Ms. Yasmin Collier DDS', 'Dach', '17135 Lue Harbors\nBahringerport, SC 13823', '(940) 622-9410', 'syble.mante@example.net', 'https://faces-img.xcdn.link/image-lorem-face-4904.jpg', '1997-08-06', 57781, 2, 102, '2023-03-03 00:36:02', '2023-03-02 07:00:23'),
(961704, 'Agustina Shields', 'Kertzmann', '36797 Ceasar Island\nDouglasburgh, TX 19322', '(352) 703-1168', 'victor.johns@example.com', 'https://faces-img.xcdn.link/image-lorem-face-4656.jpg', '1945-07-31', 16631, 771259, 150, '2023-03-03 02:08:43', '2023-03-02 15:35:54'),
(971945, 'Prof. Romaine Kertzmann', 'Hegmann', '11926 VonRueden Bridge\nHoppefort, TX 77046', '+1 (678) 597-5301', 'ewatsica@example.net', 'https://faces-img.xcdn.link/image-lorem-face-563.jpg', '1968-07-14', 51425, 991961, 191, '2023-03-02 22:14:48', '2023-03-02 12:44:11'),
(976838, 'Mr. Robb Wehner DDS', 'Huels', '417 Jett Knoll Suite 418\nKadinbury, TX 73087-1393', '1-458-356-5162', 'vrice@example.org', 'https://faces-img.xcdn.link/image-lorem-face-5607.jpg', '1985-08-14', 41630, 771259, 188, '2023-03-02 09:23:00', '2023-03-03 04:04:28'),
(977216, 'Roselyn Lesch DDS', 'Sporer', '93729 Asia Trafficway\nLake Deronmouth, KS 38834-9998', '1-772-400-2191', 'goyette.jamarcus@example.com', 'https://faces-img.xcdn.link/image-lorem-face-6.jpg', '2001-07-02', 70315, 208976, 163, '2023-03-02 23:32:59', '2023-03-02 09:57:29'),
(977234, 'Vernice Gleason', 'McCullough', '866 Douglas Curve\nNew Tess, VA 45279-4679', '+16405242681', 'larson.name@example.org', 'https://faces-img.xcdn.link/image-lorem-face-6470.jpg', '1959-09-01', 57781, 864145, 136, '2023-03-03 01:18:07', '2023-03-02 08:13:28'),
(977403, 'Evie Rau DDS', 'Carroll', '55334 Stevie Radial Apt. 813\nNorth Maryamborough, AK 00560', '1-580-994-6227', 'rchamplin@example.com', 'https://faces-img.xcdn.link/image-lorem-face-4171.jpg', '1930-11-17', 69859, 864145, 120, '2023-03-02 10:40:42', '2023-03-02 18:52:23'),
(980936, 'Brent Veum', 'Shields', '649 Jacobi Trail Apt. 636\nNorth Ralphport, CT 23679-8215', '+1 (445) 318-9369', 'waino77@example.com', 'https://faces-img.xcdn.link/image-lorem-face-2946.jpg', '1946-05-03', 16631, 3, 159, '2023-03-03 01:30:10', '2023-03-02 12:57:16'),
(981637, 'Justice Braun', 'Paucek', '510 Avery Ranch\nMacejkovicside, DC 33905-9395', '+1.234.362.1085', 'jeanne.kuvalis@example.org', 'https://faces-img.xcdn.link/image-lorem-face-3051.jpg', '2003-11-23', 57781, 771259, 200, '2023-03-02 11:02:22', '2023-03-02 15:45:04'),
(984499, 'Nathen Waters', 'Blick', '741 Farrell Turnpike\nWest Candelarioborough, MD 74898-3405', '1-586-708-4781', 'allan58@example.org', 'https://faces-img.xcdn.link/image-lorem-face-3211.jpg', '1984-11-23', 19400, 771259, 108, '2023-03-03 00:32:22', '2023-03-02 17:15:43'),
(986386, 'Deja Halvorson', 'Carter', '84677 Gulgowski Turnpike\nTheresestad, NE 92576-2622', '+1-559-240-2941', 'pbrekke@example.org', 'https://faces-img.xcdn.link/image-lorem-face-5633.jpg', '1973-09-10', 93170, 3, 184, '2023-03-03 02:35:25', '2023-03-02 20:54:15'),
(986387, 'Pedro', 'Contreras Avendano', '12-283 avenue Laurier Ouest', '15148391246', 'pedro.contreras.avendano@gmail.com', 'echoid.PNG', '2023-03-10', 57781, 1, 201, '2023-03-02 06:52:43', '2023-03-02 06:52:43'),
(986388, 'JENNIFER', 'PHAN', '12-283 avenue Laurier Ouest', '5149637078', 'pedro@gmail.com', 'echoid.PNG', '2023-03-15', 16631, 1, 202, '2023-03-02 07:02:41', '2023-03-02 07:02:41');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `nom`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Étudiant', 'student', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(2, 'Professeur', 'teacher', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(3, 'Visiteur', 'visiteur', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(208976, 'Plating Machine Operator', 'Prof.', '2023-03-02 07:48:43', '2023-03-02 20:49:54'),
(771259, 'Printing Press Machine Operator', 'Dr.', '2023-03-02 17:28:10', '2023-03-02 21:24:06'),
(779240, 'Executive Secretary', 'Dr.', '2023-03-03 00:47:55', '2023-03-02 21:54:33'),
(864145, 'Stone Cutter', 'Mr.', '2023-03-02 11:11:54', '2023-03-02 09:00:45'),
(991961, 'Library Assistant', 'Mrs.', '2023-03-03 01:29:22', '2023-03-03 02:45:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Holden Nolan', 'johnnie.fay@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'X1VaV6NUcV', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(2, 'Nickolas Swift', 'qferry@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PtHslOr6zr', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(3, 'Dr. Juliet Fritsch', 'madilyn59@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HORYoonop6', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(4, 'Mrs. Rebekah Pfeffer Sr.', 'bernard.mcclure@example.org', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LzzcUq9j8y', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(5, 'Callie Rowe PhD', 'abernathy.efren@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ccTw2LiFrp', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(6, 'Prof. Napoleon Dickens DVM', 'juanita.walsh@example.org', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'y2UgvP1qRF', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(7, 'Braeden Reinger', 'zkshlerin@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'NksqD41Gza', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(8, 'Estrella Weber DDS', 'pete.hessel@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '9pzCfgPtjI', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(9, 'Pinkie Prohaska', 'joe.waters@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8cBvfDE6Te', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(10, 'Martin Gleichner', 'lkuphal@example.org', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'IC1pLBwpRm', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(11, 'Nella Fay', 'ametz@example.org', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'xELTQh6DSq', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(12, 'Ansel Will', 'rschulist@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EYRZ2c09wa', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(13, 'Jaylin Gottlieb', 'kattie.rowe@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'RJJP55mv00', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(14, 'Hettie Jerde', 'kilback.kayleigh@example.org', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CAgwNXlCnZ', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(15, 'Elmer Mayert', 'cortney11@example.org', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yVxDIgf4hl', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(16, 'Ryleigh Stoltenberg', 'mmiller@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'mUcVoEQ63s', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(17, 'Amie Cassin I', 'ibosco@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8k5yE8KqyU', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(18, 'Reymundo Haley PhD', 'koss.destany@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2jO8SZ0Lti', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(19, 'Pablo Ankunding I', 'heber.abbott@example.org', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '9YyxJseS8J', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(20, 'Miss Dannie Koelpin', 'kiley04@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yI7dJAPkSt', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(21, 'Kaya DuBuque', 'angela52@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'le2KwEprrT', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(22, 'Prof. Bill Donnelly I', 'ava64@example.org', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'GoILQHCdwK', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(23, 'Rosa Ritchie', 'cindy45@example.org', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YBWcc2NVqv', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(24, 'Prof. Eleazar Strosin', 'floy.klocko@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YUvUTPfyBU', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(25, 'Trevor Harris', 'qjohns@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 's3mJlTIYoD', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(26, 'Prof. Ole Torp II', 'maurice.oreilly@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'SF6ktbAPfR', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(27, 'Hadley Stokes', 'terry.felicita@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gjGBQw65mk', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(28, 'Ramiro Hudson', 'norberto.cole@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '3f3XsWWeJ6', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(29, 'Dr. Nicolette Hoeger DVM', 'nichole85@example.org', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'BEVwtXSXYq', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(30, 'Prof. Kristian Daugherty PhD', 'marquardt.janet@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'g8OVoAYxhe', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(31, 'Mr. Carmine Kreiger I', 'baumbach.holly@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bavYXEHqhV', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(32, 'Cleveland Tremblay', 'percy29@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '9FiuWdudVV', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(33, 'Mia Jast', 'pfeffer.gia@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ZwkKYp9oJH', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(34, 'Dr. Nels Abshire PhD', 'percival.daugherty@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'UGnAJeGS2G', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(35, 'Kennedi Kohler', 'sblick@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '67JcbLnTq8', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(36, 'Clementina Goldner', 'roscoe82@example.org', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'o1tBcw06EM', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(37, 'Prof. Jordyn Johnston Sr.', 'lmcglynn@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'MhzPmirSFf', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(38, 'Ford Legros', 'mhill@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PdCJV9KlH0', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(39, 'Bridie Block', 'paolo92@example.org', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gmXNZwerFT', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(40, 'Eleonore Marvin', 'botsford.glennie@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'mJhcT5AZRG', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(41, 'Jerrod Daniel', 'qrodriguez@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ZpVZDqifKa', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(42, 'Jazmin Reichert', 'bradford63@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dA9OWUCM9T', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(43, 'Kailey Harber', 'clarabelle74@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'QJcZyHubee', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(44, 'Ole Glover', 'eulalia31@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'xfvM5yKxtY', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(45, 'Gonzalo Ankunding', 'alberto.collins@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6swyaLtCpL', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(46, 'Lilly Bosco', 'jennyfer38@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'cXhZfM7YQ1', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(47, 'Frances Hodkiewicz', 'virginia.pagac@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'AVY9S18MnF', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(48, 'Dr. Hulda Kunze', 'macejkovic.elsa@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'c5cJaZhBYi', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(49, 'Solon Windler', 'yhartmann@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'q6kmT1cZSR', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(50, 'Blanca Rodriguez', 'smitham.cleveland@example.org', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'AMyTXwGxhX', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(51, 'Elda Kemmer', 'missouri18@example.org', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'QSGa6enXWo', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(52, 'Mrs. Justine Hand', 'ilittel@example.org', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'W2019xSWb0', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(53, 'Dr. Isom Feest', 'rskiles@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'UEJaXMWDTD', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(54, 'Kasandra Treutel DVM', 'kristian17@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XSyKba99tg', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(55, 'Chloe Schulist', 'kaycee99@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4ORxWqCQCr', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(56, 'Luis Schiller', 'leta.fisher@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'DOvhCC5kRE', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(57, 'Mr. Lavern Balistreri', 'carlos.macejkovic@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'RThg0jTIkW', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(58, 'Tara Lynch', 'jones.lilyan@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'VtYkmJevhx', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(59, 'Mrs. Nicole Bogan', 'luis.goldner@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ZyhnzzsprP', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(60, 'Alana Hayes', 'oconnell.manuela@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'OfLQd4txCF', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(61, 'Mrs. Tina Rempel DVM', 'devin98@example.org', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'RLwwcs8nMo', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(62, 'Retha Conroy', 'nkassulke@example.org', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8Pk70UhMpk', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(63, 'Destinee Hudson', 'xhermiston@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '7iU8Suv9zH', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(64, 'Julia Weimann', 'garry37@example.org', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LXLFMg97Wo', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(65, 'Deontae Greenfelder Sr.', 'funk.keyshawn@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'aA0z7uMHwt', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(66, 'Mr. Werner Bradtke DDS', 'rnolan@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TEnEhwm3z1', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(67, 'Cedrick Hudson', 'consuelo.mccullough@example.org', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hDp9ldL3E3', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(68, 'Karine Hartmann', 'okuneva.may@example.com', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '9YACHEJHWX', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(69, 'Boris Doyle', 'toy.kali@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YlCzgR7ncH', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(70, 'Ms. Nella Russel', 'ismith@example.net', '2023-03-02 06:52:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'SE5En9scMz', '2023-03-02 06:52:11', '2023-03-02 06:52:11'),
(71, 'Brendan Oberbrunner', 'flatley.ronaldo@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Lf3JOLh6JX', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(72, 'Jeanie Hahn II', 'odietrich@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'NDi5x0ngW6', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(73, 'Beatrice Kihn', 'elinore.ernser@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'SKoEc139k4', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(74, 'Jeffery Ullrich', 'ressie45@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'xUcHdHwkZC', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(75, 'Mr. Darien Kemmer', 'rmueller@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'SiioY3yVeK', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(76, 'Dr. Lavern Padberg', 'cbeatty@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'cCngoTbsPc', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(77, 'Mr. Brendan Hoppe DDS', 'schoen.dee@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'IAFYV1Z8fd', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(78, 'Mr. Lorenza Veum', 'wkonopelski@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dpTKWSnoTE', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(79, 'Pansy Jones III', 'rleannon@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'N7zFB1OqzH', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(80, 'Chanelle Ryan', 'issac.fahey@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 's7HnSHNK8a', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(81, 'Octavia Schinner', 'baylee90@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'F0n8aYS0ij', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(82, 'Mr. Ari Larson', 'hoppe.elisa@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'C5JvXBMqho', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(83, 'Mr. Jarrell Bernhard', 'zoe36@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'cOQ7csl3vi', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(84, 'Eulalia Breitenberg Jr.', 'mlemke@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jDnHNeR6GN', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(85, 'Jovany Johns Jr.', 'maggio.lina@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '7URLj2XJDP', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(86, 'Prof. Jazmin Waelchi', 'myah.stark@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PXu6BN4d6p', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(87, 'Kiana Zulauf', 'tjones@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'W44ANYLIII', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(88, 'Antone Krajcik V', 'franecki.armando@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6JaWX8TGTF', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(89, 'Winnifred Rogahn', 'sheridan.spinka@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lmCpHIIlpu', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(90, 'Jermaine Nader', 'heathcote.berta@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bJvLjt3wZW', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(91, 'Heather Boehm V', 'elisabeth.pouros@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '37DcJoXwcc', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(92, 'Hilma Gusikowski', 'gerlach.andy@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'IIlK0XPWXk', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(93, 'Prof. Madisen O\'Conner III', 'ferry.floy@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vrAhPgv6Qc', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(94, 'Nicole Leannon DDS', 'melissa36@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '9Sneq7RL0K', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(95, 'Matilde Schoen', 'lourdes.kunze@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'BZjjmsmfZ9', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(96, 'Mr. Cordell Dickens IV', 'juana84@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'i5NePlRVxY', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(97, 'Eryn Reynolds', 'skyla88@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ofuSxyiXGc', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(98, 'Ms. Bernadine Nikolaus', 'elna02@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'V7LaeHQ3lV', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(99, 'Darrin Yost', 'buck70@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '9ugyXN6Xlf', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(100, 'Alec Christiansen I', 'larkin.willy@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'BqNGYdViF6', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(101, 'Miss Marjolaine Larkin', 'lesley51@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'geNyRWb84q', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(102, 'Mrs. Tess Hudson', 'eli.balistreri@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hXMZ9GBYsw', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(103, 'Camylle Roob', 'mylene07@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wYVbNKk3r0', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(104, 'Dr. Martin Boyer V', 'rath.alexandro@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '69tjrYf9zY', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(105, 'Daren Schimmel', 'dorian04@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4TTsvA5TNC', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(106, 'Dr. Rosario Hettinger', 'yturner@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 't4OVeLK9D8', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(107, 'Ambrose Hagenes', 'santino.koch@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'eSW2a1rJbC', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(108, 'Mark Kozey', 'obruen@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ro8zaQNhDC', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(109, 'Summer Hyatt', 'brett.rowe@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'O6NyRPsqkF', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(110, 'Salma Shields', 'hannah65@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'IEfbRVwTXB', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(111, 'Brenda Cremin', 'rkertzmann@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vVaQAtYgpK', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(112, 'Mr. Joshuah Raynor I', 'wfarrell@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Fnelk569WA', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(113, 'Mohammed Braun', 'hattie.mohr@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LYYAsaVKiv', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(114, 'Delmer Larson III', 'alayna10@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dhCTgBUYAz', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(115, 'Guillermo Hagenes', 'smith.braxton@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ma7yEfAaow', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(116, 'Kattie Barrows', 'will.rosemarie@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2pZ7wMhRYg', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(117, 'Katheryn Farrell Jr.', 'johathan.gorczany@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bExSamUqjR', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(118, 'Danielle Keeling I', 'paige48@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'BkFfsqm201', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(119, 'Gabriella Kulas', 'kelton97@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fz0B03qnko', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(120, 'Savanna Adams DVM', 'reva.nicolas@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FvcfK5EbHU', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(121, 'Antoinette O\'Reilly', 'hills.earlene@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FV6mQXIb8r', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(122, 'Clinton Gerhold', 'wilhelm.kautzer@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'WXf73WPws0', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(123, 'Clementine Runolfsson', 'donnelly.cale@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'aOW5uzI4Xn', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(124, 'Thalia O\'Kon MD', 'autumn.wyman@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4BCVut2a02', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(125, 'Brisa Crooks MD', 'littel.graham@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'MGxBW4NIV4', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(126, 'Maximus Kassulke', 'stracke.anya@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1JbBeMBybg', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(127, 'Blanche Kutch', 'smith.hudson@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LCI87UXw5V', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(128, 'Dock Schulist DDS', 'kaylie.conroy@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FX4a8abbFS', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(129, 'Mathew Thompson', 'rsmitham@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1DjHElIIYN', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(130, 'Yasmine Hansen', 'marcus.oreilly@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '31YVu9y1fj', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(131, 'Michael Mohr', 'casandra.barrows@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'NmvjC7pCYP', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(132, 'Dr. Cordell Quitzon Sr.', 'guiseppe98@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'pUUcvKvUVp', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(133, 'Myrna Dooley', 'kemmer.russel@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'OC1dSW1SYm', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(134, 'Prof. Mina Waelchi Sr.', 'larkin.evan@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'QX4p2veJ6I', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(135, 'Heloise Nitzsche DDS', 'sanford.mabel@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'IiNzrKjiSJ', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(136, 'Jess Stehr', 'roderick.tremblay@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rAvS3TNzJR', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(137, 'Herminio Jakubowski Sr.', 'xhaag@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EoZNJigUii', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(138, 'Prof. Bradly Collins DVM', 'blair.kuphal@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hp6OOThCcI', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(139, 'Ludie Rath', 'oauer@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'niZdvkKs6v', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(140, 'Dr. Johnpaul McClure', 'uschuster@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'DOMpJXRFMD', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(141, 'Dr. Wyman Hammes', 'nedra34@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rm8RjE346o', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(142, 'Sabina Hauck', 'fay17@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LuQ5ETvwQd', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(143, 'Elsa Leffler', 'kacie06@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FPyNYAbrUg', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(144, 'Izaiah Wilkinson Sr.', 'harmon.schaden@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '5fXguvjscc', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(145, 'Mathias Rutherford', 'iliana.legros@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'QdmuHngEay', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(146, 'Maybell Mills', 'allison92@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'U3wemrtFcG', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(147, 'Dr. Jack Zboncak', 'kari.schultz@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'RhbYu3ykDz', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(148, 'Madilyn Stokes', 'moshe.boehm@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'uFn1TbheXG', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(149, 'Angel Dickinson', 'elenor.rempel@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'zYNaPb375z', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(150, 'Yolanda Tromp', 'bo.hintz@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Of10O8A08F', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(151, 'Lavonne Tromp', 'bins.velma@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'cPOAyxIZHq', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(152, 'Dr. Zackery Ratke DDS', 'truecker@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LBRG5OnTrv', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(153, 'Dr. Valentine Hoppe', 'amber24@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ZZxbtsfOKd', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(154, 'Lavern Jones', 'vonrueden.evan@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'OzTri4pVuV', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(155, 'Ms. Adela Fritsch I', 'denis68@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TkFRIm00Lj', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(156, 'Renee Little', 'lheaney@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4qKuqfqTJq', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(157, 'Loraine Ward', 'lorine27@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'OYhUJ6xwBE', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(158, 'Arch Grimes', 'aniyah.mcdermott@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dtnRwrOwkn', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(159, 'Angus Wilderman', 'destiney.mohr@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'GqtvU8k1Wv', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(160, 'Enoch Jaskolski', 'moore.mustafa@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2ozaK7DA51', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(161, 'Cornelius Marvin', 'willis.collins@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YH2cXaLo51', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(162, 'Ms. Katheryn Considine', 'callie.brakus@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'UQEoYCNVP2', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(163, 'Dr. Ashlee Runte', 'zbergnaum@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'N0VAL184Ay', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(164, 'Ms. Estrella DuBuque PhD', 'ichamplin@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fktczRsQSv', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(165, 'Prof. Judge Hoeger', 'lawson46@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fyJ1sbdZ65', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(166, 'Dovie Ankunding', 'laisha.sporer@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YjhBywusg3', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(167, 'Miss Aurelie Greenholt DVM', 'clinton82@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bcoW9VMhpB', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(168, 'Eulalia Goodwin DVM', 'nlindgren@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'UB8qcpIvuq', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(169, 'Austyn Gottlieb', 'lexus93@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'p2XguNVpjz', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(170, 'Julie Senger', 'hamill.loyce@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'IJYbv6i57C', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(171, 'Carli Parisian', 'marilou.tillman@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Y9tNreswmY', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(172, 'Laverne Ruecker', 'grace53@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'zlNPk5ZtRv', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(173, 'Ana Roob', 'cormier.kaitlyn@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dFXIVe2hDJ', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(174, 'Alycia Muller', 'kolby25@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2sf7uA1Dd6', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(175, 'Shirley Beer', 'valentine12@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'T64pChNJU7', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(176, 'Mr. Waylon Williamson IV', 'ykling@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gsEffhU8GZ', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(177, 'Giles Purdy DDS', 'rowe.sidney@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wea4z4URGZ', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(178, 'Moises Streich', 'hans.beahan@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'UU8z8TWjWk', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(179, 'Jayme Ondricka', 'haag.kristina@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'MuUGBmLqtb', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(180, 'Adah Denesik', 'quinton43@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yrs1vc8QM2', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(181, 'Turner Quigley MD', 'lakin.dorris@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ECRtj4jyZZ', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(182, 'Leif Mertz', 'llarkin@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'A0we4ZNv8S', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(183, 'Susie Rodriguez', 'qprohaska@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EwVcAsFrUg', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(184, 'Justine Nader', 'ibeier@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'nbHUqLn4TX', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(185, 'Adriana Rowe', 'amely59@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1PLQh5Xg8q', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(186, 'Duane Gerlach III', 'lkuvalis@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XyP1H04M05', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(187, 'Urban Wolf', 'lleuschke@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'zAAfD8LCzb', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(188, 'Curt Kunde', 'oheidenreich@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'sLlMjTbuxt', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(189, 'Idell Jast', 'willms.blaise@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '15eszEH7WW', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(190, 'Ursula Predovic', 'tia.gutmann@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'cnQUpREnQI', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(191, 'Alford Conroy', 'camilla92@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'B6h4zHOnxB', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(192, 'Elvera Orn', 'tspinka@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '22WYQRQi0Y', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(193, 'Mrs. Josie Lueilwitz IV', 'jazmyne25@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'NFGSBQR247', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(194, 'Raoul Bartell I', 'nadia.goldner@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'J5Lx9Tk7VH', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(195, 'Prof. Destinee Gottlieb Jr.', 'erik59@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '7YOIG5oR3w', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(196, 'Lura Kshlerin', 'ikonopelski@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'NWhKradaWG', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(197, 'Tina Kuhic', 'ariane38@example.org', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dUBisYUduw', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(198, 'Joy Berge', 'morris50@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dSafr1GcPT', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(199, 'Wilton Murray', 'beahan.reese@example.net', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8VtvCsjb3e', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(200, 'Prof. Gardner Windler V', 'witting.jude@example.com', '2023-03-02 06:52:12', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'MirLrjbbUr', '2023-03-02 06:52:12', '2023-03-02 06:52:12'),
(201, 'Pedro', 'pedro.contreras.avendano@gmail.com', '2023-03-02 06:52:43', '$2y$10$tBTmAgODVIKj6iiynXDQdeST26DMY9pE9Ow8pTv0iYCPpshvkpaxi', NULL, '2023-03-02 06:52:43', '2023-03-02 06:52:43'),
(202, 'JENNIFER', 'pedro@gmail.com', '2023-03-02 07:02:41', '$2y$10$GyuOw822LIthQxpkWg7vAOTajzokVag3Uqx.bqHjhRBOgNxF5A3UK', NULL, '2023-03-02 07:02:41', '2023-03-02 07:02:41');

-- --------------------------------------------------------

--
-- Table structure for table `villes`
--

CREATE TABLE `villes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `villes`
--

INSERT INTO `villes` (`id`, `nom`, `created_at`, `updated_at`) VALUES
(16631, 'North Vallie', '2023-03-02 10:34:44', '2023-03-03 03:51:37'),
(19400, 'Reingerstad', '2023-03-02 19:06:51', '2023-03-02 23:08:40'),
(41630, 'McKenzieview', '2023-03-02 10:57:52', '2023-03-03 02:20:43'),
(43577, 'Gulgowskichester', '2023-03-02 08:10:13', '2023-03-02 16:42:16'),
(51425, 'North Berryside', '2023-03-02 22:19:28', '2023-03-02 18:34:48'),
(57781, 'Denesikmouth', '2023-03-02 20:18:35', '2023-03-02 08:50:50'),
(69859, 'Hackettborough', '2023-03-02 17:06:07', '2023-03-02 08:45:57'),
(70315, 'North Suzannemouth', '2023-03-02 16:11:03', '2023-03-02 09:02:55'),
(73896, 'East Vena', '2023-03-03 03:51:57', '2023-03-02 06:37:56'),
(93170, 'Macejkovicshire', '2023-03-02 09:27:57', '2023-03-02 09:01:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `etudiants`
--
ALTER TABLE `etudiants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `etudiants_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `forum_posts`
--
ALTER TABLE `forum_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `villes`
--
ALTER TABLE `villes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorys`
--
ALTER TABLE `categorys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `etudiants`
--
ALTER TABLE `etudiants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=990517;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forum_posts`
--
ALTER TABLE `forum_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=997419;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=986389;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=991962;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `villes`
--
ALTER TABLE `villes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93171;
--
-- Database: `social_a`
--
CREATE DATABASE IF NOT EXISTS `social_a` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `social_a`;

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `categorie` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorie_fr` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categorie_ru` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categorie_ro` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`id`, `categorie`, `categorie_fr`, `categorie_ru`, `categorie_ro`) VALUES
(1, 'Food', 'Nurriture', 'Еда', 'Mincare'),
(2, 'Cloth', 'Vetment', 'Одежда', 'Haine');

-- --------------------------------------------------------

--
-- Table structure for table `etudiants`
--

CREATE TABLE `etudiants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `etudiants`
--

INSERT INTO `etudiants` (`id`, `number`, `created_at`, `updated_at`) VALUES
(1, '8827300325', '2023-02-21 21:50:21', '2023-02-21 21:50:21'),
(2, '8106030799', '2023-02-21 21:50:21', '2023-02-21 21:50:21'),
(3, '4775632567', '2023-02-21 21:50:21', '2023-02-21 21:50:21'),
(4, '8311202589', '2023-02-21 21:50:21', '2023-02-21 21:50:21'),
(5, '4880165864', '2023-02-21 21:50:21', '2023-02-21 21:50:21'),
(6, '4829354120', '2023-02-21 21:50:21', '2023-02-21 21:50:21'),
(7, '5765033984', '2023-02-21 21:50:21', '2023-02-21 21:50:21'),
(8, '6706465380', '2023-02-21 21:50:21', '2023-02-21 21:50:21'),
(9, '8979285437', '2023-02-21 21:50:21', '2023-02-21 21:50:21'),
(10, '5633142411', '2023-02-21 21:50:21', '2023-02-21 21:50:21'),
(11, '49866058108', '2023-02-27 02:36:22', '2023-02-27 02:36:22'),
(12, '610573041096', '2023-02-27 03:17:11', '2023-02-27 03:17:11'),
(13, '7172037518', '2023-03-01 08:34:19', '2023-03-01 08:34:19');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forums`
--

CREATE TABLE `forums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_fr` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `article` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_fr` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forum_user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forums`
--

INSERT INTO `forums` (`id`, `title`, `title_fr`, `article`, `article_fr`, `forum_user_id`, `created_at`, `updated_at`) VALUES
(1, 'Natalie Ritchie', 'Alexandrine Littel', 'If they had to.', 'Cat. \'--so.', 1, '2023-02-21 21:52:15', '2023-02-21 21:52:15'),
(2, 'Obie Trantow', 'Prof. Rashad Harvey II', 'I think?\' \'I.', 'Dormouse; \'--well.', 2, '2023-02-21 21:52:15', '2023-02-21 21:52:15'),
(3, 'Antoinette D\'Amore', 'Savanna Robel DDS', 'Was kindly.', 'Majesty,\' said.', 3, '2023-02-21 21:52:15', '2023-02-21 21:52:15'),
(4, 'Elwin Luettgen', 'Troy Wolff V', 'I to get an.', 'What happened to.', 4, '2023-02-21 21:52:15', '2023-02-21 21:52:15'),
(5, 'Evie Satterfield', 'Harold Weber', 'Oh, how I wish.', 'I don\'t want to.', 5, '2023-02-21 21:52:15', '2023-02-21 21:52:15'),
(6, 'Javon White', 'Cristopher Bogan', 'Come and help.', 'I think--\'.', 6, '2023-02-21 21:52:15', '2023-02-21 21:52:15'),
(7, 'Prof. Missouri Denesik DVM', 'Keara Ortiz', 'HIM TWO--\".', 'March--just.', 7, '2023-02-21 21:52:15', '2023-02-21 21:52:15'),
(8, 'Edwin Walter', 'Queenie Bartoletti', 'In another minute.', 'MINE.\' The.', 8, '2023-02-21 21:52:15', '2023-02-21 21:52:15'),
(9, 'Alexandre Ferry', 'Alysa Durgan', 'I WAS when.', 'One of the.', 9, '2023-02-21 21:52:15', '2023-02-21 21:52:15'),
(10, 'Mr. Darian Mohr DDS', 'Ova Schroeder', 'No, it\'ll never do.', 'Alice. \'Exactly.', 10, '2023-02-21 21:52:15', '2023-02-21 21:52:15'),
(11, 'Helllo', 'Allo', 'hi guys', 'alo peuple', 13, '2023-02-27 02:36:52', '2023-02-27 02:36:52'),
(12, 'Hello', 'Hola', 'What up?', 'Que paso', 15, '2023-03-01 08:41:04', '2023-03-01 08:41:04'),
(13, 'Mate', 'MAta', 'Mate mate', 'mata mata', 15, '2023-03-02 01:49:35', '2023-03-02 01:49:35');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2023_02_18_184446_create_villes_table', 1),
(5, '2023_02_18_184511_create_etudiants_table', 1),
(6, '2023_02_18_185226_create_users_table', 1),
(7, '2023_02_21_021555_create_forums_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `repertoires`
--

CREATE TABLE `repertoires` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_fr` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `repertoires_user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `user_ville_id` int(11) DEFAULT NULL,
  `user_etudiant_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `temp_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `adresse`, `phone`, `birthday`, `user_ville_id`, `user_etudiant_id`, `created_at`, `updated_at`, `temp_password`) VALUES
(1, 'Buck Halvorson', 'elmore.king@example.net', '2023-02-21 21:50:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'KVc6uneUnO', '1886 Schultz Haven', '1-866-903-6071', '1991-05-11', 9, 1, '2023-02-21 21:50:42', '2023-02-21 21:50:42', NULL),
(2, 'Miss Estel Runolfsdottir', 'hill.tierra@example.com', '2023-02-21 21:50:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '9hMuc37ZR0', '22027 Corkery Course', '(844) 714-8615', '1929-06-12', 6, 2, '2023-02-21 21:50:42', '2023-02-21 21:50:42', NULL),
(3, 'Prof. Saige Hackett', 'kwelch@example.net', '2023-02-21 21:50:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4rGUFALede', '711 Morissette Glen Apt. 429', '888.303.8765', '1940-06-09', 6, 3, '2023-02-21 21:50:42', '2023-02-21 21:50:42', NULL),
(4, 'Ward Williamson', 'ritchie.kaycee@example.org', '2023-02-21 21:50:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'R6EQvH158W', '804 Lakin Mount Apt. 907', '800-336-3096', '1998-08-16', 8, 4, '2023-02-21 21:50:42', '2023-02-21 21:50:42', NULL),
(5, 'Raoul Dibbert', 'jared.klein@example.net', '2023-02-21 21:50:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vq7C98wbn5', '268 Satterfield Field Suite 889', '844.603.0155', '1982-02-15', 9, 5, '2023-02-21 21:50:42', '2023-02-21 21:50:42', NULL),
(6, 'Orlando Botsford', 'arianna.oconnell@example.com', '2023-02-21 21:50:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fdFzXr5mDJ', '362 Watsica Inlet Apt. 516', '(877) 656-0895', '1992-08-10', 9, 6, '2023-02-21 21:50:42', '2023-02-21 21:50:42', NULL),
(7, 'Vladimir Mitchell', 'meredith31@example.com', '2023-02-21 21:50:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0lcvPsMYES', '5271 Carroll Mountains', '866.239.1330', '2014-01-22', 5, 7, '2023-02-21 21:50:42', '2023-02-21 21:50:42', NULL),
(8, 'Lauretta Abernathy I', 'johnston.birdie@example.net', '2023-02-21 21:50:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yVQgguQ1ZO', '4873 Kunde Mountain', '866-583-5887', '1951-02-06', 9, 8, '2023-02-21 21:50:42', '2023-02-21 21:50:42', NULL),
(9, 'Kayden Lueilwitz DVM', 'cleannon@example.net', '2023-02-21 21:50:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2jcrcKSAzn', '2583 Hester Pass', '(800) 875-6908', '2009-02-18', 2, 9, '2023-02-21 21:50:42', '2023-02-21 21:50:42', NULL),
(10, 'Abby Thiel', 'colby.bartell@example.org', '2023-02-21 21:50:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'I3w5xCzNWi', '7817 Alisa Spring', '844-770-8949', '1931-09-18', 7, 10, '2023-02-21 21:50:42', '2023-02-21 21:50:42', NULL),
(13, 'Alexandru Candu', 'candualexandru@gmail.com', NULL, '$2y$10$nI2wqlFAaKhIWKogoa69Iuo7PXvkIb03jEeVh7ufd/mtjaVDTg58S', NULL, '3282 av de la pepiniere', '438-876-2885', '2002-01-28', 7, 11, '2023-02-27 02:36:22', '2023-02-27 02:36:22', NULL),
(14, 'marcos', 'marcos@gmail.com', NULL, '$2y$10$uCcvhKoddFWkjCC3ybKGbuZDF9YBraerFS0tnhvx0A45oenR5vbka', NULL, '3282 av de la pepiniere', '438-876-2885', '1985-12-30', 3, 12, '2023-02-27 03:17:11', '2023-02-27 03:17:11', NULL),
(15, 'Pedro', 'pedro.contreras.avendano@gmail.com', NULL, '$2y$10$BCtsKj1sl57CXUnJgWP1KOYbxGejkOd0zaXzDGUHsqU3A75sos/A.', NULL, '12-283 avenue Laurier Ouest', '15148391246', '2023-02-15', 1, 13, '2023-03-01 08:34:19', '2023-03-01 08:34:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `villes`
--

CREATE TABLE `villes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `villes`
--

INSERT INTO `villes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Treutelview', '2023-02-21 21:50:12', '2023-02-21 21:50:12'),
(2, 'Johnstontown', '2023-02-21 21:50:12', '2023-02-21 21:50:12'),
(3, 'East Newton', '2023-02-21 21:50:12', '2023-02-21 21:50:12'),
(4, 'Santinoview', '2023-02-21 21:50:12', '2023-02-21 21:50:12'),
(5, 'Champlinton', '2023-02-21 21:50:12', '2023-02-21 21:50:12'),
(6, 'West Jacquelynfurt', '2023-02-21 21:50:12', '2023-02-21 21:50:12'),
(7, 'Watsicaville', '2023-02-21 21:50:12', '2023-02-21 21:50:12'),
(8, 'Barrowsville', '2023-02-21 21:50:12', '2023-02-21 21:50:12'),
(9, 'South Altatown', '2023-02-21 21:50:12', '2023-02-21 21:50:12'),
(10, 'West Destini', '2023-02-21 21:50:12', '2023-02-21 21:50:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `etudiants`
--
ALTER TABLE `etudiants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forums`
--
ALTER TABLE `forums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forum_user_id_fk` (`forum_user_id`);

--
-- Indexes for table `repertoires`
--
ALTER TABLE `repertoires`
  ADD PRIMARY KEY (`id`),
  ADD KEY `repertoires_user_id_fk` (`repertoires_user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_ville_id_fk` (`user_ville_id`),
  ADD KEY `user_etudiant_id_fk` (`user_etudiant_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `etudiants`
--
ALTER TABLE `etudiants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `forums`
--
ALTER TABLE `forums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `repertoires`
--
ALTER TABLE `repertoires`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `vinovino`
--
CREATE DATABASE IF NOT EXISTS `vinovino` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vinovino`;

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
  `updated_at` timestamp NULL DEFAULT NULL
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
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'pedro', 'pedro@pedro.com', NULL, '$2y$10$s5TbDBrqvbmpQwW3xRSU.ObrRd7EVzkdrZECHQULMvUJkrQTEWRZS', NULL, '2023-03-10 03:23:28', '2023-03-10 03:23:28');

-- --------------------------------------------------------

--
-- Table structure for table `vino__bouteille`
--

CREATE TABLE `vino__bouteille` (
  `id` int(11) NOT NULL,
  `nom` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `code_saq` varchar(50) DEFAULT NULL,
  `pays` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `prix_saq` float DEFAULT NULL,
  `url_saq` varchar(200) DEFAULT NULL,
  `url_img` varchar(200) DEFAULT NULL,
  `format` varchar(20) DEFAULT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(2, 'Vin blanc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bouteilles`
--
ALTER TABLE `bouteilles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bouteilles_vino__bouteille1_idx` (`id_bouteille`),
  ADD KEY `fk_bouteilles_celliers1_idx` (`celliers_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `celliers`
--
ALTER TABLE `celliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vino__bouteille`
--
ALTER TABLE `vino__bouteille`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=385;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bouteilles`
--
ALTER TABLE `bouteilles`
  ADD CONSTRAINT `fk_bouteilles_celliers1` FOREIGN KEY (`celliers_id`) REFERENCES `celliers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bouteilles_id_bouteille1` FOREIGN KEY (`id_bouteille`) REFERENCES `vino__bouteille` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `celliers`
--
ALTER TABLE `celliers`
  ADD CONSTRAINT `fk_celliers_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `vino__bouteille`
--
ALTER TABLE `vino__bouteille`
  ADD CONSTRAINT `fk_vino__bouteille_type` FOREIGN KEY (`type`) REFERENCES `vino__type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
