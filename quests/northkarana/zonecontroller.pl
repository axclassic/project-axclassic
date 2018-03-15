##zonecontroller.pl ID 13147 in North Karana##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(13148,0,0,116.1,1418,12.8,139.3);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
   
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
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
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(13127,0,0,92.8,1386.4,-10,152);
		quest::spawn2(13128,0,0,110,1293.6,-5.3,152.8);
		quest::spawn2(13128,0,0,106.9,1349.4,-6.7,171.3);
		quest::spawn2(13128,0,0,52.5,1393.9,-6.7,136.6);
		quest::spawn2(13128,0,0,5.7,1392,-2.6,104.3);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(13129,0,0,92.8,1386.4,-10,152);
		quest::spawn2(13130,0,0,110,1293.6,-5.3,152.8);
		quest::spawn2(13130,0,0,106.9,1349.4,-6.7,171.3);
		quest::spawn2(13130,0,0,52.5,1393.9,-6.7,136.6);
		quest::spawn2(13130,0,0,5.7,1392,-2.6,104.3);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(13131,0,0,92.8,1386.4,-10,152);
		quest::spawn2(13132,0,0,110,1293.6,-5.3,152.8);
		quest::spawn2(13132,0,0,106.9,1349.4,-6.7,171.3);
		quest::spawn2(13132,0,0,52.5,1393.9,-6.7,136.6);
		quest::spawn2(13132,0,0,5.7,1392,-2.6,104.3);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(13133,0,0,92.8,1386.4,-10,152);
		quest::spawn2(13134,0,0,110,1293.6,-5.3,152.8);
		quest::spawn2(13134,0,0,106.9,1349.4,-6.7,171.3);
		quest::spawn2(13134,0,0,52.5,1393.9,-6.7,136.6);
		quest::spawn2(13134,0,0,5.7,1392,-2.6,104.3);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(13135,0,0,92.8,1386.4,-10,152);
		quest::spawn2(13136,0,0,110,1293.6,-5.3,152.8);
		quest::spawn2(13136,0,0,106.9,1349.4,-6.7,171.3);
		quest::spawn2(13136,0,0,52.5,1393.9,-6.7,136.6);
		quest::spawn2(13136,0,0,5.7,1392,-2.6,104.3);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(13137,0,0,92.8,1386.4,-10,152);
		quest::spawn2(13138,0,0,110,1293.6,-5.3,152.8);
		quest::spawn2(13138,0,0,106.9,1349.4,-6.7,171.3);
		quest::spawn2(13138,0,0,52.5,1393.9,-6.7,136.6);
		quest::spawn2(13138,0,0,5.7,1392,-2.6,104.3);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(13139,0,0,92.8,1386.4,-10,152);
		quest::spawn2(13140,0,0,110,1293.6,-5.3,152.8);
		quest::spawn2(13140,0,0,106.9,1349.4,-6.7,171.3);
		quest::spawn2(13140,0,0,52.5,1393.9,-6.7,136.6);
		quest::spawn2(13140,0,0,5.7,1392,-2.6,104.3);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(13141,0,0,92.8,1386.4,-10,152);
		quest::spawn2(13142,0,0,110,1293.6,-5.3,152.8);
		quest::spawn2(13142,0,0,106.9,1349.4,-6.7,171.3);
		quest::spawn2(13142,0,0,52.5,1393.9,-6.7,136.6);
		quest::spawn2(13142,0,0,5.7,1392,-2.6,104.3);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(13143,0,0,92.8,1386.4,-10,152);
		quest::spawn2(13144,0,0,110,1293.6,-5.3,152.8);
		quest::spawn2(13144,0,0,106.9,1349.4,-6.7,171.3);
		quest::spawn2(13144,0,0,52.5,1393.9,-6.7,136.6);
		quest::spawn2(13144,0,0,5.7,1392,-2.6,104.3);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(13145,0,0,92.8,1386.4,-10,152);
		quest::spawn2(13146,0,0,110,1293.6,-5.3,152.8);
		quest::spawn2(13146,0,0,106.9,1349.4,-6.7,171.3);
		quest::spawn2(13146,0,0,52.5,1393.9,-6.7,136.6);
		quest::spawn2(13146,0,0,5.7,1392,-2.6,104.3);
		}
   }
    else {
         $client->Message(14, "There is another Norrathian doing the Easter Event in this zone. Try back in a little while.");
       } # end EasterInProgress check
   } # end event8 check
   $event8=undef;
    $EasterInProgress=undef;
} # end EVENT_ENTER


sub EVENT_SIGNAL {
   if ($signal == 600){
     quest::depop();
    }
}