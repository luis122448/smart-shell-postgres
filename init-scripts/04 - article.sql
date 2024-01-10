SET search_path TO smart_shell;

-- SELECT current_schema();

DROP TABLE IF EXISTS TBL_WAREHOUSE;

DROP TABLE IF EXISTS TBL_TYPE_INVENTORY;

CREATE TABLE TBL_TYPE_INVENTORY(
	TYPINV INTEGER,
	ABREVI VARCHAR(10),
	DESCRI VARCHAR(250),
	CODEXT VARCHAR(100),
	OBSERV VARCHAR(500),
	COMMEN VARCHAR(4000),
	DEFAUL VARCHAR(1) DEFAULT 'N',
	STATUS VARCHAR(1) DEFAULT 'Y',
	CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
	UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
	CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE TBL_TYPE_INVENTORY
	ADD CONSTRAINT PK_TYPE_INVENTORY PRIMARY KEY (TYPINV);

INSERT INTO TBL_TYPE_INVENTORY (TYPINV, ABREVI, DESCRI, DEFAUL)
VALUES 
(1, 'MERC', 'MERCHANDISE', 'Y'),
(2, 'SEVC', 'SERVICE', 'N'),
(99, 'OTHER', 'OTHER', 'N');

SELECT * FROM TBL_TYPE_INVENTORY;

CREATE TABLE TBL_WAREHOUSE(
	CODWARHOU INTEGER,
	TYPINV INTEGER,
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

ALTER TABLE TBL_WAREHOUSE
	ADD CONSTRAINT PK_WAREHOUSE PRIMARY KEY (CODWARHOU,TYPINV);

ALTER TABLE TBL_WAREHOUSE
	ADD CONSTRAINT PK_WAREHOUSE_TYPE_INVENTORY FOREIGN KEY (TYPINV)
		REFERENCES TBL_TYPE_INVENTORY (TYPINV);

INSERT INTO TBL_WAREHOUSE (CODWARHOU,TYPINV,ABREVI,DESCRI)
VALUES 
(1,1,'PRIN','WAREHOUSE PRINCIPAL');

SELECT * FROM TBL_WAREHOUSE;

DROP TABLE IF EXISTS TBL_ARTICLE;

CREATE TABLE TBL_ARTICLE(
	CODART VARCHAR(50),
	TYPINV INTEGER,
	ABREVI VARCHAR(10),
	DESCRI VARCHAR(250),
	CODEXT VARCHAR(100),
	CODBAR VARCHAR(100),
	CODEAN VARCHAR(100),
	REGISTDATE DATE,
	CSTOCK VARCHAR(10),
	CODPRV VARCHAR(50),
	CODMAN VARCHAR(100),
	CODUNI VARCHAR(10),
	STOCKNEGATIVE VARCHAR(1) DEFAULT 'N',
	EDITDESCRI VARCHAR(1) DEFAULT 'N',
	PRINTCOMMENT VARCHAR(1) DEFAULT 'N',
	IMAGE BYTEA,
	OBSERV VARCHAR(500),
	COMMEN VARCHAR(4000),
	STATUS VARCHAR(1) DEFAULT 'Y',
	CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
	UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
	CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE TBL_ARTICLE
	ADD CONSTRAINT PK_ARTICLE PRIMARY KEY (CODART);

INSERT INTO TBL_ARTICLE (CODART, TYPINV, ABREVI, DESCRI, CODEXT, 
                          CODBAR, REGISTDATE, CSTOCK, CODPRV, CODMAN, 
                          CODUNI, IMAGE, OBSERV, COMMEN)
VALUES 
   ('OSAHG', 1, 'HERBGC', 'OSA HERB GARDEN KEYCAPS', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('BPKDC', 1, 'BPK-DC', 'BLACK AND PINK - THE DANCER KEYCAPS', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),

   ('MRSGR', 1, 'MRSGRN', 'MARRS GREEN KEYCAPS', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('BLKSIL', 1, 'BLKSVR', 'BLACK AND SILVER KEYCAPS', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('PLSH75', 1, 'POLKIT', 'POLISH KEYSET - 75% KITTING', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('BLRP75', 1, 'BLRKIT', 'BLURPLE KEYSET - 75% KITTING', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('PT75SMK', 1, 'FAP75', 'FULLY ASSEMBLED PORTICO75 - SMOKE', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('PWK75', 1, 'POWK', 'PURPLE ON WHITE KEYSET - 75% KITTING', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('900975', 1, '9K75', '9009 KEYSET - 75% KITTING', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('BOW75', 1, 'BOW-K75', 'BLUE ON WHITE KEYSETS - 75% KITTING', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('CNKSET', 1, 'CNK-SET', 'CABERNET NOIR KEYSET', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('EPBT-OGK', 1, 'OGK-CAPS', 'EPBT DOUBLESHOT ABS CHERRY KEYCAPS - ORANGE ON GREY', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('EPBT-SDL', 1, 'SDL-CAPS', 'EPBT DOUBLESHOT ABS CHERRY KEYCAPS - SKY DOLCH', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('EPBT-DOL', 1, 'DOL-KEYS', 'EPBT DOUBLESHOT ABS CHERRY KEYCAPS - DOLCH', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('EPBT-WOB', 1, 'WOB-CAPS', 'EPBT DOUBLESHOT ABS CHERRY KEYCAPS - WOB', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('ACC-MNT', 1, 'MNT-KIT', 'MINT ACCENT KIT', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('KSET-BP', 1, 'BP-KSET', 'BLACK & PURPLE KEYSET', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('KSET-BRD', 1, 'BRD-KSET', 'BRED KEYSET', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('KSET-WOB', 1, 'WOB-KSET', 'WHITE-ON-BLACK KEYSET', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('WBLOCK', 1, 'W-BLOCK', 'WRITER S BLOCK', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('POLSH', 1, 'POLSH', 'POLISH', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('MONO1', 1, 'MONO1', 'MONOCHROME KEYSET', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('MSHMW1', 1, 'MSHMW1', 'MARSHMALLOW KEYSET', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL),
   
   ('KYRBL1', 1, 'KYRBL1', 'KEYREATIVE BLANK KEYSET', '', '', 
   '2023-04-26', 'UNITY', '54165646868', '', 'UNITY', NULL, NULL, NULL);
   
SELECT * FROM TBL_ARTICLE;

DROP TABLE IF EXISTS TBL_LIST_PRICE;

CREATE TABLE TBL_LIST_PRICE(
	CODLISTPRICE INTEGER, 
	ABREVI VARCHAR(10),
	DESCRI VARCHAR(250),
	CODEXT VARCHAR(100),
	CODCUR VARCHAR(10),
	INCTAX VARCHAR(1) DEFAULT 'N',
	DEFAUL VARCHAR(1) DEFAULT 'N',
	OBSERV VARCHAR(500),
	COMMEN VARCHAR(4000),
	STATUS VARCHAR(1) DEFAULT 'Y',
	CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
	UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
	CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO TBL_LIST_PRICE(CODLISTPRICE,ABREVI,DESCRI,CODCUR,INCTAX,DEFAUL)
	VALUES (1,'GENERAL','General Price List','USD','N','S'),
		   (2,'ALTERNA','Alternative Price List','USD','N','N');

SELECT * FROM TBL_LIST_PRICE;

DROP TABLE IF EXISTS TBL_LIST_PRICE_ARTICLE;

CREATE TABLE TBL_LIST_PRICE_ARTICLE(
	CODLISTPRICE INTEGER,
	CODART VARCHAR(50),
	DESART VARCHAR(250),
	PRICE NUMERIC(24,4),
	MODPRICE VARCHAR(1) DEFAULT 'N',
	MODDESC VARCHAR(1) DEFAULT 'N',
	DESMAX NUMERIC(24,4) DEFAULT 100,
	DESC01 NUMERIC(24,4) DEFAULT 0,
	DESC02 NUMERIC(24,4) DEFAULT 0,
	DESC03 NUMERIC(24,4) DEFAULT 0,
	DESC04 NUMERIC(24,4) DEFAULT 0,
	IMPIGV NUMERIC(24,4) DEFAULT 0,
    IMPISC NUMERIC(24,4) DEFAULT 0,
    IMPTRIBADD01 NUMERIC(24,4) DEFAULT 0,
    IMPTRIBADD02 NUMERIC(24,4) DEFAULT 0,
    IMPTRIBADD03 NUMERIC(24,4) DEFAULT 0,
    IMPTRIBADD04 NUMERIC(24,4) DEFAULT 0,
	IMPLISTPRICE NUMERIC(24,4),
	IMPDESCTOTAL NUMERIC(24,4),
	IMPSALEPRICE NUMERIC(24,4),
	IMPTRIBTOTAL NUMERIC(24,4),
	IMPTOTAL NUMERIC(24,4),
	STATUS VARCHAR(1) DEFAULT 'Y',
	CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
	UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
	CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'OSAHG', 'OSA HERB GARDEN KEYCAPS', 125.0000, 'N', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 125.0000, 0.0000, 125.0000, 0.0000, 125.0000, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'BPKDC', 'BLACK AND PINK - THE DANCER KEYCAPS', 10.0000, 'Y', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'MRSGR', 'MARRS GREEN KEYCAPS', 15.0000, 'Y', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'BLKSIL', 'BLACK AND SILVER KEYCAPS', 45.0000, 'Y', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'PLSH75', 'POLISH KEYSET - 75% KITTING', 35.0000, 'Y', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'BLRP75', 'BLURPLE KEYSET - 75% KITTING', 40.0000, 'Y', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'PT75SMK', 'FULLY ASSEMBLED PORTICO75 - SMOKE', 32.0000, 'N', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'PWK75', 'PURPLE ON WHITE KEYSET - 75% KITTING', 18.0000, 'Y', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, '900975', '9009 KEYSET - 75% KITTING', 21.0000, 'N', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'BOW75', 'BLUE ON WHITE KEYSETS - 75% KITTING', 45.0000, 'N', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'CNKSET', 'CABERNET NOIR KEYSET', 69.0000, 'Y', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'EPBT-OGK', 'EPBT DOUBLESHOT ABS CHERRY KEYCAPS - ORANGE ON GREY', 45.0000, 'N', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'EPBT-SDL', 'EPBT DOUBLESHOT ABS CHERRY KEYCAPS - SKY DOLCH', 28.0000, 'N', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'EPBT-DOL', 'EPBT DOUBLESHOT ABS CHERRY KEYCAPS - DOLCH', 36.0000, 'Y', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'EPBT-WOB', 'EPBT DOUBLESHOT ABS CHERRY KEYCAPS - WOB', 47.0000, 'N', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'ACC-MNT', 'MINT ACCENT KIT', 42.0000, 'Y', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'KSET-BP', 'BLACK & PURPLE KEYSET', 15.0000, 'N', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'KSET-BRD', 'BRED KEYSET', 17.0000, 'N', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'KSET-WOB', 'WHITE-ON-BLACK KEYSET', 98.0000, 'N', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'WBLOCK', 'WRITER S BLOCK', 150.0000, 'Y', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'POLSH', 'POLISH', 178.0000, 'N', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'MONO1', 'MONOCHROME KEYSET', 106.0000, 'Y', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'MSHMW1', 'MARSHMALLOW KEYSET', 154.0000, 'N', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');
INSERT INTO TBL_LIST_PRICE_ARTICLE VALUES (1, 'KYRBL1', 'KEYREATIVE BLANK KEYSET', 99.0000, 'N', 'N', 99.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'ADMIN', 'ADMIN', '2024-01-09 22:53:09.885643', '2024-01-09 22:53:09.885643');

DROP TABLE IF EXISTS TBL_ECOMMERCE_SECCION;

CREATE TABLE TBL_ECOMMERCE_SECCION(
	SECCION INTEGER,
	ADDTAG INTEGER,
	ABREVI VARCHAR(10),
	DESCRI VARCHAR(250)
);

ALTER TABLE TBL_ECOMMERCE_SECCION
	ADD CONSTRAINT PK_ECOMMERCE_SECCION PRIMARY KEY (SECCION);

INSERT INTO TBL_ECOMMERCE_SECCION (SECCION, ADDTAG, ABREVI, DESCRI)
VALUES 
	(1, 1, 'KEYSEY', 'KEYCAPS SET'),
	(2, 1, 'STABILIZER', 'STABILIZERS'),
	(3, 1, 'KEYBOARD', 'KEYBOARD'),
	(4, 1, 'STYLE', 'STYLE'),
	(5, 1, 'FINISH', 'FINAL FINISH');
	
DROP TABLE IF EXISTS TBL_ARTICLE_ECOMMERCE;
	
CREATE TABLE TBL_ARTICLE_ECOMMERCE(
	CODART VARCHAR(50),
	SECCION INTEGER,
	MODEL INTEGER,
	ABREVI VARCHAR(10),
	DESCRI VARCHAR(250),
	CODEXT VARCHAR(100),
	REGISTDATE DATE,
	IMAGE BYTEA,
	OBSERV VARCHAR(500),
	STATUS VARCHAR(1) DEFAULT 'Y',
	CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
	UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
	CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE TBL_ARTICLE_ECOMMERCE
	ADD CONSTRAINT PK_ARTICLE_ECOMMERCE PRIMARY KEY (CODART,SECCION);


-- INSERT INTO TBL_ARTICLE (CODART, TYPINV, ABREVI, DESCRI, CODEXT, 
--                           CODBAR, REGISTDATE, CSTOCK, CODPRV, CODFAB, 
--                           CODUND, IMAGE, OBSERV, COMMEN)
-- VALUES 
-- 	('PORTICO75', 0, 'None', 'None', '', 
--    '2023-04-26', NULL, 'Sin Modelo Especificado'),
--    	('PORTICO75', 0, 'None', 'None', '', 
--    '2023-04-26', NULL, 'Sin Modelo Especificado'),
--    ('PORTICO75', 0, 'None', 'None', '', 
--    '2023-04-26', NULL, 'Sin Modelo Especificado'),
--    ('PORTICO75', 0, 'None', 'None', '', 
--    '2023-04-26', NULL, 'Sin Modelo Especificado'),
--    ('PORTICO75', 0, 'None', 'None', '', 
--    '2023-04-26', NULL, 'Sin Modelo Especificado');

SELECT * FROM TBL_ARTICLE_ECOMMERCE;
