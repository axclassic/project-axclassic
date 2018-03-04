##zonecontroller.pl ID 44135 in Najena##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 364) {
	quest::depopall(44115); 
	quest::depopall(44116);
	quest::depopall(44117);
	quest::depopall(44118);
	quest::depopall(44119);
	quest::depopall(44120);
	quest::depopall(44121);
	quest::depopall(44122);
	quest::depopall(44123);
	quest::depopall(44124);
	quest::depopall(44125);
	quest::depopall(44126);
	quest::depopall(44127);
	quest::depopall(44128);
	quest::depopall(44129);
	quest::depopall(44130);
	quest::depopall(44131);
	quest::depopall(44132);
	quest::depopall(44133);
	quest::depopall(44134);
	}
	elsif($signal == 365) {
	quest::spawn2(44115,0,0,737.5,-68.3,3,69);
	quest::spawn2(44116,0,0,744.7,-92.6,3,33.9);
	quest::spawn2(44116,0,0,739.8,-98.8,3,56.1);
	quest::spawn2(44116,0,0,774,-58.4,3,97);
	quest::spawn2(44116,0,0,751.9,-50.9,3,90.1);
	}
	elsif($signal == 366) {
	quest::spawn2(44117,0,0,737.5,-68.3,3,69);
	quest::spawn2(44118,0,0,744.7,-92.6,3,33.9);
	quest::spawn2(44118,0,0,739.8,-98.8,3,56.1);
	quest::spawn2(44118,0,0,774,-58.4,3,97);
	quest::spawn2(44118,0,0,751.9,-50.9,3,90.1);
	}
	elsif($signal == 367) {
	quest::spawn2(44119,0,0,737.5,-68.3,3,69);
	quest::spawn2(44120,0,0,744.7,-92.6,3,33.9);
	quest::spawn2(44120,0,0,739.8,-98.8,3,56.1);
	quest::spawn2(44120,0,0,774,-58.4,3,97);
	quest::spawn2(44120,0,0,751.9,-50.9,3,90.1);
	}
	elsif($signal == 368) {
	quest::spawn2(44121,0,0,737.5,-68.3,3,69);
	quest::spawn2(44122,0,0,744.7,-92.6,3,33.9);
	quest::spawn2(44122,0,0,739.8,-98.8,3,56.1);
	quest::spawn2(44122,0,0,774,-58.4,3,97);
	quest::spawn2(44122,0,0,751.9,-50.9,3,90.1);
	}
	elsif($signal == 369) {
	quest::spawn2(44123,0,0,737.5,-68.3,3,69);
	quest::spawn2(44124,0,0,744.7,-92.6,3,33.9);
	quest::spawn2(44124,0,0,739.8,-98.8,3,56.1);
	quest::spawn2(44124,0,0,774,-58.4,3,97);
	quest::spawn2(44124,0,0,751.9,-50.9,3,90.1);
	}
	elsif($signal == 370) {
	quest::spawn2(44125,0,0,737.5,-68.3,3,69);
	quest::spawn2(44126,0,0,744.7,-92.6,3,33.9);
	quest::spawn2(44126,0,0,739.8,-98.8,3,56.1);
	quest::spawn2(44126,0,0,774,-58.4,3,97);
	quest::spawn2(44126,0,0,751.9,-50.9,3,90.1);
	}
	elsif($signal == 371) {
	quest::spawn2(44127,0,0,737.5,-68.3,3,69);
	quest::spawn2(44128,0,0,744.7,-92.6,3,33.9);
	quest::spawn2(44128,0,0,739.8,-98.8,3,56.1);
	quest::spawn2(44128,0,0,774,-58.4,3,97);
	quest::spawn2(44128,0,0,751.9,-50.9,3,90.1);
	}
	elsif($signal == 372) {
	quest::spawn2(44129,0,0,737.5,-68.3,3,69);
	quest::spawn2(44130,6,0,0,744.7,-92.6,3,33.9);
	quest::spawn2(44130,0,0,739.8,-98.8,3,56.1);
	quest::spawn2(44130,0,0,774,-58.4,3,97);
	quest::spawn2(44130,0,0,751.9,-50.9,3,90.1);
	}
	elsif($signal == 373) {
	quest::spawn2(441315,0,0,737.5,-68.3,3,69);
	quest::spawn2(44132,0,0,744.7,-92.6,3,33.9);
	quest::spawn2(44132,0,0,739.8,-98.8,3,56.1);
	quest::spawn2(44132,0,0,774,-58.4,3,97);
	quest::spawn2(44132,0,0,751.9,-50.9,3,90.1);
	}
	elsif($signal == 374) {
	quest::spawn2(44133,0,0,737.5,-68.3,3,69);
	quest::spawn2(44134,0,0,744.7,-92.6,3,33.9);
	quest::spawn2(44134,0,0,739.8,-98.8,3,56.1);
	quest::spawn2(44134,0,0,774,-58.4,3,97);
	quest::spawn2(44134,0,0,751.9,-50.9,3,90.1);
	}
	else {
	#Do Nothing;
	}
	}