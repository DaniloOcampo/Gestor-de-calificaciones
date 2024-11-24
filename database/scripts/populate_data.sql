USE gestor_calificaciones;

#prueba cursos
INSERT INTO Cursos (nombre) VALUES ('6º'), ('7º'), ('8º'), ('9º'), ('10º'), ('11º');

#prueba materias
INSERT INTO Materias (nombre, curso_id) VALUES
('Matemáticas', 1), 
('Español', 1), 
('Física', 2), 
('Química', 2),
('Historia', 3);

#prueba usuarios
INSERT INTO Usuarios (nombre, email, contraseña, rol) VALUES
('Administrador', 'admin@school.com', 'admin123', 'administrador'),
('Profesor A', 'profesorA@school.com', 'prof123', 'profesor'),
('Profesor B', 'profesorB@school.com', 'prof123', 'profesor');

#prueba estudiantes
INSERT INTO Usuarios (nombre, email, contraseña, rol) VALUES
('Estudiante 1', 'estudiante1@school.com', 'stud123', 'estudiante'),
('Estudiante 2', 'estudiante2@school.com', 'stud123', 'estudiante');

INSERT INTO Estudiantes (usuario_id, curso_id) VALUES
(3, 1), -- Estudiante 1 en 6º
(4, 2); -- Estudiante 2 en 7º

#prueba periodos
INSERT INTO Periodos (nombre, fecha_inicio, fecha_fin) VALUES
('Primer Periodo', '2024-01-01', '2024-04-01'),
('Segundo Periodo', '2024-04-02', '2024-07-01'),
('Tercer Periodo', '2024-07-02', '2024-11-01');
