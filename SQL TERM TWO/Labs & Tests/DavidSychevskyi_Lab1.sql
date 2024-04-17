----------------------------------------------------------------------------------
-- script to create the Ironwood University database for a SQL Server database
-- use the following commands only if you need to create a new database
--
-- Note: You MUST replace all occurances of username_ with your own username!
--			(should be 9 occurences to replace, including 2 in the comments).

USE master
GO
/****** Object:  Database [username_Ironwood]  Drop it if it exists   ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'username_Ironwood')
Begin
	ALTER DATABASE [DavidSychevskyi_Ironwood]
	SET OFFLINE WITH ROLLBACK IMMEDIATE
	ALTER DATABASE [DavidSychevskyi_Ironwood]
	SET ONLINE
	DROP DATABASE [DavidSychevskyi_Ironwood]
End
GO

CREATE DATABASE [DavidSychevskyi_Ironwood] 
GO
ALTER DATABASE [DavidSychevskyi_Ironwood] SET RECOVERY Simple 
GO
----------------------------------------------------------------------------------

USE [DavidSychevskyi_Ironwood]
GO

--- CREATE TABLES
PRINT 'Creating UniversityState'
CREATE TABLE UniversityState (
	StateAbbreviation VARCHAR(2) PRIMARY KEY,
	StateName VARCHAR(100) NOT NULL)
GO

PRINT 'Creating UniversityGender'
CREATE TABLE UniversityGender (Gender CHAR(1) PRIMARY KEY)
GO

PRINT 'Creating UniversityInstructor'
CREATE TABLE UniversityInstructor (
	InstructorID BIGINT IDENTITY PRIMARY KEY CLUSTERED,
	InstructorFirstName VARCHAR (30) NOT NULL,
	InstructorMI VARCHAR (1) NULL,
	InstructorLastName VARCHAR (30) NOT NULL,
	InstructorPhoneNumber VARCHAR (10) NULL,
	InstructorUserID VARCHAR (35) NOT NULL,
	InstructorPIN VARCHAR (10) NOT NULL,
	DepartmentID BIGINT NOT NULL,
	InstructorCoordID BIGINT)
GO

PRINT 'Creating UniversityDepartment'
CREATE TABLE UniversityDepartment (
	DepartmentID BIGINT IDENTITY PRIMARY KEY CLUSTERED,
	DepartmentName VARCHAR (30) NOT NULL,
	DepartmentOffice VARCHAR (30) NULL,
	DepartmentChairID BIGINT NOT NULL)
GO

PRINT 'Creating UniversityCourse'
CREATE TABLE UniversityCourse (
	CourseID BIGINT IDENTITY PRIMARY KEY CLUSTERED,
	CourseName VARCHAR (10) NOT NULL,
	CourseTitle VARCHAR (200) NOT NULL,
	CourseCredits TINYINT NOT NULL,
	DepartmentID BIGINT NOT NULL,
	CONSTRAINT FK_UniversityCourse_DepartmentID FOREIGN KEY (DepartmentID) REFERENCES UniversityDepartment(DepartmentID))
GO

PRINT 'Creating UniversitySection'
CREATE TABLE UniversitySection (
	SectionID BIGINT IDENTITY PRIMARY KEY CLUSTERED,
	SectionNumber VARCHAR(3) NOT NULL,
	SectionTerm VARCHAR (10) NOT NULL,
	SectionDay VARCHAR (8) NOT NULL,
	SectionTime DATETIME NOT NULL,
	SectionMaxEnrollment SMALLINT NOT NULL,
	SectionCurrentEnrollment SMALLINT NULL,
	CourseID BIGINT NOT NULL,
	InstructorID BIGINT NOT NULL,
	CONSTRAINT FK_UniversitySection_CourseID FOREIGN KEY (CourseID) REFERENCES UniversityCourse(CourseID),
	CONSTRAINT FK_UniversitySection_InstructorID FOREIGN KEY (InstructorID) REFERENCES UniversityInstructor(InstructorID),
    CONSTRAINT CK_UniversitySection_SectionCurrentEnrollment CHECK (SectionCurrentEnrollment <= SectionMaxEnrollment))
GO

PRINT 'Creating UniversityStudent'
CREATE TABLE UniversityStudent (
	StudentID BIGINT IDENTITY PRIMARY KEY CLUSTERED,
	StudentFirstName VARCHAR (30) NOT NULL,
	StudentMI VARCHAR (1) NULL,
	StudentLastName VARCHAR (30) NOT NULL,
	StudentDOB DATETIME NOT NULL,
	StudentGender CHAR (1) NOT NULL,
	StudentImagefile VARCHAR (30) NULL,
	StudentImage IMAGE NULL,
	StudentAddress VARCHAR (50) NOT NULL,
	StudentCity VARCHAR (50) NOT NULL,
	StateAbbreviation VARCHAR (2) NOT NULL,
	StudentPostalCode VARCHAR (10) NOT NULL,
	StudentPhoneNumber VARCHAR (10) NULL,
	StudentUserID VARCHAR (35) NOT NULL,
	StudentPIN VARCHAR (10) NOT NULL,
	AdvisorID BIGINT NOT NULL,
	CONSTRAINT FK_UniversityStudent_AdvisorID FOREIGN KEY (AdvisorID) REFERENCES UniversityInstructor(InstructorID),
    CONSTRAINT FK_UniversityStudent_StateAbbreviation FOREIGN KEY (StateAbbreviation) REFERENCES UniversityState(StateAbbreviation),
    CONSTRAINT FK_UniversityStudent_StudentGender FOREIGN KEY (StudentGender) REFERENCES UniversityGender(Gender))
GO

PRINT 'Creating UniversityEnrollment'
CREATE TABLE UniversityEnrollment (
	StudentID BIGINT NOT NULL,
	SectionID BIGINT NOT NULL,
	EnrollmentGrade VARCHAR(2) NULL,
	CONSTRAINT PK_UniversityEnrollment PRIMARY KEY CLUSTERED (StudentID, SectionID),
	CONSTRAINT FK_UniversityEnrollment_StudentID FOREIGN KEY (StudentID) REFERENCES UniversityStudent(StudentID),
	CONSTRAINT FK_UniversityEnrollment_SectionID FOREIGN KEY (SectionID) REFERENCES UniversitySection(SectionID))
GO

PRINT 'Creating UniversityLaptop'
CREATE TABLE UniversityLaptop (
	LaptopID BIGINT IDENTITY PRIMARY KEY CLUSTERED,
	LaptopBrand VARCHAR (30) NOT NULL,
	LaptopCPU VARCHAR (30) NOT NULL,
	LaptopYear DATETIME NOT NULL,
	StudentID BIGINT NULL,
	CONSTRAINT FK_UniversityLaptop_StudentID FOREIGN KEY (StudentID) REFERENCES UniversityStudent(StudentID))
GO

PRINT 'Creating UniversityServiceProject'
CREATE TABLE UniversityServiceProject (
	ProjectID BIGINT IDENTITY PRIMARY KEY CLUSTERED,
	ProjectDescription VARCHAR (200) NOT NULL,
	ProjectGrade VARCHAR (2) NULL,
	StudentID BIGINT NOT NULL,
	CONSTRAINT FK_UniversityServiceProject_StudentID FOREIGN KEY (StudentID) REFERENCES UniversityStudent(StudentID))
GO

PRINT 'Creating UniversityServiceHours'
CREATE TABLE UniversityServiceHours (
	ServiceHoursID BIGINT IDENTITY PRIMARY KEY CLUSTERED,
	ServiceHoursStartTime DATETIME NULL,
	ServiceHoursEndTime DATETIME NULL,
	ProjectID BIGINT NOT NULL,
	CONSTRAINT FK_UniversityServiceHours_ProjectID FOREIGN KEY (ProjectID) REFERENCES UniversityServiceProject(ProjectID))
GO

PRINT 'Creating UniversityTutor'
CREATE TABLE UniversityTutor (
	TutorID BIGINT IDENTITY PRIMARY KEY CLUSTERED,
	TutorFirstName VARCHAR (30) NOT NULL,
	TutorMI VARCHAR (1) NULL,
	TutorLastName VARCHAR (30) NOT NULL)
GO

PRINT 'Creating UniversityTutorSession'
CREATE TABLE UniversityTutorSession (
	TutorSessionID BIGINT IDENTITY PRIMARY KEY CLUSTERED,
	TutorID BIGINT NOT NULL,
	StudentID BIGINT NOT NULL,
	SectionID BIGINT NOT NULL,
	TutorSessionStartTime DATETIME NOT NULL,
	TutorSessionEndTime DATETIME NOT NULL,
	CONSTRAINT FK_UniversityTutorSession_TutorID FOREIGN KEY (TutorID) REFERENCES UniversityTutor(TutorID),
	CONSTRAINT FK_UniversityTutorSession_StudentID FOREIGN KEY (StudentID) REFERENCES UniversityStudent(StudentID),
	CONSTRAINT FK_UniversityTutorSession_SectionID FOREIGN KEY (SectionID) REFERENCES UniversitySection(SectionID))

PRINT ''
PRINT 'inserting records into UNIVERSITYGENDER'
INSERT INTO UniversityGender VALUES('F')
INSERT INTO UniversityGender VALUES('M')
GO

PRINT 'inserting records into UNIVERSITYSTATE'
INSERT INTO UniversityState VALUES('AL', 'ALABAMA')
INSERT INTO UniversityState VALUES('AK', 'ALASKA')
INSERT INTO UniversityState VALUES('AZ', 'ARIZONA')
INSERT INTO UniversityState VALUES('AR', 'ARKANSAS')
INSERT INTO UniversityState VALUES('CA', 'CALIFORNIA')
INSERT INTO UniversityState VALUES('CO', 'COLORADO')
INSERT INTO UniversityState VALUES('CT', 'CONNECTICUT')
INSERT INTO UniversityState VALUES('DE', 'DELAWARE')
INSERT INTO UniversityState VALUES('DC', 'DISTRICT OF COLUMBIA')
INSERT INTO UniversityState VALUES('FL', 'FLORIDA')
INSERT INTO UniversityState VALUES('GA', 'GEORGIA')
INSERT INTO UniversityState VALUES('HI', 'HAWAII')
INSERT INTO UniversityState VALUES('ID', 'IDAHO')
INSERT INTO UniversityState VALUES('IL', 'ILLINOIS')
INSERT INTO UniversityState VALUES('IN', 'INDIANA')
INSERT INTO UniversityState VALUES('IA', 'IOWA')
INSERT INTO UniversityState VALUES('KS', 'KANSAS')
INSERT INTO UniversityState VALUES('KY', 'KENTUCKY')
INSERT INTO UniversityState VALUES('LA', 'LOUISIANA')
INSERT INTO UniversityState VALUES('ME', 'MAINE')
INSERT INTO UniversityState VALUES('MD', 'MARYLAND')
INSERT INTO UniversityState VALUES('MA', 'MASSACHUSETTS')
INSERT INTO UniversityState VALUES('MI', 'MICHIGAN')
INSERT INTO UniversityState VALUES('MN', 'MINNESOTA')
INSERT INTO UniversityState VALUES('MS', 'MISSISSIPPI')
INSERT INTO UniversityState VALUES('MO', 'MISSOURI')
INSERT INTO UniversityState VALUES('MT', 'MONTANA')
INSERT INTO UniversityState VALUES('NE', 'NEBRASKA')
INSERT INTO UniversityState VALUES('NV', 'NEVADA')
INSERT INTO UniversityState VALUES('NH', 'NEW HAMPSHIRE')
INSERT INTO UniversityState VALUES('NJ', 'NEW JERSEY')
INSERT INTO UniversityState VALUES('NM', 'NEW MEXICO')
INSERT INTO UniversityState VALUES('NY', 'NEW YORK')
INSERT INTO UniversityState VALUES('NC', 'NORTH CAROLINA')
INSERT INTO UniversityState VALUES('ND', 'NORTH DAKOTA')
INSERT INTO UniversityState VALUES('OH', 'OHIO')
INSERT INTO UniversityState VALUES('OK', 'OKLAHOMA')
INSERT INTO UniversityState VALUES('OR', 'OREGON')
INSERT INTO UniversityState VALUES('PA', 'PENNSYLVANIA')
INSERT INTO UniversityState VALUES('RI', 'RHODE ISLAND')
INSERT INTO UniversityState VALUES('SC', 'SOUTH CAROLINA')
INSERT INTO UniversityState VALUES('SD', 'SOUTH DAKOTA')
INSERT INTO UniversityState VALUES('TN', 'TENNESSEE')
INSERT INTO UniversityState VALUES('TX', 'TEXAS')
INSERT INTO UniversityState VALUES('UT', 'UTAH')
INSERT INTO UniversityState VALUES('VT', 'VERMONT')
INSERT INTO UniversityState VALUES('VA', 'VIRGINIA')
INSERT INTO UniversityState VALUES('WA', 'WASHINGTON')
INSERT INTO UniversityState VALUES('WV', 'WEST VIRGINIA')
INSERT INTO UniversityState VALUES('WI', 'WISCONSIN')
INSERT INTO UniversityState VALUES('WY', 'WYOMING')
GO

PRINT 'Inserting into UniversityInstructor'
INSERT INTO UniversityInstructor (InstructorFirstName, InstructorMI, InstructorLastName, InstructorPhoneNumber, InstructorUserID, InstructorPIN, DepartmentID,InstructorCoordID)
VALUES ('Lauren', 'J', 'Morrison', '5558362243', 'morrislj1', '1122', 1, NULL)
INSERT INTO UniversityInstructor (InstructorFirstName, InstructorMI, InstructorLastName, InstructorPhoneNumber, InstructorUserID, InstructorPIN, DepartmentID,InstructorCoordID)
VALUES ('Adam', 'K' , 'Dutton', '5558364522', 'duttonak1', '2222', 2, 1)
INSERT INTO UniversityInstructor (InstructorFirstName, InstructorMI, InstructorLastName, InstructorPhoneNumber, InstructorUserID, InstructorPIN, DepartmentID,InstructorCoordID)
VALUES ('Eagan', 'T', 'Ruppelt', '5558366487', 'ruppeltet1', '3333', 3, NULL)
INSERT INTO UniversityInstructor (InstructorFirstName, InstructorMI, InstructorLastName, InstructorPhoneNumber, InstructorUserID, InstructorPIN, DepartmentID,InstructorCoordID)
VALUES ('Charles', 'H', 'Murphy', '5558362113', 'murphych1', '3211', 4, 1)
INSERT INTO UniversityInstructor (InstructorFirstName, InstructorMI, InstructorLastName, InstructorPhoneNumber, InstructorUserID, InstructorPIN, DepartmentID,InstructorCoordID)
VALUES ('Richard', 'P', 'Harrison', '5558364901', 'harrisrp1', '1233', 5, 3)
INSERT INTO UniversityInstructor (InstructorFirstName, InstructorMI, InstructorLastName, InstructorPhoneNumber, InstructorUserID, InstructorPIN, DepartmentID,InstructorCoordID)
VALUES ('Judith', 'D', 'Bakke', '5558360089', 'bakkejd1', '4455', 6, 3)
INSERT INTO UniversityInstructor (InstructorFirstName, InstructorMI, InstructorLastName, InstructorPhoneNumber, InstructorUserID, InstructorPIN, DepartmentID,InstructorCoordID)
VALUES ('Diane', 'O', 'Adler', '5558365960', 'adlerdo1', '5566', 7, NULL)
INSERT INTO UniversityInstructor (InstructorFirstName, InstructorMI, InstructorLastName, InstructorPhoneNumber, InstructorUserID, InstructorPIN, DepartmentID,InstructorCoordID)
VALUES ('Ted', NULL, 'Buck', '5558362531', 'buckt1', '6655', 1,1)
INSERT INTO UniversityInstructor (InstructorFirstName, InstructorMI, InstructorLastName, InstructorPhoneNumber, InstructorUserID, InstructorPIN, DepartmentID,InstructorCoordID)
VALUES ('Roberta', 'V', 'Sanchez', '5558363628', 'sanchezrv1', '6677', 1,1)
INSERT INTO UniversityInstructor (InstructorFirstName, InstructorMI, InstructorLastName, InstructorPhoneNumber, InstructorUserID, InstructorPIN, DepartmentID,InstructorCoordID)
VALUES ('Lillian', 'S', 'Hogstad', '5558366946', 'hogstadls1', '7766', 1,1)
INSERT INTO UniversityInstructor (InstructorFirstName, InstructorMI, InstructorLastName, InstructorPhoneNumber, InstructorUserID, InstructorPIN, DepartmentID,InstructorCoordID)
VALUES ('Brian', 'L', 'Luedke', '5558362419', 'luedkebl1', '5544', 2,1)
INSERT INTO UniversityInstructor (InstructorFirstName, InstructorMI, InstructorLastName, InstructorPhoneNumber, InstructorUserID, InstructorPIN, DepartmentID,InstructorCoordID)
VALUES ('Anthony', 'K', 'Downs', '5558362988', 'downsak1', '4466', 2,1)
INSERT INTO UniversityInstructor (InstructorFirstName, InstructorMI, InstructorLastName, InstructorPhoneNumber, InstructorUserID, InstructorPIN, DepartmentID,InstructorCoordID)
VALUES ('Nancy', NULL, 'Gardner', '5558364345', 'gardnern1', '6699', 2,1)
GO

PRINT 'Inserting into UniversityDepartment'
INSERT INTO UniversityDepartment (DepartmentName, DepartmentOffice, DepartmentChairID)
VALUES ('Management Information Systems', 'Schneider 418', 1)
INSERT INTO UniversityDepartment (DepartmentName, DepartmentOffice, DepartmentChairID)
VALUES ('Accounting', 'Schneider 419', 2)
INSERT INTO UniversityDepartment (DepartmentName, DepartmentOffice, DepartmentChairID)
VALUES ('Physics', 'Phillips 007', 3)
INSERT INTO UniversityDepartment (DepartmentName, DepartmentOffice, DepartmentChairID)
VALUES ('Computer Science', 'Phillips 112', 4)
INSERT INTO UniversityDepartment (DepartmentName, DepartmentOffice, DepartmentChairID)
VALUES ('Chemistry', 'Phillips 201', 5)
INSERT INTO UniversityDepartment (DepartmentName, DepartmentOffice, DepartmentChairID)
VALUES ('Geology', 'Phillips 123', 6)
INSERT INTO UniversityDepartment (DepartmentName, DepartmentOffice, DepartmentChairID)
VALUES ('Foreign Languages', 'Hibbard 211', 7)
GO

PRINT 'Inserting into UniversityCourse'
INSERT INTO UniversityCourse (CourseName, CourseTitle, CourseCredits, DepartmentID)
VALUES('MIS 240', 'Information Systems in Business', 3, 1)
INSERT INTO UniversityCourse (CourseName, CourseTitle, CourseCredits, DepartmentID)
VALUES('MIS 310', 'Systems Analysis and Design', 3, 1)
INSERT INTO UniversityCourse (CourseName, CourseTitle, CourseCredits, DepartmentID)
VALUES('MIS 344', 'Database Management Systems', 3, 1)
INSERT INTO UniversityCourse (CourseName, CourseTitle, CourseCredits, DepartmentID)
VALUES('MIS 345', 'Introduction to Networks', 3, 1)
INSERT INTO UniversityCourse (CourseName, CourseTitle, CourseCredits, DepartmentID)
VALUES('ACCT 201', 'Principles of Accounting', 3, 2)
INSERT INTO UniversityCourse (CourseName, CourseTitle, CourseCredits, DepartmentID)
VALUES('ACCT 312', 'Managerial Accounting', 3, 2)
INSERT INTO UniversityCourse (CourseName, CourseTitle, CourseCredits, DepartmentID)
VALUES('PHYS 211', 'General Physics', 4, 3)
INSERT INTO UniversityCourse (CourseName, CourseTitle, CourseCredits, DepartmentID)
VALUES('CS 245', 'Fundamentals of Object-Oriented Programming', 4, 4)
INSERT INTO UniversityCourse (CourseName, CourseTitle, CourseCredits, DepartmentID)
VALUES('CHEM 205', 'Applied Physical Chemistry', 3, 5)
INSERT INTO UniversityCourse (CourseName, CourseTitle, CourseCredits, DepartmentID)
VALUES('GEOL 212', 'Mineralogy and Petrology', 5, 6)
INSERT INTO UniversityCourse (CourseName, CourseTitle, CourseCredits, DepartmentID)
VALUES('CHIN 110', 'Intensive Beginning Chinese (Mandarin)', 5, 7)
GO

PRINT 'Inserting into UniversitySection'
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'SUMM08', 'MTWTHF', CONVERT(DATETIME, '08:00 AM', 8), 30, 25, 1, 1)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'SUMM08', 'MTWTHF', CONVERT(DATETIME, '10:00 AM', 8), 30, 19, 5, 1)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'FALL08', 'MWF', CONVERT(DATETIME, '08:00 AM', 8), 65, 65, 1, 1)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('002', 'FALL08', 'TTH', CONVERT(DATETIME, '02:00 PM', 8), 80, 71, 1, 8)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'FALL08', 'TTH', CONVERT(DATETIME, '08:00 AM', 8), 65, 61, 2, 9)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'FALL08', 'TTH', CONVERT(DATETIME, '08:00 AM', 8), 40, 39, 3, 10)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'FALL08', 'MWF', CONVERT(DATETIME, '09:00 AM', 8), 40, 40, 4, 8)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'FALL08', 'MWF', CONVERT(DATETIME, '09:00 AM', 8), 40, 36, 5, 11)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'FALL08', 'TTH', CONVERT(DATETIME, '11:00 AM', 8), 40, 38, 6, 12)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'FALL08', 'TTH', CONVERT(DATETIME, '09:00 AM', 8), 35, 35, 7, 3)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'FALL08', 'MWF', CONVERT(DATETIME, '01:00 PM', 8), 60, 51, 8, 4)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'FALL08', 'MWF', CONVERT(DATETIME, '10:00 AM', 8), 60, 34, 9, 5)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'FALL08', 'TTH', CONVERT(DATETIME, '10:00 AM', 8), 35, 26, 10, 6)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'FALL08', 'TTH', CONVERT(DATETIME, '11:00 AM', 8), 50, 23, 11, 7)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'SPR09', 'MWF', CONVERT(DATETIME, '08:00 AM', 8), 65, 0, 1, 1)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('002', 'SPR09', 'TTH', CONVERT(DATETIME, '02:00 PM', 8), 80, 0, 1, 8)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'SPR09', 'TTH', CONVERT(DATETIME, '10:00 AM', 8), 65, 5, 2, 9)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'SPR09', 'TTH', CONVERT(DATETIME, '09:00 AM', 8), 40, 3, 3, 10)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'SPR09', 'MWF', CONVERT(DATETIME, '11:00 AM', 8), 40, 21, 4, 8)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'SPR09', 'MWF', CONVERT(DATETIME, '03:00 PM', 8), 40, 17, 5, 11)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'SPR09', 'TTH', CONVERT(DATETIME, '08:00 AM', 8), 40, 0, 6, 12)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'SPR09', 'TTH', CONVERT(DATETIME, '10:00 AM', 8), 35, 23, 7, 3)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'SPR09', 'MWF', CONVERT(DATETIME, '09:00 AM', 8), 60, 38, 8, 4)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'SPR09', 'MWF', CONVERT(DATETIME, '11:00 AM', 8), 60, 12, 9, 5)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'SPR09', 'TTH', CONVERT(DATETIME, '09:00 AM', 8), 35, 29, 10, 6)
INSERT INTO UniversitySection (SectionNumber, SectionTerm, SectionDay, SectionTime, SectionMaxEnrollment, SectionCurrentEnrollment, CourseID, InstructorID)
VALUES('001', 'SPR09', 'TTH', CONVERT(DATETIME, '02:00 PM', 8), 50, 31, 11, 7)
GO

PRINT 'Inserting into UniversityStudent'
INSERT INTO UniversityStudent (StudentFirstName, StudentMI, StudentLastName, StudentDOB, StudentGender, StudentImageFile,
                               StudentAddress, StudentCity, StateAbbreviation, StudentPostalCode, StudentPhoneNumber, StudentUserID, StudentPIN, AdvisorID)
VALUES ('Clifford', NULL, 'Wall', CONVERT(DATETIME,'05/29/1988', 101), 'M', 'wallc.jpg',
        '3403 Level St', 'Ironwood', 'MI', '49938', '7158362331', 'wallc1', '1234', 1)
INSERT INTO UniversityStudent (StudentFirstName, StudentMI, StudentLastName, StudentDOB, StudentGender, StudentImageFile,
                               StudentAddress, StudentCity, StateAbbreviation, StudentPostalCode, StudentPhoneNumber, StudentUserID, StudentPIN, AdvisorID)
VALUES ('Dawna', 'H', 'Voss', CONVERT(DATETIME,'11/01/1981', 101), 'F', 'vossd.jpg',
        '524 Lakeview Dr Apt 12', 'Ashland', 'WI', '54806', '7158382413', 'vossdh1', '4321', 8)
INSERT INTO UniversityStudent (StudentFirstName, StudentMI, StudentLastName, StudentDOB, StudentGender, StudentImageFile,
                               StudentAddress, StudentCity, StateAbbreviation, StudentPostalCode, StudentPhoneNumber, StudentUserID, StudentPIN, AdvisorID)
VALUES ('Patricia', 'E', 'Owen', CONVERT(DATETIME,'01/23/1987', 101), 'F', 'owenp.jpg',
        'S13254 County Rd 71', 'Ironwood', 'MI', '49938', '7158360982', 'owenpe1', '1122', 8)
INSERT INTO UniversityStudent (StudentFirstName, StudentMI, StudentLastName, StudentDOB, StudentGender, StudentImageFile,
                               StudentAddress, StudentCity, StateAbbreviation, StudentPostalCode, StudentPhoneNumber, StudentUserID, StudentPIN, AdvisorID)
VALUES ('Raymond', 'P', 'Miller', CONVERT(DATETIME,'08/09/1988', 101), 'M', 'millerr.jpg',
        '231 Edgewood Ct Apt 23', 'Ashland', 'MI', '54806', '7158382319', 'millerrp1', '2211', 9)
INSERT INTO UniversityStudent (StudentFirstName, StudentMI, StudentLastName, StudentDOB, StudentGender, StudentImageFile,
                               StudentAddress, StudentCity, StateAbbreviation, StudentPostalCode, StudentPhoneNumber, StudentUserID, StudentPIN, AdvisorID)
VALUES ('Ann', NULL, 'Bochman', CONVERT(DATETIME,'04/12/1988', 101), 'F', 'bochmana.jpg',
        '112 Rainetta Blvd', 'Ashland', 'WI', '54806', '7158382231', 'bochmana1', '2233', 4)
INSERT INTO UniversityStudent (StudentFirstName, StudentMI, StudentLastName, StudentDOB, StudentGender, StudentImageFile,
                               StudentAddress, StudentCity, StateAbbreviation, StudentPostalCode, StudentPhoneNumber, StudentUserID, StudentPIN, AdvisorID)
VALUES ('Brenda', 'S', 'Johansen', CONVERT(DATETIME,'03/27/1989', 101), 'F', 'johansenb.jpg',
        '520 Congress Rd', 'Ironwood', 'MI', '49938', '7158368891', 'johansenb1', '3322', 10)
INSERT INTO UniversityStudent (StudentFirstName, StudentMI, StudentLastName, StudentDOB, StudentGender, StudentImageFile,
                               StudentAddress, StudentCity, StateAbbreviation, StudentPostalCode, StudentPhoneNumber, StudentUserID, StudentPIN, AdvisorID)
VALUES ('David', 'R', 'Ashcraft', CONVERT(DATETIME,'10/15/1989', 101), 'M', 'ashcraftd.jpg',
        '331 1st Ave Apt 11', 'Ashland', 'WI', '54806', '7158384437', 'ashcraftdr1', '3344', 9)
GO

PRINT 'Inserting into UniversityLaptop'
INSERT INTO UniversityLaptop (LaptopBrand, LaptopCPU, LaptopYear, StudentID)
VALUES ('DELL', 'Latitude D788', CONVERT(DATETIME,'05/21/2008', 101), 1)
INSERT INTO UniversityLaptop (LaptopBrand, LaptopCPU, LaptopYear, StudentID)
VALUES ('DELL', 'Latitude D788', CONVERT(DATETIME,'05/21/2008', 101), NULL)
INSERT INTO UniversityLaptop (LaptopBrand, LaptopCPU, LaptopYear, StudentID)
VALUES ('DELL', 'Inspiron 7109', CONVERT(DATETIME,'05/21/2008', 101), NULL)
INSERT INTO UniversityLaptop (LaptopBrand, LaptopCPU, LaptopYear, StudentID)
VALUES ('IBM', 'Thinkpad T3501', CONVERT(DATETIME,'12/01/2008', 101), 3)
INSERT INTO UniversityLaptop (LaptopBrand, LaptopCPU, LaptopYear, StudentID)
VALUES ('IBM', 'Thinkpad T3501', CONVERT(DATETIME,'12/01/2008', 101), NULL)
GO

PRINT 'Inserting into UniversityServiceProject'
INSERT INTO UniversityServiceProject (ProjectDescription, StudentID) Values ('Help Desk Assistant at Elder Care Center', 2)
INSERT INTO UniversityServiceProject (ProjectDescription, StudentID) Values ('Create Database for Elder Care Center', 4)
GO

PRINT 'Inserting into UniversityEnrollment'
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (1, 1, 'C')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (1, 10, 'B')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (1, 11, 'C')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (1, 14, 'A')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (1, 13, 'B')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (2, 1, 'A')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (2, 8, 'B')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (2, 12, 'B')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (2, 13, 'A')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (2, 10, 'B+')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (3, 2, 'B-')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (3, 3, 'A-')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (3, 8, 'B')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (3, 10, 'C')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (3, 13, 'C+')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (4, 4, 'F')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (4, 8, 'C-')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (4, 13, 'C')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (4, 12, 'B')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (5, 3, 'C+')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (5, 8, 'B-')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (5, 10, 'B')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (5, 13, 'A-')
INSERT INTO UniversityEnrollment (StudentID, SectionID, EnrollmentGrade)VALUES (5, 14, 'B')
INSERT INTO UniversityEnrollment (StudentID, SectionID)VALUES (4, 15)
INSERT INTO UniversityEnrollment (StudentID, SectionID)VALUES (4, 26)
INSERT INTO UniversityEnrollment (StudentID, SectionID)VALUES (4, 22)
INSERT INTO UniversityEnrollment (StudentID, SectionID)VALUES (4, 23)
INSERT INTO UniversityEnrollment (StudentID, SectionID)VALUES (2, 17)
INSERT INTO UniversityEnrollment (StudentID, SectionID)VALUES (2, 18)
INSERT INTO UniversityEnrollment (StudentID, SectionID)VALUES (2, 21)
INSERT INTO UniversityEnrollment (StudentID, SectionID)VALUES (2, 26)
GO

PRINT 'Inserting into UniversityTutor'
INSERT INTO UniversityTutor (TutorFirstName, TutorMI, TutorLastName)
VALUES ('Cheryl', 'D', 'Glastner')
INSERT INTO UniversityTutor (TutorFirstName, TutorMI, TutorLastName)
VALUES ('Andrew', 'H', 'Beagle')
INSERT INTO UniversityTutor (TutorFirstName, TutorMI, TutorLastName)
VALUES ('Michael', NULL, 'Hannity')
GO

PRINT 'Inserting into UniversityTutorSession'
INSERT INTO UniversityTutorSession (TutorID, StudentID, SectionID, TutorSessionStartTime, TutorSessionEndTime)
VALUES ( 1, 4, 13, '09/21/2008 07:00 PM', '09/21/2008 08:00 PM')
INSERT INTO UniversityTutorSession (TutorID, StudentID, SectionID, TutorSessionStartTime, TutorSessionEndTime)
VALUES ( 1, 4, 12, '09/22/2008 06:30 PM', '09/22/2008 07:30 PM')
INSERT INTO UniversityTutorSession (TutorID, StudentID, SectionID, TutorSessionStartTime, TutorSessionEndTime)
VALUES ( 1, 4, 13, '10/26/2008 06:00 PM','10/26/2008 07:30 PM')
INSERT INTO UniversityTutorSession (TutorID, StudentID, SectionID, TutorSessionStartTime, TutorSessionEndTime)
VALUES ( 1, 4, 12, '10/27/2008 04:00 PM','10/27/2008 05:00 PM')
INSERT INTO UniversityTutorSession (TutorID, StudentID, SectionID, TutorSessionStartTime, TutorSessionEndTime)
VALUES ( 3, 1, 11, '10/03/2008 04:30 PM', '10/03/2008 05:30 PM')
INSERT INTO UniversityTutorSession (TutorID, StudentID, SectionID, TutorSessionStartTime, TutorSessionEndTime)
VALUES ( 3, 1, 11, '10/04/2008 06:30 PM', '10/04/2008 07:30 PM')
INSERT INTO UniversityTutorSession (TutorID, StudentID, SectionID, TutorSessionStartTime, TutorSessionEndTime)
VALUES ( 3, 1, 11, '10/31/2008 07:00 PM','10/31/2008 08:00 PM')
GO

PRINT 'Inserting into UniversityServiceHours'
INSERT INTO UniversityServiceHours (ServiceHoursStartTime, ServiceHoursEndTime, ProjectID)
VALUES ('10/11/2008 08:00 AM', '10/11/2008 11:00 AM', 1)
INSERT INTO UniversityServiceHours (ServiceHoursStartTime, ServiceHoursEndTime, ProjectID)
VALUES ('10/13/2008 08:00 AM', '10/13/2008 11:00 AM', 1)
INSERT INTO UniversityServiceHours (ServiceHoursStartTime, ServiceHoursEndTime, ProjectID)
VALUES ('10/16/2008 08:00 AM', '10/16/2008 01:00 PM', 1)
INSERT INTO UniversityServiceHours (ServiceHoursStartTime, ServiceHoursEndTime, ProjectID)
VALUES ('11/03/2008 10:00 AM', '11/03/2008 05:00 PM', 2)
GO

ALTER TABLE UniversityInstructor Add CONSTRAINT FK_UniversityInstructor_DepartmentID FOREIGN KEY (DepartmentID) REFERENCES UniversityDepartment(DepartmentID)
ALTER TABLE UniversityInstructor Add CONSTRAINT FK_UniversityInstructor_InstructorCoordID FOREIGN KEY (InstructorCoordID) REFERENCES UniversityInstructor(InstructorID)
ALTER TABLE UniversityDepartment Add CONSTRAINT FK_UniversityDepartment_DepartmentChairID FOREIGN KEY (DepartmentChairID) REFERENCES UniversityInstructor(InstructorID)
GO

--EXERCICES BELOW :
-- 1 :
--Students must be at least 14 years of age (do some date math in the constraint)
ALTER TABLE UniversityStudent
ADD CONSTRAINT CHK_UniversityStudent_MinAge
CHECK (DATEADD(year, 14, StudentDOB) <= GETDATE());
--The default value for State Abbreviation should be 'MI'
ALTER TABLE UniversityStudent
ADD CONSTRAINT DF_UniversityStudent_StateAbbreviation DEFAULT 'MI' FOR StateAbbreviation;
--The values in the Student User ID field should match the following pattern:
ALTER TABLE UniversityStudent
ADD CONSTRAINT CHK_StudentUserID
CHECK (StudentUserID LIKE '[A-Za-z]%, [A-Za-z][A-Za-z]*[0-9]%');
GO
-- 2 :
--Alter the UniversityStudent table to implement a Dual Key system.
ALTER TABLE UniversityStudent
ADD StudentPersonalKey INT
UPDATE UniversityStudent
SET StudentPersonalKey = CONCAT(RIGHT(StudentPhoneNumber, 3), RIGHT(CAST(YEAR(StudentDOB) AS VARCHAR(4)), 3))
ALTER TABLE UniversityStudent
ALTER COLUMN StudentPersonalKey INT NOT NULL
ALTER TABLE UniversityStudent
ADD CONSTRAINT uq_US_StudentPersonalKey UNIQUE(StudentPersonalKey)
GO
-- 3 :
--Alter the UniversityStudent table to add a timestamp field for concurrency control.
ALTER TABLE UniversityStudent
ADD TimestampColumn TIMESTAMP;
-- 4 :
--UpdatedBy = 'Anonymous'
ALTER TABLE UniversityStudent
ADD UpdatedBy VARCHAR(50) NOT NULL DEFAULT 'Anonymous';
--UpdatedOn = '12/31/1970'
ALTER TABLE UniversityStudent
ADD UpdatedOn DATE NOT NULL DEFAULT '1970-12-31';
-- 5 :
--After populating the existing values in the auditing fields, change the default value for UpdatedOn so that in future updates, the default value used will be the current date and time.
ALTER TABLE UniversityStudent
DROP CONSTRAINT df_US_UpdatedOn
ALTER TABLE UniversityStudent
ADD CONSTRAINT df_US_UpdatedOn
DEFAULT GETDATE() FOR UpdatedOn
UPDATE UniversityStudent
SET StudentLastName = 'Sychevskyi' WHERE StudentID = 1
PRINT 'Creating University Enrollment'
-- 6 :
--Modify the Ironwood database so that it uses the Simple recovery model.
ALTER DATABASE [DavidSychevskyi_Ironwood]
SET RECOVERY SIMPLE;
-- 7 :
--Write SQL code to create a full backup of the Ironwood database and all of its database objects. 
BACKUP DATABASE [DavidSychevskyi_Ironwood]
TO DISK = 'C:\DavidSychevskyi_IronwoodBackup.bak'
WITH FORMAT, NAME = 'Ironwood Full Backup';