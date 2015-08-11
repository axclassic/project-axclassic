ALTER TABLE `ax_classic`.`bottemp` ADD COLUMN `isdead` INTEGER  NOT NULL DEFAULT 0 AFTER `mana`;
ALTER TABLE `ax_classic`.`botbank` ADD COLUMN `isdead` INTEGER  NOT NULL DEFAULT 0 AFTER `mana`;
ALTER TABLE `ax_classic`.`botgroups` ADD COLUMN `isdead` INTEGER  NOT NULL DEFAULT 0 AFTER `mana`;
ALTER TABLE `ax_classic`.`botgroups_b` ADD COLUMN `isdead` INTEGER  NOT NULL DEFAULT 0 AFTER `mana`;
ALTER TABLE `ax_classic`.`botgroups_c` ADD COLUMN `isdead` INTEGER  NOT NULL DEFAULT 0 AFTER `mana`;
