    CREATE TABLE CUSTOMER
    ( CUSTOMER_ID NUMBER,
    FIRST_NAME VARCHAR2(50),
    LAST_NAME VARCHAR2(50),
    MIDDLE_NAME VARCHAR2(50),
    ADDRESS_LINE1 VARCHAR2(80),
    ADDRESS_LINE2 VARCHAR2(80),
    CITY VARCHAR2(40),
    COUNTRY VARCHAR2(50),
    DATE_ADDED DATE,
    REGION VARCHAR2(10)
    );
    CREATE TABLE PRODUCT
    ( PRODUCT_ID NUMBER,
    PRODUCT_NAME VARCHAR2(100),
    STANDARD_COST NUMBER(10,2),
    COLOR VARCHAR2(20),
    LIST_PRICE NUMBER(10,2),
    PRODUCT_SIZE NUMBER(8,2),
    WEIGHT NUMBER(10,2),
    PRODUCT_CATEGORY VARCHAR2(20)
    );
    CREATE TABLE SALES
    ( SALES_DATE DATE,
    ORDER_ID NUMBER,
    PRODUCT_ID NUMBER,
    CUSTOMER_ID NUMBER(5,0),
    SALESPERSON_ID NUMBER(5,0),
    QUANTITY NUMBER(4,0),
    UNIT_PRICE NUMBER(10,2),
    SALES_AMOUNT NUMBER(10,2),
    TAX_AMOUNT NUMBER(10,2),
    TOTAL_AMOUNT NUMBER(10,2)
    );
    CREATE TABLE SALES_HISTORY
    ( SALES_DATE DATE,
    ORDER_ID NUMBER,
    PRODUCT_ID NUMBER,
    CUSTOMER_ID NUMBER(5,0),
    SALESPERSON_ID NUMBER(5,0),
    QUANTITY NUMBER(4,0),
    UNIT_PRICE NUMBER(10,2),
    SALES_AMOUNT NUMBER(10,2),
    TAX_AMOUNT NUMBER(10,2),
    TOTAL_AMOUNT NUMBER(10,2)
    );
    CREATE TABLE SALESPERSON
    ( SALESPERSON_ID NUMBER,
    JOB_TITLE VARCHAR2(80),
    FIRST_NAME VARCHAR2(50),
    LAST_NAME VARCHAR2(50),
    MIDDLE_NAME VARCHAR2(50),
    ADDRESS_LINE1 VARCHAR2(80),
    ADDRESS_LINE2 VARCHAR2(80),
    CITY VARCHAR2(40),
    COUNTRY VARCHAR2(50),
    DATE_ADDED DATE
    );
    Insert into CUSTOMER
    (CUSTOMER_ID,FIRST_NAME,LAST_NAME,MIDDLE_NAME,ADDRESS_LINE1,ADDRESS_LINE2,CITY,
    COUNTRY,DATE_ADDED,REGION) values
    (10,'JOHN','AMIRTHRAJ','T','2345 PETERDRIVE',null,'Atlanta','USA',
    to_date('12-JAN-15','DD-MON-YY'),'SOUTH');
    Insert into CUSTOMER
    (CUSTOMER_ID,FIRST_NAME,LAST_NAME,MIDDLE_NAME,ADDRESS_LINE1,ADDRESS_LINE2,CITY,
    COUNTRY,DATE_ADDED,REGION) values
    (11,'TOM','JOSEPH','A','123SANDY DRIVE',null,'New York','USA',
    to_date('12-JAN-15','DD-MON-YY'),'SOUTH');
    Insert into CUSTOMER
    (CUSTOMER_ID,FIRST_NAME,LAST_NAME,MIDDLE_NAME,ADDRESS_LINE1,ADDRESS_LINE2,CITY,
    COUNTRY,DATE_ADDED,REGION) values
    (12,'PETER','MANN','J','3456 GATES DRIVE',null,'Washington','USA',
    to_date('13-JAN-15','DD-MON-YY'),'NORTH');
    COMMIT;
    Insert into PRODUCT
    (PRODUCT_ID,PRODUCT_NAME,STANDARD_COST,COLOR,LIST_PRICE,PRODUCT_SIZE,WEIGHT,
    PRODUCT_CATEGORY)
    values (100,'Mobile Cover',30,null,35,10,100,'Mobile');
    Insert into PRODUCT
    (PRODUCT_ID,PRODUCT_NAME,STANDARD_COST,COLOR,LIST_PRICE,PRODUCT_SIZE,WEIGHT,
    PRODUCT_CATEGORY)
    values (200,'Samsung F7100',80,'BLACK',35,6,50,'Mobile');
    Insert into PRODUCT
    (PRODUCT_ID,PRODUCT_NAME,STANDARD_COST,COLOR,LIST_PRICE,PRODUCT_SIZE,WEIGHT,
    PRODUCT_CATEGORY)
    values (105,'HTC 7800',70,'BLACK',80,6,40,'Mobile');
    Insert into PRODUCT
    (PRODUCT_ID,PRODUCT_NAME,STANDARD_COST,COLOR,LIST_PRICE,PRODUCT_SIZE,WEIGHT,
    PRODUCT_CATEGORY)
    values (106,'Microsoft Keyboard 7865',50,'BLACK',60,3,20,'Computer');
    Insert into PRODUCT
    (PRODUCT_ID,PRODUCT_NAME,STANDARD_COST,COLOR,LIST_PRICE,PRODUCT_SIZE,WEIGHT,
    PRODUCT_CATEGORY)
    values (501,'Microsoft Mouse 7863',30,'GREY',40,1,25,'Computer');
    Insert into PRODUCT
    (PRODUCT_ID,PRODUCT_NAME,STANDARD_COST,COLOR,LIST_PRICE,PRODUCT_SIZE,WEIGHT,
    PRODUCT_CATEGORY)
    values (101,'iPhone',500,'GOLD',600,6,20,'Mobile');
    COMMIT;
    Insert into SALES
    (SALES_DATE,ORDER_ID,PRODUCT_ID,CUSTOMER_ID,SALESPERSON_ID,QUANTITY,UNIT_PRICE,
    SALES_AMOUNT,TAX_AMOUNT,TOTAL_AMOUNT)
    values (to_date('01-FEB-15','DD-MON-YY'),1269,200,12,1000,20,80,1600,160,1760);
    Insert into SALES
    (SALES_DATE,ORDER_ID,PRODUCT_ID,CUSTOMER_ID,SALESPERSON_ID,QUANTITY,UNIT_PRICE,
    SALES_AMOUNT,TAX_AMOUNT,TOTAL_AMOUNT)
    values (to_date('01-JAN-15','DD-MON-YY'),1267,100,10,1000,2,20,40,4,44);
    Insert into SALES
    (SALES_DATE,ORDER_ID,PRODUCT_ID,CUSTOMER_ID,SALESPERSON_ID,QUANTITY,UNIT_PRICE,
    SALES_AMOUNT,TAX_AMOUNT,TOTAL_AMOUNT)
    values (to_date('01-JAN-15','DD-MON-YY'),1267,101,10,1000,2,30,60,6,66);
    Insert into SALES
    (SALES_DATE,ORDER_ID,PRODUCT_ID,CUSTOMER_ID,SALESPERSON_ID,QUANTITY,UNIT_PRICE,
    SALES_AMOUNT,TAX_AMOUNT,TOTAL_AMOUNT)
    values (to_date('02-JAN-15','DD-MON-YY'),1268,100,11,2000,10,30,300,30,330);
    Insert into SALES
    (SALES_DATE,ORDER_ID,PRODUCT_ID,CUSTOMER_ID,SALESPERSON_ID,QUANTITY,UNIT_PRICE,
    SALES_AMOUNT,TAX_AMOUNT,TOTAL_AMOUNT)
    values (to_date('09-FEB-15','DD-MON-YY'),1270,105,10,3000,20,70,1400,140,1540);
    Insert into SALES
    (SALES_DATE,ORDER_ID,PRODUCT_ID,CUSTOMER_ID,SALESPERSON_ID,QUANTITY,UNIT_PRICE,
    SALES_AMOUNT,TAX_AMOUNT,TOTAL_AMOUNT)
    values (to_date('09-FEB-15','DD-MON-YY'),1270,106,10,3000,10,50,500,50,550);
    Insert into SALES
    (SALES_DATE,ORDER_ID,PRODUCT_ID,CUSTOMER_ID,SALESPERSON_ID,QUANTITY,UNIT_PRICE,
    SALES_AMOUNT,TAX_AMOUNT,TOTAL_AMOUNT)
    values (to_date('09-FEB-15','DD-MON-YY'),1270,101,10,3000,10,30,300,30,330);
    COMMIT;
    Insert into SALES_HISTORY
    (SALES_DATE,ORDER_ID,PRODUCT_ID,CUSTOMER_ID,SALESPERSON_ID,QUANTITY,UNIT_PRICE,
    SALES_AMOUNT,TAX_AMOUNT,TOTAL_AMOUNT)
    values (to_date('01-JAN-15','DD-MON-YY'),1267,100,10,1000,2,20,40,4,44);
    Insert into SALES_HISTORY
    (SALES_DATE,ORDER_ID,PRODUCT_ID,CUSTOMER_ID,SALESPERSON_ID,QUANTITY,UNIT_PRICE,
    SALES_AMOUNT,TAX_AMOUNT,TOTAL_AMOUNT)
    values (to_date('01-JAN-15','DD-MON-YY'),1267,101,10,1000,2,30,60,6,66);
    Insert into SALES_HISTORY
    (SALES_DATE,ORDER_ID,PRODUCT_ID,CUSTOMER_ID,SALESPERSON_ID,QUANTITY,UNIT_PRICE,
    SALES_AMOUNT,TAX_AMOUNT,TOTAL_AMOUNT)
    values (to_date('07-JAN-15','DD-MON-YY'),1268,100,11,2000,10,30,300,30,330);
    COMMIT;
    Insert into SALESPERSON
    (SALESPERSON_ID,JOB_TITLE,FIRST_NAME,LAST_NAME,MIDDLE_NAME,ADDRESS_LINE1,
    ADDRESS_LINE2,CITY,COUNTRY,DATE_ADDED)
    values (1000,'South Manager','PETER','MANN','R',
    '4567 ASHFORDROAD',null,'CUMMING','USA',to_date('12-JAN-14','DD-MON-YY'));
    Insert into SALESPERSON
    (SALESPERSON_ID,JOB_TITLE,FIRST_NAME,LAST_NAME,MIDDLE_NAME,ADDRESS_LINE1,
    ADDRESS_LINE2,CITY,COUNTRY,DATE_ADDED)
    values (2000,'North Manager','JOHN','KING','A','67 DUNWOODY ROAD',null,'LASVEGAS','USA',
    to_date('14-JAN-14','DD-MON-YY'));
    Insert into SALESPERSON
    (SALESPERSON_ID,JOB_TITLE,FIRST_NAME,LAST_NAME,MIDDLE_NAME,ADDRESS_LINE1,
    ADDRESS_LINE2,CITY,COUNTRY,DATE_ADDED)
    values (3000,'East Manager','BOB','MORIS','A','679 GLENDRIGEDR',null,'FLORIDA','USA',
    to_date('14-FEB-14','DD-MON-YY'));
    COMMIT;




