
--(MESA 5)
--YAMILKA HENRIQUEZ (COCO) - 1088537
--LETICIA SANCHEZ          - 1087298
--SALMA MARMOL (Moonzxxi)  - 1085618

--DDL
--CREATE DATABASE INABIE
--USE INABIE
CREATE TABLE [TipoProveedor] (
  [IdTipoProveedor] INT IDENTITY,
  [TipoProveedor] VARCHAR(50),
  PRIMARY KEY ([IdTipoProveedor])
);--
CREATE TABLE [Estado] (
  [IdEstado] INT IDENTITY,
  [Estado] VARCHAR(25),
  PRIMARY KEY ([IdEstado])
);--
CREATE TABLE [Modalidad] (
  [IdModalidad] INT IDENTITY,
  [Modalidad] VARCHAR(50),
  PRIMARY KEY ([IdModalidad])
);--
CREATE TABLE [Provincia] (
  [IdProvincia] INT IDENTITY,
  [Provincia] VARCHAR(50),
  PRIMARY KEY ([IdProvincia])
);--
CREATE TABLE [TipoProducto] (
  [IdTipoProducto] INT IDENTITY,
  [TipoProducto] VARCHAR(20),
  [Descripcion] VARCHAR(100),
  PRIMARY KEY ([IdTipoProducto])
);--
CREATE TABLE [Direccion] (
  [IdDireccion] INT IDENTITY,
  [Direccion] VARCHAR(50),
  PRIMARY KEY ([IdDireccion])
);--
----------------------------------- TABLAS CON FK--------------------------------------------------------
CREATE TABLE [Producto] (
  [IdProducto] INT IDENTITY,
  [IdTipoProducto1] INT REFERENCES TipoProducto(IdTipoProducto),
  [Producto] VARCHAR(50),
  [Precio] DECIMAL(10,2),
  PRIMARY KEY ([IdProducto])
);
CREATE TABLE [Distrito] (
  [IdDistrito] INT IDENTITY,
  [IdDireccion1] INT  REFERENCES Direccion(IdDireccion),
  [Distrito] CHAR(2),
  PRIMARY KEY ([IdDistrito])
);
CREATE TABLE [Regional] (
  [IdRegional] INT IDENTITY,
  [IdDistrito1] INT  REFERENCES Distrito(IdDistrito),
  [Regional] TINYINT,
  PRIMARY KEY ([IdRegional])
);
CREATE TABLE [Provincia Regional] (
  [IdPRegional] INT IDENTITY,
  [IdProvincia1] INT  REFERENCES Provincia(IdProvincia),
  [IdRegional1] INT   REFERENCES Regional(IdRegional),
  PRIMARY KEY ([IdPRegional])
);
CREATE TABLE [RegistroProveedor] (
  [IdRProveedor] INT IDENTITY,
  [IdTipoProveedor1] INT  REFERENCES TipoProveedor(IdTipoProveedor),
  [IdEstado1] INT         REFERENCES  Estado(IdEstado),
  [Nombre] VARCHAR(50),
  [Telefono] CHAR(10),
  [Direccion] VARCHAR(50),
  [RNC] CHAR(9),
  [NIP] CHAR(4),
  PRIMARY KEY ([IdRProveedor])
);
CREATE TABLE [ModalidadProveedor] (
  [IdMProveedor] INT IDENTITY,
  [IdRProveedor1] INT  REFERENCES RegistroProveedor(IdRProveedor),
  [IdModalidad1] INT   REFERENCES Modalidad(IdModalidad),
  PRIMARY KEY ([IdMProveedor])
);
CREATE TABLE [ProveedorProducto] (
  [IdPProducto] INT IDENTITY,
  [IdRProveedor2] INT   REFERENCES RegistroProveedor(IdRProveedor),
  [IdProducto1] INT     REFERENCES Producto(IdProducto),
  [Existencia] INT,
  PRIMARY KEY ([IdPProducto])
);
CREATE TABLE [Almacen] (
  [IdAlmacen] INT IDENTITY,
  [IdEstado3] INT   REFERENCES  Estado(IdEstado),
  [Capacidad] INT,
  [Ubicacion] VARCHAR(50),
  [Nombre] VARCHAR(50),
  PRIMARY KEY ([IdAlmacen])
);
CREATE TABLE [CocinaIndustrial] (
  [IdCocinaIn] INT IDENTITY,
  [IdAlmacen1] INT   REFERENCES  Almacen(IdAlmacen),
  [IdEstado4] INT    REFERENCES  Estado(IdEstado),
  [Ubicacion] VARCHAR(50),
  [Nombre] VARCHAR(50),
  [Capacidad] INT,
  PRIMARY KEY ([IdCocinaIn])
);
CREATE TABLE [PProductoAlmacen] (
  [IdPPAlmacen] INT IDENTITY,
  [IdPProducto5] INT   REFERENCES  ProveedorProducto(IdPProducto),
  [IdAlmacen2] INT     REFERENCES  Almacen(IdALmacen),
  PRIMARY KEY ([IdPPAlmacen])
);
CREATE TABLE [Alcance] (
  [IdAlcance] INT IDENTITY,
  [IdCocinaIN1] INT    REFERENCES CocinaIndustrial(IdCocinaIN),
  [IdProvincia4] INT   REFERENCES Provincia(IdProvincia),
  [IdRProveedor5] INT  REFERENCES  RegistroProveedor(IdRProveedor),
  PRIMARY KEY ([IdAlcance])
);
CREATE TABLE [Escuela] (
  [IdEscuela] INT IDENTITY,
  [IdModalidad5] INT   REFERENCES  Modalidad(IdModalidad),
  [IdCocinaIn4] INT    REFERENCES  CocinaIndustrial(IDCocinaIn),
  [IdDireccion7] INT   REFERENCES   Direccion(IdDireccion),
  [IdAlmacen3] INT REFERENCES Almacen(IdAlmacen),
  [Nombre] VARCHAR(50),
  [NumEstudiantes] INT ,
  [Telefono] CHAR(10),
  PRIMARY KEY ([IdEscuela])
);

