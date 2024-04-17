-- TEST WORKING --

USE username_MedicalOffice
GO

-- #1 --
-- Scalar function --

DROP FUNCTION IF EXISTS dbo.udfPatientLoad
GO

CREATE FUNCTION dbo.udfPatientLoad(@docID INT, @docPatientLoad INT)
RETURNS INT AS
BEGIN
     DECLARE @input INT;

	 SELECT @input = docPatientLoad
	 FROM DOCTOR
	 WHERE docID = @docID AND docPatientLoad = @docPatientLoad

	 IF (@input = NULL)
	    SET @input = 0;
	 RETURN @input
END
GO

-- #2 --
-- Scalar function --

DROP FUNCTION IF EXISTS dbo.udf_PercentLoad
GO

CREATE FUNCTION dbo.udf_PercentLoad (@docID INT)
RETURNS DECIMAL(9,1)
AS
BEGIN
    DECLARE @patientCount INT;
    DECLARE @totalPatients INT;
    DECLARE @percentage DECIMAL(9,1);

    IF @docID = 0
        RETURN 100.0;

    SELECT @patientCount = COUNT(*) FROM PATIENT WHERE docID = @docID;

    IF @patientCount = 0
        RETURN 0;

    SELECT @totalPatients = COUNT(*) FROM PATIENT;
    SET @percentage = CAST((@patientCount * 100.0 / @totalPatients) AS DECIMAL(9,1));
    RETURN @percentage;
END
GO

-- #3 --
-- View that displays specific fields --

DROP VIEW IF EXISTS docStatistic
GO

CREATE VIEW docStatistic AS 
SELECT docID, docFirstName, docMiddleInit, docLastName, docPatientLoad,
dbo.udfPatientLoad(docID, docPatientLoad) AS CountedLoad,
dbo.udf_PercentLoad(docID) AS PercentLoad
FROM DOCTOR
GO

-- #4 --
-- INSERT Trigger --

DROP TRIGGER IF EXISTS updateDocPatientLoad
GO

CREATE TRIGGER updateDocPatientLoad 
ON PATIENT AFTER INSERT AS
BEGIN
    DECLARE @docPatientLoad INT;
	DECLARE @docID INT;

    SELECT COUNT(@docPatientLoad)
    FROM PATIENT
    WHERE docID = @docID;
    SET @docPatientLoad = @docPatientLoad + 1;

    IF (@docPatientLoad > 0.5 * (SELECT COUNT(*) FROM Patient))
        SET @docPatientLoad = 'Doctor''s patient load exceeds the allowed limit of 50%.';
    ELSE
        UPDATE DOCTOR	
        SET docPatientLoad = @docPatientLoad
        WHERE docID = @docID;
END
GO
    
-- #5 --
-- Execute an INSERT --

INSERT INTO PATIENT (patientFirstName, patientLastName, docID)
VALUES ('Porter', 'Robinson', 3);
SELECT * FROM PATIENT
GO
