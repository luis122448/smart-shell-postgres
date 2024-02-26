SET search_path TO smart_shell;

-- SELECT current_schema();

-- PROCEDURE AND FUNCTION
DROP PROCEDURE IF EXISTS PR_CREATE_GENERATOR_DOCUMENT;

CREATE OR REPLACE PROCEDURE PR_CREATE_GENERATOR_DOCUMENT(
	IN_TYPCOMDOC IN INTEGER,
	IN_SERIE	IN VARCHAR,
	IN_TYPCORREL IN VARCHAR,
	IN_NROCORREL IN INTEGER,
	OUT_CODE OUT INTEGER,
	OUT_MESSAGE OUT VARCHAR,
	OUT_LOG OUT VARCHAR
)
LANGUAGE PLPGSQL
AS $$
BEGIN

	IF IN_TYPCORREL IN ('A','S') THEN
		IF EXISTS (SELECT 1 FROM pg_class WHERE relkind = 'S' AND UPPER(relname) = 'GEN_' || IN_SERIE || '_' || IN_TYPCOMDOC::TEXT ) THEN
			OUT_CODE := -2;
			OUT_MESSAGE := 'The generator GEN_' || IN_SERIE || '_' || IN_TYPCOMDOC::TEXT || ' already exists!';
			OUT_LOG := OUT_MESSAGE;
		ELSE
			EXECUTE 'CREATE SEQUENCE GEN_' || IN_SERIE || '_' ||  IN_TYPCOMDOC::TEXT || ' START ' || IN_NROCORREL;
			OUT_CODE := 1;
			OUT_MESSAGE := 'Generator created successfully';
			OUT_LOG := OUT_MESSAGE;
		END IF;
	ELSE
		OUT_CODE := 0;
		OUT_MESSAGE := 'Manual correlation, generator for the document not created';
		OUT_LOG := OUT_MESSAGE;
	END IF;

EXCEPTION
	WHEN OTHERS THEN
		OUT_CODE := -2;
		OUT_MESSAGE := 'An unknown error has occurred';
		OUT_LOG := 'ERROR ( ' || SQLSTATE || ' ) : ' || SQLERRM;
END $$;

-- SEQUENCE BY SERIE
DO $$
DECLARE
	V_CODE INTEGER;
	V_MESSAGE VARCHAR(1000);
	V_LOG VARCHAR(1000);
BEGIN
	CALL PR_CREATE_GENERATOR_DOCUMENT(1, 'F001'::VARCHAR, 'A'::VARCHAR, 1, V_CODE, V_MESSAGE, V_LOG);
	RAISE NOTICE 'CODE: %', V_CODE;
    RAISE NOTICE 'MESSAGE: %', V_MESSAGE;
	RAISE NOTICE 'LOG: %', V_LOG;
END $$;

-- SEQUENCE BY ALL
CREATE SEQUENCE GEN_DOCCOM;

DROP PROCEDURE IF EXISTS PR_CREATE_DOCUMENT_HEADER;

CREATE OR REPLACE PROCEDURE PR_CREATE_DOCUMENT_HEADER(
	IN_DOCUMENT IN VARCHAR,
	OUT_NUMINT OUT BIGINT,
	OUT_CODE OUT INTEGER,
	OUT_MESSAGE OUT VARCHAR,
	OUT_LOG OUT VARCHAR
)
LANGUAGE PLPGSQL
AS $$
DECLARE
	DOCUMENTJSON JSON;
	V_NUMINT BIGINT := NULL;
	V_CODEXT VARCHAR(100) := NULL;
	V_TYPCOMDOC INTEGER := NULL;
	V_SITCOMDOC INTEGER := NULL;
	V_SERIE VARCHAR(20) := NULL;
	V_NUMDOC BIGINT := 0;
	V_REGISTDATE DATE := NULL;
	V_CODBRANCH INTEGER := NULL;
	V_CODPLAISS INTEGER := NULL;
	V_INGSALCOM INTEGER := NULL;
	V_REACOMDOC INTEGER := NULL;
	V_CODCUR VARCHAR(5) := NULL;
	V_EXCHANGERATE NUMERIC(8,4) := NULL;
	V_CODBUSPAR VARCHAR(50) := NULL;
	V_BUSNAM VARCHAR(250) := NULL;
	V_ADDRES VARCHAR(250) := NULL;
	V_POSCOD VARCHAR(20) := NULL;
	V_CODSEL VARCHAR(50) := NULL;
	V_TYPPAYCON INTEGER := NULL;
	V_INCIGV INTEGER := NULL;
	V_TASIGV NUMERIC(8,4) := NULL;
	V_IMPAFECTO NUMERIC(24,4) := NULL;
	V_IMPINAFECTO NUMERIC(24,4) := NULL;
	V_IMPEXONERADO NUMERIC(24,4) := NULL;
	V_IMPGRATUITO NUMERIC(24,4) := NULL;
	V_IMPIGV NUMERIC(24,4) := NULL;
	V_IMPISC NUMERIC(24,4) := NULL;
	V_IMPTRIBADD01 NUMERIC(24,4) := NULL;
	V_IMPTRIBADD02 NUMERIC(24,4) := NULL;
	V_IMPTRIBADD03 NUMERIC(24,4) := NULL;
	V_IMPTRIBADD04 NUMERIC(24,4) := NULL;
	V_IMPDESC01 NUMERIC(24,4) := NULL;
	V_IMPDESC02 NUMERIC(24,4) := NULL;
	V_IMPDESC03 NUMERIC(24,4) := NULL;
	V_IMPDESC04 NUMERIC(24,4) := NULL;
	V_IMPLISTPRICE NUMERIC(24,4) := NULL;
	V_IMPDESCTOTAL NUMERIC(24,4) := NULL;
	V_IMPSALEPRICE NUMERIC(24,4) := NULL;
	V_IMPTRIBTOTAL NUMERIC(24,4) := NULL;
	V_IMPTOTAL NUMERIC(24,4) := NULL;
