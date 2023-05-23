create database Almacenes;
use Almacenes;

create table CAJEROS(
Codigo_C int unique not null,
NomApels varchar(255),

constraint pkCodigo_C primary key(Codigo_C)
);

insert into CAJEROS values(10, "juan larreta"),
                          (11, "alberto pa"),
                          (12, "milton casco"),
                          (13, "franco armani"),
                          (14, "miguel borja"),
                          (15, "enzo perez"),
                          (16, "enzo dias"),
                          (17, "enzo fernandez"),
                          (18, "ezequiel mammana"),
                          (19, "lucas beltran");


create table PRODUCTOS(
Codigo_P int unique not null,
Nombre varchar(100),
Precio int not null,

constraint pkCodigo_P primary key(Codigo_P)
);

insert into PRODUCTOS values(111, "monitor", 150),
                            (222, "cama", 300),
                            (333, "escritorio", 5000),
                            (444, "celular", 88000),
                            (555, "vaso", 2000),
                            (666, "moto", 40),
                            (777, "auto", 180),
                            (888, "auriculares", 48),
                            (999, "zapatillas", 39),
                            (100, "mouse", 22);


create table MAQUINAS_REGISTRADORAS(
Codigo_MR int unique not null,
Piso int not null,

constraint pkCodigo_MR primary key(Codigo_MR)
);

insert into MAQUINAS_REGISTRADORAS values(808, 1),
                                         (101, 2),
                                         (202, 3),
                                         (303, 4),
                                         (404, 5),
                                         (505, 6),
                                         (606, 7),
                                         (707, 8),
                                         (800, 9),
                                         (909, 10);


create table VENTA(
Cajero int not null,
Producto int not null,
Maquina int not null,

constraint FK_Cajero foreign key(Cajero) references CAJEROS(Codigo_C),
constraint FK_Maquina foreign key(Maquina) references MAQUINAS_REGISTRADORAS(Codigo_MR),
constraint FK_Producto foreign key(Producto) references PRODUCTOS(Codigo_P),
constraint pk_venta primary key(Cajero, Maquina, Producto)
);

insert VENTA values(10, 111, 909),
                   (11, 222, 909),
                   (11, 222, 808),
                   (12, 777, 707),
                   (12, 333, 707),
                   (13, 888, 505),
                   (11, 999, 101),
                   (14, 333, 606),
                   (15, 888, 101),
                   (19, 222, 202),
                   (16, 555, 303),
                   (18, 444, 404),
                   (17, 444, 101),
                   (18, 666, 101),
                   (19, 555, 505);



select Producto, count(*) as total
from VENTA
group by Producto
order by total desc;

select NomApels, Nombre, Precio, Piso
from VENTA
join CAJEROS on Cajero = Codigo_C
join PRODUCTOS on Producto = Codigo_P
join MAQUINAS_REGISTRADORAS on Maquina = Codigo_MR;

select Piso as Pisopre, sum(Precio) as Preciosuma
from VENTA
join PRODUCTOS on Producto = Codigo_P
join MAQUINAS_REGISTRADORAS on Maquina = Codigo_MR
group by Piso;

select Codigo_C, NomApels, sum(precio) as preciototal
from VENTA
join CAJEROS on Cajero = Codigo_C
join PRODUCTOS on Producto = Codigo_P
group by Codigo_C;

select Codigo_C, NomApels
from VENTA
join CAJEROS on Cajero = Codigo_C
join PRODUCTOS on Producto = Codigo_P
group by Codigo_C
having sum(precio) < 5000;

