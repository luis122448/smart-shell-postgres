SET search_path TO smart_shell;

-- SELECT current_schema();

CREATE OR REPLACE FUNCTION integer_to_string(input_number bigint)
  RETURNS text
AS $$
DECLARE
  units text[] := ARRAY['', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];
  teens text[] := ARRAY['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'];
  tens text[] := ARRAY['', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'];
BEGIN
  IF input_number < 0 THEN
    RETURN 'minus ' || integer_to_string(-input_number);
  ELSIF input_number < 10 THEN
    RETURN units[input_number + 1];
  ELSIF input_number < 20 THEN
    RETURN teens[input_number - 10 + 1];
  ELSIF input_number < 100 THEN
    RETURN tens[input_number / 10] || ' ' || integer_to_string(input_number % 10);
  ELSIF input_number < 1000 THEN
    RETURN units[input_number / 100] || ' hundred ' || integer_to_string(input_number % 100);
  ELSIF input_number < 10000 THEN
    RETURN units[input_number / 1000] || ' thousand ' || integer_to_string(input_number % 1000);
  ELSE
    RETURN 'number out of range';
  END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION number_to_string(input_number numeric)
  RETURNS text
AS $$
DECLARE
  integer_part bigint;
  decimal_part int;
BEGIN
  integer_part := floor(input_number);
  decimal_part := round((input_number - integer_part) * 100);
  
  IF decimal_part = 0 THEN
    RETURN integer_to_string(integer_part);
  ELSE
    RETURN integer_to_string(integer_part) || ' ' || decimal_part::text || '/100';
  END IF;
END;
$$ LANGUAGE plpgsql;

-- Pruebas
-- SELECT number_to_string(1234.56); -- Output: 'one thousand two hundred thirty four + 56/100'
-- SELECT number_to_string(9999.99); -- Output: 'nine thousand nine hundred ninety nine + 99/100'

DROP TABLE IF EXISTS TBL_COMPANY_INFO;

CREATE TABLE TBL_COMPANY_INFO(
	IDCOMPANY INTEGER,
	COMPANY VARCHAR(100) NOT NULL,
	APPELLATION VARCHAR(250),
	ADDRES VARCHAR(250),
	POSCOD VARCHAR(20),
	IMAGE BYTEA,
	ICON BYTEA,
	LOGO BYTEA,
	BACKGROUND BYTEA,
	GLOSS BYTEA,
	OBSERV VARCHAR(500),
	COMMEN VARCHAR(4000),
	STATUS VARCHAR(1) DEFAULT 'Y',
	CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
	UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
	CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP	
);

ALTER TABLE TBL_COMPANY_INFO
	ADD CONSTRAINT PK_COMPANY_INFO PRIMARY KEY (IDCOMPANY);

CREATE UNIQUE INDEX IDX_COMPANY_INFO ON TBL_COMPANY_INFO (COMPANY);
	
INSERT INTO TBL_COMPANY_INFO (IDCOMPANY, COMPANY, APPELLATION , ADDRES, POSCOD, IMAGE, ICON, LOGO, BACKGROUND, GLOSS)
VALUES (
    1,
    '0000000001',
    'Smart Shell',
    'Peru, Lima, Lima',
    '15319',
    pg_read_binary_file('/opt/resources/archives/smart-shell-400x400.jpg')::bytea,
    pg_read_binary_file('/opt/resources/archives/smart-shell-200x200.jpg')::bytea,
    pg_read_binary_file('/opt/resources/archives/smart-shell-200x200.jpg')::bytea,
    pg_read_binary_file('/opt/resources/archives/smart-shell-240x960.jpg')::bytea,
    pg_read_binary_file('/opt/resources/archives/smart-shell-240x960.jpg')::bytea
);

DROP TABLE IF EXISTS TBL_USER;

CREATE TABLE TBL_USER (
    IDCOMPANY INTEGER,
    CODUSER VARCHAR(10),
    ENCODE VARCHAR(255),
    ROLE VARCHAR(255),
    NIVEL INTEGER DEFAULT 0,
    CODE VARCHAR(255) DEFAULT '0000000',
    APEPAT VARCHAR(255),
    APEMAT VARCHAR(255),
    NOMBRE VARCHAR(255),
    ADDRES VARCHAR(255),
	  POSCOD VARCHAR(20),
    PHONE VARCHAR(255),
    EMAIL VARCHAR(255),
    REGISTDATE DATE,
    EXPIREDATE DATE,
    IMAGE BYTEA,
	  GLOSS BYTEA,
	  OBSERV VARCHAR(500),
    STATUS VARCHAR(1) DEFAULT 'Y',
    CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
    UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
    CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP	
);

ALTER TABLE TBL_USER
	ADD CONSTRAINT PK_USER PRIMARY KEY (IDCOMPANY,CODUSER);

INSERT INTO TBL_USER(IDCOMPANY,CODUSER,ENCODE,ROLE,NIVEL,CODE,APEPAT,APEMAT,NOMBRE,IMAGE)
VALUES
	(1,'ADMIN','$2a$10$weBYqYLZvJ/eoh.YQgEx3.6UqkoPm9MBrll9NilA3UzyaeE7oCtUy','ADMIN',1,'0000000','Calvo','Quispe','Luis Antonio',
    pg_read_binary_file('/opt/resources/images/user/test.webp')::bytea),
	(1,'TEST','$2a$10$weBYqYLZvJ/eoh.YQgEx3.6UqkoPm9MBrll9NilA3UzyaeE7oCtUy','TEST',1,'0000000','','','Anonymous',
    pg_read_binary_file('/opt/resources/images/user/test.webp')::bytea),
	(1,'USER','$2a$10$weBYqYLZvJ/eoh.YQgEx3.6UqkoPm9MBrll9NilA3UzyaeE7oCtUy','USER',1,'0000000','Calvo','Quispe','Luis Antonio',
    pg_read_binary_file('/opt/resources/images/user/test.webp')::bytea);

DROP TABLE IF EXISTS TBL_BRANCH;

CREATE TABLE TBL_BRANCH (
    IDCOMPANY INTEGER,
    CODBRANCH INTEGER,
    ABREVI VARCHAR(10),
    DESCRI VARCHAR(250),
    CODEXT VARCHAR(100),
    ADDRES VARCHAR(255),
    POSCOD VARCHAR(20),
    PHONE VARCHAR(255),
    EMAIL VARCHAR(255),
    CODWAREHOUSE INTEGER,
    GLOSSDOCUMENT BYTEA,
    GLOSSTICKET BYTEA,
    OBSERV VARCHAR(500),
	  DEFAUL VARCHAR(1) DEFAULT 'N',
    STATUS VARCHAR(1) DEFAULT 'Y',
    CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
    UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
    CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP	
);

ALTER TABLE TBL_BRANCH
  ADD CONSTRAINT PK_BRANCH PRIMARY KEY (IDCOMPANY,CODBRANCH);

INSERT INTO TBL_BRANCH(IDCOMPANY,CODBRANCH,ABREVI,DESCRI,CODEXT,ADDRES,POSCOD,PHONE,EMAIL,CODWAREHOUSE,GLOSSDOCUMENT,GLOSSTICKET,DEFAUL)
VALUES
  (1,1,'Prin','Principal','0001','Peru, Lima, Lima','15319','0000000','email@gmail.com',1,
    pg_read_binary_file('/opt/resources/archives/smart-shell-240x960.jpg')::bytea,
    pg_read_binary_file('/opt/resources/archives/smart-shell-240x960.jpg')::bytea,
    'Y'),
  (1,2,'Altr','Alternative','0002','Peru, Lima, Lima','15319','0000000','email@gmail.com',1,
    pg_read_binary_file('/opt/resources/archives/smart-shell-240x960.jpg')::bytea,
    pg_read_binary_file('/opt/resources/archives/smart-shell-240x960.jpg')::bytea,
    'N');