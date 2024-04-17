-- LAB 4 WORKING -- 

USE CanadaSummerGames_Simple
GO

-- #A --

DROP VIEW IF EXISTS athleteStats
GO

CREATE VIEW athleteStats AS 
SELECT CONCAT(FirstName, ' ', MiddleName, '.', LastName) AS FullName, 
       AthleteCode, FORMAT(DOB, 'MMMM, yyyy') AS AgeOfAthlete, Height, 
	   [Weight], MediaInfo, EMail, [RowVersion], ContingentID, GenderID, 
	   [g].[Name] AS 'GenderName', [c].[Name] AS 'ContingentName' 
FROM Athlete
INNER JOIN Gender g ON Athlete.GenderID = g.ID
INNER JOIN Contingent c ON Athlete.ContingentID = c.ID
GO

-- #B --
-- 1)Select * procedure --

DROP PROCEDURE IF EXISTS StandardProcSelect
GO

CREATE PROCEDURE StandardProcSelect 
AS
BEGIN
SELECT * FROM athleteStats
END
GO

-- 2)Insert procedure --

DROP PROCEDURE IF EXISTS InsertProcedure
GO

CREATE PROCEDURE InsertProcedures
   @FirstName NVARCHAR(50),
   @MiddleName NVARCHAR(50),
   @LastName NVARCHAR(100),
   @AthleteCode NVARCHAR(7),
   @DOB DATETIME2(7),
   @Height FLOAT,
   @Weight FLOAT ,
   @MediaInfo NVARCHAR(2000),
   @EMail NVARCHAR(150),
   @RowVersion TIMESTAMP,
   @ContingentID INT,
   @GenderID INT
AS
BEGIN
   INSERT INTO dbo.Athlete	 
   (FirstName, MiddleName, LastName, AthleteCode, DOB, Height, [Weight], 
    MediaInfo, EMail, [RowVersion], ContingentID, GenderID)

   VALUES
   (@FirstName, @MiddleName, @LastName, @AthleteCode, @DOB, @Height, @Weight, 
    @MediaInfo, @EMail, @RowVersion, @ContingentID, @GenderID);
END
GO

-- 3)Update procedure --

DROP PROCEDURE IF EXISTS UpdateProcedure
GO

CREATE PROCEDURE UpdateProcedure
    @ID INT,
    @FirstName NVARCHAR(50),
    @MiddleName NVARCHAR(50),
    @LastName NVARCHAR(100),
    @AthleteCode NVARCHAR(7),
    @DOB DATETIME2(7),
    @Height FLOAT,
    @Weight FLOAT,
    @MediaInfo NVARCHAR(2000),
    @EMail NVARCHAR(150),
    @ContingentID INT,
    @GenderID INT,
    @OriginalRowVersion TIMESTAMP,
    @NewRowVersion TIMESTAMP OUTPUT
AS
BEGIN
    UPDATE dbo.Athlete SET
    FirstName = @FirstName,
    MiddleName = @MiddleName,
    LastName = @LastName,
    AthleteCode = @AthleteCode,
    DOB = @DOB,
    Height = @Height,
    [Weight] = @Weight,
    MediaInfo = @MediaInfo,
    EMail = @EMail,
    ContingentID = @ContingentID,
    GenderID = @GenderID

WHERE
    ID = @ID AND [RowVersion] = @OriginalRowVersion;

IF @@ROWCOUNT > 0
    SELECT @NewRowVersion = [RowVersion]
    FROM dbo.Athlete
    WHERE ID = @ID;
END

-- 4)delete procedure  --

DROP PROCEDURE IF EXISTS DeleteProcedureID
GO

CREATE PROCEDURE DeleteProcedureID
    @ID INT
AS
BEGIN
    DELETE FROM dbo.Athlete WHERE ID = @ID;
END

-- 5)Get ID --

DROP PROCEDURE IF EXISTS GetIdProc
GO

CREATE PROCEDURE GetIdProc
    @ID INT
AS
BEGIN
    SELECT * FROM dbo.Athlete WHERE ID = @ID;
END
GO

-- #C --

DROP PROCEDURE IF EXISTS SelectByXProcedure
GO

CREATE PROCEDURE SelectByXProcedure
    @ContingentID INT = NULL,
    @GenderID INT = NULL,
    @FullNameFilter NVARCHAR(100) = NULL,
    @DOBAfter DATE = NULL,
    @DOBBefore DATE = NULL
AS
BEGIN
    SELECT *
    FROM dbo.athleteStats
    WHERE
        (@ContingentID IS NULL OR ContingentID = @ContingentID)
        AND (@GenderID IS NULL OR GenderID = @GenderID)
        AND (@FullNameFilter IS NULL OR FullName LIKE '%' + @FullNameFilter + '%')
        AND (@DOBAfter IS NULL OR AgeOfAthlete > @DOBAfter)
        AND (@DOBBefore IS NULL OR AgeOfAthlete < @DOBBefore);
END

-- #D --
-- 1)get contingents procedure --

DROP PROCEDURE IF EXISTS GetContingentsProcedure
GO

CREATE PROCEDURE GetContingentsProcedure
AS
BEGIN
    SELECT *
    FROM dbo.Contingent;
END
GO

-- 2)get genders procedure --

DROP PROCEDURE IF EXISTS GetGendersProcedure
GO

CREATE PROCEDURE GetGendersProcedure
AS
BEGIN
    SELECT *
    FROM dbo.Gender;
END
