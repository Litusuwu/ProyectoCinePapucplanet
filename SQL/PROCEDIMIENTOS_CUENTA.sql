-- Drops de Cuenta
DROP PROCEDURE IF EXISTS INSERTAR_CUENTA;
DROP PROCEDURE IF EXISTS LISTAR_CUENTAS_TODAS;
DROP PROCEDURE IF EXISTS MODIFICAR_CUENTA;
DROP PROCEDURE IF EXISTS LISTAR_CUENTA_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_CUENTA_X_ID;
DROP PROCEDURE IF EXISTS VERIFICAR_CUENTA;
DROP PROCEDURE IF exists VERIFICAR_CUENTA_FINAL;


-- Procedimientos de Cuenta
DELIMITER $
CREATE PROCEDURE INSERTAR_CUENTA(
    OUT _id_cuenta INT,
    IN _contrasena VARCHAR(100),
    IN _correo VARCHAR(100),
    IN _id_usuario INT
)
BEGIN
	UPDATE Usuario
    SET correo = _correo, contrasena = MD5(_contrasena) WHERE id_usuario = _id_usuario;
    SET _id_cuenta = _id_usuario;
END$

CREATE PROCEDURE LISTAR_CUENTAS_TODAS()
BEGIN
    SELECT u.id_usuario, u.contrasena, u.correo, u.activo,
           a.id_administrador, a.codigo,  
           c.id_cliente                   
    FROM Usuario u
    LEFT JOIN Administrador a ON u.id_usuario = a.id_administrador
    LEFT JOIN Cliente c ON u.id_usuario = c.id_cliente
    WHERE u.correo IS NOT NULL AND u.activo = 1;
END$

CREATE PROCEDURE MODIFICAR_CUENTA(
    IN _id_cuenta INT,
    IN _contrasena VARCHAR(100),
    IN _correo VARCHAR(100)
)
BEGIN
    UPDATE Usuario 
    SET contrasena = MD5(_contrasena), correo = _correo
    WHERE id_usuario = _id_cuenta;
END$

CREATE PROCEDURE LISTAR_CUENTA_X_ID(IN _id_cuenta INT)
BEGIN
    SELECT u.id_usuario, u.nombres,u.primer_apellido,u.segundo_apellido,
		   u.contrasena, u.correo, u.activo,
           a.id_administrador, a.codigo,  
           c.id_cliente 
    FROM Usuario u
    LEFT JOIN Administrador a ON u.id_usuario = a.id_administrador
    LEFT JOIN Cliente c ON u.id_usuario = c.id_cliente
    WHERE u.id_usuario = _id_cuenta AND u.correo IS NOT NULL AND u.activo = 1;
END$

CREATE PROCEDURE ELIMINAR_CUENTA_X_ID(IN _id_cuenta INT)
BEGIN
    UPDATE Usuario 
    SET activo = 0 
    WHERE id_usuario = _id_cuenta;
END$

CREATE PROCEDURE VERIFICAR_CUENTA(
	IN _correo VARCHAR(150),
    IN _contrasena VARCHAR(150))
BEGIN
    SELECT * FROM Usuario WHERE correo = _correo AND contrasena = MD5(_contrasena)
    AND activo = 1;
END$

CREATE PROCEDURE VERIFICAR_CUENTA_FINAL(
	IN _correo VARCHAR(150),
    IN _contrasena VARCHAR(150))
BEGIN
    SELECT * FROM Usuario u
    LEFT JOIN Administrador a ON a.id_administrador = u.id_usuario
    LEFT JOIN Cliente c ON c.id_cliente = u.id_usuario
    WHERE correo = _correo AND contrasena = MD5(_contrasena)
    AND activo = 1;
END $