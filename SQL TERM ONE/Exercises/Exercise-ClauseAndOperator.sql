-- SELECT statement (Read/Retrieve operation, cRud)
-- sql clause: SELECT, FROM, WHERE, ORDER BY, TOP (n), DISTINCT
-- operators: ARITHMETIC, ASSIGNMENT, COMPARISON, LOGICAL, STRING operators

USE d1;
GO
--**ToC
--1** SELECT basic
--2** ARITHMETIC operator
--3** ASSIGNMENT operator, =
--4** LOGICAL operator, returns BIT
--5** STRING operator


--1** SELECT basic
-- syntax:
-- SELECT col1, col2, col3, ...		define:	PROJECTION (cols)
-- FROM tableName							source table(s)
-- WHERE condition							SELECTION CRITERIA (rows)
-- ORDER BY col1, col2;						sorting order in result set

SELECT *				-- asterisk (*) is a wild card, to select all cols from a table
FROM player;

SELECT *, 1, 2 + 3		-- comma (,) is a col separator in the result set
FROM player;

-- to display specific cols using SELECT clause (projection)
SELECT playerId, playerFirstName, playerLastName, playerScore
FROM player;

-- to display specific rows using WHERE clause (selection criteria)
SELECT *
FROM player
WHERE playerScore > 5000;

-- specific cols + specific rows (combination of projection and selection criteria)
SELECT playerId, playerFirstName, playerLastName, playerScore
FROM player
WHERE playerScore > 5000;

-- ORDER BY clause
SELECT * FROM player;
SELECT playerUserId, playerCity, playerScore, playerQuizDate
FROM player
ORDER BY playerCity;	-- default sorting order is ascending (ASC)

SELECT playerUserId, playerCity, playerScore, playerQuizDate
FROM player
ORDER BY playerCity, playerScore DESC, playerQuizDate ASC;	-- primary, secondary, tertiary, ..., sorting cols


-- TOP clause
SELECT TOP 3 playerUserId, playerScore
FROM player;

SELECT TOP (3) playerUserId, playerScore
FROM player
ORDER BY playerScore DESC;


-- DISTINCT clause
SELECT playerCity
FROM player
ORDER BY playerCity DESC;

SELECT DISTINCT playerCity
FROM player
ORDER BY playerCity DESC;

-- AS alias (different delimiters)
SELECT playerFirstName AS PlayersFirstName		-- no space in alias name
FROM player;

SELECT playerFirstName AS "Player's First Name"	-- ANSI standard
FROM player;

SELECT playerFirstName 'player''s First Name'	-- escape a character
FROM player;

