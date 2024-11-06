#Inserts 
#Inserts Bebidas
CALL INSERTAR_BEBIDA(@id_bebida, "Coca Cola", 9.80, 12, true, "~/Uploads/cocacola.jpg", 'B');
CALL INSERTAR_BEBIDA(@id_bebida, "Inka Cola", 9.80, 12, true, "~/Uploads/incakola.jpg", 'B');
CALL INSERTAR_BEBIDA(@id_bebida, "Sprite", 6.80, 12, true, "~/Uploads/sprite.jpg", 'B');
CALL INSERTAR_BEBIDA(@id_bebida, "Fanta", 6.80, 12, true, "~/Uploads/fanta.jpg", 'B');
CALL INSERTAR_BEBIDA(@id_bebida, "Monster", 10.80, 12, false, "~/Uploads/monster.jpg", 'B');
CALL INSERTAR_BEBIDA(@id_bebida, "Volt", 10.80, 12, true, "~/Uploads/volt.jpg", 'B');
CALL INSERTAR_BEBIDA(@id_bebida, "Quinua", 4.80, 12, false, "~/Uploads/quinua.jpg", 'B');
CALL INSERTAR_BEBIDA(@id_bebida, "Agua", 2.80, 12, true, "~/Uploads/agua.jpg", 'B');
CALL INSERTAR_BEBIDA(@id_bebida, "Soya", 4.80, 12, true, "~/Uploads/soya.jpg", 'B');
#Inserts Alimentos
CALL INSERTAR_ALIMENTO(@id_bebida, "Pizza Mediana", 27.80, 800, "SNACK", "~/Uploads/pizza.jpg", 'A');
CALL INSERTAR_ALIMENTO(@id_bebida, "Papas fritas", 17.80, 400, "SNACK", "~/Uploads/papasfritas.jpg", 'A');
CALL INSERTAR_ALIMENTO(@id_bebida, "Canchita Regular", 15.80, 600, "CANCHA", "~/Uploads/cancha.jpg", 'A');
CALL INSERTAR_ALIMENTO(@id_bebida, "Canchita Premium", 25.80, 1200, "CANCHA", "~/Uploads/canchapremium.jpg", 'A');
CALL INSERTAR_ALIMENTO(@id_bebida, "Doritos", 8.80, 240, "SNACK", "~/Uploads/doritos.jpg", 'A');
CALL INSERTAR_ALIMENTO(@id_bebida, "Hamburguesa", 17.80, 300, "SNACK", "~/Uploads/hamburguesa.jpg", 'A');
CALL INSERTAR_ALIMENTO(@id_bebida, "Hot Dog", 12.80, 340, "SNACK", "~/Uploads/hotdog.jpg", 'A');
CALL INSERTAR_ALIMENTO(@id_bebida, "Nachos", 14.80, 240, "SNACK", "~/Uploads/nachos.jpg", 'A');
CALL INSERTAR_ALIMENTO(@id_bebida, "Papas Lays", 8.80, 240, "SNACK", "~/Uploads/papaslays.jpg", 'A');
CALL INSERTAR_ALIMENTO(@id_bebida, "Porción Torta", 5.80, 400, "POSTRE", "~/Uploads/torta.jpg", 'A');
CALL INSERTAR_ALIMENTO(@id_bebida, "Helado", 6.80, 400, "POSTRE", "~/Uploads/helado.jpg", 'A');

#Inserts BUTACAS
INSERT INTO Butaca (fila, columna, discapacitado, fid_sala, activo) VALUES
('A', 1, FALSE, 1, 1),
('A', 2, FALSE, 1, 1),
('A', 3, FALSE, 1, 1),
('A', 4, FALSE, 1, 1),
('B', 5, FALSE, 1, 1),
('B', 6, FALSE, 1, 1),
('B', 7, FALSE, 1, 1),
('B', 8, FALSE, 1, 1);

CALL INSERTAR_BUTACA(@id_butaca, 'A', 1, FALSE, 28);
CALL INSERTAR_BUTACA(@id_butaca, 'A', 2, FALSE, 28);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 1, FALSE, 28);
CALL INSERTAR_BUTACA(@id_butaca, 'B', 2, FALSE, 28);

#Inserts BUTACASFUNCIONES
INSERT INTO ButacaFuncion (fid_butaca, fid_funcion, estado_butaca, precio, activo) VALUES
(1, 2, 'DISPONIBLE', 15.00, 1),
(2, 2, 'DISPONIBLE', 15.00, 1),
(3, 2, 'DISPONIBLE', 15.00, 1),
(4, 2, 'OCUPADA', 15.00, 1),
(5, 2, 'DISPONIBLE', 15.00, 1),
(6, 2, 'DISPONIBLE', 15.00, 1),
(7, 2, 'DISPONIBLE', 15.00, 1),
(8, 2, 'DISPONIBLE', 15.00, 1);

CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 34, 19, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 35, 19, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 36, 19, 'DISPONIBLE', 15.00);
CALL INSERTAR_BUTACA_FUNCION(@id_butaca_funcion, 37, 19, 'DISPONIBLE', 15.00);

#Inserts de SALAS
CALL INSERTAR_SALA(@id_sala, 1, 3, 50);
CALL INSERTAR_SALA(@id_sala, 2, 3, 50);
CALL INSERTAR_SALA(@id_sala, 3, 3, 50);
CALL INSERTAR_SALA(@id_sala, 4, 3, 50);
CALL INSERTAR_SALA(@id_sala, 1, 4, 50);
CALL INSERTAR_SALA(@id_sala, 2, 4, 50);
CALL INSERTAR_SALA(@id_sala, 3, 4, 50);
CALL INSERTAR_SALA(@id_sala, 4, 4, 50);
CALL INSERTAR_SALA(@id_sala, 5, 4, 50);