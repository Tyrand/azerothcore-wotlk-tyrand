-- DB update 2020_09_12_01 -> 2020_09_13_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2020_09_12_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2020_09_12_01 2020_09_13_00 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1598302868929248922'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1598302868929248922');
UPDATE `gameobject_loot_template` SET `QuestRequired` = 0 WHERE `item` = 43059;
DELETE FROM `spell_target_position` WHERE `ID` = 57553;
INSERT INTO `spell_target_position` VALUES
(57553, 0, 571, 5875.43, -1981.37, 234.671, 0, 0); -- Escape Voltarus

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
