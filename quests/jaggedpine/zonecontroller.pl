##zonecontroller.pl ID 181536 in jaggedpine##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(181547,0,0,2037.9,2122.5,-2.6,147.9);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
   
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(181526); 
		quest::depopall(181527);
		quest::depopall(181528);
		quest::depopall(181529);
		quest::depopall(181530);
		quest::depopall(180531);
		quest::depopall(181532);
		quest::depopall(181533);
		quest::depopall(181534);
		quest::depopall(181535);
		quest::depopall(181536);
		quest::depopall(181537);
		quest::depopall(181538);
		quest::depopall(181539);
		quest::depopall(181540);
		quest::depopall(181541);
		quest::depopall(181542);
		quest::depopall(181543);
		quest::depopall(181544);
		quest::depopall(181545);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(181526,0,0,2025.3,2099.9,-11.7,142.8);
		quest::spawn2(181527,0,0,2015.8,2002.8,-10.7,150.8);
		quest::spawn2(181527,0,0,2031.4,2059.3,-9.2,156);
		quest::spawn2(181527,0,0,1995.5,2093.5,-10.6,142);
		quest::spawn2(181527,0,0,1939.3,2070.5,-10.8,138.5);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(181528,0,0,2025.3,2099.9,-11.7,142.8);
		quest::spawn2(181529,0,0,2015.8,2002.8,-10.7,150.8);
		quest::spawn2(181529,0,0,2031.4,2059.3,-9.2,156);
		quest::spawn2(181529,0,0,1995.5,2093.5,-10.6,142);
		quest::spawn2(181529,0,0,1939.3,2070.5,-10.8,138.5);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(181530,0,0,2025.3,2099.9,-11.7,142.8);
		quest::spawn2(181531,0,0,2015.8,2002.8,-10.7,150.8);
		quest::spawn2(181531,0,0,2031.4,2059.3,-9.2,156);
		quest::spawn2(181531,0,0,1995.5,2093.5,-10.6,142);
		quest::spawn2(181531,0,0,1939.3,2070.5,-10.8,138.5);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(181532,0,0,2025.3,2099.9,-11.7,142.8);
		quest::spawn2(181533,0,0,2015.8,2002.8,-10.7,150.8);
		quest::spawn2(181533,0,0,2031.4,2059.3,-9.2,156);
		quest::spawn2(181533,0,0,1995.5,2093.5,-10.6,142);
		quest::spawn2(181533,0,0,1939.3,2070.5,-10.8,138.5);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(181534,0,0,2025.3,2099.9,-11.7,142.8);
		quest::spawn2(181535,0,0,2015.8,2002.8,-10.7,150.8);
		quest::spawn2(181535,0,0,2031.4,2059.3,-9.2,156);
		quest::spawn2(181535,0,0,1995.5,2093.5,-10.6,142);
		quest::spawn2(181535,0,0,1939.3,2070.5,-10.8,138.5);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(181536,0,0,2025.3,2099.9,-11.7,142.8);
		quest::spawn2(181537,0,0,2015.8,2002.8,-10.7,150.8);
		quest::spawn2(181537,0,0,2031.4,2059.3,-9.2,156);
		quest::spawn2(181537,0,0,1995.5,2093.5,-10.6,142);
		quest::spawn2(181537,0,0,1939.3,2070.5,-10.8,138.5);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(181538,0,0,2025.3,2099.9,-11.7,142.8);
		quest::spawn2(181539,0,0,2015.8,2002.8,-10.7,150.8);
		quest::spawn2(181539,0,0,2031.4,2059.3,-9.2,156);
		quest::spawn2(181539,0,0,1995.5,2093.5,-10.6,142);
		quest::spawn2(181539,0,0,1939.3,2070.5,-10.8,138.5);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(181540,0,0,2025.3,2099.9,-11.7,142.8);
		quest::spawn2(181541,0,0,2015.8,2002.8,-10.7,150.8);
		quest::spawn2(181541,0,0,2031.4,2059.3,-9.2,156);
		quest::spawn2(181541,0,0,1995.5,2093.5,-10.6,142);
		quest::spawn2(181541,0,0,1939.3,2070.5,-10.8,138.5);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(181542,0,0,2025.3,2099.9,-11.7,142.8);
		quest::spawn2(181543,0,0,2015.8,2002.8,-10.7,150.8);
		quest::spawn2(181543,0,0,2031.4,2059.3,-9.2,156);
		quest::spawn2(181543,0,0,1995.5,2093.5,-10.6,142);
		quest::spawn2(181543,0,0,1939.3,2070.5,-10.8,138.5);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(181544,0,0,2025.3,2099.9,-11.7,142.8);
		quest::spawn2(181545,0,0,2015.8,2002.8,-10.7,150.8);
		quest::spawn2(181545,0,0,2031.4,2059.3,-9.2,156);
		quest::spawn2(181545,0,0,1995.5,2093.5,-10.6,142);
		quest::spawn2(181545,0,0,1939.3,2070.5,-10.8,138.5);
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
