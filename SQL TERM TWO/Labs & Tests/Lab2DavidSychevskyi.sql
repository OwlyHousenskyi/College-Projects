--create and use a new database
USE master
GO

IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'username_Company')
BEGIN
	ALTER DATABASE Laboratory2
	SET OFFLINE WITH ROLLBACK IMMEDIATE
	ALTER DATABASE Laboratory2
	SET ONLINE
	DROP DATABASE Laboratory2
END
GO

CREATE DATABASE Laboratory2
GO

USE Laboratory2
GO


--drop the tables if they already exist
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLOYEE]') AND type in (N'U'))
	DROP TABLE [dbo].[EMPLOYEE]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEPARTMENT]') AND type in (N'U'))
	DROP TABLE [dbo].[DEPARTMENT]
GO

CREATE TABLE DEPARTMENT
(
	deptCode	CHAR(4)				PRIMARY KEY,
	deptName	VARCHAR(30)			NOT NULL,
	deptBudget	DECIMAL(10,2)		
)
INSERT INTO DEPARTMENT 
	(deptCode, deptName, deptBudget) 
VALUES 
	('ACCT','Accounting',200000),
	('ISYS','Information Systems',500000),
	('MKTG','Marketing',170000),
	('PERS','Personnel',80000);

CREATE TABLE EMPLOYEE
(
	empID		INT IDENTITY(1,1)	PRIMARY KEY,
	empFirst	VARCHAR(25)			NOT NULL,
	empLast		VARCHAR(30)			NOT NULL,
	empTitle	VARCHAR(25),
	empSalary	DECIMAL(9,2),		
	empStart	DATE,
	deptCode	CHAR(4)				CONSTRAINT fk_EMP_DEPT REFERENCES DEPARTMENT(deptCode)		
)
INSERT INTO EMPLOYEE 
	(empFirst, empLast, empTitle, empSalary, empStart, deptCode)
VALUES 
	('Marissa','Greene','Accountant',59000,'1991/6/6', 'ACCT'),
	('Ethan','Black','Analyst',75000,'1989/10/2', 'ISYS'),
	('Robert','Jones','Programmer',47000,'1981/11/3', 'ISYS'),
	('Lisa','Malette','Manager',85000,'1995/9/6', 'ACCT'),
	('Miles','Franklin','Admin Assistant',50500,'1990/7/9', 'ACCT'),
	('Clara','Albertson','Technician',46000,'1984/1/1', 'ISYS'),
	('Vera','Bartlett','Manager',60000,'1996/9/10', 'MKTG'),
	('Ned','Horton','Programmer',100001,'1990/10/9', 'ISYS')

-- 1 -- Create a User-Defined Data Type to represent a "Reviewed Date":
CREATE TYPE ReviewedDateType AS TABLE
(
     ReviewedDate DATE,
	 CHECK(ReviewedDate BETWEEN '2016-03-04' AND GETDATE())
);

-- 2 -- Add a deptReview column to the existing Department table:
ALTER TABLE DEPARTMENT
ADD deptReview DATE;

INSERT INTO DEPARTMENT VALUES 
    ('LOSS','Loos Prevention',130000,'2016-03-04');

SELECT * FROM DEPARTMENT;

-- 3 -- Create a Computed Column in the Employee table to represent the employee's Income Tax:
payment:
ALTER TABLE EMPLOYEE
ADD empIncomeTax AS (empSalary * 0.0505)

SELECT empFirst, empLast, empTitle, 
CONCAT('$', + empSalary) AS 'empSalary',
CONCAT('$', CAST(empIncomeTax AS DECIMAL (7,2))) AS 'empIncomeTax'
FROM EMPLOYEE

-- 4 -- Declare variables :
DECLARE @departmentBudget DECIMAL(10,2);
DECLARE @totalSalaries DECIMAL(10,2);
DECLARE @percentageRemaining DECIMAL(5,2);
-- Use these variables to calculate the percentage of budget that is remaining after all employees have been paid:
SET @departmentBudget = 80000.00; 
SET @totalSalaries = (
    SELECT SUM(empSalary)
    FROM EMPLOYEE
    WHERE empTitle = 'Accounting' 
);
-- Write T-SQL logic to respond as follows: If the percentage remaining is less than 5%, generate an error:
SET @percentageRemaining = ((@departmentBudget - @totalSalaries) / @departmentBudget) * 100;

IF (@percentageRemaining < 5)
BEGIN
    RAISERROR('The department is close to its budget cap.', 16, 1);
END
ELSE
BEGIN
    SELECT FORMAT(@percentageRemaining, 'N2') + '%' AS 'Percentage Remaining';
END

--5:
--A:
SELECT
    deptCode,
    deptName,
    deptBudget,
    ISNULL((
        SELECT SUM(empSalary)
        FROM EMPLOYEE
        WHERE EMPLOYEE.deptCode = DEPARTMENT.deptCode
    ), 0) AS TotalSalaries,
    deptBudget - ISNULL((
        SELECT SUM(empSalary)
        FROM EMPLOYEE
        WHERE EMPLOYEE.deptCode = DEPARTMENT.deptCode
    ), 0) AS BudgetRemaining
FROM DEPARTMENT;

--B:
SELECT
    deptCode,
    deptName,
    deptBudget,
    TotalSalaries,
    BudgetRemaining
FROM (
    SELECT
        deptCode,
        deptName,
        deptBudget,
        ISNULL((
            SELECT SUM(empSalary)
            FROM EMPLOYEE
            WHERE EMPLOYEE.deptCode = DEPARTMENT.deptCode
        ), 0) AS TotalSalaries,
        deptBudget - ISNULL((
            SELECT SUM(empSalary)
            FROM EMPLOYEE
            WHERE EMPLOYEE.deptCode = DEPARTMENT.deptCode
        ), 0) AS BudgetRemaining
    FROM DEPARTMENT
) AS subquery
WHERE BudgetRemaining < 100000
ORDER BY deptCode;
