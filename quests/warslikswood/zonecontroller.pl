##zonecontroller.pl ID 79141 in Warsliks Woods##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 507) {
	quest::depopall(79135); 
	quest::depopall(79136);
	quest::depopall(79137);
	quest::depopall(79138);
	quest::depopall(79139);
	quest::depopall(79140);
	}
	elsif($signal == 508) {
	quest::spawn2(79135,0,0,2882.8,-1878.1,100.7,196.9);
	quest::spawn2(79136,0,0,2882.3,-1933.1,102,199.5);
	quest::spawn2(79136,0,0,2839,-1909.5,82.7,188.9);
	quest::spawn2(79136,0,0,2883.3,-1836.9,109.8,193.1);
	quest::spawn2(79136,0,0,2842.4,-1841.5,90.7,178.5);
	}
	elsif($signal == 509) {
	quest::spawn2(79137,0,0,2882.8,-1878.1,100.7,196.9);
	quest::spawn2(79138,0,0,2882.3,-1933.1,102,199.5);
	quest::spawn2(79138,0,0,2839,-1909.5,82.7,188.9);
	quest::spawn2(79138,0,0,2883.3,-1836.9,109.8,193.1);
	quest::spawn2(79138,0,0,2842.4,-1841.5,90.7,178.5);
	}
	elsif($signal == 510) {
	quest::spawn2(79139,0,0,2882.8,-1878.1,100.7,196.9);
	quest::spawn2(79140,0,0,2882.3,-1933.1,102,199.5);
	quest::spawn2(79140,0,0,2839,-1909.5,82.7,188.9);
	quest::spawn2(79140,0,0,2883.3,-1836.9,109.8,193.1);
	quest::spawn2(79140,0,0,2842.4,-1841.5,90.7,178.5);
	}
	  else {
	#Do Nothing;
	}
	}