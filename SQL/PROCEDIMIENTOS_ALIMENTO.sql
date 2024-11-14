-- Drops de Alimento
DROP PROCEDURE IF EXISTS INSERTAR_ALIMENTO;
DROP PROCEDURE IF EXISTS LISTAR_ALIMENTOS_TODOS;
DROP PROCEDURE IF EXISTS MODIFICAR_ALIMENTO;
DROP PROCEDURE IF EXISTS LISTAR_ALIMENTO_X_ID;
DROP PROCEDURE IF EXISTS LISTAR_ALIMENTO_X_NOMBRE;
DROP PROCEDURE IF EXISTS ELIMINAR_ALIMENTO_X_ID;

-- Procedimientos de Alimento
DELIMITER $
CREATE PROCEDURE INSERTAR_ALIMENTO(
    OUT _id_alimento INT,
    IN _nombre VARCHAR(100),
    IN _precio DOUBLE,
    IN _pesoPromedio DOUBLE,
    IN _tipo_alimento ENUM('SNACK', 'CANCHA', 'POSTRE'),
	IN _imagen_link VARCHAR(255),
	IN _tipo CHAR
)
BEGIN
    INSERT INTO Consumible(nombre, precio, imagen_link, tipo) 
    VALUES(_nombre, _precio, _imagen_link, _tipo);
    SET _id_alimento = @@last_insert_id;
    INSERT INTO Alimento(id_alimento, pesoPromedio, tipo_alimento) 
    VALUES(_id_alimento, _pesoPromedio, _tipo_alimento);
END$

CREATE PROCEDURE LISTAR_ALIMENTOS_TODOS()
BEGIN
    SELECT a.id_alimento, c.nombre, c.precio, a.pesoPromedio, a.tipo_alimento, c.activo, c.imagen_link, c.tipo 
    FROM Consumible c 
    INNER JOIN Alimento a ON c.id_consumible = a.id_alimento
    WHERE c.activo = 1;
END$

CREATE PROCEDURE MODIFICAR_ALIMENTO(
    IN _id_alimento INT,
    IN _nombre VARCHAR(100),
    IN _precio DOUBLE,
    IN _pesoPromedio DOUBLE,
    IN _tipo_alimento ENUM('SNACK', 'CANCHA', 'POSTRE'),
	IN _tipo CHAR,
	IN _imagen_link VARCHAR(255)
)
BEGIN
    UPDATE Consumible 
    SET nombre = _nombre, precio = _precio, tipo = _tipo, imagen_link = _imagen_link
    WHERE id_consumible = _id_alimento;
    
    UPDATE Alimento 
    SET pesoPromedio = _pesoPromedio, tipo_alimento = _tipo_alimento 
    WHERE id_alimento = _id_alimento;
END$

CREATE PROCEDURE LISTAR_ALIMENTO_X_ID(
    IN _id_alimento INT
)
BEGIN
    SELECT a.id_alimento, c.nombre, c.precio, a.pesoPromedio, a.tipo_alimento, c.activo, c.tipo, c.imagen_link 
    FROM Consumible c 
    INNER JOIN Alimento a ON c.id_consumible = a.id_alimento 
    WHERE a.id_alimento = _id_alimento AND c.activo = 1;
END$

CREATE PROCEDURE LISTAR_ALIMENTO_X_NOMBRE(
    IN _nombre_alimento VARCHAR(150)
)
BEGIN
    SELECT a.id_alimento, c.nombre, c.precio, a.pesoPromedio, a.tipo_alimento, c.activo, c.tipo, c.imagen_link 
    FROM Consumible c 
    INNER JOIN Alimento a ON c.id_consumible = a.id_alimento 
    WHERE c.activo = 1 AND c.nombre LIKE CONCAT('%',_nombre_alimento,'%');
END$

CREATE PROCEDURE ELIMINAR_ALIMENTO_X_ID (IN _id_alimento INT)
BEGIN
    UPDATE Consumible 
    SET activo = 0 
    WHERE id_consumible = _id_alimento;
END$
