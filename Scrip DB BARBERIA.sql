CREATE SCHEMA barberia;
USE barberia;

CREATE TABLE cliente(
	id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    telefono VARCHAR(11),
    email VARCHAR(100) NOT NULL
    );

CREATE TABLE empleado(
	id_empleado INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    telefono VARCHAR(11),
    especialidad VARCHAR(100)
);

CREATE TABLE servicio(
	id_servicio INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre_servicio VARCHAR(100),
    descripcion VARCHAR(100),
    precio DECIMAL(10,2)
);

CREATE TABLE proveedor(
	id_proveedor  INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre_empresa VARCHAR(100),
    contacto VARCHAR(100),
    telefono VARCHAR(11),
    email VARCHAR(100) NOT NULL
);

CREATE TABLE turno(
	id_cita INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    fecha DATE NOT NULL,
    hora time
);

CREATE TABLE detalle_turno(
	id_detalle INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_cita INT NOT NULL,
    id_servicio INT NOT NULL,
    duracion TIME
);

CREATE TABLE producto (
	id_producto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_proveedor INT NOT NULL,
    nombre_producto VARCHAR(100),
    descripcion VARCHAR(100),
    precio_compra DECIMAL(10.2),
    stock DECIMAL(10)
);

ALTER TABLE turno ADD CONSTRAINT fk_cliente_turno
	FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente);

ALTER TABLE turno ADD CONSTRAINT fk_empleado_turno
	FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado);
    
ALTER TABLE producto ADD CONSTRAINT fk_proveedor_producto
	FOREIGN KEY (id_proveedor) REFERENCES proveedor (id_proveedor);
    
ALTER TABLE detalle_turno ADD CONSTRAINT fk_cita_detalle
	FOREIGN KEY (id_cita) REFERENCES turno (id_cita);
    
ALTER TABLE detalle_turno ADD CONSTRAINT fk_servicio_detalle
	FOREIGN KEY (id_servicio) REFERENCES servicio (id_servicio);
 




