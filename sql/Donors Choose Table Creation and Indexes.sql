/*Create Table Statements*/
DROP TABLE THREEB.PROJECTS CASCADE CONSTRAINTS;
CREATE TABLE THREEB.PROJECTS
  (
    PROJECTID                 VARCHAR2(254 BYTE) CONSTRAINT PROJECTS_PROJECTID_PK PRIMARY KEY ,
    TEACHER_ACCTID            VARCHAR2(254 BYTE),
    SCHOOLID                  VARCHAR2(254 BYTE),
    SCHOOL_NCESID             VARCHAR2(254 BYTE),
    SCHOOL_LATITUDE           NUMBER(24,6),
    SCHOOL_LONGITUDE          NUMBER(24,6),
    SCHOOL_CITY               VARCHAR2(254 BYTE),
    SCHOOL_STATE              VARCHAR2(254 BYTE),
    SCHOOL_ZIP                VARCHAR2(254 BYTE),
    SCHOOL_METRO              VARCHAR2(254 BYTE),
    SCHOOL_DISTRICT           VARCHAR2(254 BYTE),
    SCHOOL_COUNTY             VARCHAR2(254 BYTE),
    SCHOOL_CHARTER            VARCHAR2(254 BYTE),
    SCHOOL_MAGNET             VARCHAR2(254 BYTE),
    SCHOOL_YEAR_ROUND         VARCHAR2(254 BYTE),
    SCHOOL_NLNS               VARCHAR2(254 BYTE),
    SCHOOL_KIPP               VARCHAR2(254 BYTE),
    SCH_CHART_READ_PROM       VARCHAR2(254 BYTE),
    TEACHER_PREFIX            VARCHAR2(254 BYTE),
    TEACHER_TEACH_FOR_AMERICA VARCHAR2(254 BYTE),
    TEACH_NY_FELLOW           VARCHAR2(254 BYTE),
    PRIMARY_FOCUS_SUBJECT     VARCHAR2(254 BYTE),
    PRIMARY_FOCUS_AREA        VARCHAR2(254 BYTE),
    SECONDARY_FOCUS_SUBJECT   VARCHAR2(254 BYTE),
    SECONDARY_FOCUS_AREA      VARCHAR2(254 BYTE),
    RESOURCE_TYPE             VARCHAR2(254 BYTE),
    POVERTY_LEVEL             VARCHAR2(254 BYTE),
    GRADE_LEVEL               VARCHAR2(254 BYTE),
    VENDOR_SHIPPING_CHARGES   NUMBER(24,6),
    SALES_TAX                 NUMBER(24,6),
    PMT_PROC_CHARGE           NUMBER(24,6),
    FULFIL_LABOR_MAT          NUMBER(24,6),
    TOT_PRICE_EXCL_OPT_SUP    NUMBER(24,6),
    TOT_PRICE_INCL_OPT_SUP    NUMBER(24,6),
    STUDENTS_REACHED          NUMBER(24,6),
    TOTAL_DONATIONS           NUMBER(24,6),
    NUM_DONORS                NUMBER(24,6),
    ELIG_DOB_UR_IMP_MAT       VARCHAR2(254 BYTE),
    ELIG_ALM_HOME_MAT         VARCHAR2(254 BYTE),
    FUNDING_STATUS            VARCHAR2(254 BYTE),
    DATE_POSTED               VARCHAR2(254 BYTE),
    DATE_COMPLETED            VARCHAR2(254 BYTE),
    DATE_THNK_U_PCKT          VARCHAR2(254 BYTE),
    DATE_EXPIRATION           VARCHAR2(254 BYTE),
    DT_POSTED                 DATE,
    DT_COMPLETED              DATE,
    DT_THANK_PKT              DATE,
    DT_EXPIRATION             DATE
  )
  NOLOGGING;
