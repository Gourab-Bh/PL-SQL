--Creating Employee Table 

CREATE TABLE Employee   

(   

    Employee_ID int PRIMARY KEY,   

    First_Name varchar2(255) NOT NULL,   

    Middle_name varchar2(255), 

    Last_Name varchar2(255) NOT NULL,   

    Email varchar2(255) UNIQUE,   

    Address_Line varchar2(255),   

    City varchar2(255), 

    Country varchar2(100), 

    Salary varchar2(200), 

    GENDER varchar2(200), 

    DEPT_NAME varchar2(200), 

    DEPT_CODE varchar2(200), 

    Education varchar2(200), 

    Date_of_hire DATE, 

    Manager_Name varchar2(200), 

    CONSTRAINT dept_name_check check(DEPT_NAME IN('RnD','Support','Accounts','HR','Sales')), 

    CONSTRAINT dept_code_check check(DEPT_CODE IN('01','02','03','04','05')) 

); 

  

  

--Creating sequence for auto incrementing employee id 

CREATE SEQUENCE employee_id_seq 

    MINVALUE 1 

    START WITH 1 

    INCREMENT BY 1 

    CACHE 20; 

  

  

--Implementing auto increment sequence in Employee table using trigger 

CREATE OR REPLACE TRIGGER employee_id_increment BEFORE INSERT ON Employee 

FOR EACH ROW 

BEGIN  

    SELECT employee_id_seq.NEXTVAL INTO :new.Employee_ID FROM dual; 

END; 

  
--Procedure for insertion in Employee Table.

create or replace PROCEDURE Insert_Employee
(   
    e_fname IN varchar,
    e_mname IN varchar,
    e_lname IN varchar,
    e_email IN varchar,
    e_addr IN varchar,
    e_city IN varchar,
    e_country IN varchar,
    e_salary IN varchar,
    e_gender IN varchar,
    e_depname IN varchar,
    e_depcode IN varchar,
    e_education IN varchar,
    e_dateofhire IN date,
    e_manager IN varchar
)
AS
    l_start_time timestamp;
    l_end_time timestamp;
    param_value varchar2(20000);
    param_name varchar2(20000); 
    to_hours varchar(200);
BEGIN
    l_start_time := sysdate;
    param_name := ('First_Name'||','||'Middle_name'||','||'Last_Name'||','||'Email'||','||'Address_Line'||','||'City'||','||'Country'||','||'Salary'||','||'GENDER'||','||'DEPT_NAME'||','||'DEPT_CODE'||','||'Education'||','||'Date_of_hire'||','||'Manager_Name'); 
    param_value:=(e_fname||','||e_mname||','||e_lname||','||e_email||','||e_addr||','||e_city||','||e_country||','||e_salary||','||e_gender||','||e_depname||','||e_depcode||','||e_education||','||e_dateofhire||','||e_manager); 
    
    INSERT INTO Employee(First_Name, Middle_name, Last_Name, Email, Address_Line, City, Country, Salary, GENDER, DEPT_NAME, DEPT_CODE, Education, Date_of_hire, Manager_Name)
    VALUES (e_fname, e_mname, e_lname, e_email, e_addr, e_city, e_country, e_salary, e_gender, e_depname, e_depcode, e_education, e_dateofhire, e_manager);
    COMMIT;
    
    l_end_time := sysdate;
    to_hours := to_char(l_end_time-l_start_time);
    
    INSERT INTO log(SP_ID,SP_NAME, REPORT_ID, PARAMETER_NAME, PARAMETER_VALUE, START_TIME, END_TIME, TIME_DURATION)
    values (1,'Insert_Employee',1,param_name,param_value,l_start_time,l_end_time,to_hours);
    COMMIT;
    
END Insert_Employee;



--Inserting data into Employee table 

