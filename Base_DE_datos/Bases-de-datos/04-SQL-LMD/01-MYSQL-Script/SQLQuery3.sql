select*
from Pedidos;


SELECT P.Num_Pedido,P.Importe,C.Empresa, C.Empresa
FROM Pedidos AS P
INNER JOIN 
Clientes AS C
ON C.Num_Cli=P.Cliente
ORDER BY Importe DESC


SELECT P.Num_Pedido,P.Importe,C.Empresa, C.Empresa
FROM Pedidos AS P
INNER JOIN 
Clientes AS C
ON C.Num_Cli=P.Cliente
WHERE Limite_Credito BETWEEN 25000 AND 50000
AND Empresa LIKE 'J%'
ORDER BY Importe DESC

---Selecionar los productos incluyendo su categoria y el proveedor 
--que lo surte

SELECT ProductID, ProductName,UnitPrice,UnitsInStock,CategoryID,SupplierID
FROM Products;


SELECT ProductID AS [Numero producto],
	ProductName AS[Nombre de producto] ,
	UnitPrice AS [Precio],
	UnitsInStock AS [Existencias],
	CategoryID AS [Categoria],
	SupplierID AS [Proveedor]
FROM Products;


SELECT*
FROM Products AS P
JOIN Categories AS C
ON P.CategoryID = C.CategoryID;

SELECT P.ProductID AS [Numero producto],
	P.ProductName AS [Nombre de producto],
	P.UnitPrice AS [Precio],
	P.UnitsInStock AS [Existencias],
	C.CategoryName AS [Categoria],
	su.CompanyName AS [Proveedor]
FROM Products AS P
JOIN Categories AS C
ON P.CategoryID = C.CategoryID
JOIN Suppliers AS su
ON P.SupplierID = su.SupplierID;

SELECT*
FROM Categories


---Listar las oficinas y los nombres y puestos de sus jefes

SELECT r.Nombre,o.Oficina, r.Puesto
FROM  Oficinas AS o
JOIN Representantes AS r
ON r.Num_Empl= o.Jef;


SELECT r.Nombre,o.Oficina, r.Puesto,o.Objetivo
FROM  Oficinas AS o
JOIN Representantes AS r
ON r.Num_Empl= o.Jef;
WHERE o.objetivo >60000;

--Lista todos los pedidos, mostrando el numero de pedido, el importe y la descripcion de los productos
SELECT p.Num_Pedido AS [Numero de pedido],
	p.Importe AS [Totla],
	pr.Descripcion AS [Nombre producto]
FROM Pedidos AS p
JOIN Productos AS pr
ON pr.Id_fab = p.Fab AND pr.Id_producto=p.Producto;
----Listar los pedidos superiores a 25000,incluyendi el numero de
----pedido,importe, el nombre del representante que tomo la nota del pedido y el nombre del clienbte
SELECT pe.Num_Pedido AS [Numero de pedido],
	pe.Importe AS [Total],
	pe.Importe
FROM Pedidos AS pe
JOIN Clientes AS cli
ON pe.Cliente= cli.Num_Cli
JOIN Representantes AS rp
ON rp.Num_Empl = pe.Rep;
WHERE pe




---Listar los pedidos superriores a 2500, mostrando el numero de pedido
---el nombre del cliente que lo encargi, el represendate del cliente y
---la oficina en la que trabajan el represente



-----listar los nombre de los empleados y sus jefes
SELECT sub.Nombre AS [Empleado],
	jefe.Nombre AS [Jefe]
FROM Representantes as jefe
JOIN Representantes as sub
On

SELECT Nombre AS [Empleado], Jefe
FROM Representantes;

USE BDEJEMPLO2;

--CALCULÑAR EL RENDIMIENTO EN  VENTAS DE LOS REPRESENTANTES 
SELECT 100*(VENTAS/CUOTA) AS [Rendimiento de ventas]
FROM Representantes
WHERE 100 *(VENTAS/CUOTA) IS NOT NULL;
--CALCULAR EL RENDIMINTO MEDIO EN VENTAS
SELECT AVG(100*(VENTAS/CUOTA)) AS [Rendimiento de ventas]
FROM Representantes
WHERE 100 *(VENTAS/CUOTA) IS NOT NULL;

--CUALES SON LAS COUTAS Y VENTAS TOTALES DE TODOS LOS 
SELECT SUM(Cuota), SUM(Ventas)
FROM Representantes;

--CUAL ES EL IMPORTE TOTAL DE PEDIDOS DE BRUNO ARTEAGA
SELECT sum(p.importe)
FROM Representantes AS r
JOIN Pedidos as p
on r.Num_Empl=p.Rep
WHERE r.Nombre='Bruno Arteaga';

--cuantos representantes exceden su cuota (count)
SELECT COUNT(*),COUNT(cuota)
FROM Representantes
WHERE Ventas>cuota;

