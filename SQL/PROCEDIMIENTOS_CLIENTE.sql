-- Drops de Cliente
DROP PROCEDURE IF EXISTS INSERTAR_CLIENTE;
DROP PROCEDURE IF EXISTS LISTAR_CLIENTES_TODOS;
DROP PROCEDURE IF EXISTS MODIFICAR_CLIENTE;
DROP PROCEDURE IF EXISTS LISTAR_CLIENTE_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_CLIENTE_X_ID;

-- Procedimientos de Cliente
DELIMITER $
CREATE PROCEDURE INSERTAR_CLIENTE(
	OUT _id_cliente INT,
    IN _dni VARCHAR(20),
    IN _nombres VARCHAR(100),
    IN _primer_apellido VARCHAR(60),
    IN _segundo_apellido VARCHAR(60),
	IN _genero CHAR,
    IN _fecha_nacimiento DATE,
    IN _fid_sede INT
)
BEGIN
	INSERT INTO Usuario(dni, nombres, primer_apellido, segundo_apellido, genero, fecha_nacimiento) VALUES(_dni, _nombres, _primer_apellido, _segundo_apellido, _genero, _fecha_nacimiento);
    SET _id_cliente = @@last_insert_id;
    INSERT INTO Cliente(id_cliente, fid_sede) VALUES(_id_cliente, _fid_sede);
END$

CREATE PROCEDURE LISTAR_CLIENTES_TODOS()
BEGIN
	SELECT c.id_cliente, u.dni, u.nombres, u.primer_apellido, u.segundo_apellido, u.genero, u.fecha_nacimiento, c.fid_sede, u.activo 
    FROM Usuario u 
    INNER JOIN Cliente c ON u.id_usuario = c.id_cliente
    WHERE u.activo = 1;
END$

CREATE PROCEDURE MODIFICAR_CLIENTE(
	IN _id_cliente INT,
    IN _dni VARCHAR(20),
    IN _nombres VARCHAR(100),
    IN _primer_apellido VARCHAR(60),
    IN _segundo_apellido VARCHAR(60),
	IN _genero CHAR,
    IN _fecha_nacimiento DATE,
    IN _fid_sede INT
)
BEGIN
	UPDATE Usuario SET dni = _dni, nombres = _nombres, primer_apellido = _primer_apellido, segundo_apellido = _segundo_apellido, genero = _genero, fecha_nacimiento = _fecha_nacimiento WHERE id_usuario = _id_cliente;
    UPDATE Cliente SET fid_sede = _fid_sede WHERE id_cliente = _id_cliente;
END$

CREATE PROCEDURE LISTAR_CLIENTE_X_ID(
	IN _id_cliente INT
)
BEGIN
	SELECT c.id_cliente, u.dni, u.nombres, u.primer_apellido, u.segundo_apellido, u.genero, u.fecha_nacimiento, c.fid_sede, u.activo 
    FROM Usuario u 
    INNER JOIN Cliente c ON u.id_usuario = c.id_cliente 
    WHERE c.id_cliente = _id_cliente AND u.activo = 1;
END$

CREATE PROCEDURE ELIMINAR_CLIENTE_X_ID(IN _id_cliente INT)
BEGIN
    UPDATE Usuario 
    SET activo = 0 
    WHERE id_usuario = _id_cliente;
END$