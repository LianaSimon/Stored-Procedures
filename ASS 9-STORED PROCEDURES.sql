-- Assignment:9 Stored Procedures
Use College1;

-- Create a 'worker' table
CREATE TABLE Worker(Worker_Id INT PRIMARY KEY,FirstName CHAR(25), LastName CHAR(25), Salary INT, JoiningDate DATETIME, Department CHAR(25));

--  1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table 
-- and then invokes the procedure call. 

DELIMITER $$
CREATE PROCEDURE ADDWORKER1(IN p_Worker_id INT, IN p_Firstname CHAR(25), IN p_Lastname CHAR(25), IN p_Salary INT, IN p_JoiningDate DATETIME, 
IN p_Department CHAR(25))
BEGIN
INSERT INTO WORKER(Worker_Id,FirstName,LastName,Salary,JoiningDate, Department) 
VALUES(p_Worker_Id,p_FirstName,p_LastName,p_Salary,p_JoiningDate,p_Department);
END $$
DELIMITER ;

CALL ADDWORKER1(1,'John','Doe',50000,'2024-02-01','HR');

select * from worker;

-- 2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. 
-- It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. 
-- Then make the procedure call. 

DELIMITER $$
CREATE PROCEDURE GETWORKERSALARY(IN p_Workerid INT, OUT p_Salary INT)
BEGIN
SELECT Salary INTO p_Salary FROM Worker WHERE Worker_Id=p_Workerid;
END $$
DELIMITER ;

CALL GETWORKERSALARY(1,@Salary);
SELECT @Salary;

-- 3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. 
-- It should update the department of the worker with the given ID. Then make a procedure call.

DELIMITER $$
CREATE PROCEDURE UPDATE_DEPARTMENT( IN p_WorkerId INT, IN p_Department VARCHAR(25))
BEGIN
UPDATE Worker SET DEPARTMENT=P_Department WHERE Worker_Id=p_Workerid;
END $$
DELIMITER ;

CALL UPDATE_DEPARTMENT(1,'SALES');
SELECT * FROM WORKER;

-- 4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. 
-- It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call. 

INSERT INTO WORKER(Worker_Id,FirstName,LastName,Salary,JoiningDate, Department) 
VALUES(2,'Leo','Rex',65000,'2024-01-01','FINANCE'),(3,'RIZA','SEN',25000,'2024-02-01','HR');
INSERT INTO WORKER(Worker_Id,FirstName,LastName,Salary,JoiningDate, Department) 
VALUES(4,'Tina','Rex',65000,'2024-01-01','FINANCE'),(5,'Kiara','SEN',25000,'2024-02-01','HR');
SELECT * FROM WORKER;

DELIMITER $$
CREATE PROCEDURE WORKER_COUNT(IN p_Department VARCHAR(25), OUT p_Worker_Count INT)
BEGIN
SELECT COUNT(*) INTO p_Worker_Count FROM Worker WHERE Department=p_Department;
END $$
DELIMITER ;

CALL WORKER_COUNT('Finance',@WorkerCount);
SELECT(@WorkerCount) AS WORKER_COUNT_DEPARTMENTWISE;

-- 5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. 
-- It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.


DELIMITER $$
CREATE PROCEDURE AVG_SALARYofWORKER(IN p_Department VARCHAR(25), OUT p_avgsalary INT)
BEGIN
SELECT AVG(SALARY) INTO p_avgsalary FROM WORKER WHERE Department=p_Department;
END $$
DELIMITER ;

CALL AVG_SALARYofWORKER('Finance', @AvgSalary);
SELECT @AvgSalary AS "AVERAGE-SALARY DEPARTMENTWISE";



