-- Content: Script to create tables for platform training
\c platform_training;

-- Change schema
SET search_path TO public;

INSERT INTO TBL_USER_CLASS (ID_COMPANY, ID_USER, ID_CLASS, USER_REGISTER, REGISTER_DATE, START_DATE, END_DATE, EXPIRATION_DATE, LOCKED, BEGIN, PROGRESS, FINALIZED, ADVANCE, REQUIRED_TIME, STATUS)
VALUES
(0,0,1,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,0,2,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,0,3,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,0,4,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,0,5,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,0,6,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,0,7,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,0,8,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,0,9,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,0,10,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,0,11,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,0,12,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,0,13,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,0,14,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,0,15,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,0,16,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y');

INSERT INTO TBL_USER_CLASS (ID_COMPANY, ID_USER, ID_CLASS, USER_REGISTER, REGISTER_DATE, START_DATE, END_DATE, EXPIRATION_DATE, LOCKED, BEGIN, PROGRESS, FINALIZED, ADVANCE, REQUIRED_TIME, STATUS)
VALUES
(0,1,1,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,1,2,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,1,3,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,1,4,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,1,5,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,1,6,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,1,7,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,1,8,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,1,9,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,1,10,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,1,11,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,1,12,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,1,13,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,1,14,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,1,15,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,1,16,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y');

INSERT INTO TBL_USER_CLASS (ID_COMPANY, ID_USER, ID_CLASS, USER_REGISTER, REGISTER_DATE, START_DATE, END_DATE, EXPIRATION_DATE, LOCKED, BEGIN, PROGRESS, FINALIZED, ADVANCE, REQUIRED_TIME, STATUS)
VALUES
(0,2,1,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,2,2,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,2,3,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,2,4,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,2,5,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,2,6,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,2,7,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,2,8,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,2,9,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,2,10,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,2,11,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,2,12,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,2,13,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,2,14,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,2,15,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,2,16,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y');

INSERT INTO TBL_USER_CLASS (ID_COMPANY, ID_USER, ID_CLASS, USER_REGISTER, REGISTER_DATE, START_DATE, END_DATE, EXPIRATION_DATE, LOCKED, BEGIN, PROGRESS, FINALIZED, ADVANCE, REQUIRED_TIME, STATUS)
VALUES
(0,3,1,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,3,2,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,3,3,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,3,4,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,3,5,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,3,6,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,3,7,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,3,8,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,3,9,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,3,10,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,3,11,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,3,12,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,3,13,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,3,14,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,3,15,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,3,16,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y');

INSERT INTO TBL_USER_CLASS (ID_COMPANY, ID_USER, ID_CLASS, USER_REGISTER, REGISTER_DATE, START_DATE, END_DATE, EXPIRATION_DATE, LOCKED, BEGIN, PROGRESS, FINALIZED, ADVANCE, REQUIRED_TIME, STATUS)
VALUES
(0,4,1,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,4,2,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,4,3,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,4,4,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,4,5,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,4,6,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,4,7,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,4,8,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,4,9,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,4,10,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,4,11,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,4,12,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,4,13,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,4,14,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,4,15,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,4,16,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y');

INSERT INTO TBL_USER_COURSE (ID_COMPANY, ID_USER, ID_COURSE, USER_REGISTER, REGISTER_DATE, START_DATE, END_DATE, EXPIRATION_DATE, LOCKED, BEGIN, PROGRESS, FINALIZED, ADVANCE, REQUIRED_TIME, STATUS)
VALUES
(0,0,1,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,1,1,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y'),
(0,2,1,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y'),
(0,3,1,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y'),
(0,4,1,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y');

INSERT INTO TBL_USER_MODULE (ID_COMPANY, ID_USER, ID_MODULE, USER_REGISTER, REGISTER_DATE, START_DATE, END_DATE, EXPIRATION_DATE, LOCKED, BEGIN, PROGRESS, FINALIZED, ADVANCE, REQUIRED_TIME, STATUS)
VALUES
(0,0,1,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,0,2,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y'),
(0,0,3,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y'),
(0,0,4,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y'),
(0,0,5,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y'),
(0,0,6,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y'),
(0,0,7,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y'),
(0,0,8,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y'),
(0,0,9,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y'),
(0,0,10,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y');

INSERT INTO TBL_USER_MODULE (ID_COMPANY, ID_USER, ID_MODULE, USER_REGISTER, REGISTER_DATE, START_DATE, END_DATE, EXPIRATION_DATE, LOCKED, BEGIN, PROGRESS, FINALIZED, ADVANCE, REQUIRED_TIME, STATUS)
VALUES
(0,1,1,0,'2022-01-01','2022-01-01',null,null,false,true,false,false,0,0,'Y'),
(0,1,2,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y'),
(0,1,3,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y'),
(0,1,4,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y'),
(0,1,5,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y'),
(0,1,6,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y'),
(0,1,7,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y'),
(0,1,8,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y'),
(0,1,9,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y'),
(0,1,10,0,'2022-01-01','2022-01-01',null,null,false,false,false,false,0,0,'Y');
