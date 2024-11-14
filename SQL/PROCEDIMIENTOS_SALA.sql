-- Drops de Sala
DROP PROCEDURE IF EXISTS INSERTAR_SALA;
DROP PROCEDURE IF EXISTS LISTAR_SALAS_TODAS;
DROP PROCEDURE IF EXISTS MODIFICAR_SALA;
DROP PROCEDURE IF EXISTS LISTAR_SALA_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_SALA_X_ID;
DROP PROCEDURE IF EXISTS OBTENER_SALAS_POR_SEDE;

-- Procedimientos de Sala
DELIMITER $
CREATE PROCEDURE INSERTAR_SALA(
    OUT _id_sala INT,
    IN _numero_sala INT,
    IN _fid_sede INT,
    IN _capacidad INT,
    IN _numcol INT,
    IN _numfilas INT
)
BEGIN
    INSERT INTO Sala(numero_sala, fid_sede, capacidad, numcol, numfilas) 
    VALUES(_numero_sala, _fid_sede, _capacidad, _numcol, _numfilas);
    SET _id_sala = @@last_insert_id;
END$

CREATE PROCEDURE LISTAR_SALAS_TODAS()
BEGIN
    SELECT s.id_sala, s.numero_sala, s.fid_sede,s.numcol, s.numfilas, s.capacidad, s.activo 
    FROM Sala s
    WHERE s.activo = 1;
END$

CREATE PROCEDURE MODIFICAR_SALA(
    IN _id_sala INT,
    IN _numero_sala INT,
    IN _fid_sede INT,
    IN _capacidad INT,
    IN _numcol INT,
    IN _numfilas INT
)
BEGIN
    UPDATE Sala 
    SET numero_sala = _numero_sala, fid_sede = _fid_sede, capacidad = _capacidad, numcol=_numcol, numfilas=_numfilas
    WHERE id_sala = _id_sala;
END$

CREATE PROCEDURE LISTAR_SALA_X_ID(
	IN _id_sala INT
)
BEGIN
	SELECT s.id_sala, s.numero_sala, s.fid_sede,s.numcol, s.numfilas, s.capacidad, s.activo 
	FROM Sala s 
	WHERE s.id_sala = _id_sala AND s.activo = 1;
END$

CREATE PROCEDURE ELIMINAR_SALA_X_ID (IN _id_sala INT)
BEGIN
	UPDATE Sala 
	SET activo = 0 
	WHERE id_sala = _id_sala;
END$

CREATE PROCEDURE OBTENER_SALAS_POR_SEDE(
    IN _id_sede INT
)
BEGIN
    SELECT s.id_sala, s.numero_sala,s.numcol, s.numfilas, s.capacidad, s.activo 
    FROM Sala s
    WHERE s.fid_sede = _id_sede AND s.activo = 1;
END$