EXEC Insert_Employee('Ram','Kumar','Verma','rkv1@gmail.com','7/39','Pune','INDIA',20000,'M','RnD','01','B.TECH','01-FEB-17','SUJA'); 
EXEC Insert_Employee('Shyam','Singh','Bohra','ssb2@gmail.com','st-06','Mumbai','INDIA',40000,'M','Support','02','B.SC','12-FEB-2017','swapneel'); 
EXEC Insert_Employee('Geeta','Kumari','Pathak','gk3@gmail.com','plot 6/st 9','Ahmedabad','INDIA',35000,'F','RnD','01','B.TECH','12-FEB-2017','goutam'); 
EXEC Insert_Employee('Puneet','Das','Verma','pdv4@gmail.com','27/9','Bhopal','INDIA',60000,'M','RnD','01','B.TECH','12-FEB-2017','gourab'); 
EXEC Insert_Employee('Nikita','Sen','Gupta','nsg5@gmail.com','st no-87','Chennai','INDIA',45000,'F','Accounts','03','B.TECH','12-FEB-2017','vishal'); 
EXEC Insert_Employee('Vimal',' --- ','Bose','vim6@gmail.com','5/church lane','Panji','INDIA',30000,'M','HR','04','B.TECH','12-FEB-2017','SUJA'); 
EXEC Insert_Employee('Yashu','Kumari','Sahu','ys997@gmail.com','Risali','Bhilai','INDIA',80000,'F','RnD','01','B.TECH','12-FEB-2017','SUJA'); 
EXEC Insert_Employee('Uddesh','Ramchandra','Dharmik','urd8@gmail.com','st-06','Bhopal','INDIA',75000,'M','RnD','01','B.TECH','12-FEB-2017','shubhendu'); 
EXEC Insert_Employee('Gourab',' --- ','Bhattacharjee','gb9@gmail.com','27/8','Kolkata','INDIA',75000,'M','Accounts','03','B.TECH','12-FEB-2017','SUJA'); 
EXEC Insert_Employee('Payal','Kumari','Hake','pkh10@gmail.com','plot 6/hinjewadi','Pune','INDIA',65000,'F','Sales','05','B.TECH','12-FEB-2017','fahad'); 
EXEC Insert_Employee('Shubhendu','Kumar','Vatsa','skv11@gmail.com','sector 6','Delhi','INDIA',85000,'M','HR','04','B.TECH','12-FEB-2017','SUJA'); 
EXEC Insert_Employee('Goutam',' --- ','Pradhan','gpr12@gmail.com','8/church lane','Mumbai','INDIA',80000,'M','HR','04','B.TECH','12-FEB-2017','SUJA'); 
EXEC Insert_Employee('Sneha','Kumari','Sharma','sks13@gmail.com','plot no 97','Indore','INDIA',50000,'F','RnD','01','B.TECH','12-FEB-2017','SUJA'); 
EXEC Insert_Employee('Apoorv','Singh','Saxena','asv14@gmail.com','street 6','Bhopal','INDIA',70000,'M','Support','02','B.TECH','12-FEB-2017','tina s'); 
EXEC Insert_Employee('Fahad',' --- ','Anjum','fah15@gmail.com','gachibowli','Hyderabad','INDIA',85000,'M','HR','04','B.TECH','12-FEB-2017','SUJA'); 
EXEC Insert_Employee('Sampada','Swapnil','Pawar','ssp16@gmail.com','27/110','Nagpur','INDIA',60000,'F','Sales','05','B.TECH','12-FEB-2017','SUJA'); 
EXEC Insert_Employee('Leena',' --- ','Polycarph','lp17@gmail.com','Block 5','Banglore','INDIA',65000,'F','Accounts','03','B.TECH','12-FEB-2017','SUJA'); 
EXEC Insert_Employee('Sarwadnya',' --- ','Bhosale','sb18@gmail.com','786/9','Raipur','INDIA',40000,'F','HR','04','B.TECH','12-FEB-2017','tina s'); 
EXEC Insert_Employee('deepak',' --- ','gupta','deepak19@gmail.com','charminar','Hyderabad','INDIA',76000,'M','HR','04','MBA','11-DEC-2017','tina s'); 
EXEC Insert_Employee('Shubham','sharma','Pawar','shubham20@gmail.com','27/110','Nagpur','INDIA',60000,'F','Sales','05','B.TECH','18-APR-2017','tina s'); 
EXEC Insert_Employee('shiv',' --- ','narayan','sn21@gmail.com','Block 5','mangalore','INDIA',60000,'F','Accounts','03','B.TECH','2-JUN-2019','tina s'); 
EXEC Insert_Employee('jai',' --- ','Bhosale','jb22@gmail.com','786/9','Raipur','INDIA',88000,'F','HR','04','B.TECH','01-JULY-2019','tina s'); 
EXEC Insert_Employee('Nirmal','Sen','Gupta','nsg23@gmail.com','st no-87','Chennai','INDIA',45000,'F','Accounts','03','B.TECH','12-FEB-2017','vishal'); 
EXEC Insert_Employee('vinod',' --- ','Bose','vim24@gmail.com','5/church lane','Panji','INDIA',30000,'M','HR','04','B.TECH','12-FEB-2017','SUJA'); 
EXEC Insert_Employee('Yash','Kumari','Sahu','ys9925@gmail.com','Risali','Bhilai','INDIA',89000,'F','RnD','01','B.TECH','12-APR-2017','SUJA'); 
EXEC Insert_Employee('utkarsh',' --- ','dhavan','urd26@gmail.com','st-06','Bhopal','INDIA',95000,'M','RnD','01','B.TECH','12-JUN-2017','shubhendu'); 
EXEC Insert_Employee('Gourab',' --- ','Bhattacharjee','gbh27@gmail.com','27/8','Kolkata','INDIA',77000,'M','Accounts','03','B.TECH','12-FEB-2017','SUJA'); 
EXEC Insert_Employee('pooja','Kumari','Hake','pkh28@gmail.com','plot 6/hinjewadi','Pune','INDIA',66000,'F','Sales','05','B.TECH','12-JUL-2017','fahad'); 
EXEC Insert_Employee('shubh','Kumar','Vatsa','skv29@gmail.com','sector 6','uttarakhand','INDIA',89000,'M','HR','04','B.TECH','12-AUG-2017','SUJA'); 
EXEC Insert_Employee('vaishu',' --- ','Pradhan','gpv30@gmail.com','8/church lane','Mumbai','INDIA',33000,'M','HR','04','B.TECH','12-FEB-2017','SUJA'); 
EXEC Insert_Employee('sandhya','Kumari','Sharma','sks31@gmail.com','plot no 97','Indore','INDIA',21000,'F','RnD','01','B.TECH','12-SEP-2019','SUJA'); 
EXEC Insert_Employee('adarsh','Singh','Saxena','as32@gmail.com','street 6','sikkam','INDIA',270000,'M','Support','02','B.TECH','12-FEB-2022','tina s'); 
EXEC Insert_Employee('faiz',' --- ','Anjum','fa33@gmail.com','bowli','kanyakumari','INDIA',83000,'M','HR','04','B.TECH','12-NOV-2022','SUJA'); 
EXEC Insert_Employee('sam','Swapnil','Pawar','ssp34@gmail.com','27/110','Nagpur','INDIA',60000,'F','Sales','05','B.TECH','12-DEC-2018','SUJA'); 
EXEC Insert_Employee('lalita',' --- ','Sharma','lp35@gmail.com','Block 5','Banglore','INDIA',62000,'F','Accounts','03','B.TECH','12-DEC-2019','SUJA'); 
EXEC Insert_Employee('harshit',' --- ','bokade','sb36@gmail.com','786/9','Raipur','INDIA',45000,'F','HR','04','B.TECH','12-DEC-2019','tina s'); 
EXEC Insert_Employee('Jaiyash',' --- ','Bhosale','jb37@gmail.com','786/9','Raipur','INDIA',880000,'F','HR','04','B.TECH','01-JULY-2019','tina s'); 
EXEC Insert_Employee('Nirav','Sen','modi','nsg38@gmail.com','st no-87','managlore','INDIA',2000,'F','Accounts','03','Diploma','12-FEB-2017','vishal'); 
EXEC Insert_Employee('Vijay',' --- ','malaya','vim39@gmail.com','5/church lane','vasco da gama','INDIA',500,'M','HR','04','12th pass','12-sep-2018','vishal'); 
EXEC Insert_Employee('Goku','Kumari','Sahu','ys9940@gmail.com','Risali','bhojpur','INDIA',89000,'F','RnD','01','B.TECH','12-APR-2017','SUJA'); 
EXEC Insert_Employee('Ganesh',' --- ','saini','urd41@gmail.com','st-06','damoh','INDIA',95000,'M','RnD','01','B.TECH','12-JUN-2017','shubhendu'); 
EXEC Insert_Employee('lokesh',' --- ','nahar','gl42@gmail.com','27/8','Kolkata','INDIA',77000,'M','Accounts','03','B.TECH','12-FEB-2017','SUJA'); 
EXEC Insert_Employee('pooja','Kumari','Hake','pkh43@gmail.com','plot 6/hinjewadi','Pune','INDIA',66000,'F','Sales','05','B.TECH','12-JUL-2017','vishal'); 
EXEC Insert_Employee('shubh','Kumar','Vatsa','skv44@gmail.com','sector 6','uttarakhand','INDIA',89000,'M','HR','04','B.SC','12-AUG-2017','SUJA'); 
EXEC Insert_Employee('jannat',' --- ','Pradhan','gpjp45@gmail.com','8/church lane','Mumbai','INDIA',33000,'M','HR','04','B.sc','12-FEB-2017','SUJA'); 
EXEC Insert_Employee('sanjay','Kumari','sahu','sks46@gmail.com','plot no 97','Damon','INDIA',77000,'F','RnD','01','B.TECH','12-SEP-2019','subashini'); 
EXEC Insert_Employee('Ramanujan','Kumar','vaish','rkv47@gmail.com','7/39','Pune','INDIA',20000,'M','RnD','01','B.TECH','12-FEB-2017','SUJA'); 
EXEC Insert_Employee('shivam','Singh','behera','ssb48@gmail.com','st-06','Mumbai','INDIA',40000,'M','Support','02','B.SC','12-FEB-2017','swapneel'); 
EXEC Insert_Employee('Geeta','Kumari','Pathak','gkp49@gmail.com','plot 6/st 9','Ahmedabad','INDIA',35000,'F','RnD','01','B.TECH','12-FEB-2017','subashini'); 
EXEC Insert_Employee('Pragya','Das','Verma','pdv5089@gmail.com','27/9','Bhopal','INDIA',60000,'M','RnD','01','B.TECH','12-FEB-2017','subashini'); 
EXEC Insert_Employee('Pranjal','Biswas','Saho','pbsla88la@gmail.com','lok street','Jamshedpur','INDIA',67000,'M','RnD','01','B.TECH','12-AUG-2017','subashini'); 

  

