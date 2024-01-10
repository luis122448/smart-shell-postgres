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
	NUMINT INTEGER,
	TYPIDEDOC INTEGER,
	NROIDEDOC VARCHAR(100),
	COMNAM VARCHAR(250),
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
	ADD CONSTRAINT PK_COMPANY_INFO PRIMARY KEY (NUMINT);

-- INSERT INTO TBL_COMPANY_INFO (NUMINT,TYPIDEDOC,NROIDEDOC,COMNAM,ADDRES,POSCOD, GLOSS)
-- VALUES
-- 	(1,1,'01727763541','Smart Shell','PERU, LIMA, LIMA','15319',pg_read_file('C:\Users\luis122448\Desktop\smart-shell-logo.png')::bytea);
	
INSERT INTO TBL_COMPANY_INFO (NUMINT,TYPIDEDOC,NROIDEDOC,COMNAM,ADDRES,POSCOD, IMAGE, ICON, LOGO, BACKGROUND, GLOSS)
VALUES
	(1,1,'01727763541','Smart Shell','PERU, LIMA, LIMA','15319',
  pg_read_file('/opt/resources/archives/smart-shell-400x400.jpg')::bytea,
  pg_read_file('/opt/resources/archives/smart-shell-200x200.jpg')::bytea,
  pg_read_file('/opt/resources/archives/smart-shell-200x200.jpg')::bytea,
  pg_read_file('/opt/resources/archives/smart-shell-240x960.jpg')::bytea,
  pg_read_file('/opt/resources/archives/smart-shell-240x960.jpg')::bytea);

DROP TABLE IF EXISTS TBL_USER;

CREATE TABLE TBL_USER (
    CODUSER VARCHAR(20),
    ENCODE VARCHAR(255),
    CODROL VARCHAR(255),
    CODVER VARCHAR(255),
    APEPAT VARCHAR(255),
    APEMAT VARCHAR(255),
    NOMBRE VARCHAR(255),
    DIRECC VARCHAR(255),
    TELEFONO VARCHAR(255),
    EMAIL VARCHAR(255),
    FREGIS DATE,
    FEXPIR DATE,
    IMAGE BYTEA,
    OBSERV VARCHAR(255),
    GLOSA VARCHAR(255),
    ESTADO VARCHAR(1) DEFAULT 'Y',
    UCREAC VARCHAR(10) DEFAULT 'ADMIN',
    UACTUA VARCHAR(10) DEFAULT 'ADMIN',
    FCREAC TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FACTUA TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE TBL_USER
	ADD CONSTRAINT PK_USER PRIMARY KEY (CODUSER);

INSERT INTO TBL_USER(CODUSER,ENCODE,CODROL)
VALUES
	('ADMIN','$2a$10$weBYqYLZvJ/eoh.YQgEx3.6UqkoPm9MBrll9NilA3UzyaeE7oCtUy','ADMIN');