--Welcome
DECLARE 
BEGIN
    dbms_output.put_line('Welcome to handson session');
END;

--============================================================================--


--Creating Employee table
CREATE TABLE Employees
    (   Emp_id INT,
        First_Name VARCHAR(50),
        Last_name VARCHAR(50),
        Salary INT,
        Date_added DATE,
        --ORDER BY Emp_id,auto_increment(sequence)
        PRIMARY KEY (Emp_id)
    );


DESCRIBE Employees;

DROP TABLE employee;


--Creating procedure to add new employee
CREATE OR REPLACE PROCEDURE Add_Employee
(
    e_id        IN number,
    e_fname     IN varchar,
    e_lname     IN varchar,
    e_salary    IN number,
    e_dateadd   IN date
)
AS
BEGIN

    INSERT INTO Employees(Emp_id,first_name,last_name,salary,date_added)
    VALUES (e_id,e_fname,e_lname,e_salary,e_dateadd);
    
    COMMIT;
    
    dbms_output.put_line('New Employee added');

END Add_Employee;


--Calling Procedure Add_Employee
BEGIN

    Add_Employee(1,'Fahad','Anjum',80000,SYSDATE);
    Add_Employee(2,'Sarwadna','Bhosale',60000,SYSDATE);
    Add_Employee(3,'Uddesh','Dharmik',80000,SYSDATE);
    Add_Employee(4,'Payal','Hake',70000,SYSDATE);
    Add_Employee(5,'Sampada','Pawar',70000,SYSDATE);
    Add_Employee(6,'Leena','Polycarph',50000,SYSDATE);
    Add_Employee(7,'Goutam','Pradhan',50000,SYSDATE);
    Add_Employee(8,'Yashu','Sahu',60000,SYSDATE);
    Add_Employee(9,'Apoorv','Saxena',80000,SYSDATE);
    Add_Employee(10,'Sneha','Sharma',70000,SYSDATE);
    Add_Employee(11,'Vatsa','Shubhendu',60000,SYSDATE);
    Add_Employee(12,'Bhattacharjee','Gourab',40000,SYSDATE);

END;


SELECT * FROM Employees;


--============================================================================--


