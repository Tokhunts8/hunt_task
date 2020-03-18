-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 18 2020 г., 18:12
-- Версия сервера: 10.1.38-MariaDB
-- Версия PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `hunt_task`
--

-- --------------------------------------------------------

--
-- Структура таблицы `projects`
--

CREATE TABLE `projects` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` int(255) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `url` varchar(555) NOT NULL,
  `employer_name` varchar(55) NOT NULL,
  `employer_login` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `projects`
--

INSERT INTO `projects` (`id`, `name`, `amount`, `currency`, `url`, `employer_name`, `employer_login`) VALUES
(1, 'Ð’ÑÑ‚Ñ€Ð¾Ð¸Ñ‚ÑŒ ÐºÐ°Ñ€Ñ‚Ð¸Ð½Ñƒ Ð² Ð¸Ð½Ñ‚ÐµÑ€ÑŒÐµÑ€Ñ‹', 0, '', 'https://freelancehunt.com/project/vstroit-kartinu-intereryi/649867.html', 'Dmitry', 'andrush'),
(2, 'Ð¡Ð¾Ð·Ð´Ð°Ð½Ð¸Ðµ Ð¿Ñ€Ð¸Ð»Ð¾Ð¶ÐµÐ½Ð¸Ñ Ð´Ð»Ñ Ð´ÐµÑ‚ÐµÐ¹', 1000, 'RUB', 'https://freelancehunt.com/project/sozdanie-prilozheniya-dlya-detey/649866.html', 'ÐÐ½Ð°ÑÑ‚Ð°ÑÐ¸Ñ', 'bachurina-03'),
(3, 'ÐÐ°Ð¿Ð¸ÑÐ°Ñ‚ÑŒ Ð°Ð´Ð¼Ð¸Ð½ÐºÑƒ Ðº Ð¿Ñ€Ð¸Ð»Ð¾Ð¶ÐµÐ½Ð¸ÑŽ (php)', 10000, 'RUB', 'https://freelancehunt.com/project/napisat-adminku-prilozheniyu-php/649865.html', 'Ð•Ð²Ð³ÐµÐ½Ð¸Ñ', 'Severinea'),
(4, 'Ð”Ð¾Ñ€Ð°Ð±Ð¾Ñ‚Ð°Ñ‚ÑŒ ÑÐ°Ð¹Ñ‚ Ð¿Ð¾ Ñ‚Ð· (wordpress)', 0, '', 'https://freelancehunt.com/project/dorabotat-sayt-po-tz-wordpress/649862.html', 'Ð¡ÐµÑ€Ð³ÐµÐ¹', 'sergyd'),
(5, 'Cache Ñ‡ÐµÑ€ÐµÐ· Requests', 0, '', 'https://freelancehunt.com/project/cache-cherez-requests/649861.html', 'ÐžÐ»ÐµÐºÑÐ°Ð½Ð´Ñ€', 'sawal86'),
(6, 'ÐÐ°Ð¿Ð¸ÑÐ°Ð½Ð¸Ðµ Ñ‚ÐµÐºÑÑ‚Ð¾Ð². Ð¢ÐµÐ¼Ð° ÑƒÑ‚Ð¾Ñ‡Ð½ÑÐµÑ‚ÑÑ.', 600, 'UAH', 'https://freelancehunt.com/project/napisanie-tekstov-tema-utochnyaetsya/649859.html', 'Ð®Ð»Ð¸Ñ', 'Juli_juli01'),
(7, 'Ð’ÑÑ‚Ñ€Ð¾Ð¸Ñ‚ÑŒ ÐºÐ°Ñ€Ñ‚Ð¸Ð½Ñƒ Ð² Ð¸Ð½Ñ‚ÐµÑ€ÑŒÐµÑ€Ñ‹', 0, '', 'https://freelancehunt.com/project/vstroit-kartinu-intereryi/649867.html', 'Dmitry', 'andrush'),
(8, 'Ð¡Ð¾Ð·Ð´Ð°Ð½Ð¸Ðµ Ð¿Ñ€Ð¸Ð»Ð¾Ð¶ÐµÐ½Ð¸Ñ Ð´Ð»Ñ Ð´ÐµÑ‚ÐµÐ¹', 1000, 'RUB', 'https://freelancehunt.com/project/sozdanie-prilozheniya-dlya-detey/649866.html', 'ÐÐ½Ð°ÑÑ‚Ð°ÑÐ¸Ñ', 'bachurina-03'),
(9, '1-Ð¡ CRM ÐÐ°ÑÑ‚Ñ€Ð¾Ð¹ÐºÐ° Ð‘Ð°Ð·Ñ‹ ÐºÐ»Ð¸ÐµÐ½Ñ‚Ð¾Ð² Ð¸ ÑÐ¸ÑÑ‚ÐµÐ¼Ñ‹ Ð»Ð¾ÑÐ»ÑŒÐ½Ð¾ÑÑ‚Ð¸', 0, '', 'https://freelancehunt.com/project/1-s-crm-nastroyka-bazyi-klientov/649858.html', 'Ð•Ð³Ð¾Ñ€', 'Borman_LTd'),
(10, 'ÐÐ°Ð¿Ð¸ÑÐ°Ñ‚ÑŒ Ð°Ð´Ð¼Ð¸Ð½ÐºÑƒ Ðº Ð¿Ñ€Ð¸Ð»Ð¾Ð¶ÐµÐ½Ð¸ÑŽ (php)', 10000, 'RUB', 'https://freelancehunt.com/project/napisat-adminku-prilozheniyu-php/649865.html', 'Ð•Ð²Ð³ÐµÐ½Ð¸Ñ', 'Severinea'),
(11, 'Ð”Ð¾Ñ€Ð°Ð±Ð¾Ñ‚Ð°Ñ‚ÑŒ ÑÐ°Ð¹Ñ‚ Ð¿Ð¾ Ñ‚Ð· (wordpress)', 0, '', 'https://freelancehunt.com/project/dorabotat-sayt-po-tz-wordpress/649862.html', 'Ð¡ÐµÑ€Ð³ÐµÐ¹', 'sergyd'),
(12, 'ÐšÐ¾Ð½ÑÑƒÐ»ÑŒÑ‚Ð°Ñ†Ð¸Ñ Ð¿Ð¾ Wordpress Ð¸ Woocommerce', 0, '', 'https://freelancehunt.com/project/konsultatsiya-po-wordpress-woocommerce/649857.html', 'Ð’Ð¸Ñ‚Ð°Ð»Ð¸Ð¹', 'vitali_k'),
(13, 'Cache Ñ‡ÐµÑ€ÐµÐ· Requests', 0, '', 'https://freelancehunt.com/project/cache-cherez-requests/649861.html', 'ÐžÐ»ÐµÐºÑÐ°Ð½Ð´Ñ€', 'sawal86'),
(14, 'ÐÐ°Ð¿Ð¸ÑÐ°Ð½Ð¸Ðµ Ñ‚ÐµÐºÑÑ‚Ð¾Ð². Ð¢ÐµÐ¼Ð° ÑƒÑ‚Ð¾Ñ‡Ð½ÑÐµÑ‚ÑÑ.', 600, 'UAH', 'https://freelancehunt.com/project/napisanie-tekstov-tema-utochnyaetsya/649859.html', 'Ð®Ð»Ð¸Ñ', 'Juli_juli01'),
(15, 'PHP WordPress', 200, 'UAH', 'https://freelancehunt.com/project/php-wordpress/649856.html', 'Ð•Ð»ÐµÐ½Ð°', 'Elena88_nesteruk'),
(16, '1-Ð¡ CRM ÐÐ°ÑÑ‚Ñ€Ð¾Ð¹ÐºÐ° Ð‘Ð°Ð·Ñ‹ ÐºÐ»Ð¸ÐµÐ½Ñ‚Ð¾Ð² Ð¸ ÑÐ¸ÑÑ‚ÐµÐ¼Ñ‹ Ð»Ð¾ÑÐ»ÑŒÐ½Ð¾ÑÑ‚Ð¸', 0, '', 'https://freelancehunt.com/project/1-s-crm-nastroyka-bazyi-klientov/649858.html', 'Ð•Ð³Ð¾Ñ€', 'Borman_LTd'),
(17, 'Ð Ð°Ð±Ð¾Ñ‚Ð° Ñ Ð¡Ð°Ð¹Ñ‚Ð¾Ð¼ Ð½Ð° Ð‘Ð¸Ñ‚Ñ€Ð¸ÐºÑ 24 ÑˆÐ°Ð±Ð»Ð¾Ð½ ÐÑÐ¿Ñ€Ð¾ Next', 0, '', 'https://freelancehunt.com/project/rabota-saytom-na-bitriks/649855.html', 'Ð•Ð³Ð¾Ñ€', 'Borman_LTd'),
(18, 'ÐšÐ¾Ð½ÑÑƒÐ»ÑŒÑ‚Ð°Ñ†Ð¸Ñ Ð¿Ð¾ Wordpress Ð¸ Woocommerce', 0, '', 'https://freelancehunt.com/project/konsultatsiya-po-wordpress-woocommerce/649857.html', 'Ð’Ð¸Ñ‚Ð°Ð»Ð¸Ð¹', 'vitali_k'),
(19, 'PHP WordPress', 200, 'UAH', 'https://freelancehunt.com/project/php-wordpress/649856.html', 'Ð•Ð»ÐµÐ½Ð°', 'Elena88_nesteruk'),
(20, 'Ð Ð°Ð±Ð¾Ñ‚Ð° Ñ Ð¡Ð°Ð¹Ñ‚Ð¾Ð¼ Ð½Ð° Ð‘Ð¸Ñ‚Ñ€Ð¸ÐºÑ 24 ÑˆÐ°Ð±Ð»Ð¾Ð½ ÐÑÐ¿Ñ€Ð¾ Next', 0, '', 'https://freelancehunt.com/project/rabota-saytom-na-bitriks/649855.html', 'Ð•Ð³Ð¾Ñ€', 'Borman_LTd');

-- --------------------------------------------------------

--
-- Структура таблицы `project_skills`
--

CREATE TABLE `project_skills` (
  `id` int(255) NOT NULL,
  `project_id` int(255) NOT NULL,
  `skill_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `project_skills`