SELECT playerFirstName[player's First Name]		-- Access legacy
FROM player;

-- which alias delimiter to use?
SELECT SUM("foo") FROM (SELECT 1 AS "foo") AS x;
SELECT SUM("foo") FROM (SELECT 1 AS "foo") AS "x";
SELECT SUM([foo]) FROM (SELECT 1 AS [foo]) AS [x];
SELECT SUM('foo') FROM (SELECT 1 AS 'foo') AS 'x';	-- syntax error



-- ***** SQLS operator *****
--2** ARITHMETIC operator
SELECT
	5 + 2,		-- addition
	5 - 2,		-- subtraction
	5 * 2,		-- multiplication
	5 / 2,		-- integer division (INT / INT -> INT)
	5.0 / 2,	-- division (DECIMAL / INT -> DECIMAL)
	5 % 2;		-- modulo

-- derive a value from an existing col
SELECT	playerUserId,										--							existing col playerUserId
		playerKillRatio,									--							existing col playerKillRatio
		playerKillRatio * 100 AS "playerKillRatioPercent"	-- new col obtained from	existing col playerKillRatio
FROM player;


GO
--3** ASSIGNMENT operator, =
DECLARE @sum INT;
SET @sum = 3 + 5;
SELECT @sum;
GO

UPDATE player
SET playerStreet = '1 Main St'
WHERE playerId = 4;


--4** COMPARISON operator
SELECT * FROM player WHERE playerKillRatio = 0.5;
SELECT * FROM player WHERE playerKillRatio > 0.5;
SELECT * FROM player WHERE playerKillRatio < 0.5;
SELECT * FROM player WHERE playerKillRatio >= 0.5;
SELECT * FROM player WHERE playerKillRatio <= 0.5;
SELECT * FROM player WHERE playerKillRatio <> 0.5;


--4** LOGICAL operator, returns BIT
-- AND, display players who live in Thorold and their kill ratio is >= 0.8
SELECT * FROM player
WHERE playerCity = 'Thorold' AND playerKillRatio >= 0.8;

-- OR, display players who live in Thorold and Niagara Falls --> who live in Thorold + who live Niagara Falls
SELECT * FROM player
WHERE playerCity = 'Thorold' OR playerCity = 'Niagara Falls';

-- NOT, negate
SELECT playerCity FROM player
WHERE playerCity NOT LIKE 'T%';

SELECT playerCity FROM player
WHERE NOT playerCity = 'Thorold';

-- BETWEEN
SELECT * FROM player
WHERE playerScore BETWEEN 1000 AND 2000;
-- equivalent to BETWEEN
SELECT * FROM player
WHERE playerScore >= 1000 AND playerScore <= 2000;

-- IN
SELECT * FROM player
WHERE playerCity IN ('Thorold', 'Niagara Falls');
-- equivalent to IN
SELECT * FROM player
WHERE playerCity = 'Thorold' OR playerCity = 'Niagara Falls';

-- LIKE, string pattern match
SELECT * FROM player
WHERE playerCity LIKE 's%';		-- city's first letter starts 's' and followed by 0 or more letters

SELECT * FROM player
WHERE playerTitle LIKE '%r%';	-- title contains letter 'r', it can be located at start-, middle-, or end-position of the string

-- discussion:
SELECT * FROM player
WHERE playerCity LIKE 'Thorold';	-- good or bad practice?


--5** STRING operator
-- string concatenation, derive a new value from existing values
SELECT playerFirstName + ' ' + playerLastName AS "playerFullName"
FROM player;

-- %, zero or more characters
SELECT playerFirstName FROM player
WHERE playerFirstName LIKE 'a%';			-- finds player's first name starts with 'a'

-- _,  single character
SELECT playerTitle FROM player
WHERE playerTitle LIKE 'M__';				-- finds player's title starts with 'M' followed by exact 2 letters

-- [], any single character within the brackets
SELECT playerFirstName FROM player
WHERE playerFirstName LIKE 'a%[i, v]%';		-- finds player's first name starts with 'a' AND contains 'i' or contains 'v'

-- ^, any character not in the brackets
SELECT playerFirstName FROM player
WHERE playerFirstName LIKE 'a[^vm]%';		-- finds player's first name starts with 'a' AND 2nd letter is not 'v', nor 'm'
--WHERE playerFirstName LIKE '[^a-m]%';	-- first name does not start with 'a' to 'm'

-- -, a range of characters
SELECT playerFirstName FROM player
WHERE playerFirstName LIKE 'a[a-m]%';		-- finds player's first name starts with 'a' AND 2nd letter is 'a-m', inclusive

SELECT * FROM player;



-- extra
-- bitwise NOT operator, use caret ~
--		10-based		2-based		16-based (hexadecimal)
--		4:				00000100	0x00000004
SELECT ~ 4;		-- >	11111011 = -5
--		6:				00000110	0x00000006
SELECT ~ 6;		-- >	11111001 = -7
--		16:				00010000	0x00000010
SELECT ~ 16;	-- >	11101111 = -17


-- bitwise XOR (exclusive or) operator, use caret ^
--		10-based		2-based		16-based (hexadecimal)
--		6:				00000110	0x00000006
--		4:				00000100	0x00000004
SELECT 6 ^ 4;	-- >	00000010 = 2
--		16:				00010000	0x00000010
--		4:				00000100	0x00000004
SELECT 16 ^ 4;	-- >	00010100 = 20


