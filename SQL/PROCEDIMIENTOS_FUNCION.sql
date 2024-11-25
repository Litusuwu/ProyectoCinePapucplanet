-- Drops de Funcion
DROP PROCEDURE IF EXISTS INSERTAR_FUNCION;
DROP PROCEDURE IF EXISTS LISTAR_FUNCIONES_TODAS;
DROP PROCEDURE IF EXISTS MODIFICAR_FUNCION;
DROP PROCEDURE IF EXISTS LISTAR_FUNCION_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_FUNCION_X_ID;
DROP PROCEDURE IF EXISTS OBTENER_FUNCIONES_POR_PELICULA;
DROP PROCEDURE IF EXISTS LISTAR_FUNCIONES_POR_FECHA;
DROP PROCEDURE IF EXISTS VERIFICAR_DISPONIBILIDAD_HORARIO_DE_FUNCIONES;
DROP PROCEDURE IF EXISTS GenerarFuncionesBase;

-- Procedimientos de Funcion
DELIMITER $
CREATE PROCEDURE INSERTAR_FUNCION(
    OUT _id_funcion INT,
    IN _horaInicio TIME,
    IN _horaFin TIME,
    IN _dia DATE,
    IN _fid_sala INT,
    IN _fid_pelicula INT
)
BEGIN
    INSERT INTO Funcion(horaInicio, horaFin, dia, fid_sala, fid_pelicula) 
    VALUES(_horaInicio, _horaFin, _dia, _fid_sala, _fid_pelicula);
    SET _id_funcion = @@last_insert_id;
END$

CREATE PROCEDURE LISTAR_FUNCIONES_TODAS()
BEGIN
    SELECT f.id_funcion, f.horaInicio, f.horaFin, f.dia, f.fid_sala, f.fid_pelicula, p.titulo, p.genero, p.duracion, 
    p.sinopsis, p.imagen_link, sa.numero_sala, se.id_sede, se.nombre as nombre_sede
    FROM Funcion f INNER JOIN Pelicula p ON f.fid_pelicula = p.id_pelicula INNER JOIN Sala sa ON f.fid_sala = sa.id_sala INNER JOIN Sede se ON se.id_sede = sa.fid_sede
    WHERE f.activo = 1;
END$

CREATE PROCEDURE MODIFICAR_FUNCION(
    IN _id_funcion INT,
    IN _horaInicio TIME,
    IN _horaFin TIME,
    IN _dia DATE,
    IN _fid_sala INT,
    IN _fid_pelicula INT
)
BEGIN
    UPDATE Funcion 
    SET horaInicio = _horaInicio, horaFin = _horaFin, dia = _dia, fid_sala = _fid_sala, fid_pelicula = _fid_pelicula
    WHERE id_funcion = _id_funcion;
END$

CREATE PROCEDURE LISTAR_FUNCION_X_ID(
    IN _id_funcion INT
)
BEGIN
    SELECT f.id_funcion, f.horaInicio, f.horaFin, f.dia, f.fid_sala, f.fid_pelicula, p.titulo, p.genero, p.duracion, 
    p.sinopsis, p.imagen_link, sa.numero_sala, se.id_sede, se.nombre as nombre_sede
    FROM Funcion f INNER JOIN Pelicula p ON f.fid_pelicula = p.id_pelicula INNER JOIN Sala sa ON f.fid_sala = sa.id_sala INNER JOIN Sede se ON se.id_sede = sa.fid_sede
    WHERE f.id_funcion = _id_funcion AND f.activo = 1;
END$

CREATE PROCEDURE ELIMINAR_FUNCION_X_ID (IN _id_funcion INT)
BEGIN
    UPDATE Funcion 
    SET activo = 0 
    WHERE id_funcion = _id_funcion;
END$

