-- Drops de LineaBoleta
DROP PROCEDURE IF EXISTS INSERTAR_LINEA_BOLETA;
DROP PROCEDURE IF EXISTS LISTAR_LINEAS_BOLETAS_TODAS;
DROP PROCEDURE IF EXISTS MODIFICAR_LINEA_BOLETA;
DROP PROCEDURE IF EXISTS LISTAR_LINEA_BOLETA_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_LINEA_BOLETA_X_ID;
DROP PROCEDURE IF EXISTS LISTAR_LINEA_BOLETA_X_BOLETA;
-- DROP PROCEDURE IF EXISTS INFORMACION_EXTRA_LINEA_BOLETA;


-- Procedimientos de LineaBoleta
DELIMITER $
CREATE PROCEDURE INSERTAR_LINEA_BOLETA(
	OUT _id_linea_boleta INT,
    IN _fid_boleta INT,
    IN _fid_consumible INT,
    IN _fid_butaca_funcion INT,
    IN _cantidad INT,
    IN _subtotal DOUBLE
)
BEGIN
    IF (_fid_consumible = 0 AND _fid_butaca_funcion = 0) OR (_fid_consumible != 0 AND _fid_butaca_funcion != 0) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: Debe establecer solo uno de los dos valores, fid_consumible o fid_butaca_funcion.';
    ELSE
        INSERT INTO LineaBoleta(fid_boleta, fid_consumible, fid_butaca_funcion, cantidad, subtotal) 
        VALUES(_fid_boleta, 
               CASE WHEN _fid_consumible = 0 THEN NULL ELSE _fid_consumible END, 
               CASE WHEN _fid_butaca_funcion = 0 THEN NULL ELSE _fid_butaca_funcion END, 
               _cantidad, _subtotal);
        
        SET _id_linea_boleta = @@last_insert_id;
    END IF;
END$

CREATE PROCEDURE LISTAR_LINEAS_BOLETAS_TODAS()
BEGIN
    SELECT 
        lb.id_linea_boleta,lb.fid_boleta, lb.cantidad, lb.subtotal, lb.activo AS linea_activa,
        -- Información del Consumible (si aplica)
        c.id_consumible, c.nombre AS nombre_consumible, c.precio AS precio_consumible,
        c.tipo AS tipo_consumible,
        -- Informacion si es alimento
        a.pesoPromedio, a.tipo_alimento,
        -- Informacion si es bebida
        be.onzas, be.tieneHielo,
        -- Información de la Butaca y la Función (si aplica)
        bf.id_butaca_funcion,
        b.fila AS fila_butaca, b.columna AS columna_butaca,
        b.discapacitado AS es_discapacitado,
        f.horaInicio AS funcion_horaInicio, f.horaFin AS funcion_horaFin,
        f.dia AS funcion_dia,
        bf.estado_butaca, bf.precio AS precio_butaca_funcion,
         -- Información de la Sala (si aplica)
        s.id_sala, s.numero_sala, s.numcol AS numero_columnas, s.numfilas AS numero_filas,
        s.capacidad AS capacidad_sala

    FROM LineaBoleta lb
    LEFT JOIN Consumible c ON lb.fid_consumible = c.id_consumible
    LEFT JOIN Alimento a ON lb.fid_consumible = a.id_alimento
    LEFT JOIN Bebida be ON lb.fid_consumible = be.id_bebida
    LEFT JOIN ButacaFuncion bf ON lb.fid_butaca_funcion = bf.id_butaca_funcion
    LEFT JOIN Butaca b ON bf.fid_butaca = b.id_butaca
    LEFT JOIN Funcion f ON bf.fid_funcion = f.id_funcion
    LEFT JOIN Sala s ON b.fid_sala = s.id_sala
    LEFT JOIN Pelicula p ON f.fid_pelicula = p.id_pelicula
	WHERE lb.activo = 1;
END$


CREATE PROCEDURE MODIFICAR_LINEA_BOLETA(
	IN _id_linea_boleta INT,
    IN _fid_boleta INT,
    IN _fid_consumible INT,
    IN _fid_butaca_funcion INT,
    IN _cantidad INT,
    IN _subtotal INT
)
BEGIN
	UPDATE LineaBoleta 
    SET fid_boleta = _fid_boleta, fid_consumible = _fid_consumible, fid_butaca_funcion = _fid_butaca_funcion, cantidad = _cantidad, subtotal = _subtotal
    WHERE id_linea_boleta = _id_linea_boleta;
END$

