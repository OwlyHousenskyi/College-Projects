-- lab2, create db lab2 and athlete table
USE tempdb;
GO
DROP DATABASE IF EXISTS lab2s;
GO
CREATE DATABASE lab2s;
GO
USE lab2s;
GO

-- define table
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
-- populate table with 15 records
INSERT INTO athlete
VALUES
	('Vladimir', 'Guererro Jr.', '1999-03-16', 188, 113, '3B', 0.272, 'Canada'),
	('Bo', 'Bichette', '1998-03-05', 183, 83, 'SS', 0.311, 'USA'),
	('Cavan', 'Biggio', '1995-04-11', 188, 90, '2B', 0.234, 'USA'),
	('Travis', 'Shaw', '1990-04-16', 193, 104, '1B', 0.157, 'USA'),
	('Danny', 'Jansen', '1995-04-15', 188, 104, 'C', 0.207, 'USA'),
	('Randal', 'Grichuk', '1991-08-13', 188, 96, 'OF', 0.232, 'USA'),
	('Teoscar', 'Hernandez', '1992-10-15', 188, 92, 'OF', 0.23, 'Dominican Republic'),
	('Tim', 'Anderson', '1993-06-23', 185, 83, 'SS', 0.335, 'USA'),
	('Jose', 'Abreu', '1987-01-29', 190, 115, '1B', 0.284, 'Cuba'),
	('Kevin', 'Kiermaier', '1990-04-22', 185, 95, 'OF', 0.228, 'USA'),
	('Nolan', 'Arenado', '1991-04-16', 188, 97, '3B', 0.315, 'USA'),
	('Mike', 'Trout', '1991-08-07', 188, 106, 'OF', 0.291, 'USA'),
	('Aaron', 'Judge', '1992-04-26', 201, 127, 'OF', 0.272, 'USA'),
	('Giancarlo', 'Stanton', '1989-11-08', 198, 111, 'OF', 0.288, 'USA'),
	('Joey', 'Votto', '1983-09-10', 188, 99, '1B', 0.261, 'Canada');

-- SELECT * FROM athlete;
