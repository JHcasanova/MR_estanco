--Función Calcular total de ventas de un cliente
DELIMITER //
CREATE FUNCTION fn_total_ventas_cliente(p_cliente_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(v.total)
    INTO total
    FROM compra_cliente cc
    JOIN venta v ON cc.venta_id = v.id
    WHERE cc.cliente_id = p_cliente_id;

    RETURN IFNULL(total, 0);
END;
//
DELIMITER ;