DROP TABLE THREEB.GIFTCARDS CASCADE CONSTRAINTS;
CREATE TABLE THREEB.GIFTCARDS
  (
    GIFTCARDID             VARCHAR2(254 BYTE),
    DOLLAR_TIER            VARCHAR2(254 BYTE),
    BUYER_ACCTID           VARCHAR2(254 BYTE),
    BUYER_CITY             VARCHAR2(254 BYTE),
    BUYER_STATE            VARCHAR2(254 BYTE),
    BUYER_ZIP              VARCHAR2(254 BYTE),
    DATE_PURCHASED         VARCHAR2(254 BYTE),
    BUYER_CARTID           VARCHAR2(254 BYTE),
    RECIPIENT_ACCTID       VARCHAR2(254 BYTE),
    RECIPIENT_CITY         VARCHAR2(254 BYTE),
    RECIPIENT_STATE        VARCHAR2(254 BYTE),
    RECIPIENT_ZIP          VARCHAR2(254 BYTE),
    REDEEMED               VARCHAR2(254 BYTE),
    DATE_REDEEMED          VARCHAR2(254 BYTE),
    REDEEMED_CARTID        VARCHAR2(254 BYTE),
    PMT_METHOD             VARCHAR2(254 BYTE),
    PMT_INC_ACCT_CR        VARCHAR2(254 BYTE),
    PMT_INC_CAM_GIF_CD     VARCHAR2(254 BYTE),
    PMT_INC_WEB_PUR_GIF_CD VARCHAR2(254 BYTE),
    PMT_PROMO_MAT          VARCHAR2(254 BYTE),
    DT_PURCHASED           DATE,
    DT_REDEEMED            DATE
  )
  NOLOGGING;
DROP TABLE THREEB.DONATIONS CASCADE CONSTRAINTS;
CREATE TABLE THREEB.DONATIONS
  (
    DONATIONID               VARCHAR2(254 BYTE) CONSTRAINT DONATIONS_DONATIONID_PK PRIMARY KEY ,
    PROJECTID                VARCHAR2(254 BYTE),
    DONOR_ACCTID             VARCHAR2(254 BYTE),
    CARTID                   VARCHAR2(254 BYTE),
    DONOR_CITY               VARCHAR2(254 BYTE),
    DONOR_STATE              VARCHAR2(254 BYTE),
    DONOR_ZIP                VARCHAR2(254 BYTE),
    IS_TEACHER_ACCT          VARCHAR2(254 BYTE),
    DNTN_TIMESTAMP           VARCHAR2(254 BYTE),
    DNTN_TO_PROJECT          NUMBER(24,6),
    DNTN_OPTNL_SPRT          NUMBER(24,6),
    DNTN_TOTAL               NUMBER(24,6),
    DOLLAR_AMOUNT            VARCHAR2(254 BYTE),
    DNTN_INCL_OPTNL_SPRT     VARCHAR2(254 BYTE),
    PMT_METHOD               VARCHAR2(254 BYTE),
    PMT_INCL_ACCT_CREDIT     VARCHAR2(254 BYTE),
    PMT_INCL_CPGN_GIFT_CD    VARCHAR2(254 BYTE),
    PMT_INCL_WEB_PUR_GIFT_CD VARCHAR2(254 BYTE),
    PMT_WAS_PROMO_MATCHED    VARCHAR2(254 BYTE),
    VIA_GIVING_PAGE          VARCHAR2(254 BYTE),
    FOR_HONOREE              VARCHAR2(254 BYTE),
    THANK_YOU_PACKET_MAILED  VARCHAR2(254 BYTE),
    DNTN_MESSAGE             VARCHAR2(3000 BYTE),
    DNTN_DT                  DATE,
    DONOR_FULL_ZIP           VARCHAR2(254 BYTE)
  )
  NOLOGGING;
DROP TABLE THREEB.RESOURCES CASCADE CONSTRAINTS;
CREATE TABLE THREEB.RESOURCES
  (
    RESOURCEID      VARCHAR2(254 BYTE) CONSTRAINT RESOURCES_RESOURCEID_PK PRIMARY KEY ,
    PROJECTID       VARCHAR2(254 BYTE),
    VENDORID        VARCHAR2(254 BYTE),
    VENDOR_NAME     VARCHAR2(254 BYTE),
    ITEM_NAME       VARCHAR2(1000 BYTE),
    ITEM_NUMBER     VARCHAR2(400 BYTE),
    ITEM_UNIT_PRICE NUMBER(24,6),
    ITEM_QUANTITY   NUMBER(24,6)
  )
  NOLOGGING;
DROP TABLE THREEB.ESSAYS CASCADE CONSTRAINTS;
CREATE TABLE THREEB.ESSAYS
  (
    PROJECTID         VARCHAR2(254 BYTE) CONSTRAINT ESSAYS_PROJECTID_PK PRIMARY KEY ,
    TEACHERID         VARCHAR2(254 BYTE),
    TITLE             VARCHAR2(254 BYTE),
    SHORT_DESCRIPTION VARCHAR2(2000 BYTE),
    NEED_STATEMENT CLOB,
    ESSAY CLOB,
    THANKYOU_NOTE CLOB,
    IMPACT_LETTER CLOB
  )
  NOLOGGING;
CREATE INDEX PROJECTSTEACHER_ACCTID ON PROJECTS
  (TEACHER_ACCTID
  );
