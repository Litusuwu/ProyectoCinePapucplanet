#Inserts de todas las tablas

#Inserts de Sedes
CALL INSERTAR_SEDE(@id_sede, "Pontificia Universidad Católica del Perú", "Av. Universitaria 1801");
CALL INSERTAR_SEDE(@id_sede, "Universidad de Lima", "Av. Javier Prado Este 4600");
CALL INSERTAR_SEDE(@id_sede, "Universidad del Pacífico", "Av. Universitaria 1801");
CALL INSERTAR_SEDE(@id_sede, "Universidad Peruana Cayetano Heredia", "Av. Honorio Delgado 430");

#Inserts Administrador
CALL INSERTAR_ADMINISTRADOR(@id_administrador, "75530397", "Diego Enrique", "Rodriguez", "Montes", 'M', '2004-05-28', "20210623");

#Inserts Cliente
CALL INSERTAR_CLIENTE(@id_cliente, "71228897", "Bryan Smith", "Valdiviezo", "Jimenez", 'M', '2004-07-31', 1);

#Inserts Cuenta
CALL INSERTAR_CUENTA(@id_cuenta, "admin", "admin", 1);
CALL INSERTAR_CUENTA(@id_cuenta, "cliente", "cliente", 2);

#Inserts de SALAS
CALL INSERTAR_SALA(@id_sala, 1, 1, 9, 3, 3);
CALL INSERTAR_SALA(@id_sala, 2, 1, 4, 2, 2);

CALL INSERTAR_SALA(@id_sala, 1, 2, 4, 2, 2);
CALL INSERTAR_SALA(@id_sala, 2, 2, 9, 3, 3);
CALL INSERTAR_SALA(@id_sala, 3, 2, 4, 2, 2);

CALL INSERTAR_SALA(@id_sala, 1, 3, 4, 2, 2);
CALL INSERTAR_SALA(@id_sala, 2, 3, 9, 3, 3);
CALL INSERTAR_SALA(@id_sala, 3, 3, 4, 2, 2);

CALL INSERTAR_SALA(@id_sala, 1, 4, 9, 3, 3);
CALL INSERTAR_SALA(@id_sala, 2, 4, 9, 3, 3);

#Inserts BUTACAS
CALL INSERTAR_BUTACA(@id_butaca, 'A', 1, FALSE, 1);
CALL INSERTAR_BUTACA(@id_butaca, 'A', 2, FALSE, 1);
CALL INSERTAR_BUTACA(@id_butaca, 'A', 3, FALSE, 1);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 1, FALSE, 1);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 2, FALSE, 1);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 3, FALSE, 1);
CALL INSERTAR_BUTACA(@id_butaca, 'C', 1, FALSE, 1);
CALL INSERTAR_BUTACA(@id_butaca, 'C', 2, FALSE, 1);
CALL INSERTAR_BUTACA(@id_butaca, 'C', 3, TRUE, 1);

CALL INSERTAR_BUTACA(@id_butaca, 'A', 1, FALSE, 2);
CALL INSERTAR_BUTACA(@id_butaca, 'A', 2, FALSE, 2);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 1, FALSE, 2);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 2, TRUE, 2);

CALL INSERTAR_BUTACA(@id_butaca, 'A', 1, FALSE, 3);
CALL INSERTAR_BUTACA(@id_butaca, 'A', 2, FALSE, 3);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 1, FALSE, 3);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 2, TRUE, 3);

CALL INSERTAR_BUTACA(@id_butaca, 'A', 1, FALSE, 4);
CALL INSERTAR_BUTACA(@id_butaca, 'A', 2, FALSE, 4);
CALL INSERTAR_BUTACA(@id_butaca, 'A', 3, FALSE, 4);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 1, FALSE, 4);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 2, FALSE, 4);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 3, FALSE, 4);
CALL INSERTAR_BUTACA(@id_butaca, 'C', 1, FALSE, 4);
CALL INSERTAR_BUTACA(@id_butaca, 'C', 2, FALSE, 4);
CALL INSERTAR_BUTACA(@id_butaca, 'C', 3, TRUE, 4);

