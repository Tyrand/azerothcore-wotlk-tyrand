-- DB update 2021_05_30_00 -> 2021_06_17_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_auth' AND COLUMN_NAME = '2021_05_30_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_auth CHANGE COLUMN 2021_05_30_00 2021_06_17_00 bit;
SELECT sql_rev INTO OK FROM version_db_auth WHERE sql_rev = '1620146306002634000'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_auth` (`sql_rev`) VALUES ('1620146306002634000');

--
DROP TABLE IF EXISTS `ip2nation`;
DROP TABLE IF EXISTS `ip2nationCountries`;

--
-- END UPDATING QUERIES
--
UPDATE version_db_auth SET date = '2021_06_17_00' WHERE sql_rev = '1620146306002634000';
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
