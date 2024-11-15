-- Drops de ButacaFuncion
DROP PROCEDURE IF EXISTS INSERTAR_BUTACA_FUNCION;
DROP PROCEDURE IF EXISTS LISTAR_BUTACAS_FUNCIONES_TODAS;
DROP PROCEDURE IF EXISTS MODIFICAR_BUTACA_FUNCION;
DROP PROCEDURE IF EXISTS LISTAR_BUTACA_FUNCION_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_BUTACA_FUNCION_X_ID;
DROP PROCEDURE IF EXISTS OBTENER_BUTACAS_X_FUNCION;
DROP PROCEDURE IF EXISTS ELIMINAR_BUTACAS_FUNCION_X_ID_FUNCION;

-- Procedimientos de ButacaFuncion
DELIMITER $
CREATE PROCEDURE INSERTAR_BUTACA_FUNCION(
	OUT _id_butaca_funcion INT,
    IN _fid_butaca INT,
    IN _fid_funcion INT,
    IN _estado_butaca ENUM('DISPONIBLE', 'OCUPADA', 'RESERVADA', 'MANTENIMIENTO'),
    IN _precio DOUBLE
)
BEGIN
	INSERT INTO ButacaFuncion(fid_butaca, fid_funcion, estado_butaca, precio) 
    VALUES(_fid_butaca, _fid_funcion, _estado_butaca, _precio);
    
    SET _id_butaca_funcion = @@last_insert_id;
END$

CREATE PROCEDURE LISTAR_BUTACAS_FUNCIONES_TODAS()
BEGIN
	SELECT bf.id_butaca_funcion, bf.fid_butaca, b.fila, b.columna, b.discapacitado, bf.fid_funcion, bf.estado_butaca, bf.precio, bf.activo 
    FROM Butaca b 
    INNER JOIN ButacaFuncion bf ON b.id_butaca = bf.fid_butaca
    WHERE bf.activo = 1;
END$

CREATE PROCEDURE MODIFICAR_BUTACA_FUNCION(
	IN _id_butaca_funcion INT,
	IN _fid_butaca INT,
    IN _fid_funcion INT,
    IN _estado_butaca ENUM('DISPONIBLE', 'OCUPADA', 'RESERVADA', 'MANTENIMIENTO'),
    IN _precio DOUBLE
)
BEGIN
	UPDATE ButacaFuncion 
    SET fid_butaca = _fid_butaca,  fid_funcion = _fid_funcion, estado_butaca = _estado_butaca, precio = _precio
    WHERE id_butaca_funcion = _id_butaca_funcion;
END$

CREATE PROCEDURE LISTAR_BUTACA_FUNCION_X_ID(
	IN _id_butaca_funcion INT
)
BEGIN
	SELECT bf.id_butaca_funcion, b.fila, b.columna, b.discapacitado, bf.fid_butaca, bf.fid_funcion, bf.estado_butaca, bf.precio, bf.activo 
    FROM Butaca b 
    INNER JOIN ButacaFuncion bf ON b.id_butaca = bf.fid_butaca
    WHERE bf.id_butaca_funcion = _id_butaca_funcion AND bf.activo = 1;
END$

CREATE PROCEDURE ELIMINAR_BUTACA_FUNCION_X_ID (IN _id_butaca_funcion INT)
BEGIN
    UPDATE ButacaFuncion 
    SET activo = 0 
    WHERE id_butaca_funcion = _id_butaca_funcion;
END$

CREATE PROCEDURE ELIMINAR_BUTACAS_FUNCION_X_ID_FUNCION (
	IN _id_funcion INT
)
BEGIN
    UPDATE ButacaFuncion
    SET activo = 0 
    WHERE fid_funcion = _id_funcion;
END$

CREATE PROCEDURE OBTENER_BUTACAS_X_FUNCION(IN _id_funcion INT)
BEGIN
    SELECT 
        b.id_butaca, b.fila,b.columna,b.discapacitado,bf.id_butaca_funcion,bf.precio,bf.estado_butaca
    FROM Butaca b
    INNER JOIN ButacaFuncion bf ON b.id_butaca = bf.fid_butaca
    WHERE bf.fid_funcion = _id_funcion
    AND bf.activo = 1  AND b.activo = 1 
    ORDER BY b.fila, b.columna;
END $