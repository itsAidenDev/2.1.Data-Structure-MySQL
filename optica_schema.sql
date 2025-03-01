-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-03-2025 a las 19:46:02
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `optica_schema`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(100) NOT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`, `supplier_id`) VALUES
(4, 'Ray Ban', 1),
(5, 'Dior', 3),
(6, 'Tommy Hilfiger', 2),
(7, 'Gucci', 1),
(9, 'Boss', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `client_zip_code` varchar(10) NOT NULL,
  `client_phone_number` varchar(15) NOT NULL,
  `client_email` varchar(100) NOT NULL,
  `client_created_at` date NOT NULL,
  `recommend_client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`client_id`, `client_name`, `client_zip_code`, `client_phone_number`, `client_email`, `client_created_at`, `recommend_client_id`) VALUES
(1, 'María López Rodríguez', '08025', '673459234', 'maria_lr@gmail.com', '2025-02-10', NULL),
(2, 'Joan Márquez Torres', '08027', '626492345', 'joan_mt@gmail.com', '2025-02-17', 1),
(3, 'Elsa Valles Salvador', '08027', '634528213', 'elsa_vs@gmail.com', '2025-02-24', 1),
(4, 'Enrique Vélez Blanco', '08027', '678345691', 'enrique_vb@gmail.com', '2025-02-23', 2),
(5, 'Esther Soto Duarte', '08030', '678234594', 'esther_sd@gmail.com', '2025-02-22', 3),
(6, 'Lucas Solis Otero', '08031', '673459123', 'lucas_so@gmail.com', '2025-02-13', NULL),
(7, 'Laura Crespo García', '08031', '655348822', 'laura_cg@gmail.com', '2025-02-25', 4),
(8, 'Joaquín Hernández Salcedo', '08025', '664223819', 'joaquin_hs@gmail.com', '2025-02-24', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `employee_name` varchar(100) NOT NULL,
  `employee_phone_number` varchar(15) NOT NULL,
  `employee_email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO `employees` (`employee_id`, `employee_name`, `employee_phone_number`, `employee_email`) VALUES
(1, 'Carlos Pérez Delgado', '672493456', 'carlos_pd@gmail.com'),
(2, 'Sofía Céspedes Montenegro', '688329133', 'sofia_cm@gmail.com'),
(3, 'Antonio Soriano Contreras', '653263811', 'antonio_sc@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glasses`
--

CREATE TABLE `glasses` (
  `glasses_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `left_glass_graduation` decimal(4,2) NOT NULL,
  `right_glass_graduation` decimal(4,2) NOT NULL,
  `frame_type` enum('floating','plastic','metal') NOT NULL,
  `frame_color` varchar(50) NOT NULL,
  `glass_color` varchar(50) NOT NULL,
  `glasses_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `glasses`
--

INSERT INTO `glasses` (`glasses_id`, `brand_id`, `left_glass_graduation`, `right_glass_graduation`, `frame_type`, `frame_color`, `glass_color`, `glasses_price`) VALUES
(3, 4, 4.50, 4.00, 'plastic', 'Black', 'Transparent', 120.99),
(5, 4, 3.00, 2.00, 'floating', 'Red', 'Transparent', 139.99),
(6, 5, 2.00, 2.00, 'plastic', 'Grey', 'Black', 229.99),
(7, 7, 3.00, 2.50, 'metal', 'Silver', 'Transparent', 209.99),
(8, 9, 1.00, 1.50, 'plastic', 'Black and Silver', 'Black', 199.99),
(9, 6, 1.00, 1.50, 'plastic', 'Dark Blue', 'Transparent', 129.99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `glasses_id` int(11) NOT NULL,
  `sale_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`sale_id`, `client_id`, `employee_id`, `glasses_id`, `sale_date`) VALUES
(1, 4, 3, 5, '2025-02-23'),
(2, 7, 3, 5, '2025-02-25'),
(3, 3, 2, 8, '2025-02-24'),
(4, 6, 1, 3, '2025-02-13'),
(5, 5, 3, 3, '2025-02-22'),
(6, 1, 2, 9, '2025-02-10'),
(7, 2, 2, 7, '2025-02-17'),
(8, 8, 1, 6, '2025-02-24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_street` varchar(100) NOT NULL,
  `supplier_street_number` varchar(10) NOT NULL,
  `supplier_floor` varchar(10) DEFAULT NULL,
  `supplier_door` varchar(10) DEFAULT NULL,
  `supplier_city` varchar(100) NOT NULL,
  `supplier_zip_code` varchar(10) NOT NULL,
  `supplier_country` varchar(100) NOT NULL,
  `supplier_phone_number` varchar(15) NOT NULL,
  `supplier_fax` varchar(15) DEFAULT NULL,
  `supplier_nif` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `supplier_street`, `supplier_street_number`, `supplier_floor`, `supplier_door`, `supplier_city`, `supplier_zip_code`, `supplier_country`, `supplier_phone_number`, `supplier_fax`, `supplier_nif`) VALUES
(1, 'Euro Optics', 'Aragó', '34', '2', '1', 'Barcelona', '08025', 'Spain', '+34 932382453', '813749873', '34827123H'),
(2, 'Do Eyewear', 'Chang Zhou Bei Mei Hua Xue Ji Tuan', '45', '6', '4', 'Changzhou- Xinbei District', '201800', 'China', '+86 12073300057', '925849584', '911124198108030024'),
(3, 'Baloby', 'Guentzelstrasse', '17', '4', '1', 'Kalbach', '36148', 'Germany', '+49 06655885860', '5238678584', 'L01X00T47');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `recommend_client_id` (`recommend_client_id`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indices de la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD PRIMARY KEY (`glasses_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `glasses_id` (`glasses_id`);

--
-- Indices de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`),
  ADD UNIQUE KEY `nif` (`supplier_nif`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `glasses`
--
ALTER TABLE `glasses`
  MODIFY `glasses_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`);

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`recommend_client_id`) REFERENCES `clients` (`client_id`);

--
-- Filtros para la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD CONSTRAINT `glasses_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`);

--
-- Filtros para la tabla `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`glasses_id`) REFERENCES `glasses` (`glasses_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
