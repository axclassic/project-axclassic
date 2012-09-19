 
ALTER TABLE `login`.`tblLoginServerAccounts` ADD COLUMN `FirstFlag` TINYINT(3)  NOT NULL DEFAULT 0 AFTER `LastIPAddress`;