--Introduction
DECLARE 

BEGIN

 dbms_output.put_line('Welcome to a fresh start on PL/SQL');
 
END;


--Variables and Commenting
DECLARE

    varnum1 number:= 1999;
    varnum2 number default 9991;
    varnum3 constant number:= 1000;
    varchar1 varchar(20) :='Gourab';
BEGIN

    --this is how we write a single line comment
    
    /*  this is how we write a multiline comment
        it is not considered a part of the code
    */

    varnum1 := 10;
        --varnum3 := 2000;
    dbms_output.put_line(varnum1);
    dbms_output.put_line(varnum2);
    dbms_output.put_line(varnum3);
    dbms_output.put_line(varchar1);
    
END;


--Global and Local variables
DECLARE 

    --global variable
    var4 number := 1234;

BEGIN

    dbms_output.put_line('A. parent -> parent variable : '|| var4);
    
        DECLARE
        
            --local variable
            var5 number := 5678;
            
        BEGIN
            
            dbms_output.put_line('1. parent -> child variable : ' ||var4);
            var4 := 1000;
            dbms_output.put_line('2. parent -> child variable : ' ||var4);
            dbms_output.put_line('child -> child variable : ' || var5);
            
        END;
    
            --dbms_output.put_line('child -> parent variable: '||var5);
            
            dbms_output.put_line('B. parent -> parent variable : '|| var4); 
            
            --the inner block can use and even change the parent variable
