##zonecontroller.pl ID 13147 in North Karana##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 198) {
	quest::depopall(13127); 
	quest::depopall(13128);
	quest::depopall(13129);
	quest::depopall(13130);
	quest::depopall(13131);
	quest::depopall(13132);
	quest::depopall(13133);
	quest::depopall(13134);
	quest::depopall(13135);
	quest::depopall(13136);
	quest::depopall(13137);
	quest::depopall(13138);
	quest::depopall(13139);
	quest::depopall(13140);
	quest::depopall(13141);
	quest::depopall(13142);
	quest::depopall(13143);
	quest::depopall(13144);
	quest::depopall(13145);
	quest::depopall(13146);
	}
	elsif($signal == 199) {
	quest::spawn2(13127,0,0,92.8,1386.4,-10,152);
	quest::spawn2(13128,0,0,110,1293.6,-5.3,152.8);
	quest::spawn2(13128,0,0,106.9,1349.4,-6.7,171.3);
	quest::spawn2(13128,0,0,52.5,1393.9,-6.7,136.6);
	quest::spawn2(13128,0,0,5.7,1392,-2.6,104.3);
	}
	elsif($signal == 200) {
	quest::spawn2(13129,0,0,92.8,1386.4,-10,152);
	quest::spawn2(13130,0,0,110,1293.6,-5.3,152.8);
	quest::spawn2(13130,0,0,106.9,1349.4,-6.7,171.3);
	quest::spawn2(13130,0,0,52.5,1393.9,-6.7,136.6);
	quest::spawn2(13130,0,0,5.7,1392,-2.6,104.3);
	}
	elsif($signal == 201) {
	quest::spawn2(13131,0,0,92.8,1386.4,-10,152);
	quest::spawn2(13132,0,0,110,1293.6,-5.3,152.8);
	quest::spawn2(13132,0,0,106.9,1349.4,-6.7,171.3);
	quest::spawn2(13132,0,0,52.5,1393.9,-6.7,136.6);
	quest::spawn2(13132,0,0,5.7,1392,-2.6,104.3);
	}
	elsif($signal == 202) {
	quest::spawn2(13133,0,0,92.8,1386.4,-10,152);
	quest::spawn2(13134,0,0,110,1293.6,-5.3,152.8);
	quest::spawn2(13134,0,0,106.9,1349.4,-6.7,171.3);
	quest::spawn2(13134,0,0,52.5,1393.9,-6.7,136.6);
	quest::spawn2(13134,0,0,5.7,1392,-2.6,104.3);
	}
	elsif($signal == 203) {
	quest::spawn2(13135,0,0,92.8,1386.4,-10,152);
	quest::spawn2(13136,0,0,110,1293.6,-5.3,152.8);
	quest::spawn2(13136,0,0,106.9,1349.4,-6.7,171.3);
	quest::spawn2(13136,0,0,52.5,1393.9,-6.7,136.6);
	quest::spawn2(13136,0,0,5.7,1392,-2.6,104.3);
	}
	elsif($signal == 204) {
	quest::spawn2(13137,0,0,92.8,1386.4,-10,152);
	quest::spawn2(13138,0,0,110,1293.6,-5.3,152.8);
	quest::spawn2(13138,0,0,106.9,1349.4,-6.7,171.3);
	quest::spawn2(13138,0,0,52.5,1393.9,-6.7,136.6);
	quest::spawn2(13138,0,0,5.7,1392,-2.6,104.3);
	}
	elsif($signal == 205) {
	quest::spawn2(13139,0,0,92.8,1386.4,-10,152);
	quest::spawn2(13140,0,0,110,1293.6,-5.3,152.8);
	quest::spawn2(13140,0,0,106.9,1349.4,-6.7,171.3);
	quest::spawn2(13140,0,0,52.5,1393.9,-6.7,136.6);
	quest::spawn2(13140,0,0,5.7,1392,-2.6,104.3);
	}
	elsif($signal == 206) {
	quest::spawn2(13141,0,0,92.8,1386.4,-10,152);
	quest::spawn2(13142,0,0,110,1293.6,-5.3,152.8);
	quest::spawn2(13142,0,0,106.9,1349.4,-6.7,171.3);
	quest::spawn2(13142,0,0,52.5,1393.9,-6.7,136.6);
	quest::spawn2(13142,0,0,5.7,1392,-2.6,104.3);
	}
	elsif($signal == 207) {
	quest::spawn2(13143,0,0,92.8,1386.4,-10,152);
	quest::spawn2(13144,0,0,110,1293.6,-5.3,152.8);
	quest::spawn2(13144,0,0,106.9,1349.4,-6.7,171.3);
	quest::spawn2(13144,0,0,52.5,1393.9,-6.7,136.6);
	quest::spawn2(13144,0,0,5.7,1392,-2.6,104.3);
	}
	elsif($signal == 208) {
	quest::spawn2(13145,0,0,92.8,1386.4,-10,152);
	quest::spawn2(13146,0,0,110,1293.6,-5.3,152.8);
	quest::spawn2(13146,0,0,106.9,1349.4,-6.7,171.3);
	quest::spawn2(13146,0,0,52.5,1393.9,-6.7,136.6);
	quest::spawn2(13146,0,0,5.7,1392,-2.6,104.3);
	}
	else {
	#Do Nothing;
	}
	}