--DML
--------SIN FK------------------------------------------
--TipoProveedor
SELECT *FROM TipoProveedor

INSERT INTO TipoProveedor(TipoProveedor) VALUES ('Proveedor para Almuerzo')
INSERT INTO TipoProveedor(TipoProveedor) VALUES ('Proveedor para Desayuno')

--Estado
SELECT *FROM Estado

INSERT INTO Estado(Estado) VALUES ('Activo')
INSERT INTO Estado(Estado) VALUES ('Inactivo')
INSERT INTO Estado(Estado) VALUES ('Suspendido')

--Modalidad
SELECT *FROM Modalidad

INSERT INTO Modalidad(Modalidad) VALUES ('Modalidad de Jornada Tanda Extendida')
INSERT INTO Modalidad(Modalidad) VALUES ('Modalidad PAE Fronterizo')
INSERT INTO Modalidad(Modalidad) VALUES ('Modalidad PAE Real')
INSERT INTO Modalidad(Modalidad) VALUES ('Modalidad PAE Urbano')

--Provincia
SELECT *FROM Provincia

INSERT INTO Provincia(Provincia) VALUES ('Azua')
INSERT INTO Provincia(Provincia) VALUES ('Bahoruco')
INSERT INTO Provincia(Provincia) VALUES ('Barahona')
INSERT INTO Provincia(Provincia) VALUES ('Dajabón')
INSERT INTO Provincia(Provincia) VALUES ('Distrito Nacional')
INSERT INTO Provincia(Provincia) VALUES ('Duarte')
INSERT INTO Provincia(Provincia) VALUES ('Elias Piña')
INSERT INTO Provincia(Provincia) VALUES ('El Seibo')
INSERT INTO Provincia(Provincia) VALUES ('Espaillat')
INSERT INTO Provincia(Provincia) VALUES ('Hato Mayor')
INSERT INTO Provincia(Provincia) VALUES ('Hermanas Mirabal')
INSERT INTO Provincia(Provincia) VALUES ('Independencia')
INSERT INTO Provincia(Provincia) VALUES ('La Altagracia')
INSERT INTO Provincia(Provincia) VALUES ('La Romana')
INSERT INTO Provincia(Provincia) VALUES ('La Vega')
INSERT INTO Provincia(Provincia) VALUES ('María Trinidad Sánchez')
INSERT INTO Provincia(Provincia) VALUES ('Monseñor Nouel')
INSERT INTO Provincia(Provincia) VALUES ('Monte Cristi')
INSERT INTO Provincia(Provincia) VALUES ('Monte Plata')
INSERT INTO Provincia(Provincia) VALUES ('Samaná')
INSERT INTO Provincia(Provincia) VALUES ('Sánchez Ramirez')
INSERT INTO Provincia(Provincia) VALUES ('San Cristobal')
INSERT INTO Provincia(Provincia) VALUES ('San José de Ocoa')
INSERT INTO Provincia(Provincia) VALUES ('San Juan')
INSERT INTO Provincia(Provincia) VALUES ('San Pedro de Macorís')
INSERT INTO Provincia(Provincia) VALUES ('Santiago')
INSERT INTO Provincia(Provincia) VALUES ('Santiago Rodríguez')
INSERT INTO Provincia(Provincia) VALUES ('Santo Domingo')
INSERT INTO Provincia(Provincia) VALUES ('Valverde')
INSERT INTO Provincia(Provincia) VALUES ('Pedernales')
INSERT INTO Provincia(Provincia) VALUES ('Peravia')
INSERT INTO Provincia(Provincia) VALUES ('Puerto Plata')

