-- lab4, M:M
-- name: David Sychevskyi
-- date: 03/20/2023


-- STEP 1: write sql statement to create new database lab4 below, delete it if exists
USE tempdb;
GO
DROP DATABASE IF EXISTS lab4;
GO
CREATE DATABASE lab4;
GO
USE lab4;

-- create team table using CREATE and INSERT statements
CREATE TABLE team(
	teamId INT IDENTITY(1, 1),
	teamName VARCHAR(50) NOT NULL,
	teamCity VARCHAR(20) NOT NULL,
	teamState CHAR(2),
	teamCountry VARCHAR(6),
	teamManager VARCHAR(50),
	teamLeague CHAR(2) NOT NULL,
	teamStadium VARCHAR(30),
	CONSTRAINT pk_team_teamId PRIMARY KEY (teamId)
);
INSERT INTO team
VALUES
	('Toronto Blue Jays', 'Toronto', 'ON', 'Canada', 'Charlie Montoyo', 'AL', 'Rogers Centre'),
	('Chicago White Sox', 'Chicago', 'IL', 'USA', 'Rick Renteria', 'AL', 'Guaranteed Rate Field'),
	('Tampa Bay Rays', 'Tampa Bay', 'FL', 'USA', 'Kevin Cash', 'AL', 'Tropicana Field'),
	('Colorado Rockies', 'Denver', 'CO', 'USA', 'Bud Black', 'NL', 'Coors Field'),
	('Los Angeles Angels', 'Anaheim', 'CA', 'USA', 'Joe Maddon', 'AL', 'Angel Stadium of Anaheim'),
	('New York Yankees', 'New York', 'NY', 'USA', 'Aaron Boone', 'AL', 'Yankee Stadium'),
	('Pittsburgh Pirates', 'Pittsburgh', 'PA', 'USA', 'Derek Shelton', 'NL', 'PNC Park'),
	('Cincinnati Reds', 'Cincinnati', 'OH', 'USA', 'David Bell', 'NL', 'Great American Ball Park');

-- create athlete table using CREATE and INSERT statements
CREATE TABLE athlete(
	athleteId INT IDENTITY(1, 1),
	athleteFirstName VARCHAR(20) NOT NULL,
	athleteLastName VARCHAR(30) NOT NULL,
	athleteDateOfBirth DATE,
	athleteHeight SMALLINT,
	athleteWeight SMALLINT,
	athletePosition CHAR(2) NOT NULL,
	athleteBattingAvg DECIMAL(4, 3) DEFAULT 0.000,
	athleteNationality VARCHAR(30),
	teamId INT NOT NULL,
	CONSTRAINT pk_athlete_athleteId PRIMARY KEY (athleteId),
	CONSTRAINT fk_athlete_team FOREIGN KEY (teamId) REFERENCES team (teamId)
);
INSERT INTO athlete
VALUES
	('Vladimir', 'Guererro Jr.', '1999-03-16', 188, 113, '3B', 0.272, 'Canada', 1),
	('Bo', 'Bichette', '1998-03-05', 183, 83, 'SS', 0.311, 'USA', 1),
	('Cavan', 'Biggio', '1995-04-11', 188, 90, '2B', 0.234, 'USA', 1),
	('Travis', 'Shaw', '1990-04-16', 193, 104, '1B', 0.157, 'USA', 1),
	('Danny', 'Jansen', '1995-04-15', 188, 104, 'C', 0.207, 'USA', 1),
	('Randal', 'Grichuk', '1991-08-13', 188, 96, 'OF', 0.232, 'USA', 1),
	('Teoscar', 'Hernandez', '1992-10-15', 188, 92, 'OF', 0.230, 'Dominican Republic', 1),
	('Tim', 'Anderson', '1993-06-23', 185, 83, 'SS', 0.335, 'USA', 2),
	('Jose', 'Abreu', '1987-01-29', 190, 115, '1B', 0.284, 'Cuba', 2),
	('Kevin', 'Kiermaier', '1990-04-22', 185, 95, 'OF', 0.228, 'USA', 3),
	('Nolan', 'Arenado', '1991-04-16', 188, 97, '3B', 0.315, 'USA', 4),
	('Mike', 'Trout', '1991-08-07', 188, 106, 'OF', 0.291, 'USA', 5),
	('Aaron', 'Judge', '1992-04-26', 201, 127, 'OF', 0.272, 'USA', 6),
	('Giancarlo', 'Stanton', '1989-11-08', 198, 111, 'OF', 0.288, 'USA', 6),
	('Joey', 'Votto', '1983-09-10', 188, 99, '1B', 0.261, 'Canada', 8);
--	note: athlete.teamId is hard-coded here for simplicity purpose; the next line is a more robust way to populate teamId
--		e.g., for Vladimir Guererro Jr., use subquery to obtain teamId value based on its teamName
--	('Vladimir', 'Guererro Jr.', '1999-03-16', 188, 113, '3B', 0.272, 'Canada', (SELECT teamId FROM team WHERE teamName = 'Toronto Blue Jays')),

