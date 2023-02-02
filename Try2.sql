--Creating Employee table
CREATE TABLE Employee
(
    id INT,
    details VARCHAR(100)
);

drop table  Employee;


--Inserting values into Employee table
INSERT INTO Employee
VALUES
(
    100000,'1001,Payal,Hake,Mumbai,India'
);
INSERT INTO Employee
VALUES
(
    200000,'1002,Yashu,Sahu,Bhilai,India'
);
INSERT INTO Employee
VALUES
(
    300000,'1003,Uddesh,Dharmik,Pune,India'
);

SELECT * FROM Employee;



--Creating Modified Employee Table
CREATE TABLE m_emp
(
    id INT,
    s_no INT PRIMARY KEY,
    Name VARCHAR(50)
);


--Inserting values into Modified Employee Table
INSERT INTO m_emp(id,s_no,Name)
SELECT e.id,REGEXP_SUBSTR(e.details,'[^,]+',1,1),REGEXP_SUBSTR(e.details,'[^,]+',1,2)||' '||REGEXP_SUBSTR(e.details,'[^,]+',1,3)
FROM employee e;

SELECT * FROM m_emp;


--Creating table salary 
CREATE TABLE Salary
(
    s_no INT PRIMARY KEY REFERENCES m_emp(s_no),
    salary INT
);

drop table salary;

desc salary;


--Inserting data into table salary
INSERT INTO Salary
VALUES
(
    1001,2000
);
INSERT INTO Salary
VALUES
(
    1002,2500
);
INSERT INTO Salary
VALUES
(
    1003,3000
);

SELECT * FROM SALARY;

--Creating table department
CREATE TABLE Department
(
    s_no INT REFERENCES salary(s_no),
    department VARCHAR(50)
);

drop table department;

desc department;


--Inserting data into table department
INSERT INTO Department
VALUES
(
    1001,'IT'
);
INSERT INTO Department
VALUES
(
    1001,'AIA'
);
INSERT INTO Department
VALUES
(
    1001,'Data'
);

select * from department;


SELECT REGEXP_SUBSTR(details,'[^,]+',1,1) AS s_no FROM Employee;
SELECT REGEXP_SUBSTR(details,'[^,]+',1,2) AS f_name FROM Employee;
SELECT REGEXP_SUBSTR(details,'[^,]+',1,3) AS l_name FROM Employee;

SELECT details,regexp_replace(details,',',' ') FROM Employee;


--Incorrect Total
SELECT REGEXP_SUBSTR(e.details,'[^,]+',1,1) AS s_no,
REGEXP_SUBSTR(e.details,'[^,]+',1,2)||' '||REGEXP_SUBSTR(e.details,'[^,]+',1,3) AS Name,
LISTAGG(d.department,',') WITHIN GROUP (ORDER BY d.department) OVER (PARTITION BY d.s_no) AS Department 
,s.salary FROM 
Employee e,
Salary s,
Department d;

--Partial
SELECT e.id,REGEXP_SUBSTR(e.details,'[^,]+',1,1) AS s_no,
REGEXP_SUBSTR(e.details,'[^,]+',1,2)||' '||REGEXP_SUBSTR(e.details,'[^,]+',1,3) AS Name,s.s_no AS salary_no,
s.salary FROM 
Employee e ,
Salary s;


--Testing ListAgg
SELECT d.s_no,d.department,LISTAGG(d.department,',') WITHIN GROUP (ORDER BY d.s_no) OVER (PARTITION BY d.s_no) AS new_Department 
FROM department d;


--New approach Final

SELECT * FROM Employee;

SELECT * FROM SALARY;

SELECT * FROM DEPARTMENT;

SELECT * FROM m_emp;


SELECT DISTINCT m.id AS id,m.name AS Name, 
LISTAGG(d.department,',') WITHIN GROUP (ORDER BY d.s_no) OVER (PARTITION BY d.s_no) AS Department,
s.salary AS SALARY
FROM m_emp m
JOIN salary s ON m.s_no = s.s_no
JOIN department d ON s.s_no = d.s_no;




--============================================================================--



--Creating table Yashu
CREATE TABLE YASHU
(
    id int,
    details varchar(100)
);