--TipoProducto
SELECT *FROM TipoProducto

INSERT INTO TipoProducto(TipoProducto,Descripcion) VALUES ('Con Gluten', 'En esta categoria entra los panes, galletas...')
INSERT INTO TipoProducto(TipoProducto,Descripcion) VALUES ('Proteina', 'En esta categoria entra carne de Res, cerdo, pollo,bacalao...')
INSERT INTO TipoProducto(TipoProducto,Descripcion) VALUES ('Carbohidratos', 'En esta categoria entra el arroz, la pasta, viveres...')
INSERT INTO TipoProducto(TipoProducto,Descripcion) VALUES ('Bebibles', 'En esta categoria entra el jugo, la leche...')
INSERT INTO TipoProducto(TipoProducto,Descripcion) VALUES ('Enlatados', 'En esta categoria entra las sardinas, la salchicha...')
INSERT INTO TipoProducto(TipoProducto,Descripcion) VALUES ('Leguminosas', 'En esta categoria entra las habichuelas, frijoles...')
INSERT INTO TipoProducto(TipoProducto,Descripcion) VALUES ('Vegetales', 'En esta categoria entra zanahoria, maiz...')

--Direccion
INSERT INTO Direccion(Direccion) VALUES ('Calle Gregorio Luperón, Pedernales 84000')
INSERT INTO Direccion(Direccion) VALUES ('Av Duarte 185, Pedernales')
INSERT INTO Direccion(Direccion) VALUES ('C/Benigno Cuesta # 56')
INSERT INTO Direccion(Direccion) VALUES ('Ave. Venezuela N 29. Enriquillo')

INSERT INTO Direccion(Direccion) VALUES ('Guayabo')
INSERT INTO Direccion(Direccion) VALUES ('Carretera camino a Pinzon')
INSERT INTO Direccion(Direccion) VALUES ('Carretera Entrada de Los Caños Reparadero Yamasa')
INSERT INTO Direccion(Direccion) VALUES ('Carretera Yamasa -Santo Domingo,Reparadero')

INSERT INTO Direccion(Direccion) VALUES ('Alcidez veloz')
INSERT INTO Direccion(Direccion) VALUES ('Carretera Sánchez, Casi Esq. Luperón')

INSERT INTO Direccion(Direccion) VALUES ('C/ Caracas #57, Villa Francisca')
INSERT INTO Direccion(Direccion) VALUES ('c/José Martí, esq. 27 de Febrero, No.98; Villa Fca')
INSERT INTO Direccion(Direccion) VALUES ('Correa y Cidron, #27 casi Italia. Honduras')
INSERT INTO Direccion(Direccion) VALUES ('Ave.Duarte No.445 Esq. Ave.Ovando Ens. Capotillo')
INSERT INTO Direccion(Direccion) VALUES ('Ave.Duarte No.445 Esq. Ave.Ovando Ens. Capotillo')

------------------------------CON FK--------------------------------------------------

--Producto
INSERT INTO Producto(IdTipoProducto1,Producto,Precio) VALUES (1,'panes',85.00)
INSERT INTO Producto(IdTipoProducto1,Producto,Precio) VALUES (3,'Arroz',61.00)
INSERT INTO Producto(IdTipoProducto1,Producto,Precio) VALUES (3,'Platano',45.90)
INSERT INTO Producto(IdTipoProducto1,Producto,Precio) VALUES (4,'Leche',58.00)

