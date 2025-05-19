--  Tabla person
INSERT INTO person (nombre_completo, correo) VALUES
('Juan Pérez', 'juanp@estanco.com'),
('Luisa Gómez', 'luisag@estanco.com'),
('Carlos Ruiz', 'carlosr@estanco.com'),
('Ana Torres', 'anat@estanco.com'),
('Laura Díaz', 'laurad@estanco.com'),
('Sofía Castro', 'sofiac@estanco.com'),
('Pedro Moreno', 'pedrom@estanco.com'),
('Jorge Linares', 'jorgel@estanco.com'),
('Camila Ríos', 'camilar@estanco.com'),
('Mariana León', 'marianal@estanco.com');

--  Tabla user
INSERT INTO user (username, password, person_id) VALUES
('jperez', '123456', 1,3),
('lgomez', '123456', 2,5),
('cruiz', '123456', 3,6),
('atorres', '123456', 4,7),
('ldiaz', '123456', 5,8),
('scastro', '123456', 6,9),
('pmoreno', '123456', 7,10),
('jlinares', '123456', 8,11,12),
('crios', '123456', 9,23),
('mleon', '123456', 10,22);

--  Tabla rol
INSERT INTO rol (nombre) VALUES
('Administrador'),
('Vendedor'),
('Supervisor');

--  Tabla rol_user
INSERT INTO rol_user (user_id, rol_id) VALUES
(1, 1), (2, 2), (3, 2), (4, 2), (5, 3),
(6, 2), (7, 3), (8, 2), (9, 2), (10, 1);

--  Tabla modulo
INSERT INTO modulo (nombre) VALUES
('Ventas'),
('Inventario'),
('Seguridad');

--  Tabla modulo_rol
INSERT INTO modulo_rol (modulo_id, rol_id) VALUES
(1, 1), (2, 1), (3, 1),
(1, 2), (2, 3);

-- Tabla formulario
INSERT INTO formulario (nombre, modulo_id) VALUES
('Registrar Venta', 1),
('Consultar Inventario', 2),
('Ver Usuarios', 3),
('Editar Usuario', 3),
('Asignar Rol', 3);

-- Tabla form_modulo
INSERT INTO form_modulo (formulario_id, modulo_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 3), (5, 3);