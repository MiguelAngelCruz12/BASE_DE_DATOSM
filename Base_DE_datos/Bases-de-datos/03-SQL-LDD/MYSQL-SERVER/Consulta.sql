CREATE DATABASE CentroSalud;
GO

USE CentroSalud;
GO

CREATE TABLE Medicos (
    IdMedico INT PRIMARY KEY,
    Nombre NVARCHAR(50),
    Especialidad NVARCHAR(40),
    Cedula NVARCHAR(20),
    Telefono NVARCHAR(15)
);
GO

CREATE TABLE Pacientes (
    IdPaciente INT PRIMARY KEY,
    Nombre NVARCHAR(50),
    FechaNacimiento DATE,
    Genero NVARCHAR(10),
    Telefono NVARCHAR(15)
);
GO

CREATE TABLE Consultas (
    IdConsulta INT PRIMARY KEY,
    Fecha DATE,
    Motivo NVARCHAR(100),
    Diagnostico NVARCHAR(150),
    IdMedico INT,
    IdPaciente INT,
    FOREIGN KEY (IdMedico) REFERENCES Medicos(IdMedico),
    FOREIGN KEY (IdPaciente) REFERENCES Pacientes(IdPaciente)
);
GO