END;


--if then else
DECLARE

    marks number := 210;
    bonus number := 0;
    
BEGIN

    if
        marks <= 100
    then
        bonus := marks *.1;
    elsif
        marks > 100 and marks < 200
    then
        bonus := marks *.2;
    else
        bonus := marks *.5;
    end if;
    
    dbms_output.put_line('marks : '||marks);
    dbms_output.put_line('bonus :'||bonus);
    dbms_output.put_line('bonus+marks :'||(bonus+marks));

END;


--CASE WHEN
DECLARE

    marks number := 100;
    bonus number := 0;
    
BEGIN

    CASE
    WHEN
        marks <= 100
    then
        bonus := marks *.1;
    WHEN
        marks > 100 and marks < 200
    then
        bonus := marks *.2;
    else
        bonus := marks *.5;
    end CASE;
    
    dbms_output.put_line('marks : '||marks);
    dbms_output.put_line('bonus :'||bonus);
    dbms_output.put_line('bonus+marks :'||(bonus+marks));

END;


--WHILE LOOP
DECLARE

    temp1 number := 0;
    
BEGIN

    dbms_output.put_line('loop started with temp = '||temp1);
    WHILE temp1 <= 10
    LOOP
        dbms_output.put_line('temp = '||temp1);
        temp1 := temp1 + 1;
    END LOOP;
    
        dbms_output.put_line('loop ended with temp = '||temp1);

