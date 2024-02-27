SET search_path TO smart_shell;

-- SELECT current_schema();

DROP VIEW IF EXISTS VW_TYPE_PAYMENT_CONDITION;

DROP TABLE IF EXISTS TBL_TYPE_BUSINESS_PARTNER;

CREATE TABLE TBL_TYPE_BUSINESS_PARTNER(
	TYPBUSPAR INTEGER,
	ABREVI VARCHAR(10),
	DESCRI VARCHAR(250),
	CODEXT VARCHAR(100),
	OBSERV VARCHAR(500),
	COMMEN VARCHAR(4000),
	STATUS VARCHAR(1) DEFAULT 'Y',
	CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
	UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
	CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP		
);

ALTER TABLE TBL_TYPE_BUSINESS_PARTNER
	ADD CONSTRAINT PK_TYPE_BUSINESS_PARTNER PRIMARY KEY (TYPBUSPAR);

INSERT INTO TBL_TYPE_BUSINESS_PARTNER (TYPBUSPAR,ABREVI,DESCRI)
VALUES
	(1,'CLIE','CLIENTE'),
	(2,'PROV','PROVEEDOR');
	
SELECT * FROM TBL_TYPE_BUSINESS_PARTNER;

DROP TABLE IF EXISTS TBL_TYPE_IDENTITY_DOCUMENT;

