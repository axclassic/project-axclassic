##zonecontroller.pl ID 86164 in Dreadlands##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 485) {
	quest::depopall(86158); 
	quest::depopall(86159);
	quest::depopall(86160);
	quest::depopall(86161);
	quest::depopall(86162);
	quest::depopall(86163);
	}
	elsif($signal == 486) {
	quest::spawn2(86158,0,0,6809.2,629.7,1047.5,71.5);
	quest::spawn2(86159,0,0,6876.1,595.6,1046.5,51);
	quest::spawn2(86159,0,0,6809,592.4,1046.3,53);
	quest::spawn2(86159,0,0,6834.9,696.7,1053.5,95.8);
	quest::spawn2(86159,0,0,6883.6,693.4,1045.4,66);
	}
	elsif($signal == 487) {
	quest::spawn2(86160,0,0,6809.2,629.7,1047.5,71.5);
	quest::spawn2(86161,0,0,6876.1,595.6,1046.5,51);
	quest::spawn2(86161,0,0,6809,592.4,1046.3,53);
	quest::spawn2(86161,0,0,6834.9,696.7,1053.5,95.8);
	quest::spawn2(86161,0,0,6883.6,693.4,1045.4,66);
	}
	elsif($signal == 488) {
	quest::spawn2(86162,0,0,6809.2,629.7,1047.5,71.5);
	quest::spawn2(86163,0,0,6876.1,595.6,1046.5,51);
	quest::spawn2(86163,0,0,6809,592.4,1046.3,53);
	quest::spawn2(86163,0,0,6834.9,696.7,1053.5,95.8);
	quest::spawn2(86163,0,0,6883.6,693.4,1045.4,66);
	}
	  else {
	#Do Nothing;
	}
	}