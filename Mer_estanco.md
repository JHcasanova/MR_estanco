Objetivo del sistema:
Desarrollar una base de datos que permita gestionar las operaciones de un estanco con varias sedes, incluyendo:

Inventario de licores.
Ventas.
Clientes.
Empleados.
Proveedores.
Seguridad del sistema (usuarios, roles, permisos, etc.).

# MER -> Modelo  Relacional

Entidades base del negocio:

Sede (id, nombre, dirección, ciudad)
Empleado (id, nombre, apellido, correo, sede_id)
Proveedor (id, nombre, contacto, telefono)
Producto (id, nombre, tipo, precio, stock, proveedor_id)
Venta (id, fecha, total, sede_id, empleado_id)
DetalleVenta (id, venta_id, producto_id, cantidad, precio_unitario)
Cliente (id, nombre, documento, correo)
CompraCliente (id, cliente_id, venta_id)
Inventario (id, producto_id, sede_id, cantidad)

Entidades de seguridad (requeridas):

Person (id, nombre_completo, correo)
User (id, username, password, person_id , empleado_id)
Rol (id, nombre)
Rol_User (id, user_id, rol_id)
Modulo (id, nombre)
Modulo_Rol (id, modulo_id, rol_id)
Formulario (id, nombre, modulo_id)
Form_Modulo (id, formulario_id, modulo_id)