INSERT INTO Producto(IdTipoProducto1,Producto,Precio) VALUES (7,'Tomate',68.00)
INSERT INTO Producto(IdTipoProducto1,Producto,Precio) VALUES (3,'Papas',77.00)
INSERT INTO Producto(IdTipoProducto1,Producto,Precio) VALUES (7,'cebollas',127.00)
INSERT INTO Producto(IdTipoProducto1,Producto,Precio) VALUES (6,'Habichuelas Rojas',45.90)
INSERT INTO Producto(IdTipoProducto1,Producto,Precio) VALUES (2,'Bacalao',138.01)

INSERT INTO Producto(IdTipoProducto1,Producto,Precio) VALUES (2,'Pollo',48.77)
INSERT INTO Producto(IdTipoProducto1,Producto,Precio) VALUES (2,'Carne de Cerdo',81.01)
INSERT INTO Producto(IdTipoProducto1,Producto,Precio) VALUES (2,'Carne de Res',90.22)
INSERT INTO Producto(IdTipoProducto1,Producto,Precio) VALUES (3,'Pasta codito',41.00)

INSERT INTO Producto(IdTipoProducto1,Producto,Precio) VALUES (5,'Salchichas',57.00)
INSERT INTO Producto(IdTipoProducto1,Producto,Precio) VALUES (5,'Atun',119.00)

--Distrito
SELECT *FROM Distrito

INSERT INTO Distrito(IdDireccion1,Distrito) VALUES (1,01) --Escuela Hernando Gorjon
INSERT INTO Distrito(IdDireccion1,Distrito) VALUES (2,01) --Escuela Bienvenido Morillo
INSERT INTO Distrito(IdDireccion1,Distrito) VALUES (3,02) --Tatiana Rodriguez
INSERT INTO Distrito(IdDireccion1,Distrito) VALUES (4,02) --Ismael Miranda

INSERT INTO Distrito(IdDireccion1,Distrito) VALUES (5,01) --MANUEL ANTONIO MORALES
INSERT INTO Distrito(IdDireccion1,Distrito) VALUES (6,01) --Hermanos Pinzon
INSERT INTO Distrito(IdDireccion1,Distrito) VALUES (7,01) --PEDRO DE LOS SANTOS - LOS CAÑOS
INSERT INTO Distrito(IdDireccion1,Distrito) VALUES (8,01) -- EMILIO PRUD´ HOMME - REPARADERO

INSERT INTO Distrito(IdDireccion1,Distrito) VALUES (9,03) --Santo Domingo Savio
INSERT INTO Distrito(IdDireccion1,Distrito) VALUES (10,03) -- HOGAR ESCUELA SANTO DOMINGO SAVIO

INSERT INTO Distrito(IdDireccion1,Distrito) VALUES (11,03) -- Republica de Uruguay 
INSERT INTO Distrito(IdDireccion1,Distrito) VALUES (12,03) --CAIPI - GUARDERIA SAN VICENTE DE PAUL

INSERT INTO Distrito(IdDireccion1,Distrito) VALUES (13,03) --ANTONIO DUVERGE
INSERT INTO Distrito(IdDireccion1,Distrito) VALUES (14,02) --SANTO CURA DE ARS (secundaria)
INSERT INTO Distrito(IdDireccion1,Distrito) VALUES (15,02)-- SANTO CURA DE ARS (primaria e inicial)

--Regional
SELECT *FROM Regional

INSERT INTO Regional(IdDistrito1,Regional) VALUES (1,1) 
INSERT INTO Regional(IdDistrito1,Regional) VALUES (2,1) 
INSERT INTO Regional(IdDistrito1,Regional) VALUES (3,1) 
INSERT INTO Regional(IdDistrito1,Regional) VALUES (4,1) 

INSERT INTO Regional(IdDistrito1,Regional) VALUES (5,2) 
INSERT INTO Regional(IdDistrito1,Regional) VALUES (6,2) 
INSERT INTO Regional(IdDistrito1,Regional) VALUES (7,17) 
INSERT INTO Regional(IdDistrito1,Regional) VALUES (8,17) 