--

INSERT INTO `project_skills` (`id`, `project_id`, `skill_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 2, 2),
(6, 2, 3),
(7, 2, 4),
(8, 3, 1),
(9, 3, 2),
(10, 3, 3),
(11, 3, 4),
(12, 3, 5),
(13, 4, 1),
(14, 4, 2),
(15, 4, 3),
(16, 4, 4),
(17, 4, 5),
(18, 4, 6),
(19, 4, 7),
(20, 5, 1),
(21, 5, 2),
(22, 5, 3),
(23, 5, 4),
(24, 5, 5),
(25, 5, 6),
(26, 5, 7),
(27, 5, 8),
(28, 6, 1),
(29, 6, 2),
(30, 6, 3),
(31, 6, 4),
(32, 6, 5),
(33, 7, 1),
(34, 6, 6),
(35, 7, 2),
(36, 6, 7),
(37, 7, 3),
(38, 6, 8),
(39, 8, 1),
(40, 6, 9),
(41, 8, 2),
(42, 8, 3),
(43, 9, 1),
(44, 8, 4),
(45, 9, 2),
(46, 9, 3),
(47, 10, 1),
(48, 9, 4),
(49, 10, 2),
(50, 9, 5),
(51, 10, 3),
(52, 9, 6),
(53, 10, 4),
(54, 9, 7),
(55, 10, 5),
(56, 9, 8),
(57, 9, 9),
(58, 11, 1),
(59, 11, 2),
(60, 9, 10),
(61, 11, 3),
(62, 11, 4),
(63, 11, 5),
(64, 9, 11),
(65, 11, 6),
(66, 11, 7),
(67, 12, 1),
(68, 12, 2),
(69, 13, 1),
(70, 12, 3),
(71, 13, 2),
(72, 12, 4),
(73, 13, 3),
(74, 12, 5),
(75, 13, 4),
(76, 12, 6),
(77, 13, 5),
(78, 12, 7),
(79, 13, 6),
(80, 12, 8),
(81, 13, 7),
(82, 12, 9),
(83, 13, 8),
(84, 12, 10),
(85, 12, 11),
(86, 14, 1),
(87, 12, 5),
(88, 14, 2),
(89, 14, 3),
(90, 12, 12),
(91, 14, 4),
(92, 14, 5),
(93, 15, 1),
(94, 14, 6),
(95, 15, 2),
(96, 14, 7),
(97, 15, 3),
(98, 14, 8),
(99, 15, 4),
(100, 14, 9),
(101, 15, 5),
(102, 15, 6),
(103, 16, 1),
(104, 15, 7),
(105, 16, 2),
(106, 15, 8),
(107, 16, 3),
(108, 15, 9),
(109, 16, 4),
(110, 15, 10),
(111, 16, 5),
(112, 15, 11),
(113, 16, 6),
(114, 15, 5),
(115, 16, 7),
(116, 15, 12),
(117, 16, 8),
(118, 16, 9),
(119, 15, 13),
(120, 16, 10),
(121, 15, 5),
(122, 16, 11),
(123, 17, 1),
(124, 18, 1),
(125, 17, 2),
(126, 18, 2),
(127, 17, 3),
(128, 18, 3),
(129, 17, 4),
(130, 18, 4),
(131, 17, 5),
(132, 18, 5),
(133, 17, 6),
(134, 18, 6),
(135, 17, 7),
(136, 18, 7),
(137, 17, 8),
(138, 18, 8),
(139, 17, 9),
(140, 18, 9),
(141, 17, 10),
(142, 18, 10),
(143, 17, 11),
(144, 18, 11),
(145, 17, 5),
(146, 18, 5),
(147, 17, 12),
(148, 18, 12),
(149, 17, 13),
(150, 17, 5),
(151, 19, 1),
(152, 19, 2),
(153, 17, 14),
(154, 19, 3),
(155, 19, 4),
(156, 19, 5),
(157, 19, 6),
(158, 19, 7),
(159, 19, 8),
(160, 19, 9),
(161, 19, 10),
(162, 19, 11),
(163, 19, 5),
(164, 19, 12),
(165, 19, 13),
(166, 19, 5),
(167, 20, 1),
(168, 20, 2),
(169, 20, 3),
(170, 20, 4),
(171, 20, 5),
(172, 20, 6),
(173, 20, 7),
(174, 20, 8),
(175, 20, 9),
(176, 20, 10),
(177, 20, 11),
(178, 20, 5),
(179, 20, 12),
(180, 20, 13),
(181, 20, 5),
(182, 20, 14);

-- --------------------------------------------------------

--
-- Структура таблицы `skills`
--

CREATE TABLE `skills` (
  `id` int(255) NOT NULL,
  `skill` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `skills`
--

INSERT INTO `skills` (`id`, `skill`) VALUES
(1, 'Ð‘Ð°Ð½Ð½ÐµÑ€Ñ‹'),
(2, 'Ð”Ð¸Ð·Ð°Ð¹Ð½ Ð²Ð¸Ð·Ð¸Ñ‚Ð¾Ðº'),
(3, 'ÐžÐ±Ñ€Ð°Ð±Ð¾Ñ‚ÐºÐ° Ñ„Ð¾Ñ‚Ð¾'),
(4, 'Ð Ð°Ð·Ñ€Ð°Ð±Ð¾Ñ‚ÐºÐ° Ð¸Ð³Ñ€'),
(5, 'PHP'),
(6, 'Ð’ÐµÐ±-Ð¿Ñ€Ð¾Ð³Ñ€Ð°Ð¼Ð¼Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ðµ'),
(7, 'HTML/CSS Ð²ÐµÑ€ÑÑ‚ÐºÐ°'),
(8, 'Python'),
(9, 'Ð ÐµÐ´Ð°ÐºÑ‚ÑƒÑ€Ð° Ð¸ ÐºÐ¾Ñ€Ñ€ÐµÐºÑ‚ÑƒÑ€Ð° Ñ‚ÐµÐºÑÑ‚Ð¾Ð²'),
(10, '1C'),
(11, 'Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ ÐºÐ»Ð¸ÐµÐ½Ñ‚Ð°Ð¼Ð¸/CRM'),
(12, 'Ð£ÑÑ‚Ð°Ð½Ð¾Ð²ÐºÐ° Ð¸ Ð½Ð°ÑÑ‚Ñ€Ð¾Ð¹ÐºÐ° CMS'),
(13, 'Javascript'),
(14, 'Ð˜Ð½Ñ‚ÐµÑ€Ð½ÐµÑ‚-Ð¼Ð°Ð³Ð°Ð·Ð¸Ð½Ñ‹ Ð¸ ÑÐ»ÐµÐºÑ‚Ñ€Ð¾Ð½Ð½Ð°Ñ ÐºÐ¾Ð¼Ð¼ÐµÑ€Ñ†Ð¸Ñ');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `project_skills`
--
ALTER TABLE `project_skills`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `project_skills`
--
ALTER TABLE `project_skills`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT для таблицы `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
