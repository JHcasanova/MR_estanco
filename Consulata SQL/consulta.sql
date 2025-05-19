--Productos por proveedor
SELECT p.nombre AS producto, pr.nombre AS proveedor
FROM producto p
JOIN proveedor pr ON p.proveedor_id = pr.id;
--Inventario total por sede
SELECT s.nombre AS sede, p.nombre AS producto, i.cantidad
FROM inventario i
JOIN sede s ON i.sede_id = s.id
JOIN producto p ON i.producto_id = p.id;
--Ventas realizadas con nombre del empleado y sede
SELECT v.id, v.fecha, v.total, e.nombre AS empleado, s.nombre AS sede
FROM venta v
JOIN empleado e ON v.empleado_id = e.id
JOIN sede s ON v.sede_id = s.id;

--Detalles de ventas con nombre del producto

SELECT dv.venta_id, p.nombre AS producto, dv.cantidad, dv.precio_unitario
FROM detalle_venta dv
JOIN producto p ON dv.producto_id = p.id;

--Clientes y los productos que compraron

SELECT c.nombre AS cliente, p.nombre AS producto, dv.cantidad
FROM compra_cliente cc
JOIN cliente c ON cc.cliente_id = c.id
JOIN venta v ON cc.venta_id = v.id
JOIN detalle_venta dv ON v.id = dv.venta_id
JOIN producto p ON dv.producto_id = p.id;

--Empleados y su sede asignada
SELECT e.nombre, e.apellido, s.nombre AS sede
FROM empleado e
JOIN sede s ON e.sede_id = s.id;

--Usuarios y sus roles

SELECT u.username, r.nombre AS rol
FROM user u
JOIN rol_user ru ON u.id = ru.user_id
JOIN rol r ON ru.rol_id = r.id;
-- Formularios que puede ver cada rol

SELECT r.nombre AS rol, f.nombre AS formulario
FROM rol r
JOIN modulo_rol mr ON r.id = mr.rol_id
JOIN modulo m ON mr.modulo_id = m.id
JOIN formulario f ON m.id = f.modulo_id;

--Productos más vendidos

SELECT p.nombre AS producto, SUM(dv.cantidad) AS total_vendido
FROM detalle_venta dv
JOIN producto p ON dv.producto_id = p.id
GROUP BY p.nombre
ORDER BY total_vendido DESC
LIMIT 5;

--Ventas por cliente (nombre, documento, total)

SELECT c.nombre, c.documento, v.id AS venta_id, v.total
FROM cliente c
JOIN compra_cliente cc ON c.id = cc.cliente_id
JOIN venta v ON cc.venta_id = v.id;