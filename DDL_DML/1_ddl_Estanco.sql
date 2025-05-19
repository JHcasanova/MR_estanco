CREATE DATABASE estanco_db;
USE estanco_db;

CREATE TABLE sede (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(150),
    ciudad VARCHAR(100)
);

CREATE TABLE proveedor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    contacto VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE producto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    tipo VARCHAR(50),
    precio DECIMAL(10,2),
    stock INT,
    proveedor_id INT,
    FOREIGN KEY (proveedor_id) REFERENCES proveedor(id)
);

CREATE TABLE inventario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT,
    sede_id INT,
    cantidad INT,
    FOREIGN KEY (producto_id) REFERENCES producto(id),
    FOREIGN KEY (sede_id) REFERENCES sede(id)
);

CREATE TABLE empleado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    correo VARCHAR(100),
    sede_id INT,
    FOREIGN KEY (sede_id) REFERENCES sede(id)
);

CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    documento VARCHAR(20),
    correo VARCHAR(100)
);

CREATE TABLE venta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME,
    total DECIMAL(10,2),
    sede_id INT,
    empleado_id INT,
    FOREIGN KEY (sede_id) REFERENCES sede(id),
    FOREIGN KEY (empleado_id) REFERENCES empleado(id)
);

CREATE TABLE detalle_venta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venta_id INT,
    producto_id INT,
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    FOREIGN KEY (venta_id) REFERENCES venta(id),
    FOREIGN KEY (producto_id) REFERENCES producto(id)
);

CREATE TABLE compra_cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    venta_id INT,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (venta_id) REFERENCES venta(id)
);
CREATE TABLE person (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100),
    correo VARCHAR(100)
);

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    person_id INT,
    empleado_id INT,
    FOREIGN KEY (person_id) REFERENCES person(id),
    FOREIGN KEY (empleado_id) REFERENCES empleado(id)
);

CREATE TABLE rol (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE rol_user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    rol_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (rol_id) REFERENCES rol(id)
);

CREATE TABLE modulo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE modulo_rol (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modulo_id INT,
    rol_id INT,
    FOREIGN KEY (modulo_id) REFERENCES modulo(id),
    FOREIGN KEY (rol_id) REFERENCES rol(id)
);

CREATE TABLE formulario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    modulo_id INT,
    FOREIGN KEY (modulo_id) REFERENCES modulo(id)
);

CREATE TABLE form_modulo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    formulario_id INT,
    modulo_id INT,
    FOREIGN KEY (formulario_id) REFERENCES formulario(id),
    FOREIGN KEY (modulo_id) REFERENCES modulo(id)
);