INSERT INTO Regional(IdDistrito1,Regional) VALUES (9,06)
INSERT INTO Regional(IdDistrito1,Regional) VALUES (10,15)
INSERT INTO Regional(IdDistrito1,Regional) VALUES (11,15)
INSERT INTO Regional(IdDistrito1,Regional) VALUES (12,15)

INSERT INTO Regional(IdDistrito1,Regional) VALUES (13,15)
INSERT INTO Regional(IdDistrito1,Regional) VALUES (14,15)
INSERT INTO Regional(IdDistrito1,Regional) VALUES (15,15)

--Provincia Regional
SELECT *FROM [Provincia Regional]

INSERT INTO [Provincia Regional](IdProvincia1,IdRegional1) VALUES (3,1)
INSERT INTO [Provincia Regional](IdProvincia1,IdRegional1) VALUES (3,2)
INSERT INTO [Provincia Regional](IdProvincia1,IdRegional1) VALUES (3,3)
INSERT INTO [Provincia Regional](IdProvincia1,IdRegional1) VALUES (3,4)

INSERT INTO [Provincia Regional](IdProvincia1,IdRegional1) VALUES (24,5)
INSERT INTO [Provincia Regional](IdProvincia1,IdRegional1) VALUES (24,6)

INSERT INTO [Provincia Regional](IdProvincia1,IdRegional1) VALUES (19,7)
INSERT INTO [Provincia Regional](IdProvincia1,IdRegional1) VALUES (19,8)

INSERT INTO [Provincia Regional](IdProvincia1,IdRegional1) VALUES (15,9)
INSERT INTO [Provincia Regional](IdProvincia1,IdRegional1) VALUES (28,10)
INSERT INTO [Provincia Regional](IdProvincia1,IdRegional1) VALUES (28,11)
INSERT INTO [Provincia Regional](IdProvincia1,IdRegional1) VALUES (28,12)
INSERT INTO [Provincia Regional](IdProvincia1,IdRegional1) VALUES (28,13)
INSERT INTO [Provincia Regional](IdProvincia1,IdRegional1) VALUES (28,14)
INSERT INTO [Provincia Regional](IdProvincia1,IdRegional1) VALUES (28,15)


--Registro Proveedor
INSERT INTO RegistroProveedor VALUES (1,1,'Batissa,SRL','8092340102','As.John F. Kennedy no.34 Ensache Naco','101148861','0123')
INSERT INTO RegistroProveedor VALUES (2,1,'Limcoba,SRL','8092022345','Juan de Morfa No.12 San Carlos','101572191','0103')
INSERT INTO RegistroProveedor VALUES (1,1,'Ediesco,SRL','8094568997','Av.Romulo Betancourt 1420, Bella Vista','124002389','1128')
INSERT INTO RegistroProveedor VALUES (2,1,'Cary Industrial,S.A','8292340101','Ant Santiago 322','101742186','0155')
INSERT INTO RegistroProveedor VALUES (1,2,'El triangulo,SRL','8091234567','AV. 20 DE NOVIEMBRE NO. 1060','101779268','2123')
INSERT INTO RegistroProveedor VALUES (1,2,'Equimmof,SRL','8293451234','CARRETERA A LOMA ALTA S/N.','130298483','0012')
INSERT INTO RegistroProveedor VALUES (2,3,'Guzman Morel,SRL','8090123450','CALLE IGNACIO RAYON NO.934','130309932','0102')
INSERT INTO RegistroProveedor VALUES (2,3,'Gabamed,SRL','809123983','AV. LIBERTAD NO. 56','130309932','2340')
INSERT INTO RegistroProveedor VALUES (1,3,'Haila,SRL','8090234023','BOULEVAR BENITO JUAREZ NO. 197 -A','130086712','2120')
INSERT INTO RegistroProveedor VALUES (2,1,'Lis Representaciones,SRL','8091522035','CALLE MELCHOR OCAMPO NO. 635','124000483','9812')
--Modalidad proveedor
INSERT INTO ModalidadProveedor VALUES (3,1)
INSERT INTO ModalidadProveedor VALUES (4,1)
INSERT INTO ModalidadProveedor VALUES (5,1)
INSERT INTO ModalidadProveedor VALUES (6,2)
INSERT INTO ModalidadProveedor VALUES (7,2)
INSERT INTO ModalidadProveedor VALUES (8,3)
INSERT INTO ModalidadProveedor VALUES (9,3)
INSERT INTO ModalidadProveedor VALUES (10,3)
INSERT INTO ModalidadProveedor VALUES (1,1)
INSERT INTO ModalidadProveedor VALUES (2,4)

