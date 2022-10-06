-- 1. Because we cannot truncate the tables. delete all existing tables (https://www.tutorialspoint.com/sqlite/sqlite_truncate_table.htm)
DROP TABLE IF EXISTS `cupids`;
DROP TABLE IF EXISTS `known_ported`;
DROP TABLE IF EXISTS `S1`;
DROP TABLE IF EXISTS `S3`;
DROP TABLE IF EXISTS `S5`;
DROP TABLE IF EXISTS `S7`;
DROP TABLE IF EXISTS `S8`;
DROP TABLE IF EXISTS `S9`;
DROP TABLE IF EXISTS `SABC`;

-- 2. Recreate all tables, not numbering_allocation for now though, just in case something goes wrong
 CREATE TABLE`cupids`(`cupid`integer NOT NULL,`cp`varchar(255)DEFAULT NULL,`updated`date DEFAULT NULL,`last_retrieved`timestamp NULL DEFAULT current_timestamp,PRIMARY KEY(`cupid`));

CREATE TABLE`known_ported`(`number`integer NOT NULL,`status`varchar(64)DEFAULT NULL,`cp`varchar(255)DEFAULT NULL,`num_length`varchar(16)DEFAULT NULL,`use`varchar(255)DEFAULT NULL,`last_change`timestamp NULL DEFAULT NULL,`timestamp`timestamp NULL DEFAULT NULL,`exclusive`integer DEFAULT 0,`exclusive_cp_cupid`integer DEFAULT NULL,PRIMARY KEY(`number`));

CREATE TABLE`S1`(`NMSNumberBlock`varchar(64)DEFAULT NULL,`Status`varchar(255)DEFAULT NULL,`Communications Provider`varchar(255)DEFAULT NULL,`Number Length`varchar(255)DEFAULT NULL,`Change`varchar(255)DEFAULT NULL,`Notes`varchar(255)DEFAULT NULL);

CREATE TABLE`S3`(`NMSNumberBlock`varchar(64)DEFAULT NULL,`Status`varchar(255)DEFAULT NULL,`Communications Provider`varchar(255)DEFAULT NULL,`Number Length`varchar(255)DEFAULT NULL,`Change`varchar(255)DEFAULT NULL,`Notes`varchar(255)DEFAULT NULL);

CREATE TABLE`S5`(`NMSNumberBlock`varchar(64)DEFAULT NULL,`Status`varchar(255)DEFAULT NULL,`Communications Provider`varchar(255)DEFAULT NULL,`Number Length`varchar(255)DEFAULT NULL,`Change`varchar(255)DEFAULT NULL,`Notes`varchar(255)DEFAULT NULL);

CREATE TABLE`S7`(`NMSNumberBlock`varchar(64)DEFAULT NULL,`Status`varchar(255)DEFAULT NULL,`Communications Provider`varchar(255)DEFAULT NULL,`Number Length`varchar(255)DEFAULT NULL,`Change`varchar(255)DEFAULT NULL);

CREATE TABLE`S8`(`NMSNumberBlock`varchar(64)DEFAULT NULL,`Status`varchar(255)DEFAULT NULL,`Communications Provider`varchar(255)DEFAULT NULL,`Number Length`varchar(255)DEFAULT NULL,`Change`varchar(255)DEFAULT NULL);

CREATE TABLE`S9`(`NMSNumberBlock`varchar(64)DEFAULT NULL,`Status`varchar(255)DEFAULT NULL,`Communications Provider`varchar(255)DEFAULT NULL,`Number Length`varchar(255)DEFAULT NULL,`Change`varchar(255)DEFAULT NULL);

-- 3. Load the data in the numbering files to the Temp Tables
.mode csv
.import '| tail -n +2 /tmp/numbering/S1.csv' S1
.import '| tail -n +2 /tmp/numbering/S3.csv' S3
.import '| tail -n +2 /tmp/numbering/S5.csv' S5
.import '| tail -n +2 /tmp/numbering/S7.csv' S7
.import '| tail -n +2 /tmp/numbering/S8.csv' S8
.import '| tail -n +2 /tmp/numbering/S9.csv' S9

-- 4. @TODO - Add CUPIDs

-- 5. Add Known Ported Data - This includes known service numbers and other lovlieness
INSERT INTO "known_ported" ("number", "status", "cp", "num_length", "use", "last_change", "timestamp", "exclusive", "exclusive_cp_cupid") VALUES
('11349600', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Leeds', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11349601', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Leeds', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11349602', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Leeds', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11349603', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Leeds', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11349604', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Leeds', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11349605', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Leeds', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11349606', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Leeds', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11349607', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Leeds', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11349608', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Leeds', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11349609', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Leeds', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11449600', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Sheffield', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11449601', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Sheffield', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11449602', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Sheffield', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11449603', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Sheffield', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11449604', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Sheffield', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11449605', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Sheffield', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11449606', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Sheffield', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11449607', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Sheffield', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11449608', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Sheffield', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11449609', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Sheffield', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11549600', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Nottingham', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11549601', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Nottingham', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11549602', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Nottingham', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11549603', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Nottingham', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11549604', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Nottingham', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11549605', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Nottingham', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11549606', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Nottingham', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11549607', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Nottingham', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11549608', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Nottingham', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11549609', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Nottingham', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11649600', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Leicester', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11649601', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Leicester', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11649602', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Leicester', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11649603', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Leicester', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11649604', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Leicester', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11649605', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Leicester', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11649606', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Leicester', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11649607', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Leicester', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11649608', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Leicester', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11649609', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Leicester', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11749600', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Bristol', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11749601', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Bristol', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11749602', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Bristol', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11749603', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Bristol', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11749604', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Bristol', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11749605', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Bristol', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11749606', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Bristol', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11749607', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Bristol', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11749608', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Bristol', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11749609', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Bristol', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11849600', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Reading', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11849601', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Reading', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11849602', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Reading', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11849603', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Reading', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11849604', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Reading', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11849605', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Reading', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11849606', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Reading', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11849607', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Reading', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11849608', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Reading', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('11849609', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Reading', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('12149600', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Birmingham', NULL, 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('12149601', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Birmingham', NULL, 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('12149602', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Birmingham', NULL, 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('12149603', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Birmingham', NULL, 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('12149604', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Birmingham', NULL, 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('12149605', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Birmingham', NULL, 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('12149606', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Birmingham', NULL, 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('12149607', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Birmingham', NULL, 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('12149608', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Birmingham', NULL, 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('12149609', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Birmingham', NULL, 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('13149600', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Edinburgh', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('13149601', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Edinburgh', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('13149602', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Edinburgh', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('13149603', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Edinburgh', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('13149604', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Edinburgh', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('13149605', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Edinburgh', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('13149606', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Edinburgh', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('13149607', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Edinburgh', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('13149608', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Edinburgh', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('13149609', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Edinburgh', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('14149600', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Glasgow', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('14149601', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Glasgow', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('14149602', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Glasgow', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('14149603', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Glasgow', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('14149604', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Glasgow', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('14149605', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Glasgow', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('14149606', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Glasgow', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('14149607', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Glasgow', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('14149608', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Glasgow', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('14149609', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Glasgow', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('15149600', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Liverpool', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('15149601', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Liverpool', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('15149602', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Liverpool', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('15149603', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Liverpool', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('15149604', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Liverpool', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('15149605', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Liverpool', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('15149606', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Liverpool', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('15149607', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Liverpool', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('15149608', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Liverpool', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('15149609', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Liverpool', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('16149600', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Manchester', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('16149601', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Manchester', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('16149602', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Manchester', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('16149603', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Manchester', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('16149604', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Manchester', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('16149605', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Manchester', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('16149606', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Manchester', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('16149607', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Manchester', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('16149608', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Manchester', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('16149609', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Manchester', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('16329600', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - No Geographic Area', '4+6', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('16329601', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - No Geographic Area', '4+6', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('16329602', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - No Geographic Area', '4+6', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('16329603', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - No Geographic Area', '4+6', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('16329604', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - No Geographic Area', '4+6', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('16329605', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - No Geographic Area', '4+6', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('16329606', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - No Geographic Area', '4+6', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('16329607', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - No Geographic Area', '4+6', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('16329608', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - No Geographic Area', '4+6', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('16329609', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - No Geographic Area', '4+6', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('19149800', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Tyneside/Durham/Sunderland', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('19149801', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Tyneside/Durham/Sunderland', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('19149802', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Tyneside/Durham/Sunderland', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('19149803', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Tyneside/Durham/Sunderland', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('19149804', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Tyneside/Durham/Sunderland', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('19149805', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Tyneside/Durham/Sunderland', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('19149806', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Tyneside/Durham/Sunderland', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('19149807', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Tyneside/Durham/Sunderland', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('19149808', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Tyneside/Durham/Sunderland', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('19149809', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Tyneside/Durham/Sunderland', '3+7', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('20794600', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - London', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('20794601', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - London', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('20794602', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - London', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('20794603', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - London', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('20794604', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - London', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('20794605', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - London', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('20794606', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - London', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('20794607', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - London', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('20794608', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - London', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('20794609', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - London', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('28964960', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Northern Ireland', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('28964961', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Northern Ireland', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('28964962', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Northern Ireland', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('28964963', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Northern Ireland', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('28964964', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Northern Ireland', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('28964965', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Northern Ireland', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('28964966', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Northern Ireland', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('28964967', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Northern Ireland', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('28964968', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Northern Ireland', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('28964969', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Northern Ireland', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('29201800', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Cardiff', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('29201801', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Cardiff', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('29201802', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Cardiff', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('29201803', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Cardiff', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('29201804', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Cardiff', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('29201805', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Cardiff', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('29201806', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Cardiff', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('29201807', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Cardiff', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('29201808', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Cardiff', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('29201809', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Cardiff', '2+8', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('30699900', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - UK-Wide', NULL, 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('30699901', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - UK-Wide', NULL, 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('30699902', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - UK-Wide', NULL, 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('30699903', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - UK-Wide', NULL, 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('30699904', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - UK-Wide', NULL, 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('30699905', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - UK-Wide', NULL, 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('30699906', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - UK-Wide', NULL, 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('30699907', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - UK-Wide', NULL, 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('30699908', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - UK-Wide', NULL, 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('30699909', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - UK-Wide', NULL, 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('77009000', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Mobile', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('77009001', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Mobile', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('77009002', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Mobile', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('77009003', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Mobile', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('77009004', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Mobile', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('77009005', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Mobile', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('77009006', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Mobile', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('77009007', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Mobile', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('77009008', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Mobile', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('77009009', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Mobile', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('80815700', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Freephone', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('80815701', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Freephone', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('80815702', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Freephone', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('80815703', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Freephone', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('80815704', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Freephone', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('80815705', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Freephone', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('80815706', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Freephone', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('80815707', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Freephone', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('80815708', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Freephone', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('80815709', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Freephone', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('90987900', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Premium', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('90987901', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Premium', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('90987902', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Premium', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('90987903', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Premium', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('90987904', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Premium', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('90987905', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Premium', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('90987906', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Premium', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('90987907', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Premium', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('90987908', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Premium', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('90987909', 'Protected', 'Ofcom TV and Drama Programme Range - 0000-0999 - Premium', '10 digit numbers', 'Protected number range', NULL, '2017-07-10 15:41:54', '\0', NULL),
('1269849011', 'Protected', 'BT Default CLI for Invalid CLI Replacement', NULL, 'Used on the BT Network when an invalid number is presented', NULL, '2017-11-02 15:00:36', '\0', NULL),
('7953966066', 'Allocated', 'EE SMS Text to Speech Delivery service', NULL, 'Used on the EE Network when an SMS is sent to a landline number or number otherwise incapable of receiving SMS''. Number can be dialled back to unsubscribe from service.', NULL, '2018-01-08 11:57:44', '\0', NULL),
('8456021111', 'Allocated', 'BT SMS Text to Speech Delivery service', NULL, 'Used on the BT Network when an SMS is sent to a landline number or number otherwise incapable of receiving SMS''. 08005875252 can be dialled to unsubscribe from service.', NULL, '2018-01-08 11:56:49', '\0', NULL);

-- 6. Truncate the live table then sanitise and insert the temp data into the live table
DROP TABLE `numbering_allocation`;
CREATE TABLE`numbering_allocation`(`number`integer NOT NULL,`status`varchar(64)DEFAULT NULL,`cp`varchar(255)DEFAULT NULL,`num_length`varchar(16)DEFAULT NULL,`use`varchar(255)DEFAULT NULL,`last_change`timestamp NULL DEFAULT NULL,`timestamp`timestamp NULL DEFAULT NULL,PRIMARY KEY(`number`));

INSERT INTO`numbering_allocation`(`number`,`status`,`cp`,`num_length`,`last_change`,`use`,`timestamp`)SELECT REPLACE(`NMSNumberBlock`,' ','')AS`number_range`,`status`,CASE`Communications Provider`WHEN"" THEN NULL ELSE`Communications Provider`END,CASE`Number Length`WHEN"" THEN NULL ELSE`Number Length`END,CASE`Change`WHEN"" THEN NULL ELSE(SUBSTR(`Change`,-4)||"-"||SUBSTR(SUBSTR(`Change`,-7),0,3)||"-"||SUBSTR(`Change`,0,3)||" 00:00:00")END,NULL,DATETIME('now','localtime')FROM`S1`;

INSERT INTO`numbering_allocation`(`number`,`status`,`cp`,`num_length`,`last_change`,`use`,`timestamp`)SELECT REPLACE(`NMSNumberBlock`,' ','')AS`number_range`,`status`,CASE`Communications Provider`WHEN"" THEN NULL ELSE`Communications Provider`END,CASE`Number Length`WHEN"" THEN NULL ELSE`Number Length`END,CASE`Change`WHEN"" THEN NULL ELSE(SUBSTR(`Change`,-4)||"-"||SUBSTR(SUBSTR(`Change`,-7),0,3)||"-"||SUBSTR(`Change`,0,3)||" 00:00:00")END,NULL,DATETIME('now','localtime')FROM`S3`;

INSERT INTO`numbering_allocation`(`number`,`status`,`cp`,`num_length`,`last_change`,`use`,`timestamp`)SELECT REPLACE(`NMSNumberBlock`,' ','')AS`number_range`,`status`,CASE`Communications Provider`WHEN"" THEN NULL ELSE`Communications Provider`END,CASE`Number Length`WHEN"" THEN NULL ELSE`Number Length`END,CASE`Change`WHEN"" THEN NULL ELSE(SUBSTR(`Change`,-4)||"-"||SUBSTR(SUBSTR(`Change`,-7),0,3)||"-"||SUBSTR(`Change`,0,3)||" 00:00:00")END,NULL,DATETIME('now','localtime')FROM`S5`;

INSERT INTO`numbering_allocation`(`number`,`status`,`cp`,`num_length`,`last_change`,`use`,`timestamp`)SELECT REPLACE(`NMSNumberBlock`,' ','')AS`number_range`,`status`,CASE`Communications Provider`WHEN"" THEN NULL ELSE`Communications Provider`END,CASE`Number Length`WHEN"" THEN NULL ELSE`Number Length`END,CASE`Change`WHEN"" THEN NULL ELSE(SUBSTR(`Change`,-4)||"-"||SUBSTR(SUBSTR(`Change`,-7),0,3)||"-"||SUBSTR(`Change`,0,3)||" 00:00:00")END,NULL,DATETIME('now','localtime')FROM`S7`;

INSERT INTO`numbering_allocation`(`number`,`status`,`cp`,`num_length`,`last_change`,`use`,`timestamp`)SELECT REPLACE(`NMSNumberBlock`,' ','')AS`number_range`,`status`,CASE`Communications Provider`WHEN"" THEN NULL ELSE`Communications Provider`END,CASE`Number Length`WHEN"" THEN NULL ELSE`Number Length`END,CASE`Change`WHEN"" THEN NULL ELSE(SUBSTR(`Change`,-4)||"-"||SUBSTR(SUBSTR(`Change`,-7),0,3)||"-"||SUBSTR(`Change`,0,3)||" 00:00:00")END,NULL,DATETIME('now','localtime')FROM`S8`;

INSERT INTO`numbering_allocation`(`number`,`status`,`cp`,`num_length`,`last_change`,`use`,`timestamp`)SELECT REPLACE(`NMSNumberBlock`,' ','')AS`number_range`,`status`,CASE`Communications Provider`WHEN"" THEN NULL ELSE`Communications Provider`END,CASE`Number Length`WHEN"" THEN NULL ELSE`Number Length`END,CASE`Change`WHEN"" THEN NULL ELSE(SUBSTR(`Change`,-4)||"-"||SUBSTR(SUBSTR(`Change`,-7),0,3)||"-"||SUBSTR(`Change`,0,3)||" 00:00:00")END,NULL,DATETIME('now','localtime')FROM`S9`;

-- 7. Do a bit of tidying up
DELETE FROM `numbering_allocation` WHERE `number` IS NULL;
UPDATE `numbering_allocation` SET `use` = "Protected number range" WHERE `status` = "Protected" AND `use` IS NULL;
UPDATE `numbering_allocation` SET `cp` = "None" WHERE `status` = "Protected" AND `cp` IS NULL;
UPDATE `numbering_allocation` SET `cp` = "None" WHERE `status` = "Free for National Dialing Only" AND `cp` IS NULL;
UPDATE `numbering_allocation` SET `cp` = "None" WHERE `status` = "Free" AND `cp` IS NULL;
UPDATE `numbering_allocation` SET `cp` = "None" WHERE `status` = "Reserved" AND `cp` IS NULL;
UPDATE `numbering_allocation` SET `cp` = "None" WHERE `status` = "Quarantined" AND `cp` IS NULL;
UPDATE `numbering_allocation` SET `cp` = "None" WHERE `status` = "Designated" AND `cp` IS NULL;
UPDATE `numbering_allocation` SET `cp` = "Awaiting Data" WHERE `status` = "Requested" AND `cp` IS NULL;
UPDATE `numbering_allocation` SET `use` = "No specific use data recorded" WHERE `use` IS NULL;

-- 8. Insert numbers from the "Known Ported" table
INSERT INTO `numbering_allocation` (`number`, `status`, `cp`, `num_length`, `use`, `last_change`, `timestamp`)
SELECT `number`, `status`, `cp`, `num_length`, `use`, `last_change`, `timestamp` FROM `known_ported`;
