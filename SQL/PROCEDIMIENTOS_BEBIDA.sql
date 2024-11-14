-- Drops de Bebida
DROP PROCEDURE IF EXISTS INSERTAR_BEBIDA;
DROP PROCEDURE IF EXISTS LISTAR_BEBIDAS_TODAS;
DROP PROCEDURE IF EXISTS MODIFICAR_BEBIDA;
DROP PROCEDURE IF EXISTS LISTAR_BEBIDA_X_ID;
DROP PROCEDURE IF EXISTS LISTAR_BEBIDA_X_NOMBRE;
DROP PROCEDURE IF EXISTS ELIMINAR_BEBIDA_X_ID;

-- Procedimientos de Bebida
DELIMITER $
CREATE PROCEDURE INSERTAR_BEBIDA(
    OUT _id_bebida INT,
    IN _nombre VARCHAR(100),
    IN _precio DOUBLE,
    IN _onzas INT,
    IN _tieneHielo BOOLEAN,
	IN _imagen_link VARCHAR(255),
	IN _tipo CHAR
)
BEGIN
    INSERT INTO Consumible(nombre, precio, imagen_link, tipo) 
    VALUES(_nombre, _precio, _imagen_link, _tipo);
    SET _id_bebida = @@last_insert_id;
    INSERT INTO Bebida(id_bebida, onzas, tieneHielo) 
    VALUES(_id_bebida, _onzas, _tieneHielo);
END$

CREATE PROCEDURE LISTAR_BEBIDAS_TODAS()
BEGIN
    SELECT b.id_bebida, c.nombre, c.precio, b.onzas, b.tieneHielo, c.activo, c.imagen_link, c.tipo
    FROM Consumible c 
    INNER JOIN Bebida b ON c.id_consumible = b.id_bebida
    WHERE c.activo = 1;
END$

CREATE PROCEDURE MODIFICAR_BEBIDA(
    IN _id_bebida INT,
    IN _nombre VARCHAR(100),
    IN _precio DOUBLE,
    IN _onzas INT,
    IN _tieneHielo BOOLEAN,
	IN _imagen_link VARCHAR(255)
)
BEGIN
    UPDATE Consumible 
    SET nombre = _nombre, precio = _precio, imagen_link = _imagen_link
    WHERE id_consumible = _id_bebida;
    
    UPDATE Bebida 
    SET onzas = _onzas, tieneHielo = _tieneHielo
    WHERE id_bebida = _id_bebida;
END$

CREATE PROCEDURE LISTAR_BEBIDA_X_ID(
    IN _id_bebida INT
)
BEGIN
    SELECT b.id_bebida, c.nombre, c.precio, b.onzas, b.tieneHielo, c.activo, c.imagen_link, c.tipo 
    FROM Consumible c 
    INNER JOIN Bebida b ON c.id_consumible = b.id_bebida 
    WHERE b.id_bebida = _id_bebida AND c.activo = 1;
END$

CREATE PROCEDURE LISTAR_BEBIDA_X_NOMBRE(
    IN _nombre_bebida VARCHAR(150)
)
BEGIN
    SELECT b.id_bebida, c.nombre, c.precio, b.onzas, b.tieneHielo, c.activo, c.imagen_link, c.tipo 
    FROM Consumible c 
    INNER JOIN Bebida b ON c.id_consumible = b.id_bebida 
    WHERE c.activo = 1 AND c.nombre LIKE CONCAT('%',_nombre_bebida,'%');
END$

CREATE PROCEDURE ELIMINAR_BEBIDA_X_ID(IN _id_bebida INT)
BEGIN
    UPDATE Consumible 
    SET activo = 0 
    WHERE id_consumible = _id_bebida;
END$