CALL INSERTAR_BUTACA(@id_butaca, 'A', 1, FALSE, 5);
CALL INSERTAR_BUTACA(@id_butaca, 'A', 2, FALSE, 5);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 1, FALSE, 5);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 2, TRUE, 5);

CALL INSERTAR_BUTACA(@id_butaca, 'A', 1, FALSE, 6);
CALL INSERTAR_BUTACA(@id_butaca, 'A', 2, FALSE, 6);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 1, FALSE, 6);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 2, TRUE, 6);

CALL INSERTAR_BUTACA(@id_butaca, 'A', 1, FALSE, 7);
CALL INSERTAR_BUTACA(@id_butaca, 'A', 2, FALSE, 7);
CALL INSERTAR_BUTACA(@id_butaca, 'A', 3, FALSE, 7);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 1, FALSE, 7);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 2, FALSE, 7);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 3, FALSE, 7);
CALL INSERTAR_BUTACA(@id_butaca, 'C', 1, FALSE, 7);
CALL INSERTAR_BUTACA(@id_butaca, 'C', 2, FALSE, 7);
CALL INSERTAR_BUTACA(@id_butaca, 'C', 3, TRUE, 7);

CALL INSERTAR_BUTACA(@id_butaca, 'A', 1, FALSE, 8);
CALL INSERTAR_BUTACA(@id_butaca, 'A', 2, FALSE, 8);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 1, FALSE, 8);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 2, TRUE, 8);

CALL INSERTAR_BUTACA(@id_butaca, 'A', 1, FALSE, 9);
CALL INSERTAR_BUTACA(@id_butaca, 'A', 2, FALSE, 9);
CALL INSERTAR_BUTACA(@id_butaca, 'A', 3, FALSE, 9);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 1, FALSE, 9);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 2, FALSE, 9);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 3, FALSE, 9);
CALL INSERTAR_BUTACA(@id_butaca, 'C', 1, FALSE, 9);
CALL INSERTAR_BUTACA(@id_butaca, 'C', 2, FALSE, 9);
CALL INSERTAR_BUTACA(@id_butaca, 'C', 3, TRUE, 9);

CALL INSERTAR_BUTACA(@id_butaca, 'A', 1, FALSE, 10);
CALL INSERTAR_BUTACA(@id_butaca, 'A', 2, FALSE, 10);
CALL INSERTAR_BUTACA(@id_butaca, 'A', 3, FALSE, 10);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 1, FALSE, 10);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 2, FALSE, 10);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 3, FALSE, 10);
CALL INSERTAR_BUTACA(@id_butaca, 'C', 1, FALSE, 10);
CALL INSERTAR_BUTACA(@id_butaca, 'C', 2, FALSE, 10);
CALL INSERTAR_BUTACA(@id_butaca, 'C', 3, TRUE, 10);

#Inserts Películas
CALL INSERTAR_PELICULA(@id_pelicula, "Las emociones de Nayely", 120, "COMEDIA", "Ahora que es adolescente, Riley experimenta nuevos sentimientos como Ansiedad y Envidia, que se imponen a los viejos mientras ella duda sobre si abandonar a sus antiguas amigas por otras de la escuela secundaria.", "~/Images/Peliculas/Intensamente2.jpeg");
CALL INSERTAR_PELICULA(@id_pelicula, "Joker", 90, "DRAMA", "Arthur Fleck adora hacer reír a la gente, pero su carrera como comediante es un fracaso. El repudio social, la marginación y una serie de trágicos acontecimientos lo conducen a la locura.", "~/Images/Peliculas/Joker.jpeg");