--Inserting values into Yashu table
INSERT INTO Yashu
VALUES
(
    100000,'1001,Yashu,Sahu,Bhilai,India'
);
INSERT INTO Yashu
VALUES
(
    200000,'1002,Yashu,Sahu,Bhilai,India,Sahul'
);
INSERT INTO Yashu
VALUES
(
    300000,'1003,Yashu,Sahu,Bhilai,India,sahul'
);
INSERT INTO Yashu
VALUES
(
    400000,'1004,Yashu,Sahu,Bhilai,India,Sahur'
);
INSERT INTO Yashu
VALUES
(
    500000,'1005,Yashu,Sahu,Bhilai,India,sahur'
);
INSERT INTO Yashu
VALUES
(
    600000,'1006,Yashu,Sahu,Bhilai,Sahui,India'
);
INSERT INTO Yashu
VALUES
(
    700000,'1007,Yashu,Sahu,Bhilai,sahui,India'
);
INSERT INTO Yashu
VALUES
(
    800000,'1008,Yashu,Sahu,Bhilai,Sahu,India'
);
INSERT INTO Yashu
VALUES
(
    900000,'1009,Yashu,Sahu,Bhilai,India,Sahu'
);

SELECT * FROM YASHU;


--Replacing all the strings keeping Case sensitivity (using replace)
SELECT id, REPLACE(DETAILS,'Sahu','Sahoo')AS new_details FROM YASHU;

--Replacing all the strings keeping Case sensitivity (using REGEXP_REPLACE)
SELECT id, REGEXP_REPLACE(DETAILS,'Sahu','Sahoo')AS new_details FROM YASHU;

--Replacing the strings based on its position
SELECT id, REGEXP_REPLACE(DETAILS,'Sahu','Sahoo',1,1)AS new_details FROM YASHU;

--Replacing all the strings ignoring Case sensitivity (using REGEXP_REPLACE)
SELECT id, REGEXP_REPLACE(DETAILS,'Sahu','Sahoo',1,0,'i')AS new_details FROM YASHU;


--============================================================================--


--Creating Customer table
CREATE TABLE Customer
(
    id int,
    name varchar(50),
    salary int,
    instrument varchar(50)
);

SELECT * FROM customer;

drop table customer;


--Inserting values into customer
INSERT INTO Customer
VALUES
(
    1,'Dan Reynolds',96000,'Piano'
);
INSERT INTO Customer
VALUES
(
    2,'Daniel Platzman',92000,'Acoustic Drum Kit'
);
INSERT INTO Customer
VALUES
(
    3,'Daniel Wayne Sermon',93000,'Electric Gituar'
);
INSERT INTO Customer
VALUES
(
    4,'Ben McKee',89000,'Bass Gituar'
);
INSERT INTO Customer
VALUES
(
    5,'Andrew Beck',82000,'Support Gituar'
);
INSERT INTO Customer
VALUES
(
    6,'Daniivory',86000,'Piano'
);
INSERT INTO Customer
VALUES
(
    7,'Andrew Tolman',85000,'Acoustic Drum Kit'
);
INSERT INTO Customer
VALUES
(
    8,'Brittany Tolman',81000,'Piano'
);
INSERT INTO Customer
VALUES
(
    9,'Aurora Florence',83000,'Piano'
);
INSERT INTO Customer
VALUES
(
    10,'Dave Lemke',81000,'Bass Gituar'
);


--Creating changes table
CREATE TABLE Changes
(
    conn_id varchar(50),
    Cust_id int,
    Date_time varchar(50),
    Operation varchar(10),
    old_salary varchar(50),
    new_salary varchar(50)
);

SELECT * FROM changes;

TRUNCATE TABLE changes;

DROP TABLE changes;



--System DATE, TIME & TIMESTAMP
SELECT TO_CHAR(SYSDATE, 'DD-MON-YYYY HH12:MI:SSAM')FROM dual;



--Timestamp functions
BEGIN
dbms_output.put_line(current_timestamp());
dbms_output.put_line(systimestamp());
dbms_output.put_line(localtimestamp());
END;




--Creating Trigger (trial)
CREATE OR REPLACE TRIGGER change1
AFTER UPDATE OR INSERT OR DELETE ON customer FOR EACH ROW
BEGIN
INSERT INTO changes
VALUES
(
    'Connection', :new.id, TO_CHAR(SYSDATE,'DD-MON-YYYY HH:MI:SS'), 'Operation', :old.salary, :new.salary
);
END;

SELECT * FROM changes;

SELECT * FROM customer;

UPDATE customer set salary = 87000
WHERE id = 4;




