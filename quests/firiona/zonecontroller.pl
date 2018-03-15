##zonecontroller.pl ID 84423 in Firiona Vie##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 300, $x + 300, $y - 300, $y + 300);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(84424,0,0,-2353.9,3580.7,-93.6,237.8);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
   
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(84403); 
		quest::depopall(84404);
		quest::depopall(84405);
		quest::depopall(84406);
		quest::depopall(84407);
		quest::depopall(84408);
		quest::depopall(84409);
		quest::depopall(84410);
		quest::depopall(84411);
		quest::depopall(84412);
		quest::depopall(84413);
		quest::depopall(84414);
		quest::depopall(84415);
		quest::depopall(84416);
		quest::depopall(84417);
		quest::depopall(84418);
		quest::depopall(84419);
		quest::depopall(84420);
		quest::depopall(84421);
		quest::depopall(84422);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(84403,0,0,-2363.6,3594.6,-91.1,249.4);
		quest::spawn2(84404,0,0,-2298.5,3572.5,-95.3,114.4);
		quest::spawn2(84404,0,0,-2327.8,3640.3,-85.6,211);
		quest::spawn2(84404,0,0,-2404,3534.4,-99.5,94.3);
		quest::spawn2(84404,0,0,-2430.3,3579.9,-93.3,248.6);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(84405,0,0,-2363.6,3594.6,-91.1,249.4);
		quest::spawn2(84406,0,0,-2298.5,3572.5,-95.3,114.4);
		quest::spawn2(84406,0,0,-2327.8,3640.3,-85.6,211);
		quest::spawn2(84406,0,0,-2404,3534.4,-99.5,94.3);
		quest::spawn2(84406,0,0,-2430.3,3579.9,-93.3,248.6);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(84407,0,0,-2363.6,3594.6,-91.1,249.4);
		quest::spawn2(84408,0,0,-2298.5,3572.5,-95.3,114.4);
		quest::spawn2(84408,0,0,-2327.8,3640.3,-85.6,211);
		quest::spawn2(84408,0,0,-2404,3534.4,-99.5,94.3);
		quest::spawn2(84408,0,0,-2430.3,3579.9,-93.3,248.6);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(84409,0,0,-2363.6,3594.6,-91.1,249.4);
		quest::spawn2(84410,0,0,-2298.5,3572.5,-95.3,114.4);
		quest::spawn2(84410,0,0,-2327.8,3640.3,-85.6,211);
		quest::spawn2(84410,0,0,-2404,3534.4,-99.5,94.3);
		quest::spawn2(84410,0,0,-2430.3,3579.9,-93.3,248.6);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(84411,0,0,-2363.6,3594.6,-91.1,249.4);
		quest::spawn2(84412,0,0,-2298.5,3572.5,-95.3,114.4);
		quest::spawn2(84412,0,0,-2327.8,3640.3,-85.6,211);
		quest::spawn2(84412,0,0,-2404,3534.4,-99.5,94.3);
		quest::spawn2(84412,0,0,-2430.3,3579.9,-93.3,248.6);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(84413,0,0,-2363.6,3594.6,-91.1,249.4);
		quest::spawn2(84414,0,0,-2298.5,3572.5,-95.3,114.4);
		quest::spawn2(84414,0,0,-2327.8,3640.3,-85.6,211);
		quest::spawn2(84414,0,0,-2404,3534.4,-99.5,94.3);
		quest::spawn2(84414,0,0,-2430.3,3579.9,-93.3,248.6);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(84415,0,0,-2363.6,3594.6,-91.1,249.4);
		quest::spawn2(84416,0,0,-2298.5,3572.5,-95.3,114.4);
		quest::spawn2(84416,0,0,-2327.8,3640.3,-85.6,211);
		quest::spawn2(84416,0,0,-2404,3534.4,-99.5,94.3);
		quest::spawn2(84416,0,0,-2430.3,3579.9,-93.3,248.6);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(84417,0,0,-2363.6,3594.6,-91.1,249.4);
		quest::spawn2(84418,0,0,-2298.5,3572.5,-95.3,114.4);
		quest::spawn2(84418,0,0,-2327.8,3640.3,-85.6,211);
		quest::spawn2(84418,0,0,-2404,3534.4,-99.5,94.3);
		quest::spawn2(84418,0,0,-2430.3,3579.9,-93.3,248.6);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(84419,0,0,-2363.6,3594.6,-91.1,249.4);
		quest::spawn2(84420,0,0,-2298.5,3572.5,-95.3,114.4);
		quest::spawn2(84420,0,0,-2327.8,3640.3,-85.6,211);
		quest::spawn2(84420,0,0,-2404,3534.4,-99.5,94.3);
		quest::spawn2(84420,0,0,-2430.3,3579.9,-93.3,248.6);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(84421,0,0,-2363.6,3594.6,-91.1,249.4);
		quest::spawn2(84422,0,0,-2298.5,3572.5,-95.3,114.4);
		quest::spawn2(84422,0,0,-2327.8,3640.3,-85.6,211);
		quest::spawn2(84422,0,0,-2404,3534.4,-99.5,94.3);
		quest::spawn2(84422,0,0,-2430.3,3579.9,-93.3,248.6);
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