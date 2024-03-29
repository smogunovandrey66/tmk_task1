CREATE SEQUENCE city_id_seq START WITH 1;

CREATE TABLE "CHTPZ"."CITY" 
   (	"CITY_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(40 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "CITY_PK" PRIMARY KEY ("CITY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "GARNET"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "GARNET" ;

CREATE OR REPLACE TRIGGER "CHTPZ"."CITY_AI" 
BEFORE INSERT ON city
FOR EACH ROW
BEGIN
  SELECT city_id_seq.nextval
  INTO :new.city_id
  FROM dual;
END;
