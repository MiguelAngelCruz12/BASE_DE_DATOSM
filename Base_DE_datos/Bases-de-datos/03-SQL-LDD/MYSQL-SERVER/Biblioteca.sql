CREATE DATABASE LibreriaCentral;
GO

USE LibreriaCentral;
GO

CREATE TABLE Libros (
    IdLibro INT PRIMARY KEY,
    Titulo NVARCHAR(100),
    Autor NVARCHAR(60),
    Editorial NVARCHAR(50),
    Stock INT
);
GO

CREATE TABLE Usuarios (
    IdUsuario INT PRIMARY KEY,
    NombreCompleto NVARCHAR(100),
    Email NVARCHAR(100),
    FechaRegistro DATE
);
GO

CREATE TABLE Prestamos (
    IdPrestamo INT PRIMARY KEY,
    IdLibro INT,
    IdUsuario INT,
    FechaPrestamo DATE,
    FechaDevolucion DATE,
    FOREIGN KEY (IdLibro) REFERENCES Libros(IdLibro),
    FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario)
);
GO
