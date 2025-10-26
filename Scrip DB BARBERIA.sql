CREATE SCHEMA barberia;
USE barberia;

####################### CREACION DE TABLAS ##########################

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

CREATE TABLE cantidad_turnos (
    id_cliente INT PRIMARY KEY,
    total_turnos INT DEFAULT 0,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE cantidad_turnos_empleado (
    id_empleado INT NOT NULL PRIMARY KEY,
    cantidad_turnos INT NOT NULL DEFAULT 0,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

######################## INSERCION DE CLAVES FORANEAS ##################################

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
    
    #################### INSERCION DE DATOS EN TABLAS ##############################
    
INSERT INTO  cliente ( nombre, apellido, telefono, email)
VALUES
('Lucia', 'Gomez', '114568910', 'lucia.gomez@example.com'),
('Martin', 'Perez', '1123456789', 'martin.perez@example.com'),
('Sofia', 'Rodriguez', '1198765432', 'sofia.rodriguez@example.com'),
('Juan', 'Fernandez', '1176543210', 'juan.fernandez@example.com'),
('Valentina', 'Lopez', '1111223344', 'valentina.lopez@example.com'),
('Tomas', 'Martinez', '1199887766', 'tomas.martinez@example.com'),
('Camila', 'Diaz', '1144332211', 'camila.diaz@example.com'),
('Mateo', 'Sanchez', '1166778899', 'mateo.sanchez@example.com'),
('Julieta', 'Ramirez', '1155667788', 'julieta.ramirez@example.com'),
('Agustin', 'Torres', '1133445566', 'agustin.torres@example.com');

INSERT INTO empleado (nombre, apellido, telefono, especialidad)
VALUES 
('Lucas', 'Gomez', '1134567890', 'Cortes clasicos'),
('Martina', 'Perez', '1123456789', 'Coloracion y mechas'),
('Diego', 'Fernandez', '1145678901', 'Barba y afeitado'),
('Camila', 'Rodriguez', '1156789012', 'Cortes modernos'),
('Julian', 'Martinez', '1167890123', 'Diseno de cejas'),
('Valentina', 'Lopez', '1178901234', 'Peinados y styling'),
('Tomas', 'Sanchez', '1189012345', 'Fade y degradados'),
('Florencia', 'Ramirez', '1190123456', 'Tratamientos capilares'),
('Nicolas', 'Torres', '1101234567', 'Cortes infantiles'),
('Sofia', 'Molina', '1112345678', 'Color fantasia');

INSERT INTO servicio (nombre_servicio, descripcion, precio)
VALUES
('corte','corte de cabello unisex', 12000.00),
('coloracion', 'colocacion de tintura en cabello unisex', 35000),
('diseno de barba', 'recorte de barba y afeitado', 8000),
('diseno de peinado', 'creacion de peinados unisex', 20000),
('decoloracion de cabello', 'trabajo de decoloracion en mechas o reflejos', 45000),
('diseno y coloracion fantasia', 'creacion de estilos unisex en colores fantasia', 40000),
('diseno de cejas', 'creacion de diseno para cejas unisex', 8000),
('tratamiento nutritivo','aplicacion de nutriciones capilares unisex', 38000),
('diseno de dibujos', 'creacion de dibujos en cabellos cortos', 18000),
('tratamientos moleculares', 'realizacion de alisados progresivos o permanentes de rulos', 42000);

INSERT INTO proveedor (nombre_empresa, contacto, telefono, email)
VALUES
('Distribuidora Fanatic', 'Luciana Gomez', '1155551234', 'luciana@distribuidorafanatic.com'),
('Billions Pro', 'Martin Rios', '1147891122', 'ventas@billionspro.com.ar'),
('BarberShop Argentina', 'Diego Fernandez', '1148903344', 'contacto@barbershop.com.ar'),
('Barber Line', 'Sofia Martinez', '1145678901', 'info@barberline.com.ar'),
('Barber Market', 'Federico Lopez', '1147802233', 'federico@barbermarket.com'),
('Estilo Barber', 'Carla Mendez', '1147995566', 'carla@estilobarber.com'),
('Barber Tools Pro', 'Julian Torres', '1147007788', 'julian@barbertoolspro.com'),
('Distribuidora BarberPro', 'Maria Solari', '1148996655', 'msolari@barberpro.com.ar'),
('Barber Supply Argentina', 'Gustavo Ramirez', '1147559988', 'gustavo@barbersupply.com.ar'),
('Barber House', 'Natalia Perez', '1148773344', 'natalia@barberhouse.com.ar');

INSERT INTO turno (id_cliente, id_empleado, fecha, hora)
VALUES
(1, 2 ,'2025-10-08', '10:45:00'),
(2, 1, '2025-10-08', '10:00:00'),
(3,5,'2025-10-08','10:30:00'),
(4,3,'2025-10-09','10:00:00'),
(5,2,'2025-10-08','14:15:00'),
(6,7,'2025-10-09','10:45:00'),
(7,10,'2025-10-09', '16:45:00'),
(8,9,'2025-10-09', '18:10:00'),
(9,6,'2025-10-09','15:30:00'),
(10,4, '2025-10-10','19:45:30');

INSERT INTO producto (id_proveedor, nombre_producto, descripcion, precio_compra, stock)
VALUES
(1,'Maquina Wahl Magic Clip', 'Maquina de corte profesional inalambrica con cuchillas de precision', 450000.00, 5),
(2,'Shampoo para barba', 'Shampoo suave con aceite de argan para limpieza profunda de la barba', 3200.00, 40),
(3,'Cera para peinar', 'Cera modeladora con fijación media y aroma a menta', 2800.00, 25),
(4,'Tijera de entresacar', 'Tijera profesional de acero inoxidable para texturizar el cabello', 7500.00, 3),
(5,'After Shave Mentolado', 'Loción refrescante post afeitado con efecto calmante', 2100.00, 30),
(6,'Peine de carbono', 'Peine resistente al calor ideal para cortes con maquina', 2500.00, 50),
(7,'Toalla de microfibra', 'Toalla absorbente de secado rápido para uso profesional', 1800.00, 35),
(8,'Aceite para barba', 'Aceite nutritivo con jojoba y vitamina E para suavizar la barba', 3500.00, 20),
(9,'Delantal de barbería', 'Delantal impermeable con bolsillos múltiples y diseno vintage', 4200.00, 4),
(10,'Spray desinfectante', 'Spray para herramientas con accion bactericida y aroma citrico', 1600.00, 45);

INSERT INTO detalle_turno (id_cita, id_servicio, duracion)
VALUES
(1,2,'03:45:00'),
(2,1,'00:30:00'),
(3,7,'00:30:00'),
(4,4,'00:20:00'),
(5,5,'05:20:00'),
(6,9,'00:50:00'),
(7,6,'04:50:00'),
(8,1,'00:30:00'),
(9,4,'02:45:00'),
(10,9,'00:50:00');

##################### CREACION DE VISTAS ######################################

CREATE VIEW vista_turno_detallada AS
SELECT 
    c.nombre AS nombre_cliente,
    e.nombre AS nombre_empleado,
    e.especialidad,
    t.fecha,
    t.hora
FROM 
    turno t
JOIN 
    cliente c ON t.id_cliente = c.id_cliente
JOIN 
    empleado e ON t.id_empleado = e.id_empleado;

### SELECT * FROM vista_turno_detallada;  (AQUI EL SELECT DE LA VISTA, lo agregue comentado para que no moleste en el caso de ejecutar todo el scrip de una sola vez) ###

CREATE VIEW vista_producto_proveedor AS
SELECT 
    p.nombre_empresa,
    pr.nombre_producto,
    pr.precio_compra,
    pr.stock
FROM 
    proveedor p
JOIN 
    producto pr ON p.id_proveedor = pr.id_proveedor;
    
### SELECT * FROM vista_producto_proveedor; (AQUI el SELECTDE LA VISTA, lo agregue comentado para que no moleste en el caso de ejectuar todo el scrip de una sola vez) ###


############################### CREACION DE FUNCIONES ##############################################


  DELIMITER //

CREATE FUNCTION hay_stock(p_id_producto INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE cantidad DECIMAL(10);
    
    SELECT stock INTO cantidad
    FROM producto
    WHERE id_producto = p_id_producto;

    RETURN cantidad > 0;
END //

DELIMITER ;

 
 ##SELECT hay_stock(8);##
 
 
 DELIMITER //

CREATE FUNCTION turno_fecha(fecha_consulta DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidad INT;

    SELECT COUNT(*) INTO cantidad
    FROM turno
    WHERE fecha = fecha_consulta;

    RETURN cantidad;
END //

DELIMITER ;

SELECT turno_fecha('2025-10-08');

############################# CREACION DE STORED PROCEDURE ##########################################

DELIMITER //

CREATE PROCEDURE agregar_cliente(
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_telefono VARCHAR(11),
    IN p_email VARCHAR(100)
)
BEGIN
    INSERT INTO cliente (nombre, apellido, telefono, email)
    VALUES (p_nombre, p_apellido, p_telefono, p_email);
END //

DELIMITER ;


## CALL agregar_cliente('gaston', 'segovia','1131354898', 'gsegovia@example.com'); ##


DELIMITER //

CREATE PROCEDURE eliminar_turno(IN p_id_cita INT)
BEGIN
   
    DELETE FROM detalle_turno
    WHERE id_cita = p_id_cita;

    DELETE FROM turno
    WHERE id_cita = p_id_cita;
END //

DELIMITER ;

## call eliminar_turno(10); ##

###################################### CREACION DE TRIGGERS ######################################


DELIMITER $$

CREATE TRIGGER actualizar_cantidad_turnos
AFTER INSERT ON turno
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM cantidad_turnos WHERE id_cliente = NEW.id_cliente
    ) THEN
        UPDATE cantidad_turnos
        SET total_turnos = total_turnos + 1
        WHERE id_cliente = NEW.id_cliente;
    ELSE
        INSERT INTO cantidad_turnos (id_cliente, total_turnos)
        VALUES (NEW.id_cliente, 1);
    END IF;
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER registrar_turno_empleado
AFTER INSERT ON turno
FOR EACH ROW
BEGIN
    DECLARE existe INT;
    
    SELECT COUNT(*) INTO existe
    FROM cantidad_turnos_empleado
    WHERE id_empleado = NEW.id_empleado;

    IF existe > 0 THEN
        
        UPDATE cantidad_turnos_empleado
        SET cantidad_turnos = cantidad_turnos + 1
        WHERE id_empleado = NEW.id_empleado;
    ELSE
       
        INSERT INTO cantidad_turnos_empleado (id_empleado, cantidad_turnos)
        VALUES (NEW.id_empleado, 1);
    END IF;
END$$

DELIMITER 















