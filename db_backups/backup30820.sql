-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: aug. 30, 2020 la 10:29 AM
-- Versiune server: 10.4.11-MariaDB
-- Versiune PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `laravel`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `applications`
--

CREATE TABLE `applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interview_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `applications`
--

INSERT INTO `applications` (`id`, `created_at`, `updated_at`, `user_id`, `job_id`, `status`, `interview_id`) VALUES
(2, '2020-07-20 17:18:32', '2020-07-20 17:18:32', 5, 2, 'Rejected', 0),
(4, '2020-08-17 08:52:17', '2020-08-17 08:52:27', 5, 3, 'Rejected', 0),
(6, '2020-08-17 09:41:57', '2020-08-17 09:41:57', 5, 2, 'Rejected', 0),
(12, '2020-08-23 15:54:49', '2020-08-23 15:54:49', 7, 3, 'Accepted', 0),
(13, '2020-08-23 17:02:48', '2020-08-23 17:02:48', 5, 3, 'Accepted', 0);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(2, NULL, 1, 'Category 2', 'category-2', '2020-05-24 14:03:49', '2020-05-24 14:03:49');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 2),
(58, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 3),
(59, 8, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(60, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(61, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 2),
(62, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 3),
(63, 9, 'facilities', 'text', 'Facilities', 1, 1, 1, 1, 1, 1, '{}', 4),
(64, 9, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 5),
(65, 9, 'employer', 'text', 'Employer', 1, 1, 1, 1, 1, 1, '{}', 6),
(66, 9, 'rate', 'text', 'Rate', 1, 1, 1, 1, 1, 1, '{}', 7),
(67, 9, 'hours', 'text', 'Hours', 1, 1, 1, 1, 1, 1, '{}', 8),
(68, 9, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 9),
(69, 9, 'available_positions', 'text', 'Available Positions', 1, 1, 1, 1, 1, 1, '{}', 10),
(70, 9, 'region', 'text', 'Region', 0, 1, 1, 1, 1, 1, '{}', 11),
(71, 9, 'image_path', 'text', 'Image Path', 0, 1, 1, 1, 1, 1, '{}', 12);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(8, 'features', 'features', 'Feature', 'Features', NULL, 'App\\Features', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-05-24 14:06:34', '2020-05-24 14:06:34'),
(9, 'jobs', 'jobs', 'Job', 'Jobs', NULL, 'App\\Jobs', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-05-24 14:08:15', '2020-05-24 14:08:15');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `storage_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `documents`
--

INSERT INTO `documents` (`id`, `created_at`, `updated_at`, `user_id`, `storage_path`, `type`) VALUES
(6, '2020-08-23 15:29:52', '2020-08-23 15:29:52', 5, '5CV.pdf', 'CV'),
(7, '2020-08-23 15:56:50', '2020-08-23 15:56:50', 7, '7CV.pdf', 'CV');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `favourites`
--

CREATE TABLE `favourites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `favourites`
--

INSERT INTO `favourites` (`id`, `created_at`, `updated_at`, `user_id`, `job_id`) VALUES
(8, NULL, NULL, 5, 1);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `features`
--

INSERT INTO `features` (`id`, `created_at`, `updated_at`, `name`) VALUES
(1, '2020-05-24 17:06:00', '2020-05-24 14:07:41', 'plata chirie 10%'),
(2, NULL, NULL, 'Decont autobuz'),
(3, NULL, NULL, 'plata chirie 20%'),
(4, NULL, NULL, 'Decont autobuz');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `interviews`
--

CREATE TABLE `interviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `date` datetime NOT NULL,
  `job_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `interviews`
--

INSERT INTO `interviews` (`id`, `created_at`, `updated_at`, `user_id`, `status`, `date`, `job_id`) VALUES
(5, NULL, NULL, 5, 'Respins', '2020-08-17 14:53:00', 3),
(6, NULL, NULL, 5, 'Respins', '2020-08-22 19:45:00', 2),
(10, NULL, NULL, 7, 'Angajat', '2020-08-30 03:10:00', 3),
(11, NULL, NULL, 5, 'Angajat', '2020-08-23 04:03:00', 3);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `facilities` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hours` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `available_positions` int(11) NOT NULL,
  `region` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `jobs`
--

