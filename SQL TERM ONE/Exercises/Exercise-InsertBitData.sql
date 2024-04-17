USE tempdb;
GO
DROP DATABASE IF EXISTS l03b;
GO
CREATE DATABASE l03b;
GO
USE l03b;
GO
EXEC sp_changedbowner 'sa';
GO

CREATE TABLE person(
	personId INT,
	personRetired BIT,
	CONSTRAINT pk_person_personId PRIMARY KEY (personId)
);
SELECT * FROM person;

-- insert BIT data using 1 or 0
INSERT INTO person
VALUES
	(1, 1),	-- 1 is 'TRUE'
	(2, 0),	-- 0 is 'FALSE'
	(3, 2),	-- any non-zero numerics will be converted to 1 ('TRUE')
	(4, -1),
	(5, 1.1),
	(6, -1.1),
	(7, NULL);
SELECT * FROM person;


INSERT INTO person
VALUES (99, 'z');	-- conversion fails
SELECT * FROM person;


-- insert BIT data using 'TRUE' or 'FALSE'
INSERT INTO person
VALUES
    (10, 'TRUE'),	-- 'TRUE' is converted to 1 in storage; uppercase is preferred
    (11, 'FALSE'),	-- 'FALSE' is converted to 0; 
    (12, 'True'),	-- case insensitive
    (13, 'False'),
    (14, 'true'),
    (15, 'false'),
	(16, NULL);
SELECT * FROM person;

-- using mixed style raises err
INSERT INTO person
VALUES
    (20, 'TRUE'),
    (21, 'FALSE'),
	(22, 1),
	(23, 0);

SELECT * FROM person;
