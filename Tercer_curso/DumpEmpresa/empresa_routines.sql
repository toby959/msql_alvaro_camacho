CREATE DATABASE  IF NOT EXISTS `empresa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `empresa`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: empresa
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping events for database 'empresa'
--

--
-- Dumping routines for database 'empresa'
--
/*!50003 DROP FUNCTION IF EXISTS `f_aleatorio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_aleatorio`(MIN INT, MAX INT) RETURNS int
BEGIN
DECLARE vresultado INT;
SELECT FLOOR(RAND()*(MAX - MIN+1)) INTO vresultado;

RETURN vresultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_cliente_aleatorio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_cliente_aleatorio`() RETURNS varchar(12) CHARSET utf8mb4
BEGIN
DECLARE vresultado VARCHAR(12);
DECLARE vmax INT;
DECLARE valeatorio INT;
SELECT COUNT(*) INTO vmax FROM clientes;
SET valeatorio = f_aleatorio(1,vmax); 
SET valeatorio = valeatorio-1;
SELECT DNI INTO vresultado FROM clientes LIMIT valeatorio,1;
RETURN vresultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_cliente_aleatorio2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_cliente_aleatorio2`() RETURNS varchar(12) CHARSET utf8mb4
BEGIN
 DECLARE vresultado VARCHAR(12);
    DECLARE vmax INT;
    DECLARE valeatorio INT;

    -- Obtener el número total de clientes
    SELECT COUNT(*) INTO vmax FROM clientes;

    -- Verificar si hay clientes en la tabla
    IF vmax = 0 THEN
        RETURN "Reload"; -- No hay clientes
    END IF;

    -- Generar un número aleatorio entre 0 y vmax -1
    SET valeatorio = f_aleatorio(0, vmax -1);
 -- Seleccionar el DNI del cliente aleatoriamente seleccionado
    SELECT DNI INTO vresultado FROM clientes LIMIT valeatorio, 1;

    -- Verificar si se obtuvo un resultado
    IF vresultado IS NULL THEN
        RETURN NULL; -- No se encontró un DNI, aunque esto no debería suceder
    END IF;

    RETURN vresultado;
    -- Ajustar el índice para usarlo en LIMIT (base cero)
  --  SET valeatorio = valeatorio - 1;

    -- Verificar que el índice sea válido antes de usarlo en LIMIT
   -- IF valeatorio < 0 OR valeatorio >= vmax THEN
   --     RETURN "Reload"; -- Índice inválido
   -- END IF;

    -- Seleccionar el DNI del cliente aleatoriamente seleccionado
--    SELECT DNI INTO vresultado FROM clientes LIMIT valeatorio, 1;

  --  RETURN vresultado;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_cliente_aleatorio3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_cliente_aleatorio3`() RETURNS varchar(12) CHARSET utf8mb4
BEGIN
 DECLARE vresultado VARCHAR(12);
    DECLARE vmax INT;
    DECLARE valeatorio INT;

    -- Obtener el número total de clientes
    SELECT COUNT(*) INTO vmax FROM clientes;

    -- Verificar si hay clientes en la tabla
    IF vmax = 0 THEN
        RETURN "Reload"; -- No hay clientes
    END IF;

    -- Generar un número aleatorio entre 0 y vmax -1
    SET valeatorio = f_aleatorio(0, vmax -1);
 -- Seleccionar el DNI del cliente aleatoriamente seleccionado
    SELECT DNI INTO vresultado FROM clientes LIMIT valeatorio, 1;

    -- Verificar si se obtuvo un resultado
    IF vresultado IS NULL THEN
        RETURN "Reload"; -- No se encontró un DNI, aunque esto no debería suceder
    END IF;

    RETURN vresultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_producto_aleatorio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_producto_aleatorio`() RETURNS varchar(50) CHARSET utf8mb4
BEGIN
DECLARE vresultado VARCHAR(50);
    DECLARE vmax INT;
    DECLARE valeatorio INT;

    -- Obtener el número total de clientes
    SELECT COUNT(*) INTO vmax FROM productos;

    -- Verificar si hay clientes en la tabla
    IF vmax = 0 THEN
        RETURN "Recalculando"; -- No hay clientes
    END IF;

    -- Generar un número aleatorio entre 0 y vmax-1
    SET valeatorio = f_aleatorio(0, vmax - 1);

    -- Seleccionar el DNI del cliente aleatoriamente seleccionado
  -- 2  SELECT CONCAT(CODIGO, ', ', DESCRIPCION, ', ', SABOR) INTO vresultado FROM productos LIMIT valeatorio, 1;
    SELECT CODIGO INTO vresultado FROM productos LIMIT valeatorio, 1;
    -- Verificar si se obtuvo un resultado
    IF vresultado IS NULL THEN
        RETURN "Recalculando"; -- No se encontró un DNI, aunque esto no debería suceder
    END IF;

    RETURN vresultado;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_vendedor_aleatorio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_vendedor_aleatorio`() RETURNS varchar(100) CHARSET utf8mb4