INSERT INTO `jobs` (`id`, `created_at`, `updated_at`, `facilities`, `title`, `employer`, `rate`, `hours`, `description`, `available_positions`, `region`, `image_path`) VALUES
(1, NULL, NULL, '1,2', 'Server', 'Lil Hut Casino', '20', 50, 'Nice little place to work at I really enjoyed my stay here but I wouldn\'t go again.', 3, 'Hawaii', 'img/place/1.png'),
(2, NULL, '2020-08-29 13:35:24', '1,2,3', 'Busser', 'Il Padrino', '11.5', 30, 'Serve food and occasionally wash some dishes.', 3, 'Chicago', 'img/place/2.png'),
(3, NULL, NULL, '1,2,3', 'Delivery boy/girl', 'UPS', '15', 50, 'Deliver the undelivrable.', 1, 'New York', 'img/place/3.png'),
(4, '2020-05-24 14:09:00', '2020-08-29 13:34:45', '1,4', 'Cashier', 'California', '10', 40, 'Interact with kids and be the seller you always wished for.', 10, 'California', 'img/place/2.png'),
(5, '2020-08-18 14:15:00', '2020-08-29 13:35:07', '1,2', 'Ice cream truck server', 'Oriental Ice Creams', '20', 40, 'Drive a truck around the town and sell ice cream.', 2, 'New York', NULL);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-05-24 13:59:27', '2020-05-24 13:59:27');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-05-24 13:59:27', '2020-05-24 13:59:27', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2020-05-24 13:59:27', '2020-05-24 13:59:27', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2020-05-24 13:59:27', '2020-05-24 13:59:27', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2020-05-24 13:59:27', '2020-05-24 13:59:27', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2020-05-24 13:59:27', '2020-05-24 13:59:27', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2020-05-24 13:59:27', '2020-05-24 13:59:27', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2020-05-24 13:59:27', '2020-05-24 13:59:27', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2020-05-24 13:59:27', '2020-05-24 13:59:27', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2020-05-24 13:59:27', '2020-05-24 13:59:27', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2020-05-24 13:59:27', '2020-05-24 13:59:27', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2020-05-24 13:59:27', '2020-05-24 13:59:27', 'voyager.hooks', NULL),
(12, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2020-05-24 14:03:49', '2020-05-24 14:03:49', 'voyager.categories.index', NULL),
(13, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2020-05-24 14:03:49', '2020-05-24 14:03:49', 'voyager.posts.index', NULL),
(14, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2020-05-24 14:03:49', '2020-05-24 14:03:49', 'voyager.pages.index', NULL),
(15, 1, 'Features', '', '_self', NULL, NULL, NULL, 15, '2020-05-24 14:06:34', '2020-05-24 14:06:34', 'voyager.features.index', NULL),
(16, 1, 'Jobs', '', '_self', NULL, NULL, NULL, 16, '2020-05-24 14:08:15', '2020-05-24 14:08:15', 'voyager.jobs.index', NULL);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 2),
(4, '2020_05_23_175105_create_jobs_table', 3),
(5, '2020_05_23_175141_create_interviews_table', 3),
(6, '2020_05_23_175219_create_favourites_table', 3),
(7, '2020_05_23_175238_create_applications_table', 4),
(8, '2020_05_23_175254_create_features_table', 4),
(9, '2020_05_23_175312_create_documents_table', 4),
(10, '2020_05_23_175325_create_tests_table', 4),
(11, '2020_05_23_175331_create_visas_table', 4),
(12, '2020_05_23_180944_create_payments_table', 5),
(13, '2016_01_01_000000_add_voyager_user_fields', 6),
(14, '2016_01_01_000000_create_data_types_table', 6),
(15, '2016_05_19_173453_create_menu_table', 6),
(16, '2016_10_21_190000_create_roles_table', 6),
(17, '2016_10_21_190000_create_settings_table', 6),
(18, '2016_11_30_135954_create_permission_table', 6),
(19, '2016_11_30_141208_create_permission_role_table', 6),
(20, '2016_12_26_201236_data_types__add__server_side', 6),
(21, '2017_01_13_000000_add_route_to_menu_items_table', 6),
(22, '2017_01_14_005015_create_translations_table', 6),
(23, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 6),
(24, '2017_03_06_000000_add_controller_to_data_types_table', 6),
(25, '2017_04_21_000000_add_order_to_data_rows_table', 6),
(26, '2017_07_05_210000_add_policyname_to_data_types_table', 6),
(27, '2017_08_05_000000_add_group_to_settings_table', 6),
(28, '2017_11_26_013050_add_user_role_relationship', 6),
(29, '2017_11_26_015000_create_user_roles_table', 6),
(30, '2018_03_11_000000_add_user_settings', 6),
(31, '2018_03_14_000000_add_details_to_data_types_table', 6),
(32, '2018_03_16_000000_make_settings_value_nullable', 6),
(33, '2016_01_01_000000_create_pages_table', 7),
(34, '2016_01_01_000000_create_posts_table', 7),
(35, '2016_02_15_204651_create_categories_table', 7),
(36, '2017_04_11_000000_alter_post_nullable_fields_table', 7),
(37, '2020_07_03_193020_create_money_table', 8),
(38, '2020_07_03_193402_create_status_table', 8),
(39, '2020_07_05_144544_create_projects_table', 9),
(40, '2020_07_05_144913_create_workflow_table', 9),
(41, '2020_07_05_155702_create_workflows_table', 10);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2020-05-24 14:03:49', '2020-05-24 14:03:49');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `payments`
--

INSERT INTO `payments` (`id`, `created_at`, `updated_at`, `token`, `bank`, `used`) VALUES
(1, NULL, NULL, 'asd', 'ING', 0),
(2, NULL, NULL, 'asd', 'ING', 1);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(2, 'browse_bread', NULL, '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(3, 'browse_database', NULL, '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(4, 'browse_media', NULL, '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(5, 'browse_compass', NULL, '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(6, 'browse_menus', 'menus', '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(7, 'read_menus', 'menus', '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(8, 'edit_menus', 'menus', '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(9, 'add_menus', 'menus', '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(10, 'delete_menus', 'menus', '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(11, 'browse_roles', 'roles', '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(12, 'read_roles', 'roles', '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(13, 'edit_roles', 'roles', '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(14, 'add_roles', 'roles', '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(15, 'delete_roles', 'roles', '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(16, 'browse_users', 'users', '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(17, 'read_users', 'users', '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(18, 'edit_users', 'users', '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(19, 'add_users', 'users', '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(20, 'delete_users', 'users', '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(21, 'browse_settings', 'settings', '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(22, 'read_settings', 'settings', '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(23, 'edit_settings', 'settings', '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(24, 'add_settings', 'settings', '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(25, 'delete_settings', 'settings', '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(26, 'browse_hooks', NULL, '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(27, 'browse_categories', 'categories', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(28, 'read_categories', 'categories', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(29, 'edit_categories', 'categories', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(30, 'add_categories', 'categories', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(31, 'delete_categories', 'categories', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(32, 'browse_posts', 'posts', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(33, 'read_posts', 'posts', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(34, 'edit_posts', 'posts', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(35, 'add_posts', 'posts', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(36, 'delete_posts', 'posts', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(37, 'browse_pages', 'pages', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(38, 'read_pages', 'pages', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(39, 'edit_pages', 'pages', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(40, 'add_pages', 'pages', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(41, 'delete_pages', 'pages', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(42, 'browse_features', 'features', '2020-05-24 14:06:34', '2020-05-24 14:06:34'),
(43, 'read_features', 'features', '2020-05-24 14:06:34', '2020-05-24 14:06:34'),
(44, 'edit_features', 'features', '2020-05-24 14:06:34', '2020-05-24 14:06:34'),
(45, 'add_features', 'features', '2020-05-24 14:06:34', '2020-05-24 14:06:34'),
(46, 'delete_features', 'features', '2020-05-24 14:06:34', '2020-05-24 14:06:34'),
(47, 'browse_jobs', 'jobs', '2020-05-24 14:08:15', '2020-05-24 14:08:15'),
(48, 'read_jobs', 'jobs', '2020-05-24 14:08:15', '2020-05-24 14:08:15'),
(49, 'edit_jobs', 'jobs', '2020-05-24 14:08:15', '2020-05-24 14:08:15'),
(50, 'add_jobs', 'jobs', '2020-05-24 14:08:15', '2020-05-24 14:08:15'),
(51, 'delete_jobs', 'jobs', '2020-05-24 14:08:15', '2020-05-24 14:08:15');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-05-24 14:03:49', '2020-05-24 14:03:49');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `projects`
--

INSERT INTO `projects` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Stomis', 'Clinica de stomatologie din Buzau', 'ONGOING', '2020-07-05 12:15:25', '2020-07-05 12:15:25'),
(2, 'Cabana din padure', 'Alt site pentru Oscar Campina', 'ONGOING', '2020-07-05 12:18:25', '2020-07-05 12:18:25'),
(3, 'Hotel Oscar', 'Derivat din Restaurant Oscar', 'ONGOING', '2020-07-05 12:18:46', '2020-07-05 12:18:46'),
(4, 'Mannafoods', 'Cateva mici modificari', 'ONGOING', '2020-07-05 12:18:55', '2020-07-05 12:18:55'),
(5, 'DragonMag', 'Magazin online de electronice', 'ONGOING', '2020-07-05 12:19:03', '2020-07-05 12:19:03'),
(6, 'USR Buzau', 'Pagina USR Buzau', 'ONGOING', '2020-07-05 12:19:43', '2020-07-05 12:19:43'),
(7, 'PubliProd Concept', 'Adaugare de pagini si continut pe pagini', 'ONGOING', '2020-07-05 14:13:17', '2020-07-05 14:13:17');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-05-24 13:59:27', '2020-05-24 13:59:27'),
(2, 'user', 'Normal User', '2020-05-24 13:59:27', '2020-05-24 13:59:27');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `status`
--

CREATE TABLE `status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `status`
--

INSERT INTO `status` (`id`, `created_at`, `updated_at`, `name`) VALUES
(1, NULL, NULL, 'Astept Restituire'),
(2, NULL, NULL, 'Incasat'),
(3, NULL, NULL, 'Platit'),
(4, NULL, NULL, 'Platit');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `tests`
--

CREATE TABLE `tests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `tests`
--

INSERT INTO `tests` (`id`, `created_at`, `updated_at`, `user_id`, `title`, `author`, `status`, `date`) VALUES
(4, NULL, NULL, 5, 'Engleza Avansat', 'Stefania', 'Bunisor', '2020-08-15 12:50:00');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(22, 'menu_items', 'title', 13, 'pt', 'Publicações', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(24, 'menu_items', 'title', 12, 'pt', 'Categorias', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(25, 'menu_items', 'title', 14, 'pt', 'Páginas', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2020-05-24 14:03:49', '2020-05-24 14:03:49'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2020-05-24 14:03:49', '2020-05-24 14:03:49');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Student',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone_nr` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `roles`, `address`, `dob`, `phone_nr`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(4, 1, 'Stefania2', 'Student', NULL, NULL, '0764334890', 'maicanvlad199812@gmail.com', 'users/default.png', NULL, '$2y$10$AAxVCU4IfoeEXpdrqiTWDOATYA2sROpkMzRJJ7tUx/X2ZPSVkMPuS', NULL, NULL, '2020-05-22 17:43:10', '2020-05-22 17:43:10'),
(5, 1, 'Vlad', 'Student', NULL, NULL, '0764334890', 'maicanvlad19981@gmail.com', 'users/default.png', NULL, '$2y$10$hroEQaTRTuXjDhd0tTkNaOFwW5EJ3xxYCsrXyAD8Sw.ePh8Yb/Wae', '6UXMByEc2OOMNSxcIlOAAaCNIZZs18AMSkozRiKGCwgZH9ag51OPrEFvm3C9', NULL, '2020-05-22 17:48:17', '2020-05-22 17:48:17'),
(6, 1, 'Stefania Manaila', 'Manager', NULL, NULL, '0764334890', 'stef123@gmail.com', 'users/default.png', NULL, '$2y$10$hroEQaTRTuXjDhd0tTkNaOFwW5EJ3xxYCsrXyAD8Sw.ePh8Yb/Wae', 'aPvjPehGYlwbRwJdcYKVZ37a6k7iKHLpb08eh6yTGbYOh7ufpK7K0EuNY2er', NULL, '2020-05-22 17:48:17', '2020-05-22 17:48:17'),
(7, 2, 'Stefania Manaila', 'Student', NULL, NULL, '0764334890', 'test123@gmail.com', 'users/default.png', NULL, '$2y$10$CjMw8LZDSYQKIb5u7uULvudRrJ7rRlgU2ervHSpBheGZGd1nP5iwC', NULL, NULL, '2020-08-23 15:54:30', '2020-08-23 15:54:30'),
(9, 2, 'Stefania Manaila', 'Student', NULL, NULL, '0764334890', 'test123s@gmail.com', 'users/default.png', NULL, '$2y$10$CjMw8LZDSYQKIb5u7uULvudRrJ7rRlgU2ervHSpBheGZGd1nP5iwC', NULL, NULL, '2020-08-23 15:54:30', '2020-08-23 15:54:30');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `visas`
--

CREATE TABLE `visas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `interview_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `workflow`
--

CREATE TABLE `workflow` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ONGOING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `workflow`
--

INSERT INTO `workflow` (`id`, `task_name`, `desc`, `project_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Adaugare harta SVG pe USr Buzau', 'Trebuie sa adaug SVG si template de pagina pe USR', 6, 'ONGOING', '2020-07-05 12:51:01', '2020-07-05 12:51:01');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `workflows`
--

CREATE TABLE `workflows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'ONGOING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `workflows`
--

INSERT INTO `workflows` (`id`, `task_name`, `desc`, `project_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Adaugare harta SVG pe USr Buzau', 'Trebuie sa adaug SVG si template de pagina pe USR', 6, 'ONGOING', '2020-07-05 12:58:29', '2020-07-05 12:58:29'),
(2, 'Bani Andrei', 'Trimite bani Andrei 100lei pentru Manna Foods', 4, 'ONGOING', '2020-07-05 13:02:05', '2020-07-05 13:02:05'),
(3, 'Termina casa din padure pana Marti!', 'INstalare tema de pe drive si prezentare site pana Mari', 2, 'TERMINAT', '2020-07-05 13:02:47', '2020-07-06 18:45:18'),
(4, 'Vorbeste DraognMag', 'Vorbeste cu DragonMag pentru comenzi si reclama, ai lasat-o in pom de week trecut', 5, 'ONGOING', '2020-07-05 13:03:37', '2020-07-05 13:14:57'),
(5, 'Upload Lgoo', 'Rezolvare problema cu logo-ul de la MannaFoods care nu merge incarcat pe LinkedIN', 4, 'TERMINAT', '2020-07-05 13:04:07', '2020-07-05 14:27:29'),
(6, 'Office Email', 'Vb cu Stomis ca sa ii arati cum se conecteaza la adresa office de la stomis', 1, 'TERMINAT', '2020-07-05 13:04:41', '2020-07-06 14:49:20'),
(7, 'Poze stomis', 'Cere poze stomis pentru continut', 1, 'TERMINAT', '2020-07-05 13:04:59', '2020-07-06 14:49:27'),
(8, 'Pregateste reclame Stomis pentru si campanii', 'Cere parola de la facebook si prezinta imaginile pentru campaniile publicitare', 1, 'ONGOING', '2020-07-05 13:05:25', '2020-07-05 13:05:25'),
(9, 'test task', 'asdasd', 3, 'TERMINAT', '2020-07-05 13:16:23', '2020-07-05 13:16:28'),
(10, 'PubliProd concept stuff', 'Adaugare continut pe Publiprod AMR 450Lei', 7, 'ONGOING', '2020-07-05 14:13:36', '2020-07-05 14:13:36'),
(11, 'Mo no', 'iubeste moni', 1, 'TERMINAT', '2020-07-05 14:52:38', '2020-07-05 14:52:56'),
(12, 'Restul de pagini !!!!', 'Termina restul de pagini pentru Site si factureaza', 2, 'ONGOING', '2020-07-06 18:45:41', '2020-07-06 18:45:41'),
(13, 'Stabileste intalnire pentru Marti seara cu Andy!', 'Marti ora 18 intalnire cu Andy pe skype! Discuta si despre pagina de isntagram neaparat!', 2, 'ONGOING', '2020-07-06 18:46:17', '2020-07-06 18:46:17');

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexuri pentru tabele `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexuri pentru tabele `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexuri pentru tabele `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `interviews`
--
ALTER TABLE `interviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexuri pentru tabele `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexuri pentru tabele `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexuri pentru tabele `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexuri pentru tabele `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexuri pentru tabele `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexuri pentru tabele `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexuri pentru tabele `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexuri pentru tabele `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexuri pentru tabele `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexuri pentru tabele `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexuri pentru tabele `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indexuri pentru tabele `visas`
--
ALTER TABLE `visas`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `workflow`
--
ALTER TABLE `workflow`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `workflows`
--
ALTER TABLE `workflows`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `applications`
--
ALTER TABLE `applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pentru tabele `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pentru tabele `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT pentru tabele `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pentru tabele `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pentru tabele `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pentru tabele `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pentru tabele `interviews`
--
ALTER TABLE `interviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pentru tabele `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pentru tabele `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pentru tabele `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT pentru tabele `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pentru tabele `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pentru tabele `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT pentru tabele `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pentru tabele `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pentru tabele `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pentru tabele `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pentru tabele `status`
--
ALTER TABLE `status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pentru tabele `tests`
--
ALTER TABLE `tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pentru tabele `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pentru tabele `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pentru tabele `visas`
--
ALTER TABLE `visas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `workflow`
--
ALTER TABLE `workflow`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pentru tabele `workflows`
--
ALTER TABLE `workflows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constrângeri pentru tabele `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constrângeri pentru tabele `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constrângeri pentru tabele `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constrângeri pentru tabele `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constrângeri pentru tabele `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