Update Employee set Salary = '25000' where Employee_ID = 1; 

Update Employee set Last_Name = 'Verm' where Employee_ID = 4; 

Delete from Employee where Employee_ID = 50; 

  

--============================================================================-- 

  

--Creating Log table 

CREATE TABLE Log 

( 

    LOG_ID number PRIMARY KEY, 

    SP_ID number, 

    SP_NAME varchar2(255), 

    REPORT_ID number, 

    PARAMETER_NAME varchar2(255), 

    PARAMETER_VALUE varchar2(255), 

    START_TIME timestamp, 

    END_TIME timestamp, 

    TIME_DURATION varchar(200)

); 

  

--Creating sequence for auto incrementing log id 

CREATE SEQUENCE log_id_seq 

    MINVALUE 1 

    START WITH 1 

    INCREMENT BY 1 

    CACHE 20; 

  

  

--Implementing auto increment sequence in Log table using trigger 

CREATE OR REPLACE TRIGGER log_id_increment BEFORE INSERT ON Log 

FOR EACH ROW 

BEGIN  

    SELECT log_id_seq.NEXTVAL INTO :new.Log_ID FROM dual; 

END; 

  

--============================================================================-- 

  

--Creating Report Metadata table 

CREATE TABLE Report_Meta_Data 

