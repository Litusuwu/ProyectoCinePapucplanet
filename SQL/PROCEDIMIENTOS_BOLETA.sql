-- Drops de Boleta
DROP PROCEDURE IF EXISTS INSERTAR_BOLETA;
DROP PROCEDURE IF EXISTS LISTAR_BOLETAS_TODAS;
DROP PROCEDURE IF EXISTS MODIFICAR_BOLETA;
DROP PROCEDURE IF EXISTS LISTAR_BOLETA_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_BOLETA_X_ID;

-- Procedimientos de Boleta
DELIMITER $
CREATE PROCEDURE INSERTAR_BOLETA(
    OUT _id_boleta INT,
    IN _fid_cliente INT,
    IN _fechaCompra DATE,
    IN _metodo_pago ENUM('TARJETA_CREDITO', 'TARJETA_DEBITO', 'BILLETERA_ELECTRONICA'),
    IN _total DOUBLE
)
BEGIN
    INSERT INTO Boleta(fid_cliente, fechaCompra, metodo_pago, total) 
    VALUES(_fid_cliente, _fechaCompra, _metodo_pago, _total);
    SET _id_boleta = @@last_insert_id;
END$

CREATE PROCEDURE LISTAR_BOLETAS_TODAS()
BEGIN
    SELECT b.id_boleta, b.fechaCompra, b.metodo_pago, b.total, b.activo as boleta_activa, 
		c.id_cliente, u.dni, u.nombres, u.primer_apellido, u.segundo_apellido, u.genero,
        u.fecha_nacimiento, c.fid_sede, u.activo as usuario_activo
    FROM Boleta b
    JOIN Cliente c ON b.fid_cliente = c.id_cliente
    JOIN Usuario u ON c.id_cliente = u.id_usuario
    WHERE b.activo = 1
    ;
END$

CREATE PROCEDURE MODIFICAR_BOLETA(
    IN _id_boleta INT,
    IN _fid_cliente INT,
    IN _fechaCompra DATE,
    IN _metodo_pago ENUM('TARJETA_CREDITO', 'TARJETA_DEBITO', 'BILLETERA_ELECTRONICA'),
    IN _total DOUBLE
)
BEGIN
    UPDATE Boleta 
    SET fid_cliente = _fid_cliente, fechaCompra = _fechaCompra, metodo_pago = _metodo_pago, total = _total
    WHERE id_boleta = _id_boleta;
    UPDATE LineaBoleta SET activo = 0 WHERE fid_boleta = _id_boleta;
END$

CREATE PROCEDURE LISTAR_BOLETA_X_ID(
    IN _id_boleta INT
)
BEGIN
    SELECT b.id_boleta, b.fechaCompra, b.metodo_pago, b.total, b.activo as boleta_activa, 
		c.id_cliente, u.dni, u.nombres, u.primer_apellido, u.segundo_apellido, u.genero,
        u.fecha_nacimiento, c.fid_sede, u.activo as usuario_activo
    FROM Boleta b
    JOIN Cliente c ON b.fid_cliente = c.id_cliente
    JOIN Usuario u ON c.id_cliente = u.id_usuario
    WHERE b.id_boleta = _id_boleta AND b.activo = 1
    ;
END$

CREATE PROCEDURE ELIMINAR_BOLETA_X_ID(IN _id_boleta INT)
BEGIN
    UPDATE Boleta 
    SET activo = 0 
    WHERE id_boleta = _id_boleta;
END$