CREATE INDEX PROJECTSSCHOOLID ON PROJECTS
  (SCHOOLID
  );
CREATE INDEX PROJECTSSCHOOL_NCESID ON PROJECTS
  (SCHOOL_NCESID
  );
CREATE INDEX PROJECTSSCHOOL_LATITUDE ON PROJECTS
  (SCHOOL_LATITUDE
  );
CREATE INDEX PROJECTSSCHOOL_LONGITUDE ON PROJECTS
  (SCHOOL_LONGITUDE
  );
CREATE INDEX PROJECTSSCHOOL_CITY ON PROJECTS
  (SCHOOL_CITY
  );
CREATE INDEX PROJECTSSCHOOL_STATE ON PROJECTS
  (SCHOOL_STATE
  );
CREATE INDEX PROJECTSSCHOOL_ZIP ON PROJECTS
  (SCHOOL_ZIP
  );
CREATE INDEX PROJECTSSCHOOL_METRO ON PROJECTS
  (SCHOOL_METRO
  );
CREATE INDEX PROJECTSSCHOOL_DISTRICT ON PROJECTS
  (SCHOOL_DISTRICT
  );
CREATE INDEX PROJECTSSCHOOL_COUNTY ON PROJECTS
  (SCHOOL_COUNTY
  );
CREATE INDEX PROJECTSDT_POSTED ON PROJECTS
  (DT_POSTED
  );
CREATE INDEX PROJECTSDT_COMPLETED ON PROJECTS
  (DT_COMPLETED
  );
CREATE INDEX PROJECTSDT_THANK_PKT ON PROJECTS
  (DT_THANK_PKT
  );
CREATE INDEX PROJECTSDT_EXPIRATION ON PROJECTS
  (DT_EXPIRATION
  );
CREATE INDEX GIFTCARDSBUYER_CITY ON GIFTCARDS
  (BUYER_CITY
  );
CREATE INDEX GIFTCARDSBUYER_STATE ON GIFTCARDS
  (BUYER_STATE
  );
CREATE INDEX GIFTCARDSBUYER_ZIP ON GIFTCARDS
  (BUYER_ZIP
  );
CREATE INDEX GIFTCARDSDATE_PURCHASED ON GIFTCARDS
  (DATE_PURCHASED
  );
CREATE INDEX GIFTCARDSBUYER_CARTID ON GIFTCARDS
  (BUYER_CARTID
  );
CREATE INDEX GIFTCARDSRECIPIENT_ACCTID ON GIFTCARDS
  (RECIPIENT_ACCTID
  );
CREATE INDEX GIFTCARDSRECIPIENT_CITY ON GIFTCARDS
  (RECIPIENT_CITY
  );
CREATE INDEX GIFTCARDSRECIPIENT_STATE ON GIFTCARDS
  (RECIPIENT_STATE
  );
CREATE INDEX GIFTCARDSRECIPIENT_ZIP ON GIFTCARDS
  (RECIPIENT_ZIP
  );
CREATE INDEX DONATIONSDONOR_CITY ON DONATIONS
  (DONOR_CITY
  );
CREATE INDEX DONATIONSDONOR_STATE ON DONATIONS
  (DONOR_STATE
  );
CREATE INDEX DONATIONSDONOR_ZIP ON DONATIONS
  (DONOR_ZIP
  );
CREATE INDEX RESOURCESPROJECTID ON RESOURCES
  (PROJECTID
  );
CREATE INDEX RESOURCESVENDOR_NAME ON RESOURCES
  (VENDOR_NAME
  );
CREATE INDEX RESOURCESITEM_NAME ON RESOURCES
  (ITEM_NAME
  );
CREATE INDEX RESOURCESITEM_NUMBER ON RESOURCES
  (ITEM_NUMBER
  );
CREATE INDEX RESOURCESITEM_UNIT_PRICE ON RESOURCES
  (ITEM_UNIT_PRICE
  );
CREATE INDEX ESSAYSSHORT_DESCRIPTION ON ESSAYS
  (SHORT_DESCRIPTION
  );
CREATE INDEX ESSAYSNEED_STATEMENT ON ESSAYS
  (NEED_STATEMENT
  );
CREATE INDEX ESSAYSESSAY ON ESSAYS
  (ESSAY
  );
CREATE INDEX ESSAYSTHANKYOU_NOTE ON ESSAYS
  (THANKYOU_NOTE
  );
CREATE INDEX ESSAYSIMPACT_LETTER ON ESSAYS
  (IMPACT_LETTER
  );
