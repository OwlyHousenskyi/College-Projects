--drop the tables if they already exist

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLOYEE]') AND type in (N'U'))
	DROP TABLE [dbo].[EMPLOYEE]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEPARTMENT]') AND type in (N'U'))
DROP TABLE [dbo].[DEPARTMENT]
GO

--Write your CREATE statement for the DEPARTMENT table here.

CREATE TABLE DEPARTMENT(
    deptCode CHAR(4) PRIMARY KEY,
	deptName VARCHAR(30) NOT NULL,
	deptBudget DECIMAL(10,2) CHECK(deptBudget BETWEEN 5000.00 AND 999999.99)
);

--Write your CREATE statement for the EMPLOYEE table here.

CREATE TABLE EMPLOYEE(
    empID INT IDENTITY(1,1) PRIMARY KEY,
	empFirst VARCHAR(25) NOT NULL,
	empLast VARCHAR(30) NOT NULL,
	empTitle VARCHAR(25),
	empSalary DECIMAL(9,2),
	empStart DATE,
	deptCode CHAR(4) NOT NULL,
	FOREIGN KEY (deptCode) REFERENCES DEPARTMENT(deptCode)
);

--Once the tables are created, execute these INSERT statements:
INSERT INTO DEPARTMENT 
	(deptCode, deptName, deptBudget) 
VALUES 
	('ACCT','Accounting',200000),
	('ISYS','Information Systems',500000),
	('MKTG','Marketing',170000),
	('PERS','Personnel',80000);


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
	('Ned','Horton','Programmer',100001,'1990/10/9', 'ISYS');

--Queries for Review and Exploration:

--1. Select the employee number and name in Formal Name format (Last name, comma, first name), 
--along with the job title and department code. 
--Sort the output by seniority with the most senior employee first. 

SELECT CONCAT(empLast + ' ', + empFirst + ' - ', + empTitle + ' - ' + deptCode) AS 'Worker'
FROM EMPLOYEE
ORDER BY empStart;

--2. List the job titles of all employees that make more than $50,000. Show each job title only once.

SELECT CONCAT(empFirst + ' ', + empLast + ' - ', + empTitle) AS 'Budget'
FROM EMPLOYEE
WHERE empSalary >= 50000;

--3. For departments that have budgets greater than or equal to $200,000,
--show the department name, employee list, which includes the employee salary
--Order the output by department name first, then by employee last and first names

SELECT CONCAT(DEPARTMENT.deptName + ' - ' + EMPLOYEE.empFirst + ' ', + EMPLOYEE.empLast) AS 'Employee List'
FROM EMPLOYEE
INNER JOIN DEPARTMENT ON EMPLOYEE.empID = EMPLOYEE.empID
WHERE deptBudget >= 200000
ORDER BY deptName, empLast, empFirst;

--4. Which managers or programmers have the pattern 'tt' in their last name
--and earn more than $80,000?

SELECT CONCAT(empTitle + ' - ', + empLast + ' ', + empFirst) AS 'Who makes 80,000 and more?'
FROM EMPLOYEE
WHERE empTitle = 'Manager' OR empTitle = 'Programmer'
AND empLast LIKE '%tt%'
AND empSalary >= 80000;

--5. For each department, list the name and budget as well as a count of how many employees are
--in the department. Make sure that all departments are listed, even if they do not currently have
--any employees.

SELECT DEPARTMENT.deptName, DEPARTMENT.deptBudget, COUNT(EMPLOYEE.empFirst) AS 'Number Of Employers'
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON EMPLOYEE.empID = EMPLOYEE.empID
GROUP BY DEPARTMENT.deptName, DEPARTMENT.deptBudget;

--6. Same query as above, but also show the total salary cost for all employees in each department.
--Ensure all departments are listed. Display a zero for null values.

SELECT DEPARTMENT.deptName, SUM(EMPLOYEE.empSalary) AS 'Sum Of Money'
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON EMPLOYEE.empID = EMPLOYEE.empID
GROUP BY DEPARTMENT.deptName;

--7. For each employee, output their formal name and how many years they have been with the company. 
--Order the results by employee last name, then first name.

SELECT CONCAT(empLast + ' ', + empFirst) AS 'Name', DATEDIFF(YEAR, empStart, '2023/06/12') AS 'Years Working'
FROM EMPLOYEE
ORDER BY empLast;