--ProveedorProducto
ALTER TABLE ProveedorProducto ALTER COLUMN Existencia Varchar(50);
INSERT INTO ProveedorProducto VALUES (1,1,'10,000 unidades')
INSERT INTO ProveedorProducto VALUES (1,2,'500 Libras')
INSERT INTO ProveedorProducto VALUES (2,3,'3000 Unidades')
INSERT INTO ProveedorProducto VALUES (2,4,'2000 Unidades')
INSERT INTO ProveedorProducto VALUES (3,5,'100 Libras')
INSERT INTO ProveedorProducto VALUES (3,6,'550 Libras')
INSERT INTO ProveedorProducto VALUES (4,7,'70 Libras')
INSERT INTO ProveedorProducto VALUES (5,8,'30 Libras')
INSERT INTO ProveedorProducto VALUES (6,9,'200 Libras')
INSERT INTO ProveedorProducto VALUES (7,10,'130 Libras')
INSERT INTO ProveedorProducto VALUES (8,11,'150 Libras')
INSERT INTO ProveedorProducto VALUES (9,12,'100 Libras')
INSERT INTO ProveedorProducto VALUES (10,13,'225 Libras')
INSERT INTO ProveedorProducto VALUES (10,14,'2500 Unidades')
INSERT INTO ProveedorProducto VALUES (8,15,'180 Unidades')
--Almacen
SELECT *FROM Almacen

INSERT INTO Almacen(IdEstado3,Capacidad,Ubicacion,Nombre) VALUES (1,500,'Los Mina', 'Almacen de Los Mina')
INSERT INTO Almacen(IdEstado3,Capacidad,Ubicacion,Nombre) VALUES (1,350,'Cabral', 'Almacen de Cabral, Barahona')
INSERT INTO Almacen(IdEstado3,Capacidad,Ubicacion,Nombre) VALUES (1,700,'San Jose de Ocoa', 'Almacen General San Jose')
INSERT INTO Almacen(IdEstado3,Capacidad,Ubicacion,Nombre) VALUES (1,1400,'San Cristobal', 'Almacen Patria, San Crsitobal')

UPDATE Almacen SET IdEstado3 = 2 WHERE IdAlmacen = 3


--CocinaIndustrial
INSERT INTO CocinaIndustrial VALUES (1,1,'Calle reparto seminario','IverCariba',100)
INSERT INTO CocinaIndustrial VALUES (1,2,'AV. Coronel Juan Maria Lora Fernandez NO.9','CC Cocinas IndustrialesSRL',200)
INSERT INTO CocinaIndustrial VALUES (2,1,'AV.Casandra Damiron 2','KHOURY INDUSTRIAL',95)
INSERT INTO CocinaIndustrial VALUES (3,1,'San Jose, No.25','Wndy,SRL',400)
INSERT INTO CocinaIndustrial VALUES (4,3,'Calle Gral Leger No.58','ISIS, S.A',750)
INSERT INTO CocinaIndustrial VALUES (4,1,'Calle Dr.Baez','Range Grill',920)

--PProductoAlmacen
INSERT INTO PProductoAlmacen VALUES (1,1)
INSERT INTO PProductoAlmacen VALUES (4,1)
INSERT INTO PProductoAlmacen VALUES (2,2)
INSERT INTO PProductoAlmacen VALUES (3,2)
INSERT INTO PProductoAlmacen VALUES (6,2)
INSERT INTO PProductoAlmacen VALUES (5,3)
INSERT INTO PProductoAlmacen VALUES (7,3)
INSERT INTO PProductoAlmacen VALUES (8,3)
INSERT INTO PProductoAlmacen VALUES (9,3)
INSERT INTO PProductoAlmacen VALUES (10,4)
INSERT INTO PProductoAlmacen VALUES (11,4)
INSERT INTO PProductoAlmacen VALUES (12,4)
INSERT INTO PProductoAlmacen VALUES (13,4)
INSERT INTO PProductoAlmacen VALUES (14,4)
INSERT INTO PProductoAlmacen VALUES (15,4)



