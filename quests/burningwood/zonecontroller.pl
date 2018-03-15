##zonecontroller.pl ID 87168 in Burning Woods##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(87169,0,0,-3008.4,2274.3,-350.6,135.5);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }

sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if($ulevel <= 49) {
	    #Do nothing;
		}

	if($ulevel >= 50 && !defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(87162); 
		quest::depopall(87163);
		quest::depopall(87164);
		quest::depopall(87165);
		quest::depopall(87166);
		quest::depopall(87167);
	if($ulevel >= 50 && $ulevel <= 55) {
		quest::spawn2(87162,0,0,-3020.7,2228.3,-375.3,137.9);
		quest::spawn2(87163,0,0,-2964.4,2211.1,-376.4,150.8);
		quest::spawn2(87163,0,0,-2976.3,2168,-378.9,151.3);
		quest::spawn2(87163,0,0,-3061.8,2233.2,-375.1,112);
		quest::spawn2(87163,0,0,-3050.6,2185.6,-377.9,103.6);
		}
	elsif($ulevel >= 56 && $ulevel <= 60) {
		quest::spawn2(87164,0,0,-3020.7,2228.3,-375.3,137.9);
		quest::spawn2(87165,0,0,-2964.4,2211.1,-376.4,150.8);
		quest::spawn2(87165,0,0,-2976.3,2168,-378.9,151.3);
		quest::spawn2(87165,0,0,-3061.8,2233.2,-375.1,112);
		quest::spawn2(87165,0,0,-3050.6,2185.6,-377.9,103.6);
		}
	elsif($ulevel >= 56 && $ulevel <= 65) {
		quest::spawn2(87166,0,0,-3020.7,2228.3,-375.3,137.9);
		quest::spawn2(87167,0,0,-2964.4,2211.1,-376.4,150.8);
		quest::spawn2(87167,0,0,-2976.3,2168,-378.9,151.3);
		quest::spawn2(87167,0,0,-3061.8,2233.2,-375.1,112);
		quest::spawn2(87167,0,0,-3050.6,2185.6,-377.9,103.6);
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

