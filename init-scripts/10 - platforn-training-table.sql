-- Content: Script to create tables for platform training
\c platform_training;

-- Change schema
SET search_path TO public;

-- CREATE TABLE FOR AUTHENTICATION
DROP TABLE IF EXISTS TBL_USER;
DROP TABLE IF EXISTS TBL_COMPANY;

CREATE TABLE IF NOT EXISTS TBL_COMPANY (
    ID_COMPANY BIGINT,
    COMPANY VARCHAR(250),
    NAME VARCHAR(250),
    GLOSS BYTEA,
    URL_LOGO VARCHAR(250),
    STATUS VARCHAR(1) DEFAULT 'Y',
	CREATE_BY BIGINT DEFAULT 0,
	UPDATE_BY BIGINT DEFAULT 0,
	CREATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UPDATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP	
);

ALTER TABLE TBL_COMPANY 
    ADD CONSTRAINT PK_COMPANY PRIMARY KEY (ID_COMPANY);

CREATE TABLE IF NOT EXISTS TBL_USER (
    ID_COMPANY BIGINT,
    ID_USER BIGINT,
    USERNAME VARCHAR(250),
    ENCODE VARCHAR(250),
    SECRET_CODE VARCHAR(250),
    ROLE VARCHAR(250),
    NIVEL INTEGER,
    NAME VARCHAR(250),
    LAST_NAME VARCHAR(250),
    URL_PHOTO VARCHAR(250),
    EMAIL VARCHAR(250),
    ADDRESS VARCHAR(250),
    PHONE VARCHAR(250),
    COMMENT VARCHAR(250),
    REGIST_DATE DATE,
    EXPIRE_DATE DATE,
    STATUS VARCHAR(1) DEFAULT 'Y',
	CREATE_BY BIGINT DEFAULT 0,
	UPDATE_BY BIGINT DEFAULT 0,
	CREATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UPDATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP	
);

ALTER TABLE TBL_USER
    ADD CONSTRAINT PK_USER PRIMARY KEY (ID_COMPANY,ID_USER);

ALTER TABLE TBL_USER
    ADD CONSTRAINT FK_USER_COMPANY FOREIGN KEY (ID_COMPANY)
        REFERENCES TBL_COMPANY (ID_COMPANY);

-- CREATE TABLE FOR LOGICAL
DROP TABLE IF EXISTS TBL_COMMENT;

CREATE TABLE IF NOT EXISTS TBL_COMMENT (
    ID_COMPANY BIGINT,
    ID_COMMENT BIGINT,
    ID_CLASS BIGINT,
    TYPE_COMMENT VARCHAR(250),
    REGISTER_USER BIGINT,
    REGISTER_DATE DATE,
    LIKE_COMMENT INTEGER,
    DISLIKE_COMMENT INTEGER,
    MARKDOWN_CONTENT VARCHAR(4000),
    ID_COMMENT_REF BIGINT,
    STATUS VARCHAR(1) DEFAULT 'Y',
    CREATE_BY BIGINT DEFAULT 0,
    UPDATE_BY BIGINT DEFAULT 0,
    CREATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP	
);

ALTER TABLE TBL_COMMENT
    ADD CONSTRAINT PK_COMMENT PRIMARY KEY (ID_COMPANY,ID_COMMENT);

DROP TABLE IF EXISTS TBL_CLASS;

