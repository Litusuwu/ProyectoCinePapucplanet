-- Tablas dependientes de otras FK
DROP TABLE IF EXISTS LineaBoleta;
DROP TABLE IF EXISTS ButacaFuncion;
DROP TABLE IF EXISTS Butaca;
DROP TABLE IF EXISTS Funcion;
DROP TABLE IF EXISTS Boleta;

-- Tablas relacionadas con Consumible
DROP TABLE IF EXISTS Bebida;
DROP TABLE IF EXISTS Alimento;
DROP TABLE IF EXISTS Consumible;

-- Tablas relacionadas con Cliente y Usuario
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Administrador;

-- Tablas base
DROP TABLE IF EXISTS Sala;
DROP TABLE IF EXISTS Sede;
DROP TABLE IF EXISTS Usuario;
DROP TABLE IF EXISTS Pelicula;

CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    dni VARCHAR(20) NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    primer_apellido VARCHAR(60) NOT NULL,
    segundo_apellido VARCHAR(60) NOT NULL,
    genero CHAR NOT NULL, 
    fecha_nacimiento DATE NOT NULL,
    correo VARCHAR(100) NULL,
    contrasena VARCHAR(100) NULL,
    activo TINYINT DEFAULT 1
);

-- Tabla Administrador
CREATE TABLE Administrador (
    
    id_administrador INT,
    codigo VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY(id_administrador),
    FOREIGN KEY (id_administrador) REFERENCES Usuario(id_usuario)
);

-- Tabla Sede
CREATE TABLE Sede (
    id_sede INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(100) NOT NULL,
    activo TINYINT DEFAULT 1
);

-- Tabla Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    fid_sede INT,
    FOREIGN KEY (fid_sede) REFERENCES Sede(id_sede),
    FOREIGN KEY (id_cliente) REFERENCES Usuario(id_usuario)
);


-- Tabla Boleta
CREATE TABLE Boleta (
    id_boleta INT PRIMARY KEY AUTO_INCREMENT,
    fid_cliente INT,
    fechaCompra DATE NOT NULL,
    metodo_pago ENUM ('TARJETA_CREDITO', 'TARJETA_DEBITO', 'BILLETERA_ELECTRONICA'),
    total DOUBLE NOT NULL,
    activo TINYINT DEFAULT 1,
    FOREIGN KEY (fid_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabla Consumible
CREATE TABLE Consumible (
    id_consumible INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    precio DOUBLE NOT NULL,
    activo TINYINT DEFAULT 1
);

-- Tabla Bebida (hereda de Consumible)
CREATE TABLE Bebida (
    id_bebida INT PRIMARY KEY,
    onzas INT,
    tieneHielo BOOLEAN,
    FOREIGN KEY (id_bebida) REFERENCES Consumible(id_consumible)
);

-- Tabla Alimento (hereda de Consumible)
CREATE TABLE Alimento (
    id_alimento INT PRIMARY KEY,
    pesoPromedio DOUBLE,
    tipo_alimento ENUM ('SNACK', 'CANCHA', 'POSTRE'),
    FOREIGN KEY (id_alimento) REFERENCES Consumible(id_consumible)
);

-- Tabla Pelicula
CREATE TABLE Pelicula (
	id_pelicula INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(60),
    duracion DOUBLE NOT NULL,
    genero ENUM ('ACCION', 'DRAMA', 'COMEDIA', 'DOCUMENTAL'),
    sinopsis VARCHAR(200),
    activo TINYINT DEFAULT 1
);

-- Tabla Sala
CREATE TABLE Sala (
    id_sala INT PRIMARY KEY AUTO_INCREMENT,
    numero_sala INT,
    fid_sede INT,
    capacidad INT NOT NULL,
    activo TINYINT DEFAULT 1,
    FOREIGN KEY (fid_sede) REFERENCES Sede(id_sede)
);

-- STOP
-- Tabla Butaca
CREATE TABLE Butaca (
	id_butaca INT AUTO_INCREMENT,
    fila CHAR(1),
    columna INT,
    discapacitado BOOLEAN,
    fid_sala INT,
    activo TINYINT DEFAULT 1,
    PRIMARY KEY (id_butaca),
    FOREIGN KEY (fid_sala) REFERENCES Sala(id_sala)
);

-- Tabla Funcion
CREATE TABLE Funcion (
    id_funcion INT PRIMARY KEY AUTO_INCREMENT,
    horaInicio TIME NOT NULL,
    horaFin TIME NOT NULL,
    dia DATE NOT NULL,
    fid_sala INT,
    fid_pelicula INT,
    activo TINYINT DEFAULT 1,
    FOREIGN KEY (fid_sala) REFERENCES Sala(id_sala),
	FOREIGN KEY (fid_pelicula) REFERENCES Pelicula(id_pelicula)
);
-- Tabla ButacaFuncion
CREATE TABLE ButacaFuncion (
    id_butaca_funcion INT PRIMARY KEY AUTO_INCREMENT,
    fid_butaca INT,
    fid_funcion INT,
    estado_butaca ENUM('DISPONIBLE', 'OCUPADA', 'RESERVADA', 'MANTENIMIENTO'),
    precio DOUBLE,
    activo TINYINT DEFAULT 1,
    FOREIGN KEY (fid_butaca) REFERENCES Butaca(id_butaca),
    FOREIGN KEY (fid_funcion) REFERENCES Funcion(id_funcion)
);

CREATE TABLE LineaBoleta(
	id_linea_boleta INT PRIMARY KEY AUTO_INCREMENT,
    fid_boleta INT,
    fid_consumible INT NULL,
    fid_butaca_funcion INT NULL UNIQUE,
    cantidad INT,
    activo TINYINT DEFAULT 1,
    FOREIGN KEY (fid_boleta) REFERENCES Boleta(id_boleta),
    FOREIGN KEY (fid_butaca_funcion) REFERENCES  ButacaFuncion(id_butaca_funcion),
    FOREIGN KEY (fid_consumible) REFERENCES  Consumible(id_consumible)
);

