-- CREATE user TABLE  
CREATE TABLE IF NOT EXISTS users
(
userid integer PRIMARY KEY UNIQUE  NOT NULL AUTO_INCREMENT,
name VARCHAR(40),
username VARCHAR(20),
address VARCHAR(40),
city VARCHAR(40),
state VARCHAR(2),
zip INT,
CHECK (CHAR_LENGTH(zip) = 5),
password VARCHAR(40)
);

-- CREATE location TABLE
CREATE TABLE IF NOT EXISTS location
(
itemid integer PRIMARY KEY UNIQUE  NOT NULL AUTO_INCREMENT,
type INT,
description VARCHAR(40),
lng REAL,
lat REAL
); 
-- CREATE photograph TABLE 
CREATE TABLE IF NOT EXISTS photograph
(
photoid INT,
locationid INT
);

-- Prompt 3 - Alter Tables
ALTER TABLE location MODIFY type INT NOT NULL;
ALTER TABLE location MODIFY description VARCHAR(40) NOT NULL;
ALTER TABLE location MODIFY lng REAL NOT NULL;
ALTER TABLE location MODIFY lat REAL NOT NULL;
ALTER TABLE users MODIFY name VARCHAR(40) NOT NULL;
ALTER TABLE users MODIFY userid VARCHAR(40) NOT NULL;
ALTER TABLE users MODIFY password VARCHAR(40) NOT NULL;
ALTER TABLE photograph MODIFY photoid INT NOT NULL;
ALTER TABLE photograph MODIFY locationid INT NOT NULL;

-- Prompt 4 - Create Index
CREATE UNIQUE INDEX id ON users (userid);
CREATE UNIQUE INDEX photo_id ON users (photoid);

-- Prompt 5 - Enter Data
INSERT INTO users (userid, name, username, address, city, state, zip, password)
VALUES
(1,	"Bonnie Buntcake",	"bbunt", 	"6709 Wonder Street",	"Wonderbread",	"OH",	46106,	"eclectic"),
(2,	"Sam Smarf",	"ssmarf",	"356 A Street",	"Beefy",	"PA",	19943,	"swimming"),
(3,	"Wendy Grog",	"wgrog",	"900 Star Street",	"Mary",	"MD",	21340,	"wells"),
(4,	"Joe Jogger",	"jjogger",	"183713 N North Street",	"Norther",	"WV",	51423,	"tarts");

 SELECT * FROM users;
 
-- Prompt 6 - Count Rows
SELECT count(*) 
FROM users;

-- Prompt 7 - Add Column

ALTER TABLE photograph ADD COLUMN userid VARCHAR(40) NOT NULL AFTER locationid;
 SELECT * FROM photograph;
 
--  Prompt 8 - Issue with New Column
ALTER TABLE photograph MODIFY userid VARCHAR(40) NOT NULL;
ALTER TABLE photograph
ADD FOREIGN KEY (userid)
REFERENCES users(userid);

-- Prompt 9 - Location and Photograph Table Updates
INSERT INTO location (type,	description,	lng,	lat)
VALUES
(1,	"Independence Hall",	794.35,	651.43),
(2,	"6709 Wonder Street",	323.41,	412.22),
(1,	"Sunrise",				221.45,	132.43),
(2,	"356 A Street",			123.32,	222.43),
(1,	"Mountains",			34.12,	87.99),
(2,	"900 Star Street",		1071.9,	206.45),
(1,	"Moonrise",				816.2,	111.2),
(2,	"183714 N North Street", 76.11,	11.176);

SELECT * 
FROM location;

INSERT INTO photograph(photoid,	locationid,	userid)
VALUES
(1,	11,	1),
(2,	9,	1),
(3,	3,	3),
(4,	8,	4);

SELECT *
FROM photograph;

-- Prompt 10 - Users
SELECT DISTINCT name FROM users;

-- Prompt 11 - Who's Taking Pictures?
SELECT  name
 FROM users AS u,  photograph AS p 
 WHERE u.userid IN(p.userid);
 
-- Prompt 12 - Unique Names
SELECT DISTINCT name
 FROM users AS u,  photograph AS p 
 WHERE u.userid IN(p.userid);