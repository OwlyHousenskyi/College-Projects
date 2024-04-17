--
USE tempdb;
GO
DROP DATABASE IF EXISTS finalProject;
GO
CREATE DATABASE finalProject;
GO
USE finalProject;
GO
--1:
CREATE TABLE trainer(
 trainerId INT PRIMARY KEY,
 trainerName VARCHAR(50)
);
--
INSERT INTO trainer(trainerId, trainerName) VALUES 
  (1, 'Alain'),
  (2, 'Ash'),
  (3, 'Brock'),
  (4, 'Erika'),
  (5, 'Misty');
--
SELECT * FROM trainer;
--2:
CREATE TABLE pokemon(
 pokemonId INT PRIMARY KEY,
 pokemonDexNum VARCHAR(3) UNIQUE NOT NULL,
 pokemonName VARCHAR(50) UNIQUE NOT NULL,
 pokemonHeightCm INT CHECK (pokemonHeightCm >= 0 AND pokemonHeightCm <= 1000),
 pokemonWeightKg DECIMAL(6,2) CHECK (pokemonWeightKg >= 0 AND pokemonWeightKg <= 1000),
 pokemonColor VARCHAR(20),
 pokemonType VARCHAR(15) DEFAULT 'Grass',
 trainerId INT NOT NULL,
 evolvedFrom INT,
 CONSTRAINT fk_trainer FOREIGN KEY (trainerId) REFERENCES trainer(trainerId),
 CONSTRAINT fk_evolvedFrom FOREIGN KEY (evolvedFrom) REFERENCES pokemon(pokemonId)
);
--
INSERT INTO pokemon (pokemonId, pokemonDexNum, pokemonName, pokemonHeightCm, pokemonWeightKg, pokemonColor, pokemonType, trainerId, evolvedFrom) VALUES
  (1, '005', 'Charmeleon', 129, 23.00, 'Red', 'Fire', 1, NULL),
  (2, '006', 'Charizard', 190, 94.50, 'Orange', 'Fire', 1, 1),
  (3, '025', 'Pikachu', 61, 10.50, 'Yellow', 'Electric', 2, NULL),
  (4, '044', 'Gloom', 99, 12.60, 'Brown', 'Grass', 3, NULL),
  (5, '045', 'Vileplume', 139, 22.60, 'Pink', 'Grass', 4, 4),
  (6, '074', 'Geodude', 61, 24.00, 'Gray', 'Rock', 3, NULL),
  (7, '095', 'Onix', 899, 214.00, 'Gray', 'Rock', 3, NULL),
  (8, '111', 'Rhyhorn', 119, 119.00, 'Gray', 'Ground', 3, NULL),
  (9, '114', 'Tangela', 119, 39.00, 'Blue', 'Grass', 4, NULL),
  (10, '120', 'Staryu', 99, 38.50, 'Brown', 'Water', 5, NULL),
  (11, '121', 'Starmie', 129, 84.00, 'Silver', 'Water', 5, 10),
  (12, '133', 'Eevee', 50, 10.50, 'Brown', 'Normal', 5, NULL),
  (13, '134', 'Vaporeon', 119, 33.00, 'Blue', 'Water', 5, 12),
  (14, '135', 'Jolteon', 104, 28.50, 'Yellow', 'Electric', 5, 12),
  (15, '136', 'Flareon', 104, 29.00, 'Orange', 'Fire', 5, 12),
  (16, '182', 'Bellossom', 61, 9.80, 'Green', 'Grass', 3, 4),
  (17, '189', 'Jumpluff', 99, 7.00, 'Purple', 'Grass', 4, NULL),
  (18, '196', 'Espeon', 109, 30.50, 'Purple', 'Psychic', 3, 12),
  (19, '197', 'Umbreon', 119, 31.00, 'Black', 'Dark', 3, 12),
  (20, '248', 'Tyranitar', 221, 206.00, 'Green', 'Rock', 1, NULL),
  (21, '376', 'Metagross', 180, 554.00, 'Gray', 'Steel', 1, NULL),
  (22, '461', 'Weavile', 129, 38.00, 'Purple', 'Dark', 1, NULL),
  (23, '470', 'Leafon', 119, 29.50, 'Green', 'Grass', 2, 12),
  (24, '722', 'Rowlet', 50, 5.50, 'Brown', 'Grass', 2, NULL),
  (25, '726', 'Torracat', 91, 29.00, 'Red', 'Fire', 2, NULL),
  (26, '744', 'Rockruff', 71, 13.20, 'Brown', 'Rock', 2, NULL),
  (27, '745', 'Lycanroc', 99, 29.00, 'Gray', 'Rock', 2, 26);
--
SELECT * FROM pokemon;
--3:
CREATE TABLE battle(
 battleId INT PRIMARY KEY,
 battleName VARCHAR(30) NOT NULL UNIQUE
);
--
INSERT INTO battle(battleId, battleName) VALUES
  (1, 'Battle Royale'),
  (2, 'Full Batle'),
  (3, 'Sky Battle'),
  (4, 'Team Battle'),
  (5, 'Rotation Battle'),
  (6, 'Double Battle');
--
SELECT * FROM battle
ORDER BY battleId, battleName;
--4:
CREATE TABLE battleLocation(
 battleLocationId INT PRIMARY KEY,
 battleLocationName VARCHAR(50) NOT NULL UNIQUE
);
--
INSERT INTO battleLocation(battleLocationId, battleLocationName) VALUES
  (1, 'Battle Royale Dome'),
  (2, 'Mt.Silver'),
  (3, 'Azure Bay'),
  (4, 'Summer Camp'),
  (5, 'Driftevil City'),
  (6, 'Pokemon Colosseum');
