-- DB update 2021_02_12_00 -> 2021_02_12_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_02_12_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_02_12_00 2021_02_12_01 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1613009482277647100'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1613009482277647100');

/* 
NPC 3518
Thomas Miller - Stormwind.

Fix empty broadcast text and space out broadcast text actions. 
*/

UPDATE `waypoint_scripts` SET `dataint`=1102 WHERE `guid`=285;

DELETE FROM `waypoint_data` WHERE `id`=797230;
INSERT INTO `waypoint_data` VALUES
/* ID   POINT    X        Y        Z      O   DELAY    ACTION     */
(797230,  1, -8831.81, 543.054, 96.8538, 1.4, 60000, 0,   0, 100, 0),
(797230,  2, -8823.8,  554.302, 95.1343,   0,     0, 0,   0, 100, 0),
(797230,  3, -8816.18, 563.58,  94.1516,   0,     0, 0,   0, 100, 0),
(797230,  4, -8812.27, 575.284, 94.8673,   0,     0, 0, 271, 100, 0),
(797230,  5, -8798.45, 588.131, 97.2749,   0,     0, 0,   0, 100, 0),
(797230,  6, -8781.38, 601.002, 97.395,    0,     0, 0,   0, 100, 0),
(797230,  7, -8770.7,  609.208, 97.2416,   0,     0, 0,   0, 100, 0),
(797230,  8, -8761.96, 617.745, 99.1796,   0,     0, 0,   0, 100, 0),
(797230,  9, -8757.63, 628.577, 102.216,   0,     0, 0,   0, 100, 0),
(797230, 10, -8759.15, 642.457, 103.654,   0,     0, 0,   0, 100, 0),
(797230, 11, -8770.64, 661.869, 103.528,   0,     0, 0,   0, 100, 0),
(797230, 12, -8787.04, 680.217, 102.245,   0,     0, 0,   0, 100, 0),
(797230, 13, -8804.12, 683.305, 100.683,   0,     0, 0,   0, 100, 0),
(797230, 14, -8815.72, 680.448, 98.2183,   0,     0, 0,   0, 100, 0),
(797230, 15, -8831.55, 674.228, 98.3358,   0,     0, 0, 272, 100, 0),
(797230, 16, -8843.12, 667.22,  97.8051,   0,     0, 0,   0, 100, 0),
(797230, 17, -8852.2,  659.229, 96.9603,   0,     0, 0,   0, 100, 0),
(797230, 18, -8841.74, 637.862, 95.1661,   0,     0, 0,   0, 100, 0),
(797230, 19, -8834.06, 634.756, 94.3203,   0,     0, 0,   0, 100, 0),
(797230, 20, -8817.96, 641.332, 94.2293,   0,     0, 0,   0, 100, 0),
(797230, 21, -8811.88, 634.469, 94.2293,   0,     0, 0,   0, 100, 0),
(797230, 22, -8813.45, 625.373, 94.1306,   0,     0, 0,   0, 100, 0),
(797230, 23, -8827.66, 620.367, 94.2332, 3.7, 60000, 0, 274, 100, 0),
(797230, 24, -8846.61, 601.6,   92.6069,   0,     0, 0,   0, 100, 0),
(797230, 25, -8859.18, 589.015, 92.709,    0,     0, 0,   0, 100, 0),
(797230, 26, -8874.99, 572.27,  93.4734,   0,     0, 0,   0, 100, 0),
(797230, 27, -8883.26, 572.174, 92.8046,   0,     0, 0,   0, 100, 0),
(797230, 28, -8886.9,  579.094, 92.9168,   0,     0, 0,   0, 100, 0),
(797230, 29, -8889.38, 585.29,  93.3191,   0,     0, 0,   0, 100, 0),
(797230, 30, -8869.45, 596.649, 92.4409,   0,     0, 0,   0, 100, 0),
(797230, 31, -8860.44, 601.856, 92.161,    0,     0, 0,   0, 100, 0),
(797230, 32, -8847.27, 610.523, 92.6533,   0,     0, 0, 273, 100, 0),
(797230, 33, -8837.06, 617.396, 93.0252,   0,     0, 0,   0, 100, 0),
(797230, 34, -8834.75, 618.401, 93.3229,   0,     0, 0,   0, 100, 0),
(797230, 35, -8827.87, 621.207, 94.1001,   0,     0, 0,   0, 100, 0),
(797230, 36, -8809.26, 603.528, 96.2749,   0,     0, 0,   0, 100, 0),
(797230, 37, -8806.62, 593.729, 97.1852,   0,     0, 0,   0, 100, 0),
(797230, 38, -8820.32, 573.328, 94.1915,   0,     0, 0,   0, 100, 0),
(797230, 39, -8830.69, 558.865, 94.8851,   0,     0, 0,   0, 100, 0),
(797230, 40, -8834.06, 549.867, 96.194,    0,     0, 0,   0, 100, 0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
