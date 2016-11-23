-- phpMyAdmin SQL Dump

-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1

-- Tiempo de generación: 16-11-2016 a las 11:13:31

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
(7, 'Registrarme', 'registro', 'UserController', '', '2016-10-26 03:00:00', '2016-10-26 03:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `slug` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`id`, `name`, `slug`) VALUES
(1, 'Invitado', 'guest'),
(2, 'Administrador', 'admin'),
(3, 'O.N.G.', 'ong'),
(4, 'Transportista', 'transportista'),
(5, 'Usuario', 'user');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_menu`
--

CREATE TABLE `role_menu` (
  `id_role` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `role_menu`
--

INSERT INTO `role_menu` (`id_role`, `id_menu`) VALUES
(1, 6),
(1, 7),
(2, 1),
(2, 4),
(2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `facebook` varchar(50) DEFAULT NULL,
  `webpage` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `telefono` varchar(50) DEFAULT NULL,
  `tipo_usuario` varchar(255) NOT NULL,
  `fecha_alta` date NOT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de usuarios transporte solidario';

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `facebook`, `webpage`, `descripcion`, `telefono`, `tipo_usuario`, `fecha_alta`, `img_path`, `id_role`) VALUES
(1, 'SysAdmin', 'a@a.com', '$2a$06$E/WR4ekkv7YuZFJpFbak8.qayik9YrtWuGVO4zMQefgpLg5KCpWRW', NULL, 'transportesolidario.app', NULL, NULL, '', '2016-11-17', NULL, 2),
(2, 'Mesa Solidaria', 'mesasolidaria@lala.com', 'laclave1', 'miramelamesa', 'que mesasa', 'son un para de chavones/as que hacen cosas por la gente', '24324234', 'ONG', '2016-11-16', 'img\\logo_Mesa.png',3),
(3, 'Banco de alimentos', 'bancoalimentos@gmail.com', 'quebanquitopapa', 'bancoalimentos', 'www.bankfood.com', 'El citibank del morfi', '3247932864', 'ONG', '2016-11-16', 'img\\BancoAlimentos.jpg',3),
(4, 'reinventar', 'teinventedenuevo@gmail.com', '27o8127oyhdlq', 'reinventarTandil', 'www.reinventar.com.ar', 'hacen algo', '23212', 'ONG', '2016-11-15', 'img\\reinventar.jpg',3);

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
(1, 'Tandil', 'Azul', '2016-11-07', 2, 1, 'mensual', 1, 4, 25),
(2, 'Tandil', 'Olavarria', '2016-11-07', 2, 1, 'Semanal', 2, 2, 34),
(5, 'Tandil', 'Juarez', '2016-11-07', 3, 1, '15 dias', 1.4, 2.2, 66),
(6, 'Tandil', 'Capital Federal', '2016-11-07', 4, 1, 'Mensual', 1, 1.5, 33),
(7, 'Azul', 'Tandil', '2016-11-19', 2, 1, 'Mensual', 30, 30, 10);

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `ofrecido`
--

CREATE TABLE `ofrecido` (
  `id_ofrecimiento` int(11) NOT NULL,
  `id_viaje` int(11) NOT NULL,
  `id_transportista` int(11) NOT NULL,
  `oferta_activa` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
INSERT INTO `viaje_realizado` (`id_viaje`, `id_transportista`, `fecha_realizado`, `observacion`, `estado`) VALUES
(1, 3, '2016-11-08', 'Problemas de logistica en destino no hay personal para descargar', 1),
(2, 5, '2016-11-22', 'LALALA', 1),
(5, 4, '2016-11-16', 'Se despacho mercaderia en deposito alternativo indicado por ONG', 2),
(7, 5, '2016-11-19', 'sgsdgsd', 0);


--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role_menu`
--
ALTER TABLE `role_menu`
  ADD PRIMARY KEY (`id_role`,`id_menu`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
