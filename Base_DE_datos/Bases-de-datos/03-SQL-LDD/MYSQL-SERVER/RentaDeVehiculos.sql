CREATE DATABASE AgenciaAutos;
GO

USE AgenciaAutos;
GO

CREATE TABLE Clientes (
    IdCliente INT PRIMARY KEY,
    Nombre NVARCHAR(50),
    Apellido NVARCHAR(50),
    RFC NVARCHAR(13),
    Telefono NVARCHAR(15),
    Email NVARCHAR(100)
);
GO

CREATE TABLE Sucursales (
    IdSucursal INT PRIMARY KEY,
    Nombre NVARCHAR(40),
    Direccion NVARCHAR(100),
    Ciudad NVARCHAR(40),
    Estado NVARCHAR(30)
);
GO

CREATE TABLE Autos (
    IdAuto INT PRIMARY KEY,
    Placa NVARCHAR(10),
    Marca NVARCHAR(25),
    Modelo NVARCHAR(25),
    Anio INT,
    Color NVARCHAR(20),
    PrecioPorDia DECIMAL(8,2),
    IdSucursal INT,
    FOREIGN KEY (IdSucursal) REFERENCES Sucursales(IdSucursal)
);
GO

CREATE TABLE Renta (
    IdRenta INT PRIMARY KEY,
    FechaInicio DATE,
    FechaFin DATE,
    IdCliente INT,
    IdAuto INT,
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente),
    FOREIGN KEY (IdAuto) REFERENCES Autos(IdAuto)
);
GO