--Alcance
SELECT *FROM Alcance
INSERT INTO Alcance (IdCocinaIN1,IdProvincia4,IdRProveedor5) VALUES (1,28,1)
INSERT INTO Alcance (IdCocinaIN1,IdProvincia4,IdRProveedor5) VALUES (2,3,3)
INSERT INTO Alcance (IdCocinaIN1,IdProvincia4,IdRProveedor5) VALUES (3,9,2)
INSERT INTO Alcance (IdCocinaIN1,IdProvincia4,IdRProveedor5) VALUES (4,8,4)
INSERT INTO Alcance (IdCocinaIN1,IdProvincia4,IdRProveedor5) VALUES (5,31,6)
INSERT INTO Alcance (IdCocinaIN1,IdProvincia4,IdRProveedor5) VALUES (6,13,1)

--Escuela
SELECT *FROM Escuela

INSERT INTO Escuela(IdModalidad5,IdCocinaIn4,IdDireccion7,IdAlmacen3,Nombre,[NumEstudiantes],Telefono) VALUES (1,4,1,NULL,'Escuela Hernando Gorjon',
150,'8095553851')

INSERT INTO Escuela(IdModalidad5,IdCocinaIn4,IdDireccion7,IdAlmacen3,Nombre,[NumEstudiantes],Telefono) VALUES (4,2,2,NULL,'Escuela Bienvenido Morillo',
350,'8097884115')

INSERT INTO Escuela(IdModalidad5,IdCocinaIn4,IdDireccion7,IdAlmacen3,Nombre,[NumEstudiantes],Telefono) VALUES(1,3,3,NULL,'Tatiana Rodriguez',95,'8096935412')

INSERT INTO Escuela(IdModalidad5,IdCocinaIn4,IdDireccion7,IdAlmacen3,Nombre,[NumEstudiantes],Telefono) VALUES(1,6,4,NULL,'Ismael Miranda',150,'8098789562')

INSERT INTO Escuela(IdModalidad5,IdCocinaIn4,IdDireccion7,IdAlmacen3,Nombre,[NumEstudiantes],Telefono) VALUES(3,NULL,5,3,'Manuel Antonio Morales',100,'8094561230')

INSERT INTO Escuela(IdModalidad5,IdCocinaIn4,IdDireccion7,IdAlmacen3,Nombre,[NumEstudiantes],Telefono) VALUES(3,NULL,6,3,'Hermanos Pinzon',150,'8098512430')

INSERT INTO Escuela(IdModalidad5,IdCocinaIn4,IdDireccion7,IdAlmacen3,Nombre,[NumEstudiantes],Telefono) VALUES(3,NULL,7,2,'Pedro De Los Santos - Los Caños',200,'8095623214')

INSERT INTO Escuela(IdModalidad5,IdCocinaIn4,IdDireccion7,IdAlmacen3,Nombre,[NumEstudiantes],Telefono) VALUES(1,6,8,NULL,'Emilio Prud´ Homme - Reparadero'
,175, '8097465213')

INSERT INTO Escuela(IdModalidad5,IdCocinaIn4,IdDireccion7,IdAlmacen3,Nombre,[NumEstudiantes],Telefono) VALUES(3,NULL,9,2,'Santo Domingo Savio'
,165,'8095652230')

INSERT INTO Escuela(IdModalidad5,IdCocinaIn4,IdDireccion7,IdAlmacen3,Nombre,[NumEstudiantes],Telefono) VALUES(1,5,10,NULL,'Hogar Escuela Santo Domingo Savio',650,'8099956523')

INSERT INTO Escuela(IdModalidad5,IdCocinaIn4,IdDireccion7,IdAlmacen3,Nombre,[NumEstudiantes],Telefono) VALUES(1,4,11,NULL,'Republica de Uruguay'
,375,'8097754525')

INSERT INTO Escuela(IdModalidad5,IdCocinaIn4,IdDireccion7,IdAlmacen3,Nombre,[NumEstudiantes],Telefono) VALUES(4,NULL,12,4,'CAIPI - Guarderia San Vicente De Paul'
,100,'8094463625')

INSERT INTO Escuela(IdModalidad5,IdCocinaIn4,IdDireccion7,IdAlmacen3,Nombre,[NumEstudiantes],Telefono) VALUES(4,4,13,NULL,'Antonio Duvergue',600,'8098885654')

