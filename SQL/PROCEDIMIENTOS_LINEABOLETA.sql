-- Drops de LineaBoleta
DROP PROCEDURE IF EXISTS INSERTAR_LINEA_BOLETA;
DROP PROCEDURE IF EXISTS LISTAR_LINEAS_BOLETAS_TODAS;
DROP PROCEDURE IF EXISTS MODIFICAR_LINEA_BOLETA;
DROP PROCEDURE IF EXISTS LISTAR_LINEA_BOLETA_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_LINEA_BOLETA_X_ID;
DROP PROCEDURE IF EXISTS INFORMACION_EXTRA_LINEA_BOLETA;


-- Procedimientos de LineaBoleta
DELIMITER $
CREATE PROCEDURE INSERTAR_LINEA_BOLETA(
	OUT _id_linea_boleta INT,
    IN _fid_boleta INT,
    IN _fid_consumible INT,
    IN _fid_butaca_funcion INT,
    IN _cantidad INT,
    IN _subtotal INT
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
	SELECT lb.id_linea_boleta, lb.fid_boleta, lb.fid_consumible, lb.fid_butaca_funcion, lb.cantidad, lb.subtotal, lb.activo
    FROM LineaBoleta lb
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
	SELECT lb.id_linea_boleta, lb.fid_boleta, lb.fid_consumible, lb.fid_butaca_funcion, lb.cantidad, lb.subtotal, lb.activo
    FROM LineaBoleta lb
    WHERE lb.id_linea_boleta = _id_linea_boleta AND lb.activo = 1;
END$

CREATE PROCEDURE ELIMINAR_LINEA_BOLETA_X_ID (IN _id_linea_boleta INT)
BEGIN
    UPDATE LineaBoleta 
    SET activo = 0 
    WHERE id_linea_boleta = _id_linea_boleta;
END$

CREATE PROCEDURE INFORMACION_EXTRA_LINEA_BOLETA()
BEGIN
SELECT l.id_linea_boleta, l.fid_boleta, l.cantidad, l.subtotal, l.activo, c.id_consumible, a.id_alimento, be.id_bebida, c.nombre, c.precio,
	b.fechaCompra,bf.fid_butaca,bu.columna,bu.fila,bu.discapacitado
    FROM LineaBoleta l
    LEFT JOIN Consumible c ON l.fid_consumible = c.id_consumible
    LEFT JOIN Alimento a ON l.fid_consumible = a.id_alimento
    LEFT JOIN Bebida be ON l.fid_consumible = be.id_bebida
    LEFT JOIN Boleta b ON l.fid_boleta = b.id_boleta
    LEFT JOIN ButacaFuncion bf on l.fid_butaca_funcion = bf.id_butaca_funcion
    LEFT JOIN Butaca bu on bu.id_butaca=bf.fid_butaca
    LEFT JOIN Funcion f on f.id_funcion=bu.fid_sala;
END$