( 

    REPORT_ID number PRIMARY KEY, 

    REPORT_NAME varchar2(255), 

    REPORT_PURPOSE varchar2(255), 

    REPORT_DESIGN_FILE_NAME varchar2(255), 

    DESIGNER_NAME varchar2(255), 

    DATE_CREATED date, 

    REFERENCE_REPORT_ID number 

); 

 
--Inserting data into Report Meta Data 

INSERT INTO REPORT_META_DATA
VALUES
(
    1,'Dataset','Shows all the tables and provides filters','Dataset.rptdesign','Yashu','14-12-2022',NULL
);
INSERT INTO REPORT_META_DATA
VALUES
(
    2,'Departments','Shows a number of charts which can be filtered by department name','Departments.rptdesign','Gourab','22-12-2022',1
);
INSERT INTO REPORT_META_DATA
VALUES
(
    3,'Location','Shows a number of charts which can be filtered by city and education','Location.rptdesign','Uddesh','23-12-2022',1
);
  

--============================================================================-- 

  

  

--Creating table MASTER SP INFO 

CREATE TABLE master_sp_info 

( 

    sp_id int, 

    sp_name varchar2(50), 

    sp_purpose varchar2(500), 

    sp_report_id int, 

    PRIMARY KEY (sp_id), 

    FOREIGN KEY (sp_report_id) REFERENCES Report_Meta_Data(report_id) 

); 

  
--Inserting data into SP table
INSERT INTO master_sp_info
VALUES
(
    1,'Insert_Employee','Used to insert data into Employee table',1
);  

