ALTER TABLE `quest_globals`
DROP COLUMN `id`,
MODIFY COLUMN `charid` int(11) NOT NULL DEFAULT 0 FIRST ,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`charid`, `npcid`, `zoneid`, `name`);
