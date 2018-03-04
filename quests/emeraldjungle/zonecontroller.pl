##zonecontroller.pl ID 94163 in Emerald Jungle##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 243) {
	quest::depopall(94143); 
	quest::depopall(94144);
	quest::depopall(94145);
	quest::depopall(94146);
	quest::depopall(94147);
	quest::depopall(94148);
	quest::depopall(94149);
	quest::depopall(94150);
	quest::depopall(94151);
	quest::depopall(94152);
	quest::depopall(94153);
	quest::depopall(94154);
	quest::depopall(94155);
	quest::depopall(94156);
	quest::depopall(94157);
	quest::depopall(94158);
	quest::depopall(94159);
	quest::depopall(94160);
	quest::depopall(94161);
	quest::depopall(94162);
	}
	elsif($signal == 244) {
	quest::spawn2(94143,0,0,5007.3,-1603.6,16.5,88.6);
	quest::spawn2(94144,0,0,5012.9,-1558.8,20.9,82.3);
	quest::spawn2(94144,0,0,4993.9,-1649.6,17.4,69.6);
	quest::spawn2(94144,0,0,5060.7,-1587.8,-1,86.9);
	quest::spawn2(94144,0,0,5045.4,-1655.6,3.6,57);
	}
	elsif($signal == 245) {
	quest::spawn2(94145,0,0,5007.3,-1603.6,16.5,88.6);
	quest::spawn2(94146,0,0,5012.9,-1558.8,20.9,82.3);
	quest::spawn2(94146,0,0,4993.9,-1649.6,17.4,69.6);
	quest::spawn2(94146,0,0,5060.7,-1587.8,-1,86.9);
	quest::spawn2(94146,0,0,5045.4,-1655.6,3.6,57);
	}
	elsif($signal == 246) {
	quest::spawn2(94147,0,0,5007.3,-1603.6,16.5,88.6);
	quest::spawn2(94148,0,0,5012.9,-1558.8,20.9,82.3);
	quest::spawn2(94148,0,0,4993.9,-1649.6,17.4,69.6);
	quest::spawn2(94148,0,0,5060.7,-1587.8,-1,86.9);
	quest::spawn2(94148,0,0,5045.4,-1655.6,3.6,57);
	}
	elsif($signal == 247) {
	quest::spawn2(94149,0,0,5007.3,-1603.6,16.5,88.6);
	quest::spawn2(94150,0,0,5012.9,-1558.8,20.9,82.3);
	quest::spawn2(94150,0,0,4993.9,-1649.6,17.4,69.6);
	quest::spawn2(94150,0,0,5060.7,-1587.8,-1,86.9);
	quest::spawn2(94150,0,0,5045.4,-1655.6,3.6,57);
	}
	elsif($signal == 248) {
	quest::spawn2(94151,0,0,5007.3,-1603.6,16.5,88.6);
	quest::spawn2(94152,0,0,5012.9,-1558.8,20.9,82.3);
	quest::spawn2(94152,0,0,4993.9,-1649.6,17.4,69.6);
	quest::spawn2(94152,0,0,5060.7,-1587.8,-1,86.9);
	quest::spawn2(94152,0,0,5045.4,-1655.6,3.6,57);
	}
	elsif($signal == 249) {
	quest::spawn2(94153,0,0,5007.3,-1603.6,16.5,88.6);
	quest::spawn2(94154,0,0,5012.9,-1558.8,20.9,82.3);
	quest::spawn2(94154,0,0,4993.9,-1649.6,17.4,69.6);
	quest::spawn2(94154,0,0,5060.7,-1587.8,-1,86.9);
	quest::spawn2(94154,0,0,5045.4,-1655.6,3.6,57);
	}
	elsif($signal == 250) {
	quest::spawn2(94155,0,0,5007.3,-1603.6,16.5,88.6);
	quest::spawn2(94156,0,0,5012.9,-1558.8,20.9,82.3);
	quest::spawn2(94156,0,0,4993.9,-1649.6,17.4,69.6);
	quest::spawn2(94156,0,0,5060.7,-1587.8,-1,86.9);
	quest::spawn2(94156,0,0,5045.4,-1655.6,3.6,57);
	}
	elsif($signal == 251) {
	quest::spawn2(94157,0,0,5007.3,-1603.6,16.5,88.6);
	quest::spawn2(94158,0,0,5012.9,-1558.8,20.9,82.3);
	quest::spawn2(94158,0,0,4993.9,-1649.6,17.4,69.6);
	quest::spawn2(94158,0,0,5060.7,-1587.8,-1,86.9);
	quest::spawn2(94158,0,0,5045.4,-1655.6,3.6,57);
	}
	elsif($signal == 252) {
	quest::spawn2(94159,0,0,5007.3,-1603.6,16.5,88.6);
	quest::spawn2(94160,0,0,5012.9,-1558.8,20.9,82.3);
	quest::spawn2(94160,0,0,4993.9,-1649.6,17.4,69.6);
	quest::spawn2(94160,0,0,5060.7,-1587.8,-1,86.9);
	quest::spawn2(94160,0,0,5045.4,-1655.6,3.6,57);
	}
	elsif($signal == 253) {
	quest::spawn2(94161,0,0,5007.3,-1603.6,16.5,88.6);
	quest::spawn2(94162,0,0,5012.9,-1558.8,20.9,82.3);
	quest::spawn2(94162,0,0,4993.9,-1649.6,17.4,69.6);
	quest::spawn2(94162,0,0,5060.7,-1587.8,-1,86.9);
	quest::spawn2(94162,0,0,5045.4,-1655.6,3.6,57);
	}
	else {
	#Do Nothing;
	}
	}