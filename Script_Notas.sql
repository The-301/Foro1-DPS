--Creamos la DB primero
CREATE DATABASE notas_udb_virtual;
go

--Utilizamos la BD para no meter las tablas en la master
USE notas_udb_virtual;
go

-- Se crea la tabla de estudiantes 
CREATE TABLE Estudiantes (
    estudiante_id INT PRIMARY KEY,
    nombre NVARCHAR(50),
    apellido NVARCHAR(50),
    correo NVARCHAR(100),
	carrera NVARCHAR(50)
);

-- Creamos la tabla de notas 
CREATE TABLE Notas (
    notas_id INT PRIMARY KEY,
    estudiante_id INT,
    subject NVARCHAR(50),
    nota DECIMAL(4, 2),
    ciclo NVARCHAR(10)
    -- Otros campos relacionados con las notas, si es necesario
);

-- Establecer una relación entre las tablas para relacionar notas con estudiantes
ALTER TABLE Notas
ADD CONSTRAINT FK_Estudiantes_Notas FOREIGN KEY (estudiante_id)
REFERENCES Estudiantes(estudiante_id);
