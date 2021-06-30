CREATE TABLE Carrier (
  Carrier_id int not null UNIQUE AUTO_INCREMENT,
  Name VARCHAR(50) NOT NULL,
  Capacity int NOT NULL,
  PRIMARY KEY (Carrier_id)
);

CREATE TABLE Cantidad_de_envios(
  Zona varchar(40) not null,
  Mes int not null,
  Cantidad_envios int not null,
  primary key (Zona)
);

CREATE TABLE Costos(
  Carrier_id int not null,
  Zona varchar(40) not null,
  Costo int not null,
  Tiempo_entrega int not null,
  primary key (Carrier_id,Zona),
  foreign key (Carrier_id) references Carrier(Carrier_id),
  foreign key (Zona) references Cantidad_de_envios(Zona)
 );

insert into Carrier(Name,Capacity) values ("Carrier A",10000);
insert into Carrier(Name,Capacity) values ("Carrier B",10000);
insert into Carrier(Name,Capacity) values ("Carrier C",3000);
select * from Carrier;


insert into Cantidad_de_envios(Zona,Mes,Cantidad_envios) values ("Amba",1,40000);
insert into Cantidad_de_envios(Zona,Mes,Cantidad_envios) values ("Bs As",1,50000);
insert into Cantidad_de_envios(Zona,Mes,Cantidad_envios) values ("Resto",1,60000);
select * from Cantidad_de_envios;

insert into Costos(Carrier_id,Zona,Costo,Tiempo_entrega) values (1,"Amba",10,3);
insert into Costos(Carrier_id,Zona,Costo,Tiempo_entrega) values (1,"Bs As",20,5);
insert into Costos(Carrier_id,Zona,Costo,Tiempo_entrega) values (1,"Resto",50,7);
insert into Costos(Carrier_id,Zona,Costo,Tiempo_entrega) values (2,"Amba",15,2);
insert into Costos(Carrier_id,Zona,Costo,Tiempo_entrega) values (2,"Bs As",19,4);
insert into Costos(Carrier_id,Zona,Costo,Tiempo_entrega) values (2,"Resto",55,6);
insert into Costos(Carrier_id,Zona,Costo,Tiempo_entrega) values (3,"Amba",20,1);
select * from Costos;

--Query para obtener el precio total del costo de los envios del mes 1 para cada carrier
select Carrier_id , sum(Costo * Cantidad_envios) as costo_envio 
from Costos 
inner join Cantidad_de_envios on Cantidad_de_envios.Zona = Costos.Zona 
group by Carrier_id;
