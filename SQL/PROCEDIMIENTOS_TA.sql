#Procedimientos Almacenados
-- Drops de Cliente
DROP PROCEDURE IF EXISTS INSERTAR_CLIENTE;
DROP PROCEDURE IF EXISTS LISTAR_CLIENTES_TODOS;
DROP PROCEDURE IF EXISTS MODIFICAR_CLIENTE;
DROP PROCEDURE IF EXISTS LISTAR_CLIENTE_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_CLIENTE_X_ID;

-- Drops de Cuenta
DROP PROCEDURE IF EXISTS INSERTAR_CUENTA;
DROP PROCEDURE IF EXISTS LISTAR_CUENTAS_TODAS;
DROP PROCEDURE IF EXISTS MODIFICAR_CUENTA;
DROP PROCEDURE IF EXISTS LISTAR_CUENTA_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_CUENTA_X_ID;
DROP PROCEDURE IF EXISTS VERIFICAR_CUENTA;
DROP PROCEDURE IF exists VERIFICAR_CUENTA_FINAL;
-- Drops de Administrador
DROP PROCEDURE IF EXISTS INSERTAR_ADMINISTRADOR;
DROP PROCEDURE IF EXISTS LISTAR_ADMINISTRADORES_TODOS;
DROP PROCEDURE IF EXISTS MODIFICAR_ADMINISTRADOR;
DROP PROCEDURE IF EXISTS LISTAR_ADMINISTRADOR_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_ADMINISTRADOR_X_ID;

-- Drops de Sede
DROP PROCEDURE IF EXISTS INSERTAR_SEDE;
DROP PROCEDURE IF EXISTS LISTAR_SEDES_TODAS;
DROP PROCEDURE IF EXISTS MODIFICAR_SEDE;
DROP PROCEDURE IF EXISTS LISTAR_SEDE_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_SEDE_X_ID;

-- Drops de Boleta
DROP PROCEDURE IF EXISTS INSERTAR_BOLETA;
DROP PROCEDURE IF EXISTS LISTAR_BOLETAS_TODAS;
DROP PROCEDURE IF EXISTS MODIFICAR_BOLETA;
DROP PROCEDURE IF EXISTS LISTAR_BOLETA_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_BOLETA_X_ID;

-- Drops de Bebida
DROP PROCEDURE IF EXISTS INSERTAR_BEBIDA;
DROP PROCEDURE IF EXISTS LISTAR_BEBIDAS_TODAS;
DROP PROCEDURE IF EXISTS MODIFICAR_BEBIDA;
DROP PROCEDURE IF EXISTS LISTAR_BEBIDA_X_ID;
DROP PROCEDURE IF EXISTS LISTAR_BEBIDA_X_NOMBRE;
DROP PROCEDURE IF EXISTS ELIMINAR_BEBIDA_X_ID;

-- Drops de Alimento
DROP PROCEDURE IF EXISTS INSERTAR_ALIMENTO;
DROP PROCEDURE IF EXISTS LISTAR_ALIMENTOS_TODOS;
DROP PROCEDURE IF EXISTS MODIFICAR_ALIMENTO;
DROP PROCEDURE IF EXISTS LISTAR_ALIMENTO_X_ID;
DROP PROCEDURE IF EXISTS LISTAR_ALIMENTO_X_NOMBRE;
DROP PROCEDURE IF EXISTS ELIMINAR_ALIMENTO_X_ID;

-- Drops de Sala
DROP PROCEDURE IF EXISTS INSERTAR_SALA;
DROP PROCEDURE IF EXISTS LISTAR_SALAS_TODAS;
DROP PROCEDURE IF EXISTS MODIFICAR_SALA;
DROP PROCEDURE IF EXISTS LISTAR_SALA_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_SALA_X_ID;
DROP PROCEDURE IF EXISTS OBTENER_SALAS_POR_SEDE;

