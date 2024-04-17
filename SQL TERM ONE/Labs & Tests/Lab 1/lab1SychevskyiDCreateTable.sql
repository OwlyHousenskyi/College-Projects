USE tempdb;
GO

DROP DATABASE IF EXISTS lab1;
GO

CREATE DATABASE lab1;
GO

CREATE TABLE athlete(
		athleteId INT IDENTITY(1,1),
		athleteUserId VARCHAR(40) UNIQUE, 
		athleteFirstName VARCHAR(25) NOT NULL,
		athleteLastName VARCHAR(30) NOT NULL,
		athleteDateOfBirth DATE NOT NULL,
		athleteHeight TINYINT NOT NULL,
		athleteWeight TINYINT NOT NULL, 
		athleteCountry VARCHAR(35) NOT NULL,
		athleteState VARCHAR(30) NOT NULL,
		athleteCity VARCHAR(35) NOT NULL,
		athletePlayingPosition VARCHAR(20) NOT NULL,
 		athleteBattingAverage DECIMAL(4,3) NULL,
		athletePlayingCondition BIT NOT NULL,

		CONSTRAINT pk_athlete_athleteId PRIMARY KEY(athleteId)
);

SELECT * 
FROM athlete