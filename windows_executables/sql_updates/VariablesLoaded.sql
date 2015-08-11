-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.61-0ubuntu0.10.10.1


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema ax_classic
--

CREATE DATABASE IF NOT EXISTS ax_classic;
USE ax_classic;

--
-- Definition of table `ax_classic`.`variables`
--

DROP TABLE IF EXISTS `ax_classic`.`variables`;
CREATE TABLE  `ax_classic`.`variables` (
  `varname` varchar(25) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `information` text NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`varname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ax_classic`.`variables`
--

/*!40000 ALTER TABLE `variables` DISABLE KEYS */;
LOCK TABLES `variables` WRITE;
INSERT INTO `ax_classic`.`variables` VALUES  ('AAXPMod','2','AA Experience multipler. Increase to increase exp rate (default .9)','2012-03-21 14:03:12'),
 ('ACfail','35','the percentage of time AC fails to protect. 0 would mean there was always some level of protection, 100 would mean AC has no affect. When AC fails, it will be possible to get a max dmg hit.','2006-10-26 14:36:01'),
 ('ACrandom','3','the maximum amount of additional protection AC provides. 0 would mean no additional protection is provided, otherwise an additional amount of reduction is calculated using a random percentage of 1 to this value (except when AC fails with ACfail) ','2006-10-26 14:36:01'),
 ('ACreduction','1','the percentage of AC that is ALWAYS reduced from a hit (except when AC fails with ACfail) ','2006-10-26 14:36:01'),
 ('ailevel','6','Had something to do with NPC casting. Leave at 6.','2006-10-26 14:36:01'),
 ('DBVersion','AXCLASSIC_6.1b','DB version info','2015-03-21 22:46:05'),
 ('decaytime 1 54','18000','Corpse decay time for Level\'s 1 to 54','2011-07-05 08:18:30'),
 ('decaytime 55 100','18000','Corpse decay time for Level\'s 55 to 100','2011-07-05 08:18:29'),
 ('dfltInstZflag','1000','Used to determine if a zone is instanced, must be 1000 or greater','2008-09-05 04:46:47'),
 ('disablecommandline','0','Allow command lines to be run from world.exe | 0 - off | 1 - on |','2006-10-26 14:36:01'),
 ('DisableNoDrop','0','Takes No-Drop off of items','2006-10-26 14:36:01'),
 ('Expansions','255','Accessible expansions for each player (Default 255)','2006-10-26 14:36:01'),
 ('EXPMod','.8','Experience multipler. Increase to increase exp rate (default 0.8)','2006-12-20 19:21:31'),
 ('GroupEXPBonus','.1','Experience multipler. Increase to increase group exp rate (default .2)','2010-11-20 08:35:28'),
 ('GuildWars','0','Enable Guild Wars Type Server | 0 - off | 1 - on |','2006-10-26 14:36:01'),
 ('holdzones','0','Restart Crashed Zone Servers | 0 - off | 1 - on |','2012-06-07 19:06:40'),
 ('leavecorpses','1','Players leave corpses | 0 - off | 1 - on |','2006-10-26 14:36:01'),
 ('LoginType','Public','Set this to Minilogin to login using a minilogin server :)','2006-10-26 14:36:01'),
 ('loglevel','0000','Commands,Merchants,Trades,Loot','2006-10-26 14:36:01'),
 ('LootCoin','0','Allows players to loot coin off a player corpse in pvp | 0 - off | 1 - on |','2006-10-26 14:36:01'),
 ('Max_AAXP','21626880','Max AA Experience','2006-10-26 14:36:01'),
 ('MerchantsKeepItems','0','Merchants keep items sold to them | 0 - off | 1 - on |','2010-05-13 14:40:04'),
 ('MOTD','Welcome to PROJECT AXCLASSIC - Use \'#bot help\' for info on Bot commands. We also have help in Wiki and Forums at http://www.axclassic.com/. You\'ll need the Classicd.zip files unzipped into your everquest directory (posted at the Forums). Have Fun!!','Server Message of the Day','2011-09-16 11:14:22'),
 ('MOTDEqEmu','Welcome to PROJECT AXCLASSIC -  For alternate Login Server, register with your same username at http://axclassic.com/login.php and change your eqhost.txt file to \"Host=login.axclassic.com:5999\". Have Fun!!','Server Message of the Day','2012-05-31 08:48:28'),
 ('NewVariable','','','2006-10-26 14:36:01'),
 ('PersistentZoneState','0','Save zone state on shutdown for bootup | 0 - off | 1 - on |','2006-10-26 14:36:01'),
 ('PvPitem','0','Specific item that can be looted off a player in pvp','2006-10-26 14:36:01'),
 ('PvPreward','0','Allows players to loot items off a player corpse in pvp | 0 - no items | 1 - a single item | 2 - all items | 3 - item specified in PvPreward |','2006-10-26 14:36:01');
UNLOCK TABLES;
/*!40000 ALTER TABLE `variables` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