-- Drops de Pelicula
DROP PROCEDURE IF EXISTS INSERTAR_PELICULA;
DROP PROCEDURE IF EXISTS LISTAR_PELICULAS_TODAS;
DROP PROCEDURE IF EXISTS MODIFICAR_PELICULA;
DROP PROCEDURE IF EXISTS LISTAR_PELICULA_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_PELICULA_X_ID;

DROP PROCEDURE IF EXISTS LISTAR_PELICULA_X_NOMBRE;
DROP PROCEDURE IF EXISTS LISTAR_GENEROS_ENUM;
DROP PROCEDURE IF EXISTS ListarPeliculasConFuncionesActivas;
-- Drops de Butaca
DROP PROCEDURE IF EXISTS INSERTAR_BUTACA;
DROP PROCEDURE IF EXISTS LISTAR_BUTACAS_TODAS;
DROP PROCEDURE IF EXISTS MODIFICAR_BUTACA;
DROP PROCEDURE IF EXISTS LISTAR_BUTACA_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_BUTACA_X_ID;

-- Drops de Funcion
DROP PROCEDURE IF EXISTS INSERTAR_FUNCION;
DROP PROCEDURE IF EXISTS LISTAR_FUNCIONES_TODAS;
DROP PROCEDURE IF EXISTS MODIFICAR_FUNCION;
DROP PROCEDURE IF EXISTS LISTAR_FUNCION_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_FUNCION_X_ID;
DROP PROCEDURE IF EXISTS OBTENER_FUNCIONES_POR_PELICULA;
DROP PROCEDURE IF EXISTS LISTAR_FUNCIONES_POR_FECHA;
DROP PROCEDURE IF EXISTS VERIFICAR_DISPONIBILIDAD_HORARIO_DE_FUNCIONES;

-- Drops de ButacaFuncion
DROP PROCEDURE IF EXISTS INSERTAR_BUTACA_FUNCION;
DROP PROCEDURE IF EXISTS LISTAR_BUTACAS_FUNCIONES_TODAS;
DROP PROCEDURE IF EXISTS MODIFICAR_BUTACA_FUNCION;
DROP PROCEDURE IF EXISTS LISTAR_BUTACA_FUNCION_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_BUTACA_FUNCION_X_ID;
DROP PROCEDURE IF EXISTS OBTENER_BUTACAS_X_FUNCION;
DROP PROCEDURE IF EXISTS ELIMINAR_BUTACAS_FUNCION_X_ID_FUNCION;
-- Drops de LineaBoleta
DROP PROCEDURE IF EXISTS INSERTAR_LINEA_BOLETA;
DROP PROCEDURE IF EXISTS LISTAR_LINEAS_BOLETAS_TODAS;
DROP PROCEDURE IF EXISTS MODIFICAR_LINEA_BOLETA;
DROP PROCEDURE IF EXISTS LISTAR_LINEA_BOLETA_X_ID;
DROP PROCEDURE IF EXISTS ELIMINAR_LINEA_BOLETA_X_ID;
DROP PROCEDURE IF EXISTS INFORMACION_EXTRA_LINEA_BOLETA;

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

-- Procedimientos de Cuenta
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

-- Procedimientos de Administradores
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

-- Procedimientos de Sede
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

-- Procedimientos de Boleta
CREATE PROCEDURE INSERTAR_BOLETA(
    OUT _id_boleta INT,
    IN _fid_cliente INT,
    IN _fechaCompra DATE,
    IN _metodo_pago ENUM('TARJETA_CREDITO', 'TARJETA_DEBITO', 'BILLETERA_ELECTRONICA'),
    IN _total DOUBLE
)
BEGIN
    INSERT INTO Boleta(fid_cliente, fechaCompra, metodo_pago, total) 
    VALUES(_fid_cliente, _fechaCompra, _metodo_pago, _total);
    SET _id_boleta = @@last_insert_id;
END$

CREATE PROCEDURE LISTAR_BOLETAS_TODAS()
BEGIN
    SELECT b.id_boleta, b.fid_cliente, b.fechaCompra, b.metodo_pago, b.total, b.activo 
    FROM Boleta b
    WHERE b.activo = 1;