BEGIN

	DOCUMENTJSON := IN_DOCUMENT::JSON; 
    V_CODEXT := DOCUMENTJSON->>'codext';
    V_TYPCOMDOC := DOCUMENTJSON->>'typcomdoc';
    V_SITCOMDOC := DOCUMENTJSON->>'sitcomdoc';
    V_SERIE := DOCUMENTJSON->>'serie';
    V_REGISTDATE := DOCUMENTJSON->>'registdate';
    V_CODBRANCH := DOCUMENTJSON->>'codbranch';
    V_CODPLAISS := DOCUMENTJSON->>'codplaiss';
    V_INGSALCOM := DOCUMENTJSON->>'ingsalcom';
    V_REACOMDOC := DOCUMENTJSON->>'reacomdoc';
    V_CODCUR := DOCUMENTJSON->>'codcur';
	V_EXCHANGERATE := DOCUMENTJSON->>'exchangerate';
    V_CODBUSPAR := DOCUMENTJSON->>'codbuspar';
	V_BUSNAM := DOCUMENTJSON->>'busnam';
	V_ADDRES := DOCUMENTJSON->>'addres';
	V_POSCOD := DOCUMENTJSON->>'poscod';
	V_CODSEL := DOCUMENTJSON->>'codsel';
	V_TYPPAYCON := DOCUMENTJSON->>'typpaycon';
    V_INCIGV := DOCUMENTJSON->>'incigv';
    V_TASIGV := 0;
	IF V_INCIGV = 1 THEN
		BEGIN
			SELECT
				VENTERO
			INTO STRICT
				V_TASIGV		
			FROM
				TBL_COMMERCIAL_FACTOR
			WHERE
				CODCOMFAC = 1;
		EXCEPTION 
			WHEN NO_DATA_FOUND THEN
				OUT_CODE := -1;
				OUT_MESSAGE := 'NO HAY FACTOR COMERCIAL DEFINIDO PARA EL IGV, REVISAR EL FACTOR COMERCIAL N°1';
				OUT_LOG := OUT_MESSAGE;
				RETURN;
		END;
    END IF;

	IF EXISTS (SELECT 1 FROM pg_class WHERE UPPER(relname) = UPPER('GEN_' || V_SERIE || '_' || V_TYPCOMDOC::TEXT)) THEN
	SELECT nextval('GEN_' || V_SERIE || '_' || V_TYPCOMDOC::TEXT) INTO V_NUMDOC;
	ELSE
	RAISE EXCEPTION 'La secuencia GEN_%_% no existe', V_SERIE, V_TYPCOMDOC;
	END IF;

	IF EXISTS (SELECT 1 FROM pg_class WHERE UPPER(relname) = 'GEN_DOCCOM') THEN
	SELECT nextval('GEN_DOCCOM') INTO V_NUMINT;
	ELSE
	RAISE EXCEPTION 'La secuencia GEN_DOCCOM no existe';
	END IF;

	INSERT INTO TBL_DOCUMENT_HEADER (
		NUMINT, CODEXT, TYPCOMDOC, SITCOMDOC, SERIE, NUMDOC, REGISTDATE, CODBRANCH, CODPLAISS, INGSALCOM, REACOMDOC,
		CODCUR, EXCHANGERATE, CODBUSPAR, BUSNAM, ADDRES, POSCOD, CODSEL, TYPPAYCON, INCIGV, TASIGV, IMPAFECTO, IMPINAFECTO, IMPEXONERADO, IMPGRATUITO, IMPIGV,
		IMPISC, IMPTRIBADD01, IMPTRIBADD02, IMPTRIBADD03, IMPTRIBADD04, IMPDESC01, IMPDESC02, IMPDESC03,
		IMPDESC04, IMPLISTPRICE, IMPDESCTOTAL, IMPSALEPRICE, IMPTRIBTOTAL, IMPTOTAL
	) VALUES (
		V_NUMINT, V_CODEXT, V_TYPCOMDOC, V_SITCOMDOC, V_SERIE, V_NUMDOC, V_REGISTDATE, V_CODBRANCH, V_CODPLAISS, V_INGSALCOM, V_REACOMDOC,
		V_CODCUR, V_EXCHANGERATE, V_CODBUSPAR, V_BUSNAM, V_ADDRES, V_POSCOD, V_CODSEL, V_TYPPAYCON, V_INCIGV, V_TASIGV, V_IMPAFECTO, V_IMPINAFECTO, V_IMPEXONERADO, V_IMPGRATUITO, V_IMPIGV,
		V_IMPISC, V_IMPTRIBADD01, V_IMPTRIBADD02, V_IMPTRIBADD03, V_IMPTRIBADD04, V_IMPDESC01, V_IMPDESC02, V_IMPDESC03,
		V_IMPDESC04, V_IMPLISTPRICE, V_IMPDESCTOTAL, V_IMPSALEPRICE, V_IMPTRIBTOTAL, V_IMPTOTAL
	);
	OUT_NUMINT := V_NUMINT;
	OUT_CODE := 0;
	OUT_MESSAGE := 'EL DOCUMENTO [ ' || V_NUMINT::TEXT || ' ] SE HA GENERADO CON LA SERIE Y NÚMERO ' || V_SERIE || '-' || V_NUMDOC::TEXT;
	OUT_LOG := OUT_MESSAGE;
	RETURN;

