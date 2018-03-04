##zonecontroller.pl ID 78250 in Fiels of Bone##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 265) {
	quest::depopall(78230); 
	quest::depopall(78231);
	quest::depopall(78232);
	quest::depopall(78233);
	quest::depopall(78234);
	quest::depopall(78235);
	quest::depopall(78236);
	quest::depopall(78237);
	quest::depopall(78238);
	quest::depopall(78239);
	quest::depopall(78240);
	quest::depopall(78241);
	quest::depopall(78242);
	quest::depopall(78243);
	quest::depopall(78244);
	quest::depopall(78245);
	quest::depopall(78246);
	quest::depopall(78247);
	quest::depopall(78248);
	quest::depopall(78249);
	}
	elsif($signal == 266) {
	quest::spawn2(78230,0,0,-85.5,-1677.4,-51,82.5);
	quest::spawn2(78231,0,0,-29.5,-1657.4,-54,93);
	quest::spawn2(78231,0,0,-52.8,-1676.8,-52.5,83.4);
	quest::spawn2(78231,0,0,-90.4,-1713.3,-53.4,57.3);
	quest::spawn2(78231,0,0,-23.2,-1722.4,-54.5,49.8);
	}
	elsif($signal == 267) {
	quest::spawn2(78232,0,0,-85.5,-1677.4,-51,82.5);
	quest::spawn2(78233,0,0,-29.5,-1657.4,-54,93);
	quest::spawn2(78233,0,0,-52.8,-1676.8,-52.5,83.4);
	quest::spawn2(78233,0,0,-90.4,-1713.3,-53.4,57.3);
	quest::spawn2(78233,0,0,-23.2,-1722.4,-54.5,49.8);
	}
	elsif($signal == 268) {
	quest::spawn2(78234,0,0,-85.5,-1677.4,-51,82.5);
	quest::spawn2(78235,0,0,-29.5,-1657.4,-54,93);
	quest::spawn2(78235,0,0,-52.8,-1676.8,-52.5,83.4);
	quest::spawn2(78235,0,0,-90.4,-1713.3,-53.4,57.3);
	quest::spawn2(78235,0,0,-23.2,-1722.4,-54.5,49.8);
	}
	elsif($signal == 269) {
	quest::spawn2(78236,0,0,-85.5,-1677.4,-51,82.5);
	quest::spawn2(78237,0,0,-29.5,-1657.4,-54,93);
	quest::spawn2(78237,0,0,-52.8,-1676.8,-52.5,83.4);
	quest::spawn2(78237,0,0,-90.4,-1713.3,-53.4,57.3);
	quest::spawn2(78237,0,0,-23.2,-1722.4,-54.5,49.8);
	}
	elsif($signal == 270) {
	quest::spawn2(78238,0,0,-85.5,-1677.4,-51,82.5);
	quest::spawn2(78239,0,0,-29.5,-1657.4,-54,93);
	quest::spawn2(78239,0,0,-52.8,-1676.8,-52.5,83.4);
	quest::spawn2(78239,0,0,-90.4,-1713.3,-53.4,57.3);
	quest::spawn2(78239,0,0,-23.2,-1722.4,-54.5,49.8);
	}
	elsif($signal == 271) {
	quest::spawn2(78240,0,0,-85.5,-1677.4,-51,82.5);
	quest::spawn2(78241,0,0,-29.5,-1657.4,-54,93);
	quest::spawn2(78241,0,0,-52.8,-1676.8,-52.5,83.4);
	quest::spawn2(78241,0,0,-90.4,-1713.3,-53.4,57.3);
	quest::spawn2(78241,0,0,-23.2,-1722.4,-54.5,49.8);
	}
	elsif($signal == 272) {
	quest::spawn2(78242,0,0,-85.5,-1677.4,-51,82.5);
	quest::spawn2(78243,0,0,-29.5,-1657.4,-54,93);
	quest::spawn2(78243,0,0,-52.8,-1676.8,-52.5,83.4);
	quest::spawn2(78243,0,0,-90.4,-1713.3,-53.4,57.3);
	quest::spawn2(78243,0,0,-23.2,-1722.4,-54.5,49.8);
	}
	elsif($signal == 273) {
	quest::spawn2(78244,0,0,-85.5,-1677.4,-51,82.5);
	quest::spawn2(78245,0,0,-29.5,-1657.4,-54,93);
	quest::spawn2(78245,0,0,-52.8,-1676.8,-52.5,83.4);
	quest::spawn2(78245,0,0,-90.4,-1713.3,-53.4,57.3);
	quest::spawn2(78245,0,0,-23.2,-1722.4,-54.5,49.8);
	}
	elsif($signal == 274) {
	quest::spawn2(78246,0,0,-85.5,-1677.4,-51,82.5);
	quest::spawn2(78247,0,0,-29.5,-1657.4,-54,93);
	quest::spawn2(78247,0,0,-52.8,-1676.8,-52.5,83.4);
	quest::spawn2(78247,0,0,-90.4,-1713.3,-53.4,57.3);
	quest::spawn2(78247,0,0,-23.2,-1722.4,-54.5,49.8);
	}
	elsif($signal == 275) {
	quest::spawn2(78248,0,0,-85.5,-1677.4,-51,82.5);
	quest::spawn2(78249,0,0,-29.5,-1657.4,-54,93);
	quest::spawn2(78249,0,0,-52.8,-1676.8,-52.5,83.4);
	quest::spawn2(78249,0,0,-90.4,-1713.3,-53.4,57.3);
	quest::spawn2(78249,0,0,-23.2,-1722.4,-54.5,49.8);
	}
	else {
	#Do Nothing;
	}
	}