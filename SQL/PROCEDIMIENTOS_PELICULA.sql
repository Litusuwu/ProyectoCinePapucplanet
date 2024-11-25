-- Drops de Pelicula
DROP PROCEDURE IF EXISTS INSERTAR_PELICULA;
DROP PROCEDURE IF EXISTS LISTAR_PELICULAS_TODAS;
DROP PROCEDURE IF EXISTS MODIFICAR_PELICULA;
DROP PROCEDURE IF EXISTS LISTAR_PELICULA_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_PELICULA_X_ID;
DROP PROCEDURE IF EXISTS ListarPeliculasConFuncionesActivas;
DROP PROCEDURE IF EXISTS LISTAR_GENEROS_ENUM;
-- Procedimientos de Película
DELIMITER $
CREATE PROCEDURE INSERTAR_PELICULA(
    OUT _id_pelicula INT,
    IN _titulo VARCHAR(60),
    IN _duracion INT,
    IN _genero ENUM('ACCION', 'DRAMA', 'COMEDIA', 'DOCUMENTAL'),
    IN _sinopsis VARCHAR(1000),
    IN _imagen_link VARCHAR(255)
)
BEGIN
    INSERT INTO Pelicula(titulo, duracion, genero, sinopsis, imagen_link) 
    VALUES(_titulo, _duracion, _genero, _sinopsis, _imagen_link);
    SET _id_pelicula = @@last_insert_id;
END$

CREATE DEFINER=`admin`@`%` PROCEDURE `LISTAR_PELICULAS_TODAS`()
BEGIN
    SELECT 
        p.id_pelicula, p.titulo,p.duracion,p.genero,p.sinopsis,p.imagen_link,
        f.id_funcion,f.horaInicio,f.horaFin,f.dia,
        s.id_sala,s.capacidad,s.numero_sala,
        sd.id_sede,sd.ubicacion,sd.nombre
    FROM Pelicula p
    LEFT JOIN Funcion f ON p.id_pelicula = f.fid_pelicula
    LEFT JOIN Sala s ON f.fid_sala = s.id_sala
    LEFT JOIN Sede sd ON s.fid_sede = sd.id_sede
    WHERE p.activo = 1 AND f.activo = 1 AND s.activo = 1 AND sd.activo = 1
    AND f.dia >= DATE(DATE_ADD(NOW(), INTERVAL -5 HOUR));
END$

CREATE PROCEDURE MODIFICAR_PELICULA(
    IN _id_pelicula INT,
    IN _titulo VARCHAR(60),
    IN _duracion INT,
    IN _genero ENUM('ACCION', 'DRAMA', 'COMEDIA', 'DOCUMENTAL'),
    IN _sinopsis VARCHAR(1000),
    IN _imagen_link VARCHAR(255)
)
BEGIN
    UPDATE Pelicula 
    SET titulo = _titulo, duracion = _duracion, genero = _genero, sinopsis = _sinopsis, imagen_link = _imagen_link
    WHERE id_pelicula = _id_pelicula;
END$

CREATE PROCEDURE LISTAR_PELICULA_X_ID(
    IN _id_pelicula INT
)
BEGIN
    SELECT p.id_pelicula, p.titulo, p.duracion, p.genero, p.sinopsis, p.imagen_link, p.activo 
    FROM Pelicula p 
    WHERE p.id_pelicula = _id_pelicula AND p.activo = 1;
END$

CREATE PROCEDURE ELIMINAR_PELICULA_X_ID (IN _id_pelicula INT)
BEGIN
    UPDATE Pelicula 
    SET activo = 0 
    WHERE id_pelicula = _id_pelicula;
END$

CREATE PROCEDURE LISTAR_PELICULA_X_NOMBRE(
	IN _nombre VARCHAR(100)
)
BEGIN
	SELECT p.id_pelicula, p.titulo, p.duracion, p.genero, p.imagen_link 
    FROM Pelicula p 
    WHERE p.activo = 1 AND p.titulo LIKE CONCAT('%',_nombre,'%');
END$

-- NEW PROCEDURE:
CREATE PROCEDURE ListarPeliculasConFuncionesActivas()
BEGIN
    SELECT 
        p.id_pelicula,p.titulo,p.duracion,p.genero,p.sinopsis,p.imagen_link,
        f.id_funcion,f.horaInicio,f.horaFin,f.dia,f.fid_sala,
		sd.id_sede,sd.nombre
    FROM 
        Pelicula p
    LEFT JOIN Funcion f ON p.id_pelicula = f.fid_pelicula
    LEFT JOIN Sala s ON f.fid_sala = s.id_sala
    LEFT JOIN Sede sd ON s.fid_sede = sd.id_sede
    WHERE p.activo = 1 AND f.activo = 1 AND s.activo = 1 AND sd.activo = 1 AND f.dia >= DATE(DATE_ADD(NOW(), INTERVAL -5 HOUR)); -- Solo funciones a partir de hoy
END$
-- Genero es un enum de peliculas
DELIMITER $
CREATE PROCEDURE LISTAR_GENEROS_ENUM()
BEGIN
    SELECT SUBSTRING(COLUMN_TYPE, 6, LENGTH(COLUMN_TYPE) - 6) AS generos
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'Pelicula'
      AND COLUMN_NAME = 'genero'
      AND TABLE_SCHEMA = DATABASE();
END $