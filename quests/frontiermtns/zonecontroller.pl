##zonecontroller.pl ID 92205 in Frontier Mountains##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(92206,0,0,-2087.8,752.3,29.4,85.3);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }

sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if($ulevel <= 49) {
	    #Do nothing;
		}

	if($ulevel >= 50 && !defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(92199); 
		quest::depopall(92200);
		quest::depopall(92201);
		quest::depopall(92202);
		quest::depopall(92203);
		quest::depopall(92204);
	if($ulevel >= 50 && $ulevel <= 55) {
		quest::spawn2(92199,0,0,-2072.4,742.6,21.9,74.5);
		quest::spawn2(92200,0,0,-2058,777.7,26.2,99.9);
		quest::spawn2(92200,0,0,-2020.8,747.4,13.1,105.6);
		quest::spawn2(92200,0,0,-2094.9,707.8,18.2,69);
		quest::spawn2(92200,0,0,-2049.2,690.9,2.2,28.5);
		}
	elsif($ulevel >= 56 && $ulevel <= 60) {
		quest::spawn2(92201,0,0,-2072.4,742.6,21.9,74.5);
		quest::spawn2(92202,0,0,-2058,777.7,26.2,99.9);
		quest::spawn2(92202,0,0,-2020.8,747.4,13.1,105.6);
		quest::spawn2(92202,0,0,-2094.9,707.8,18.2,69);
		quest::spawn2(92202,0,0,-2049.2,690.9,2.2,28.5);
		}
	elsif($ulevel >= 56 && $ulevel <= 65) {
		quest::spawn2(92203,0,0,-2072.4,742.6,21.9,74.5);
		quest::spawn2(92204,0,0,-2058,777.7,26.2,99.9);
		quest::spawn2(92204,0,0,-2020.8,747.4,13.1,105.6);
		quest::spawn2(92204,0,0,-2094.9,707.8,18.2,69);
		quest::spawn2(92204,0,0,-2049.2,690.9,2.2,28.5);
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



