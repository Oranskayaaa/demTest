-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Июн 14 2025 г., 17:22
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `technologies`
--

-- --------------------------------------------------------

--
-- Структура таблицы `AccessLogs`
--

CREATE TABLE `AccessLogs` (
  `id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `access_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `door_id` int DEFAULT NULL,
  `card_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `ApplicationItems`
--

CREATE TABLE `ApplicationItems` (
  `id` int NOT NULL,
  `application_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_cost` decimal(12,2) DEFAULT NULL,
  `production_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Applications`
--

CREATE TABLE `Applications` (
  `id` int NOT NULL,
  `partner_id` int DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `scheduled_delivery` date DEFAULT NULL,
  `total_cost` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Doors`
--

CREATE TABLE `Doors` (
  `id` int NOT NULL,
  `door_name` varchar(50) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `EmployeeMovements`
--

CREATE TABLE `EmployeeMovements` (
  `id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `door_id` int DEFAULT NULL,
  `movement_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Employees`
--

CREATE TABLE `Employees` (
  `id` int NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `passport_data` varchar(50) DEFAULT NULL,
  `bank_details` varchar(255) DEFAULT NULL,
  `family_status` varchar(50) DEFAULT NULL,
  `health_status` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Equipment`
--

CREATE TABLE `Equipment` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `serial_number` varchar(50) DEFAULT NULL,
  `maintenance_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `EquipmentAccess`
--

CREATE TABLE `EquipmentAccess` (
  `id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `equipment_id` int DEFAULT NULL,
  `access_level` varchar(50) DEFAULT NULL,
  `access_grant_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Managers`
--

CREATE TABLE `Managers` (
  `id` int NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `registration_date` date DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Materials`
--

CREATE TABLE `Materials` (
  `id` int NOT NULL,
  `material_type` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `package_quantity` decimal(10,2) DEFAULT NULL,
  `unit_measurement` varchar(20) DEFAULT NULL,
  `description` text,
  `image` blob,
  `cost` decimal(12,2) DEFAULT NULL,
  `stock_quantity` decimal(10,2) DEFAULT NULL,
  `min_quantity` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `MaterialStockHistory`
--

CREATE TABLE `MaterialStockHistory` (
  `id` int NOT NULL,
  `material_id` int DEFAULT NULL,
  `change_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `change_type` varchar(50) DEFAULT NULL,
  `quantity_change` decimal(10,2) DEFAULT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Partners`
--

CREATE TABLE `Partners` (
  `id` int NOT NULL,
  `partner_type` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `legal_address` varchar(255) DEFAULT NULL,
  `inn` varchar(12) DEFAULT NULL,
  `director_name` varchar(100) DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `logo` blob,
  `rating` int DEFAULT NULL,
  `sales_location` text,
  `sales_history` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Production`
--

CREATE TABLE `Production` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `production_date` date DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Products`
--

CREATE TABLE `Products` (
  `id` int NOT NULL,
  `article_number` varchar(50) DEFAULT NULL,
  `product_type` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `image` blob,
  `min_price` decimal(12,2) DEFAULT NULL,
  `package_size_length` decimal(10,2) DEFAULT NULL,
  `package_size_width` decimal(10,2) DEFAULT NULL,
  `package_size_height` decimal(10,2) DEFAULT NULL,
  `weight_without_pack` decimal(10,2) DEFAULT NULL,
  `weight_with_pack` decimal(10,2) DEFAULT NULL,
  `quality_certificate` blob,
  `standard_number` varchar(50) DEFAULT NULL,
  `min_price_history` text,
  `manufacturing_time` int DEFAULT NULL,
  `cost_price` decimal(12,2) DEFAULT NULL,
  `workshop_number` int DEFAULT NULL,
  `production_staff_count` int DEFAULT NULL,
  `required_materials` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `QualityControl`
--

CREATE TABLE `QualityControl` (
  `id` int NOT NULL,
  `production_id` int DEFAULT NULL,
  `inspector_id` int DEFAULT NULL,
  `check_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `result` varchar(50) DEFAULT NULL,
  `comments` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Suppliers`
--

CREATE TABLE `Suppliers` (
  `id` int NOT NULL,
  `supplier_type` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `inn` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `SupplyHistory`
--

CREATE TABLE `SupplyHistory` (
  `id` int NOT NULL,
  `supplier_id` int DEFAULT NULL,
  `material_id` int DEFAULT NULL,
  `supply_date` date DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `cost` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `WarehouseMaterials`
--

CREATE TABLE `WarehouseMaterials` (
  `id` int NOT NULL,
  `warehouse_id` int DEFAULT NULL,
  `material_id` int DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Warehouses`
--

CREATE TABLE `Warehouses` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `AccessLogs`
--
ALTER TABLE `AccessLogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Индексы таблицы `ApplicationItems`
--
ALTER TABLE `ApplicationItems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `application_id` (`application_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `Applications`
--
ALTER TABLE `Applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partner_id` (`partner_id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Индексы таблицы `Doors`
--
ALTER TABLE `Doors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `EmployeeMovements`
--
ALTER TABLE `EmployeeMovements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `door_id` (`door_id`);

--
-- Индексы таблицы `Employees`
--
ALTER TABLE `Employees`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Equipment`
--
ALTER TABLE `Equipment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `EquipmentAccess`
--
ALTER TABLE `EquipmentAccess`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `equipment_id` (`equipment_id`);

--
-- Индексы таблицы `Managers`
--
ALTER TABLE `Managers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Materials`
--
ALTER TABLE `Materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Индексы таблицы `MaterialStockHistory`
--
ALTER TABLE `MaterialStockHistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `material_id` (`material_id`);

--
-- Индексы таблицы `Partners`
--
ALTER TABLE `Partners`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Production`
--
ALTER TABLE `Production`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `QualityControl`
--
ALTER TABLE `QualityControl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_id` (`production_id`),
  ADD KEY `inspector_id` (`inspector_id`);

--
-- Индексы таблицы `Suppliers`
--
ALTER TABLE `Suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `SupplyHistory`
--
ALTER TABLE `SupplyHistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `material_id` (`material_id`);

--
-- Индексы таблицы `WarehouseMaterials`
--
ALTER TABLE `WarehouseMaterials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `material_id` (`material_id`);

--
-- Индексы таблицы `Warehouses`
--
ALTER TABLE `Warehouses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `AccessLogs`
--
ALTER TABLE `AccessLogs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ApplicationItems`
--
ALTER TABLE `ApplicationItems`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Applications`
--
ALTER TABLE `Applications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Doors`
--
ALTER TABLE `Doors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `EmployeeMovements`
--
ALTER TABLE `EmployeeMovements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Employees`
--
ALTER TABLE `Employees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Equipment`
--
ALTER TABLE `Equipment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `EquipmentAccess`
--
ALTER TABLE `EquipmentAccess`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Managers`
--
ALTER TABLE `Managers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Materials`
--
ALTER TABLE `Materials`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `MaterialStockHistory`
--
ALTER TABLE `MaterialStockHistory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Partners`
--
ALTER TABLE `Partners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Production`
--
ALTER TABLE `Production`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Products`
--
ALTER TABLE `Products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `QualityControl`
--
ALTER TABLE `QualityControl`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Suppliers`
--
ALTER TABLE `Suppliers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `SupplyHistory`
--
ALTER TABLE `SupplyHistory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `WarehouseMaterials`
--
ALTER TABLE `WarehouseMaterials`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Warehouses`
--
ALTER TABLE `Warehouses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `AccessLogs`
--
ALTER TABLE `AccessLogs`
  ADD CONSTRAINT `accesslogs_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `Employees` (`id`);

--
-- Ограничения внешнего ключа таблицы `ApplicationItems`
--
ALTER TABLE `ApplicationItems`
  ADD CONSTRAINT `applicationitems_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `Applications` (`id`),
  ADD CONSTRAINT `applicationitems_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`);

--
-- Ограничения внешнего ключа таблицы `Applications`
--
ALTER TABLE `Applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`partner_id`) REFERENCES `Partners` (`id`),
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `Managers` (`id`);

--
-- Ограничения внешнего ключа таблицы `EmployeeMovements`
--
ALTER TABLE `EmployeeMovements`
  ADD CONSTRAINT `employeemovements_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `Employees` (`id`),
  ADD CONSTRAINT `employeemovements_ibfk_2` FOREIGN KEY (`door_id`) REFERENCES `Doors` (`id`);

--
-- Ограничения внешнего ключа таблицы `EquipmentAccess`
--
ALTER TABLE `EquipmentAccess`
  ADD CONSTRAINT `equipmentaccess_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `Employees` (`id`),
  ADD CONSTRAINT `equipmentaccess_ibfk_2` FOREIGN KEY (`equipment_id`) REFERENCES `Equipment` (`id`);

--
-- Ограничения внешнего ключа таблицы `Materials`
--
ALTER TABLE `Materials`
  ADD CONSTRAINT `materials_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `Suppliers` (`id`);

--
-- Ограничения внешнего ключа таблицы `MaterialStockHistory`
--
ALTER TABLE `MaterialStockHistory`
  ADD CONSTRAINT `materialstockhistory_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `Materials` (`id`);

--
-- Ограничения внешнего ключа таблицы `Production`
--
ALTER TABLE `Production`
  ADD CONSTRAINT `production_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`);

--
-- Ограничения внешнего ключа таблицы `QualityControl`
--
ALTER TABLE `QualityControl`
  ADD CONSTRAINT `qualitycontrol_ibfk_1` FOREIGN KEY (`production_id`) REFERENCES `Production` (`id`),
  ADD CONSTRAINT `qualitycontrol_ibfk_2` FOREIGN KEY (`inspector_id`) REFERENCES `Employees` (`id`);

--
-- Ограничения внешнего ключа таблицы `SupplyHistory`
--
ALTER TABLE `SupplyHistory`
  ADD CONSTRAINT `supplyhistory_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `Suppliers` (`id`),
  ADD CONSTRAINT `supplyhistory_ibfk_2` FOREIGN KEY (`material_id`) REFERENCES `Materials` (`id`);

--
-- Ограничения внешнего ключа таблицы `WarehouseMaterials`
--
ALTER TABLE `WarehouseMaterials`
  ADD CONSTRAINT `warehousematerials_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `Warehouses` (`id`),
  ADD CONSTRAINT `warehousematerials_ibfk_2` FOREIGN KEY (`material_id`) REFERENCES `Materials` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