--Creating Trigger2
CREATE OR REPLACE TRIGGER customer_changes
BEFORE INSERT OR UPDATE OR DELETE ON customer
FOR EACH ROW
ENABLE
DECLARE
    cng_user varchar(50);
    cng_date varchar(50);
BEGIN
    
    SELECT user, TO_CHAR(SYSDATE,'DD-MON-YYYY HH12:MI:SSAM') INTO cng_user, cng_date FROM dual;

    IF INSERTING THEN
        INSERT INTO changes(conn_id,cust_id,date_time,operation,old_salary,new_salary)
        VALUES
        (
            cng_user,:new.id,cng_date,'Insert',NULL,:new.salary
        );
    ELSIF DELETING THEN
        INSERT INTO changes(conn_id,cust_id,date_time,operation,old_salary,new_salary)
        VALUES
        (
            cng_user,:old.id,cng_date,'Delete',:old.salary,NULL
        );
    ELSIF UPDATING THEN
        INSERT INTO changes(conn_id,cust_id,date_time,operation,old_salary,new_salary)
        VALUES
        (
            cng_user,:new.id,cng_date,'Update',:old.salary,:new.salary
        );
    END IF;
END;


SELECT * FROM customer;

SELECT * FROM changes;


--Test Update, Insert and Delete
UPDATE customer 
set salary = 93000
WHERE id = 4;

INSERT INTO customer
VALUES
(
    12,'Ryan Reynolds',98000,'Flute'
);

DELETE FROM customer
WHERE id = 12;


--============================================================================--


--Creating sequence serial_seq
CREATE SEQUENCE serial_seq
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1
    CACHE 20;


--Creating table Student
CREATE TABLE Student
(
    sl_no INT,
    roll_no INT PRIMARY KEY,
    f_name VARCHAR(20) NOT NULL,
    m_name VARCHAR(20),
    l_name VARCHAR(20),
    stu_class INT NOT NULL,
    stu_sec VARCHAR(20) NOT NULL,
    marks_1 INT,
    marks_2 INT,
    marks_3 INT,
    marks_4 INT,
    marks_5 INT,
    grade VARCHAR(10)
);


--Putting Constraint on Grade
ALTER TABLE Student ADD CONSTRAINT grade_check check(grade IN('A','B','C','D','E'));


desc student;


--Creating Trigger trigger_serial
CREATE OR REPLACE TRIGGER trigger_serial BEFORE INSERT ON student
FOR EACH ROW
BEGIN 
    SELECT serial_seq.NEXTVAL INTO :new.sl_no FROM dual;
END;



--Creating Trigger Grade_constraint
CREATE OR REPLACE TRIGGER grade_constraint 
BEFORE INSERT ON student
FOR EACH ROW
BEGIN 
    IF :new.grade NOT IN ('A','B','C','D','E')
        THEN
            dbms_output.put_line('Grade can not be anything other than A, B, C, D or E');
    END  IF;
END;


--Inserting data into table Student
Insert INTO student (roll_no,f_name,m_name,l_name,stu_class,stu_sec,marks_1,marks_2,marks_3,marks_4,marks_5,grade)
VALUES
(
    10,'Leonardo','Da','Vinci',5,'B',46,78,59,92,74,'C'
);
Insert INTO student (roll_no,f_name,m_name,l_name,stu_class,stu_sec,marks_1,marks_2,marks_3,marks_4,marks_5,grade)
VALUES
(
    11,'Vincent','Van','Gogh',5,'B',86,63,79,86,81,'B'
);
Insert INTO student (roll_no,f_name,m_name,l_name,stu_class,stu_sec,marks_1,marks_2,marks_3,marks_4,marks_5,grade)
VALUES
(
    12,'Pablo',NULL,'Picasso',5,'B',56,72,48,81,66,'D'
);
Insert INTO student (roll_no,f_name,m_name,l_name,stu_class,stu_sec,marks_1,marks_2,marks_3,marks_4,marks_5,grade)
VALUES
(
    13,'Michelangelo',NULL,NULL,5,'B',88,83,78,97,88,'A'
);
Insert INTO student (roll_no,f_name,m_name,l_name,stu_class,stu_sec,marks_1,marks_2,marks_3,marks_4,marks_5,grade)
VALUES
(
    14,'Frida',NULL,'Kahlo',5,'B',82,86,78,94,89,'A'
);
Insert INTO student (roll_no,f_name,m_name,l_name,stu_class,stu_sec,marks_1,marks_2,marks_3,marks_4,marks_5,grade)
VALUES
(
    15,'Salvador',NULL,'Dali',5,'B',63,61,92,98,56,'B'
);

