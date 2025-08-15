Use NORTHWND;
GO

SELECT * 
From Categories;

SELECT *
FROM Products;

SELECT *
FROM Suppliers;

SELECT *
FROM Customers;

SELECT *
FROM Employees;

SELECT *
FROM Shippers;

SELECT *
FROM Orders;

SELECT *
FROM [Order Details];

----proyeccion

SELECT CustomerID,CompanyName,City
FROM Customers;

---ALIAS DE COLUMNAS

SELECT CustomerID AS 'Numero Empleado'
	CompanyName AS Empresa,
	City AS CIUDAD,
	ContactName AS 


FROM Customers


--ALIAS TABLAS
SELECT Customers.CustomerID AS [Numero Cliente],
	Customers.CompanyName AS [Empresa],
	Customers.ContactName AS [Nombre del Contacto]
FROM Customers;


SELECT C.CustomerID AS [Numero Cliente],
	C.CompanyName AS [Empresa],
	C.ContactName AS [Nombre del Contacto]
FROM Customers AS C;


SELECT C.CustomerID AS [Numero Cliente],
	C.CompanyName AS [Empresa],
	C.ContactName AS [Nombre del Contacto]
FROM Customers C;

--campo calculado  
SELECT *,(UnitPrice*Quantity)AS [Total]
FROM [Order Details];

SELECT od.UnitPrice AS [Numero de Orden],
	od.ProductID AS [Numero Porducto],
	od.UnitPrice AS [Precio],
	od.Quantity AS [Cantidad],
	(UnitPrice *Quantity) AS [Total]
FROM [Order Details] AS  od;


--Selecionar todos los productios que 
--pertenezcan a la categoria 1



--Seleccionar todo

SELECT PR
FROM Products AS P


--SELECCIONAR TODOS LOS PRODUCTOS QUE SU PRECIO SEA MAYOR A 40.3

SELECT P.ProductID AS [ID DE PRODUCTO],
	P.ProductName AS [Nombre],
	P.UnitPrice AS [precio]


FROM Products AS P
WHERE p.UnitPrice 


--seleccionar todos los productos donde la categoria id sea diferente

SELECT P.ProductID AS [ID DE PRODUCTO],
	P.ProductName AS [Nombre],
	P.UnitPrice AS [precio],
	P.CategoryID AS [Categoria]


FROM Products AS P
WHERE P.CategoryID ! 3;

--Selecionar todas las ordenes que sean de brazil - rio de janerio, mostrando 
---solo el numero de roden, la fecha de orden 
---pais de envio, la ciudad y su transportida

SELECT o.OrderID AS [Numero Orden],
	o.OrderDate AS [Fecha de orden],
	o.ShipCity AS [ciudad],
	o.ShipCountry AS [Pais],
	o.ShipVia AS [Transportista]

FROM Orders AS o
WHERE o.ShipCity = 'Rio de Janeiro'



SELECT o.OrderID AS [Numero Orden],
	o.OrderDate AS [Fecha de orden],
	o.ShipCity AS [ciudad],
	o.ShipCountry AS [Pais],
	o.ShipVia AS [Transportista]

FROM Orders AS o
WHERE o.ShipRegion is not null;


--selecionar todas las ordenes enviadas a brazil, alemania y mexico

SELECT o.OrderID AS [Numero Orden],
	o.OrderDate AS [Fecha de orden],
	o.ShipCity AS [ciudad],
	o.ShipCountry AS [Pais],
	o.ShipVia AS [Transportista],
	o.ShipRegion AS [Region]

FROM Orders AS o
WHERE (o.ShipCountry = 'Brazil'
	or o.ShipCountry='Germany'
	or o.ShipCountry= 'Mexico')
	and o.ShipRegion is not null
ORDER BY [Pais] ASC, o.ShipCity DESC; 


SELECT * 
FROM Orders;

--Selecionar todas las ordenes de francias ,alemania y argentina

SELECT *



FROM Orders
WHERE ShipCountry in ('Germany','France', 'Argentina')

--Selecionar todos los producto descontinuados o con el precio mayor de 50 y ordenado por el precio 

Select P.Discontinued AS [Descontinuado],
		P.UnitPrice AS [Precio]
FROM Products AS P
WHERE P.Discontinued =1 or p.UnitPrice	>50
ORDER BY P.UnitPrice DESC;

-- Seleccionar los empleados que fueron contratados despues de 1994,
 --Nombre completo y fecha de contratacion

 Select e.FirstName, e.LastName, e.HireDate
 From Employees AS e
 Where e.HireDate>1994;

 Select (FirstName + ''+  LastName) AS [Nombre Completo], 
 HireDate As [Fecha de contratacion]
 FROM Employees
 Where HireDate>'1994-12-31';

  Select Concat(FirstName , ' ' ,  LastName) AS [Nombre Completo], 
 HireDate As [Fecha de contratacion], YEAR(HireDate) AS [Año de contratacion],
 MONTH(HireDate) As [Mes de contratacion], Day(HireDate) As [Dia de contratacion]
 FROM Employees
 Where YEAR(HireDate)> 1993


 --Mostrar los empleados que fueron contratados en abril

  Select Concat(FirstName , ' ' ,  LastName) AS [Nombre Completo], 
 HireDate As [Fecha de contratacion], DATEPART(YEAR,HireDate) AS [Año de contratacion],
 DATEPART(mm,HireDate) As [Mes de contratacion], DATEPART(d,HireDate) As [Dia de contratacion],
 DatePART(quarter,HireDate) As [Trimestre], DATENAME(weekday,HireDate) AS [Dia],
 DATENAME(month,HireDate) AS [MES]
 FROM Employees
 Where Month(HireDate) = 4

 SELECT DATENAME(year, '12:10:30.123')  
    ,DATENAME(month, '12:10:30.123')  
    ,DATENAME(day, '12:10:30.123')  
    ,DATENAME(dayofyear, '12:10:30.123')  
    ,DATENAME(weekday, '12:10:30.123');
 --Seleccionar los productos que no estan descontinuados, mostrando
 --Solamente el nombre del producto y el campo de descontinuado

 SELECT P.ProductName AS [Nombre del producto] ,Discontinued AS [Desconinuado]
 FROM Products AS P
 WHERE P.Discontinued =0;

 -- Selecionar los proveedores que no son de USA
 SELECT CompanyName AS [Empresa], ContactName AS [Contacto]
 FROM Suppliers
 WHERE Country <> 'USA';

