-- sql functions

USE d1;
GO
EXEC sp_changedbowner 'sa';
GO

--**ToC
--1** string functions https://www.w3schools.com/sql/sql_ref_sqlserver.asp
--2** aggregate functions
--3** math/numeric functions
--4** date functions
--5** miscellaneous (advanced) functions
--6** challenges
--7** extra

SELECT * FROM player;
--1** string functions https://www.w3schools.com/sql/sql_ref_sqlserver.asp
-- syntax: CONCAT(str1, str2, ...., strN), where maxN = 254
-- to join 2 or more string values in an end-to-end manner
-- q1, to concatenate 2 cols ('Joe', 'Doe') into a single col ('Joe Doe')
SELECT playerFirstName, playerLastName
FROM player;
-- method 1
SELECT playerFirstName + ' ' + playerLastName AS "playerFullName"
FROM player;
-- method 2
SELECT CONCAT(playerFirstName, ' ', playerLastName) AS "playerFullName"
FROM player;

-- method 1.2
SELECT playerUserId + ', ' + playerScore AS "player performance"		-- err: diff data types using arithmetic operator
FROM player;
-- method 2.2
SELECT CONCAT(playerUserId, ', ', playerScore) AS "player performance"	-- works
FROM player;
-- discussion: to use CONCAT() function or + ?



-- syntax: FORMAT(value, format[, culture]).  VALUE is either NUMERIC or DATE/TIME
-- Returns a value formatted with the specified format and optional culture.
SELECT playerScore, playerKillRatio
FROM player;

SELECT playerScore, FORMAT(playerScore, '#,###.00')						-- to display score with thousand separators + 2-digit after decimal point
FROM player;

SELECT playerKillRatio, FORMAT(playerKillRatio, 'N2'), FORMAT(playerKillRatio, '0')	-- FORMAT function DOES round-up/down
FROM player;

--q2, how to format phone # as (123) 456-7890?
SELECT FORMAT(playerPhone, '(###) ###-####')	-- error: string data cannot be formatted
FROM player;

--										e.g.,	9056825216
--												1234567890
SELECT playerPhone, CONCAT(
							'(',
							SUBSTRING(playerPhone, 1, 3), ') ',
							SUBSTRING(playerPhone, 4, 3), '-',
							SUBSTRING(playerPhone, 7, 4)
					) AS "Player's Phone Number"
FROM player;
--q2+: what if we want to get rid of records: playerPhone IS NULL?



-- LEN(string)
SELECT LEN(playerPhone)
FROM player;

-- REVERSE(string)
SELECT REVERSE(playerPhone)
FROM player;

-- UPPER(string)
SELECT UPPER(playerCity)
FROM player;

-- more string functions
DECLARE @strTest NVARCHAR(35) = 'hello, world!';
							  -- 1234567890123
SELECT
	CHARINDEX('o', @strTest) AS "charindexValue1",	-- CHARINDEX(substring, string, start), position value of 1st 'o'
	CHARINDEX('or', @strTest) AS "charindexValue2",	-- position value of 1st 'or'
	CHARINDEX('oa', @strTest) AS "charindexValue3",	-- position value of 1st 'oa', not found (FALSE)
	SUBSTRING(@strTest, 2, 3) AS "substringValue",	-- SUBSTRING(string, start, length)
	LEFT(@strTest, 2) AS "left2CharValue";			-- LEFT(string, number_of_chars)



--2** aggregate functions
-- AVG
SELECT AVG(playerScore) AS "playerAverageScore"
FROM player;

-- MAX, MIN, SUM, COUNT
SELECT
	MAX(playerScore) AS "Player's Max Score",
	MIN(playerScore) AS "Player's Min Score",
	SUM(playerScore) AS "Player's Total Score",
	COUNT(*) AS "number of players"
FROM player;

-- function can be nested; nesting order may matter
-- q3, what's the avg score for all players?
SELECT
	SUM(playerScore) AS "sum1",								-- 80292
	COUNT(playerScore) AS "count1",							-- 19
	AVG(playerScore) AS "avg0"								-- 4225, the correct avg is = 80292 / 19 = 4225.894736 ~= 4225.89 (problematic?)
FROM player;

--q3+: how do we get 4225.89?
SELECT
	AVG(playerScore) AS "avg1",									-- 4225			}, less correct
	AVG(CAST(playerScore AS DECIMAL(6, 2))) AS "avg2",			-- 4225.894736	}, correct
	CAST(AVG(playerScore) AS DECIMAL(6, 2)) AS "avg3",			-- 4225.00		}, less correct
	CAST(AVG(CAST(playerScore AS DECIMAL(6, 2))) AS DECIMAL(6, 2)) AS "avg4",	-- format method 1
	FORMAT(AVG(CAST(playerScore AS DECIMAL(6, 2))), '#,###.00') AS "avg5"		-- format method 2
