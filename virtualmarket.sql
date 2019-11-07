-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2019 a las 20:59:31
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `virtualmarket`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `dniCliente` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `Admin` tinyint(1) NOT NULL DEFAULT 0,
  `pwd` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`dniCliente`, `nombre`, `direccion`, `email`, `Admin`, `pwd`) VALUES
('11111111', 'antonio', 'C/ valeras 22', 'antonio@midominio.es', 0, '$2y$10$dqkxxYQHxUdQ7R7RoZLXquTN4kIYYHuQyuJUc0k.iwm9.3taBj6Qu'),
('35604192P', 'Santiago', 'Cº Mestre Marcal', 'itnas11@gmail.com', 1, '$2y$10$MUISpeq5prmPmuRzTUja6eGG4WQf2B16KE0WYpMF5LqEklDwecN7.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineaspedidos`
--

CREATE TABLE `lineaspedidos` (
  `idPedido` int(4) NOT NULL,
  `nlinea` int(2) NOT NULL,
  `idProducto` int(6) DEFAULT NULL,
  `cantidad` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `lineaspedidos`
--

INSERT INTO `lineaspedidos` (`idPedido`, `nlinea`, `idProducto`, `cantidad`) VALUES
(1, 1, 3, 10),
(1, 2, 4, 10),
(1, 3, 9, 10),
(2, 1, 5, 10),
(2, 2, 7, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idPedido` int(4) NOT NULL,
  `fecha` date NOT NULL,
  `dirEntrega` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nTarjeta` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fechaCaducidad` date DEFAULT NULL,
  `matriculaRepartidor` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dniCliente` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`idPedido`, `fecha`, `dirEntrega`, `nTarjeta`, `fechaCaducidad`, `matriculaRepartidor`, `dniCliente`) VALUES
(1, '2016-01-20', 'C/ Valeras, 22', '111111', '2020-02-02', 'pbf-1144', '11111111'),
(2, '2016-02-10', 'C/ Princesa, 15', '333333', '2020-02-02', 'bbc-2589', '33333333');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(6) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `origen` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foto` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marca` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `peso` int(3) NOT NULL,
  `Categoria` enum('Estrategia') CHARACTER SET utf8 DEFAULT NULL,
  `unidades` int(5) NOT NULL,
  `volumen` int(4) DEFAULT NULL,
  `precio` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombre`, `origen`, `foto`, `marca`, `peso`, `Categoria`, `unidades`, `volumen`, `precio`) VALUES
(1, 'Catan', 'Alemania', 'macarrones.jpg', 'Devir', 250, 'Estrategia', 100, 10, 35),
(2, 'Risk', 'Francia', 'tallarines.jpg', 'Devir', 250, 'Estrategia', 100, 10, 30),
(3, 'Dead of Winter', 'Inglesh', 'atun.jpg', 'Edge Entertainment', 250, 'Estrategia', 100, 10, 57),
(4, 'Guerra del anillo', 'Francia', 'sardinas.jpg', 'Devir', 250, 'Estrategia', 100, 10, 70),
(5, 'Juego de tronos: el juego de tablero', 'Estados Unidos', 'mejillones.jpg', 'Asmodée', 125, 'Estrategia', 100, 10, 50),
(6, 'Star Wars: Imperial Assault', 'Estados Unidos', 'fideos.jpg', 'Edge Entertainment', 250, 'Estrategia', 100, 10, 95);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`dniCliente`);

--
-- Indices de la tabla `lineaspedidos`
--
ALTER TABLE `lineaspedidos`
  ADD PRIMARY KEY (`idPedido`,`nlinea`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idPedido`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
