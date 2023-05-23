create database viajes;
use viajes;

create table Agencia(
Cod_agencia bigint unique not null,
F_inicio date not null,
Ciudad varchar(20) not null,

constraint Cod_agencia primary key(Cod_agencia)
);

insert into Agencia values(11, "24/4/2023","berlin"),
                          (22, "24/4/2023","tokio"),
                          (33, "24/4/2023","madrid"),
                          (44, "24/4/2023","rawson"),
                          (55, "24/4/2023","londres"),
                          (66, "24/4/2023","lima"),
                          (77, "24/4/2023","barcelona"),
                          (88, "24/4/2023","sevilla"),
                          (99, "24/4/2023","CABA"),
                          (100, "24/4/2023","malaga");



create table Paquetes(
Cod_paquete bigint unique not null,
Precio bigint not null,
Destinos varchar(30) not null,
Agencia_Cod_agencia bigint unique not null,

constraint Cod_paquete primary key(Cod_paquete),
constraint Agencia_Cod_agencia foreign key(Agencia_Cod_agencia) references Agencia(Cod_agencia)
);

insert into Paquetes values(111, 300, "malibu", 11),
                          (222, 5000, "nordelta", 22),
                          (333, 200, "peniarol", 33),
                          (444, 150, "la boca", 44),
                          (555, 6000, "monumental", 55),
                          (666, 8800, "ciclon", 66),
                          (777, 220, "favela", 77),
                          (888, 650, "fuerte apache", 88),
                          (999, 750, "villa 31", 99),
                          (1000, 90000, "jose zepas", 100);


create table Clientes(
DNI bigint unique not null,
Domicilio varchar(30) not null,
Nombre varchar(20) not null,

constraint DNI primary key(DNI)
);

insert into Clientes values(15788854, "tinogasta", "nabu"),
                           (64150861, "mitre", "aylen"),
                           (71933821, "fenandez", "brussa"),
                           (49427707, "san martin", "luca"), 
                           (63534700, "baygorria", "juan"),
                           (41963328, "quiniones", "palermo"),
                           (80799930, "urquisa", "roman"),
                           (89925369, "jonte", "manildo"),
                           (90160667, "moreno", "franchescoli"),
                           (33722260, "hornos", "riquelme");


create table Clientes_Paquetes(
CP_Cod_paquete bigint unique not null,
CP_DNI bigint unique not null,

constraint CP_Cod_paquete foreign key(CP_Cod_paquete) references Paquetes(Cod_paquete),
constraint CP_DNI foreign key(CP_DNI) references Clientes(DNI)
);

insert into Clientes_Paquetes values(111, 15788854),
                           (222, 64150861),
                           (333, 71933821),
                           (444, 49427707),
                           (555, 63534700),
                           (666, 41963328),
                           (777, 80799930),
                           (888, 89925369),
                           (999, 90160667),
                           (1000, 33722260);


create table Banco(
Nombre varchar(30) unique not null,
sucursal varchar(30) not null,
F_validez date not null,

constraint Nombre primary key(Nombre) 

);

insert into Banco values("santander", "Gorriti 4295, C1414 CABA", "28/02/2024"),
                           ("ciudad", "Tronador 400, C1427 CRJ, Buenos Aires", "20/5/2023"),
                           ("nacion", "Conde, C1430 CABA", "21/7/2023"),
                           ("bancanchat", "Conde, C1430 CABA", "11/8/2023"),
                           ("galicia", "Ruiz Huidobro 3709, C1430CJE C1430CJE, Buenos Aires", "18/11/2023"),
                           ("frances", "Ruiz Huidobro 4771, C1430 CABA", "20/10/2023"),
                           ("macro", "Av. Rivadavia 6828, C1406 GLY, Buenos Aires", "1/1/2028"),
                           ("provincia", "Av. Sta. Fe 2600, C1425BGN Recoleta, Buenos Aires", "31/12/2100"),
                           ("citybank", "Humberto 1 400, C1103 CABA", "2/2/2024"),
                           ("hipotecario", "Av. Brasil, C1143 CABA", "7/9/2023");


create table Formas_de_pago(
Cod_pago bigint unique not null,
Tipo varchar(20) not null,
Monto bigint not null,
Autorizacion date not null,
Clientes_DNI bigint unique not null,

constraint Cod_pago primary key(Cod_pago),
constraint Clientes_DNI foreign key(Clientes_DNI) references Clientes(DNI)
);

insert into Formas_de_pago values(3928, "efectivo", 490, "28/02/2024", 15788854),
                           (5846, "efectivo", 70000, "20/5/2023", 64150861),
                           (1268, "efectivo", 33333, "21/7/2023", 71933821),
                           (6478, "efectivo", 50000, "11/8/2023", 49427707),
                           (3498, "tarjeta", 5000, "18/11/2023", 63534700),
                           (5921, "tarjeta", 3009, "20/10/2023", 41963328),
                           (5683, "tarjeta", 350, "1/1/2028", 80799930),
                           (1830, "efectivo", 210, "31/12/2100", 89925369),
                           (2763, "tarjeta", 4000, "2/2/2024", 90160667),
                           (8372, "tarjeta", 5555, "7/9/2023", 33722260);


select * 
from Paquetes;

select DNi, Nombre
from Clientes;

select Nombre, Tipo, Monto
from Clientes, Formas_de_pago;

select Nombre, sucursal
from Banco;

select Nombre
from Clientes
where Nombre like "r%";

select Cod_paquete, monto
from Paquetes, Formas_de_pago
where precio > 700000;

UPDATE 
set Monto = Monto * 0.85
where Tipo like "%efectivo%";

select Monto
from Formas_de_pago
where Tipo like "%efectivo%";

UPDATE
from Formas_de_pago
set Monto = Monto * 1.30;
where Tipo like "%tajeta%", 

select Monto, Tipo
from Formas_de_pago
where Tipo like "%tajeta%", 


select F_validez, Nombre, sucursal 
from Banco

select Nombres, Ciudad
from Agencia 
where Ciudad == "CABA"


