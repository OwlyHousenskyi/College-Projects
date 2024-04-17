-- ex05

USE tempdb;
GO
DROP DATABASE IF EXISTS ex05;
GO
CREATE DATABASE ex05;
GO
USE ex05;
GO




-- /*** STEP 1 ***/
-- compose a CREATE TABLE statement below to create 'developer' table
CREATE TABLE developer(
    developerId INT IDENTITY (1, 1),
	developerName VARCHAR(50),
	developerWebsite VARCHAR(100),
	developerAdress VARCHAR(50),
	developerCity VARCHAR(50),
	developerState VARCHAR(50),
	developerCountry VARCHAR(50),
	developerPostal VARCHAR(25),
	developerMarketCap DECIMAL(14, 2),
	CONSTRAINT pk_dev_Id PRIMARY KEY (developerId)
);
	



-- /*** STEP 2 ***/
-- compose INSERT INTO statement to populate 'developer' table using developers' details provided below
INSERT INTO developer
VALUES
	('Aeria Games',				'www.aeriagames.com',				'27 Schlesische St',			'Berlin',		NULL,			'Germany',	'10997',	7100000000),
	('Blizzard Entertainment',	'www.blizzard.com',					'P.O. Box 18979',				'Irving',		'California',	'USA',		'92623',	15447388752),
	('Black Eye Games',			'www.gloriavictisgame.com',			NULL,							NULL,			NULL,			'Poland',	NULL,		NULL),
	('Black Masque Games',		NULL,								NULL,							NULL,			NULL,			'USA',		NULL,		NULL),
	('Pluribus Games',			'www.atitd.com/contact.html',		'725 Morton Avenue',			'Aurora',		'Illinois',		'USA',		'60506',	555000000),
	('Portalus Games',			'portalusgames.com',				NULL,							'Seattle',		'Washington',	'USA',		NULL,		2000000),
	('Square Enix',				'na.square-enix.com/us/games',		'999 N. Sepulveda Blvd',		'El Segundo',	'California',	'USA',		'90245',	274000000000),
	('ArenaNet',				'www.arena.net',					'3180 139th Ave SE',			'Bellevue',		'Washington',	'USA',		'98005',	108000000),
	('Ignited Games',			NULL,								NULL,							NULL,			NULL,			'USA',		NULL,		NULL),
	('Hammerpoint Interactive',	NULL,								NULL,							NULL,			NULL,			'USA',		NULL,		NULL),
	('Aventurine SA',			'www.aventurine.gr/contact.html',	'Apostolou Pavlou 10B',			'Marousi',		NULL,			'Greece',	'15123',	980000000),
	('WOP-DevTeam',				NULL,								NULL,							NULL,			NULL,			'USA',		NULL,		NULL),
	('Funcom',					'www.funcom.com',					'1440 St. Catharine St. West',	'Montreal',		'Quebec',		'Canada',	'H3G 1R8',	60880000),
	('Imaginary Studios',		'www.nope.com',						NULL,							NULL,			NULL,			'Tuvalu',	NULL,		NULL);
SELECT * 
FROM developer

-- /*** STEP 3 ***/
-- compose a CREATE TABLE statement below to create 'game' table
CREATE TABLE game(
    gameId INT IDENTITY (1, 1),
    gameName VARCHAR(75) NOT NULL,
	gameGenre VARCHAR(25) NOT NULL,
	gameDateOfRelease DATE,
	gameRating DECIMAL(4, 2),
	gameFee DECIMAL(6, 2),
	gameIsDownloaded BIT,
	gameIsPvP BIT,
	developerId INT NOT NULL,
	CONSTRAINT pk_game_gameId PRIMARY KEY (gameId),
	CONSTRAINT fk_game_developer FOREIGN KEY (developerId) REFERENCES developer (developerId)
);

-- /*** STEP 4 ***/
-- compose INSERT INTO statement to populate game table using game' details provided below
INSERT INTO game
VALUES
	('Lime Odyssey',						'Fantasy',		NULL,			NULL,	0.00,	1,	NULL,	1),
	('DDTank',								'Fantasy',		'2011-01-01',	NULL,	0.00,	0,	1,		1),
	('Repulse',								'Sci-Fi',		NULL,			NULL,	0.00,	1,	1,		1),
	('World of Warcraft',					'Fantasy',		'2004-11-23',	7.77,	14.99,	1,	1,		2),
	('Diablo 3',							'Fantasy',		'12-05-15',		7.29,	0.00,	1,	1,		2),
	('Gloria Victis',						'Fantasy',		'2014-05-10',	8.18,	0.00,	1,	1,		3),
	('Dark Soltice',						'Fantasy',		NULL,			7.55,	7.85,	1,	1,		4),
	('A Tale in the Desert',				'Historical',	'1996-05-27',	7.36,	13.95,	1,	1,		5),
	('Pirates of the Burning Sea',			'Historical',	'2008-01-22',	7.53,	14.99,	1,	1,		6),
	('Life is Feudal',						'Historical',	NULL,			8.06,	0.00,	1,	1,		7),
	('Final Fantasy XIV: A Realm Reborn',	'Fantasy',		'2013-08-27',	8.49,	12.99,	0,	1,		7),
	('Guild Wars 2',						'Fantasy',		'2012-08-28',	8.58,	0.00,	1,	1,		8),
	('DarkEden',							'Horror',		'2008/02/12',	6.01,	NULL,	1,	1,		9),
	('Infestation: Survivor Stories',		'Horror',		'12/17/2012',	4.27,	0.00,	1,	1,		10),
	('Darkfall: Unholy Wars',				'Fantasy',		'04-16-2013',	8.11,	14.95,	1,	1,		11),
	('World of Pirates',					'Historical',	'01/03/2005',	6.53,	5.99,	1,	1,		12),
	('The Secret World',					'Real Life',	'2012/07/03',	8.57,	NULL,	1,	1,		13);
SELECT * 
FROM game
