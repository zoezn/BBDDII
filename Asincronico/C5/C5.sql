/* Tabla: canciones y facturas
1. Listar todas las canciones con sus datos, pero el campo compositor debe mostrarse en mayúscula y los que tienen más de 1, cambiar la ',' por ';'. Además, deben agregar una nueva columna donde se muestre el nombre alternativo de la canción —el nombre que se encuentra entre paréntesis dentro del campo nombre—. Para los casos donde no tenga nombre alternativo, mostrar NULL.
*/

select id,nombre,id_album,id_tipo_de_medio,id_genero, REPLACE(UPPER(compositor),',',';') as compositor,milisegundos,precio_unitario,
CASE 
WHEN LOCATE('(',nombre) != 0
THEN SUBSTR(nombre,LOCATE('(',nombre))
ELSE null
END
AS 'nombre alternativo'
from canciones;

/*

2. Listar todas las facturas mostrando el total de la factura, con 1 solo decimal. Para ello debemos utilizar la función ROUND y TRUNCATE y filtrar el listado cuando el resultado de las 2 funciones sea el mismo. Ejemplo: Una factura con total de 5.94 es válida, ya que usando las 2 funciones el resultado es 5.9; en cambio, una factura con total de 5.98 no coincidían los resultados de las funciones. */

select * from facturas;
-- select ROUND(total,1), truncate(total,1),
select id,id_cliente,fecha_factura,direccion_de_facturacion,ciudad_de_facturacion,estado_o_provincia_de_facturacion,pais_de_facturacion,codigo_postal_de_facturacion,ROUND(total,1) as total from facturas where ROUND(total,1) = truncate(total,1);


/*
3. Debemos averiguar si en nuestra base de datos tenemos facturas que hayan sido facturadas en un año bisiesto. Pista: podemos utilizar las funciones DAY y LAST_DAY.

4. Para realizar un sorteo de navidad, debemos separar a los empleados en 4 grupos para repartir las tareas. Listar los empleados con su nuevo número de grupo utilizando la función NTILE.

5. Generar la siguiente tabla corriendo el script que vemos más abajo. Una vez hecho esto, insertar el nuevo tipo de empleado “Gerente”. Ahora debemos averiguar el id del mismo, utilizando la función LAST_INSERT_ID. ¿Se podría averiguar de otra forma? ¿Cuál?

CREATE TABLE `musimundos`.`tipo_empleado` (
  `id_tipo_empleado` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(20) NULL,
  PRIMARY KEY (`id_tipo_empleado`));
