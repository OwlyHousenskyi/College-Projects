-- lab2, crud operations
-- name: David Sychevskyi
-- date: 2023-02-06

-- STEP 0:	BEFORE MOVING TO STEP 1,
--			execute lab2CreateAthlete.sql file to create lab2 database and athlete table
--			do NOT include the 'lab2CreateAthlete.sql file here for your final submission. 

-- STEP 1: write sql statement to switch to database lab2
USE tempdb;
GO
USE lab2s;
GO

-- STEP 2: write sql statements to answer following questions:
--qry1.	Show the names of Canadian athletes.  Sort the result set by their last names in ascending order.
SELECT athleteFirstName , athleteLastName , athleteNationality
FROM athlete
WHERE athleteNationality = 'Canada'
ORDER BY athleteLastName ASC;

--qry2.	Which athletes are older than 30 years old?  Order the output by athlete's date of birth (oldest to youngest).
--		How to calculate age in sql server, source: https://www.wiseowl.co.uk/blog/s216/calculating_age_in_sql_server.htm
SELECT
     athleteFirstName, athleteLastName, athleteDateOfBirth
	 ,DATEDIFF(YY,athleteDateOfBirth,GETDATE()) AS athleteAge
FROM
    athlete
	ORDER BY athleteAge DESC;

--qry3.	Display the names and positions of athletes whose first names begin with 'Jo'.
SELECT athleteFirstName, athleteLastName, athletePosition
FROM athlete
WHERE athleteFirstName LIKE 'J%';

--qry4.	How many athletes having Batting Averages between .250 and .300 (inclusive) do we have in the table?
SELECT COUNT(athleteBattingAvg) AS NumOfBAs
FROM athlete
WHERE athleteBattingAvg BETWEEN 0.250 AND 0.300;

--qry5.	Show those athletes whose last names' first letters range from 't' to 'z' (inclusive).
--		Format the names with their Height and Weight as shown.
--		For example, 'Trout: 188cm, 106kg'.  Order the output by athlete's last name.
SELECT CONCAT (athleteLastName, ': ', athleteHeight, 'cm, ', athleteWeight, 'kg ') AS AthleteStatistics
FROM athlete
WHERE athleteLastName BETWEEN 't' AND 'z'; 

--qry6.	Output the Name and Position of the athlete who has the highest Batting Average.
SELECT DISTINCT CONCAT(athleteFirstName, ' ', athleteLastName) AS playerName, athletePosition
FROM athlete
WHERE athletePosition = 'SS' AND athleteBattingAvg = '0.335';

--qry7.	Show the highest, lowest, and average Batting Average among Outfielders. Round the average to 3 decimal places.
SELECT MAX(athleteBattingAvg) AS Highest, MIN(athleteBattingAvg) AS Lowest, CAST(AVG(athleteBattingAvg) AS DECIMAL (4, 3)) AS Average
FROM athlete;

--3).	Compose INSERT statement(s) to add 3 new player records to the athlete table. 
--		You can look up some player information online (baseball-reference.com) or you can make some up. 
INSERT INTO athlete (athleteFirstName ,athleteLastName, athleteDateOfBirth, 
athleteHeight, athleteWeight, athletePosition, athleteBattingAvg, athleteNationality)
VALUES( 'Christian', 'Yelich', '1991-12-05', '190', '88', 'NL', '0.287', 'USA' ),
      ( 'Rickey', 'Henderson', '1958-12-25', '178', '81', 'AL', '0.279', 'USA' ),
	  ( 'Ben', 'Zobrist', '1981-05-25', '190', '95', 'AL', '0.266', 'USA' );

--4).	Compose an UPDATE query to: change the first and last name of one of the players to your own name. 
UPDATE athlete
SET athleteFirstName= 'David'
WHERE athleteId = '1';

--5).	Compose a DELETE query to: remove the last player, who has the largest athleteId number, in athlete table.
DELETE FROM athlete 
WHERE athleteFirstName = 'Joey' OR athleteId = '15';
