-- Tabla sede
INSERT INTO sede (nombre, direccion, ciudad) VALUES
('Estanco Central', 'Cra 10 #20-30', 'Bogotá'),
('Estanco Norte', 'Av 15 #45-60', 'Medellín'),
('Estanco Sur', 'Calle 8 #5-20', 'Cali'),
('Estanco Oriente', 'Cra 25 #60-22', 'Barranquilla'),
('Estanco Occidente', 'Cl 13 #35-10', 'Bucaramanga');

--  Tabla proveedor
INSERT INTO proveedor (nombre, contacto, telefono) VALUES
('Licorera Nacional', 'Carlos Álvarez', '3001234567'),
('Distribuidora Andina', 'Luisa Torres', '3107654321'),
('Bebidas Premium', 'Ana Ramírez', '3123344556'),
('LicorExpress', 'Pedro Castaño', '3156677889'),
('Alcohólicos Felices', 'Laura Méndez', '3019988776');

-- Tabla producto
INSERT INTO producto (nombre, tipo, precio, stock, proveedor_id) VALUES
('Ron Medellín 3 años', 'Ron', 40000, 200, 1),
('Ron Medellín 8 años', 'Ron', 75000, 120, 1),
('Aguardiente Antioqueño', 'Aguardiente', 30000, 300, 2),
('Whisky Old Parr', 'Whisky', 120000, 80, 3),
('Tequila José Cuervo', 'Tequila', 95000, 100, 3),
('Vodka Smirnoff', 'Vodka', 55000, 150, 4),
('Cerveza Poker Lata', 'Cerveza', 3500, 1000, 5),
('Cerveza Club Colombia', 'Cerveza', 4000, 800, 5),
('Vino Gato Negro', 'Vino', 27000, 90, 2),
('Baileys Original', 'Licor', 88000, 60, 3);

--  Tabla inventario (por sede)
INSERT INTO inventario (producto_id, sede_id, cantidad) VALUES
(1, 1, 50), (2, 1, 40), (3, 1, 60),
(4, 2, 30), (5, 2, 25), (6, 2, 50),
(7, 3, 200), (8, 3, 150), (9, 3, 30),
(10, 4, 20), (1, 5, 35), (2, 5, 15);

--  Tabla cliente
INSERT INTO cliente (nombre, documento, correo) VALUES
('Daniel Vargas', '12345678', 'danielv@gmail.com'),
('Lucía Rodríguez', '98765432', 'luciar@gmail.com'),
('Fernando López', '11223344', 'fernandol@gmail.com'),
('Valentina Ríos', '55667788', 'valentinar@gmail.com'),
('Mateo Torres', '33445566', 'mateot@gmail.com');

-- Tabla empleado
INSERT INTO empleado (nombre, apellido, correo, sede_id) VALUES
('Santiago', 'Martínez', 'smartinez@estanco.com', 1),
('Laura', 'Ramírez', 'lramirez@estanco.com', 1),
('Diego', 'Mejía', 'dmejia@estanco.com', 2),
('Carolina', 'Herrera', 'cherrera@estanco.com', 3),
('Andrés', 'Orozco', 'aorozco@estanco.com', 4);

-- Tabla venta
INSERT INTO venta (fecha, total, sede_id, empleado_id) VALUES
('2025-05-01 14:23:00', 175000, 1, 1),
('2025-05-02 15:45:00', 52000, 2, 3),
('2025-05-02 17:00:00', 87000, 3, 4),
('2025-05-03 12:00:00', 45000, 1, 2),
('2025-05-03 16:15:00', 110000, 4, 5);

-- Tabla detalle_venta
INSERT INTO detalle_venta (venta_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 2, 40000), (1, 3, 3, 30000),
(2, 6, 1, 52000),
(3, 5, 1, 95000),
(4, 8, 2, 4000), (4, 7, 10, 3500),
(5, 10, 1, 88000), (5, 9, 1, 27000);

-- Tabla compra_cliente
INSERT INTO compra_cliente (cliente_id, venta_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);