SET search_path TO smart_shell;

-- SELECT current_schema();

DROP TABLE IF EXISTS TBL_TYPE_COMMERCIAL_DOCUMENT;

CREATE TABLE TBL_TYPE_COMMERCIAL_DOCUMENT(
    IDCOMPANY INTEGER,
	TYPCOMDOC INTEGER,
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

ALTER TABLE TBL_TYPE_COMMERCIAL_DOCUMENT
	ADD CONSTRAINT PK_TYPE_COMMERCIAL_DOCUMENT PRIMARY KEY (IDCOMPANY,TYPCOMDOC);
	
INSERT INTO TBL_TYPE_COMMERCIAL_DOCUMENT (IDCOMPANY,TYPCOMDOC, ABREVI, DESCRI, CODEXT, OBSERV, COMMEN,STATUS)
VALUES
(1,1, 'Invoice', 'Invoice', NULL, 'Document used to support sales', 'Invoice','Y'),
(1,2, 'Receipt', 'Receipt', NULL, 'Document used to support sales for amounts below a specific limit', 'Receipt','Y'),
(1,3, 'Cre Note', 'Credit Note', NULL, 'Document used to record the reduction of a debt', 'Credit Note','Y'),
(1,4, 'Deb Note', 'Debit Note', NULL, 'Document used to record the increase of a debt', 'Debit Note','Y'),
(1,5, 'Purc Ord', 'Purchase Order', NULL, 'Document used to request the acquisition of goods and services', 'Purchase Order','Y'),
(1,6, 'Quota', 'Quotation', NULL, 'Document used to present a budget for goods and services', 'Quotation','Y'),
(1,7, 'Retod', 'Return Order', NULL, 'Document used to request the return of goods and services', 'Return Order','Y'),
(1,8, 'Grin', 'Internal Goods Receipt', NULL, 'Document used for internal transfer of goods', 'Internal Goods Receipt','Y'),
(1,9, 'Good', 'Goods Receipt', NULL, 'Document used for the transfer of goods', 'Goods Receipt','Y'),
(1,10, 'Invtak', 'Inventory Taking', NULL, 'Document used to record the inventory count', 'Inventory Taking','Y');

SELECT * FROM TBL_TYPE_COMMERCIAL_DOCUMENT;

DROP TABLE IF EXISTS TBL_FORMAT_COMMERCIAL_DOCUMENT;

CREATE TABLE TBL_FORMAT_COMMERCIAL_DOCUMENT(
    IDCOMPANY INTEGER,
	TYPCOMDOC INTEGER,
	TYPFORMAT INTEGER,
	ABREVI VARCHAR(10),
	DESCRI VARCHAR(250),
	FORMAT VARCHAR(250),
	URL VARCHAR(250),
	IMAGE BYTEA,
	PDF BYTEA,
	OBSERV VARCHAR(500),
	COMMEN VARCHAR(4000),
	DEFAUL VARCHAR(1) DEFAULT 'N',
	STATUS VARCHAR(1) DEFAULT 'Y',
	CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
	UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
	CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP	
);

ALTER TABLE TBL_FORMAT_COMMERCIAL_DOCUMENT
	ADD CONSTRAINT PK_FORMAT_COMMERCIAL_DOCUMENT PRIMARY KEY (IDCOMPANY,TYPCOMDOC,TYPFORMAT);

INSERT INTO TBL_FORMAT_COMMERCIAL_DOCUMENT (IDCOMPANY,TYPCOMDOC,TYPFORMAT,ABREVI,DESCRI,FORMAT,URL,IMAGE,PDF,OBSERV,COMMEN,DEFAUL,STATUS)
VALUES
(1,1,1,'INV A4-H','Invoice Format (A4 - Horizontal)','invoce-a4-horizontal.jrxml','https://img.freepik.com/psd-premium/formato-plantilla-factura-creativa-excel_664482-848.jpg',
    pg_read_binary_file('/opt/resources/report/invoce-a4-horizontal.jpg')::bytea,pg_read_binary_file('/opt/resources/report/invoce-a4-horizontal.pdf')::bytea,'','','Y','Y'),
(1,1,2,'INV A4-V','Invoice Format (A4 - Vertical)','invoce-a4-vertical.jrxml','https://cms-assets.tutsplus.com/cdn-cgi/image/width=630/uploads/users/23/posts/27333/final_image/word-invoice-final.jpg',
    pg_read_binary_file('/opt/resources/report/invoce-a4-vertical.jpg')::bytea,pg_read_binary_file('/opt/resources/report/invoce-a4-vertical.pdf')::bytea,'','','N','Y'),
(1,2,1,'INV A4-H','Receipt Format (A4 - Horizontal)','receipt-a4-horizontal.jrxml','https://img.freepik.com/free-vector/minimal-yellow-invoice-template-vector-design_1017-12070.jpg',
    pg_read_binary_file('/opt/resources/report/invoce-a4-horizontal.jpg')::bytea,pg_read_binary_file('/opt/resources/report/invoce-a4-horizontal.pdf')::bytea,'','','Y','Y'),
(1,2,2,'INV A4-V','Receipt Format (A4 - Vertical)','receipt-a4-vertical.jrxml','https://img.freepik.com/free-vector/gradient-real-estate-invoice_23-2149165551.jpg',
    pg_read_binary_file('/opt/resources/report/invoce-a4-vertical.jpg')::bytea,pg_read_binary_file('/opt/resources/report/invoce-a4-vertical.pdf')::bytea,'','','Y','Y');

DROP TABLE IF EXISTS TBL_SERIE_COMMERCIAL_DOCUMENT;

CREATE TABLE TBL_SERIE_COMMERCIAL_DOCUMENT(
    IDCOMPANY INTEGER,
	TYPCOMDOC INTEGER,
	SERIE VARCHAR(5),
	ABREVI VARCHAR(10),
	DESCRI VARCHAR(250),
	CODEXT VARCHAR(100),
	CODBRANCH INTEGER,
	DOCELECTR VARCHAR(1) DEFAULT 'Y',
	TYPCORREL VARCHAR(1),
	NROCORREL BIGINT,
	TYPFORMAT INTEGER,
	OBSERV VARCHAR(500),
	COMMEN VARCHAR(4000),
	DEFAUL VARCHAR(1) DEFAULT 'N',
	STATUS VARCHAR(1) DEFAULT 'Y',
	CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
	UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
	CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP	
);

ALTER TABLE TBL_SERIE_COMMERCIAL_DOCUMENT
	ADD CONSTRAINT PK_SERIE_COMMERCIAL_DOCUMENT PRIMARY KEY (IDCOMPANY,TYPCOMDOC, SERIE); 

INSERT INTO TBL_SERIE_COMMERCIAL_DOCUMENT (IDCOMPANY,TYPCOMDOC, SERIE, CODBRANCH, ABREVI, DESCRI, CODEXT, DOCELECTR, TYPCORREL, NROCORREL, DEFAUL, TYPFORMAT, STATUS)
VALUES 
	(1,1, 'F001', 1, 'FAC-01', 'Electronic Invoice', 'F001', 'Y', 'A', 0, 'Y', 1,'Y'),
	(1,1, 'F002', 1, 'FAC-02', 'Manual Invoice', 'F002', 'Y', 'M', 0, 'N', 1,'Y'),
	(1,2, 'B001', 1, 'BOL-01', 'Electronic Receipt', 'B001', 'Y', 'A', 0, 'Y', 1,'Y'),
	(1,2, 'B002', 1, 'BOL-02', 'Manual Receipt', 'B002', 'Y', 'M', 0, 'N', 1,'Y');

SELECT * FROM TBL_SERIE_COMMERCIAL_DOCUMENT;

DROP TABLE IF EXISTS TBL_SITUATION_COMMERCIAL_DOCUMENT;

CREATE TABLE TBL_SITUATION_COMMERCIAL_DOCUMENT(
    IDCOMPANY INTEGER,
	TYPCOMDOC INTEGER,
	SITCOMDOC INTEGER,
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

ALTER TABLE TBL_SITUATION_COMMERCIAL_DOCUMENT
	ADD CONSTRAINT PK_SITUATION_COMMERCIAL_DOCUMENT PRIMARY KEY (IDCOMPANY,TYPCOMDOC,SITCOMDOC);
	
-- DOCUMENT SITUATION
INSERT INTO TBL_SITUATION_COMMERCIAL_DOCUMENT (IDCOMPANY,TYPCOMDOC, SITCOMDOC, ABREVI, DESCRI, STATUS)
VALUES
(1,1, 1, 'Issued', 'Issued','Y'),
(1,1, 2, 'Approved', 'Approved','Y'),
(1,1, 3, 'On Acc.', 'On Account','Y'),
(1,1, 4, 'Canceled', 'Canceled','Y'),
(1,1, 5, 'Deleted', 'Deleted','Y'),
(1,2, 1, 'Issued', 'Issued','Y'),
(1,2, 2, 'Approved', 'Approved','Y'),
(1,2, 3, 'On Acc.', 'On Account','Y'),
(1,2, 4, 'Canceled', 'Canceled','Y'),
(1,2, 5, 'Deleted', 'Deleted','Y');

SELECT * FROM TBL_SITUATION_COMMERCIAL_DOCUMENT;

DROP TABLE IF EXISTS TBL_CURRENCY;

CREATE TABLE TBL_CURRENCY(
	IDCOMPANY INTEGER,
	CODCUR VARCHAR(5),
	ABREVI VARCHAR(10),
	DESCRI VARCHAR(250),
	CODEXT VARCHAR(100),
	SYMBOL VARCHAR(5),
	STATUS VARCHAR(1) DEFAULT 'Y',
	CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
	UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
	CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP	
);

ALTER TABLE TBL_CURRENCY
	ADD CONSTRAINT PK_CURRENCY PRIMARY KEY (IDCOMPANY,CODCUR);

INSERT INTO TBL_CURRENCY (IDCOMPANY,CODCUR, ABREVI, DESCRI, CODEXT, SYMBOL)
VALUES 
(1,'PEN', 'PEN', 'Peruvian Nuevo Sol', 'PEN', 'S/'),
(1,'USD', 'USD', 'United States Dollar', 'USD', '$');

DROP TABLE IF EXISTS TBL_EXCHANGE_RATE;

CREATE TABLE TBL_EXCHANGE_RATE(
    IDCOMPANY INTEGER,
	REGISTDATE DATE,
	ORIGEN VARCHAR(5),
	DESTIN VARCHAR(5),
	FVENTA NUMERIC(8,4),
	FCOMPRA NUMERIC(8,4),
	CVENTA NUMERIC(8,4),
	CCOMPRA NUMERIC(8,4),
	EVENTA NUMERIC(8,4),
	ECOMPRA NUMERIC(8,4),
	STATUS VARCHAR(1) DEFAULT 'Y',
	CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
	UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
	CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP	
);

ALTER TABLE TBL_EXCHANGE_RATE
	ADD CONSTRAINT PK_EXCHANGE_RATE PRIMARY KEY (IDCOMPANY,REGISTDATE, ORIGEN, DESTIN);

INSERT INTO TBL_EXCHANGE_RATE (IDCOMPANY,REGISTDATE, ORIGEN, DESTIN, EVENTA, ECOMPRA)
VALUES 
  (1,'2024-02-01', 'PEN', 'USD', 3.7, 3.708),
  (1,'2024-02-02', 'PEN', 'USD', 3.701, 3.709),
  (1,'2024-02-03', 'PEN', 'USD', 3.702, 3.71),
  (1,'2024-02-04', 'PEN', 'USD', 3.703, 3.711),
  (1,'2024-02-05', 'PEN', 'USD', 3.702, 3.71),
  (1,'2024-02-06', 'PEN', 'USD', 3.701, 3.708),
  (1,'2024-02-07', 'PEN', 'USD', 3.704, 3.712),
  (1,'2024-02-08', 'PEN', 'USD', 3.7, 3.708),
  (1,'2024-02-09', 'PEN', 'USD', 3.698, 3.705),
  (1,'2024-02-10', 'PEN', 'USD', 3.699, 3.707),
  (1,'2024-02-11', 'PEN', 'USD', 3.697, 3.704),
  (1,'2024-02-12', 'PEN', 'USD', 3.695, 3.701),
  (1,'2024-02-13', 'PEN', 'USD', 3.693, 3.7),
  (1,'2024-02-14', 'PEN', 'USD', 3.697, 3.704),
  (1,'2024-02-15', 'PEN', 'USD', 3.696, 3.703),
  (1,'2024-02-16', 'PEN', 'USD', 3.694, 3.7),
  (1,'2024-02-17', 'PEN', 'USD', 3.692, 3.699),
  (1,'2024-02-18', 'PEN', 'USD', 3.691, 3.698),
  (1,'2024-02-19', 'PEN', 'USD', 3.689, 3.696),
  (1,'2024-02-20', 'PEN', 'USD', 3.693, 3.701),
  (1,'2024-02-21', 'PEN', 'USD', 3.692, 3.7),
  (1,'2024-02-22', 'PEN', 'USD', 3.691, 3.698),
  (1,'2024-02-23', 'PEN', 'USD', 3.69, 3.697),
  (1,'2024-02-24', 'PEN', 'USD', 3.688, 3.695),
  (1,'2024-02-25', 'PEN', 'USD', 3.689, 3.696),
  (1,'2024-02-26', 'PEN', 'USD', 3.692, 3.699),
  (1,'2024-02-27', 'PEN', 'USD', 3.693, 3.7),
  (1,'2024-02-28', 'PEN', 'USD', 3.691, 3.697),
  (1,'2024-03-01', 'PEN', 'USD', 3.7, 3.708),
  (1,'2024-03-02', 'PEN', 'USD', 3.701, 3.709),
  (1,'2024-03-03', 'PEN', 'USD', 3.702, 3.71),
  (1,'2024-03-04', 'PEN', 'USD', 3.703, 3.711),
  (1,'2024-03-05', 'PEN', 'USD', 3.702, 3.71),
  (1,'2024-03-06', 'PEN', 'USD', 3.701, 3.708),
  (1,'2024-03-07', 'PEN', 'USD', 3.704, 3.712),
  (1,'2024-03-08', 'PEN', 'USD', 3.7, 3.708),
  (1,'2024-03-09', 'PEN', 'USD', 3.698, 3.705),
  (1,'2024-03-10', 'PEN', 'USD', 3.699, 3.707),
  (1,'2024-03-11', 'PEN', 'USD', 3.697, 3.704),
  (1,'2024-03-12', 'PEN', 'USD', 3.695, 3.701),
  (1,'2024-03-13', 'PEN', 'USD', 3.693, 3.7),
  (1,'2024-03-14', 'PEN', 'USD', 3.697, 3.704),
  (1,'2024-03-15', 'PEN', 'USD', 3.696, 3.703),
  (1,'2024-03-16', 'PEN', 'USD', 3.694, 3.7),
  (1,'2024-03-17', 'PEN', 'USD', 3.692, 3.699),
  (1,'2024-03-18', 'PEN', 'USD', 3.691, 3.698),
  (1,'2024-03-19', 'PEN', 'USD', 3.689, 3.696),
  (1,'2024-03-20', 'PEN', 'USD', 3.693, 3.701),
  (1,'2024-03-21', 'PEN', 'USD', 3.692, 3.7),
  (1,'2024-03-22', 'PEN', 'USD', 3.691, 3.698),
  (1,'2024-03-23', 'PEN', 'USD', 3.69, 3.697),
  (1,'2024-03-24', 'PEN', 'USD', 3.688, 3.695),
  (1,'2024-03-25', 'PEN', 'USD', 3.689, 3.696),
  (1,'2024-03-26', 'PEN', 'USD', 3.692, 3.699),
  (1,'2024-03-27', 'PEN', 'USD', 3.693, 3.7),
  (1,'2024-03-28', 'PEN', 'USD', 3.691, 3.697);
  
SELECT * FROM TBL_EXCHANGE_RATE;

DROP TABLE IF EXISTS TBL_COMMERCIAL_FACTOR;

CREATE TABLE TBL_COMMERCIAL_FACTOR(
    IDCOMPANY INTEGER,
	CODCOMFAC INTEGER,
	ABREVI VARCHAR(10),
	DESCRI VARCHAR(250),
	CODEXT VARCHAR(100),
	VCARACTER VARCHAR(1),
	VTEXTO	VARCHAR(100),
	VENTERO NUMERIC(8),
	VDECIMAL NUMERIC(16,4),
	VFREGIS DATE,
	VCOMMEN VARCHAR(500),
	VARCHIVO BYTEA,
	OBSERV VARCHAR(500),
	STATUS VARCHAR(1) DEFAULT 'Y',
	CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
	UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
	CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP	
);

ALTER TABLE TBL_COMMERCIAL_FACTOR
	ADD CONSTRAINT PK_COMMERCIAL_FACTOR PRIMARY KEY (IDCOMPANY,CODCOMFAC);

INSERT INTO TBL_COMMERCIAL_FACTOR (IDCOMPANY,CODCOMFAC, ABREVI, DESCRI, CODEXT, VCARACTER, VTEXTO, VENTERO,
								  VDECIMAL, VFREGIS, VCOMMEN, VARCHIVO, OBSERV)
VALUES
	(1,1, 'Igv', 'General Sales Tax', NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL),
	(1,2, 'Monnac', 'National Currency', NULL, NULL, 'PEN', NULL, NULL, NULL, NULL, NULL, NULL),
	(1,3, 'Monext', 'Foreign Currency', NULL, NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL);

SELECT * FROM TBL_COMMERCIAL_FACTOR;

DROP TABLE IF EXISTS TBL_REASON_COMMERCIAL_DOCUMENT;

CREATE TABLE TBL_REASON_COMMERCIAL_DOCUMENT(
    IDCOMPANY INTEGER,
	TYPCOMDOC INTEGER,
	INGSALCOM INTEGER,
	REACOMDOC INTEGER,
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

ALTER TABLE TBL_REASON_COMMERCIAL_DOCUMENT
	ADD CONSTRAINT PK_MOTIVO_COMERCIAL PRIMARY KEY (IDCOMPANY,TYPCOMDOC,INGSALCOM,REACOMDOC);

INSERT INTO TBL_REASON_COMMERCIAL_DOCUMENT (IDCOMPANY,TYPCOMDOC, INGSALCOM, REACOMDOC, ABREVI, DESCRI, CODEXT, OBSERV,DEFAUL)
VALUES
	(1,1, 1, 1, 'Sale Dire', 'Direct Sale', NULL, 'Used when making a direct sale (cash on delivery)','Y'),
	(1,1, 1, 2, 'Sale Defe', 'Deferred Sale', NULL, 'Used when efe delivery is made after the sale','N'),
	(1,1, 1, 3, 'Commission', 'Commission', NULL, 'Used when the sale is made by a commission agent','N'),
	(1,1, 1, 4, 'Service', 'Service', NULL, 'Used in the sale of a service','N'),
	(1,1, 1, 5, 'Free Trans', 'Free Transfer', NULL, 'Used for gifts, giveaways, vouchers, ...','N'),
	(1,1, 1, 6, 'Sample', 'Sample', NULL, 'Used when distributing a sample or trial','N'),
	(1,1, 1, 7, 'Change Doc', 'Document Change', NULL, 'Used when a non-editable error in a previously issued document needs to be corrected','N'),
	(1,2, 1, 1, 'Sale Dire', 'Direct Sale', NULL, 'Used when making a direct sale (cash on delivery)','Y'),
	(1,2, 1, 2, 'Sale Defe', 'Deferred Sale', NULL, 'Used when the delivery is made after the sale','N'),
	(1,2, 1, 3, 'Commission', 'Commission', NULL, 'Used when the sale is made by a commission agent','N'),
	(1,2, 1, 4, 'Service', 'Service', NULL, 'Used in the sale of a service','N'),
	(1,2, 1, 5, 'Free Tran', 'Free Transfer', NULL, 'Used for gifts, giveaways, vouchers, ...','N'),
	(1,2, 1, 6, 'Sample', 'Sample', NULL, 'Used when distributing a sample or trial','N'),
	(1,2, 1, 7, 'Change Doc', 'Document Change', NULL, 'Used when a non-editable error in a previously issued document needs to be corrected','N');
	
SELECT * FROM TBL_REASON_COMMERCIAL_DOCUMENT;

DROP TABLE IF EXISTS TBL_SELLER;

CREATE TABLE TBL_SELLER(
    IDCOMPANY INTEGER,
	CODSEL VARCHAR(50),
	ABREVI VARCHAR(10),
	DESCRI VARCHAR(250),
	APEPAT VARCHAR(75),
	APEMAT VARCHAR(75),
	NOMBRE VARCHAR(100),
	REGISTDATE DATE,
	ADDRES VARCHAR(250),
	POSCOD VARCHAR(20),
	TELEFO VARCHAR(20),
	EMAIL VARCHAR(100),
	FAX VARCHAR(20),
	IMAGE BYTEA,
	OBSERV VARCHAR(500),
	COMMEN VARCHAR(4000),
	STATUS VARCHAR(1) DEFAULT 'Y',
	CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
	UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
	CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP		
);

ALTER TABLE TBL_SELLER
	ADD CONSTRAINT PK_SELLER PRIMARY KEY (IDCOMPANY,CODSEL);

INSERT INTO TBL_SELLER (IDCOMPANY,CODSEL, ABREVI, DESCRI, APEPAT, APEMAT, NOMBRE, REGISTDATE, POSCOD, ADDRES, TELEFO, EMAIL, FAX, STATUS)
VALUES 
(1,'6800194159', 'Phoenix', 'Phoenix Thompson', 'Thompson', 'Martinez', 'Phoenix Thompson', '2023-05-05', 'Lima', 'Av. Arequipa 123', '987654321', 'phoenix.thompson@gmail.com', '0123456','Y'),
(1,'6843800541', 'Luna', 'Luna Roberts', 'Roberts', 'Rodriguez', 'Luna Roberts', '2023-05-05', 'Lima', 'Av. Javier Prado 456', '987654322', 'luna.roberts@gmail.com', '0123457','Y'),
(1,'2611318250', 'Ryder', 'Ryder Cooper', 'Cooper', 'Castillo', 'Ryder Cooper', '2023-05-05', 'Lima', 'Av. Grau 789', '987654323', 'ryder.cooper@gmail.com', '0123458','Y'),
(1,'7060454569', 'Aria', 'Aria Reed', 'Reed', 'Flores', 'Aria Reed', '2023-05-05', 'Lima', 'Av. La Marina 1011', '987654324', 'aria.reed@gmail.com', '0123459','Y'),
(1,'3805381754', 'Maverick', 'Maverick Hunter', 'Hunter', 'Diaz', 'Maverick Hunter', '2023-05-05', 'Lima', 'Av. 28 de Julio 1213', '987654325', 'maverick.hunter@gmail.com', '0123460','Y'),
(1,'9807580853', 'Indigo', 'Indigo Wells', 'Wells', 'Ruiz', 'Indigo Wells', '2023-05-05', 'Lima', 'Av. Brasil 1415', '987654326', 'indigo.wells@gmail.com', '0123461','Y'),
(1,'8351115676', 'Scarlett', 'Scarlett Foster', 'Foster', 'Gutierrez', 'Scarlett Foster', '2023-05-05', 'Lima', 'Av. Salaverry 1617', '987654327', 'scarlett.foster@gmail.com', '0123462','Y'),
(1,'3855901241', 'Ryker', 'Ryker Sullivan', 'Sullivan', 'Sandoval', 'Ryker Sullivan', '2023-05-05', 'Lima', 'Av. Republica de Chile 1819', '987654328', 'ryker.sullivan@gmail.com', '0123463','Y'),
(1,'7336538652', 'Willow', 'Willow Harrison', 'Harrison', 'Castro', 'Willow Harrison', '2023-05-05', 'Lima', 'Av. Los Incas 2021', '987654329', 'willow.harrison@gmail.com', '0123464','Y'),
(1,'1376784959', 'Jasper', 'Jasper Stone', 'Stone', 'Mendoza', 'Jasper Stone', '2023-05-05', 'Lima', 'Av. Primavera 2223', '987654330', 'jasper.stone@gmail.com', '0123465','Y');

SELECT * FROM TBL_SELLER;

DROP TABLE IF EXISTS TBL_DOCUMENT_TRANSACTION;

CREATE TABLE TBL_DOCUMENT_TRANSACTION(
	IDCOMPANY INTEGER,
	INDEX INTEGER,
	NUMINT BIGINT,
    TYPCOMDOC INTEGER,
    SITCOMDOC INTEGER,
	SERIE VARCHAR(5),
    NUMDOC BIGINT,
	REGISTDATE DATE,
	CODBRANCH INTEGER,
	CODPLAISS INTEGER,
    INGSALCOM INTEGER,
    REACOMDOC INTEGER,	
	BUSNAM VARCHAR(250),
	ADDRES VARCHAR(250),
	POSCOD VARCHAR(20),
    CODCUR VARCHAR(5),
    EXCHANGERATE NUMERIC(8,4),
    INCIGV INTEGER,
    TASIGV NUMERIC(8,4),
	CODSEL VARCHAR(50),
	TYPPAYCON INTEGER,
	IMPLISTPRICE NUMERIC(24,4),
    IMPDESCTOTAL NUMERIC(24,4),
    IMPSALEPRICE NUMERIC(24,4),
	IMPTRIBTOTAL NUMERIC(24,4),
    IMPTOTAL NUMERIC(24,4),
	OBSERV VARCHAR(500),
	COMMEN VARCHAR(4000),
	STATUS VARCHAR(1) DEFAULT 'Y',
	CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
	UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
	CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP	
);

ALTER TABLE TBL_DOCUMENT_TRANSACTION
	ADD CONSTRAINT PK_DOCUMENT_TRANSACTION PRIMARY KEY (IDCOMPANY,INDEX,NUMINT);