CREATE PROCEDURE OBTENER_FUNCIONES_POR_PELICULA(
    IN _id_pelicula INT
)
BEGIN
    SELECT f.id_funcion, f.horaInicio, f.horaFin, f.dia, f.fid_sala, f.fid_pelicula, p.titulo, p.genero, p.duracion, 
    p.sinopsis, p.imagen_link, sa.numero_sala, se.id_sede, se.nombre as nombre_sede
    FROM Funcion f INNER JOIN Pelicula p ON f.fid_pelicula = p.id_pelicula INNER JOIN Sala sa ON f.fid_sala = sa.id_sala INNER JOIN Sede se ON se.id_sede = sa.fid_sede
    WHERE fid_pelicula = _id_pelicula 
    AND p.activo = 1 AND sa.activo = 1 AND se.activo = 1;
END$

CREATE PROCEDURE LISTAR_FUNCIONES_POR_FECHA(
	IN _dia DATE, 
    IN _fid_pelicula INT
)
BEGIN
	SELECT f.id_funcion, f.horaInicio, f.horaFin, f.dia, f.fid_sala, f.fid_pelicula, p.titulo, p.genero, p.duracion, 
    p.sinopsis, p.imagen_link, sa.numero_sala, se.id_sede, se.nombre as nombre_sede
    FROM Funcion f INNER JOIN Pelicula p ON f.fid_pelicula = p.id_pelicula INNER JOIN Sala sa ON f.fid_sala = sa.id_sala INNER JOIN Sede se ON se.id_sede = sa.fid_sede
    WHERE f.dia = _dia AND f.fid_pelicula = _fid_pelicula AND f.activo = 1;
END$

CREATE PROCEDURE VERIFICAR_DISPONIBILIDAD_HORARIO_DE_FUNCIONES(
    IN _dia DATE,
    IN _horaInicio TIME,
    IN _horaFin TIME,
    IN _fid_sala INT
)
BEGIN
    DECLARE overlap_count INT;

    -- Verificar si hay funciones que se crucen en el mismo día y sala
    SELECT COUNT(*)
    INTO overlap_count
    FROM Funcion
    WHERE dia = _dia AND fid_sala = _fid_sala AND activo = 1
      AND ((_horaInicio < horaFin AND _horaFin > horaInicio));

    -- Devolver 1 si hay cruce de horarios, 0 si no hay cruce
    IF overlap_count > 0 THEN
        SELECT 1 AS disponibilidad;
    ELSE
        SELECT 0 AS disponibilidad;
    END IF;
END$

CREATE PROCEDURE GenerarFuncionesBase()
BEGIN
    DECLARE mes INT DEFAULT 1;
    DECLARE dia INT;
    DECLARE total_peliculas INT;

    -- Obtener la cantidad total de películas disponibles
    SELECT COUNT(*) INTO total_peliculas FROM Pelicula;

    WHILE mes <= 10 DO
        SET dia = 1;

        -- Generar 6 funciones por mes, usando películas cíclicamente
        CALL INSERTAR_FUNCION(@id_funcion, '14:00:00', '16:00:00', DATE(CONCAT('2024-', mes, '-', dia)), 1, MOD(mes - 1, total_peliculas) + 1);
        CALL INSERTAR_FUNCION(@id_funcion, '16:15:00', '18:15:00', DATE(CONCAT('2024-', mes, '-', dia + 1)), 2, MOD(mes, total_peliculas) + 1);
        CALL INSERTAR_FUNCION(@id_funcion, '18:30:00', '20:30:00', DATE(CONCAT('2024-', mes, '-', dia + 2)), 3, MOD(mes + 1, total_peliculas) + 1);
        CALL INSERTAR_FUNCION(@id_funcion, '20:45:00', '22:45:00', DATE(CONCAT('2024-', mes, '-', dia + 3)), 4, MOD(mes + 2, total_peliculas) + 1);
        CALL INSERTAR_FUNCION(@id_funcion, '12:00:00', '14:00:00', DATE(CONCAT('2024-', mes, '-', dia + 4)), 5, MOD(mes + 3, total_peliculas) + 1);
        CALL INSERTAR_FUNCION(@id_funcion, '22:00:00', '00:00:00', DATE(CONCAT('2024-', mes, '-', dia + 5)), 6, MOD(mes + 4, total_peliculas) + 1);

        -- Avanzar al siguiente mes
        SET mes = mes + 1;
    END WHILE;
END$