SELECT * FROM student;

TRUNCATE TABLE student;


--Creating Audit table
CREATE TABLE Stu_changes
(
    conn_id varchar(50),
    Operation varchar(10),
    Col_affected varchar(50),
    old_values varchar(50),
    new_values varchar(50),
    Date_time varchar(50)
);

SELECT * FROM stu_changes;


--Creating Trigger Trial 1
CREATE OR REPLACE TRIGGER student_changes
BEFORE INSERT OR UPDATE OR DELETE ON student
FOR EACH ROW
ENABLE
DECLARE
    change_user varchar(50);
    change_date varchar(50);
BEGIN
    
    SELECT user, TO_CHAR(SYSDATE,'DD-MON-YYYY HH12:MI:SSAM') INTO change_user, change_date FROM dual;

    IF INSERTING THEN
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Insert','All',NULL,:new.f_name||' '||:new.l_name,change_date
        );
    ELSIF DELETING THEN
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Delete','All',:old.f_name||' '||:old.l_name,NULL,change_date
        );
    /*END IF;
    IF UPDATING(sl_no) THEN
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Update','Sl_no',:old.sl_no,:new.sl_no,change_date
        );
    ELSIF UPDATING(roll_no) THEN
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Update','Roll_no',:old.roll_no,:new.roll_no,change_date
        );
    ELSIF UPDATING(f_name) THEN
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Update','F_name',:old.f_name,:new.f_name,change_date
        );
    ELSIF UPDATING(l_name) THEN
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Update','L_name',:old.l_name,:new.l_name,change_date
        );
    ELSIF UPDATING(m_name) THEN
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Update','M_name',:old.m_name,:new.m_name,change_date
        );
    ELSIF UPDATING(stu_class) THEN
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Update','Stu_class',:old.stu_class,:new.stu_class,change_date
        );
    ELSIF UPDATING(stu_sec) THEN
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Update','Stu_sec',:old.stu_sec,:new.stu_sec,change_date
        );
    ELSIF UPDATING(grade) THEN
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Update','Grade',:old.grade,:new.grade,change_date
        );
    ELSIF UPDATING(marks_1) THEN
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Update','Marks_1',:old.marks_1,:new.marks_1,change_date
        );
    ELSIF UPDATING(marks_2) THEN
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Update','Marks_2',:old.marks_2,:new.marks_2,change_date
        );
    ELSIF UPDATING(marks_3) THEN
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Update','Marks_3',:old.marks_3,:new.marks_3,change_date
        );
    ELSIF UPDATING(marks_4) THEN
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Update','Marks_4',:old.marks_4,:new.marks_4,change_date
        );
    ELSIF UPDATING(marks_5) THEN
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Update','Marks_5',:old.marks_5,:new.marks_5,change_date
        );*/
    ELSIF UPDATING THEN
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Update','Marks_5',:old.f_name,:new.f_name,change_date
        );
    END IF;
END;


--Creating Trigger Trial 2
CREATE OR REPLACE TRIGGER student_changes
BEFORE INSERT OR UPDATE OR DELETE ON student
FOR EACH ROW
ENABLE
DECLARE
    change_user varchar(50);
    change_date varchar(50);