-- create award table using CREATE and INSERT statements
CREATE TABLE award(
	awardId INT IDENTITY(1, 1),
	awardName VARCHAR(30) NOT NULL,
	awardSponsor VARCHAR(100),
	CONSTRAINT pk_award_awardId PRIMARY KEY (awardId)
);
INSERT INTO award
VALUES
	('Most Valuable Player', 'Baseball Writers Association of America'),
	('Gold Glove', 'Rawlings'),
	('Silver Slugger', 'Hillerich & Bradsby'),
	('Rookie of the Year', 'Baseball Writers Association of America');


-- STEP 2: execute ALL statements above


-- STEP 3: create winner table using CREATE statement below
CREATE TABLE winner(
winnerId INT IDENTITY (1,1),
winnerYear SMALLINT NOT NULL,
CONSTRAINT pk_winner_winnerId PRIMARY KEY (winnerId),
athleteId INT NOT NULL,
CONSTRAINT fk_athlete_athleteId FOREIGN KEY (athleteId) REFERENCES athlete (athleteId),
awardId INT NOT NULL,
CONSTRAINT fk_award_awardId FOREIGN KEY (awardId) REFERENCES award (awardId),
CONSTRAINT uq_winner_athleteId_awardId UNIQUE (winnerYear, athleteId, awardId)
);

-- STEP 4: populate winner table using INSERT INTO statements below
INSERT INTO winner VALUES (2017, 14, 1),
                          (2014, 14, 3),
				          (2017, 14, 3),
				          (2017, 13, 4),
						  (2017, 13, 3),
						  (2013, 11, 2),
						  (2014, 11, 2),
						  (2015, 11, 2),
						  (2016, 11, 2),
						  (2017, 11, 2),
						  (2018, 11, 2),
						  (2019, 11, 2),
						  (2015, 11, 3),
						  (2016, 11, 3),
						  (2017, 11, 3),
						  (2018, 11, 3),
						  (2010, 15, 1),
						  (2011, 15, 2),
						  (2012, 12, 4),
						  (2014, 9, 4),
						  (2014, 9, 3),
						  (2018, 9, 3),
						  (2014, 12, 1),
						  (2016, 12, 1),
						  (2019, 12, 1),
						  (2015, 10, 2),
						  (2016, 10, 2),
						  (2019, 10, 2);
SELECT * FROM winner
ORDER BY winnerId;

-- STEP 5: execute the winner CREATE and INSERT INTO statements, which were created in STEPS 3 and 4.

-- STEP 6: compose SELECT statements below to answer the questions
-- preparation: create erd to familiarize with db tables

--qry1.	For both 'Rookie of the Year' and 'Most Valuable Player' awards,
--		show a list of award winners' names and the year in which they won.
--		Order the output by award name, and then by year from newest to oldest.

SELECT award.awardName, athlete.athleteFirstName, athlete.athleteLastName, winner.winnerYear
FROM ((winner
INNER JOIN award ON winner.awardId = award.awardId)
INNER JOIN athlete ON winner.athleteId = athlete.athleteId)
WHERE awardName IN ('Most Valuable Player', 'Rookie of the Year')
ORDER BY awardName;

--qry2. How many times has an outfielder won the Silver Slugger award?

SELECT COUNT(athlete.athletePosition) AS 'Number Of Wins'
FROM ((winner
INNER JOIN award ON winner.awardId = award.awardId)
INNER JOIN athlete ON winner.athleteId = athlete.athleteId)
WHERE athletePosition = 'OF' AND awardName = 'Silver Slugger'
GROUP BY athletePosition;

--qry3.	For each athlete, show how many awards he has won.  Include athletes who have not won any awards,
--		and ensure their total displays as zero (0).  Display the first 8 records only and show each athlete's
--		first and last name concatenated with their position, as shown in the sample output.
--		Order the output by number of awards won, from most to least, and then by athlete's last name.

SELECT CONCAT(athlete.athleteFirstName, ',', ' ', athlete.athleteLastName, ' ', '(', athlete.athletePosition, ')') AS 'Athlete', COUNT(*) AS 'Number Of Awards Won'
FROM ((winner
INNER JOIN award ON winner.awardId = award.awardId)
INNER JOIN athlete ON winner.athleteId = athlete.athleteId)
GROUP BY athlete.athleteFirstName, athlete.athleteLastName, athlete.athletePosition
ORDER BY COUNT(*) DESC;

--qry4.	How many years has it been since Mike Trout won Rookie of the Year last time?
SELECT (YEAR(GETDATE()) - winnerYear) AS 'Number Of Years'
FROM winner w
INNER JOIN athlete a ON a.athleteId = w.athleteId
INNER JOIN award aw ON w.awardId = aw.awardId
WHERE awardName = 'Rookie Of The Year' AND athleteFirstName = 'Mike';

--qry5.	Which teams have won 4 or more awards among all its listed athletes?
--		Show the team's name, city, and manager, along with its total number of awards won.
SELECT teamName, teamCity, teamManager, COUNT(winnerId) AS 'Number Of Awards Won'
FROM team t 
JOIN athlete a ON a.teamId = t.teamId
JOIN winner w ON w.athleteId = a.athleteId            
GROUP BY teamName, teamCity, teamManager
HAVING COUNT(winnerId) >= 4;