END$

CREATE PROCEDURE MODIFICAR_BOLETA(
    IN _id_boleta INT,
    IN _fid_cliente INT,
    IN _fechaCompra DATE,
    IN _metodo_pago ENUM('TARJETA_CREDITO', 'TARJETA_DEBITO', 'BILLETERA_ELECTRONICA'),
    IN _total DOUBLE
)
BEGIN
    UPDATE Boleta 
    SET fid_cliente = _fid_cliente, fechaCompra = _fechaCompra, metodo_pago = _metodo_pago, total = _total
    WHERE id_boleta = _id_boleta;
    UPDATE LineaBoleta SET activo = 0 WHERE fid_boleta = _id_boleta;
END$

CREATE PROCEDURE LISTAR_BOLETA_X_ID(
    IN _id_boleta INT
)
BEGIN
    SELECT b.id_boleta, b.fid_cliente, b.fechaCompra, b.metodo_pago, b.total, b.activo 
    FROM Boleta b 
    WHERE b.id_boleta = _id_boleta AND b.activo = 1;
END$

CREATE PROCEDURE ELIMINAR_BOLETA_X_ID(IN _id_boleta INT)
BEGIN
    UPDATE Boleta 
    SET activo = 0 
    WHERE id_boleta = _id_boleta;
END$

-- Procedimientos de Bebida
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

-- Procedimientos de Alimento
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

-- Procedimientos de Película
CREATE PROCEDURE INSERTAR_PELICULA(
    OUT _id_pelicula INT,
    IN _titulo VARCHAR(60),
    IN _duracion DOUBLE,
    IN _genero ENUM('ACCION', 'DRAMA', 'COMEDIA', 'DOCUMENTAL'),
    IN _sinopsis VARCHAR(1000),
    IN _imagen_link VARCHAR(255)
)
BEGIN
    INSERT INTO Pelicula(titulo, duracion, genero, sinopsis, imagen_link) 
    VALUES(_titulo, _duracion, _genero, _sinopsis, _imagen_link);
    SET _id_pelicula = @@last_insert_id;
END$

CREATE PROCEDURE LISTAR_PELICULAS_TODAS()
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
    WHERE p.activo = 1 AND f.activo = 1 AND s.activo = 1 AND sd.activo = 1;
END;

