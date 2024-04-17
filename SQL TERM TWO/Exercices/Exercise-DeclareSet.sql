-- 1-2
DECLARE @DateOfBirth DATE;
DECLARE @DayOfWeek VARCHAR(20);

SET @DateOfBirth = '2004-08-28';
SET @DayOfWeek = DATENAME(WEEKDAY, @DateOfBirth);

SELECT CONVERT(VARCHAR, @DateOfBirth, 23) AS DateOfBirth;
SELECT @DayOfWeek AS DayOfWeek;

-- 3-6
USE [username_SportMotors]
GO

DECLARE @FullName NVARCHAR(100)
DECLARE @BillingAdress NVARCHAR(200)
SELECT @FullName = CONCAT(CustomerLastName + ' ', + CustomerFirstName),
       @BillingAdress = CONCAT(CustomerAddress + ' - ', + CustomerCity 
	   + ' - ', + StateAbbreviation + ' - ', + CustomerZipCode)
FROM SportCustomer;
GO

-- 7
USE [username_Ironwood]
GO