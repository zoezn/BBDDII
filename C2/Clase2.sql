-- <<  WHERE  >>

-- 1. Mostrar las personas cuya segunda letra de su apellido sea una “a”.
select * from contact where LastName like "_a%";

-- 2. Mostrar el nombre concatenado con el apellido de las personas que tengan como “Title” los valores “Mr.” y “Ms.”
select CONCAT( FirstName, " ", LastName) as "Nombre completo" from contact where (Title = "Ms.") or (Title = "Mr.");

-- 3. Mostrar los nombres de los productos cuyo número de producto comiencen con “AR” o “BE” o “DC”.
select * from Product where ProductNumber like "AR%" or ProductNumber like "BE%" or ProductNumber like "DC%";

-- 4. Mostrar las personas cuyos nombres tengan una C como primer caracter y que el segundo caracter no sea ni “O”, ni “E”.
select * from Contact where FirstName like "C%" and FirstName not like "_O%" and FirstName not like "_E%" ;

-- 5. Mostrar todos los productos cuyo precio de lista esté entre 400 y 500.
select * from Product where ListPrice between 400 and 500;

-- 6. Mostrar todos los empleados que nacieron entre 1960 y 1980 y cuyos años de nacimiento sean pares.
select BirthDate, YEAR(BirthDate) "y" from Employee where YEAR(BirthDate) between 1960 and 1980;


-- <<  HAVING  >>

-- 1. Mostrar las subcategorías de los productos que tienen dos o más productos que cuestan menos de $200.
-- Tablas: Product
-- Campos: ProductSubcategoryID, ListPrice

select ProductSubcategoryID, ListPrice from Product having ListPrice < 200;

-- 2. Mostrar todos los códigos de subcategorías existentes junto con la cantidad para los productos 
-- cuyo precio de lista sea mayor a $100 y el precio promedio sea menor a $300.
-- Tablas: Product
-- Campos: ProductSubcategoryID, ListPrice

select ProductSubcategoryID, ListPrice, avg(ListPrice) as Promedio, count(ProductID) as Cantidad from product where ListPrice > 100 group by ProductSubcategoryID having Promedio < 300;


-- <<  OPERADORES Y JOINS  >>

-- Mostrar el código, fecha de ingreso y horas de vacaciones de los empleados que ingresaron a partir del año 2000.

select EmployeeID, HireDate, VacationHours 
from employee
where HireDate > "2000-01-01";

-- 2. Mostrar el nombre, número de producto, precio de lista y el precio de lista incrementado en un 10% de los productos cuya fecha de fin de venta sea anterior al
-- día de hoy

select Name, ProductNumber, ListPrice, round(ListPrice*1.1,2) as incremento , SellEndDate 
from product
where SellEndDate < "2022-10-19" ;