SELECT COUNT(*),COUNT(cuota)
FROM Representantes
WHERE Ventas>cuota;
--cuantos pedidos de mas de 250000
SELECT COUNT(Num_Pedido)
FROM Pedidos
WHERE Importe>25000;



CREATE OR ALTER PROCEDURE sp_pruebaconsulta
@fechaInicial date,
@fechaFinal date
AS
SELECT Nombre, AVG(Importe)
FROM Representantes AS r
JOIN Pedidos AS p
ON p.Rep=r.Num_Empl
WHERE Fecha_Contrato BETWEEN @fechaInicial AND @fechaFinal
GROUP BY Nombre
ORDER BY Nombre;
END 

EXEC sp_pruebaconsulta '1989-01-01','1989-04-06'
Select *
From Pedidos
GO

--cual es el rango de la coutas asignadas de cada oficina (ciudad)
SELECT o.Ciudad,r.Nombre, MAX(r.Cuota),MIN(r.cuota),(Max (r.cuota)-Min(r.Cuota))
FROM Oficinas AS o
JOIN Representantes as r
ON o.Oficina=r.Oficina_Rep
GROUP BY o.Ciudad,r.Nombre
ORDER BY o.Ciudad;
GO

/*
1) Seleccionar el ingraso total por cliente en 1997 ordenado por el ingreso 
de forma de descendente
*/
SELECT c.CompanyName AS [Cliente],
SUM (od.Quantity * od.UnitPrice*(1-od.Discount)) AS [Ingreso]
FROM [Order Details] AS od
JOIN 
Orders AS o
ON o.OrderId =od.OrderId
JOIN 
Customers AS c
ON o.CustomerId=c.CustomerID
WHERE YEAR(o.OrderDate)=1997
GROUP BY c.CompanyName;
--los mismo pero se cambia el year
go
SELECT c.CompanyName AS [Cliente],
SUM (od.Quantity * od.UnitPrice*(1-od.Discount)) AS [Ingreso]
FROM [Order Details] AS od
JOIN 
Orders AS o
ON o.OrderId =od.OrderId
JOIN 
Customers AS c
ON o.CustomerId=c.CustomerID
WHERE DATEPART(YY,o.OrderDate)=1997
GROUP BY c.CompanyName;
go
--PARA LAS DECIMAS EL RAOUND Y EL NUMERO FINAL ES LA CANTIDAD DECIMAS

SELECT c.CompanyName AS [Cliente],
ROUND(SUM (od.Quantity * od.UnitPrice*(1-od.Discount)),2) AS [Ingreso]
FROM [Order Details] AS od
JOIN 
Orders AS o
ON o.OrderId =od.OrderId
JOIN 
Customers AS c
ON o.CustomerId=c.CustomerID
WHERE DATEPART(YY,o.OrderDate)=1997
GROUP BY c.CompanyName
ORDER BY 2 DESC;
go
----POR EL ALIAS QUE ES INGRESO y el top es para ver los primeros 10

SELECT TOP 10 c.CompanyName AS [Cliente],
ROUND(SUM (od.Quantity * od.UnitPrice*(1-od.Discount)),2) AS [Ingreso]
FROM [Order Details] AS od
JOIN 
Orders AS o
ON o.OrderId =od.OrderId
JOIN 
Customers AS c
ON o.CustomerId=c.CustomerID
WHERE DATEPART(YY,o.OrderDate)=1997
GROUP BY c.CompanyName
ORDER BY Ingreso DESC;
go
/*
2) Seleccionar los productos por categoria mas vendidos (unidades),
enviados alemaniar ordenados por categoria asc y dentro de categoria por aunidad de forma 
decendente
*/
USE NORTHWND
SELECT c.CategoryName,SUM(od.Quantity) AS [Unidades],p.ProductName as [Producto]
FROM [Order Details] AS od
JOIN Orders AS o
ON o.OrderId = od.OrderId
JOIN Products AS p
ON P.ProductID=od.ProductID
JOIN Categories AS c
ON c.CategoryID=p.CategoryID
WHERE o.ShipCountry = 'Germany'
GROUP BY c.CategoryName, p.ProductName 
ORDER BY 1,[Unidades]DESC;
GO

/*
Seleccionar los empleados con mas pedidos realizados por año,ordenado´por años
y ñpor numero de pedidos
*/
SELECT CONCAT (e.FirstName,'',e.LastName) AS [Empleados],COUNT(o.orderId) AS [Pedidos],
DATEPART (YY,o.OrderDate) AS [año]
FROM Orders AS o
JOIN Employees AS e
ON o.EmployeeId = e.EmployeeId
GROUP BY CONCAT (e.FirstName,'',e.LastName),DATEPART (YY,o.OrderDate) 
ORDER BY [año], [Pedidos]DESC ;