--- This table is required in ax_classic and login database ------- 

CREATE TABLE IF NOT EXISTS `LSStats` (
  `ServerID` int(10) unsigned NOT NULL default '0',
  `worldname` varchar(201) NOT NULL default '',
  `numplayers` int(10) unsigned NOT NULL default '0',
  `numzones` int(10) unsigned NOT NULL default '0',
  `worldstatus` int(10) unsigned NOT NULL default '0',
  `numbots` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ServerID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