INSERT INTO Escuela(IdModalidad5,IdCocinaIn4,IdDireccion7,IdAlmacen3,Nombre,[NumEstudiantes],Telefono) VALUES(1,6,14,NULL,'Santo Cura de ARS (secundaria)',800,'8098466621')

INSERT INTO Escuela(IdModalidad5,IdCocinaIn4,IdDireccion7,IdAlmacen3,Nombre,[NumEstudiantes],Telefono) VALUES(1,6,15,NULL,'Santo Cura de ARS (Primaria e Inicial)'
,900, '8098466621')


--------------------CONSULTAS------------------------
--Cuales escuelas reciben el beneficio por modalidad 
SELECT Nombre AS Escuela, Mo.Modalidad AS Modalidad
FROM Escuela AS Es
INNER JOIN Modalidad AS Mo ON Mo.IdModalidad = Es.IdModalidad5
ORDER BY Nombre

--Cuantas escuelas reciben los beneficios
SELECT COUNT(IdEscuela)  AS CantEscuelas
FROM Escuela
WHERE IdModalidad5 IS NOT NULL 

-- Cuantas escuelas reciben el beneficio por provincia 
SELECT pro.Provincia, COUNT(IdEscuela) AS CantEscuelas
FROM Escuela
INNER JOIN Distrito AS Dis ON Dis.IdDireccion1 = Escuela.IdDireccion7
INNER JOIN Regional AS Reg ON Reg.IdDistrito1 = Dis.IdDistrito
INNER JOIN [Provincia Regional] AS PR ON PR.IdRegional1 = Reg.IdRegional
INNER JOIN Provincia AS Pro ON Pro.IdProvincia = PR.IdProvincia1
WHERE IdModalidad5 IS NOT NULL 
GROUP BY Provincia


--Cuales escuelas a nivel nacional reciben los beneficios con su disrito, regional y provincia 
SELECT Nombre AS Escuela, Dis.IdDistrito AS Distrito,Reg.Regional, Pro.Provincia AS Provincia
FROM Escuela AS Es
INNER JOIN Distrito AS Dis ON Dis.IdDireccion1 = Es.IdDireccion7
INNER JOIN Regional AS Reg ON Reg.IdDistrito1 = Dis.IdDistrito
INNER JOIN [Provincia Regional] AS PR ON PR.IdRegional1 = Reg.IdRegional
INNER JOIN Provincia AS Pro ON Pro.IdProvincia = PR.IdProvincia1
ORDER BY Escuela, Provincia

--Cual es el alcance de las Cocinas Industriales a nivel nacional
SELECT Nombre AS CocinaIn, Pro.Provincia AS Provincia
FROM CocinaIndustrial AS CI
INNER JOIN Alcance AS Al ON Al.IdCocinaIN1 = CI.IdCocinaIn
INNER JOIN Provincia AS Pro ON Pro.IdProvincia = Al.IdProvincia4
ORDER BY CocinaIn

--En cual producto la organizacion gasta más o y en cual se gasta menos.

SELECT IdProducto, Producto, Precio AS Precios
FROM Producto
WHERE Precio IN(
SELECT MIN(Precio) AS PrecioMin
FROM Producto
WHERE IdProducto BETWEEN 1 and 15
UNION
SELECT MAX(Precio) AS PrecioMax
FROM Producto
WHERE IdProducto BETWEEN 1 and 15 
)
GROUP BY IdProducto, Producto,Precio

-- Cuales Productos estan en extendida en los almacenes

SELECT Nombre,Producto, Existencia  FROM Almacen 
INNER JOIN PProductoAlmacen on Almacen.IdAlmacen = PProductoAlmacen.IdAlmacen2
INNER JOIN ProveedorProducto on ProveedorProducto.IdPProducto = PProductoAlmacen.IdPProducto5
INNER JOIN Producto ON Producto.IdProducto = ProveedorProducto.IdProducto1
GROUP BY Nombre, Existencia,Producto;

--Cuales productos distribuyen los proveedores. 
SELECT Nombre AS Proveedor, Producto AS Producto
FROM  RegistroProveedor AS Re 
INNER JOIN ProveedorProducto AS Pr ON Pr.IdRProveedor2 = Re.IdRProveedor
INNER JOIN Producto AS Pro ON Pro.IdProducto = Pr.IdProducto1 
ORDER BY Producto
