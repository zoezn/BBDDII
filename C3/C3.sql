-- 1.  Listar todos los países que contengan la letra A, 
-- ordenada alfabéticamente
select nombre from pais  where nombre like '%a%'order by nombre;

 -- 2. Generar un listado de los usuarios, con el detalle de todos sus datos, 
 -- el avatar que poseen y a qué país pertenecen
 select usuario.*, avatar.urlimagen, pais.nombre from usuario, avatar, pais;
 
 -- 3. Confeccionar un listado con los usuarios que tienen playlists, 
 -- mostrando la cantidad que poseen
 
 select Usuario_idUsuario, count(idPlaylist) as total from playlist group by Usuario_idUsuario;

-- 4. Mostrar todos los canales creados entre el 01/04/2021 y el 01/06/2021.

select * from canal where DATE(fechaCreacion) between "2021-04-01" and "2021-06-01";

-- 7. Insertar un nuevo avatar y asignarlo a un usuario.

insert into avatar(nombre, urlimagen) values("Gato Miau", "https://www.humanesociety.org/sites/default/files/styles/1240x698/public/2018/06/cat-217679.jpg?h=c4ed616d&itok=3qHaqQ56");
select * from avatar;
select * from usuario;

-- 8. Generar un informe estilo ranking de avatares utilizados por país.

select p.idPais,p.nombre, a.nombre, a.urlimagen from usuario u 
inner join pais p on p.idPais = u.Pais_idPais
inner join avatar a on a.idAvatar = u.Avatar_idAvatar
group by p.idPais;

select p.idPais,p.nombre, a.nombre, a.urlimagen from usuario u 
inner join pais p on p.idPais = u.Pais_idPais
inner join avatar a on a.idAvatar = u.Avatar_idAvatar
;

-- 9. Insertar un usuario con los siguientes datos:
/* a. Nombre: Roberto Rodriguez
b. E-mail: rrodriguez@dhtube.com
c. Password: rr1254
d. Fecha de nacimiento: 01 de noviembre de 1975
e. Código postal: 1429
f. País: Argentina
g. Avatar: carita feliz */

insert into usuario(nombre, email,password, fechaNacimiento, codigoPostal, Pais_idPais, Avatar_idAvatar) values("Roberto Rodriguez","rrodriguez@dhtube.com","rr1254", "1975-11-01" ,1429, (SELECT idPais from pais WHERE nombre='Argentina'),(SELECT idAvatar from avatar WHERE nombre='carita feliz'));

-- 10. Generar un reporte de todos los videos y sus etiquetas, pero solo de aquellos cuyos nombres de la etiqueta contengan menos de 10 caracteres, ordenado
-- ascendentemente por la cantidad de caracteres que posea la etiqueta.
 
 select * from video, video_etiqueta where CHARACTER_LENGTH(video.titulo)<10 order by CHARACTER_LENGTH(video.titulo);


