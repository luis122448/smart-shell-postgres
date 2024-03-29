SET search_path TO smart_shell;

-- SELECT current_schema();

CREATE OR REPLACE FUNCTION number_to_string(input_number bigint)
  RETURNS text
AS $$
DECLARE
  units text[] := ARRAY['', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];
  teens text[] := ARRAY['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'];
  tens text[] := ARRAY['', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'];
BEGIN
  IF input_number < 0 THEN
    RETURN 'minus ' || number_to_string(-input_number);
  ELSIF input_number < 10 THEN
    RETURN units[input_number + 1];
  ELSIF input_number < 20 THEN
    RETURN teens[input_number - 10 + 1];
  ELSIF input_number < 100 THEN
    RETURN tens[input_number / 10] || ' ' || number_to_string(input_number % 10);
  ELSIF input_number < 1000 THEN
    RETURN units[input_number / 100] || ' hundred ' || number_to_string(input_number % 100);
  ELSIF input_number < 10000 THEN
    RETURN units[input_number / 1000] || ' thousand ' || number_to_string(input_number % 1000);
  ELSE
    RETURN 'number out of range';
  END IF;
END;
$$ LANGUAGE plpgsql;

-- SELECT number_to_string(1234); -- Output: 'one thousand two hundred thirty four'
-- SELECT number_to_string(9999); -- Output: 'nine thousand nine hundred ninety nine'

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
    pg_read_binary_file('/opt/resources/user/test.webp')::bytea),
	(1,'TEST','$2a$10$weBYqYLZvJ/eoh.YQgEx3.6UqkoPm9MBrll9NilA3UzyaeE7oCtUy','TEST',1,'0000000','','','Anonymous',
    pg_read_binary_file('/opt/resources/user/test.webp')::bytea),
	(1,'USER','$2a$10$weBYqYLZvJ/eoh.YQgEx3.6UqkoPm9MBrll9NilA3UzyaeE7oCtUy','USER',1,'0000000','Calvo','Quispe','Luis Antonio',
    pg_read_binary_file('/opt/resources/user/test.webp')::bytea);