CREATE PROCEDURE MODIFICAR_PELICULA(
    IN _id_pelicula INT,
    IN _titulo VARCHAR(60),
    IN _duracion DOUBLE,
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
    WHERE p.activo = 1 AND f.activo = 1 AND s.activo = 1 AND sd.activo = 1;
END$

-- Procedimientos de Sala
CREATE PROCEDURE INSERTAR_SALA(
    OUT _id_sala INT,
    IN _numero_sala INT,
    IN _fid_sede INT,
    IN _capacidad INT,
    IN _numcol INT,
    IN _numfilas INT
)
BEGIN
    INSERT INTO Sala(numero_sala, fid_sede, capacidad, numcol, numfilas) 
    VALUES(_numero_sala, _fid_sede, _capacidad, _numcol, _numfilas);
    SET _id_sala = @@last_insert_id;
END$

CREATE PROCEDURE LISTAR_SALAS_TODAS()
BEGIN
    SELECT s.id_sala, s.numero_sala, s.fid_sede,s.numcol, s.numfilas, s.capacidad, s.activo 
    FROM Sala s
    WHERE s.activo = 1;
END$

CREATE PROCEDURE MODIFICAR_SALA(
    IN _id_sala INT,
    IN _numero_sala INT,
    IN _fid_sede INT,
    IN _capacidad INT,
    IN _numcol INT,
    IN _numfilas INT
)
BEGIN
    UPDATE Sala 
    SET numero_sala = _numero_sala, fid_sede = _fid_sede, capacidad = _capacidad, numcol=_numcol, numfilas=_numfilas
    WHERE id_sala = _id_sala;
END$

CREATE PROCEDURE LISTAR_SALA_X_ID(
	IN _id_sala INT
)
BEGIN
	SELECT s.id_sala, s.numero_sala, s.fid_sede,s.numcol, s.numfilas, s.capacidad, s.activo 
	FROM Sala s 
	WHERE s.id_sala = _id_sala AND s.activo = 1;
END$

CREATE PROCEDURE ELIMINAR_SALA_X_ID (IN _id_sala INT)
BEGIN
	UPDATE Sala 
	SET activo = 0 
	WHERE id_sala = _id_sala;
END$

CREATE PROCEDURE OBTENER_SALAS_POR_SEDE(
    IN _id_sede INT
)
BEGIN
    SELECT s.id_sala, s.numero_sala,s.numcol, s.numfilas, s.capacidad, s.activo 
    FROM Sala s
    WHERE s.fid_sede = _id_sede AND s.activo = 1;
END$

-- Procedimientos de Butaca
CREATE PROCEDURE INSERTAR_BUTACA(
    OUT _id_butaca INT,
    IN _fila CHAR(1),
    IN _columna INT,
    IN _discapacitado BOOLEAN,
    IN _fid_sala INT
)
BEGIN
    INSERT INTO Butaca(fila, columna, discapacitado, fid_sala) 
    VALUES(_fila, _columna, _discapacitado, _fid_sala);
    SET _id_butaca = @@last_insert_id;
END$

CREATE PROCEDURE LISTAR_BUTACAS_TODAS()
BEGIN
    SELECT b.id_butaca, b.fila, b.columna, b.discapacitado, b.fid_sala, b.activo 
    FROM Butaca b
    WHERE b.activo = 1;
END$

CREATE PROCEDURE MODIFICAR_BUTACA(
    IN _id_butaca INT,
    IN _fila CHAR(1),
    IN _columna INT,
    IN _discapacitado BOOLEAN,
    IN _fid_sala INT
)
BEGIN
    UPDATE Butaca 
    SET fila = _fila, columna = _columna, discapacitado = _discapacitado, fid_sala = _fid_sala
    WHERE id_butaca = _id_butaca;
END$

CREATE PROCEDURE LISTAR_BUTACA_X_ID(
    IN _id_butaca INT
)
BEGIN
    SELECT b.id_butaca, b.fila, b.columna, b.discapacitado, b.fid_sala, b.activo 
    FROM Butaca b 
    WHERE b.id_butaca = _id_butaca AND b.activo = 1;
END$

CREATE PROCEDURE ELIMINAR_BUTACA_X_ID (IN _id_butaca INT)
BEGIN
    UPDATE Butaca 
    SET activo = 0 
    WHERE id_butaca = _id_butaca;
END$

CREATE PROCEDURE LISTAR_BUTACAS_X_SALA(
	IN _id_sala INT
)
BEGIN
    SELECT b.id_butaca, b.fila, b.columna, b.discapacitado, b.fid_sala
    FROM Butaca b
    WHERE b.fid_sala = _id_sala AND b.activo = 1;
END$

CREATE PROCEDURE ELIMINAR_BUTACAS_X_SALA_ID (IN _id_sala INT)
BEGIN
    UPDATE Butaca 
    SET activo = 0 
    WHERE fid_sala = _id_sala;
END$
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

DELIMITER $
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

DELIMITER $
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

-- Procedimientos de ButacaFuncion
CREATE PROCEDURE INSERTAR_BUTACA_FUNCION(
	OUT _id_butaca_funcion INT,
    IN _fid_butaca INT,
    IN _fid_funcion INT,
    IN _estado_butaca ENUM('DISPONIBLE', 'OCUPADA', 'RESERVADA', 'MANTENIMIENTO'),
    IN _precio DOUBLE
)
BEGIN
	INSERT INTO ButacaFuncion(fid_butaca, fid_funcion, estado_butaca, precio) 
    VALUES(_fid_butaca, _fid_funcion, _estado_butaca, _precio);
    
    SET _id_butaca_funcion = @@last_insert_id;
END$

CREATE PROCEDURE LISTAR_BUTACAS_FUNCIONES_TODAS()
BEGIN
	SELECT bf.id_butaca_funcion, bf.fid_butaca, b.fila, b.columna, b.discapacitado, bf.fid_funcion, bf.estado_butaca, bf.precio, bf.activo 
    FROM Butaca b 
    INNER JOIN ButacaFuncion bf ON b.id_butaca = bf.fid_butaca
    WHERE bf.activo = 1;
END$

CREATE PROCEDURE MODIFICAR_BUTACA_FUNCION(
	IN _id_butaca_funcion INT,
	IN _fid_butaca INT,
    IN _fid_funcion INT,
    IN _estado_butaca ENUM('DISPONIBLE', 'OCUPADA', 'RESERVADA', 'MANTENIMIENTO'),
    IN _precio DOUBLE
)
BEGIN
	UPDATE ButacaFuncion 
    SET fid_butaca = _fid_butaca,  fid_funcion = _fid_funcion, estado_butaca = _estado_butaca, precio = _precio
    WHERE id_butaca_funcion = _id_butaca_funcion;
END$

CREATE PROCEDURE LISTAR_BUTACA_FUNCION_X_ID(
	IN _id_butaca_funcion INT
)
BEGIN
	SELECT bf.id_butaca_funcion, b.fila, b.columna, b.discapacitado, bf.fid_butaca, bf.fid_funcion, bf.estado_butaca, bf.precio, bf.activo 
    FROM Butaca b 
    INNER JOIN ButacaFuncion bf ON b.id_butaca = bf.fid_butaca
    WHERE bf.id_butaca_funcion = _id_butaca_funcion AND bf.activo = 1;
END$

CREATE PROCEDURE ELIMINAR_BUTACA_FUNCION_X_ID (IN _id_butaca_funcion INT)
BEGIN
    UPDATE ButacaFuncion 
    SET activo = 0 
    WHERE id_butaca_funcion = _id_butaca_funcion;
END$

CREATE PROCEDURE ELIMINAR_BUTACAS_FUNCION_X_ID_FUNCION (
	IN _id_funcion INT
)
BEGIN
    UPDATE ButacaFuncion
    SET activo = 0 
    WHERE fid_funcion = _id_funcion;
END$

-- Procedimientos de LineaBoleta
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

CREATE PROCEDURE LISTAR_GENEROS_ENUM()
BEGIN
    SELECT SUBSTRING(COLUMN_TYPE, 6, LENGTH(COLUMN_TYPE) - 6) AS generos
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'Pelicula'
      AND COLUMN_NAME = 'genero'
      AND TABLE_SCHEMA = DATABASE();
END $

CREATE PROCEDURE OBTENER_BUTACAS_X_FUNCION(IN _id_funcion INT)
BEGIN
    SELECT 
        b.id_butaca, b.fila,b.columna,b.discapacitado,bf.id_butaca_funcion,bf.precio,bf.estado_butaca
    FROM Butaca b
    INNER JOIN ButacaFuncion bf ON b.id_butaca = bf.fid_butaca
    WHERE bf.fid_funcion = _id_funcion
    AND bf.activo = 1  AND b.activo = 1 
    ORDER BY b.fila, b.columna;
END $

CREATE PROCEDURE VERIFICAR_CUENTA_FINAL(
	IN _correo VARCHAR(150),
    IN _contrasena VARCHAR(150))
BEGIN
    SELECT * FROM Usuario u
    LEFT JOIN Administrador a ON a.id_administrador = u.id_usuario
    LEFT JOIN Cliente c ON c.id_cliente = u.id_usuario
    WHERE correo = _correo AND contrasena = MD5(_contrasena)
    AND activo = 1;
END
DELIMITER ;