BEGIN
DECLARE vresultado VARCHAR(100);
    DECLARE vmax INT;
    DECLARE valeatorio INT;

    -- Obtener el número total de productos
    SELECT COUNT(*) INTO vmax FROM vendedores;

    -- Verificar si hay productos en la tabla
    IF vmax = 0 THEN
        RETURN "Pensando"; 
    END IF;

    -- Generar un número aleatorio entre 0 y vmax-1
    SET valeatorio = f_aleatorio(0, vmax - 1);

    -- Seleccionar CODIGO, DESCRIPCION y SABOR del producto aleatoriamente seleccionado
-- 2    SELECT CONCAT(MATRICULA, ', ', NOMBRE, ', ', FORMAT(COMISION,2)) INTO vresultado 
    SELECT MATRICULA INTO vresultado 
    FROM vendedores LIMIT valeatorio, 1;

    -- Verificar si se obtuvo un resultado
    IF vresultado IS NULL THEN
        RETURN "Pensando"; 
    END IF;

    RETURN vresultado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_triggers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_triggers`()
BEGIN

  DELETE FROM facturacion;
  INSERT INTO facturacion
  SELECT A.FECHA, SUM(B.CANTIDAD * B.PRECIO) AS VENTA_TOTAL
  FROM facturas A
  INNER JOIN
  items B
  ON A.NUMERO = B.NUMERO
  GROUP BY A.FECHA;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_venta`(fecha DATE, maxitems INT, maxcantidad INT)
BEGIN

DECLARE vcliente VARCHAR(11);
DECLARE vproducto VARCHAR(10);
DECLARE vvendedor VARCHAR(50); 
DECLARE vcantidad INT;
DECLARE vprecio FLOAT; 
DECLARE vitems INT;
DECLARE vnfactura INT; 
DECLARE vcontador INT DEFAULT 1;
DECLARE vnumitems INT;
-- Obtener el siguiente número de factura
SELECT MAX(NUMERO) + 1 INTO vnfactura FROM facturas;
-- 2 SELECT COALESCE(MAX(NUMERO), 0) + 1 INTO vnfactura FROM facturas;
  -- Obtener un cliente aleatorio
SET vcliente = f_cliente_aleatorio3();
SET vvendedor = f_vendedor_aleatorio();
-- 2 IF vcliente IS NULL THEN
-- 2        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo obtener un cliente aleatorio';
-- 2    END IF;
-- Obtener un vendedor aleatorio    
-- 2 SET vvendedor = f_vendedor_aleatorio();  
-- 2 IF vvendedor IS NULL THEN
-- 2         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo obtener un vendedor aleatorio';
-- 2    END IF;
 -- Insertar en la tabla de facturas    
-- INSERT INTO facturas(NUMERO, FECHA, DNI, MATRICULA, IMPUESTO) 
-- VALUES(vnfactura, fecha, vcliente, vvendedor, 0.15);
 INSERT INTO facturas(NUMERO, FECHA, DNI, MATRICULA, IMPUESTO) 
 VALUES(vnfactura, fecha, vcliente, vvendedor, 0.16);
-- Generar un número aleatorio de items a insertar
SET vitems = f_aleatorio(1, maxitems);
-- Bucle para insertar los items
while vcontador <= vitems
DO
SET vproducto = f_producto_aleatorio();
-- impedir duplicados en ventas
SELECT COUNT(*) INTO vnumitems FROM items
WHERE CODIGO = vproducto AND NUMERO = vnfactura;
IF vnumitems = 0 THEN 
-- 2 IF vvendedor IS NULL THEN
-- 2        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo obtener un vendedor aleatorio';
-- 2   END IF;
  
SET vcantidad = f_aleatorio(1, maxcantidad);
  -- Obtener el precio del producto
SELECT PRECIO INTO vprecio FROM productos WHERE CODIGO = vproducto; 
-- 2  IF vprecio IS NULL THEN
-- 2            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Precio no encontrado para el producto';
-- 2        END IF;
 -- Insertar en la tabla de items        
INSERT INTO items(NUMERO, CODIGO, CANTIDAD, PRECIO) 
VALUES(vnfactura, vproducto, vcantidad, vprecio);
END IF;
SET vcontador = vcontador+1;  
END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-03 21:50:28
