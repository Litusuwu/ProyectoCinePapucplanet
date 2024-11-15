-- Drops de Butaca
DROP PROCEDURE IF EXISTS INSERTAR_BUTACA;
DROP PROCEDURE IF EXISTS LISTAR_BUTACAS_TODAS;
DROP PROCEDURE IF EXISTS MODIFICAR_BUTACA;
DROP PROCEDURE IF EXISTS LISTAR_BUTACA_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_BUTACA_X_ID;
DROP PROCEDURE IF EXISTS LISTAR_BUTACAS_X_SALA;
DROP PROCEDURE IF EXISTS ELIMINAR_BUTACAS_X_SALA_ID;


-- Procedimientos de Butaca
DELIMITER $
CREATE PROCEDURE INSERTAR_BUTACA(
    OUT _id_butaca INT,
    IN _fila CHAR(1),
    IN _columna INT,
    IN _discapacitado BOOLEAN,
    IN _fid_sala INT
)
BEGIN
    INSERT INTO Butaca(fila, columna, discapacitado, fid_sala) 
    VALUES(_fila, _columna, _discapacitado, _fid_sala);
    SET _id_butaca = @@last_insert_id;
END$

CREATE PROCEDURE LISTAR_BUTACAS_TODAS()
BEGIN
    SELECT b.id_butaca, b.fila, b.columna, b.discapacitado, b.fid_sala, b.activo 
    FROM Butaca b
    WHERE b.activo = 1;
END$

CREATE PROCEDURE MODIFICAR_BUTACA(
    IN _id_butaca INT,
    IN _fila CHAR(1),
    IN _columna INT,
    IN _discapacitado BOOLEAN,
    IN _fid_sala INT
)
BEGIN
    UPDATE Butaca 
    SET fila = _fila, columna = _columna, discapacitado = _discapacitado, fid_sala = _fid_sala
    WHERE id_butaca = _id_butaca;
END$

CREATE PROCEDURE LISTAR_BUTACA_X_ID(
    IN _id_butaca INT
)
BEGIN
    SELECT b.id_butaca, b.fila, b.columna, b.discapacitado, b.fid_sala, b.activo 
    FROM Butaca b 
    WHERE b.id_butaca = _id_butaca AND b.activo = 1;
END$

CREATE PROCEDURE ELIMINAR_BUTACA_X_ID (IN _id_butaca INT)
BEGIN
    UPDATE Butaca 
    SET activo = 0 
    WHERE id_butaca = _id_butaca;
END$

CREATE PROCEDURE LISTAR_BUTACAS_X_SALA(
	IN _id_sala INT
)
BEGIN
    SELECT b.id_butaca, b.fila, b.columna, b.discapacitado, b.fid_sala
    FROM Butaca b
    WHERE b.fid_sala = _id_sala AND b.activo = 1;
END$

CREATE PROCEDURE ELIMINAR_BUTACAS_X_SALA_ID (IN _id_sala INT)
BEGIN
    UPDATE Butaca 
    SET activo = 0 
    WHERE fid_sala = _id_sala;
END$