BEGIN
    
    SELECT user, TO_CHAR(SYSDATE,'DD-MON-YYYY HH12:MI:SSAM') INTO change_user, change_date FROM dual;

    IF INSERTING THEN
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Insert','All',NULL,:new.f_name||' '||:new.l_name,change_date
        );
    ELSIF DELETING THEN
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Delete','All',:old.f_name||' '||:old.l_name,NULL,change_date
        );
    ELSIF UPDATING 
            THEN
            IF :new.sl_no != :old.sl_no
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','Sl_no',:old.sl_no,:new.sl_no,change_date
                    );
            END IF;
            IF :new.roll_no != :old.roll_no
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','Roll_no',:old.roll_no,:new.roll_no,change_date
                    );
            END IF;
            IF :new.f_name != :old.f_name
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','F_name',:old.f_name,:new.f_name,change_date
                    );
            END IF;
            IF :new.l_name != :old.l_name
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','L_name',:old.l_name,:new.l_name,change_date
                    );
            ELSIF :old.l_name IS NULL AND :new.l_name IS NOT NULL
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','L_name',NULL,:new.l_name,change_date
                    );
            END IF;
            IF :new.m_name != :old.m_name
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','M_name',:old.m_name,:new.m_name,change_date
                    );
            ELSIF :old.m_name IS NULL AND :new.m_name IS NOT NULL
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','M_name',NULL,:new.m_name,change_date
                    );
            END IF;
            IF :new.stu_class != :old.stu_class
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','Stu_class',:old.stu_class,:new.stu_class,change_date
                    );
            END IF;
            IF :new.stu_sec != :old.stu_sec
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','Stu_sec',:old.stu_sec,:new.stu_sec,change_date
                    );
            END IF;
            IF :new.grade != :old.grade
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','Grade',:old.grade,:new.grade,change_date
                    );
            END IF;
            IF :new.marks_1 != :old.marks_1
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','Marks_1',:old.marks_1,:new.marks_1,change_date
                    );
            END IF;
            IF :new.marks_2 != :old.marks_2
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','Marks_2',:old.marks_2,:new.marks_2,change_date
                    );
            END IF;
            IF :new.marks_3 != :old.marks_3
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','Marks_3',:old.marks_3,:new.marks_3,change_date
                    );
            END IF;
            IF :new.marks_4 != :old.marks_4
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','Marks_4',:old.marks_4,:new.marks_4,change_date
                    );
            END IF;
            IF :new.marks_5 != :old.marks_5
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','Marks_5',:old.marks_5,:new.marks_5,change_date
                    );
            END IF;
        /*ELSIF UPDATING THEN
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Update','Marks_5',:old.f_name,:new.f_name,change_date
        );*/
    END IF;
END;


--Creating trigger Trial 3(describe insert)
CREATE OR REPLACE TRIGGER student_changes
AFTER INSERT OR UPDATE OR DELETE ON student
FOR EACH ROW
ENABLE
DECLARE
    change_user varchar(50);
    change_date varchar(50);
BEGIN
    
    SELECT user, TO_CHAR(SYSDATE,'DD-MON-YYYY HH12:MI:SSAM') INTO change_user, change_date FROM dual;

    IF INSERTING THEN
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Insert','Sl_no',NULL,:new.sl_no,change_date
        );
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Insert','Roll_no',NULL,:new.roll_no,change_date
        );
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Insert','F_name',NULL,:new.f_name,change_date
        );
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Insert','M_name',NULL,:new.m_name,change_date
        );
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Insert','L_name',NULL,:new.l_name,change_date
        );
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Insert','Stu_class',NULL,:new.stu_class,change_date
        );
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Insert','Stu_sec',NULL,:new.stu_sec,change_date
        );
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Insert','Marks_1',NULL,:new.marks_1,change_date
        );
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Insert','Marks_2',NULL,:new.marks_2,change_date
        );
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Insert','Marks_3',NULL,:new.marks_3,change_date
        );
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Insert','Marks_4',NULL,:new.marks_4,change_date
        );
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Insert','Marks_5',NULL,:new.marks_5,change_date
        );
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Insert','Grade',NULL,:new.grade,change_date
        );
    ELSIF DELETING THEN
        INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
        VALUES
        (
            change_user,'Delete','All',:old.f_name||' '||:old.l_name,NULL,change_date
        );
    ELSIF UPDATING 
            THEN
            IF :new.sl_no != :old.sl_no
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','Sl_no',:old.sl_no,:new.sl_no,change_date
                    );
            END IF;
            IF :new.roll_no != :old.roll_no
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','Roll_no',:old.roll_no,:new.roll_no,change_date
                    );
            END IF;
            IF :new.f_name != :old.f_name
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','F_name',:old.f_name,:new.f_name,change_date
                    );
            END IF;
            IF :new.m_name != :old.m_name
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','M_name',:old.m_name,:new.m_name,change_date
                    );
            ELSIF :old.m_name IS NULL AND :new.m_name IS NOT NULL
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','M_name',NULL,:new.m_name,change_date
                    );
            END IF;
            IF :new.l_name != :old.l_name
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','L_name',:old.l_name,:new.l_name,change_date
                    );
            ELSIF :old.l_name IS NULL AND :new.l_name IS NOT NULL
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','L_name',NULL,:new.l_name,change_date
                    );
            END IF;
            IF :new.stu_class != :old.stu_class
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','Stu_class',:old.stu_class,:new.stu_class,change_date
                    );
            END IF;
            IF :new.stu_sec != :old.stu_sec
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','Stu_sec',:old.stu_sec,:new.stu_sec,change_date
                    );
            END IF;
            IF :new.grade != :old.grade
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','Grade',:old.grade,:new.grade,change_date
                    );
            END IF;
            IF :new.marks_1 != :old.marks_1
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','Marks_1',:old.marks_1,:new.marks_1,change_date
                    );
            END IF;
            IF :new.marks_2 != :old.marks_2
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','Marks_2',:old.marks_2,:new.marks_2,change_date
                    );
            END IF;
            IF :new.marks_3 != :old.marks_3
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','Marks_3',:old.marks_3,:new.marks_3,change_date
                    );
            END IF;
            IF :new.marks_4 != :old.marks_4
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','Marks_4',:old.marks_4,:new.marks_4,change_date
                    );
            END IF;
            IF :new.marks_5 != :old.marks_5
                THEN
                    INSERT INTO stu_changes(conn_id,Operation,col_affected,old_values,new_values,Date_time)
                    VALUES
                    (
                        change_user,'Update','Marks_5',:old.marks_5,:new.marks_5,change_date
                    );
            END IF;
    END IF;
