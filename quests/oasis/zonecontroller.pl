##zonecontroller.pl ID 37191 in oasis##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(37192,0,0,1360.3,405.6,31.6,247.9);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(37171); 
		quest::depopall(37172);
		quest::depopall(37173);
		quest::depopall(37174);
		quest::depopall(37175);
		quest::depopall(37176);
		quest::depopall(37177);
		quest::depopall(37178);
		quest::depopall(37179);
		quest::depopall(37180);
		quest::depopall(37181);
		quest::depopall(37182);
		quest::depopall(37183);
		quest::depopall(37184);
		quest::depopall(37185);
		quest::depopall(37186);
		quest::depopall(37187);
		quest::depopall(37188);
		quest::depopall(37189);
		quest::depopall(37190);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(37171,0,0,1360,428.5,17,241.9);
		quest::spawn2(37172,0,0,1291.6,425.8,20,243.3);
		quest::spawn2(37172,0,0,1315.1,426.3,19.3,2.1);
		quest::spawn2(37172,0,0,1371.8,456.2,14,243.9);
		quest::spawn2(37172,0,0,1378.9,491.8,8.5,250.3);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(37173,0,0,1360,428.5,17,241.9);
		quest::spawn2(37174,0,0,1291.6,425.8,20,243.3);
		quest::spawn2(37174,0,0,1315.1,426.3,19.3,2.1);
		quest::spawn2(37174,0,0,1371.8,456.2,14,243.9);
		quest::spawn2(37174,0,0,1378.9,491.8,8.5,250.3);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(37175,0,0,1360,428.5,17,241.9);
		quest::spawn2(37176,0,0,1291.6,425.8,20,243.3);
		quest::spawn2(37176,0,0,1315.1,426.3,19.3,2.1);
		quest::spawn2(37176,0,0,1371.8,456.2,14,243.9);
		quest::spawn2(37176,0,0,1378.9,491.8,8.5,250.3);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(37177,0,0,1360,428.5,17,241.9);
		quest::spawn2(37178,0,0,1291.6,425.8,20,243.3);
		quest::spawn2(37178,0,0,1315.1,426.3,19.3,2.1);
		quest::spawn2(37178,0,0,1371.8,456.2,14,243.9);
		quest::spawn2(37178,0,0,1378.9,491.8,8.5,250.3);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(37179,0,0,1360,428.5,17,241.9);
		quest::spawn2(37180,0,0,1291.6,425.8,20,243.3);
		quest::spawn2(37180,0,0,1315.1,426.3,19.3,2.1);
		quest::spawn2(37180,0,0,1371.8,456.2,14,243.9);
		quest::spawn2(37180,0,0,1378.9,491.8,8.5,250.3);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(37181,0,0,1360,428.5,17,241.9);
		quest::spawn2(37182,0,0,1291.6,425.8,20,243.3);
		quest::spawn2(37182,0,0,1315.1,426.3,19.3,2.1);
		quest::spawn2(37182,0,0,1371.8,456.2,14,243.9);
		quest::spawn2(37182,0,0,1378.9,491.8,8.5,250.3);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(37183,0,0,1360,428.5,17,241.9);
		quest::spawn2(37184,0,0,1291.6,425.8,20,243.3);
		quest::spawn2(37184,0,0,1315.1,426.3,19.3,2.1);
		quest::spawn2(37184,0,0,1371.8,456.2,14,243.9);
		quest::spawn2(37172,0,0,1378.9,491.8,8.5,250.3);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(37185,0,0,1360,428.5,17,241.9);
		quest::spawn2(37186,0,0,1291.6,425.8,20,243.3);
		quest::spawn2(37186,0,0,1315.1,426.3,19.3,2.1);
		quest::spawn2(37186,0,0,1371.8,456.2,14,243.9);
		quest::spawn2(37186,0,0,1378.9,491.8,8.5,250.3);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(37187,0,0,1360,428.5,17,241.9);
		quest::spawn2(37188,0,0,1291.6,425.8,20,243.3);
		quest::spawn2(37188,0,0,1315.1,426.3,19.3,2.1);
		quest::spawn2(37188,0,0,1371.8,456.2,14,243.9);
		quest::spawn2(37188,0,0,1378.9,491.8,8.5,250.3);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(37189,0,0,1360,428.5,17,241.9);
		quest::spawn2(37190,0,0,1291.6,425.8,20,243.3);
		quest::spawn2(37190,0,0,1315.1,426.3,19.3,2.1);
		quest::spawn2(37190,0,0,1371.8,456.2,14,243.9);
		quest::spawn2(37190,0,0,1378.9,491.8,8.5,250.3);
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