EXCEPTION
	WHEN OTHERS THEN
		OUT_NUMINT := V_NUMINT;
		OUT_CODE := -2;
		OUT_MESSAGE := 'AN UNKNOWN ERROR HAS OCCURRED';
		OUT_LOG := 'ERROR ( ' || SQLSTATE || ' ) : ' || SQLERRM;
	RETURN;
END $$;

DO $$
DECLARE
	V_DOCUMENT VARCHAR(4000) := '{"numint":null,"codext":"","typcomdoc":1,"sitcomdoc":1,"serie":"F001","numdoc":null,
	"registdate":[2023,4,28],
	"codbranch":1,
	"codplaiss":1,
	"ingsalcom":1,
	"reacomdoc":1,
	"codcur":"PEN",
	"exchangerate":3.89,
	"codbuspar":"65498732",
	"busnam":"Pedro Castillo Chavez",
	"addres":"Av. Tacna 1213",
	"poscod":"000000",
	"codsel":"6800194159",
	"typpaycon":1,
	"incigv":1}';
	V_NUMINT BIGINT;
	V_CODE INTEGER;
	V_MESSAGE VARCHAR(1000);
	V_LOG VARCHAR(1000);
BEGIN
	CALL PR_CREATE_DOCUMENT_HEADER(V_DOCUMENT, V_NUMINT, V_CODE, V_MESSAGE, V_LOG);
	RAISE NOTICE 'NUMINT : %',V_NUMINT;
	RAISE NOTICE 'CODE: %', V_CODE;
    RAISE NOTICE 'MESSAGE: %', V_MESSAGE;
	RAISE NOTICE 'LOG: %', V_LOG;
END $$;

SELECT * FROM TBL_DOCUMENT_HEADER;

DROP PROCEDURE IF EXISTS PR_CREATE_DOCUMENT_DETAIL;

CREATE OR REPLACE PROCEDURE PR_CREATE_DOCUMENT_DETAIL(
	IN_DOCUMENT IN VARCHAR,
	OUT_NUMITE OUT BIGINT,
	OUT_CODE OUT INTEGER,
	OUT_MESSAGE OUT VARCHAR,
	OUT_LOG OUT VARCHAR
)
LANGUAGE PLPGSQL
AS $$
DECLARE
	DOCUMENTJSON JSON;
	V_NUMINT BIGINT := NULL;
	V_NUMITE BIGINT := NULL;
	V_TYPINV INTEGER := NULL;
    V_CODART VARCHAR(50) := NULL;
    V_ETIQUETA BIGINT := NULL;
	V_QUANTITY NUMERIC(24,4) := NULL;
	V_PRICE NUMERIC(24,4) := NULL;
	V_IMPAFECTO NUMERIC(24,4) := NULL;
	V_IMPINAFECTO NUMERIC(24,4) := NULL;
	V_IMPEXONERADO NUMERIC(24,4) := NULL;
	V_IMPGRATUITO NUMERIC(24,4) := NULL;
	V_IMPIGV NUMERIC(24,4) := NULL;
	V_IMPISC NUMERIC(24,4) := NULL;
	V_IMPTRIBADD01 NUMERIC(24,4) := NULL;
	V_IMPTRIBADD02 NUMERIC(24,4) := NULL;
	V_IMPTRIBADD03 NUMERIC(24,4) := NULL;
	V_IMPTRIBADD04 NUMERIC(24,4) := NULL;
	V_IMPDESC01 NUMERIC(24,4) := NULL;
	V_IMPDESC02 NUMERIC(24,4) := NULL;
	V_IMPDESC03 NUMERIC(24,4) := NULL;
	V_IMPDESC04 NUMERIC(24,4) := NULL;
	V_IMPLISTPRICE NUMERIC(24,4) := NULL;
	V_IMPDESCTOTAL NUMERIC(24,4) := NULL;
	V_IMPSALEPRICE NUMERIC(24,4) := NULL;
	V_IMPTRIBTOTAL NUMERIC(24,4) := NULL;
	V_IMPTOTAL NUMERIC(24,4) := NULL;
	V_AUX1 NUMERIC(24,4) := NULL;
