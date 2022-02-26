CREATE TABLE customer
(C_CUSTKEY int(11) NOT NULL, 
C_NAME varchar(25) NOT NULL, 
C_ADDRESS varchar(40) NOT NULL, 
C_NATIONKEY int(11) NOT NULL, 
C_PHONE char(15) NOT NULL, 
C_ACCTBAL decimal(15,2) NOT NULL, 
C_MKTSEGMENT char(10) NOT NULL, 
C_COMMENT varchar(117) NOT NULL,
PRIMARY KEY (C_CUSTKEY));

CREATE TABLE lineitem (
L_ORDERKEY int(11) NOT NULL,
L_PARTKEY INT(11) NOT NULL,
L_sUPPKEY INT(11) NOT NULL,
L_LINENUMBER INT(11) NOT NULL,
L_QUANTITY DECIMAL(15,2) NOT NULL,
L_EXTENDEDPRICE DECIMAL(15,2) NOT NULL,
L_DISCOUNT DECIMAL(15,2) NOT NULL,
L_TAX DECIMAL(15,2) NOT NULL,
L_RETURNFLAG CHAR(1) NOT NULL,
L_LINESTATUS CHAR(1) NOT NULL,
L_SHIPDATE DATE NOT NULL,
L_COMMITDATE DATE NOT NULL,
L_RECEIPTDATE DATE NOT NULL,
L_SHIPINSTRUCT CHAR(25) NOT NULL,
L_SHIPMODE CHAR(10) NOT NULL,
L_COMMENT VARCHAR(44) NOT NULL,
PRIMARY KEY (L_ORDERKEY, L_LINENUMBER));

create table nation (
N_NATIONKEY INT(11) NOT NULL,
N_NAME CHAR(25) NOT NULL,
N_REGIONKEY INT(11) NOT NULL,
N_COMMENT VARCHAR(152),
PRIMARY KEY (N_NATIONKEY));

create table orders (
O_ORDERKEY INT(11) NOT NULL,
O_CUSTKEY INT(11) NOT NULL,
O_ORDERSTATUS CHAR(1) NOT NULL,
O_TOTALPRICE DECIMAL(15,2) NOT NULL,
O_ORDERDATE DATE NOT NULL,
O_ORDERPRIORITY CHAR(15) NOT NULL,
O_CLERK CHAR(15) NOT NULL,
O_SHIPPRIORITY INT(11) NOT NULL,
O_COMMENT VARCHAR(79) NOT NULL,
PRIMARY KEY (O_ORDERKEY));

create table part (
P_PARTKEY INT(11) NOT NULL,
P_NAME VARCHAR(55) NOT NULL,
P_MFGR CHAR (25) NOT NULL,
P_BRAND CHAR(10) NOT NULL,
P_TYPE VARCHAR(25) NOT NULL,
P_SIZE INT(11) NOT NULL,
P_CONTAINER CHAR(10) NOT NULL,
P_RETAILPRICE DECIMAL(15,2) NOT NULL,
P_COMMENT VARCHAR(23) NOT NULL,
Primary Key (P_PARTKEY));

create table partsupp (
PS_PARTKEY INT(11) NOT NULL,
PS_SUPPKEY INT(11) NOT NULL,
PS_AVAILQTY INT(11) NOT NULL,
PS_SUPPLYCOST DECIMAL(15,2) NOT NULL,
PS_COMMENT VARCHAR(199) NOT NULL,
PRIMARY KEY (PS_PARTKEY, PS_SUPPKEY));

create table region (
R_REGIONKEY INT(11) NOT NULL,
R_NAME CHAR(25) NOT NULL,
R_COMMENT VARCHAR(152),
PRIMARY KEY (R_REGIONKEY));

create table supplier (
S_SUPPKEY INT(11) NOT NULL,
S_NAME CHAR(25) NOT NULL,
S_ADDRESS VARCHAR(40) NOT NULL,
S_NATIONKEY INT(11) NOT NULL,
S_PHONE CHAR(15) NOT NULL,
S_ACCTBAL DECIMAL(15,2) NOT NULL,
S_COMMENT VARCHAR(101) NOT NULL,
PRIMARY KEY (S_SUPPKEY));

ALTER TABLE supplier ADD FOREIGN KEY (S_NATIONKEY) REFERENCES nation (N_NATIONKEY);
ALTER TABLE partsupp ADD FOREIGN KEY (PS_PARTKEY) REFERENCES part (P_PARTKEY);
ALTER TABLE partsupp ADD FOREIGN KEY (PS_SUPPKEY) REFERENCES supplier (S_SUPPKEY);
ALTER TABLE customer ADD FOREIGN KEY (C_NATIONKEY) REFERENCES nation (N_NATIONKEY);
ALTER TABLE orders ADD FOREIGN KEY (O_CUSTKEY) REFERENCES customer (C_CUSTKEY);
ALTER TABLE lineitem ADD FOREIGN KEY (L_ORDERKEY) REFERENCES orders (O_ORDERKEY);
ALTER TABLE lineitem ADD FOREIGN KEY (L_PARTKEY) REFERENCES part (P_PARTKEY);
ALTER TABLE lineitem ADD FOREIGN KEY (L_SUPPKEY) REFERENCES supplier (S_SUPPKEY);
ALTER TABLE nation ADD FOREIGN KEY (N_REGIONKEY) REFERENCES region (R_REGIONKEY);


LOAD DATA LOCAL INFILE 'supplier.tbl' INTO TABLE supplier FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INFILE 'region.tbl' INTO TABLE region FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INFILE 'partsupp.tbl' INTO TABLE partsupp FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INFILE 'part.tbl' INTO TABLE part FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INFILE 'order.tbl' INTO TABLE orders FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INFILE 'nation.tbl' INTO TABLE nation FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INFILE 'lineitem.tbl' INTO TABLE lineitem FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INFILE 'customer.tbl' INTO TABLE customer FIELDS TERMINATED BY '|';