CREATE TABLE TBL_TYPE_IDENTITY_DOCUMENT(
	TYPIDEDOC INTEGER,
	ABREVI VARCHAR(10),
	DESCRI VARCHAR(250),
	CODEXT VARCHAR(100),
	OBSERV VARCHAR(500),
	COMMEN VARCHAR(4000),
	STATUS VARCHAR(1) DEFAULT 'Y',
	CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
	UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
	CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE TBL_TYPE_IDENTITY_DOCUMENT
	ADD CONSTRAINT PK_TYPE_IDENTITY_DOCUMENT PRIMARY KEY (TYPIDEDOC);

INSERT INTO TBL_TYPE_IDENTITY_DOCUMENT (TYPIDEDOC, ABREVI, DESCRI, CODEXT, OBSERV, COMMEN)
VALUES
	(1,'DNI','DNI','01','Documento Nacional de Identidad','Documento Nacional de Identidad'),
	(2,'RUC','RUC','03','Registro Único de Contribuyentes','Registro Único de Contribuyentes');

SELECT * FROM TBL_TYPE_IDENTITY_DOCUMENT;

DROP TABLE IF EXISTS TBL_TYPE_PAYMENT_CONDITION;

CREATE TABLE TBL_TYPE_PAYMENT_CONDITION(
	TYPPAYCON INTEGER,
	ABREVI VARCHAR(10),
	DESCRI VARCHAR(250),
	CODEXT VARCHAR(100),
	OBSERV VARCHAR(500),
	COMMEN VARCHAR(4000),
	STATUS VARCHAR(1) DEFAULT 'Y',
	CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
	UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
	CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE TBL_TYPE_PAYMENT_CONDITION
	ADD CONSTRAINT PK_TYPE_PAYMENT_CONDITION PRIMARY KEY (TYPPAYCON);

INSERT INTO TBL_TYPE_PAYMENT_CONDITION (TYPPAYCON, ABREVI, DESCRI)
VALUES 
	(1, 'Cont', 'Cash payment (full amount paid)'),
	(2, 'Exch','For exchange or interchange of goods'),
	(3, 'Gift', 'For gift, free transfer, draw, voucher, ...'),
	(10, 'Cred 7D', '7 days credit'),
	(11, 'Cred 15D', '15 days credit'),
	(12, 'Cred 30D', '30 days credit'),
	(13, 'Cred 45D', '45 days credit'),
	(14, 'Cred 60D', '60 days credit'),
	(15, 'Cred 75D', '75 days credit'),
	(16, 'Cred 90D', '90 days credit'),
	(17, 'Term sell', 'At a term defined by the seller'),
	(18, 'Note 7D', 'Credit with note every 7 days'),
	(19, 'Note 15D', 'Credit with note every 15 days'),
	(20, 'Note 30D', 'Credit with note every 30 days'),
	(21, 'Note sell', 'Credit with note to be defined by the seller');

SELECT * FROM TBL_TYPE_PAYMENT_CONDITION;

DROP TABLE IF EXISTS TBL_BUSINESS_PARTNER;

CREATE TABLE TBL_BUSINESS_PARTNER(
	CODBUSPAR VARCHAR(50),
	TYPBUSPAR INTEGER,
	TYPIDEDOC INTEGER,
	NROIDEDOC VARCHAR(100), 
	CODEXT VARCHAR(100),
	BUSNAM VARCHAR(250),
	APEPAT VARCHAR(75),
	APEMAT VARCHAR(75),
	NOMBRE VARCHAR(100),
	REGISTDATE DATE,
	ADDRES VARCHAR(250),
	POSCOD VARCHAR(20),
	CODTEL VARCHAR(10),
	TELEFO VARCHAR(20),
	EMAIL VARCHAR(100),
	TYPPAYCON INTEGER,
	LIMCRE NUMERIC(16,4),
	CODLISTPRICE INTEGER DEFAULT 1,
	IMAGE BYTEA,
	OBSERV VARCHAR(500),
	COMMEN VARCHAR(4000),
	STATUS VARCHAR(1) DEFAULT 'Y',
	CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
	UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
	CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP	
);

ALTER TABLE TBL_BUSINESS_PARTNER
	ADD CONSTRAINT PK_BUSINESS_PARTNER PRIMARY KEY (CODBUSPAR);

INSERT INTO TBL_BUSINESS_PARTNER (CODBUSPAR, TYPBUSPAR, TYPIDEDOC, NROIDEDOC, BUSNAM, APEPAT, APEMAT, NOMBRE, REGISTDATE, POSCOD, ADDRES, CODTEL, TELEFO, EMAIL) VALUES
('43258916', 1, 1, '43258916', 'Juan Perez Garcia', 'Perez', 'Garcia', 'Juan', '2023-05-05', 'Lima 01', 'Av. Arequipa 123', '+1 (987)', '654-3210', 'juan.perez@gmail.com'),
('71836425', 1, 1, '71836425', 'Maria Gomez Torres', 'Gomez', 'Torres', 'Maria', '2023-05-05', 'Lima 02', 'Jr. Ayacucho 456', '+44', '7123 456789', 'maria.gomez@gmail.com'),
('20675348', 1, 1, '20675348', 'Luis Rodriguez Suarez', 'Rodriguez', 'Suarez', 'Luis', '2023-05-05', 'Lima 03', 'Av. La Marina 789', '+61', '412 345 678', 'luis.rodriguez@gmail.com'),
('89124567', 1, 1, '89124567', 'Ana Garcia Pacheco', 'Garcia', 'Pacheco', 'Ana', '2023-05-05', 'Lima 04', 'Av. Brasil 1011', '+33', '6 1234 5678', 'ana.garcia@gmail.com'),
('65498732', 1, 1, '65498732', 'Pedro Castillo Chavez', 'Castillo', 'Chavez', 'Pedro', '2023-05-05', 'Lima 05', 'Av. Tacna 1213', '+49', '1512 3456789', 'pedro.castillo@gmail.com'),
('20548796214', 1, 2, '20548796214', 'Supermercados SAC', '', '', '', '2023-05-05', 'Lima 06', 'Av. Universitaria 1415', '+81', '80 1234 5678', 'ventas@supermercados.com'),
('10432687953', 1, 2, '10432687953', 'Importadora SA', '', '', '', '2023-05-05', 'Lima 07', 'Jr. Huallaga 1617', '+39', '345 678 9012', 'info@importadora.com'),
('30985214672', 1, 2, '30985214672', 'Constructora SA', '', '', '', '2023-05-05', 'Lima 08', 'Av. Los Incas 1819', '+52', '1 234 567 8901', 'contacto@constructora.com'),
('70215896347', 1, 2, '70215896347', 'Consultora SAC', '', '', '', '2023-05-05', 'Lima 09', 'Av. Javier Prado 2021', '+34', '612 345 678', 'info@consultora.com'),
('40879162350', 1, 2, '40879162350', 'Distribuidora SAC', '', '', '', '2023-05-05', 'Lima 10', 'Av. La Molina 2223', '+61', '4123 45678', 'ventas@distribuid.com');

INSERT INTO TBL_BUSINESS_PARTNER (CODBUSPAR, TYPBUSPAR, TYPIDEDOC, NROIDEDOC, BUSNAM, APEPAT, APEMAT, NOMBRE, REGISTDATE, POSCOD, ADDRES, CODTEL, TELEFO, EMAIL) VALUES
('20987534', 1, 1, '20987534', 'Carlos Ramirez López', 'Ramirez', 'López', 'Carlos', '2023-05-05', 'Lima 11', 'Av. Primavera 2324', '+1 (234)', '567-8901', 'carlos.ramirez@gmail.com'),
('65432198', 1, 1, '65432198', 'Laura Fernández Castro', 'Fernández', 'Castro', 'Laura', '2023-05-05', 'Lima 12', 'Jr. Las Flores 2526', '+44', '1234 567890', 'laura.fernandez@gmail.com'),
('18765432', 1, 1, '18765432', 'Miguel Torres Sanchez', 'Torres', 'Sanchez', 'Miguel', '2023-05-05', 'Lima 13', 'Av. Los Alamos 2728', '+61', '2 3456 7890', 'miguel.torres@gmail.com'),
('97654321', 1, 1, '97654321', 'Fernanda Herrera Gutierrez', 'Herrera', 'Gutierrez', 'Fernanda', '2023-05-05', 'Lima 14', 'Jr. Huancayo 2930', '+33', '1 23 45 67 89', 'fernanda.herrera@gmail.com'),
('54321678', 1, 1, '54321678', 'Roberto Martinez Vargas', 'Martinez', 'Vargas', 'Roberto', '2023-05-05', 'Lima 15', 'Av. Los Pinos 3132', '+49', '1234 567890', 'roberto.martinez@gmail.com'),
('20675348260', 1, 2, '20675348260', 'Restaurante El Sabor', '', '', '', '2023-05-05', 'Lima 16', 'Av. Principal 3334', '+81', '3 4567 8901', 'info@elsabor.com'),
('89124567218', 1, 2, '89124567218', 'Tienda La Moda', '', '', '', '2023-05-05', 'Lima 17', 'Jr. Comercio 3536', '+39', '02 3456 7890', 'ventas@tiendalamoda.com'),
('65498732981', 1, 2, '65498732981', 'Constructora Proyectos', '', '', '', '2023-05-05', 'Lima 18', 'Av. Industrial 3738', '+52', '55 1234 5678', 'contacto@constructoraproyectos.com'),
('20548796213', 1, 2, '20548796213', 'Consultoría Empresarial', '', '', '', '2023-05-05', 'Lima 19', 'Av. San Martin 3940', '+34', '912 345 678', 'info@consultoriaempresarial.com'),
('10432687959', 1, 2, '10432687959', 'Distribuidora Mayorista', '', '', '', '2023-05-05', 'Lima 19', 'Av. San Martin 3940', '+34', '912 345 678', 'info@consultoriaempresarial.com');

INSERT INTO TBL_BUSINESS_PARTNER (CODBUSPAR, TYPBUSPAR, TYPIDEDOC, NROIDEDOC, BUSNAM, APEPAT, APEMAT, NOMBRE, REGISTDATE, POSCOD, ADDRES, CODTEL, TELEFO, EMAIL) VALUES
('76543210', 1, 1, '76543210', 'Sandra Gómez Rojas', 'Gómez', 'Rojas', 'Sandra', '2023-05-05', 'Lima 20', 'Jr. San Isidro 4142', '+61', '4123 456789', 'sandra.gomez@gmail.com'),
('32109876', 1, 1, '32109876', 'Jorge Silva Medina', 'Silva', 'Medina', 'Jorge', '2023-05-05', 'Lima 21', 'Av. Los Pinos 4344', '+1 (987)', '654-3210', 'jorge.silva@gmail.com'),
('65473928', 1, 1, '65473928', 'Luisa Torres Rojas', 'Torres', 'Rojas', 'Luisa', '2023-05-05', 'Lima 22', 'Jr. Huancavelica 4546', '+44', '7123 456789', 'luisa.torres@gmail.com'),
('98763452', 1, 1, '98763452', 'Ana Mendoza Castillo', 'Mendoza', 'Castillo', 'Ana', '2023-05-05', 'Lima 23', 'Av. Los Incas 4748', '+61', '412 345 678', 'ana.mendoza@gmail.com'),
('54325689', 1, 1, '54325689', 'Roberto Rojas Díaz', 'Rojas', 'Díaz', 'Roberto', '2023-05-05', 'Lima 24', 'Av. La Molina 4950', '+33', '6 1234 5678', 'roberto.rojas@gmail.com'),
('40879162399', 1, 2, '40879162399', 'Restaurante El Paraíso', '', '', '', '2023-05-05', 'Lima 25', 'Av. Principal 5152', '+81', '80 1234 5678', 'info@elparaiso.com'),
('70215896349', 1, 2, '70215896349', 'Tienda Moda Urbana', '', '', '', '2023-05-05', 'Lima 26', 'Jr. Comercio 5354', '+39', '345 678 9012', 'ventas@modaurbana.com'),
('30985214656', 1, 2, '30985214656', 'Constructora Obras Maestras', '', '', '', '2023-05-05', 'Lima 27', 'Av. Industrial 5556', '+52', '1 234 567 8901', 'contacto@obrasmaestras.com'),
('51617382940', 1, 2, '51617382940', 'Consultoría Financiera', '', '', '', '2023-05-05', 'Lima 28', 'Av. San Martin 5758', '+34', '612 345 678', 'info@consultoriafinanciera.com'),
('91528463712', 1, 2, '91528463712', 'Distribuidora Minorista', '', '', '', '2023-05-05', 'Lima 19', 'Av. San Martin 3940', '+34', '912 345 678', 'info@consultoriaempresarial.com');

INSERT INTO TBL_BUSINESS_PARTNER (CODBUSPAR, TYPBUSPAR, TYPIDEDOC, NROIDEDOC, BUSNAM, APEPAT, APEMAT, NOMBRE, REGISTDATE, POSCOD, ADDRES, CODTEL, TELEFO, EMAIL) VALUES
('23456789', 1, 1, '23456789', 'María Paredes López', 'Paredes', 'López', 'María', '2023-05-05', 'Lima 29', 'Av. Los Alamos 5950', '+61', '2 3456 7890', 'maria.paredes@gmail.com'),
('56789012', 1, 1, '56789012', 'Juan Herrera Torres', 'Herrera', 'Torres', 'Juan', '2023-05-05', 'Lima 30', 'Jr. Huancayo 6162', '+1 (234)', '567-8901', 'juan.herrera@gmail.com'),
('90123456', 1, 1, '90123456', 'Laura Gutiérrez Castro', 'Gutiérrez', 'Castro', 'Laura', '2023-05-05', 'Lima 31', 'Av. Los Pinos 6364', '+44', '1234 567890', 'laura.gutierrez@gmail.com'),
('34567890', 1, 1, '34567890', 'Miguel Sánchez Rojas', 'Sánchez', 'Rojas', 'Miguel', '2023-05-05', 'Lima 32', 'Jr. Huancavelica 6566', '+61', '4123 456789', 'miguel.sanchez@gmail.com'),
('67890123', 1, 1, '67890123', 'Fernanda Díaz Mendoza', 'Díaz', 'Mendoza', 'Fernanda', '2023-05-05', 'Lima 33', 'Av. Los Incas 6768', '+33', '1 23 45 67 89', 'fernanda.diaz@gmail.com'),
('70192836457', 1, 2, '70192836457', 'Restaurante La Terraza', '', '', '', '2023-05-05', 'Lima 34', 'Av. Principal 6970', '+81', '3 4567 8901', 'info@laterraza.com'),
('30987654321', 1, 2, '30987654321', 'Tienda de Deportes Xtreme', '', '', '', '2023-05-05', 'Lima 35', 'Jr. Comercio 7172', '+39', '02 3456 7890', 'ventas@xtreme.com'),
('90876543210', 1, 2, '90876543210', 'Constructora Proyectos Futuros', '', '', '', '2023-05-05', 'Lima 36', 'Av. Industrial 7374', '+52', '55 1234 5678', 'contacto@proyectosfuturos.com'),
('40321987654', 1, 2, '40321987654', 'Consultoría Estratégica Empresarial', '', '', '', '2023-05-05', 'Lima 37', 'Av. San Martin 7576', '+34', '912 345 678', 'info@consultoriaestrategica.com'),
('60213459876', 1, 2, '60213459876', 'Distribuid Empresarial', '', '', '', '2023-05-05', 'Lima 19', 'Av. San Martin 3940', '+34', '912 345 678', 'info@consultoriaempresarial.com');

INSERT INTO TBL_BUSINESS_PARTNER (CODBUSPAR, TYPBUSPAR, TYPIDEDOC, NROIDEDOC, BUSNAM, APEPAT, APEMAT, NOMBRE, REGISTDATE, POSCOD, ADDRES, CODTEL, TELEFO, EMAIL) VALUES
('80347596213', 1, 2, '80347596213', 'ElectroTech Solutions', '', '', '', '2023-05-05', 'Lima 38', 'Av. Tecnológica 777', '+51', '999 888 777', 'info@electrotech.com'),
('60293847561', 1, 2, '60293847561', 'Fashionista Boutique', '', '', '', '2023-05-05', 'Lima 39', 'Jr. Moda 888', '+51', '987 654 321', 'ventas@fashionista.com'),
('90817263549', 1, 2, '90817263549', 'GreenThumb Landscaping', '', '', '', '2023-05-05', 'Lima 40', 'Av. Jardín 999', '+51', '912 345 678', 'contact@greenthumb.com'),
('40506070892', 1, 2, '40506070892', 'Bookworm Library', '', '', '', '2023-05-05', 'Lima 41', 'Jr. Libros 111', '+51', '911 222 333', 'info@bookwormlibrary.com'),
('50987543216', 1, 2, '50987543216', 'Crazy Caffeine Coffee', '', '', '', '2023-05-05', 'Lima 42', 'Av. Café 222', '+51', '955 888 999', 'hello@crazycaffeine.com'),
('70403020189', 1, 2, '70403020189', 'Pixel Perfect Design', '', '', '', '2023-05-05', 'Lima 43', 'Jr. Diseño 333', '+51', '977 222 333', 'info@pixelperfect.com'),
('20648759231', 1, 2, '20648759231', 'SoundScape Studios', '', '', '', '2023-05-05', 'Lima 44', 'Av. Sonido 444', '+51', '933 444 555', 'studio@soundscape.com'),
('90123456789', 1, 2, '90123456789', 'Artisanal Delights', '', '', '', '2023-05-05', 'Lima 45', 'Jr. Artesanía 555', '+51', '966 777 888', 'info@artisanaldelights.com'),
('30709060504', 1, 2, '30709060504', 'TechWhiz Solutions', '', '', '', '2023-05-05', 'Lima 46', 'Av. Tecnología 666', '+51', '944 555 666', 'info@techwhiz.com'),
('40201030507', 1, 2, '40201030507', 'Event Horizon Productions', '', '', '', '2023-05-05', 'Lima 47', 'Jr. Eventos 777', '+51', '977 666 777', 'contact@eventhorizon.com');

SELECT * FROM TBL_BUSINESS_PARTNER;

DROP TABLE IF EXISTS TBL_BUSPAR_PAYMENT_CONDITION;

CREATE TABLE TBL_BUSPAR_PAYMENT_CONDITION(
	CODBUSPAR VARCHAR(50),
	TYPPAYCON INTEGER,
	LIMCRE NUMERIC(16,4),
	STATUS VARCHAR(1) DEFAULT 'Y',
	CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
	UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
	CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE TBL_BUSPAR_PAYMENT_CONDITION 
	ADD CONSTRAINT PK_BUSPAR_PAYMENT_CONDITION PRIMARY KEY (CODBUSPAR,TYPPAYCON);

INSERT INTO TBL_BUSPAR_PAYMENT_CONDITION (CODBUSPAR, TYPPAYCON, LIMCRE)
VALUES
('65498732',1,0),
('65498732',2,0),
('65498732',3,0),
('65498732',11,0),
('65498732',12,0),
('65498732',13,0),
('65498732',14,0),
('65498732',15,0),
('65498732',16,0),
('65498732',17,0),
('65498732',18,0),
('65498732',19,0),
('65498732',20,0),
('65498732',21,0);

SELECT * FROM TBL_BUSPAR_PAYMENT_CONDITION;

CREATE OR REPLACE VIEW VW_TYPE_PAYMENT_CONDITION AS
SELECT
	ICP.CODBUSPAR,
	TCP.TYPPAYCON,
	TCP.ABREVI AS ABRTYPPAYCON,
	TCP.DESCRI AS DESTYPPAYCON,
	ICP.LIMCRE,
	TCP.STATUS,
	TCP.CREATEBY,
	TCP.UPDATEBY,
	TCP.CREATEAT,
	TCP.UPDATEAT
FROM
	TBL_BUSPAR_PAYMENT_CONDITION ICP
INNER JOIN TBL_TYPE_PAYMENT_CONDITION TCP ON TCP.TYPPAYCON = ICP.TYPPAYCON;

SELECT * FROM VW_TYPE_PAYMENT_CONDITION;

SELECT * FROM VW_TYPE_PAYMENT_CONDITION WHERE CODBUSPAR = '65498732';