-- Drops de Sede
DROP PROCEDURE IF EXISTS INSERTAR_SEDE;
DROP PROCEDURE IF EXISTS LISTAR_SEDES_TODAS;
DROP PROCEDURE IF EXISTS MODIFICAR_SEDE;
DROP PROCEDURE IF EXISTS LISTAR_SEDE_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_SEDE_X_ID;

-- Procedimientos de Sede
DELIMITER $
CREATE PROCEDURE INSERTAR_SEDE(
    OUT _id_sede INT,
    IN _nombre VARCHAR(100),
    IN _ubicacion VARCHAR(100)
)
BEGIN
    INSERT INTO Sede(nombre, ubicacion) 
    VALUES(_nombre, _ubicacion);
    SET _id_sede = @@last_insert_id;
END$

CREATE PROCEDURE LISTAR_SEDES_TODAS()
BEGIN
    SELECT s.id_sede, s.nombre, s.ubicacion, s.activo 
    FROM Sede s
    WHERE s.activo = 1;
END$

CREATE PROCEDURE MODIFICAR_SEDE(
    IN _id_sede INT,
    IN _nombre VARCHAR(100),
    IN _ubicacion VARCHAR(100)
)
BEGIN
    UPDATE Sede 
    SET nombre = _nombre, ubicacion = _ubicacion
    WHERE id_sede = _id_sede;
END$

CREATE PROCEDURE LISTAR_SEDE_X_ID(
    IN _id_sede INT
)
BEGIN
    SELECT s.id_sede, s.nombre, s.ubicacion, s.activo 
    FROM Sede s 
    WHERE s.id_sede = _id_sede AND s.activo = 1;
END$

CREATE PROCEDURE ELIMINAR_SEDE_X_ID(IN _id_sede INT)
BEGIN
    UPDATE Sede 
    SET activo = 0 
    WHERE id_sede = _id_sede;
END$
