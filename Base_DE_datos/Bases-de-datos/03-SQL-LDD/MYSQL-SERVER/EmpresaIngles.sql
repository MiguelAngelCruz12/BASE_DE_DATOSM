CREATE DATABASE Corporativo;
GO

USE Corporativo;
GO

CREATE TABLE Departamentos (
    IdDepartamento INT PRIMARY KEY,
    Nombre NVARCHAR(40),
    Piso INT
);
GO

CREATE TABLE Empleados (
    IdEmpleado INT PRIMARY KEY,
    Nombre NVARCHAR(50),
    Puesto NVARCHAR(40),
    Salario DECIMAL(10,2),
    FechaIngreso DATE,
    IdDepartamento INT,
    FOREIGN KEY (IdDepartamento) REFERENCES Departamentos(IdDepartamento)
);
GO

CREATE TABLE Proyectos (
    IdProyecto INT PRIMARY KEY,
    Nombre NVARCHAR(50),
    Presupuesto DECIMAL(12,2),
    FechaInicio DATE,
    IdResponsable INT,
    FOREIGN KEY (IdResponsable) REFERENCES Empleados(IdEmpleado)
);
GO

CREATE TABLE Asignaciones (
    IdEmpleado INT,
    IdProyecto INT,
    HorasAsignadas INT,
    PRIMARY KEY (IdEmpleado, IdProyecto),
    FOREIGN KEY (IdEmpleado) REFERENCES Empleados(IdEmpleado),
    FOREIGN KEY (IdProyecto) REFERENCES Proyectos(IdProyecto)
);
GO
