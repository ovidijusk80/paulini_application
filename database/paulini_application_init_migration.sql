-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2021 at 04:43 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pauliniapplication`
--
CREATE DATABASE IF NOT EXISTS `pauliniapplication` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `pauliniapplication`;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`) VALUES
(1, 'LT', 'LT'),
(2, 'EN', 'EN'),
(3, 'RU', 'RU');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `value` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menu_navigations`
--

CREATE TABLE `menu_navigations` (
  `id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `is_page` tinyint(1) NOT NULL DEFAULT 0,
  `LanguageId` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `slug` varchar(64) NOT NULL,
  `content` longtext DEFAULT NULL,
  `description` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_custom_page` tinyint(1) NOT NULL DEFAULT 0,
  `custom_page_type` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `post_navigations`
--

CREATE TABLE `post_navigations` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `title` varchar(128) NOT NULL,
  `position` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `menu_navigation_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `key` varchar(64) DEFAULT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'MENU_NAV_LT', NULL),
(2, 'MENU_NAV_EN', NULL),
(3, 'MENU_NAV_RU', NULL),
(4, 'FOOTER_POST', NULL),
(5, 'FOOTER_ADD_WARDROBE', NULL),
(6, 'FOOTER_REGISTER', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(64) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `salt` varchar(64) DEFAULT NULL,
  `role_name` varchar(10) DEFAULT 'Admin',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `password`, `salt`, `role_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2a$16$aynaXS0p9YslcfWFDu8IO.Y8GM1GB.tBDW9lfE3WvsKardFIJVyti', '$2a$16$aynaXS0p9YslcfWFDu8IO.', 'SuperAdmin', '0001-01-01 00:00:00', '0001-01-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20210621144218_init', '5.0.4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_navigations`
--
ALTER TABLE `menu_navigations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_menu_navigations_language_id` (`language_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_posts_LanguageId` (`LanguageId`),
  ADD KEY `IX_posts_parent_id` (`parent_id`);

--
-- Indexes for table `post_navigations`
--
ALTER TABLE `post_navigations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_post_navigations_menu_navigation_id` (`menu_navigation_id`),
  ADD KEY `IX_post_navigations_parent_id` (`parent_id`),
  ADD KEY `IX_post_navigations_post_id` (`post_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IX_settings_key` (`key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IX_users_user_name` (`user_name`);

--
-- Indexes for table `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_navigations`
--
ALTER TABLE `menu_navigations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_navigations`
--
ALTER TABLE `post_navigations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu_navigations`
--
ALTER TABLE `menu_navigations`
  ADD CONSTRAINT `FK_menu_navigations_languages_language_id` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `FK_posts_languages_LanguageId` FOREIGN KEY (`LanguageId`) REFERENCES `languages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_posts_posts_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `posts` (`id`);

--
-- Constraints for table `post_navigations`
--
ALTER TABLE `post_navigations`
  ADD CONSTRAINT `FK_Post_Navigation_Menu_Navigation` FOREIGN KEY (`menu_navigation_id`) REFERENCES `menu_navigations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Post_Navigation_Post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `FK_post_navigations_post_navigations_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `post_navigations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
