##zonecontroller.pl ID 93308 in Overthere##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 518) {
	quest::depopall(93302); 
	quest::depopall(93303);
	quest::depopall(93304);
	quest::depopall(93305);
	quest::depopall(93306);
	quest::depopall(93307);
	}
	elsif($signal == 519) {
	quest::spawn2(93302,0,0,-2706.6,-3119,143.6,239.4);
	quest::spawn2(93303,0,0,-2734.7,-3176.8,154.4);
	quest::spawn2(93303,0,0,-2730,-3137.9,145.8,242.4);
	quest::spawn2(93303,0,0,-2668.2,-3109.9,145.8,237.4);
	quest::spawn2(93303,0,0,-2630.9,-3138.4,155.5,236.9);
	}
	elsif($signal == 520) {
	quest::spawn2(93304,0,0,-2706.6,-3119,143.6,239.4);
	quest::spawn2(93305,0,0,-2734.7,-3176.8,154.4);
	quest::spawn2(93305,0,0,-2730,-3137.9,145.8,242.4);
	quest::spawn2(93305,0,0,-2668.2,-3109.9,145.8,237.4);
	quest::spawn2(93305,0,0,-2630.9,-3138.4,155.5,236.9);
	}
	elsif($signal == 521) {
	quest::spawn2(93306,0,0,-2706.6,-3119,143.6,239.4);
	quest::spawn2(93307,0,0,-2734.7,-3176.8,154.4);
	quest::spawn2(93307,0,0,-2730,-3137.9,145.8,242.4);
	quest::spawn2(93307,0,0,-2668.2,-3109.9,145.8,237.4);
	quest::spawn2(93307,0,0,-2630.9,-3138.4,155.5,236.9);
	}
      else {
	#Do Nothing;
	}
	}