BEGIN

	DOCUMENTJSON := IN_DOCUMENT::JSON; 
	V_NUMINT := DOCUMENTJSON->>'numint';
	V_TYPINV := DOCUMENTJSON->>'typinv';
	V_CODART := DOCUMENTJSON->>'codart';
	V_ETIQUETA := DOCUMENTJSON->>'etiqueta';
	V_QUANTITY := DOCUMENTJSON->>'quantity';
	V_PRICE := DOCUMENTJSON->>'price';
	V_IMPAFECTO := DOCUMENTJSON->>'impafecto';
	V_IMPINAFECTO := DOCUMENTJSON->>'impinafecto';
	V_IMPEXONERADO := DOCUMENTJSON->>'impexonerado';
	V_IMPGRATUITO := DOCUMENTJSON->>'impgratuito';
	V_IMPDESC01 := DOCUMENTJSON->>'impdesc01';
	V_IMPDESC02 := DOCUMENTJSON->>'impdesc02';
	V_IMPDESC03 := DOCUMENTJSON->>'impdesc03';
	V_IMPDESC04 := DOCUMENTJSON->>'impdesc04';
	
	IF V_QUANTITY <= 0 AND (V_IMPAFECTO + V_IMPINAFECTO + V_IMPEXONERADO + V_IMPGRATUITO) <= 0 THEN
		OUT_CODE := -2;
		OUT_MESSAGE := 'The amount and/or quantity cannot be less than or equal to zero';
		OUT_LOG := OUT_MESSAGE;
		RETURN;
    END IF;
	
	IF NOT EXISTS(SELECT DH.NUMINT FROM TBL_DOCUMENT_HEADER DH WHERE DH.NUMINT = V_NUMINT) THEN
		OUT_CODE := -2;
		OUT_MESSAGE := 'The document [ ' || V_NUMINT::TEXT || ' ] does not exists';
		OUT_LOG := OUT_MESSAGE;
		RETURN;
	END IF;
	
	BEGIN
		SELECT
			( DD.NUMITE + 1 )
		INTO STRICT	
			V_NUMITE
		FROM TBL_DOCUMENT_DETAIL DD
		WHERE
			DD.NUMINT = V_NUMINT
		ORDER BY
			DD.NUMITE DESC
		FETCH NEXT 1 ROWS ONLY;
		
	EXCEPTION
		WHEN no_data_found THEN
			V_NUMITE = 1;
	END;
	OUT_NUMITE := V_NUMITE;
	-- CALCULATE IMPORT
	V_IMPLISTPRICE := COALESCE(V_IMPAFECTO,0) + COALESCE(V_IMPINAFECTO,0) + COALESCE(V_IMPEXONERADO,0) + COALESCE(V_IMPGRATUITO,0);
	V_AUX1 := (1 - COALESCE(V_IMPDESC01,0)) * (1 - COALESCE(V_IMPDESC02,0)) * (1 - COALESCE(V_IMPDESC03,0)) * (1 - COALESCE(V_IMPDESC04,0));
	V_IMPDESCTOTAL := V_IMPLISTPRICE - (V_IMPLISTPRICE * V_AUX1);
	V_IMPSALEPRICE := V_IMPLISTPRICE - V_IMPDESCTOTAL;

	V_IMPIGV := V_IMPAFECTO * (V_AUX1) * 0.18;
	V_IMPISC := 0;
	V_IMPTRIBADD01 := 0;
	V_IMPTRIBADD02 := 0;
	V_IMPTRIBADD03 := 0;
	V_IMPTRIBADD04 := 0;
	
	V_IMPTRIBTOTAL := V_IMPIGV + V_IMPISC + V_IMPTRIBADD01 + V_IMPTRIBADD02 + V_IMPTRIBADD03 + V_IMPTRIBADD04;
	V_IMPTOTAL := V_IMPSALEPRICE + V_IMPTRIBTOTAL;
	 
	INSERT INTO TBL_DOCUMENT_DETAIL ( 
	NUMINT, NUMITE, TYPINV, CODART, ETIQUETA, QUANTITY, PRICE, IMPAFECTO, IMPINAFECTO, IMPEXONERADO, IMPGRATUITO, IMPIGV,
	IMPISC, IMPTRIBADD01, IMPTRIBADD02, IMPTRIBADD03, IMPTRIBADD04, IMPDESC01, IMPDESC02, IMPDESC03,
	IMPDESC04, IMPLISTPRICE, IMPDESCTOTAL, IMPSALEPRICE, IMPTRIBTOTAL, IMPTOTAL
	) VALUES (
	V_NUMINT, V_NUMITE, V_TYPINV, V_CODART, V_ETIQUETA, V_QUANTITY, V_PRICE, V_IMPAFECTO, V_IMPINAFECTO, V_IMPEXONERADO, V_IMPGRATUITO, V_IMPIGV,
	V_IMPISC, V_IMPTRIBADD01, V_IMPTRIBADD02, V_IMPTRIBADD03, V_IMPTRIBADD04, V_IMPDESC01, V_IMPDESC02, V_IMPDESC03,
	V_IMPDESC04, V_IMPLISTPRICE, V_IMPDESCTOTAL, V_IMPSALEPRICE, V_IMPTRIBTOTAL, V_IMPTOTAL
	);

	OUT_CODE := 1;
	OUT_MESSAGE := 'The documento [ ' || V_NUMINT::TEXT || ' - ' || V_NUMITE::TEXT || ' ] has been generated';
	OUT_LOG := OUT_MESSAGE;
	RETURN;