CREATE PROCEDURE LISTAR_LINEA_BOLETA_X_ID(
	IN _id_linea_boleta INT
)
BEGIN
	SELECT 
        lb.id_linea_boleta,lb.fid_boleta, lb.cantidad, lb.subtotal, lb.activo AS linea_activa,
        -- Información del Consumible (si aplica)
        c.id_consumible, c.nombre AS nombre_consumible, c.precio AS precio_consumible,
        c.tipo AS tipo_consumible,
        -- Informacion si es alimento
        a.pesoPromedio, a.tipo_alimento,
        -- Informacion si es bebida
        be.onzas, be.tieneHielo,
        -- Información de la Butaca y la Función (si aplica)
        bf.id_butaca_funcion,
        b.fila AS fila_butaca, b.columna AS columna_butaca,
        b.discapacitado AS es_discapacitado,
        f.horaInicio AS funcion_horaInicio, f.horaFin AS funcion_horaFin,
        f.dia AS funcion_dia,
        bf.estado_butaca, bf.precio AS precio_butaca_funcion,
         -- Información de la Sala (si aplica)
		s.id_sala, s.numero_sala, s.numcol AS numero_columnas, s.numfilas AS numero_filas,
        s.capacidad AS capacidad_sala
        
    FROM LineaBoleta lb
    LEFT JOIN Consumible c ON lb.fid_consumible = c.id_consumible
    LEFT JOIN Alimento a ON lb.fid_consumible = a.id_alimento
    LEFT JOIN Bebida be ON lb.fid_consumible = be.id_bebida
    LEFT JOIN ButacaFuncion bf ON lb.fid_butaca_funcion = bf.id_butaca_funcion
    LEFT JOIN Butaca b ON bf.fid_butaca = b.id_butaca
    LEFT JOIN Funcion f ON bf.fid_funcion = f.id_funcion
    LEFT JOIN Sala s ON b.fid_sala = s.id_sala
    LEFT JOIN Pelicula p ON f.fid_pelicula = p.id_pelicula
	WHERE lb.id_linea_boleta = _id_linea_boleta AND lb.activo = 1;
END$

CREATE PROCEDURE ELIMINAR_LINEA_BOLETA_X_ID (IN _id_linea_boleta INT)
BEGIN
    UPDATE LineaBoleta 
    SET activo = 0 
    WHERE id_linea_boleta = _id_linea_boleta;
END$

CREATE PROCEDURE LISTAR_LINEA_BOLETA_X_BOLETA (IN _id_boleta INT)
BEGIN
	SELECT 
        lb.id_linea_boleta,lb.fid_boleta, lb.cantidad, lb.subtotal, lb.activo AS linea_activa,
        -- Información del Consumible (si aplica)
        c.id_consumible, c.nombre AS nombre_consumible, c.precio AS precio_consumible,
        c.tipo AS tipo_consumible,
        -- Informacion si es alimento
        a.pesoPromedio, a.tipo_alimento,
        -- Informacion si es bebida
        be.onzas, be.tieneHielo,
        -- Información de la Butaca y la Función (si aplica)
        bf.id_butaca_funcion,
        b.fila AS fila_butaca, b.columna AS columna_butaca,
        b.discapacitado AS es_discapacitado,
        f.horaInicio AS funcion_horaInicio, f.horaFin AS funcion_horaFin,
        f.dia AS funcion_dia,
        bf.estado_butaca, bf.precio AS precio_butaca_funcion,
         -- Información de la Sala (si aplica)
        s.id_sala, s.numero_sala, s.numcol AS numero_columnas, s.numfilas AS numero_filas,
        s.capacidad AS capacidad_sala

    FROM LineaBoleta lb
    LEFT JOIN Consumible c ON lb.fid_consumible = c.id_consumible
    LEFT JOIN Alimento a ON lb.fid_consumible = a.id_alimento
    LEFT JOIN Bebida be ON lb.fid_consumible = be.id_bebida
    LEFT JOIN ButacaFuncion bf ON lb.fid_butaca_funcion = bf.id_butaca_funcion
    LEFT JOIN Butaca b ON bf.fid_butaca = b.id_butaca
    LEFT JOIN Funcion f ON bf.fid_funcion = f.id_funcion
    LEFT JOIN Sala s ON b.fid_sala = s.id_sala
    LEFT JOIN Pelicula p ON f.fid_pelicula = p.id_pelicula
	WHERE lb.fid_boleta = _id_boleta AND lb.activo = 1;
END$