--
SELECT * FROM battleLocation
ORDER BY battleLocationId, battleLocationName;
--5:
CREATE TABLE record (
    recordId INT PRIMARY KEY,
    recordExpPoint INT CHECK(recordExpPoint >= 0 AND recordExpPoint <= 1000000000),
    pokemonId INT,
    CONSTRAINT fk_pokemon FOREIGN KEY (pokemonId) REFERENCES pokemon(pokemonId),
    battleId INT,
    CONSTRAINT fk_battle FOREIGN KEY (battleId) REFERENCES battle(battleId),
    battleLocationId INT,
    CONSTRAINT fk_battleLocation FOREIGN KEY (battleLocationId) REFERENCES battleLocation(battleLocationId),
    CONSTRAINT uq_pokemon_battle_location UNIQUE (pokemonId, battleId, battleLocationId)
);
--
INSERT INTO record(recordId, recordExpPoint, pokemonId, battleId, battleLocationId) VALUES
  (1, 47, 2, 1, 1),
  (2, 67, 2, 2, 2),
  (3, 82, 2, 3, 3),
  (4, 82, 2, 4, 4),
  (5, 47, 3, 2, 2),
  (6, 87, 3, 5, 5),
  (7, 52, 3, 4, 4),
  (8, 67, 5, 4, 4), 
  (9, 52, 6, 1, 1),
  (10, 92, 6, 4, 4),
  (11, 107, 7, 6, 6),
  (12, 92, 7, 5, 5),
  (13, 72, 7, 4, 4),
  (14, 97, 8, 6, 6),
  (15, 92, 8, 4, 4),
  (16, 92, 9, 2, 2),
  (17, 62, 9, 5, 5),
  (18, 87, 9, 4, 4),
  (19, 47, 10, 5, 5),
  (20, 62, 11, 6, 6),
  (21, 57, 11, 4, 4),
  (22, 77, 17, 1, 1),
  (23, 77, 17, 6, 6),
  (24, 42, 17, 3, 3),
  (25, 87, 20, 1, 1),
  (26, 77, 20, 2, 2),
  (27, 42, 21, 1, 1),
  (28, 67, 21, 6, 6),
  (29, 57, 21, 4, 4),
  (30, 47, 22, 2, 2),
  (31, 92, 22, 4, 4),
  (32, 112, 24, 3, 3),
  (33, 82, 25, 1, 1),
  (34, 112, 25, 6, 6),
  (35, 57, 25, 2, 2),
  (36, 102, 27, 1, 1),
  (37, 92, 27, 4, 4);
--
SELECT * FROM record;
--1:
SELECT pokemon.pokemonName AS 'Pokemon Name', pokemon.pokemonType AS 'Pokemon Type',
COALESCE(battle.battleName, 'None') AS 'Battle Name', 
COALESCE(battleLocation.battleLocationName, 'None') AS 'Battle Location'
FROM pokemon
LEFT JOIN battle ON pokemon.pokemonId = battle.battleId
LEFT JOIN battleLocation ON pokemon.pokemonId = battleLocation.battleLocationId
WHERE pokemon.pokemonColor = 'Green'
ORDER BY pokemon.pokemonName, battle.battleName;
--2:
SELECT CONCAT(p1.pokemonDexNum, ' - ', p1.pokemonName, ': ', p1.pokemonWeightKg, ' kg') AS 'Base Pokemon',
       CONCAT(p2.pokemonDexNum, ' - ', p2.pokemonName, ': ', p2.pokemonWeightKg, ' kg') AS 'Evolved into...'
FROM pokemon p1
INNER JOIN pokemon p2 ON p1.pokemonId = p2.evolvedFrom 
ORDER BY p1.pokemonDexNum, p2.pokemonName;
--3:
SELECT t.trainerName, COUNT(p.pokemonId) AS NumEvolvedPokemon
FROM trainer t
LEFT JOIN pokemon p ON t.trainerId = p.trainerId
WHERE p.evolvedFrom IS NOT NULL
GROUP BY t.trainerName
ORDER BY t.trainerName;
--4:
SELECT CONCAT(p1.pokemonDexNum, ' - ', p1.pokemonName, ' (', p1.pokemonColor, ')') AS 'Base Pokemon',
       CONCAT(p2.pokemonDexNum, ' - ', p2.pokemonName, ' (', p2.pokemonColor, ')') AS 'Evolved into...',
       p1.pokemonType AS 'Pokemon Type'
FROM pokemon AS p1
JOIN pokemon AS p2 ON p1.pokemonId = p2.evolvedFrom
WHERE p1.pokemonType = p2.pokemonType AND p1.pokemonType = p2.pokemonType
ORDER BY p1.pokemonDexNum ASC;
--5:
SELECT p1.pokemonName, p1.pokemonHeightCm, p1.pokemonType, p2.pokemonName AS evolvedFrom
FROM pokemon p1
LEFT JOIN pokemon p2 ON p1.evolvedFrom = p2.pokemonId
WHERE p1.pokemonHeightCm = (
    SELECT MAX(pokemonHeightCm)
    FROM pokemon
    WHERE pokemonType = p1.pokemonType AND evolvedFrom IS NOT NULL
)
ORDER BY p1.pokemonHeightCm DESC;
--