#Inserts Bebidas
CALL INSERTAR_BEBIDA(@id_bebida, "Coca Cola", 9.80, 12, true, "~/Images/Confiteria/cocacola.jpg", 'B');
CALL INSERTAR_BEBIDA(@id_bebida, "Inka Cola", 9.80, 12, true, "~/Images/Confiteria/incakola.jpg", 'B');
CALL INSERTAR_BEBIDA(@id_bebida, "Sprite", 6.80, 12, true, "~/Images/Confiteria/sprite.jpg", 'B');
CALL INSERTAR_BEBIDA(@id_bebida, "Fanta", 6.80, 12, true, "~/Images/Confiteria/fanta.jpg", 'B');
CALL INSERTAR_BEBIDA(@id_bebida, "Monster", 10.80, 12, false, "~/Images/Confiteria/monster.jpg", 'B');
CALL INSERTAR_BEBIDA(@id_bebida, "Volt", 10.80, 12, true, "~/Images/Confiteria/volt.jpg", 'B');
CALL INSERTAR_BEBIDA(@id_bebida, "Quinua", 4.80, 12, false, "~/Images/Confiteria/quinua.jpg", 'B');
CALL INSERTAR_BEBIDA(@id_bebida, "Agua", 2.80, 12, true, "~/Images/Confiteria/agua.jpg", 'B');
CALL INSERTAR_BEBIDA(@id_bebida, "Soya", 4.80, 12, true, "~/Images/Confiteria/soya.jpg", 'B');

#Inserts Alimentos
CALL INSERTAR_ALIMENTO(@id_bebida, "Pizza Mediana", 27.80, 800, "SNACK", "~/Images/Confiteria/pizza.jpg", 'A');
CALL INSERTAR_ALIMENTO(@id_bebida, "Papas fritas", 17.80, 400, "SNACK", "~/Images/Confiteria/papasfritas.jpg", 'A');
CALL INSERTAR_ALIMENTO(@id_bebida, "Canchita Regular", 15.80, 600, "CANCHA", "~/Images/Confiteria/cancha.jpg", 'A');
CALL INSERTAR_ALIMENTO(@id_bebida, "Canchita Premium", 25.80, 1200, "CANCHA", "~/Images/Confiteria/canchapremium.jpg", 'A');
CALL INSERTAR_ALIMENTO(@id_bebida, "Doritos", 8.80, 240, "SNACK", "~/Images/Confiteria/doritos.jpg", 'A');
CALL INSERTAR_ALIMENTO(@id_bebida, "Hamburguesa", 17.80, 300, "SNACK", "~/Images/Confiteria/hamburguesa.jpg", 'A');
CALL INSERTAR_ALIMENTO(@id_bebida, "Hot Dog", 12.80, 340, "SNACK", "~/Images/Confiteria/hotdog.jpg", 'A');
CALL INSERTAR_ALIMENTO(@id_bebida, "Nachos", 14.80, 240, "SNACK", "~/Images/Confiteria/nachos.jpg", 'A');
CALL INSERTAR_ALIMENTO(@id_bebida, "Papas Lays", 8.80, 240, "SNACK", "~/Images/Confiteria/papaslays.jpg", 'A');
CALL INSERTAR_ALIMENTO(@id_bebida, "Porción Torta", 5.80, 400, "POSTRE", "~/Images/Confiteria/torta.jpg", 'A');
CALL INSERTAR_ALIMENTO(@id_bebida, "Helado", 6.80, 400, "POSTRE", "~/Images/Confiteria/helado.jpg", 'A');

#Inserts Funciones
CALL INSERTAR_FUNCION(@id_funcion, '14:00:00', '16:30:00', CURDATE(), 1, 1);
CALL INSERTAR_FUNCION(@id_funcion, '14:00:00', '16:30:00', CURDATE(), 2, 1);
CALL INSERTAR_FUNCION(@id_funcion, '17:00:00', '19:30:00', CURDATE() + INTERVAL 1 DAY, 1, 1);
CALL INSERTAR_FUNCION(@id_funcion, '17:00:00', '19:30:00', CURDATE() + INTERVAL 1 DAY, 2, 1);

