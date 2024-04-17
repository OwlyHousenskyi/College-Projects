--create and use a new database
DROP DATABASE IF EXISTS comAndDept
GO
CREATE DATABASE comAndDept
GO
USE comAndDept
GO
USE master
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
GO

-- PRACTISE TEST --
-- #1 --
CREATE FUNCTION udf_Salaries(@deptCode CHAR(4))
RETURNS DECIMAL(10,2)
AS BEGIN
   DECLARE @TotalSalaries DECIMAL(10,2)
   SELECT @TotalSalaries = ISNULL(SUM(empSalary), 0)
   FROM EMPLOYEE
   WHERE deptCode = @deptCode
   RETURN @TotalSalaries
END
GO
SELECT dbo.udf_Salaries('ACCT')

-- #2 --
CREATE VIEW view_department AS 
SELECT deptCode, deptName, deptBudget, 
       dbo.udf_Salaries(deptCode) AS TotalSalaries,
	   deptBudget - dbo.udf_Salaries(deptCode) AS Remaining
FROM DEPARTMENT
GO
SELECT * FROM view_department
GO

-- #3-4 --
CREATE TRIGGER EmployeeInsert
ON EMPLOYEE
AFTER INSERT AS BEGIN
      DECLARE @deptCode CHAR(4)
	  DECLARE @deptBudget DECIMAL(10,2)
	  SELECT @deptCode = deptCode FROM inserted
	  SELECT @deptBudget = deptBudget FROM DEPARTMENT
	         WHERE deptCode = @deptCode
	  -- FIND OUT THE NEW TOTAL SALARIES FOR THE DEPARTMENT --
	  DECLARE @TotalSalaries DECIMAL(10,2)
	  SELECT @TotalSalaries = dbo.udf_Salaries(@deptCode)
	  -- MAKE SURE THE DEPARTMENT IS NOT OVER BUDGET --
	  IF @TotalSalaries > @deptBudget -- OVER BUDGET --
	     PRINT 'Cannot add employee. Department is over budget'
		 ROLLBACK TRANSACTION