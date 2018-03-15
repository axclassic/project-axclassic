##zonecontroller.pl ID 170576 in Twilight Sea##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(170577,0,0,1952.8,649.1,23.9,168.3);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }

sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if($ulevel <= 49) {
	    #Do nothing;
		}

	if($ulevel >= 50 && !defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(170570); 
		quest::depopall(170571);
		quest::depopall(170572);
		quest::depopall(170573);
		quest::depopall(170574);
		quest::depopall(170575);
	if($ulevel >= 50 && $ulevel <= 55) {
		quest::spawn2(170570,0,0,1932.1,621.3,28.4,183.6);
		quest::spawn2(170571,0,0,1904.4,666.1,33.6,159.1);
		quest::spawn2(170571,0,0,1871.3,647.8,23.7,171.1);
		quest::spawn2(170571,0,0,1893.3,571.9,24.7,199.3);
		quest::spawn2(170571,0,0,1938.6,574.3,34,202.9);
		}
	elsif($ulevel >= 56 && $ulevel <= 60) {
		quest::spawn2(170572,0,0,1932.1,621.3,28.4,183.6);
		quest::spawn2(170573,0,0,1904.4,666.1,33.6,159.1);
		quest::spawn2(170573,0,0,1871.3,647.8,23.7,171.1);
		quest::spawn2(170573,0,0,1893.3,571.9,24.7,199.3);
		quest::spawn2(170573,0,0,1938.6,574.3,34,202.9);
		}
	elsif($ulevel >= 56 && $ulevel <= 65) {
		quest::spawn2(170574,0,0,1932.1,621.3,28.4,183.6);
		quest::spawn2(170575,0,0,1904.4,666.1,33.6,159.1);
		quest::spawn2(170575,0,0,1871.3,647.8,23.7,171.1);
		quest::spawn2(170575,0,0,1893.3,571.9,24.7,199.3);
		quest::spawn2(170575,0,0,1938.6,574.3,34,202.9);
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

