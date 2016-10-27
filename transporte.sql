-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-10-2016 a las 08:19:13
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `transporte`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `text`, `action`, `controller`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Usuarios', 'usuarios', 'UserController', 'admin', '2016-10-26 03:00:00', '2016-10-26 03:00:00'),
(2, 'Cargar Viaje', 'cargar-viaje', 'ViajesController', 'ong', '2016-10-26 03:00:00', '2016-10-26 03:00:00'),
(3, 'Viajes pendientes', 'viajes-pendientes', 'ViajesController', 'transportista', '2016-10-26 03:00:00', '2016-10-26 03:00:00'),
(4, 'Viajes Realizados', 'viajes-realizados', 'HistorialViajesController', 'transportista', '2016-10-26 03:00:00', '2016-10-26 03:00:00'),
(5, 'Ver Perfil', 'perfil', 'UserController', 'usuario', '2016-10-26 03:00:00', '2016-10-26 03:00:00'),
(6, 'Ingresar', 'login', 'LoginController', '', '2016-10-26 03:00:00', '2016-10-26 03:00:00'),
(7, 'Registrarme', 'register', 'UserController', '', '2016-10-26 03:00:00', '2016-10-26 03:00:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
