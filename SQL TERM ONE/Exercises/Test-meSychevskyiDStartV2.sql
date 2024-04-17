-- midterm exam v2
-- name: David Sychevskyi
-- date: 03/06/2023
-- time: from ________ to ________

--07	compose CREATE statement to create a database below
USE tempdb;
GO
DROP DATABASE IF EXISTS mExam;
GO
CREATE DATABASE mExam;
GO
USE mExam;
GO

--08	write the CREATE statement to create the Pokemon table below

CREATE TABLE pokemons(
pokemonId INT IDENTITY (1, 1),
pokemonDexNum INT NOT NULL,
pokemonName VARCHAR (40) NOT NULL,
pokemonColor VARCHAR (30),
pokemonType VARCHAR (30) NOT NULL,
pokemonWeightKg DECIMAL (4, 2) DEFAULT 00.00,
pokemonHeightCm INT,
CONSTRAINT pk_pokemons_pokemonId PRIMARY KEY (pokemonId)
);

--09	compose INSERT statement to populate the Pokemon table below
INSERT INTO pokemons
VALUES
      (133, 'Eevee', 'Brown', 'Normal', 9.90, 35),
	  (135, 'Jolteon', 'Yellow', 'Electric', 27.90, 89),
	  (136, 'Flareon', 'Orange', 'Fire', 28.40, 89),
	  (005, 'Charmeleon', 'Red', 'Fire', 22.40, 114),
	  (025, 'Pikachu', 'Yellow', 'Electric', 9.90, 46);

--SELECT * FROM pokemons;

--10	compose UPDATE statement below
--	UPDATE Pikachu's height information.
--	He has grown 12 centimeters since his last measurement.
UPDATE pokemons
SET pokemonHeightCm = '58'
WHERE pokemonId = '5';

--11	compose SELECT statements to answer the following questions:
--qry1.	Display all details about Pokemon who are taller than the average height.
--		Order the output by weight from lightest to heaviest,
--		then by height from tallest to shortest.
SELECT * 
FROM pokemons
WHERE pokemonWeightKg > 22
ORDER BY pokemonWeightKg ASC;

--qry2.	Display the names and types of Pokemon who have the pattern 'ow' anywhere in their colours.

SELECT pokemonName , pokemonType 
FROM pokemons
WHERE pokemonColor LIKE '%ow%' ;

--qry3.	What is the total weight of all Normal and Fire Pokemon?

SELECT SUM(pokemonWeightKg) AS TotalWeightKg
FROM pokemons







--qry4.	What is the Pokemon's dex number, name, and weight of the heaviest electric Pokemon?
--		Concatenate the Dex number and name with a dash, as shown in the sample output.

SELECT CONCAT (pokemonDexNum, '', '-', '', pokemonName) AS pokemonInfo, pokemonWeightKg
FROM pokemons
WHERE pokemonName = 'Jolteon';