EXCEPTION
	WHEN OTHERS THEN
		OUT_CODE := -2;
		OUT_MESSAGE := 'An unknown error has occurred';
		OUT_LOG := 'ERROR ( ' || SQLSTATE || ' ) : ' || SQLERRM;
	RETURN;
END $$;
 
DO $$
DECLARE
	V_DOCUMENT VARCHAR(4000) := 
		'{"numint":88,
		"typinv":1,
		"codart":"OSAHG",
		"etiqueta":"5459821654",
		"quantity":1,
		"price":10.00,
		"impafecto":10.00,
		"impinafecto":0,
		"impexonerado":0,
		"impgratuito":0,
		"impdesc01":0.10,
		"impdesc02":0.15,
		"impdesc03":0,
		"impdesc04":0}';
	V_NUMITE BIGINT;
	V_CODE INTEGER;
	V_MESSAGE VARCHAR(1000);
	V_LOG VARCHAR(1000);
BEGIN
	CALL PR_CREATE_DOCUMENT_DETAIL(V_DOCUMENT, V_NUMITE, V_CODE, V_MESSAGE, V_LOG);
	RAISE NOTICE 'NUMITE: %', V_NUMITE;
	RAISE NOTICE 'CODE: %', V_CODE;
    RAISE NOTICE 'MESSAGE: %', V_MESSAGE;
	RAISE NOTICE 'LOG: %', V_LOG;
END $$;

SELECT * FROM TBL_DOCUMENT_DETAIL;

DROP PROCEDURE IF EXISTS PR_CALCULATE_IMPORT_DOCUMENT;

CREATE OR REPLACE PROCEDURE PR_CALCULATE_IMPORT_DOCUMENT(
	IN_NUMINT IN BIGINT,
	OUT_CODE OUT INTEGER,
	OUT_MESSAGE OUT VARCHAR,
	OUT_LOG OUT VARCHAR
)
LANGUAGE PLPGSQL
AS $$
DECLARE
	V_IMPLISTPRICE NUMERIC(24,4) := 0;
	V_IMPDESCTOTAL NUMERIC(24,4) := 0;
	V_IMPSALEPRICE NUMERIC(24,4) := 0;
	V_IMPTRIBTOTAL NUMERIC(24,4) := 0;
	V_IMPTOTAL NUMERIC(24,4) := 0;
BEGIN

	IF NOT EXISTS (SELECT DH.NUMINT FROM TBL_DOCUMENT_HEADER DH WHERE DH.NUMINT = IN_NUMINT ) THEN
		OUT_CODE := -2;
		OUT_MESSAGE := 'Record with ID [ ' || IN_NUMINT::VARCHAR || ' ] does not exists';
		OUT_LOG := OUT_MESSAGE;
		RETURN;
	ELSE
		SELECT
			SUM(DD.IMPLISTPRICE),
			SUM(DD.IMPDESCTOTAL),
			SUM(DD.IMPSALEPRICE),
			SUM(DD.IMPTRIBTOTAL),
			SUM(DD.IMPTOTAL)
		INTO STRICT
			V_IMPLISTPRICE,
			V_IMPDESCTOTAL,
			V_IMPSALEPRICE,
			V_IMPTRIBTOTAL,
			V_IMPTOTAL
		FROM TBL_DOCUMENT_DETAIL DD
		WHERE 
			DD.NUMINT = IN_NUMINT;
		
		UPDATE TBL_DOCUMENT_HEADER
		SET
			IMPLISTPRICE = V_IMPLISTPRICE,
			IMPDESCTOTAL = V_IMPDESCTOTAL,
			IMPSALEPRICE = V_IMPSALEPRICE,
			IMPTRIBTOTAL = V_IMPTRIBTOTAL,
			IMPTOTAL = V_IMPTOTAL
		WHERE
			NUMINT = IN_NUMINT;
			
		OUT_CODE := 1;
		OUT_MESSAGE := 'Ok';
		OUT_LOG := OUT_MESSAGE;
		RETURN;
		
	END IF;	
	
EXCEPTION
	WHEN OTHERS THEN
		OUT_CODE := -2;
		OUT_MESSAGE := 'An unknown error has occurred';
		OUT_LOG := 'ERROR ( ' || SQLSTATE || ' ) : ' || SQLERRM;
