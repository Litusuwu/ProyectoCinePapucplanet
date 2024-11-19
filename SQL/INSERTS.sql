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

CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-08-09', 'TARJETA_CREDITO',40.0);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-12-13', 'BILLETERA_ELECTRONICA',55.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-04-28', 'TARJETA_CREDITO',26.2);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-10-29', 'TARJETA_CREDITO',39.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-07-17', 'TARJETA_DEBITO',71.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-10-15', 'TARJETA_CREDITO',38.0);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-08-09', 'TARJETA_DEBITO',24.40);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-12-23', 'TARJETA_DEBITO',40.0);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-02-22', 'TARJETA_CREDITO',40.0);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-07-30', 'BILLETERA_ELECTRONICA',28.8);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-11-23', 'TARJETA_DEBITO',47.40);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-11-22', 'TARJETA_DEBITO',40.0);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-07-31', 'BILLETERA_ELECTRONICA',42.4);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-11-05', 'BILLETERA_ELECTRONICA',37.6);
CALL INSERTAR_BOLETA(@id_boleta, 2, '2024-11-29', 'TARJETA_DEBITO',40);

#Inserts LineaBoleta

CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 1, NULL, 127, 1, 20.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 2, 15, NULL, 2, 35.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 3, 20, NULL, 3, 20.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 4, 2, NULL, 2, 19.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 5, 13, NULL, 2, 51.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 6, 8, NULL, 3, 8.4);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 7, 8, NULL, 1, 2.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 8, NULL, 129, 1, 20.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 9, NULL, 153, 1, 20.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 10, NULL, 321, 1, 20.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 11, 15, NULL, 1, 17.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 12, NULL, 244, 1, 20.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 13, 4, NULL, 1, 6.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 14, NULL, 228, 1, 20.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 15, NULL, 6, 1, 20.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 1, NULL, 318, 1, 20.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 2, NULL, 330, 1, 20.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 3, 18, NULL, 1, 5.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 4, NULL, 85, 1, 20.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 5, NULL, 80, 1, 20.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 6, 17, NULL, 2, 29.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 7, 6, NULL, 2, 21.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 8, NULL, 14, 1, 20.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 9, NULL, 184, 1, 20.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 10, 14, NULL, 1, 8.8);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 11, 17, NULL, 2, 29.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 12, NULL, 176, 1, 20.0);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 13, 15, NULL, 2, 35.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 14, 18, NULL, 2, 17.6);
CALL INSERTAR_LINEA_BOLETA(@id_linea_boleta, 15, NULL, 256, 1, 20.0);