-- Drops de Administrador
DROP PROCEDURE IF EXISTS INSERTAR_ADMINISTRADOR;
DROP PROCEDURE IF EXISTS LISTAR_ADMINISTRADORES_TODOS;
DROP PROCEDURE IF EXISTS MODIFICAR_ADMINISTRADOR;
DROP PROCEDURE IF EXISTS LISTAR_ADMINISTRADOR_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_ADMINISTRADOR_X_ID;

-- Procedimientos de Administradores
DELIMITER $
CREATE PROCEDURE INSERTAR_ADMINISTRADOR(
	OUT _id_administrador INT,
    IN _dni VARCHAR(20),
    IN _nombres VARCHAR(100),
    IN _primer_apellido VARCHAR(60),
    IN _segundo_apellido VARCHAR(60),
    IN _genero CHAR,
    IN _fecha_nacimiento DATE,
    IN _codigo VARCHAR(50)
)
BEGIN
	INSERT INTO Usuario(dni, nombres, primer_apellido, segundo_apellido, genero, fecha_nacimiento) 
    VALUES(_dni, _nombres, _primer_apellido, _segundo_apellido, _genero, _fecha_nacimiento);
    
    SET _id_administrador = @@last_insert_id;
    
    INSERT INTO Administrador(id_administrador, codigo) 
    VALUES(_id_administrador, _codigo);
END$

CREATE PROCEDURE LISTAR_ADMINISTRADORES_TODOS()
BEGIN
	SELECT a.id_administrador, u.dni, u.nombres, u.primer_apellido, u.segundo_apellido, u.genero, u.fecha_nacimiento, a.codigo, u.activo 
    FROM Usuario u 
    INNER JOIN Administrador a ON u.id_usuario = a.id_administrador
    WHERE u.activo = 1;
END$

CREATE PROCEDURE MODIFICAR_ADMINISTRADOR(
	IN _id_administrador INT,
    IN _codigo VARCHAR(50),
    IN _dni VARCHAR(20),
    IN _nombres VARCHAR(100),
    IN _primer_apellido VARCHAR(60),
    IN _segundo_apellido VARCHAR(60),
    IN _genero CHAR,
    IN _fecha_nacimiento DATE
)
BEGIN
	UPDATE Usuario 
    SET dni = _dni, nombres = _nombres, primer_apellido = _primer_apellido, segundo_apellido = _segundo_apellido, genero = _genero, fecha_nacimiento = _fecha_nacimiento
    WHERE id_usuario = _id_administrador;
    
	UPDATE Administrador 
    SET codigo = _codigo
    WHERE id_administrador = _id_administrador;
END$

CREATE PROCEDURE LISTAR_ADMINISTRADOR_X_ID(
	IN _id_administrador INT
)
BEGIN
	SELECT a.id_administrador, u.dni, u.nombres, u.primer_apellido, u.segundo_apellido, u.genero, u.fecha_nacimiento, a.codigo, u.activo 
    FROM Usuario u 
    INNER JOIN Administrador a ON u.id_usuario = a.id_administrador
    WHERE a.id_administrador = _id_administrador AND u.activo = 1;
END$

CREATE PROCEDURE ELIMINAR_ADMINISTRADOR_X_ID(IN _id_administrador INT)
BEGIN
    UPDATE Usuario 
    SET activo = 0 
    WHERE id_usuario = _id_administrador;
END$