END;


--Testing 
Insert INTO student (roll_no,f_name,m_name,l_name,stu_class,stu_sec,marks_1,marks_2,marks_3,marks_4,marks_5,grade)
VALUES
(
    20,'Gourab',NULL,'Bhattacharjee',5,'B',46,78,59,92,74,'C'
);

DELETE FROM Student
WHERE Roll_no = 20;

Insert INTO student (roll_no,f_name,m_name,l_name,stu_class,stu_sec,marks_1,marks_2,marks_3,marks_4,marks_5,grade)
VALUES
(
    25,'Gourab',NULL,'Bhattacharjee',5,'B',46,78,59,92,74,'F'
);

Insert INTO student (roll_no,f_name,m_name,l_name,stu_class,stu_sec,marks_1,marks_2,marks_3,marks_4,marks_5,grade)
VALUES
(
    25,'Gourab',NULL,'Bhattacharjee',5,'B',46,78,59,92,74,'D'
);

UPDATE student 
SET  m_name = 'Aryan',
    stu_class = 8,
    sl_no = 10,
    f_name = 'Kourav',
    l_name = 'Singha'
WHERE Roll_no = 25;

SELECT * FROM student;
SELECT * FROM Stu_changes;


--============================================================================--


--Creating Musician table
CREATE TABLE Musician
(
    name varchar(50),
    salary int,
    instrument varchar(50),
    State varchar(20)
);


--Creating table states
CREATE TABLE states
(
    abb_state varchar(20),
    state_name varchar(50)
);


SELECT * FROM musician;
SELECT * FROM states;


--Inserting values into Musician
INSERT INTO Musician
VALUES
(
    'Dan Reynolds',96000,'Piano','WB'
);
INSERT INTO Musician
VALUES
(
    'Daniel Platzman',92000,'Acoustic Drum Kit','HP'
);
INSERT INTO Musician
VALUES
(
    'Daniel Wayne Sermon',93000,'Electric Gituar','ML'
);
INSERT INTO Musician
VALUES
(
    'Ben McKee',89000,'Bass Gituar','PB'
);
INSERT INTO Musician
VALUES
(
    'Andrew Beck',82000,'Support Gituar','RJ'
);
INSERT INTO Musician
VALUES
(
    'Daniivory',86000,'Piano','MP'
);
INSERT INTO Musician
VALUES
(
    'Andrew Tolman',85000,'Acoustic Drum Kit','KA'
);
INSERT INTO Musician
VALUES
(
    'Brittany Tolman',81000,'Piano','GJ'
);
INSERT INTO Musician
VALUES
(
    'Aurora Florence',83000,'Piano','HR'
);
INSERT INTO Musician
VALUES
(
    'Dave Lemke',81000,'Bass Gituar','GA'
);


