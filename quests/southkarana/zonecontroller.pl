##zonecontroller.pl ID 14192 in South Karana##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(14193,0,0,1518.3,-7914.8,61.7,199);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
   
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(14172); 
		quest::depopall(14173);
		quest::depopall(14174);
		quest::depopall(14175);
		quest::depopall(14176);
		quest::depopall(14177);
		quest::depopall(14178);
		quest::depopall(14179);
		quest::depopall(14180);
		quest::depopall(14181);
		quest::depopall(14182);
		quest::depopall(14183);
		quest::depopall(14184);
		quest::depopall(14185);
		quest::depopall(14186);
		quest::depopall(14187);
		quest::depopall(14188);
		quest::depopall(14189);
		quest::depopall(14190);
		quest::depopall(14191);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(14172,0,0,1457.4,-7919.4,61.6,212.8);
		quest::spawn2(14173,0,0,1411.4,-7958.5,59.6,220.4);
		quest::spawn2(14173,0,0,1456,-7954.7,59.1,191.3);
		quest::spawn2(14173,0,0,1460.1,-7869.4,65.1,190.8);
		quest::spawn2(14173,0,0,1434.6,-7850.7,66.9,169.5);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(14174,0,0,1457.4,-7919.4,61.6,212.8);
		quest::spawn2(14175,0,0,1411.4,-7958.5,59.6,220.4);
		quest::spawn2(14175,0,0,1456,-7954.7,59.1,191.3);
		quest::spawn2(14175,0,0,1460.1,-7869.4,65.1,190.8);
		quest::spawn2(14175,0,0,1434.6,-7850.7,66.9,169.5);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(14176,0,0,1457.4,-7919.4,61.6,212.8);
		quest::spawn2(14177,0,0,1411.4,-7958.5,59.6,220.4);
		quest::spawn2(14177,0,0,1456,-7954.7,59.1,191.3);
		quest::spawn2(14177,0,0,1460.1,-7869.4,65.1,190.8);
		quest::spawn2(14177,0,0,1434.6,-7850.7,66.9,169.5);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(14178,0,0,1457.4,-7919.4,61.6,212.8);
		quest::spawn2(14179,0,0,1411.4,-7958.5,59.6,220.4);
		quest::spawn2(14179,0,0,1456,-7954.7,59.1,191.3);
		quest::spawn2(14179,0,0,1460.1,-7869.4,65.1,190.8);
		quest::spawn2(14179,0,0,1434.6,-7850.7,66.9,169.5);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(14180,0,0,1457.4,-7919.4,61.6,212.8);
		quest::spawn2(14181,0,0,1411.4,-7958.5,59.6,220.4);
		quest::spawn2(14181,0,0,1456,-7954.7,59.1,191.3);
		quest::spawn2(14181,0,0,1460.1,-7869.4,65.1,190.8);
		quest::spawn2(14181,0,0,1434.6,-7850.7,66.9,169.5);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(14182,0,0,1457.4,-7919.4,61.6,212.8);
		quest::spawn2(14183,0,0,1411.4,-7958.5,59.6,220.4);
		quest::spawn2(14183,0,0,1456,-7954.7,59.1,191.3);
		quest::spawn2(14183,0,0,1460.1,-7869.4,65.1,190.8);
		quest::spawn2(14183,0,0,1434.6,-7850.7,66.9,169.5);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(14184,0,0,1457.4,-7919.4,61.6,212.8);
		quest::spawn2(14185,0,0,1411.4,-7958.5,59.6,220.4);
		quest::spawn2(14185,0,0,1456,-7954.7,59.1,191.3);
		quest::spawn2(14185,0,0,1460.1,-7869.4,65.1,190.8);
		quest::spawn2(14185,0,0,1434.6,-7850.7,66.9,169.5);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(14186,0,0,1457.4,-7919.4,61.6,212.8);
		quest::spawn2(14187,0,0,1411.4,-7958.5,59.6,220.4);
		quest::spawn2(14187,0,0,1456,-7954.7,59.1,191.3);
		quest::spawn2(14187,0,0,1460.1,-7869.4,65.1,190.8);
		quest::spawn2(14187,0,0,1434.6,-7850.7,66.9,169.5);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(14188,0,0,1457.4,-7919.4,61.6,212.8);
		quest::spawn2(14189,0,0,1411.4,-7958.5,59.6,220.4);
		quest::spawn2(14189,0,0,1456,-7954.7,59.1,191.3);
		quest::spawn2(14189,0,0,1460.1,-7869.4,65.1,190.8);
		quest::spawn2(14189,0,0,1434.6,-7850.7,66.9,169.5);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(14190,0,0,1457.4,-7919.4,61.6,212.8);
		quest::spawn2(14191,0,0,1411.4,-7958.5,59.6,220.4);
		quest::spawn2(14191,0,0,1456,-7954.7,59.1,191.3);
		quest::spawn2(14191,0,0,1460.1,-7869.4,65.1,190.8);
		quest::spawn2(14191,0,0,1434.6,-7850.7,66.9,169.5);
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