END $$;

DO $$
DECLARE
	V_CODE INTEGER;
	V_MESSAGE VARCHAR(1000);
	V_LOG VARCHAR(1000);
BEGIN
	CALL PR_CALCULATE_IMPORT_DOCUMENT(88, V_CODE, V_MESSAGE, V_LOG);
	RAISE NOTICE 'CODE: %', V_CODE;
    RAISE NOTICE 'MESSAGE: %', V_MESSAGE;
	RAISE NOTICE 'LOG: %', V_LOG;
END $$;

SELECT * FROM  TBL_DOCUMENT_HEADER;

DROP FUNCTION IF EXISTS FN_SEARCH_DOCUMENT;

DROP TYPE IF EXISTS REC_SEARCH_DOCUMENT;

CREATE TYPE REC_SEARCH_DOCUMENT AS (
	NUMINT BIGINT,
	NUMDOC BIGINT,
	SERIE  VARCHAR(5),
	DESTYPCOMDOC VARCHAR(10),
	DESSITCOMDOCDOC VARCHAR(10),
	REGISTDATE DATE,
	DESINGSALCOM VARCHAR(10),
	DESREACOMDOC VARCHAR(10),
	CODBUSPAR VARCHAR(50),
	BUSNAM VARCHAR(250),
	ADDRES VARCHAR(250),
	DESPLAISS VARCHAR(10),
	CODCUR VARCHAR(5),
	DESSEL VARCHAR(10),
	DESTYPPAYCON VARCHAR(10),
	IMPSALEPRICE NUMERIC(24,4),
	IMPTOTAL NUMERIC(24,4)	
);

CREATE OR REPLACE FUNCTION FN_SEARCH_DOCUMENT(
	-- OBLIGATORIO
	IN_TYPCOMDOC IN INTEGER,
	IN_STARTAT IN DATE,
	IN_FINALAT IN DATE,
	-- RANGO MULTYPLE
	IN_SITCOMDOC IN TEXT,
	IN_REACOMDOC IN TEXT,
	-- OPCIONAL
	IN_SERIE IN VARCHAR,
	IN_TYPPAYCON IN INTEGER, 
	IN_CODBUSPAR IN VARCHAR
)
RETURNS SETOF REC_SEARCH_DOCUMENT AS
$BODY$
BEGIN
	RETURN QUERY
	SELECT
		DH.NUMINT,
		DH.NUMDOC,
		DH.SERIE,
		TDC.ABREVI AS DESTYPCOMDOC,
		SDC.ABREVI AS DESSITCOMDOCDOC,
		DH.REGISTDATE,
		CAST(CASE WHEN DH.INGSALCOM = 0 THEN
			'INGRESO'
		ELSE
			'SALIDA'		
		END AS VARCHAR(10)) DESINGSALCOM,
		MDC.ABREVI AS DESREACOMDOC,
		DH.CODBUSPAR,
		DH.BUSNAM,
		DH.ADDRES,
		CAST(CASE WHEN DH.CODPLAISS = 1 THEN
			'PUNT VENTA'
		ELSE
			'ND'
		END AS VARCHAR(10)) DESPLAISS,
		DH.CODCUR,
		S.ABREVI AS DESSEL,
		TCP.ABREVI AS DESTYPPAYCON,
		DH.IMPSALEPRICE,
		DH.IMPTOTAL
	FROM TBL_DOCUMENT_HEADER DH
	LEFT OUTER JOIN TBL_TYPE_COMMERCIAL_DOCUMENT TDC ON TDC.TYPCOMDOC = DH.TYPCOMDOC
	LEFT OUTER JOIN TBL_SITUATION_COMMERCIAL_DOCUMENT SDC ON SDC.TYPCOMDOC =  DH.TYPCOMDOC AND SDC.SITCOMDOC = DH.SITCOMDOC
	LEFT OUTER JOIN TBL_REASON_COMMERCIAL_DOCUMENT MDC ON MDC.TYPCOMDOC =  DH.TYPCOMDOC AND MDC.INGSALCOM = DH.INGSALCOM AND MDC.REACOMDOC =  DH.REACOMDOC
	LEFT OUTER JOIN TBL_SELLER S ON S.CODSEL = DH.CODSEL
	LEFT OUTER JOIN TBL_TYPE_PAYMENT_CONDITION TCP ON TCP.TYPPAYCON = DH.TYPPAYCON
	WHERE
		DH.TYPCOMDOC = IN_TYPCOMDOC AND
		DH.REGISTDATE BETWEEN IN_STARTAT AND IN_FINALAT AND
		DH.SITCOMDOC IN (SELECT CAST(regexp_split_to_table(IN_SITCOMDOC, '\,') AS NUMERIC)) AND
		DH.REACOMDOC IN (SELECT CAST(regexp_split_to_table(IN_REACOMDOC, '\,') AS NUMERIC));
		
END;
$BODY$
LANGUAGE plpgsql;

