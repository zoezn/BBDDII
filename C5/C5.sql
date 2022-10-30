/*
Tabla: empleados
1. Queremos agregar un nuevo atributo a la tabla de empleados llamado Edad. Una vez que
hayamos hecho el cambio en la estructura de la tabla, debemos rellenar la información para
cada uno de los empleados. 
Para ello, vamos a crear una función que se llame edad(),
donde recibe por parámetro una fecha de nacimiento determinada y calcula la edad. 
Por último, para actualizar los datos físicamente en nuestra tabla, vamos a generar un stored
procedure que se llame actualizar_edad() donde vamos a actualizar la edad de todos los
empleados. Esta nos servirá para ejecutarla una vez al año y actualizar las edades de todos
los empleados nuevamente. */

alter table empleados add edad tinyint;


/* 
CREATE DEFINER=`root`@`localhost` FUNCTION `edad`(pi_date date) RETURNS tinyint
    DETERMINISTIC
BEGIN 
DECLARE result TINYINT;
DECLARE birthDate DATE;
SET birthDate = DATE(pi_date);
SET result = (SELECT TIMESTAMPDIFF(YEAR,birthDate,CURDATE()));

RETURN result;
END
*/

/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_edad`()
BEGIN
	update empleados 
    set edad = edad(empleados.fecha_nacimiento);
END
*/

call actualizar_edad();



