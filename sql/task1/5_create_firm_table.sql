CREATE SEQUENCE firm_id_seq START WITH 1;

CREATE TABLE "CHTPZ"."FIRM" 
   (	
    "FIRM_ID" NUMBER(10,0) NOT NULL ENABLE, 
    "NAME" VARCHAR2(60 BYTE) NOT NULL ENABLE, 
    "JUR_CITY_ID" NUMBER(10,0) NOT NULL ENABLE, 
    "POST_CITY_ID" NUMBER(10,0), 
	 CONSTRAINT "FIRM_PK" PRIMARY KEY ("FIRM_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "GARNET"  ENABLE,
  	 CONSTRAINT "FIRM_FK_POST_CITY" FOREIGN KEY ("POST_CITY_ID")
	  REFERENCES "CHTPZ"."CITY" ("CITY_ID") ENABLE, 
	 CONSTRAINT "FIRM_FK_JUR_CITY" FOREIGN KEY ("JUR_CITY_ID")
	  REFERENCES "CHTPZ"."CITY" ("CITY_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "GARNET" ;

CREATE OR REPLACE TRIGGER "CHTPZ"."FIRM_AI" 
BEFORE INSERT ON firm
FOR EACH ROW
BEGIN
  SELECT firm_id_seq.nextval
  INTO :new.firm_id
  FROM dual;
END;