-- 1 Agregar nuevo cliente
DELIMITER //
CREATE PROCEDURE sp_agregar_cliente(
    IN p_nombre VARCHAR(100),
    IN p_documento VARCHAR(20),
    IN p_correo VARCHAR(100)
)
BEGIN
    INSERT INTO cliente (nombre, documento, correo)
    VALUES (p_nombre, p_documento, p_correo);
END //
DELIMITER ;

--2 Actualizar datos de un cliente

DELIMITER //
CREATE PROCEDURE sp_actualizar_cliente(
    IN p_id INT,
    IN p_nombre VARCHAR(100),
    IN p_documento VARCHAR(20),
    IN p_correo VARCHAR(100)
)
BEGIN
    UPDATE cliente
    SET nombre = p_nombre, documento = p_documento, correo = p_correo
    WHERE id = p_id;
END //
DELIMITER ;

--3 Eliminar cliente por ID

DELIMITER //
CREATE PROCEDURE sp_eliminar_cliente(IN p_id INT)
BEGIN
    DELETE FROM cliente WHERE id = p_id;
END //
DELIMITER ;

--4 Obtener listado de clientes

DELIMITER //
CREATE PROCEDURE sp_listar_clientes()
BEGIN
    SELECT * FROM cliente;
END //
DELIMITER ;

-- 5 Insertar nuevo producto

DELIMITER //
CREATE PROCEDURE sp_insertar_producto(
    IN p_nombre VARCHAR(100),
    IN p_tipo VARCHAR(50),
    IN p_precio DECIMAL(10,2),
    IN p_stock INT,
    IN p_proveedor_id INT
)
BEGIN
    INSERT INTO producto (nombre, tipo, precio, stock, proveedor_id)
    VALUES (p_nombre, p_tipo, p_precio, p_stock, p_proveedor_id);
END //
DELIMITER ;

-- 6 Actualizar stock de un producto

DELIMITER //
CREATE PROCEDURE sp_actualizar_stock(
    IN p_id INT,
    IN p_nuevo_stock INT
)
BEGIN
    UPDATE producto
    SET stock = p_nuevo_stock
    WHERE id = p_id;
END //
DELIMITER ;

-- 7 Consultar productos por tipo

DELIMITER //
CREATE PROCEDURE sp_productos_por_tipo(IN p_tipo VARCHAR(50))
BEGIN
    SELECT * FROM producto WHERE tipo = p_tipo;
END //
DELIMITER ;


-- 8 Insertar venta y detalle (simple)

DELIMITER //
CREATE PROCEDURE sp_insertar_venta(
    IN p_fecha DATETIME,
    IN p_total DECIMAL(10,2),
    IN p_sede_id INT,
    IN p_empleado_id INT
)
BEGIN
    INSERT INTO venta (fecha, total, sede_id, empleado_id)
    VALUES (p_fecha, p_total, p_sede_id, p_empleado_id);
END //
DELIMITER ;

-- 9 Ver ventas realizadas por un empleado

DELIMITER //
CREATE PROCEDURE sp_ventas_por_empleado(IN p_empleado_id INT)
BEGIN
    SELECT * FROM venta WHERE empleado_id = p_empleado_id;
END //
DELIMITER ;

-- 10 Consultar inventario de una sede
DELIMITER //
CREATE PROCEDURE sp_inventario_por_sede(IN p_sede_id INT)
BEGIN
    SELECT p.nombre, i.cantidad
    FROM inventario i
    JOIN producto p ON i.producto_id = p.id
    WHERE i.sede_id = p_sede_id;
END //
DELIMITER ;