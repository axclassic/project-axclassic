DROP TABLE IF EXISTS botgroups;
DROP TABLE IF EXISTS botinventory;
DROP TABLE IF EXISTS bots;

CREATE TABLE  bots (
  `BotID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BotOwnerCharacterID` int(10) unsigned NOT NULL,
  `BotSpellsID` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` varchar(64) NOT NULL,
  `LastName` varchar(32) DEFAULT NULL,
  `BotLevel` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `Race` smallint(5) NOT NULL DEFAULT '0',
  `Class` tinyint(2) NOT NULL DEFAULT '0',
  `Gender` tinyint(2) NOT NULL DEFAULT '0',
  `Size` float NOT NULL DEFAULT '0',
  `Face` int(10) NOT NULL DEFAULT '1',
  `LuclinHairStyle` int(10) NOT NULL DEFAULT '1',
  `LuclinHairColor` int(10) NOT NULL DEFAULT '1',
  `LuclinEyeColor` int(10) NOT NULL DEFAULT '1',
  `LuclinEyeColor2` int(10) NOT NULL DEFAULT '1',
  `LuclinBeardColor` int(10) NOT NULL DEFAULT '1',
  `LuclinBeard` int(10) NOT NULL DEFAULT '0',
  `DrakkinHeritage` int(10) NOT NULL DEFAULT '0',
  `DrakkinTattoo` int(10) NOT NULL DEFAULT '0',
  `DrakkinDetails` int(10) NOT NULL DEFAULT '0',
  `MR` smallint(5) NOT NULL DEFAULT '0',
  `CR` smallint(5) NOT NULL DEFAULT '0',
  `DR` smallint(5) NOT NULL DEFAULT '0',
  `FR` smallint(5) NOT NULL DEFAULT '0',
  `PR` smallint(5) NOT NULL DEFAULT '0',
  `AC` smallint(5) NOT NULL DEFAULT '0',
  `STR` mediumint(8) NOT NULL DEFAULT '75',
  `STA` mediumint(8) NOT NULL DEFAULT '75',
  `DEX` mediumint(8) NOT NULL DEFAULT '75',
  `AGI` mediumint(8) NOT NULL DEFAULT '75',
  `_INT` mediumint(8) NOT NULL DEFAULT '80',
  `WIS` mediumint(8) NOT NULL DEFAULT '75',
  `CHA` mediumint(8) NOT NULL DEFAULT '75',
  `ATK` mediumint(9) NOT NULL DEFAULT '0',
  `BotCreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LastSpawnDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TotalPlayTime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`BotID`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS botinventory (
  BotInventoryID integer unsigned NOT NULL auto_increment,
  BotID integer unsigned NOT NULL DEFAULT '0',
  SlotID integer signed NOT NULL DEFAULT '0',
  ItemID integer unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (BotInventoryID),
  KEY FK_botinventory_1 (BotID),
  CONSTRAINT FK_botinventory_1 FOREIGN KEY (BotID) REFERENCES bots (BotID)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS botgroups (
  GroupID integer unsigned NOT NULL default 0,
  CharID integer unsigned NOT NULL default 0,
  BotID integer unsigned NOT NULL default 0,
  Slot integer unsigned NOT NULL default 0,
  PRIMARY KEY (BotID),
  CONSTRAINT FK_botgroups_1 FOREIGN KEY (BotID) REFERENCES bots (BotID)
) ENGINE=InnoDB;

delete from rule_values where rule_name like 'Bots%' and ruleset_id = 1;

INSERT INTO rule_values VALUES ('1', 'Bots:BotManaRegen', '2.0', '');
INSERT INTO rule_values VALUES ('1', 'Bots:BotFinishBuffing', 'false', '');
INSERT INTO rule_values VALUES ('1', 'Bots:CreateBotCount', '150', '');
INSERT INTO rule_values VALUES ('1', 'Bots:SpawnBotCount', '71', '');
INSERT INTO rule_values VALUES ('1', 'Bots:BotQuest', 'false', '');
INSERT INTO rule_values VALUES ('1', 'Bots:BotGroupBuffing', 'false', '');
INSERT INTO rule_values VALUES ('1', 'Bots:BotSpellQuest', 'false', '');