CALL INSERTAR_FUNCION(@id_funcion, '14:00:00', '16:00:00', CURDATE(), 3, 2);
CALL INSERTAR_FUNCION(@id_funcion, '14:00:00', '16:00:00', CURDATE(), 4, 2);
CALL INSERTAR_FUNCION(@id_funcion, '17:00:00', '19:00:00', CURDATE() + INTERVAL 1 DAY, 3, 2);
CALL INSERTAR_FUNCION(@id_funcion, '17:00:00', '19:00:00', CURDATE() + INTERVAL 1 DAY, 4, 2);
CALL INSERTAR_FUNCION(@id_funcion, '14:15:00', '16:15:00', CURDATE(), 4, 2);

#Inserts ButacasFunciones
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 1, 1, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 2, 1, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 3, 1, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 4, 1, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 5, 1, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 6, 1, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 7, 1, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 8, 1, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 9, 1, 'DISPONIBLE', 15.00);

CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 10, 2, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 11, 2, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 12, 2, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 13, 2, 'DISPONIBLE', 15.00);

CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 1, 3, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 2, 3, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 3, 3, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 4, 3, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 5, 3, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 6, 3, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 7, 3, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 8, 3, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 9, 3, 'DISPONIBLE', 15.00);

CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 10, 4, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 11, 4, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 12, 4, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 13, 4, 'DISPONIBLE', 15.00);

CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 14, 5, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 15, 5, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 16, 5, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 17, 5, 'DISPONIBLE', 15.00);

CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 18, 6, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 19, 6, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 20, 6, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 21, 6, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 22, 6, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 23, 6, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 24, 6, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 25, 6, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 26, 6, 'DISPONIBLE', 15.00);

CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 14, 7, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 15, 7, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 16, 7, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 17, 7, 'DISPONIBLE', 15.00);

CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 18, 8, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 19, 8, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 20, 8, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 21, 8, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 22, 8, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 23, 8, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 24, 8, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 25, 8, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 26, 8, 'DISPONIBLE', 15.00);

#Inserts Boletas

CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-01-05 19:04:00', 'TARJETA_DEBITO', 60);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-01-15 21:14:00', 'TARJETA_CREDITO', 122.8);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-01-04 06:50:00', 'TARJETA_DEBITO', 140.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-01-28 21:35:00', 'TARJETA_CREDITO', 116.0);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-01-01 13:28:00', 'BILLETERA_ELECTRONICA', 73.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-01-15 10:50:00', 'BILLETERA_ELECTRONICA', 40);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-01-26 00:47:00', 'TARJETA_DEBITO', 102.4);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-01-01 03:05:00', 'TARJETA_CREDITO', 152.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-01-05 09:26:00', 'TARJETA_CREDITO', 73.4);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-01-01 20:27:00', 'TARJETA_DEBITO', 78.8);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-02-05 18:13:00', 'TARJETA_DEBITO', 37.8);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-02-16 15:59:00', 'TARJETA_DEBITO', 40);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-02-20 06:47:00', 'TARJETA_CREDITO', 64.4);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-02-26 01:15:00', 'TARJETA_CREDITO', 234.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-02-22 00:30:00', 'TARJETA_DEBITO', 147.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-02-09 23:00:00', 'TARJETA_CREDITO', 40);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-02-15 10:33:00', 'TARJETA_CREDITO', 60);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-02-09 08:07:00', 'TARJETA_CREDITO', 114.0);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-02-28 15:35:00', 'TARJETA_DEBITO', 60);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-02-26 13:24:00', 'TARJETA_DEBITO', 40);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-03-10 15:21:00', 'BILLETERA_ELECTRONICA', 114.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-03-21 15:29:00', 'TARJETA_CREDITO', 80);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-03-24 17:47:00', 'BILLETERA_ELECTRONICA', 88.4);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-03-27 14:14:00', 'TARJETA_CREDITO', 54.0);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-03-08 02:54:00', 'TARJETA_CREDITO', 134.0);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-03-26 06:38:00', 'BILLETERA_ELECTRONICA', 70.8);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-03-26 10:49:00', 'TARJETA_DEBITO', 40);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-03-19 13:36:00', 'TARJETA_DEBITO', 39.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-03-04 17:31:00', 'TARJETA_DEBITO', 60);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-03-05 07:18:00', 'BILLETERA_ELECTRONICA', 99.2);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-04-08 18:33:00', 'BILLETERA_ELECTRONICA', 92.4);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-04-28 21:11:00', 'BILLETERA_ELECTRONICA', 46.8);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-04-21 11:46:00', 'TARJETA_DEBITO', 123.4);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-04-07 09:10:00', 'TARJETA_CREDITO', 187.8);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-04-03 22:36:00', 'TARJETA_DEBITO', 40);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-04-05 03:25:00', 'BILLETERA_ELECTRONICA', 128.8);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-04-18 13:14:00', 'TARJETA_DEBITO', 109.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-04-04 14:54:00', 'TARJETA_CREDITO', 46.8);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-04-16 06:12:00', 'TARJETA_DEBITO', 94.0);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-04-26 10:05:00', 'TARJETA_DEBITO', 59.2);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-05-01 16:33:00', 'TARJETA_DEBITO', 47.2);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-05-24 07:20:00', 'TARJETA_CREDITO', 167.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-05-13 00:42:00', 'TARJETA_CREDITO', 115.2);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-05-07 10:25:00', 'TARJETA_DEBITO', 135.2);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-05-21 09:51:00', 'TARJETA_DEBITO', 107.4);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-05-22 02:52:00', 'TARJETA_DEBITO', 100.4);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-05-15 08:10:00', 'BILLETERA_ELECTRONICA', 64.4);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-05-05 02:43:00', 'BILLETERA_ELECTRONICA', 66.8);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-05-07 14:43:00', 'BILLETERA_ELECTRONICA', 113.4);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-05-26 10:24:00', 'TARJETA_DEBITO', 152.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-06-10 10:08:00', 'BILLETERA_ELECTRONICA', 84.8);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-06-22 01:09:00', 'TARJETA_DEBITO', 69.4);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-06-25 03:40:00', 'TARJETA_DEBITO', 44.4);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-06-28 04:54:00', 'TARJETA_DEBITO', 84.0);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-06-27 23:25:00', 'BILLETERA_ELECTRONICA', 111.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-06-25 06:44:00', 'TARJETA_CREDITO', 53.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-06-18 23:35:00', 'BILLETERA_ELECTRONICA', 60.4);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-06-28 08:44:00', 'TARJETA_CREDITO', 48.8);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-06-08 00:55:00', 'TARJETA_DEBITO', 106.4);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-06-18 17:18:00', 'BILLETERA_ELECTRONICA', 79.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-07-02 14:35:00', 'TARJETA_CREDITO', 109.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-07-13 19:26:00', 'TARJETA_DEBITO', 40.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-07-04 07:38:00', 'BILLETERA_ELECTRONICA', 189.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-07-23 02:25:00', 'BILLETERA_ELECTRONICA', 40);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-07-06 05:32:00', 'TARJETA_CREDITO', 85.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-07-09 06:04:00', 'BILLETERA_ELECTRONICA', 114.8);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-07-25 01:31:00', 'TARJETA_CREDITO', 100);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-07-11 23:47:00', 'TARJETA_DEBITO', 84.4);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-07-07 17:10:00', 'TARJETA_CREDITO', 26.8);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-07-06 15:08:00', 'BILLETERA_ELECTRONICA', 33.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-08-17 00:22:00', 'TARJETA_DEBITO', 67.2);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-08-14 22:01:00', 'TARJETA_CREDITO', 89.0);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-08-03 08:40:00', 'TARJETA_CREDITO', 100);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-08-22 04:06:00', 'BILLETERA_ELECTRONICA', 40);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-08-17 06:03:00', 'BILLETERA_ELECTRONICA', 60);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-08-15 11:34:00', 'BILLETERA_ELECTRONICA', 40);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-08-27 00:56:00', 'TARJETA_CREDITO', 94.4);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-08-01 04:07:00', 'TARJETA_CREDITO', 82.8);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-08-12 15:40:00', 'BILLETERA_ELECTRONICA', 80);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-08-16 13:31:00', 'TARJETA_CREDITO', 120.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-09-23 19:14:00', 'TARJETA_DEBITO', 41.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-09-08 20:13:00', 'TARJETA_CREDITO', 30.8);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-09-05 12:06:00', 'BILLETERA_ELECTRONICA', 90.4);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-09-23 09:20:00', 'TARJETA_DEBITO', 60);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-09-05 19:35:00', 'BILLETERA_ELECTRONICA', 147.8);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-09-24 09:13:00', 'TARJETA_CREDITO', 100.4);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-09-15 14:37:00', 'TARJETA_DEBITO', 131.8);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-09-18 18:18:00', 'BILLETERA_ELECTRONICA', 77.4);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-09-18 14:44:00', 'TARJETA_DEBITO', 71.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-09-27 04:17:00', 'TARJETA_DEBITO', 40);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-10-08 15:47:00', 'BILLETERA_ELECTRONICA', 115.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-10-23 07:14:00', 'TARJETA_DEBITO', 50.8);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-10-06 17:16:00', 'BILLETERA_ELECTRONICA', 188.0);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-10-27 01:18:00', 'TARJETA_DEBITO', 115.2);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-10-08 00:56:00', 'BILLETERA_ELECTRONICA', 243.4);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-10-27 15:36:00', 'BILLETERA_ELECTRONICA', 104.0);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-10-02 06:11:00', 'TARJETA_DEBITO', 66.8);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-10-05 23:48:00', 'TARJETA_DEBITO', 61.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-10-25 04:20:00', 'TARJETA_DEBITO', 40);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-10-07 01:04:00', 'TARJETA_CREDITO', 232.0);

