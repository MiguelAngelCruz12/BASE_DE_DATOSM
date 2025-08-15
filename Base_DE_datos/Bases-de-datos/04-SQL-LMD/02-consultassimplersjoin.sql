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
ON 



