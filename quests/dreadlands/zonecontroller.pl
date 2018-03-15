##zonecontroller.pl ID 86164 in Dreadlands##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(86165,0,0,6785.6,636.6,1062.9,73.4);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }

sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if($ulevel <= 49) {
	    #Do nothing;
		}

	if($ulevel >= 50 && !defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(86158); 
		quest::depopall(86159);
		quest::depopall(86160);
		quest::depopall(86161);
		quest::depopall(86162);
		quest::depopall(86163);
	if($ulevel >= 50 && $ulevel <= 55) {
		quest::spawn2(86158,0,0,6809.2,629.7,1047.5,71.5);
		quest::spawn2(86159,0,0,6876.1,595.6,1046.5,51);
		quest::spawn2(86159,0,0,6809,592.4,1046.3,53);
		quest::spawn2(86159,0,0,6834.9,696.7,1053.5,95.8);
		quest::spawn2(86159,0,0,6883.6,693.4,1045.4,66);
		}
	elsif($ulevel >= 56 && $ulevel <= 60) {
		quest::spawn2(86160,0,0,6809.2,629.7,1047.5,71.5);
		quest::spawn2(86161,0,0,6876.1,595.6,1046.5,51);
		quest::spawn2(86161,0,0,6809,592.4,1046.3,53);
		quest::spawn2(86161,0,0,6834.9,696.7,1053.5,95.8);
		quest::spawn2(86161,0,0,6883.6,693.4,1045.4,66);
		}
	elsif($ulevel >= 56 && $ulevel <= 65) {
		quest::spawn2(86162,0,0,6809.2,629.7,1047.5,71.5);
		quest::spawn2(86163,0,0,6876.1,595.6,1046.5,51);
		quest::spawn2(86163,0,0,6809,592.4,1046.3,53);
		quest::spawn2(86163,0,0,6834.9,696.7,1053.5,95.8);
		quest::spawn2(86163,0,0,6883.6,693.4,1045.4,66);
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

