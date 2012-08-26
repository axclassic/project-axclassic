
 ALTER TABLE `ax_classic`.`botgroups` ADD COLUMN `hp` INTEGER  NOT NULL DEFAULT 0 AFTER `slot`,
 ADD COLUMN `mana` INTEGER  NOT NULL DEFAULT 0 AFTER `hp`;

ALTER TABLE `ax_classic`.`botgroups_b` ADD COLUMN `hp` INTEGER  NOT NULL DEFAULT 0 AFTER `slot`,
 ADD COLUMN `mana` INTEGER  NOT NULL DEFAULT 0 AFTER `hp`;

ALTER TABLE `ax_classic`.`botgroups_c` ADD COLUMN `hp` INTEGER  NOT NULL DEFAULT 0 AFTER `slot`,
 ADD COLUMN `mana` INTEGER  NOT NULL DEFAULT 0 AFTER `hp`;

ALTER TABLE `ax_classic`.`botbank` DROP PRIMARY KEY,
 ADD PRIMARY KEY  USING BTREE(`groupid`, `botid`);

UPDATE ax_classic.botbank SET groupid = 20;