#Inserts Linea Boleta

CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 1, NULL, 294, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 1, NULL, 297, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 2, NULL, 4, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 2, 11, NULL, 2, 35.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 2, 4, NULL, 4, 27.2);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 2, NULL, 8, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 3, NULL, 277, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 3, 5, NULL, 2, 21.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 3, NULL, 278, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 3, 12, NULL, 5, 79.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 4, 13, NULL, 2, 51.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 4, 17, NULL, 3, 44.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 5, NULL, 86, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 5, 3, NULL, 2, 13.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 5, NULL, 83, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 5, NULL, 80, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 6, NULL, 116, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 7, NULL, 97, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 7, 5, NULL, 1, 10.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 7, NULL, 103, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 7, 12, NULL, 2, 31.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 8, NULL, 26, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 8, 19, NULL, 1, 5.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 8, 11, NULL, 4, 71.2);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 8, 10, NULL, 2, 55.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 9, NULL, 246, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 9, 15, NULL, 3, 53.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 10, NULL, 230, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 10, 20, NULL, 2, 13.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 10, 16, NULL, 3, 38.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 10, 20, NULL, 1, 6.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 11, NULL, 285, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 11, 11, NULL, 1, 17.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 12, NULL, 210, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 12, NULL, 209, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 13, NULL, 59, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 13, 17, NULL, 3, 44.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 14, NULL, 205, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 14, 10, NULL, 2, 55.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 14, 10, NULL, 5, 139.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 15, NULL, 129, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 15, 13, NULL, 2, 51.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 15, 16, NULL, 1, 12.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 15, 6, NULL, 4, 43.2);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 15, NULL, 131, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 16, NULL, 204, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 17, NULL, 199, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 18, NULL, 287, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 18, NULL, 289, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 18, 17, NULL, 5, 74.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 19, NULL, 58, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 19, NULL, 57, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 20, NULL, 68, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 20, NULL, 65, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 21, NULL, 273, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 21, 12, NULL, 3, 47.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 21, 3, NULL, 2, 13.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 21, 4, NULL, 2, 13.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 21, NULL, 271, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 22, NULL, 15, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 22, NULL, 17, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 22, NULL, 20, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 23, NULL, 296, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 23, 8, NULL, 3, 8.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 23, NULL, 295, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 24, 3, NULL, 5, 34.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 25, NULL, 257, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 25, NULL, 255, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 25, 5, NULL, 5, 54.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 25, NULL, 256, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 26, NULL, 264, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 26, NULL, 266, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 26, 6, NULL, 1, 10.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 26, NULL, 262, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 27, NULL, 251, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 27, NULL, 254, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 28, NULL, 22, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 28, 1, NULL, 2, 19.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 30, NULL, 40, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 30, 2, NULL, 4, 39.2);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 30, NULL, 42, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 30, NULL, 43, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 31, NULL, 51, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 31, 6, NULL, 3, 32.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 31, NULL, 49, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 32, NULL, 216, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 32, 3, NULL, 1, 6.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 32, NULL, 223, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 33, NULL, 134, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 33, 10, NULL, 3, 83.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 33, NULL, 136, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 34, NULL, 219, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 34, NULL, 222, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 34, 10, NULL, 5, 139.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 34, 14, NULL, 1, 8.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 35, NULL, 130, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 36, 18, NULL, 5, 44.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 36, 18, NULL, 2, 17.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 36, NULL, 208, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 36, 3, NULL, 4, 27.2);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 37, NULL, 124, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 37, NULL, 125, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 37, 8, NULL, 5, 14.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 37, 15, NULL, 2, 35.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 38, NULL, 39, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 38, 20, NULL, 1, 6.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 38, NULL, 34, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 39, NULL, 194, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 39, 4, NULL, 5, 34.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 39, NULL, 186, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 40, NULL, 55, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 40, 2, NULL, 2, 19.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 40, 1, NULL, 2, 19.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 41, NULL, 197, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 41, 3, NULL, 4, 27.2);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 42, NULL, 87, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 42, 9, NULL, 2, 9.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 42, 18, NULL, 5, 44.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 42, 17, NULL, 5, 74.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 43, 9, NULL, 5, 24.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 43, 11, NULL, 4, 71.2);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 44, NULL, 152, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 44, 16, NULL, 5, 64.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 44, 16, NULL, 4, 51.2);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 45, 12, NULL, 3, 47.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 46, NULL, 279, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 46, NULL, 280, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 46, 20, NULL, 3, 20.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 47, 17, NULL, 3, 44.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 48, NULL, 220, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 48, NULL, 221, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 48, 4, NULL, 1, 6.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 49, NULL, 104, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 49, NULL, 102, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 49, 15, NULL, 3, 53.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 50, NULL, 253, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 50, 11, NULL, 4, 71.2);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 50, 19, NULL, 1, 5.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 50, 15, NULL, 2, 35.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 51, NULL, 162, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 51, 1, NULL, 5, 49.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 51, 12, NULL, 1, 15.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 52, 1, NULL, 3, 29.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 52, NULL, 25, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 53, 20, NULL, 1, 6.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 53, 18, NULL, 2, 17.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 54, NULL, 215, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 54, 18, NULL, 5, 44.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 55, 17, NULL, 5, 74.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 55, 14, NULL, 2, 17.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 56, NULL, 192, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 56, NULL, 191, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 56, 3, NULL, 2, 13.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 57, NULL, 298, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 57, 4, NULL, 3, 20.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 58, NULL, 100, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 58, 14, NULL, 1, 8.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 59, NULL, 74, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 59, 18, NULL, 3, 26.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 59, NULL, 77, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 59, NULL, 78, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 60, NULL, 150, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 60, 1, NULL, 2, 19.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 60, NULL, 156, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 61, NULL, 196, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 61, 16, NULL, 2, 25.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 61, 14, NULL, 4, 35.2);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 61, NULL, 195, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 61, 14, NULL, 1, 8.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 62, NULL, 214, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 62, 1, NULL, 1, 9.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 62, 5, NULL, 1, 10.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 63, NULL, 229, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 63, 13, NULL, 4, 103.2);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 63, 19, NULL, 3, 17.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 63, 2, NULL, 5, 49.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 64, NULL, 140, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 65, NULL, 242, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 65, 4, NULL, 4, 27.2);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 65, 16, NULL, 3, 38.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 66, 13, NULL, 2, 51.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 66, 19, NULL, 4, 23.2);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 67, NULL, 52, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 67, NULL, 44, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 67, NULL, 48, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 67, NULL, 47, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 68, NULL, 76, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 68, 17, NULL, 3, 44.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 69, 3, NULL, 1, 6.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 70, NULL, 284, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 70, 20, NULL, 2, 13.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 71, 4, NULL, 4, 27.2);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 72, NULL, 200, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 72, NULL, 201, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 72, 2, NULL, 4, 39.2);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 72, 1, NULL, 1, 9.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 73, NULL, 206, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 74, NULL, 211, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 74, NULL, 213, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 75, NULL, 145, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 75, NULL, 143, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 75, NULL, 146, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 76, NULL, 292, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 77, 4, NULL, 5, 34.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 77, NULL, 286, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 77, 3, NULL, 3, 20.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 78, 14, NULL, 1, 8.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 78, 20, NULL, 2, 13.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 78, 3, NULL, 3, 20.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 79, NULL, 198, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 80, 3, NULL, 4, 27.2);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 80, 15, NULL, 3, 53.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 80, NULL, 225, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 81, NULL, 147, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 81, 6, NULL, 2, 21.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 82, NULL, 180, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 82, 6, NULL, 1, 10.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 83, 9, NULL, 3, 14.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 83, 4, NULL, 3, 20.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 83, 11, NULL, 2, 35.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 84, NULL, 233, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 84, NULL, 240, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 84, NULL, 236, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 85, 11, NULL, 4, 71.2);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 85, 2, NULL, 3, 29.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 85, 4, NULL, 4, 27.2);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 86, 3, NULL, 3, 20.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 86, NULL, 203, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 87, 5, NULL, 5, 54.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 87, 15, NULL, 1, 17.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 88, NULL, 128, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 88, 19, NULL, 3, 17.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 89, 12, NULL, 2, 31.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 90, NULL, 239, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 91, NULL, 135, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 91, 17, NULL, 3, 44.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 91, 16, NULL, 4, 51.2);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 92, NULL, 73, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 92, 5, NULL, 1, 10.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 93, 17, NULL, 2, 29.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 93, 1, NULL, 3, 29.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 93, 15, NULL, 5, 89.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 93, NULL, 56, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 94, 14, NULL, 4, 35.2);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 94, NULL, 207, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 95, 20, NULL, 5, 34.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 95, 13, NULL, 2, 51.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 95, 13, NULL, 5, 129.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 95, 14, NULL, 1, 8.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 96, NULL, 165, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 96, NULL, 166, 1, 20);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 96, 14, NULL, 5, 44.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 97, 7, NULL, 3, 14.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 97, 6, NULL, 3, 32.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 98, 6, NULL, 2, 21.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 100, 20, NULL, 5, 34.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 100, 12, NULL, 5, 79.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 100, 12, NULL, 5, 79.0);
