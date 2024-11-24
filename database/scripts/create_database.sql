#Eliminar la base de datos si ya existe
DROP DATABASE IF EXISTS gestor_calificaciones;

#Crear la base de datos
CREATE DATABASE gestor_calificaciones;
USE gestor_calificaciones;


#tabla usuarios
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    rol ENUM('administrador', 'profesor', 'estudiante') NOT NULL
);


#tabla cursos 
CREATE TABLE Cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

#tabla materias 
CREATE TABLE Materias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    curso_id INT NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES Cursos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

#tabla profesores
CREATE TABLE ProfesoresMaterias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profesor_id INT NOT NULL,
    materia_id INT NOT NULL,
    FOREIGN KEY (profesor_id) REFERENCES Usuarios(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (materia_id) REFERENCES Materias(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

#tabla estudiantes
CREATE TABLE Estudiantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    curso_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES Cursos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

#tabla periodos academicos
CREATE TABLE Periodos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL, -- Ejemplo: "Primer Periodo"
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL
);

#tabla calificaciones
CREATE TABLE Calificaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estudiante_id INT NOT NULL,
    materia_id INT NOT NULL,
    periodo_id INT NOT NULL,
    nota DECIMAL(5, 2) NOT NULL CHECK (nota BETWEEN 0 AND 5),
    FOREIGN KEY (estudiante_id) REFERENCES Estudiantes(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (materia_id) REFERENCES Materias(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (periodo_id) REFERENCES Periodos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