CREATE TABLE IF NOT EXISTS TBL_CLASS (
    ID_COMPANY BIGINT,
    ID_CLASS BIGINT,
    ID_COURSE BIGINT,
    ID_TEACHER BIGINT,
    POSITION DECIMAL(10,2),
    TYPE_CLASS VARCHAR(250),
    TITLE VARCHAR(100),
    DESCRIPTION VARCHAR(500),
    MARKDOWN_CONTENT VARCHAR(4000),
    URL_IMAGE VARCHAR(250),
    ID_VIDEO VARCHAR(250),
    URL_VIDEO VARCHAR(250),
    STATUS VARCHAR(1) DEFAULT 'Y',
    CREATE_BY BIGINT DEFAULT 0,
    UPDATE_BY BIGINT DEFAULT 0,
    CREATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE TBL_CLASS
    ADD CONSTRAINT PK_CLASS PRIMARY KEY (ID_COMPANY,ID_CLASS);

DROP TABLE IF EXISTS TBL_COURSE;

CREATE TABLE IF NOT EXISTS TBL_COURSE (
    ID_COMPANY BIGINT,
    ID_COURSE BIGINT,
    ID_MODULE BIGINT,
    ID_TEACHER BIGINT,
    TITLE VARCHAR(100),
    DESCRIPTION VARCHAR(500),
    MARKDOWN_CONTENT VARCHAR(4000),
    URL_ICON VARCHAR(250),
    URL_LOGO VARCHAR(250),
    URL_BACKGROUND VARCHAR(250),
    ID_EXAM BIGINT,
    STATUS VARCHAR(1) DEFAULT 'Y',
    CREATE_BY BIGINT DEFAULT 0,
    UPDATE_BY BIGINT DEFAULT 0,
    CREATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE TBL_COURSE
    ADD CONSTRAINT PK_COURSE PRIMARY KEY (ID_COMPANY,ID_COURSE);

DROP TABLE IF EXISTS TBL_MODULE;

CREATE TABLE IF NOT EXISTS TBL_MODULE (
    ID_COMPANY BIGINT,
    ID_MODULE BIGINT,
    TITLE VARCHAR(100),
    DESCRIPTION VARCHAR(500),
    MARKDOWN_CONTENT VARCHAR(4000),
    URL_ICON VARCHAR(250),
    URL_LOGO VARCHAR(250),
    URL_BACKGROUND VARCHAR(250),
    STATUS VARCHAR(1) DEFAULT 'Y',
    CREATE_BY BIGINT DEFAULT 0,
    UPDATE_BY BIGINT DEFAULT 0,
    CREATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE TBL_MODULE
    ADD CONSTRAINT PK_MODULE PRIMARY KEY (ID_COMPANY,ID_MODULE);

DROP TABLE IF EXISTS TBL_TEACHER;

CREATE TABLE IF NOT EXISTS TBL_TEACHER (
    ID_COMPANY BIGINT,
    ID_TEACHER BIGINT,
    NAME VARCHAR(250),
    LAST_NAME VARCHAR(250),
    URL_PHOTO VARCHAR(250),
    STATUS VARCHAR(1) DEFAULT 'Y',
    CREATE_BY BIGINT DEFAULT 0,
    UPDATE_BY BIGINT DEFAULT 0,
    CREATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE TBL_TEACHER
    ADD CONSTRAINT PK_TEACHER PRIMARY KEY (ID_COMPANY,ID_TEACHER);

DROP TABLE IF EXISTS TBL_EXAM;

CREATE TABLE IF NOT EXISTS TBL_EXAM (
    ID_COMPANY BIGINT,
    ID_EXAM BIGINT,
    ID_COURSE BIGINT,
    TYPE_EXAM VARCHAR(250),
    TITLE VARCHAR(100),
    DESCRIPTION VARCHAR(500),
    MARKDOWN_CONTENT VARCHAR(4000),
    NUMBER_QUESTIONS INTEGER,
    TIME INTEGER,
    MIN_SCORE INTEGER,
    MAX_ATTEMPTS INTEGER,
    STATUS VARCHAR(1) DEFAULT 'Y',
    CREATE_BY BIGINT DEFAULT 0,
    UPDATE_BY BIGINT DEFAULT 0,
    CREATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE TBL_EXAM
    ADD CONSTRAINT PK_EXAM PRIMARY KEY (ID_COMPANY,ID_EXAM);

DROP TABLE IF EXISTS TBL_QUESTION;

CREATE TABLE IF NOT EXISTS TBL_QUESTION (
    ID_COMPANY BIGINT,
    ID_QUESTION BIGINT,
    ID_EXAM BIGINT,
    TYPE_QUESTION VARCHAR(250),
    POSITION DECIMAL(10,2),
    QUESTION VARCHAR(250),
    ALTERNATIVE1 VARCHAR(250),
    ALTERNATIVE2 VARCHAR(250),
    ALTERNATIVE3 VARCHAR(250),
    ALTERNATIVE4 VARCHAR(250),
    ALTERNATIVE5 VARCHAR(250),
    ID_ANSWER INTEGER,
    ANSWER VARCHAR(250),
    SCORE INTEGER,
    STATUS VARCHAR(1) DEFAULT 'Y',
    CREATE_BY BIGINT DEFAULT 0,
    UPDATE_BY BIGINT DEFAULT 0,
    CREATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS TBL_USER_CLASS;

CREATE TABLE IF NOT EXISTS TBL_USER_CLASS (
    ID_COMPANY BIGINT,
    ID_USER BIGINT,
    ID_CLASS BIGINT,
    USER_REGISTER BIGINT,
    REGISTER_DATE DATE,
    START_DATE DATE,
    END_DATE DATE,
    EXPIRATION_DATE DATE,
    LOCKED BOOLEAN,
    BEGIN BOOLEAN,
    PROGRESS BOOLEAN,
    FINALIZED BOOLEAN,
    ADVANCE DECIMAL(10,2),
    REQUIRED_TIME DECIMAL(10,2),
    STATUS VARCHAR(1) DEFAULT 'Y',
    CREATE_BY BIGINT DEFAULT 0,
    UPDATE_BY BIGINT DEFAULT 0,
    CREATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE TBL_USER_CLASS
    ADD CONSTRAINT PK_USER_CLASS PRIMARY KEY (ID_COMPANY,ID_USER,ID_CLASS);

DROP TABLE IF EXISTS TBL_USER_COURSE;

CREATE TABLE IF NOT EXISTS TBL_USER_COURSE (
    ID_COMPANY BIGINT,
    ID_USER BIGINT,
    ID_COURSE BIGINT,
    USER_REGISTER BIGINT,
    REGISTER_DATE DATE,
    START_DATE DATE,
    END_DATE DATE,
    EXPIRATION_DATE DATE,
    LOCKED BOOLEAN,
    BEGIN BOOLEAN,
    PROGRESS BOOLEAN,
    FINALIZED BOOLEAN,
    ADVANCE DECIMAL(10,2),
    REQUIRED_TIME DECIMAL(10,2),
    ID_LAST_EXAM BIGINT,
    STATUS VARCHAR(1) DEFAULT 'Y',
    CREATE_BY BIGINT DEFAULT 0,
    UPDATE_BY BIGINT DEFAULT 0,
    CREATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE TBL_USER_COURSE
    ADD CONSTRAINT PK_USER_COURSE PRIMARY KEY (ID_COMPANY,ID_USER,ID_COURSE);

DROP TABLE IF EXISTS TBL_USER_MODULE;

CREATE TABLE IF NOT EXISTS TBL_USER_MODULE (
    ID_COMPANY BIGINT,
    ID_USER BIGINT,
    ID_MODULE BIGINT,
    USER_REGISTER BIGINT,
    REGISTER_DATE DATE,
    START_DATE DATE,
    END_DATE DATE,
    EXPIRATION_DATE DATE,
    LOCKED BOOLEAN,
    BEGIN BOOLEAN,
    PROGRESS BOOLEAN,
    FINALIZED BOOLEAN,
    ADVANCE DECIMAL(10,2),
    REQUIRED_TIME DECIMAL(10,2),
    ID_LAST_EXAM BIGINT,
    STATUS VARCHAR(1) DEFAULT 'Y',
    CREATE_BY BIGINT DEFAULT 0,
    UPDATE_BY BIGINT DEFAULT 0,
    CREATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATE_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);