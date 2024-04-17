-- subquery
--** subquery logic, case 1: to avoid hard coding
--** subquery logic, case 2: to find pk when using action queries

USE d1;
GO
EXEC sp_changedbowner 'sa';
GO

SELECT *
FROM player
ORDER BY playerScore DESC;

--* What is the highest playerScore?
SELECT playerScore
FROM player;
-- method 1
SELECT MAX(playerScore) AS "highestScore"
FROM player;

-- method 2
SELECT TOP 1 playerScore AS "highestScore"
FROM player
ORDER BY playerScore DESC;



--** subquery logic, case 1: to avoid hard coding
--q1, Who (which player) has the highest playerScore?
SELECT playerUserId, playerScore
FROM player
ORDER BY playerScore DESC;

-- possible method 1
SELECT playerUserId, MAX(playerScore)	-- error: Msg 8120, ...
FROM player;
-- possible method 2
SELECT playerUserId, playerScore
FROM player
WHERE playerScore = MAX(playerScore);	-- error: Msg 147, ...
-- possible method 3
SELECT TOP 1 playerUserId, playerScore	-- logical error: 2 players have same highest score
FROM player
ORDER BY playerScore DESC;
-- possible method 4 (modified from method 2)
SELECT playerUserId, playerScore
FROM player
WHERE playerScore = 6700;	-- 6700 is hard-coded:	} 6700 may be no longer the highest score after db's been updated
							--						} and need to find new highest score before running the qry
-- possible method 5: proper solution is to use subquery
SELECT playerUserId, playerScore AS "highestScore"
FROM player
WHERE playerScore = (	SELECT MAX(playerScore)
						FROM player
					);



--** subquery logic, case 2: to find pk when using action queries
SELECT * FROM player;

--q2, to add a score of 1000 for Merrill Macrillo
UPDATE player
SET playerScore = 1000
WHERE playerFirstName = 'Merrill';										-- problematic			if there are 2 Merrill

UPDATE player
SET playerScore = 1000
WHERE playerFirstName = 'Merrill' AND playerLastName = 'Macrillo';		-- problematic again	if there are 2 Merrill Macrillo

UPDATE player
SET playerScore = 1000
WHERE playerId = (	SELECT playerId
					FROM player
					WHERE playerFirstName = 'Merrill' AND playerLastName = 'Macrillo'
				 );

-- SELECT * FROM player;
