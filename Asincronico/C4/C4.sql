/*
Functions: Canciones
Tabla: Canciones
1. Crear una función que solicite como parámetros de entrada los milisegundos de la tabla de canciones, y que devuelva como resultado esa misma información, 
pero con el formato de hora, minutos y segundos —sin milisegundos—. En el caso de que el parámetro de ciudad esté vacío, se debe devolver 00:00:00.
2. Invocar la función para obtener la información de todas las canciones del género rock, utilizando la función para mostrar la duración de las mismas.
*/

/*
CREATE FUNCTION `reformatearDuracion`(milisegundos int) RETURNS time
    DETERMINISTIC
BEGIN
	DECLARE segundos double;
	DECLARE duracionNueva time;
    SET segundos = milisegundos/1000;
    SET duracionNueva = SEC_TO_TIME(segundos);
    RETURN duracionNueva;
END
*/

-- 2.
SELECT c.nombre, c.compositor,g.nombre, c.milisegundos, reformatearDuracion(milisegundos) "funcion" from Canciones c 
inner join generos g on c.id_genero = g.id where g.nombre LIKE "Rock";

/*
SP: Clientes y facturas 
Tabla: Clientes 
1. Crear una función que reciba como parámetro el id de un cliente y devuelva la cantidad de facturas que posee el mismo.
2. Invocar la función para obtener todos los clientes y su cantidad de facturas, utilizando la función creada anteriormente.
*/

CALL cantidad_facturas(1);
select * from facturas;

select * from facturas f group by f.id_cliente;

select id_cliente, count(id) from facturas group by id_cliente;