--============================================================================-- 

  

--Creating Audit Table for viewing changes in Employee Table 

CREATE TABLE Audit_emp 

( 

    audit_no int, 

    audit_id int, 

    user_name varchar(50), 

    Operation varchar(10), 

    Col_affected varchar(50), 

    old_values varchar(50), 

    new_values varchar(50), 

    Date_time varchar(50), 

    PRIMARY KEY(audit_no) 

); 

  

--Creating sequence audit_seq (auto increment) 

CREATE SEQUENCE audit_seq 

    MINVALUE 1 

    START WITH 1 

    INCREMENT BY 1 

    CACHE 20; 

  

--Creating Trigger audit_no_increment 

CREATE OR REPLACE TRIGGER audit_no_increment BEFORE INSERT ON audit_emp 

FOR EACH ROW 

BEGIN  

    SELECT audit_seq.NEXTVAL INTO :new.audit_no FROM dual; 

END; 

  

--Creating trigger emp_changes(describing insert) 

CREATE OR REPLACE TRIGGER emp_changes 

AFTER INSERT OR UPDATE OR DELETE ON employee 

FOR EACH ROW 

ENABLE 

DECLARE 

    change_user varchar(50); 

    change_date varchar(50); 

BEGIN 

     

    SELECT user, TO_CHAR(SYSDATE,'DD-MON-YYYY HH12:MI:SSAM') INTO change_user, change_date FROM dual; 

  

    IF INSERTING THEN 

        INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

        VALUES 

        ( 

            :new.employee_id,change_user,'Insert','First_name',NULL,:new.first_name,change_date 

        ); 

        INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

        VALUES 

        ( 

            :new.employee_id,change_user,'Insert','Middle_name',NULL,:new.middle_name,change_date 

        ); 

        INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

        VALUES 

        ( 

            :new.employee_id,change_user,'Insert','Last_name',NULL,:new.last_name,change_date 

        ); 

        INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

        VALUES 

        ( 

            :new.employee_id,change_user,'Insert','Email',NULL,:new.email,change_date 

        ); 

        INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

        VALUES 

        ( 

            :new.employee_id,change_user,'Insert','Address_line',NULL,:new.address_line,change_date 

        ); 

        INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

        VALUES 

        ( 

            :new.employee_id,change_user,'Insert','City',NULL,:new.city,change_date 

        ); 

        INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

        VALUES 

        ( 

            :new.employee_id,change_user,'Insert','Country',NULL,:new.country,change_date 

        ); 

        INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

        VALUES 

        ( 

            :new.employee_id,change_user,'Insert','Salary',NULL,:new.salary,change_date 

        ); 

        INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

        VALUES 

        ( 

            :new.employee_id,change_user,'Insert','Gender',NULL,:new.gender,change_date 

        ); 

        INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

        VALUES 

        ( 

            :new.employee_id,change_user,'Insert','Dept_name',NULL,:new.dept_name,change_date 

        ); 

        INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

        VALUES 

        ( 

            :new.employee_id,change_user,'Insert','Dept_code',NULL,:new.dept_code,change_date 

        ); 

        INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

        VALUES 

        ( 

            :new.employee_id,change_user,'Insert','Education',NULL,:new.education,change_date 

        ); 

        INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

        VALUES 

        ( 

            :new.employee_id,change_user,'Insert','Date_of_hire',NULL,:new.Date_of_hire,change_date 

        ); 

        INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

        VALUES 

        ( 

            :new.employee_id,change_user,'Insert','Manager_Name',NULL,:new.Manager_Name,change_date 

        ); 

    ELSIF DELETING THEN 

        INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

        VALUES 

        ( 

            :old.employee_id,change_user,'Delete','All',:old.first_name||' '||:old.last_name,NULL,change_date 

        ); 

    ELSIF UPDATING  

            THEN 

            IF :new.first_name != :old.first_name 

                THEN 

                    INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

                    VALUES 

                    ( 

                        :old.employee_id,change_user,'Update','First_name',:old.first_name,:new.first_name,change_date 

                    ); 

            END IF; 

            IF :new.middle_name != :old.middle_name 

                THEN 

                    INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

                    VALUES 

                    ( 

                        :old.employee_id,change_user,'Update','Middle_name',:old.middle_name,:new.middle_name,change_date 

                    ); 

            ELSIF :old.middle_name IS NULL AND :new.middle_name IS NOT NULL 

                THEN 

                    INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

                    VALUES 

                    ( 

                        :old.employee_id,change_user,'Update','Middle_name',NULL,:new.middle_name,change_date 

                    ); 

            END IF; 

            IF :new.last_name != :old.last_name 

                THEN 

                    INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

                    VALUES 

                    ( 

                        :old.employee_id,change_user,'Update','Last_name',:old.last_name,:new.last_name,change_date 

                    ); 

            ELSIF :old.last_name IS NULL AND :new.last_name IS NOT NULL 

                THEN 

                    INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

                    VALUES 

                    ( 

                        :old.employee_id,change_user,'Update','Last_name',NULL,:new.last_name,change_date 

                    ); 

            END IF; 

            IF :new.email != :old.email 

                THEN 

                    INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

                    VALUES 

                    ( 

                        :old.employee_id,change_user,'Update','Email',:old.email,:new.email,change_date 

                    ); 

            END IF; 

            IF :new.address_line != :old.address_line 

                THEN 

                    INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

                    VALUES 

                    ( 

                        :old.employee_id,change_user,'Update','Address_line',:old.address_line,:new.address_line,change_date 

                    ); 

            END IF; 

            IF :new.city != :old.city 

                THEN 

                    INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

                    VALUES 

                    ( 

                        :old.employee_id,change_user,'Update','City',:old.city,:new.city,change_date 

                    ); 

            END IF; 

            IF :new.country != :old.country 

                THEN 

                    INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

                    VALUES 

                    ( 

                        :old.employee_id,change_user,'Update','Country',:old.country,:new.country,change_date 

                    ); 

            END IF; 

            IF :new.Date_of_hire != :old.Date_of_hire 

                THEN 

                    INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

                    VALUES 

                    ( 

                        :old.employee_id,change_user,'Update','Date_of_hire',:old.Date_of_hire,:new.Date_of_hire,change_date 

                    ); 

            END IF; 

            IF :new.salary != :old.salary 

                THEN 

                    INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

                    VALUES 

                    ( 

                        :old.employee_id,change_user,'Update','Salary',:old.salary,:new.salary,change_date 

                    ); 

            END IF; 

            IF :new.gender != :old.gender 

                THEN 

                    INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

                    VALUES 

                    ( 

                        :old.employee_id,change_user,'Update','Gender',:old.gender,:new.gender,change_date 

                    ); 

            END IF; 

            IF :new.dept_name != :old.dept_name 

                THEN 

                    INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

                    VALUES 

                    ( 

                        :old.employee_id,change_user,'Update','Dept_name',:old.dept_name,:new.dept_name,change_date 

                    ); 

            END IF; 

            IF :new.dept_code != :old.dept_code 

                THEN 

                    INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

                    VALUES 

                    ( 

                        :old.employee_id,change_user,'Update','Dept_code',:old.dept_code,:new.dept_code,change_date 

                    ); 

            END IF; 

            IF :new.education != :old.education 

                THEN 

                    INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

                    VALUES 

                    ( 

                        :old.employee_id,change_user,'Update','Education',:old.education,:new.education,change_date 

                    ); 

            END IF; 

            IF :new.Manager_Name != :old.Manager_Name 

                THEN 

                    INSERT INTO AUDIT_EMP(audit_id,user_name,Operation,col_affected,old_values,new_values,Date_time) 

                    VALUES 

                    ( 

                        :old.employee_id,change_user,'Update','Manager_Name',:old.Manager_Name,:new.Manager_Name,change_date 

                    ); 

            END IF; 

    END IF; 

END; 



--============================================================================-- 

  

--NOTES 


SELECT * FROM EMPLOYEE;  

SELECT * FROM AUDIT_EMP; 

SELECT * FROM LOG; 

SELECT * FROM MASTER_SP_INFO; 

SELECT * FROM REPORT_META_DATA;



/*DROP table Employee; 

DROP SEQUENCE employee_id_seq; 

DROP trigger  employee_id_increment; 

DROP Procedure Insert_Employee; 

DROP table LOG; 

DROP SEQUENCE log_id_seq; 

DROP trigger  log_id_increment; 

DROP table Audit_emp; 

DROP SEQUENCE audit_seq; 

DROP trigger audit_no_increment; 

DROP trigger emp_changes;*/
