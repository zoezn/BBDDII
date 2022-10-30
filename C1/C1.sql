-- 1 Queremos saber cuales usuarios tienen codigo postal con numero mayor a 100
select idUsuario, nombre from usuario where codigoPostal  > 100;

-- 2 Traer los 10 primeros resultados de la tabla pais donde su nombre tenga como segunda letra una a y 
select * from pais where nombre like '_a%' limit 10;

-- 3 Traer todos los usuarios donde su nombre tenga 5 letras, sin importar el apellido.
select * from usuario where nombre like '_____ %';

-- 4 Traer video con el máximo tamaño
Select idVideo, titulo, max(tamanio) from video;

-- 5 /Queremos saber cuál es el top 5 de los vídeos con mayor cantidad de likes/
SELECT * FROM video ORDER BY cantidadLikes DESC LIMIT 5; 

