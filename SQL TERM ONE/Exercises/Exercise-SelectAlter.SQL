USE tempdb;
GO
DROP DATABASE IF EXISTS ex02;
GO
CREATE DATABASE ex02;
GO
USE ex02;
GO

CREATE TABLE game
(
    gameId INT IDENTITY (1, 1) PRIMARY KEY,
    gameName VARCHAR (75) NOT NULL,
    gameGenre VARCHAR (25) NOT NULL,
    gameRelease DATE,
    gameRating DECIMAL (4, 2),
    gameFee DECIMAL (6, 2),
    gameDownloadable BIT,
    gamePlayed1vs1 BIT, 
);

SELECT *
FROM game;

ALTER TABLE game
ADD gamePlatform VARCHAR(20);

SELECT *
FROM game;

ALTER TABLE game
DROP gamePlatform;

SELECT * 
FROM game;

ALTER TABLE game
ALTER COLUMN gameFee SMALLINT;

SELECT * 
FROM game;

ALTER TABLE game 
ALTER COLUMN gameGenre VARCHAR(30);

SELECT * 
FROM game;







