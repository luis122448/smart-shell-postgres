SET search_path TO smart_shell;

-- SELECT current_schema();

-- PROCEDURE AND FUNCTION

-- DROP TABLE IF EXISTS TBL_REASON_COMMERCIAL_DOCUMENT;

-- CREATE TABLE TBL_REASON_COMMERCIAL_DOCUMENT(
--     IDCOMPANY INTEGER,
-- 	TYPCOMDOC INTEGER,
-- 	INOUT INTEGER,
-- 	REACOMDOC INTEGER,
-- 	ABREVI VARCHAR(10),
-- 	DESCRI VARCHAR(250),
-- 	CODEXT VARCHAR(100),
-- 	OBSERV VARCHAR(500),
-- 	COMMEN VARCHAR(4000),
-- 	DEFAUL VARCHAR(1) DEFAULT 'N',
-- 	STATUS VARCHAR(1) DEFAULT 'Y',
-- 	CREATEBY VARCHAR(10) DEFAULT 'ADMIN',
-- 	UPDATEBY VARCHAR(10) DEFAULT 'ADMIN',
-- 	CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
-- 	UPDATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP	
-- );

-- ALTER TABLE TBL_REASON_COMMERCIAL_DOCUMENT
-- 	ADD CONSTRAINT PK_REASON_COMMERCIAL_DOCUMENT PRIMARY KEY (IDCOMPANY,TYPCOMDOC,INOUT,REACOMDOC);

-- INSERT INTO TBL_REASON_COMMERCIAL_DOCUMENT (IDCOMPANY,TYPCOMDOC, INOUT, REACOMDOC, ABREVI, DESCRI, CODEXT, OBSERV,DEFAUL)
-- VALUES
-- 	(1,1, 1, 1, 'Sale Dire', 'Direct Sale', NULL, 'Used when making a direct sale (cash on delivery)','Y'),
-- 	(1,1, 1, 2, 'Sale Defe', 'Deferred Sale', NULL, 'Used when efe delivery is made after the sale','N'),
-- 	(1,1, 1, 3, 'Commission', 'Commission', NULL, 'Used when the sale is made by a commission agent','N'),
-- 	(1,1, 1, 4, 'Service', 'Service', NULL, 'Used in the sale of a service','N'),
-- 	(1,1, 1, 5, 'Free Trans', 'Free Transfer', NULL, 'Used for gifts, giveaways, vouchers, ...','N'),
-- 	(1,1, 1, 6, 'Sample', 'Sample', NULL, 'Used when distributing a sample or trial','N'),
-- 	(1,1, 1, 7, 'Change Doc', 'Document Change', NULL, 'Used when a non-editable error in a previously issued document needs to be corrected','N'),
-- 	(1,3, 1, 1, 'Sale Dire', 'Direct Sale', NULL, 'Used when making a direct sale (cash on delivery)','Y'),
-- 	(1,3, 1, 2, 'Sale Defe', 'Deferred Sale', NULL, 'Used when the delivery is made after the sale','N'),
-- 	(1,3, 1, 3, 'Commission', 'Commission', NULL, 'Used when the sale is made by a commission agent','N'),
-- 	(1,3, 1, 4, 'Service', 'Service', NULL, 'Used in the sale of a service','N'),
-- 	(1,3, 1, 5, 'Free Tran', 'Free Transfer', NULL, 'Used for gifts, giveaways, vouchers, ...','N'),
-- 	(1,3, 1, 6, 'Sample', 'Sample', NULL, 'Used when distributing a sample or trial','N'),
-- 	(1,3, 1, 7, 'Change Doc', 'Document Change', NULL, 'Used when a non-editable error in a previously issued document needs to be corrected','N');

-- INSERT INTO TBL_REASON_COMMERCIAL_DOCUMENT (IDCOMPANY,TYPCOMDOC, INOUT, REACOMDOC, ABREVI, DESCRI, CODEXT, OBSERV,DEFAUL)
-- VALUES
-- 	(1,111, 0, 1, 'Inv Tak', 'Inventory Taking', NULL, 'Document used to record the inventory count','Y'),
-- 	(1,103, 0, 1, 'Ig Purch', 'Purchase', NULL, 'Used when efe delivery is made after the sale','Y'),
-- 	(1,103, 0, 2, 'Ig Dev', 'Return', NULL, 'Used when efe delivery is made after the sale','Y'),
-- 	(1,103, 1, 1, 'Ig Del', 'Delivery', NULL, 'Used when efe delivery is made after the sale','N');

-- SELECT * FROM TBL_REASON_COMMERCIAL_DOCUMENT;