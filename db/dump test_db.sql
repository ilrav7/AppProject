-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 12 2020 г., 12:09
-- Версия сервера: 10.4.11-MariaDB
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `departments`
--

INSERT INTO `departments` (`id`, `name`, `phone`) VALUES
(6, 'Бухгалтерия', '4-88-35'),
(7, 'Отдел склада', '2-44-11'),
(8, 'Отдел продаж', '3-22-77');

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birthday` date NOT NULL,
  `id_dept` int(11) NOT NULL,
  `id_pos` int(11) NOT NULL,
  `flag_fired` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`id`, `full_name`, `phone`, `birthday`, `id_dept`, `id_pos`, `flag_fired`) VALUES
(5, 'Иванов Иван Иванович', '+7(619)454-8997', '1979-05-11', 6, 18, b'1'),
(7, 'Белый Игорь Николаевич', '+7(099)909-3232', '1991-11-20', 6, 22, b'1'),
(8, 'Остапов Евгений', '+7(909)329-3892', '1994-12-17', 7, 18, b'1'),
(9, 'Никитина Елена Сергеевна', '+7(575)676-5757', '1989-08-18', 7, 24, b'0'),
(10, 'Петров Илья Васильевич', '+7(090)239-0239', '1975-05-11', 8, 28, b'1'),
(12, 'Воронина Мария Викторовна', '+7(839)983-7483', '1998-03-09', 8, 28, b'1'),
(13, 'Сергеева Ирина Николаевна', '+7(343)985-0943', '1987-05-11', 8, 25, b'1'),
(14, 'Васильев Петр Олегович', '+7(546)456-8765', '1977-02-09', 8, 19, b'1'),
(15, 'Игначенко Артем Федорович', '+7(457)668-6797', '1989-04-12', 8, 24, b'1'),
(16, 'Алексеев Юрий Николаевич', '+7(898)967-6765', '1980-05-05', 8, 19, b'1');

-- --------------------------------------------------------

--
-- Структура таблицы `positions`
--

CREATE TABLE `positions` (
  `id` int(11) NOT NULL,
  `name` varchar(70) NOT NULL,
  `salary` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `positions`
--

INSERT INTO `positions` (`id`, `name`, `salary`) VALUES
(18, 'Специалист', 40),
(19, 'Оператор', 30),
(20, 'Бухгалтер', 50),
(22, 'Гл. бухгалтер', 60),
(23, 'Экономист', 50),
(24, 'Грузчик', 40),
(25, 'Нач.склада', 70),
(26, 'Продавец', 40),
(27, 'Старший продавец', 50),
(28, 'Работник зала', 35);

-- --------------------------------------------------------

--
-- Структура таблицы `users_app`
--

CREATE TABLE `users_app` (
  `Id` int(11) NOT NULL,
  `login` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) NOT NULL,
  `FIRSTNAME` varchar(50) DEFAULT NULL,
  `LASTNAME` varchar(50) DEFAULT NULL,
  `COMMENTS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users_app`
--

INSERT INTO `users_app` (`Id`, `login`, `password`, `FIRSTNAME`, `LASTNAME`, `COMMENTS`) VALUES
(2, 'admin', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Иван', 'Петров', 'пароль - 123 - в бд хранится в sha'),
(3, 'egorka', 'd84ac191b9f096664b6809ed8a2cbb2463c5ba04', 'Николай', 'Егоров', 'пароль - egorka - в бд хранится в sha');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dept` (`id_dept`),
  ADD KEY `id_pos` (`id_pos`);

--
-- Индексы таблицы `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users_app`
--
ALTER TABLE `users_app`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `users_app`
--
ALTER TABLE `users_app`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`id_dept`) REFERENCES `departments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`id_pos`) REFERENCES `positions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