END;


--FOR LOOP
DECLARE

    temp2 number := 10;
    
BEGIN

    dbms_output.put_line('loop started with temp = '||temp2);
    
    FOR temp2 IN 10..20
    LOOP
        dbms_output.put_line('temp = '||temp2);
    END LOOP;
    
        dbms_output.put_line('loop ended with temp = '||temp2);

END;


--Reverse FOR LOOP
DECLARE

    temp3 number := 10;
    
BEGIN

    dbms_output.put_line('loop started with temp = '||temp3);
    
    FOR temp3 IN REVERSE 10..20
    LOOP
        dbms_output.put_line('temp = '||temp3);
    END LOOP;
    
        dbms_output.put_line('loop ended with temp = '||temp3);

END;
 


--Fetching data from a database   
DECLARE

    c_id number := 11;
    f_name varchar(20);
    cty varchar(50);
    
BEGIN

    SELECT first_name, city INTO f_name, cty
    FROM customer
    WHERE customer_id = c_id;
    
    dbms_output.put_line('First name : '||f_name);
    dbms_output.put_line('City : '||cty);

END;


--%TYPE 
DECLARE

    c_id customer.customer_id%type := 11;
    f_name customer.first_name%type;
    cty customer.city%type;
    
BEGIN

    SELECT first_name, city INTO f_name, cty
    FROM customer
    WHERE customer_id = c_id;
    
    dbms_output.put_line('First name : '||f_name);
    dbms_output.put_line('City : '||cty);

END;


--inserting data into database
DECLARE

    c_id        customer.customer_id%type := 13;
    c_fname     customer.first_name%type := 'SHERLOCK';
    c_lname     customer.last_name%type := 'HOLMES';
    c_mname     customer.middle_name%type := NULL;
    c_add1      customer.address_line1%type := '221B BAKER STREET';
    c_add2      customer.address_line2%type := 'LONDON NW1 6XE';
    c_city      customer.city%type := 'WESTMINSTER';
    c_country   customer.country%type := 'UK';
    c_date      customer.date_added%type := SYSDATE;
    c_region    customer.region%type := 'EAST';

