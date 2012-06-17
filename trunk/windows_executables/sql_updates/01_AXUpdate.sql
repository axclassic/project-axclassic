
--- These are for the new login server table creation - not needed if y ou keep the old one.-----

DROP TABLE IF EXISTS `tblloginserveraccounts`;
CREATE TABLE `tblloginserveraccounts` (
  `LoginServerID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AccountName` varchar(30) NOT NULL,
  `AccountPassword` varchar(50) NOT NULL,
  `AccountCreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AccountEmail` varchar(100) NOT NULL,
  `LastLoginDate` datetime NOT NULL,
  `LastIPAddress` varchar(15) NOT NULL,
  PRIMARY KEY (`LoginServerID`,`AccountName`)
) ENGINE=MyISAM AUTO_INCREMENT=170957 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `tblserveradminregistration`;
CREATE TABLE `tblserveradminregistration` (
  `ServerAdminID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AccountName` varchar(30) NOT NULL,
  `AccountPassword` varchar(30) NOT NULL,
  `FirstName` varchar(40) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL DEFAULT '',
  `RegistrationDate` datetime NOT NULL,
  `RegistrationIPAddr` varchar(15) NOT NULL,
  PRIMARY KEY (`ServerAdminID`,`Email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `tblserverlisttype`;
CREATE TABLE `tblserverlisttype` (
  `ServerListTypeID` int(10) unsigned NOT NULL,
  `ServerListTypeDescription` varchar(20) NOT NULL,
  PRIMARY KEY (`ServerListTypeID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `tblserverlisttype` (`ServerListTypeID`,`ServerListTypeDescription`) VALUES 
 (1,'Legends'),
 (2,'Preferred'),
 (3,'Standard');

DROP TABLE IF EXISTS `tblworldserverregistration`;
CREATE TABLE `tblworldserverregistration` (
  `ServerID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ServerLongName` varchar(100) NOT NULL,
  `ServerTagDescription` varchar(50) NOT NULL DEFAULT '',
  `ServerShortName` varchar(25) NOT NULL,
  `ServerListTypeID` int(11) NOT NULL,
  `ServerLastLoginDate` datetime DEFAULT NULL,
  `ServerLastIPAddr` varchar(15) DEFAULT NULL,
  `ServerAdminID` int(11) NOT NULL,
  `ServerTrusted` int(11) NOT NULL,
  `Note` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ServerID`,`ServerLongName`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

ALTER TABLE `login`.`tblLoginServerAccounts` ADD COLUMN `FirstFlag` TINYINT(3)  NOT NULL DEFAULT 0 AFTER `LastIPAddress`;
