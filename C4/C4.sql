/* 1) Empleados
a) Crear un SP que liste los apellidos, nombres y edad de los empleados ordenados
alfabéticamente.
Tip: Para la edad, crear una función que tenga como parámetro de entrada la fecha de
nacimiento y devuelva la edad.
b) Invocar el SP para verificar el resultado. */

-- F --
/* CREATE DEFINER=`root`@`localhost` FUNCTION `udf_Age_Get`(pi_date date) RETURNS tinyint
    DETERMINISTIC
BEGIN 
DECLARE result TINYINT;
DECLARE birthDate DATE;
SET birthDate = DATE(pi_date);
SET result = (SELECT TIMESTAMPDIFF(YEAR,birthDate,CURDATE()));

RETURN result;
END */

-- SP --
/* CREATE DEFINER=`root`@`localhost` PROCEDURE `nombre_completo_edad`()
BEGIN 
SELECT 
concat(e.Nombre, " ", e.Apellido) as 'Nombre completo'
    , udf_Age_Get(e.FechaNacimiento) as 'Edad'
FROM  empleados e 
order by 'Nombre completo';
END */

Call nombre_completo_edad();


