USE master
GO

IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'VetClinic')
BEGIN
	ALTER DATABASE VetClinic
	SET OFFLINE WITH ROLLBACK IMMEDIATE
	ALTER DATABASE VetClinic
	SET ONLINE
	DROP DATABASE VetClinic
END
GO

CREATE DATABASE VetClinic
GO

USE VetClinic
GO

/****** Object:  Table [dbo].[OWNERS]     ******/
CREATE TABLE [dbo].[OWNERS](
	[personID] [int] NOT NULL,
	[petID] [char](4) NOT NULL,
 CONSTRAINT [pk_PERSON_PET] PRIMARY KEY CLUSTERED 
(
	[personID] ASC,
	[petID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSON]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSON](
	[personID] [int] IDENTITY(1,1) NOT NULL,
	[personFirstName] [varchar](30) NOT NULL,
	[personLastName] [varchar](30) NOT NULL,
	[personPhone] [char](10) NOT NULL,
 CONSTRAINT [pk_PERSON_personID] PRIMARY KEY CLUSTERED 
(
	[personID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PET]     ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PET](
	[petID] [char](4) NOT NULL,
	[petName] [varchar](30) NOT NULL,
	[petSpecies] [varchar](10) NOT NULL,
	[petBreed] [varchar](20) NULL,
	[petDOB] [date] NULL,
 CONSTRAINT [pk_PET_petID] PRIMARY KEY CLUSTERED 
(
	[petID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT [dbo].[OWNERS] ([personID], [petID]) VALUES (1, N'22DD')
INSERT [dbo].[OWNERS] ([personID], [petID]) VALUES (2, N'23RC')
INSERT [dbo].[OWNERS] ([personID], [petID]) VALUES (2, N'17PD')
INSERT [dbo].[OWNERS] ([personID], [petID]) VALUES (3, N'11SC')
INSERT [dbo].[OWNERS] ([personID], [petID]) VALUES (3, N'22DD')
INSERT [dbo].[OWNERS] ([personID], [petID]) VALUES (4, N'23BD')
INSERT [dbo].[OWNERS] ([personID], [petID]) VALUES (4, N'17SC')

SET IDENTITY_INSERT [dbo].[PERSON] ON 

INSERT [dbo].[PERSON] ([personID], [personFirstName], [personLastName], [personPhone]) VALUES (1, N'Mike', N'Ackley', N'4166218376')
INSERT [dbo].[PERSON] ([personID], [personFirstName], [personLastName], [personPhone]) VALUES (2, N'Oscar', N'Wallace', N'6168718863')
INSERT [dbo].[PERSON] ([personID], [personFirstName], [personLastName], [personPhone]) VALUES (3, N'Paulette', N'Sevier', N'4168772820')
INSERT [dbo].[PERSON] ([personID], [personFirstName], [personLastName], [personPhone]) VALUES (4, N'Daria', N'Zetticci', N'2126879175')

SET IDENTITY_INSERT [dbo].[PERSON] OFF

INSERT [dbo].[PET] ([petID], [petName], [petDOB], [petSpecies], [petBreed]) VALUES (N'23RC', N'Dusty', CAST(N'2023-11-19' AS Date), N'Cat', N'Ragdoll')
INSERT [dbo].[PET] ([petID], [petName], [petDOB], [petSpecies], [petBreed]) VALUES (N'11SC', N'Cleo', CAST(N'2011-02-14' AS Date), N'Cat', N'Siamese')
INSERT [dbo].[PET] ([petID], [petName], [petDOB], [petSpecies], [petBreed]) VALUES (N'23BD', N'Boots', CAST(N'2023-10-02' AS Date), N'Dog', N'Beagle')
INSERT [dbo].[PET] ([petID], [petName], [petDOB], [petSpecies], [petBreed]) VALUES (N'17SC', N'Jinx', CAST(N'2015-05-10' AS Date), N'Cat', N'Shorthair')
INSERT [dbo].[PET] ([petID], [petName], [petDOB], [petSpecies], [petBreed]) VALUES (N'22DD', N'Harley', CAST(N'2022-03-04' AS Date), N'Dog', N'Dalmatian')
INSERT [dbo].[PET] ([petID], [petName], [petDOB], [petSpecies], [petBreed]) VALUES (N'17PD', N'Dot', CAST(N'2017-08-12' AS Date), N'Dog', N'Pitbull')

ALTER TABLE [dbo].[OWNERS]  WITH CHECK ADD CONSTRAINT fk_PERSON_OWNERS FOREIGN KEY([personID])
REFERENCES [dbo].[PERSON] ([personID])
GO

ALTER TABLE [dbo].[OWNERS]  WITH CHECK ADD CONSTRAINT fk_PET_OWNERS FOREIGN KEY([petID])
REFERENCES [dbo].[PET] ([petID])
GO

-- 1 --

--ALTER TABLE PET
--ADD CONSTRAINT Buddy CHECK(petName = DEFAULT);

-- 2 --

ALTER TABLE PET
ADD CONSTRAINT catOrDog CHECK (petSpecies = 'Cat' OR petSpecies = 'Dog')

-- 3 --

SELECT petID, petName, petDOB AS 'petBirthDay', 
CONCAT('Breed: ', petBreed + ' ' + '(' + petSpecies + ')') AS 'petInfo', personID, 
CONCAT(personFirstName + ' ', + personLastName) AS 'personName', 
SUBSTRING(personPhone, 0,1) + '(' +
SUBSTRING(personPhone, 0,4) + ') ' + 
SUBSTRING(personPhone, 4,10) AS 'personPhoneNumber' -- PHONE NUMBER FORMATTING
FROM PERSON
INNER JOIN PET ON PERSON.personID = PERSON.personID

-- 4 --

BEGIN TRANSACTION unitOfWork
  BEGIN TRY
      INSERT INTO PET(petID) VALUES ('28DS'); -- CUSTOM ID
	  INSERT INTO PERSON(personFirstName, personLastName, personPhone)
	  VALUES('David','Sychevskyi','0953844431') -- CUSTOM NAMING AND PHONE
	  DECLARE @IdOfPerson INT
	  SET @IdOfPerson = '5' -- MY ID
	  PRINT('Transaction was completed succesfully')
  END TRY
  BEGIN CATCH
      PRINT('Transaction was not completed'); -- PRINT ERROR IF DOES NOT WORK
  END CATCH
COMMIT TRANSACTION unitOfWork

-- 5 --
/*
ALTER TABLE PET 
ADD petBaseFee AS (IF petSpecies == 'Dog'
                      {
					     petBaseFee == 150
					  }
                   ELSE IF petSpecies == 'Cat' & petDOB >= '2021-01-01'
				      {
					     petBaseFee == 50
					  }
			       ELSE IF petSpecies == 'Cat' & petDOB <
				   ...
)				   
--COMPUTED COLUMN
*/

SELECT petID, petName, petSpecies, petDOB FROM PET;