FROM player;
--q3++: is the last digit '9' in 4225.89 rounded or truncated?


--3** math/numeric functions
SELECT
	SQUARE(9)	AS "9 is squared",
	SQRT(9)		AS "square root of 9",
	PI()		AS "pi value",
	EXP(1)		AS "Euler value",
	RAND()		AS "random num between 0 and 1";

-- refer to the end of this file for FLOOR(), CEILING(), ROUND() functions



--4** date functions
-- datetime2 granularity to 100 nanosecond (yyyy-mm-dd hour:minute:second.millisecondMicrosecondNanosecond)
--																		0.123        456        7)

-- GETDATE
SELECT GETDATE() AS "currentDateTime";

-- DATEADD
-- syntax: DATEADD(interval , number , date)
DECLARE @date1 DATE = '2021-01-26 11:22:33.555';
SELECT
	DATEADD(YEAR, 1, @date1) AS "oneYearLater",
	DATEADD(MONTH, -3, @date1) AS "threeMonthsAgo",
	DATEADD(DAY, 2, @date1) AS "twoDaysLater",
	DATEADD(HOUR, 1, @date1) AS "oneHourLater";	-- error, but why?  hint: look into	DECLARE @date1 DATE = '2021-01-26 11:22:33.555';

-- DATEDIFF
-- syntax: DATEDIFF(interval , startDatetime , endDatetime)
DECLARE @dt1 DATETIME2 = '2021-12-31T23:59:59';
DECLARE @dt2 DATETIME2 = '2022-01-01T00:00:00';
SELECT
	DATEDIFF(YEAR,		@dt1, @dt2) AS "yearDiff",
	DATEDIFF(MONTH,		@dt1, @dt2) AS "monthDiff",
	DATEDIFF(DAY,		@dt1, @dt2) AS "dayDiff",
	DATEDIFF(HOUR,		@dt1, @dt2) AS "hourDiff",
	DATEDIFF(MINUTE,	@dt1, @dt2) AS "minuteDiff",
	DATEDIFF(SECOND,	@dt1, @dt2) AS "secondDiff";

-- how to calculate age using DATEDIFF function?
DECLARE @date3 DATE = '2012-09-28';		-- date of birth
DECLARE @date4 DATE = '2022-09-27';		-- today's date 1
--DECLARE @date4 DATE = '2022-09-29';	-- today's date 2
SELECT
	DATEDIFF(YEAR, @date3, @date4) AS "age1",
	DATEDIFF(DAY, @date3, @date4) / 365.25 AS "age2",
	FLOOR(DATEDIFF(DAY, @date3, @date4) / 365.25) AS "age3";

-- DATEPART
SELECT DATEPART(YEAR, playerQuizDate) AS "playerQuizDateYearPart"
FROM player;

-- DATENAME
SELECT
	DATENAME(MONTH, playerQuizDate) AS "playerQuizDateMonthName1",
	CAST(DATENAME(MONTH, playerQuizDate) AS CHAR(3)) AS "playerQuizDateMonthName2"
FROM player;


--5** miscellaneous (advanced) functions
-- CAST
-- convert data type/size from one to another, ANSI-SQL standard
SELECT
	playerKillRatio,	-- DECIMAL(3, 2)
	CAST(playerKillRatio AS DECIMAL(2, 1))
FROM player;

-- CONVERT
-- convert data type/size from one to another, not ANSI-SQL standard
SELECT
	playerKillRatio,	-- DECIMAL(3, 2)
	CONVERT(DECIMAL(2, 1), playerKillRatio)	-- potentially data loss
FROM player;

-- NULL is not 0, nor is a function, NULL is UNKNOWN
SELECT playerUserId, playerPhone
FROM player
WHERE playerPhone <> NULL;	-- fails
--WHERE playerPhone IS NOT NULL;	-- works, IS NULL is another logical operator in sqls
--WHERE NOT playerPhone IS NULL;	-- works

-- ISNULL(checkExpr, replaceVal)
--							if checkExpr IS NULL
--								return replaceVal
--							else
--								return checkExpr
SELECT
	ISNULL(NULL, 'gaming') AS "Replace Val",
	ISNULL(2 + 3, 'gaming') AS "Check Expr";
SELECT
	playerUserId,
	playerPhone,
	ISNULL(playerPhone, 'UNKNOWN') AS "playerNewPhone"
FROM player
WHERE playerPhone IS NULL;


-- NULLIF(expr1, expr2)
--							if expr1 = expr2
--								return NULL
--							else
--								return expr1
SELECT
	NULLIF(1, 1) AS "Res1",
	NULLIF(1, '1') AS "Res2",
	NULLIF('A', 'a') AS "Res3",
	NULLIF(2, 3) AS "Res4";	-- returns 1st expr value


