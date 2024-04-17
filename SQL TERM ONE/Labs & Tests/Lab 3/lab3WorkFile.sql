-- lab3, 1:M
-- name: David Sychevskyi
-- date: 02/13/2023


-- STEP 1: write sql statement to create new database lab3 below, delete it if exists

USE tempdb;
GO
DROP DATABASE IF EXISTS lab3;
GO
CREATE DATABASE lab3;
GO
USE lab3;
GO

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
GO

-- STEP 2: execute ALL statements above

-- STEP 3: modify athlete CREATE TABLE statement below
CREATE TABLE athlete(
	athleteId INT IDENTITY(1, 1),
	athleteFirstName VARCHAR(50) NOT NULL,
	athleteLastName VARCHAR(50) NOT NULL,
	athleteDateOfBirth DATE,
	athleteHeight SMALLINT,
	athleteWeight SMALLINT,
	athletePosition CHAR(2) NOT NULL,
	athleteBattingAvg DECIMAL(4, 3) DEFAULT 0.000,
	athleteNationality VARCHAR(50),
	CONSTRAINT pk_athlete_athleteId PRIMARY KEY (athleteId)
);



-- STEP 4: modify the athlete INSERT INTO statement below
INSERT INTO athlete
VALUES
	('Vladimir', 'Guererro Jr.', '1999-03-16', 188, 113, '3B', 0.272, 'Canada'),
	('Bo', 'Bichette', '1998-03-05', 183, 83, 'SS', 0.311, 'USA'),
	('Cavan', 'Biggio', '1995-04-11', 188, 90, '2B', 0.234, 'USA'),
	('Travis', 'Shaw', '1990-04-16', 193, 104, '1B', 0.157, 'USA'),
	('Danny', 'Jansen', '1995-04-15', 188, 104, 'C', 0.207, 'USA'),
	('Randal', 'Grichuk', '1991-08-13', 188, 96, 'OF', 0.232, 'USA'),
	('Teoscar', 'Hernandez', '1992-10-15', 188, 92, 'OF', 0.230, 'Dominican Republic'),
	('Tim', 'Anderson', '1993-06-23', 185, 83, 'SS', 0.335, 'USA'),
	('Jose', 'Abreu', '1987-01-29', 190, 115, '1B', 0.284, 'Cuba'),
	('Kevin', 'Kiermaier', '1990-04-22', 185, 95, 'OF', 0.228, 'USA'),
	('Nolan', 'Arenado', '1991-04-16', 188, 97, '3B', 0.315, 'USA'),
	('Mike', 'Trout', '1991-08-07', 188, 106, 'OF', 0.291, 'USA'),
	('Aaron', 'Judge', '1992-04-26', 201, 127, 'OF', 0.272, 'USA'),
	('Giancarlo', 'Stanton', '1989-11-08', 198, 111, 'OF', 0.288, 'USA'),
	('Joey', 'Votto', '1983-09-10', 188, 99, '1B', 0.261, 'Canada');

-- STEP 5: execute the athlete CREATE and INSERT INTO statements, which were modified in STEPS 3 and 4.









-- STEP 6: compose sql statements to answer the following questions

--qry1.	For each team, display the team name, manager, and how
--		many athletes the team has. Order the results by team name.
SELECT teamName, teamManager
FROM team;

--qry2.	Which teams have an average athlete age under 30?
--		Display the team name, city, and average athlete age.
SELECT teamName, teamCity
FROM team
WHERE teamName ='Toronto Blue Jays';

--qry3.	Which teams have more than one outfielder on their roster?
SELECT team.teamName, athlete.athleteFirstName
FROM team
INNER JOIN athlete ON 
team.teamId = athlete.athleteId;

--qry4.	Which team has the youngest athlete, and what is that athlete's name?
SELECT teamName , athleteFirstName
FROM team
WHERE teamName = 'Toronto Blue Jays'

--qry5.	What is the average of athleteBattingAvg for each team?
--		Display each team name, and its team batting average.
--		Format the batting average to three decimal places.


--qry6.	Display a list of athletes who were born in a different country
--		than that which their team is based.
--		(For example, a Canadian athlete who plays for a team based in USA.)
--		Put the country names in the output also.


--qry7.	Who is the best batter (highest batting average) in each league?
--		Display the league, athlete's name, and their batting average.

