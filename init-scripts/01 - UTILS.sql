SET search_path TO SMARTSHELL;

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
	ICON BYTEA,
	LOGO BYTEA,
	BACKGROUND BYTEA,
	GLOSS BYTEA,
	STATUS VARCHAR(1) DEFAULT 'Y',
	CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
	UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
	CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP	
);

ALTER TABLE TBL_COMPANY_INFO
	ADD CONSTRAINT PK_COMPANY_INFO PRIMARY KEY (NUMINT);

INSERT INTO TBL_COMPANY_INFO (NUMINT,TYPIDEDOC,NROIDEDOC,COMNAM,ADDRES,POSCOD)
VALUES
	(1,1,'01727763541','SMART SHELL','PERU, LIMA, LIMA','15319');