-- ISNUMERIC(expression), returns BIT
SELECT
	ISNUMERIC(1) AS "Res1",
	ISNUMERIC(-1.5) AS "Res2",
	ISNUMERIC('0.1') AS "Res3",
	ISNUMERIC('a') AS "Res4",
	ISNUMERIC(NULL) AS "Res5";

SELECT
	playerUserId,
	ISNUMERIC(playerPhone)
FROM player
WHERE playerId >= 19;


--6** challenges
-- challenge 1: separate '123 Main Street South' into 4 cols: 123, Main, Street, South

-- challenge 2: separate '1 Niagara Parkway Blvd S' into 4 cols: 1, Niagara Parkway, St, S

-- challenge 3: how to separate address col into 4 cols, given table t?
CREATE TABLE t(
	tId INT,
	tAdd VARCHAR(30),
	CONSTRAINT pk_t_tId PRIMARY KEY (tId)
);
INSERT INTO t
VALUES
	(1, '123 Main Street South'),
	(2, '1 Niagara Parkway Blvd S');


-- challenge+, how to separate street col into 4 cols, given a table t2:
--		All street addresses is in a single col with 2 formats:
--			1. Number Name Suffix Direction
--			2. Number Name Suffix
--		Street name may contain multiple words
--	Compose SQL statements to separate street col into 4 col: streetNumber, streetName, streetSuffix, and streetDir
CREATE TABLE t2(
	t2Id INT,
	t2Street VARCHAR(50),
	CONSTRAINT pk_t2_tId PRIMARY KEY (t2Id)
);
INSERT INTO t2
VALUES
	(1, '123 Main Street South'),
	(2, '1 Niagara Parkway Blvd S'),
	(3, '23 King St.'),
	(4, '6789 Queen Anne Ave.');











--7** extra

-- format date: https://docs.microsoft.com/en-us/sql/t-sql/functions/format-transact-sql?view=sql-server-ver15
DECLARE @todaysDate DATETIME = GETDATE();
SELECT
	@todaysDate,
	FORMAT(@todaysDate, 'd') AS "entire date 1",
	FORMAT(@todaysDate, 'D') AS "entire date 2",
	FORMAT(@todaysDate, 'd', 'US') AS "US English Result",
	FORMAT(@todaysDate, 'D', 'GB') AS "Great Britain English Result",
	FORMAT(@todaysDate, 'd', 'DE') AS "German Result 1",
	FORMAT(@todaysDate, 'd', 'CN') AS "Simplified Chinese (PRC) Result",
	FORMAT(@todaysDate, 'yyyy/MM/dd') AS "Custom Result",
	FORMAT(@todaysDate, 'yyyy-MM-ddThh:mm:ss:tt') AS "ISO8601 Result",
	FORMAT(@todaysDate, 'YYYY-mm-DD') AS "why not working?";	-- ?
-- case 'insensitivity' does not always apply ...
--d:	display entire date in numeric format
--D:	display entire date spelled out
--dd:	day of month from 01-31
--dddd:	weekday spelled out
--MM:	month number from 01-12
--MMM:	month name abbreviated
--MMMM:	month spelled out
--yy:	year with two digits
--yyyy:	year with four digits
--hh:	hour from 01-12
--HH:	hour from 00-23
--mm:	minute from 00-59
--ss:	second from 00-59
--tt:	display either AM or PM






-- FLOOR(), CEILING(), ROUND() functions
-- FLOOR, returns the largest INTEGER value that is smaller than or equal to a number
-- e.g.,	FLOOR:		5.8 -> 5, 6.2 -> 6, 6.0 -> 6
--			CEILING:	5.8 -> 6, 6.2 -> 7, 6.0 -> 6
SELECT
	playerKillRatio,
	FLOOR(playerKillRatio) AS "killRatioFloor",
	CEILING(playerKillRatio) AS "killRatioCeiling"
FROM player;

-- ROUND(number, decimals[, operation])
--  decimals: rounds a number to a specified number of decimal places
--	operation is Optional
--		If 0 (default), rounds
--		If other than 0, truncates
DECLARE @decVal AS DECIMAL(6, 3) = 123.456;
SELECT
	@decVal AS "v1",

	ROUND(@decVal, 0) AS "v2",		-- rounds to 0 digit AFTER decimal point
	ROUND(@decVal, 1) AS "v3",
	ROUND(@decVal, 2) AS "v4",

	ROUND(@decVal, -1) AS "v5",		-- rounds to the 1st digit BEFORE deciaml point
	ROUND(@decVal, -2) AS "v6",

	ROUND(@decVal, 1, 0) AS "v7",	-- 1 digit after decimal, rounded (0)
	ROUND(@decVal, 1, 1) AS "v8";	-- 1 digit after decimal, truncated (1)
