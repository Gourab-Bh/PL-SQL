--Creating Employee table
CREATE TABLE Temp
    (   id      INT,
        fname   VARCHAR(50),
        lname   VARCHAR(50),
        city    VARCHAR(50),
        country VARCHAR(50),
        PRIMARY KEY (id)
    );
    
Select * from temp;
    
INSERT INTO Temp
VALUES
(
    100000,'Payal','Hake','Mumbai','India'
);
INSERT INTO Temp
VALUES
(
    200000,'Yashu','Sahu','Bhilai','India'
);
INSERT INTO Temp
VALUES
(
    300000,'Uddesh','Dharmik','Pune','India'
);

CREATE TABLE Employee
    (
        id INT,
        details VARCHAR(100),
        PRIMARY KEY (id),
        FOREIGN KEY (id) REFERENCES Temp(id)
    );
    
INSERT INTO Employee
(
    
);


Select * FROM temp
WHERE fname LIKE 'P%';