--Inserting values into states
INSERT INTO states
VALUES 
(
    'AP', 'Andhra Pradesh'
);
INSERT INTO states
VALUES 
(
    'AR', 'Arunachal Pradesh'
);
INSERT INTO states
VALUES 
(
    'AS', 'Assam'
);
INSERT INTO states
VALUES 
(
    'BR', 'Bihar'
);
INSERT INTO states
VALUES 
(
    'CG', 'Chattisgarh'
);
INSERT INTO states
VALUES 
(
    'GA', 'Goa'
);
INSERT INTO states
VALUES 
(
    'GJ', 'Gujarat'
);
INSERT INTO states
VALUES 
(
    'HP', 'Himachal Pradesh'
);
INSERT INTO states
VALUES 
(
    'HR', 'Haryana'
);
INSERT INTO states
VALUES 
(
    'JH', 'Jharkhand'
);
INSERT INTO states
VALUES 
(
    'KA', 'Karnataka'
);
INSERT INTO states
VALUES 
(
    'KL', 'Kerala'
);
INSERT INTO states
VALUES 
(
    'MH', 'Maharashtra'
);
INSERT INTO states
VALUES 
(
    'ML', 'Meghalaya'
);
INSERT INTO states
VALUES 
(
    'MN', 'Manipur'
);
INSERT INTO states
VALUES 
(
    'MP', 'Madhya Pradesh'
);
INSERT INTO states
VALUES 
(
    'MZ', 'Mizoram'
);
INSERT INTO states
VALUES 
(
    'NL', 'Nagaland'
);
INSERT INTO states
VALUES 
(
    'OD', 'Odisha'
);
INSERT INTO states
VALUES 
(
    'PB', 'Punjab'
);
INSERT INTO states
VALUES 
(
    'RJ', 'Rajasthan'
);
INSERT INTO states
VALUES 
(
    'SK', 'Sikkim'
);
INSERT INTO states
VALUES 
(
    'TN', 'Tamil Nadu'
);
INSERT INTO states
VALUES 
(
    'TR', 'Tripura'
);
INSERT INTO states
VALUES 
(
    'TS', 'Telangana'
);
INSERT INTO states
VALUES 
(
    'UK', 'Uttarakhand'
);
INSERT INTO states
VALUES 
(
    'UP', 'Uttar Pradesh'
);
INSERT INTO states
VALUES 
(
    'WB', 'West Bengal'
);


--Declaring and using Cursor with variables (Trial 1 - Using 1 cursor)(partial)
DECLARE

    m_name musician.name%type;
    m_salary musician.salary%type;
    m_instrument musician.instrument%type;
    m_state musician.state%type;
    s_abb states.abb_state%type;
    s_state states.state_name%type;
    
    CURSOR Csr_1 IS
        SELECT m.name,m.salary,m.instrument,m.state,s.abb_state,s.state_name
            FROM musician m, states s;

BEGIN

    OPEN Csr_1;
        LOOP
            FETCH Csr_1 
                INTO m_name, m_salary, m_instrument, m_state, s_abb, s_state;
            EXIT WHEN Csr_1%NOTFOUND;
            
            dbms_output.put_line('m_name: '||m_name||chr(10)||'m_salary: '||m_salary||chr(10)||'m_instrument: '||m_instrument||chr(10)||'m_state: '||m_state||chr(10)||'s_abb: '||s_abb||chr(10)||'s_state: '||s_state);
        END LOOP;
    CLOSE Csr_1;
END;


--Declaring and using Cursor with variables (Trial 2 - Using 2 cursors)
DECLARE

    m_name musician.name%type;
    m_salary musician.salary%type;
    m_instrument musician.instrument%type;
    m_state musician.state%type;
    s_abb states.abb_state%type;
    s_state states.state_name%type;
    
    CURSOR Csr_1 IS
        SELECT name,salary,instrument,state
            FROM musician;
    CURSOR Csr_2 IS
        SELECT abb_state, state_name
            FROM states;

BEGIN

    OPEN Csr_1;
        LOOP
            FETCH Csr_1 
                INTO m_name, m_salary, m_instrument, m_state;
            EXIT WHEN Csr_1%NOTFOUND;
            
                OPEN Csr_2;
                    LOOP
                        FETCH Csr_2
                            INTO s_abb, s_state;
                        EXIT WHEN s_abb LIKE m_state;
                    END LOOP; 
                CLOSE Csr_2;
                
            dbms_output.put_line(chr(10)||'  Name: '||m_name||chr(10)||'  Salary: '||m_salary||chr(10)||'  Instrument: '||m_instrument||chr(10)||'  State: '||s_state||chr(10)||chr(10)||'---------------------------------------------');   --||'s_abb: '||s_abb||chr(10)||'s_state: '||s_state
        END LOOP;
    CLOSE Csr_1;
