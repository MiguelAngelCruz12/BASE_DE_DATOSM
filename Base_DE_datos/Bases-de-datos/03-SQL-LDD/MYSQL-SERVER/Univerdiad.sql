CREATE DATABASE InstitutoEducativo;
GO

USE InstitutoEducativo;
GO

CREATE TABLE Alumnos (
    IdAlumno INT PRIMARY KEY,
    Matricula NVARCHAR(15),
    NombreCompleto NVARCHAR(100),
    FechaNacimiento DATE,
    Carrera NVARCHAR(50)
);
GO

CREATE TABLE Materias (
    IdMateria INT PRIMARY KEY,
    NombreMateria NVARCHAR(50),
    Creditos INT
);
GO

CREATE TABLE Calificaciones (
    IdAlumno INT,
    IdMateria INT,
    Calificacion DECIMAL(4,2),
    PRIMARY KEY (IdAlumno, IdMateria),
    FOREIGN KEY (IdAlumno) REFERENCES Alumnos(IdAlumno),
    FOREIGN KEY (IdMateria) REFERENCES Materias(IdMateria)
);
GO
