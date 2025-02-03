# STORED-PROCEDURES

This repository contains SQL scripts for various stored procedures related to the Worker table in a database. These procedures allow insertion, update, retrieval, and calculation of worker-related information.

# SQL SCRIPT

--Use a database

Use College1;

-- Create a 'worker' table

CREATE TABLE Worker(Worker_Id INT PRIMARY KEY,FirstName CHAR(25), LastName CHAR(25), Salary INT, JoiningDate DATETIME, Department CHAR(25));

--  1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table and then invokes the procedure call. 

DELIMITER $$

CREATE PROCEDURE ADDWORKER1(IN p_Worker_id INT, IN p_Firstname CHAR(25), IN p_Lastname CHAR(25), IN p_Salary INT, IN p_JoiningDate DATETIME, 
IN p_Department CHAR(25))

BEGIN

INSERT INTO WORKER(Worker_Id,FirstName,LastName,Salary,JoiningDate, Department) VALUES(p_Worker_Id,p_FirstName,p_LastName,p_Salary,p_JoiningDate,p_Department);

END $$

DELIMITER ;

CALL ADDWORKER1(1,'John','Doe',50000,'2024-02-01','HR');

select * from worker;

![image](https://github.com/user-attachments/assets/0705b786-e32d-4507-9777-47d5c5d585f9)

-- 2. Stored Procedure to Retrieve Salary of a Worker

DELIMITER $$

CREATE PROCEDURE GETWORKERSALARY(IN p_Workerid INT, OUT p_Salary INT)

BEGIN

SELECT Salary INTO p_Salary FROM Worker WHERE Worker_Id=p_Workerid;

END $$

DELIMITER ;

CALL GETWORKERSALARY(1,@Salary);

SELECT @Salary;

![image](https://github.com/user-attachments/assets/99af37ec-0938-4a86-81ab-0bc196d6284a)

-- 3. Stored Procedure to Update Department of a Worker

DELIMITER $$

CREATE PROCEDURE UPDATE_DEPARTMENT( IN p_WorkerId INT, IN p_Department VARCHAR(25))

BEGIN

UPDATE Worker SET DEPARTMENT=P_Department WHERE Worker_Id=p_Workerid;

END $$

DELIMITER ;

CALL UPDATE_DEPARTMENT(1,'SALES');

SELECT * FROM WORKER;

![image](https://github.com/user-attachments/assets/04c714d8-2bd2-4570-bd8c-3b22d6bf6906)


-- 4. Stored Procedure to Count Workers in a Department

DELIMITER $$

CREATE PROCEDURE WORKER_COUNT(IN p_Department VARCHAR(25), OUT p_Worker_Count INT)

BEGIN

SELECT COUNT(*) INTO p_Worker_Count FROM Worker WHERE Department=p_Department;

END $$

DELIMITER ;

CALL WORKER_COUNT('Finance',@WorkerCount);

SELECT(@WorkerCount) AS WORKER_COUNT_DEPARTMENTWISE;

![image](https://github.com/user-attachments/assets/fb8c5ba6-1359-4667-b7ad-b8178c1fcc46)

-- 5. Stored Procedure to Get Average Salary in a Department

DELIMITER $$

CREATE PROCEDURE AVG_SALARYofWORKER(IN p_Department VARCHAR(25), OUT p_avgsalary INT)

BEGIN

SELECT AVG(SALARY) INTO p_avgsalary FROM WORKER WHERE Department=p_Department;

END $$

DELIMITER ;

CALL AVG_SALARYofWORKER('Finance', @AvgSalary);

SELECT @AvgSalary AS "AVERAGE-SALARY DEPARTMENTWISE";

![image](https://github.com/user-attachments/assets/e8c2888f-ec1c-4861-b070-4a4395cf70f9)



# STORED PROCEDURES

1. AddWorker

Adds a new worker to the Worker table.

2. GetWorkerSalary

Retrieves the salary of a worker given their Worker_Id.

3. UpdateWorkerDepartment

Updates the department of a worker given their Worker_Id.

4. GetWorkerCountByDepartment

Retrieves the number of workers in a specified department.

5. GetAverageSalaryByDepartment

Retrieves the average salary of workers in a specified department.


# HOW TO USE

** Run the SQL scripts to create the table and stored procedures.

** Use the CALL statements to test and interact with the stored procedures.

** Modify or expand as needed for your use case.

** Ensure you have necessary database permissions to create and execute stored procedures.

** These procedures can be integrated into applications to automate HR-related tasks.


# ADDITIONAL INFORMATION

** These stored procedures improve efficiency by reducing redundancy and enhancing data management.

** Error handling can be added for better reliability.

** Indexing the Worker_Id column can further optimize query performance.