SELECT * FROM FN_SEARCH_DOCUMENT(1,
								  TO_DATE('2023-03-01', 'YYYY-MM-DD'),
								  TO_DATE('2023-06-03', 'YYYY-MM-DD'),'1,2,3,4,5','1,2,3,4,5',NULL,NULL,NULL);

DROP FUNCTION IF EXISTS FN_PRINT_DOCUMENT_INVOCE;

DROP TYPE IF EXISTS REC_PRINT_DOCUMENT_INVOCE;

CREATE TYPE REC_PRINT_DOCUMENT_INVOCE AS (
	-- COMPANY
	COMDESTYPIDEDOC VARCHAR(250),
	COMNROIDEDOC VARCHAR(100), 
	COMNAM VARCHAR(250),
	COMADDRES VARCHAR(250),
	COMPOSCOD VARCHAR(20), 
	COMGLOSS BYTEA,
	-- HEADER
	NUMINT BIGINT,
	NUMDOC BIGINT,
	SERIE  VARCHAR(5),
	DESDOCCOM VARCHAR(250),
	DESSITCOMDOC VARCHAR(250),
	REGISTDATE DATE,
	DESINGSALCOM VARCHAR(250),
	DESREACOMDOC VARCHAR(250),
	CODBUSPAR VARCHAR(50),
	DESTYPIDEDOC VARCHAR(250),
	NROIDEDOC VARCHAR(100),
	BUSNAM VARCHAR(250),
	ADDRES VARCHAR(250),
	POSCOD VARCHAR(20),
	DESPLAISS VARCHAR(250),
	-- CURRENCY
	CODCUR VARCHAR(5),
	CURSYMBOL VARCHAR(5),
	EXCHANGERATE NUMERIC(8,4),
	DESSEL VARCHAR(250),
	DESPAYCON VARCHAR(250),
	-- REFERE
	REFERE VARCHAR(1000),
	OBSERV VARCHAR(1000),
	COMMEN VARCHAR(1000),
	IMPLISTPRICE NUMERIC(24,4),
    IMPDESCTOTAL NUMERIC(24,4),
    IMPSALEPRICE NUMERIC(24,4),
	IMPTRIBTOTAL NUMERIC(24,4),
    IMPTOTAL NUMERIC(24,4),
	IMPNAME VARCHAR(250),
	-- DETAIL
	NUMITE BIGINT,
    TYPINV INTEGER,
	DESTYPINV VARCHAR(250),
    CODART VARCHAR(50),
    DESART VARCHAR(250),
	ETIQUETA BIGINT,
	DESETIQUETA VARCHAR(250),
	QUANTITY NUMERIC(24,4),
	PRICE NUMERIC(24,4),	
	DETLISTPRICE NUMERIC(24,4),
    DETDESCTOTAL NUMERIC(24,4),
    DETSALEPRICE NUMERIC(24,4),
	DETTRIBTOTAL NUMERIC(24,4),
	DETTOTAL NUMERIC(24,4)
);

