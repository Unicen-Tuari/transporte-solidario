-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
<<<<<<< HEAD
-- Tiempo de generación: 22-11-2016 a las 04:50:28
-- Versión del servidor: 5.6.25
-- Versión de PHP: 5.6.11
=======
-- Tiempo de generación: 16-11-2016 a las 11:13:31
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24
>>>>>>> 2dd0aa2d2e6de7c03d2da198a30600ce489935b3

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

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(10) unsigned NOT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Estructura de tabla para la tabla `users`
--

<<<<<<< HEAD
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
=======
CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
>>>>>>> 2dd0aa2d2e6de7c03d2da198a30600ce489935b3
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `facebook` varchar(50) DEFAULT NULL,
  `webpage` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `telefono` varchar(50) DEFAULT NULL,
  `tipo_usuario` varchar(255) NOT NULL,
  `fecha_alta` date NOT NULL,
  `img_path` varchar(255) DEFAULT NULL
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Tabla de usuarios transporte solidario';
=======
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de usuarios transporte solidario';
>>>>>>> 2dd0aa2d2e6de7c03d2da198a30600ce489935b3

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `facebook`, `webpage`, `descripcion`, `telefono`, `tipo_usuario`, `fecha_alta`, `img_path`) VALUES
<<<<<<< HEAD
(1, 'Admin', 'a@a.com', '$2a$06$E/WR4ekkv7YuZFJpFbak8.qayik9YrtWuGVO4zMQefgpLg5KCpWRW', NULL, NULL, NULL, NULL, '', '0000-00-00', NULL);
=======
(1, 'Admin', 'a@a.com', '$2a$06$E/WR4ekkv7YuZFJpFbak8.qayik9YrtWuGVO4zMQefgpLg5KCpWRW', 'aa_face', 'www.a.com', 'acá va las descripción para a@a', '0249 154 78944', 'admin', '0000-00-00', 'user-icon.png'),
(8, 'carlitos', 'carlitos@hotmail.com', '$2a$06$E/WR4ekkv7YuZFJpFbak8.qayik9YrtWuGVO4zMQefgpLg5KCpWRW', NULL, 'www.carlitos.com', 'carlitos es un transportista', NULL, 'transportista', '2016-11-08', 'user-icon.png'),
(9, 'losPibes', 'pibes@hotmail.com', '$2a$06$E/WR4ekkv7YuZFJpFbak8.qayik9YrtWuGVO4zMQefgpLg5KCpWRW', 'no sé que es facebook', 'www.vamoLosPibes.com', 'losPibes es un ONG', '0223 658 68974', 'ong', '2016-11-12', NULL),
(10, 'alberto', 'alberto@gmail.com', '$2a$06$E/WR4ekkv7YuZFJpFbak8.qayik9YrtWuGVO4zMQefgpLg5KCpWRW', 'alberFace', 'www.alber.com', 'alberto es un transportista', NULL, 'transportista', '2016-11-08', 'user-icon.png'),
(11, 'doña Amanda', 'Ñamanda@hotmail.com', '$2a$06$E/WR4ekkv7YuZFJpFbak8.qayik9YrtWuGVO4zMQefgpLg5KCpWRW', NULL, NULL, 'vamos a completar algo de doña amanda', NULL, 'ong', '2016-11-01', NULL),
(12, 'pablo', 'pablo@hotmail.com', '$2a$06$E/WR4ekkv7YuZFJpFbak8.qayik9YrtWuGVO4zMQefgpLg5KCpWRW', 'pablo.face', 'www.pablo.com', 'pablo es un usuario', NULL, 'usuario', '2016-11-08', 'user-icon.png');
>>>>>>> 2dd0aa2d2e6de7c03d2da198a30600ce489935b3

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajesolidario`
--

CREATE TABLE IF NOT EXISTS `viajesolidario` (
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `viajesolidario`
--

INSERT INTO `viajesolidario` (`id_viaje`, `origen`, `destino`, `fecha_creac`, `id_ong`, `habilitado`, `frecuencia`, `alto`, `ancho`, `peso`) VALUES
(1, 'Tandil', 'Azul', '2016-11-07', 1, 1, 'mensual', 1, 4, 25),
(2, 'Tandil', 'Olavarria', '2016-11-07', 2, 1, 'Semanal', 2, 2, 34),
(5, 'Tandil', 'Juarez', '2016-11-07', 3, 1, '15 dias', 1.4, 2.2, 66),
(6, 'Tandil', 'Capital Federal', '2016-11-07', 4, 1, 'Mensual', 1, 1.5, 33),
(7, 'Azul', 'Tandil', '2016-11-19', 2, 1, 'Mensual', 30, 30, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viaje_realizado`
--

CREATE TABLE IF NOT EXISTS `viaje_realizado` (
  `id_viaje` int(11) NOT NULL,
  `id_transportista` int(11) NOT NULL,
  `fecha_realizado` date NOT NULL,
  `observacion` varchar(150) DEFAULT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `viaje_realizado`
--

<<<<<<< HEAD
INSERT INTO `viaje_realizado` (`id_viaje`, `id_transportista`, `fecha_realizado`, `observacion`, `estado`) VALUES
(1, 3, '2016-11-08', 'Problemas de logistica en destino no hay personal para descargar', 1),
(2, 5, '2016-11-22', 'LALALA', 1),
(5, 4, '2016-11-16', 'Se despacho mercaderia en deposito alternativo indicado por ONG', 2),
(7, 5, '2016-11-19', 'sgsdgsd', 0);
=======
INSERT INTO `viaje_realizado` (`id_viaje`, `id_transportista`, `fecha_realizado`, `observacion`) VALUES
(1, 3, '2016-11-08', 'Problemas de logistica en destino no hay personal para descargar'),
(5, 4, '2016-11-16', 'Se despacho mercaderia en deposito alternativo indicado por ONG');
>>>>>>> 2dd0aa2d2e6de7c03d2da198a30600ce489935b3

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
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
  ADD PRIMARY KEY (`id_viaje`,`id_transportista`),
  ADD KEY `id_viaje` (`id_viaje`),
  ADD KEY `id_transportista` (`id_transportista`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
<<<<<<< HEAD
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
=======
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
>>>>>>> 2dd0aa2d2e6de7c03d2da198a30600ce489935b3
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
<<<<<<< HEAD
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
=======
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
>>>>>>> 2dd0aa2d2e6de7c03d2da198a30600ce489935b3
--
-- AUTO_INCREMENT de la tabla `viajesolidario`
--
ALTER TABLE `viajesolidario`
  MODIFY `id_viaje` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `viaje_realizado`
--
ALTER TABLE `viaje_realizado`
  MODIFY `id_transportista` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
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
