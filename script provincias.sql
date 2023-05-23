create database pais;
use pais;



create table Provincias(
    Cod_postal bigint unique not null, 
    Nombre varchar(20) not null,
    Poblacion bigint not null,
    Superficie varchar(30) not null,
    Capital_p varchar(20) not null,

    constraint pk_p1 primary key(Cod_postal),
	constraint fk_p1 foreign key(Capital_p) references Localidades(Cod_localidad)
);    

create table Localidades(
    Cod_localidad bigint unique not null, 
    Nombre varchar(20) not null,
    Poblacion bigint not null,
    Cod_postal bigint unique not null,
	Capital_p varchar(20) not null,

    constraint pk_p1 primary key(Cod_localidad),
	constraint fk_p1 foreign key(Cod_postal) references Provincias(Cod_postal_p)
);   

create table Comunidades(
    Cod_comunidades bigint unique not null, 
    Nombre varchar(20) not null,
    Poblacion bigint not null,
    Superficie varchar(30) not null,
    Cod_localidad bigint unique not null,
    Cod_postal bigint unique not null,
    Capital_p varchar(20) not null,

    constraint pk_p1 primary key(Cod_comunidades),
	constraint fk_p1 foreign key(Cod_localidad) references Localidades(Cod_localidad),
	constraint fk_p1 foreign key(Cod_postal) references Provincias(Cod_postal_p),
	constraint fk_p1 foreign key(Capital_p) references Localidades(Cod_localidad)
);  

