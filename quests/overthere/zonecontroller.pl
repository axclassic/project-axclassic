##zonecontroller.pl ID 93308 in Overthere##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(93309,0,0,-2683.7,-3149.3,155.4,236.5);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }

sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if($ulevel <= 49) {
	    #Do nothing;
		}

	if($ulevel >= 50 && !defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(93302); 
		quest::depopall(93303);
		quest::depopall(93304);
		quest::depopall(93305);
		quest::depopall(93306);
		quest::depopall(93307);
	if($ulevel >= 50 && $ulevel <= 55) {
		quest::spawn2(93302,0,0,-2706.6,-3119,143.6,239.4);
		quest::spawn2(93303,0,0,-2734.7,-3176.8,154.4);
		quest::spawn2(93303,0,0,-2730,-3137.9,145.8,242.4);
		quest::spawn2(93303,0,0,-2668.2,-3109.9,145.8,237.4);
		quest::spawn2(93303,0,0,-2630.9,-3138.4,155.5,236.9);
		}
	elsif($ulevel >= 56 && $ulevel <= 60) {
		quest::spawn2(93304,0,0,-2706.6,-3119,143.6,239.4);
		quest::spawn2(93305,0,0,-2734.7,-3176.8,154.4);
		quest::spawn2(93305,0,0,-2730,-3137.9,145.8,242.4);
		quest::spawn2(93305,0,0,-2668.2,-3109.9,145.8,237.4);
		quest::spawn2(93305,0,0,-2630.9,-3138.4,155.5,236.9);
		}
	elsif($ulevel >= 56 && $ulevel <= 65) {
		quest::spawn2(93306,0,0,-2706.6,-3119,143.6,239.4);
		quest::spawn2(93307,0,0,-2734.7,-3176.8,154.4);
		quest::spawn2(93307,0,0,-2730,-3137.9,145.8,242.4);
		quest::spawn2(93307,0,0,-2668.2,-3109.9,145.8,237.4);
		quest::spawn2(93307,0,0,-2630.9,-3138.4,155.5,236.9);
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