END;


--Declaring and using Cursor with variables (Trial 3 - Using 1 cursor)
DECLARE

    m_name musician.name%type;
    m_salary musician.salary%type;
    m_instrument musician.instrument%type;
    m_state musician.state%type;
    temp_state states.state_name%type;
    
    CURSOR Csr_1 IS
        SELECT name,salary,instrument,state
            FROM musician;

BEGIN

    OPEN Csr_1;
        LOOP
            FETCH Csr_1 
                INTO m_name, m_salary, m_instrument, m_state;
            EXIT WHEN Csr_1%NOTFOUND;
                SELECT state_name INTO temp_state
                    FROM states 
                        WHERE abb_state LIKE m_state;
            dbms_output.put_line(chr(10)||'  Name: '||m_name||chr(10)||'  Salary: '||m_salary||chr(10)||'  Instrument: '||m_instrument||chr(10)||'  State: '||temp_state||chr(10)||chr(10)||'---------------------------------------------');   --||'s_abb: '||s_abb||chr(10)||'s_state: '||s_state
        END LOOP;
    CLOSE Csr_1;
END;


--============================================================================--


--Creating table UPI_TXN
CREATE TABLE UPI_TXN
(
    id int PRIMARY KEY,
    pay_method varchar(20),
    amt int
);


SELECT * FROM upi_txn;

--Creating sequence upi_id_seq
CREATE SEQUENCE upi_id_seq
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1
    CACHE 20;


--Creating Trigger upi_id_seq serial
CREATE OR REPLACE TRIGGER trigger_upi_id_serial BEFORE INSERT ON upi_txn
FOR EACH ROW
BEGIN 
    SELECT upi_id_seq.NEXTVAL INTO :new.id FROM dual;
END;


--Inserting data into upi_txn
INSERT INTO upi_txn(pay_method,amt)
VALUES
(
    'Gpay',1000
);
INSERT INTO upi_txn(pay_method,amt)
VALUES
(
    'Phonepe',576
);
INSERT INTO upi_txn(pay_method,amt)
VALUES
(
    'Paytm',1089
);
INSERT INTO upi_txn(pay_method,amt)
VALUES
(
    'Gpay',256
);
INSERT INTO upi_txn(pay_method,amt)
VALUES
(
    'Gpay',469
);
INSERT INTO upi_txn(pay_method,amt)
VALUES
(
    'Phonepe',958
);
INSERT INTO upi_txn(pay_method,amt)
VALUES
(
    'Paytm',980
);
INSERT INTO upi_txn(pay_method,amt)
VALUES
(
    'Gpay',26
);
INSERT INTO upi_txn(pay_method,amt)
VALUES
(
    'Paytm',798
);
INSERT INTO upi_txn(pay_method,amt)
VALUES
(
    'Phonepe',656
);
INSERT INTO upi_txn(pay_method,amt)
VALUES
(
    'Gpay',39
);
INSERT INTO upi_txn(pay_method,amt)
VALUES
(
    'Phonepe',858
);
INSERT INTO upi_txn(pay_method,amt)
VALUES
(
    'Paytm',80
);
INSERT INTO upi_txn(pay_method,amt)
VALUES
(
    'Gpay',296
);


--Create Materialized View MV_UPI
CREATE MATERIALIZED VIEW MV_UPI
    AS
    SELECT pay_method, SUM(amt) AS total_amt
    FROM upi_txn
    GROUP BY pay_method;
    

SELECT * FROM MV_UPI;


--Updating main table UPI_TXN (Trial 1)
UPDATE upi_txn
    set amt = amt*3;


--Manual refreshing of data in MV_UPI
EXECUTE dbms_mview.refresh('MV_UPI');


--Create Materialized View MV_UPI (Automatic update)
CREATE MATERIALIZED VIEW MV_UPI_AUTO
    BUILD IMMEDIATE
    REFRESH FORCE
    ON COMMIT
    WITH PRIMARY KEY
    AS
    SELECT pay_method, SUM(amt) AS total_amt
    FROM upi_txn
    GROUP BY pay_method;



SELECT * FROM MV_UPI_AUTO;


--Updating main table UPI_TXN (Trial 2)
UPDATE upi_txn
    set amt = amt*2;

COMMIT;


--============================================================================--





