BEGIN

    INSERT INTO customer(customer_id,first_name,last_name,middle_name,address_line1,address_line2,city,country,date_added,region)
    VALUES (c_id,c_fname,c_lname,c_mname,c_add1,c_add2,c_city,c_country,c_date,c_region);
    
    COMMIT;
    
    dbms_output.put_line('New record successfully added');

END;


--Procedures (IN)
CREATE OR REPLACE PROCEDURE ADD_CUSTOMER
(
    c_id        IN number,
    c_fname     IN varchar,
    c_lname     IN varchar,
    c_mname     IN varchar,
    c_add1      IN varchar,
    c_add2      IN varchar,
    c_city      IN varchar,
    c_country   IN varchar,
    c_date      IN date,
    c_region    IN varchar
)
AS
BEGIN

    INSERT INTO customer(customer_id,first_name,last_name,middle_name,address_line1,address_line2,city,country,date_added,region)
    VALUES (c_id,c_fname,c_lname,c_mname,c_add1,c_add2,c_city,c_country,c_date,c_region);
    
    COMMIT;
    
    dbms_output.put_line('New record successfully added');

END ADD_CUSTOMER;


--Calling a Procedure Method 1
BEGIN

    ADD_CUSTOMER(14,'LIONEL','MESSI','ANDRES','365 Bellamar STREET','CASTELLDEFELS','ROSARIO','SPAIN',SYSDATE,'SOUTH');

END;



--Calling a Procedure Method 2
BEGIN

    ADD_CUSTOMER
    (
        c_id       => 15,
        c_fname    => 'CHRISTIANO',
        c_lname    => 'AVIERO',
        c_mname    => 'RONALDO',
        c_add1     => '246 FUNCHAL STREET',
        c_add2     => NULL,
        c_city     => 'MADEIRA',
        c_country  => 'PORTUGAL',
        c_date     => SYSDATE,
        c_region   => 'WEST'
    );
    
END;


--Procedures (OUT)
CREATE OR REPLACE PROCEDURE ADD_CUSTOMER
(
    c_id        IN number,
    c_fname     IN varchar,
    c_lname     IN varchar,
    c_mname     IN varchar,
    c_add1      IN varchar,
    c_add2      IN varchar,
    c_city      IN varchar,
    c_country   IN varchar,
    c_date      IN date,
    c_region    IN varchar,
    total_count OUT number
)
AS
BEGIN

    INSERT INTO customer(customer_id,first_name,last_name,middle_name,address_line1,address_line2,city,country,date_added,region)
    VALUES (c_id,c_fname,c_lname,c_mname,c_add1,c_add2,c_city,c_country,c_date,c_region);
    
    COMMIT;
    
    dbms_output.put_line('New record successfully added');
    
    SELECT COUNT(customer_id) INTO total_count FROM customer;

END ADD_CUSTOMER;


--Calling a Procedure Method 1a
DECLARE

    tcount number(10);

BEGIN

    ADD_CUSTOMER(16,'ADOLF','HITLER',NULL,'472 ANDUL LANE',NULL,'BRAUNAU','AUSTRIA',SYSDATE,'NORTH',tcount);
    dbms_output.put_line('Total records in the table : '||tcount);

END;


--Procedures (IN OUT)


--Functions
CREATE OR REPLACE FUNCTION  find_salescount
(
    p_sales_date IN date
) RETURN number

AS
    num_of_sales number := 0;
    
BEGIN

    SELECT COUNT(*) INTO num_of_sales FROM sales
    WHERE sales_date = p_sales_date;
    
    RETURN num_of_sales;

END find_salescount;


--Calling a function Method 1
SELECT find_salescount(to_date('01-feb-2015','dd-mon-yyyy')) from dual


--Calling a function Method 2
DECLARE

    scount number := 0;

BEGIN

    scount := find_salescount(to_date('01-feb-2015','dd-mon-yyyy'));
    dbms_output.put_line('Total sales count : '||scount);
    
END;

