/*Tabla: facturas y clientes
1. Vamos a crear un store procedure llamado facturacion_cliente() que dadas 2 fechas
como parámetros de entrada, nos devuelva los datos de todos los clientes y un campo donde
mostremos el monto total de facturas creadas entre las fechas recibidas por parámetro para
cada cliente. Recordemos que puede haber más de 1 factura por cliente. Para realizar ese
cálculo, vamos a crear una función llamada facturas_por_cliente() donde le vamos a pasar
como parámetro el id del cliente, las fechas desde y hasta y nos va a devolver la suma total
de las facturas por cada uno de ellos. Por último, si este campo nos devuelve null o 0
debemos mostrar la palabra ‘Sin Datos’ en ese cálculo. Ejecutar el store para las fechas
'2010-02-01' hasta '2010-02-11' y luego para '2010-02-01' hasta '2010-02-12'.*/

-- Funcion
/* CREATE DEFINER=`root`@`localhost` FUNCTION `facturas_por_cliente`(idP TINYINT, fechaInicial DATE, fechaFinal DATE) RETURNS double
    DETERMINISTIC
BEGIN
DECLARE totalF DOUBLE default 0.0;
SET totalF = (select sum(total) from facturas where id_cliente like idP AND fecha_factura BETWEEN fechaInicial AND fechaFinal);
RETURN totalF;
END */
-- Stored Procedure
/* CREATE DEFINER=`root`@`localhost` PROCEDURE `facturacion_cliente`(fechaInicial DATE, fechaFinal DATE)
BEGIN

select c.*, 
CASE
WHEN facturas_por_cliente(c.id, fechaInicial, fechaFinal) != 0.0
THEN facturas_por_cliente(c.id, fechaInicial, fechaFinal) 
ELSE "Sin Datos"
END 
AS 'total facturas'
from clientes c;

END */

call facturacion_cliente("2010-02-01", "2010-02-11");
call facturacion_cliente("2010-02-01", "2010-02-12");

/*
2. Vamos a generar un SP llamado calcular_impuesto(), donde vamos a pasarle un primer
parámetro de un valor de un producto y, como segundo parámetro, el impuesto que vamos a
calcularle a dicho valor. 
Una vez que realizamos el cálculo del impuesto, vamos a devolver en
el primer parámetro que teníamos, el valor del nuevo precio del producto con el impuesto
agregado. 
Probar el SSP con los siguientes valores: para el importe vamos a poner el valor
de 5000 y para el impuesto, vamos a ingresar el 21.*/

-- Stored Procedure
/* CREATE DEFINER=`root`@`localhost` PROCEDURE `calcular_impuesto`(INOUT valorProd FLOAT, impuesto INT)
BEGIN
set valorProd = valorProd + ((valorProd * impuesto) / 100);
END */

set @valorProd = 5000.0;
call calcular_impuesto(@valorProd,21);
select @valorProd;