CREATE OR REPLACE FUNCTION FN_PRINT_DOCUMENT_INVOCE(
	IN_NUMINT IN BIGINT
)
RETURNS SETOF REC_PRINT_DOCUMENT_INVOCE AS
$BODY$
BEGIN
	RETURN QUERY
	SELECT
		-- COMPANY
		TID1.DESCRI AS COMDESTYPIDEDOC,
		CI.NROIDEDOC AS COMNROIDEDOC,
		CI.COMNAM,
		CI.ADDRES AS COMADDRES,
		CI.POSCOD AS COMPOSCOD,
		CI.GLOSS AS COMGLOSS,
		-- HEADER
		DH.NUMINT,
		DH.NUMDOC,
		DH.SERIE,
		TDC.DESCRI AS DESDOCCOM,
		SDC.DESCRI AS DESSITCOMDOC,
		DH.REGISTDATE,
		CAST(CASE WHEN DH.INGSALCOM = 0 THEN
			'INGRESO'
		ELSE
			'SALIDA'		
		END AS VARCHAR(250)) AS DESINGSALCOM,
		MDC.DESCRI AS DESREACOMDOC,
		DH.CODBUSPAR,
		TID2.DESCRI AS DESTYPCOMDOC,
		BP.NROIDEDOC, 
		DH.BUSNAM,
		DH.ADDRES,
		DH.POSCOD,
		CAST(CASE WHEN DH.CODPLAISS = 1 THEN
			'PUNT VENTA'
		ELSE
			'ND'
		END AS VARCHAR(250)) AS DESPLAISS,
		DH.CODCUR,
		CAST('S/.' AS VARCHAR(5)) AS CURSYMBOL,
		DH.EXCHANGERATE,
		S.DESCRI AS DESSEL,
		TCP.DESCRI AS DESPAYCON,
		-- REFERE
		DH.REFERE,
		DH.OBSERV,
		DH.COMMEN,
		DH.IMPLISTPRICE,
		DH.IMPDESCTOTAL,
		DH.IMPSALEPRICE,
		DH.IMPTRIBTOTAL,
		DH.IMPTOTAL,
	 	CAST(UPPER(number_to_string(1234)) AS VARCHAR(250)) AS IMPNAME, 
		-- DETAILS
		DD.NUMITE,
		DD.TYPINV,
		TI.DESCRI AS DESTYPINV,
		DD.CODART,
		A.DESCRI AS DESART,
		DD.ETIQUETA,
		CAST('' AS VARCHAR(250)) AS DESETIQUETA,
		DD.QUANTITY,
		DD.PRICE,
		DD.IMPLISTPRICE AS DETLISTPRICE,
		DD.IMPDESCTOTAL AS DETDESCTOTAL,
		DD.IMPSALEPRICE AS DETSALEPRICE,
		DD.IMPTRIBTOTAL AS DETTRIBTOTAL,
		DD.IMPTOTAL AS DETTOTAL
	FROM TBL_DOCUMENT_HEADER DH
	LEFT OUTER JOIN TBL_COMPANY_INFO CI ON CI.NUMINT = 1
	LEFT OUTER JOIN TBL_TYPE_IDENTITY_DOCUMENT TID1 ON TID1.TYPIDEDOC = CI.TYPIDEDOC
	LEFT OUTER JOIN TBL_BUSINESS_PARTNER BP ON BP.CODBUSPAR = DH.CODBUSPAR
	LEFT OUTER JOIN TBL_TYPE_IDENTITY_DOCUMENT TID2 ON TID2.TYPIDEDOC = BP.TYPIDEDOC
	LEFT OUTER JOIN TBL_TYPE_COMMERCIAL_DOCUMENT TDC ON TDC.TYPCOMDOC = DH.TYPCOMDOC
	LEFT OUTER JOIN TBL_SITUATION_COMMERCIAL_DOCUMENT SDC ON SDC.TYPCOMDOC =  DH.TYPCOMDOC AND SDC.SITCOMDOC = DH.SITCOMDOC
	LEFT OUTER JOIN TBL_REASON_COMMERCIAL_DOCUMENT MDC ON MDC.TYPCOMDOC =  DH.TYPCOMDOC AND MDC.INGSALCOM = DH.INGSALCOM AND MDC.REACOMDOC =  DH.REACOMDOC
	LEFT OUTER JOIN TBL_SELLER S ON S.CODSEL = DH.CODSEL
	LEFT OUTER JOIN TBL_TYPE_PAYMENT_CONDITION TCP ON TCP.TYPPAYCON = DH.TYPPAYCON
	LEFT OUTER JOIN TBL_DOCUMENT_DETAIL DD ON DD.NUMINT = DH.NUMINT
	LEFT OUTER JOIN TBL_TYPE_INVENTORY TI ON TI.TYPINV = DD.TYPINV
	LEFT OUTER JOIN TBL_ARTICLE A ON A.CODART = DD.CODART
	WHERE
		DH.NUMINT = IN_NUMINT
	ORDER BY
		DD.NUMITE ASC;
	
END;
$BODY$
LANGUAGE plpgsql;

SELECT * FROM FN_PRINT_DOCUMENT_INVOCE(88);

DROP PROCEDURE IF EXISTS PR_CANCEL_INVOICE;

CREATE OR REPLACE PROCEDURE PR_CANCEL_INVOICE(
	IN_NUMINT IN BIGINT,
	OUT_CODE OUT INTEGER,
	OUT_MESSAGE OUT VARCHAR,
	OUT_LOG OUT VARCHAR
)
LANGUAGE PLPGSQL
AS $$
DECLARE
BEGIN

	IF NOT EXISTS (SELECT DH.NUMINT FROM TBL_DOCUMENT_HEADER DH WHERE DH.NUMINT = IN_NUMINT ) THEN
		OUT_CODE := -2;
		OUT_MESSAGE := 'Record with ID [ ' || IN_NUMINT::VARCHAR || ' ] does not exists';
		OUT_LOG := OUT_MESSAGE;
		RETURN;
	ELSE		
		UPDATE TBL_DOCUMENT_HEADER
		SET
			SITCOMDOC = 5
		WHERE
			NUMINT = IN_NUMINT;
			
		OUT_CODE := 1;
		OUT_MESSAGE := 'Ok';
		OUT_LOG := OUT_MESSAGE;
		RETURN;
		
	END IF;	
	
EXCEPTION
	WHEN OTHERS THEN
		OUT_CODE := -2;
		OUT_MESSAGE := 'AN UNKNOWN ERROR HAS OCCURRED';
		OUT_LOG := 'ERROR ( ' || SQLSTATE || ' ) : ' || SQLERRM;
END $$;

DO $$
DECLARE
	V_CODE INTEGER;
	V_MESSAGE VARCHAR(1000);
	V_LOG VARCHAR(1000);
BEGIN
	CALL PR_CANCEL_INVOICE(88, V_CODE, V_MESSAGE, V_LOG);
	RAISE NOTICE 'CODE: %', V_CODE;
    RAISE NOTICE 'MESSAGE: %', V_MESSAGE;
	RAISE NOTICE 'LOG: %', V_LOG;
END $$;