´-- Seleccionar los productos caros y con bajo stock, con precios mayores a 50 y stock menor a 20

SELECT ProductName AS [Nombre del producto], Suppliers.SupplierID AS [Proveedor],
Suppliers.CompanyName AS [Nombre Proveedor],
UnitsInStock AS [Existencia], UnitPrice AS [Precio Unitario]
FROM Products , Suppliers
WHERE (Products.SupplierID = Suppliers.SupplierID) AND
(UnitPrice>50 and UnitsInStock<20);

SELECT ProductName AS [Nombre del producto], s.SupplierID AS [Proveedor],
s.CompanyName AS [Nombre Proveedor],
UnitsInStock AS [Existencia], p.UnitPrice AS [Precio Unitario]
FROM Products AS p, Suppliers AS s
WHERE (P.SupplierID = s.SupplierID) AND
(UnitPrice>50 and UnitsInStock<20);

SELECT ProductName AS [Nombre del producto], s.SupplierID AS [Proveedor],
s.CompanyName AS [Nombre Proveedor],
UnitsInStock AS [Existencia], p.UnitPrice AS [Precio Unitario]
FROM Products AS p
INNER JOIN
Suppliers AS s
ON p.SupplierID = s.SupplierID
WHERE (P.SupplierID = s.SupplierID) AND
(UnitPrice>50 and UnitsInStock<20);

-- Clientes de Mexico y españa

SELECT c.CompanyName AS [Cliente],
		c.City AS [Ciudad],
		c.Country AS [Pais],
		c.Region As [Region]
FROM Customers As c
WHERE (country = 'Mexico' OR Country= 'Spain') AND
(Region is null)

--Productos que no estan descontinuados y tienen inventario

SELECT p.ProductName AS [Nombre del producto], p.UnitsInStock AS [Existencia],
		p.UnitPrice AS [Precio], Discontinued,
		(p.UnitPrice*p.UnitsInStock) AS [Precio Inventario]
FROM Products As p
WHERE p.Discontinued =1 And p.UnitsInStock>0

--Productos que no son de EU y Reino Unido

SELECT S.CompanyName As [Nombre de la empresa], S.City AS [Ciudad],
S.Country AS [Pais]
FROM Suppliers AS S
WHERE NOT(S.Country = 'USA' or s.Country = 'UK')


SELECT S.CompanyName As [Nombre de la empresa], S.City AS [Ciudad],
S.Country AS [Pais]
FROM Suppliers AS S
WHERE NOT(S.Country <> 'USA' and s.Country <> 'UK')

-- ORDEN BY

--Seleccionar todos los proveedores mostrando el nombre del proveedor el pais y la ciudad Ordenada por Pais 
--de mayor a menor y dentro del pais por ciudad de menor a mayor 

SELECT S.CompanyName As [Empresa], S.Country As [Pais], S.City AS [Ciudad]
FROM Suppliers AS S
ORDER BY Country ASC;

SELECT S.CompanyName As [Empresa], S.Country As [Pais], S.City AS [Ciudad]
FROM Suppliers AS S
ORDER BY Country DESC

SELECT S.CompanyName As [Empresa], S.Country As [Pais], S.City AS [Ciudad]
FROM Suppliers AS S
ORDER BY Country DESC, City DESC;

SELECT GETDATE()

SELECT DATEPART (year,'2025-07-23')
SELECT DATEPART (year,getdate())
SELECT DATEPART (yy,getdate())
SELECT DATEPART (yyyy,getdate())
SELECT DATEPART (q,getdate())

----Seleccionar todas aquellas ordenes que se realizae en 1998
SELECT OrderID,OrderDate,ShipCity,ShipCountry
FROM Orders
WHERE DATEPART(YY,OrderDate)=1998; 

----Seleccionar todas las ordenes que se encuentran o que se hicieron en el tercer trimestre
SELECT OrderID,OrderDate,ShipCity,ShipCountry
FROM Orders
WHERE DATEPART(q,OrderDate)=3; 



---Seleccionar los paises de nuestros clientas
SELECT DISTINCT Country,City
FROM Customers
ORDER BY Country;

---Seleccionar todos los paises y ciudades unicas de los proveedores

SELECT DISTINCT Country, City
FROM Suppliers;


----Mostrar las fechas distintas de compras
Select DISTINCT OrderDate
FROM Orders;

--Mostrar las categorias distintas de los productos

SELECT DISTINCT CategoryID
FROM Products;

--Seleccionar todas las ordenes con mas 30
SELECT *
FROM Products
WHERE UnitPrice*1.20;



