##zonecontroller.pl ID 46126 in Innothule Swamp##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 364) {
	quest::depopall(46106); 
	quest::depopall(46107);
	quest::depopall(46108);
	quest::depopall(46109);
	quest::depopall(46110);
	quest::depopall(46111);
	quest::depopall(46112);
	quest::depopall(46113);
	quest::depopall(46114);
	quest::depopall(46115);
	quest::depopall(46116);
	quest::depopall(46117);
	quest::depopall(46118);
	quest::depopall(46119);
	quest::depopall(46120);
	quest::depopall(46121);
	quest::depopall(46122);
	quest::depopall(46123);
	quest::depopall(46124);
	quest::depopall(46125);
	}
	elsif($signal == 365) {
	quest::spawn2(46106,0,0,794,-218.6,-21.9,87.9);
	quest::spawn2(46107,0,0,826.6,-202.3,-23.7,98.1);
	quest::spawn2(46107,0,0,879.6,-236.5,-21.5,114.6);
	quest::spawn2(46107,0,0,799.3,-254.3,-20.2,81.2);
	quest::spawn2(46107,0,0,816.7,-297.6,-24.2,58);
	}
	elsif($signal == 366) {
	quest::spawn2(46108,0,0,794,-218.6,-21.9,87.9);
	quest::spawn2(46109,0,0,826.6,-202.3,-23.7,98.1);
	quest::spawn2(46109,0,0,879.6,-236.5,-21.5,114.6);
	quest::spawn2(46109,0,0,799.3,-254.3,-20.2,81.2);
	quest::spawn2(46109,0,0,816.7,-297.6,-24.2,58);
	}
	elsif($signal == 367) {
	quest::spawn2(46110,0,0,794,-218.6,-21.9,87.9);
	quest::spawn2(46111,0,0,826.6,-202.3,-23.7,98.1);
	quest::spawn2(46111,0,0,879.6,-236.5,-21.5,114.6);
	quest::spawn2(46111,0,0,799.3,-254.3,-20.2,81.2);
	quest::spawn2(46111,0,0,816.7,-297.6,-24.2,58);
	}
	elsif($signal == 368) {
	quest::spawn2(46112,0,0,794,-218.6,-21.9,87.9);
	quest::spawn2(46113,0,0,826.6,-202.3,-23.7,98.1);
	quest::spawn2(46113,0,0,879.6,-236.5,-21.5,114.6);
	quest::spawn2(46113,0,0,799.3,-254.3,-20.2,81.2);
	quest::spawn2(46113,0,0,816.7,-297.6,-24.2,58);
	}
	elsif($signal == 369) {
	quest::spawn2(46114,0,0,794,-218.6,-21.9,87.9);
	quest::spawn2(46115,0,0,826.6,-202.3,-23.7,98.1);
	quest::spawn2(46115,0,0,879.6,-236.5,-21.5,114.6);
	quest::spawn2(46115,0,0,799.3,-254.3,-20.2,81.2);
	quest::spawn2(46115,0,0,816.7,-297.6,-24.2,58);
	}
	elsif($signal == 370) {
	quest::spawn2(46116,0,0,794,-218.6,-21.9,87.9);
	quest::spawn2(46117,0,0,826.6,-202.3,-23.7,98.1);
	quest::spawn2(46117,0,0,879.6,-236.5,-21.5,114.6);
	quest::spawn2(46117,0,0,799.3,-254.3,-20.2,81.2);
	quest::spawn2(46117,0,0,816.7,-297.6,-24.2,58);
	}
	elsif($signal == 371) {
	quest::spawn2(46118,0,0,794,-218.6,-21.9,87.9);
	quest::spawn2(46119,0,0,826.6,-202.3,-23.7,98.1);
	quest::spawn2(46119,0,0,879.6,-236.5,-21.5,114.6);
	quest::spawn2(46119,0,0,799.3,-254.3,-20.2,81.2);
	quest::spawn2(46119,0,0,816.7,-297.6,-24.2,58);
	}
	elsif($signal == 372) {
	quest::spawn2(46120,0,0,794,-218.6,-21.9,87.9);
	quest::spawn2(46121,0,0,826.6,-202.3,-23.7,98.1);
	quest::spawn2(46121,0,0,879.6,-236.5,-21.5,114.6);
	quest::spawn2(46121,0,0,799.3,-254.3,-20.2,81.2);
	quest::spawn2(46121,0,0,816.7,-297.6,-24.2,58);
	}
	elsif($signal == 373) {
	quest::spawn2(46122,0,0,794,-218.6,-21.9,87.9);
	quest::spawn2(46123,0,0,826.6,-202.3,-23.7,98.1);
	quest::spawn2(46123,0,0,879.6,-236.5,-21.5,114.6);
	quest::spawn2(46123,0,0,799.3,-254.3,-20.2,81.2);
	quest::spawn2(46123,0,0,816.7,-297.6,-24.2,58);
	}
	elsif($signal == 374) {
	quest::spawn2(46124,0,0,794,-218.6,-21.9,87.9);
	quest::spawn2(46125,0,0,826.6,-202.3,-23.7,98.1);
	quest::spawn2(46125,0,0,879.6,-236.5,-21.5,114.6);
	quest::spawn2(46125,0,0,799.3,-254.3,-20.2,81.2);
	quest::spawn2(46125,0,0,816.7,-297.6,-24.2,58);
	}
	else {
	#Do Nothing;
	}
	}