-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 20 2023 г., 22:21
-- Версия сервера: 5.7.39
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ebooks`
--
CREATE DATABASE IF NOT EXISTS `ebooks` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `ebooks`;

-- --------------------------------------------------------

--
-- Структура таблицы `authors`
--

CREATE TABLE `authors` (
                           `id` bigint(20) UNSIGNED NOT NULL,
                           `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                           `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                           `patronymic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                           `information` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                           `created_at` timestamp NULL DEFAULT NULL,
                           `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `authors`
--

INSERT INTO `authors` (`id`, `surname`, `name`, `patronymic`, `information`, `created_at`, `updated_at`) VALUES
    (1, 'Пушкин', 'Александр', 'Сергеевич', 'Русский поэт, писатель', '2023-03-19 04:01:57', '2023-03-19 04:01:57');

-- --------------------------------------------------------

--
-- Структура таблицы `author_books`
--

CREATE TABLE `author_books` (
                                `id` bigint(20) UNSIGNED NOT NULL,
                                `author_id` bigint(20) UNSIGNED DEFAULT NULL,
                                `book_id` bigint(20) UNSIGNED DEFAULT NULL,
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `bookmarks`
--

CREATE TABLE `bookmarks` (
                             `id` bigint(20) UNSIGNED NOT NULL,
                             `user_id` bigint(20) UNSIGNED DEFAULT NULL,
                             `book_id` bigint(20) UNSIGNED DEFAULT NULL,
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
                         `id` bigint(20) UNSIGNED NOT NULL,
                         `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `year_of_issue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `rating` double NOT NULL DEFAULT '0',
                         `created_at` timestamp NULL DEFAULT NULL,
                         `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`id`, `title`, `year_of_issue`, `image`, `file`, `rating`, `created_at`, `updated_at`) VALUES
                                                                                                                (1, 'Война и мир', '1812', 'images/books/ZOPnhfUTIq1INbki6axItXUbYivbMS4YUsXDtgmd.jpg', 'books/H07lQeRunTHobqHgY90LrO7XYXaB9igez8A2kFPt.epub', 0, '2023-03-19 04:11:41', '2023-03-19 04:11:41'),
                                                                                                                (2, 'Мастер и Маргарита', '2019', 'images/books/RXrllYYZ2eQgrs94MFCjsbCWYmOD5YPIoPNSLn3K.jpg', 'books/SWh8of35zd2CYuy7f4MhaIfCN7dyq1ra5zMnchIl.epub', 4.6, '2023-03-19 04:28:35', '2023-03-19 05:03:52');

-- --------------------------------------------------------

--
-- Структура таблицы `bookshelves`
--

