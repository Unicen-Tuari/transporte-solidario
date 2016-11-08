-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-11-2016 a las 23:17:43
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.8

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajesolidario`
--

CREATE TABLE `viajesolidario` (
  `id_viaje` int(11) NOT NULL,
  `origen` varchar(50) NOT NULL,
  `destino` varchar(50) NOT NULL,
  `fecha_creac` date NOT NULL,
  `id_ong` int(11) NOT NULL,
  `habilitado` tinyint(1) NOT NULL,
  `frecuencia` varchar(50) NOT NULL,
  `alto` float NOT NULL,
  `ancho` float NOT NULL,
  `peso` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `viajesolidario`
--

INSERT INTO `viajesolidario` (`id_viaje`, `origen`, `destino`, `fecha_creac`, `id_ong`, `habilitado`, `frecuencia`, `alto`, `ancho`, `peso`) VALUES
(1, 'Tandil', 'Azul', '2016-11-07', 1, 1, 'mensual', 1, 4, 25),
(2, 'Tandil', 'Olavarria', '2016-11-07', 2, 1, 'Semanal', 2, 2, 34),
(5, 'Tandil', 'Juarez', '2016-11-07', 3, 1, '15 dias', 1.4, 2.2, 66),
(6, 'Tandil', 'Capital Federal', '2016-11-07', 4, 1, 'Mensual', 1, 1.5, 33);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viaje_realizado`
--

CREATE TABLE `viaje_realizado` (
  `id_viaje` int(11) NOT NULL,
  `id_transportista` int(11) NOT NULL,
  `fecha_realizado` date NOT NULL,
  `observacion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `viaje_realizado`
--

INSERT INTO `viaje_realizado` (`id_viaje`, `id_transportista`, `fecha_realizado`, `observacion`) VALUES
(1, 3, '2016-11-08', 'Problemas de logistica en destino no hay personal para descargar'),
(5, 4, '2016-11-16', 'Se despacho mercaderia en deposito alternativo indicado por ONG');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `viajesolidario`
--
ALTER TABLE `viajesolidario`
  ADD PRIMARY KEY (`id_viaje`),
  ADD KEY `id_ong` (`id_ong`);

--
-- Indices de la tabla `viaje_realizado`
--
ALTER TABLE `viaje_realizado`
  ADD KEY `id_viaje` (`id_viaje`),
  ADD KEY `id_transportista` (`id_transportista`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `viajesolidario`
--
ALTER TABLE `viajesolidario`
  MODIFY `id_viaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `viaje_realizado`
--
ALTER TABLE `viaje_realizado`
  ADD CONSTRAINT `fk_viajesolidario_realizado` FOREIGN KEY (`id_viaje`) REFERENCES `viajesolidario` (`id_viaje`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