CREATE TABLE `bookshelves` (
                               `id` bigint(20) UNSIGNED NOT NULL,
                               `shelf_id` bigint(20) UNSIGNED DEFAULT NULL,
                               `book_id` bigint(20) UNSIGNED DEFAULT NULL,
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
                              `id` int(10) UNSIGNED NOT NULL,
                              `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
                                                          (1, '2014_10_12_000000_create_users_table', 1),
                                                          (2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
                                                          (3, '2023_03_17_181315_create_authors_table', 1),
                                                          (4, '2023_03_17_181433_create_books_table', 1),
                                                          (5, '2023_03_17_181545_create_shelves_table', 1),
                                                          (6, '2023_03_17_181701_create_author_books_table', 1),
                                                          (7, '2023_03_17_182137_create_bookshelves_table', 1),
                                                          (8, '2023_03_17_182242_create_reviews_table', 1),
                                                          (9, '2023_03_17_182415_create_bookmarks_table', 1),
                                                          (10, '2023_03_17_182510_create_quotes_table', 1),
                                                          (11, '2023_03_17_182640_create_moderators_table', 1),
                                                          (12, '2023_03_20_182816_remove_user_password', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `moderators`
--

CREATE TABLE `moderators` (
                              `id` bigint(20) UNSIGNED NOT NULL,
                              `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `created_at` timestamp NULL DEFAULT NULL,
                              `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
                                          `id` bigint(20) UNSIGNED NOT NULL,
                                          `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `tokenable_id` bigint(20) UNSIGNED NOT NULL,
                                          `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `abilities` text COLLATE utf8mb4_unicode_ci,
                                          `last_used_at` timestamp NULL DEFAULT NULL,
                                          `expires_at` timestamp NULL DEFAULT NULL,
                                          `created_at` timestamp NULL DEFAULT NULL,
                                          `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
                                                                                                                                                                          (1, 'App\\Models\\User', 5, 'token', 'f844341eea242abd62bef9dc1ebf59f3fb655f6b74a04398bc0d8348651d514b', '[\"*\"]', '2023-03-18 09:42:18', NULL, '2023-03-18 09:18:05', '2023-03-18 09:42:18'),
                                                                                                                                                                          (2, 'App\\Models\\User', 5, 'token', '832be7c9532e7fbbd19e7547e9b004d9b84c83f5bd992cbe8cc94195842ae8b4', '[\"*\"]', '2023-03-18 09:29:31', NULL, '2023-03-18 09:29:24', '2023-03-18 09:29:31'),
                                                                                                                                                                          (3, 'App\\Models\\User', 5, 'token', 'bc2dca685739a65205309b51d01cca083e41de071a42af6ad83a328b68874fa3', '[\"*\"]', NULL, NULL, '2023-03-18 09:42:02', '2023-03-18 09:42:02'),
                                                                                                                                                                          (4, 'App\\Models\\User', 5, 'token', '540d2dde2c13475becac889b756ac1a6453301b45f2078b1a04241964932ab43', '[\"*\"]', '2023-03-18 09:44:56', NULL, '2023-03-18 09:44:12', '2023-03-18 09:44:56'),
                                                                                                                                                                          (5, 'App\\Models\\User', 5, 'token', 'b8730a44cf66ebbcae92c42b0c114abe23fbe6b0f64ae8c4662c898647a7e141', '[\"*\"]', '2023-03-18 09:53:30', NULL, '2023-03-18 09:53:02', '2023-03-18 09:53:30'),
                                                                                                                                                                          (6, 'App\\Models\\User', 5, 'token', '38d368faeb5dd7510a196136bf1a76832f50f13c8cf1943b3ad20ef299901dc6', '[\"*\"]', '2023-03-18 13:48:45', NULL, '2023-03-18 09:53:45', '2023-03-18 13:48:45'),
                                                                                                                                                                          (7, 'App\\Models\\User', 14, 'token', 'ce46b7614b92ec5de4483dd605f91bec046ce6865b7c5cf808f75ca6a63682a0', '[\"*\"]', NULL, NULL, '2023-03-18 15:13:40', '2023-03-18 15:13:40'),
                                                                                                                                                                          (8, 'App\\Models\\User', 14, 'token', 'e37bf4b0259cefa237a66b438ca9b124304c3d9c046f044b461bf58925e686b1', '[\"*\"]', NULL, NULL, '2023-03-18 15:15:13', '2023-03-18 15:15:13'),
                                                                                                                                                                          (9, 'App\\Models\\User', 14, 'token', 'b773c15b3a428bd42d93f1449a3e00a1e897267990a4c9528a1c882d802b636c', '[\"*\"]', NULL, NULL, '2023-03-18 15:16:17', '2023-03-18 15:16:17'),
                                                                                                                                                                          (10, 'App\\Models\\User', 14, 'token', '5d81967506a54b6d5833916c5618969edeb2975d03746995e08b65506595ec92', '[\"*\"]', NULL, NULL, '2023-03-18 15:16:47', '2023-03-18 15:16:47'),
                                                                                                                                                                          (11, 'App\\Models\\User', 14, 'token', '77affbe418f6ed0b417d09498a0797bf8a20fe0ed44e68f2a777df841b524b1f', '[\"*\"]', NULL, NULL, '2023-03-18 15:17:03', '2023-03-18 15:17:03'),
                                                                                                                                                                          (12, 'App\\Models\\User', 14, 'token', '13b85b1c43574ed9df0c982c6aa4690776fb1ae301976b3d061d21df76994baf', '[\"*\"]', NULL, NULL, '2023-03-18 15:17:24', '2023-03-18 15:17:24'),
                                                                                                                                                                          (13, 'App\\Models\\User', 14, 'token', '66ff2beb77c81f1fe4e1d98a3c2f1f37550772aa13192077c415c049337e4b5c', '[\"*\"]', NULL, NULL, '2023-03-18 15:18:04', '2023-03-18 15:18:04'),
                                                                                                                                                                          (14, 'App\\Models\\User', 14, 'token', 'd600f3bad93a92ce349266a9faca05643761f4f50eec00b5ed48d40dcc8b6e92', '[\"*\"]', NULL, NULL, '2023-03-18 15:19:04', '2023-03-18 15:19:04'),
                                                                                                                                                                          (15, 'App\\Models\\User', 14, 'token', 'fc6d6abb6e6dacd65c10c5431b5bacfc40dc330e0045de4b7f504163aa332cd3', '[\"*\"]', NULL, NULL, '2023-03-18 15:23:18', '2023-03-18 15:23:18'),
                                                                                                                                                                          (16, 'App\\Models\\User', 14, 'token', 'd5feb872a4327ebaae16a305497afdc8e75d0232cdcd936b9ef3a17a2d6e5b0d', '[\"*\"]', NULL, NULL, '2023-03-18 15:25:59', '2023-03-18 15:25:59'),
                                                                                                                                                                          (17, 'App\\Models\\User', 14, 'token', '5ead33a3b4b4dac61aed5c10b96ae286944a6fdf8a59beaf7042c99dd67ea002', '[\"*\"]', NULL, NULL, '2023-03-18 15:27:59', '2023-03-18 15:27:59'),
                                                                                                                                                                          (18, 'App\\Models\\User', 15, 'token', '5cbbf33f2f05c90646c4209bfafc1468190ee344a63e19de29bb4d9a1bb3a56e', '[\"*\"]', NULL, NULL, '2023-03-18 15:31:24', '2023-03-18 15:31:24'),
                                                                                                                                                                          (19, 'App\\Models\\User', 15, 'token', '0f66b66c23c01522cebff198737e7b94034f101eb083b1d58facc0ea0bf5e9e9', '[\"*\"]', NULL, NULL, '2023-03-18 15:35:49', '2023-03-18 15:35:49'),
                                                                                                                                                                          (20, 'App\\Models\\User', 17, 'token', '4469815d07790ba1a71f267245d0d3cd9a49a3587dff7fe294ce8c51cc3b307a', '[\"*\"]', NULL, NULL, '2023-03-18 16:57:31', '2023-03-18 16:57:31'),
                                                                                                                                                                          (21, 'App\\Models\\User', 17, 'token', '967972e172ce9d18f25149abaefb9b8e5f65b59fd77a4cafba0496f4348459cf', '[\"*\"]', '2023-03-18 16:57:56', NULL, '2023-03-18 16:57:47', '2023-03-18 16:57:56'),
                                                                                                                                                                          (22, 'App\\Models\\User', 19, 'token', '48122f077082110b34886920da11cfbf5410b6ec9cbfc2be1b7d8293376016ef', '[\"*\"]', '2023-03-19 05:03:52', NULL, '2023-03-19 03:55:26', '2023-03-19 05:03:52');

-- --------------------------------------------------------

--
-- Структура таблицы `quotes`
--

CREATE TABLE `quotes` (
                          `id` bigint(20) UNSIGNED NOT NULL,
                          `user_id` bigint(20) UNSIGNED DEFAULT NULL,
                          `book_id` bigint(20) UNSIGNED DEFAULT NULL,
                          `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                          `created_at` timestamp NULL DEFAULT NULL,
                          `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
                           `id` bigint(20) UNSIGNED NOT NULL,
                           `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                           `book_id` bigint(20) UNSIGNED DEFAULT NULL,
                           `user_id` bigint(20) UNSIGNED DEFAULT NULL,
                           `rating` int(11) NOT NULL,
                           `created_at` timestamp NULL DEFAULT NULL,
                           `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shelves`
--

CREATE TABLE `shelves` (
                           `id` bigint(20) UNSIGNED NOT NULL,
                           `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                           `user_id` bigint(20) UNSIGNED DEFAULT NULL,
                           `created_at` timestamp NULL DEFAULT NULL,
                           `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
                         `id` bigint(20) UNSIGNED NOT NULL,
                         `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `patronymic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `email_verified_at` timestamp NULL DEFAULT NULL,
                         `is_verified` tinyint(1) NOT NULL DEFAULT '0',
                         `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `created_at` timestamp NULL DEFAULT NULL,
                         `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `surname`, `name`, `patronymic`, `username`, `email`, `email_verified_at`, `is_verified`, `remember_token`, `created_at`, `updated_at`) VALUES
    (19, 'Гришин', 'Павел', NULL, 'pav5', 'isip_p.s.grishin@mpt.ru', '2023-03-19 03:53:53', 0, '22|750AH40zRDBr6NkbFQLFhjPypvRgCyytrq4RcjMG', '2023-03-19 03:51:05', '2023-03-19 03:55:26');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `authors`
--
ALTER TABLE `authors`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `author_books`
--
ALTER TABLE `author_books`
    ADD PRIMARY KEY (`id`),
  ADD KEY `author_books_author_id_foreign` (`author_id`),
  ADD KEY `author_books_book_id_foreign` (`book_id`);

--
-- Индексы таблицы `bookmarks`
--
ALTER TABLE `bookmarks`
    ADD PRIMARY KEY (`id`),
  ADD KEY `bookmarks_user_id_foreign` (`user_id`),
  ADD KEY `bookmarks_book_id_foreign` (`book_id`);

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bookshelves`
--
ALTER TABLE `bookshelves`
    ADD PRIMARY KEY (`id`),
  ADD KEY `bookshelves_shelf_id_foreign` (`shelf_id`),
  ADD KEY `bookshelves_book_id_foreign` (`book_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `moderators`
--
ALTER TABLE `moderators`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `moderators_login_unique` (`login`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `quotes`
--
ALTER TABLE `quotes`
    ADD PRIMARY KEY (`id`),
  ADD KEY `quotes_user_id_foreign` (`user_id`),
  ADD KEY `quotes_book_id_foreign` (`book_id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
    ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_book_id_foreign` (`book_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `shelves`
--
ALTER TABLE `shelves`
    ADD PRIMARY KEY (`id`),
  ADD KEY `shelves_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `authors`
--
ALTER TABLE `authors`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `author_books`
--
ALTER TABLE `author_books`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `bookmarks`
--
ALTER TABLE `bookmarks`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `bookshelves`
--
ALTER TABLE `bookshelves`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `moderators`
--
ALTER TABLE `moderators`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `quotes`
--
ALTER TABLE `quotes`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shelves`
--
ALTER TABLE `shelves`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `author_books`
--
ALTER TABLE `author_books`
    ADD CONSTRAINT `author_books_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `author_books_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `bookmarks`
--
ALTER TABLE `bookmarks`
    ADD CONSTRAINT `bookmarks_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bookmarks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `bookshelves`
--
ALTER TABLE `bookshelves`
    ADD CONSTRAINT `bookshelves_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bookshelves_shelf_id_foreign` FOREIGN KEY (`shelf_id`) REFERENCES `shelves` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `quotes`
--
ALTER TABLE `quotes`
    ADD CONSTRAINT `quotes_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quotes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `reviews`
--
ALTER TABLE `reviews`
    ADD CONSTRAINT `reviews_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `shelves`
--
ALTER TABLE `shelves`
    ADD CONSTRAINT `shelves_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
