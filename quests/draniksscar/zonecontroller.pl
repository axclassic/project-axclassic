##zonecontroller.pl ID 302084 in Draniks Scar##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(302085,0,0,-1480.7,-378.1,260.3,153.9);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }

sub EVENT_ENTER {
if((defined $event8) && ($event8 == 1)) {
      if($ulevel <= 49) {
	    #Do nothing;
		}

	if($ulevel >= 50 && !defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(302078); 
		quest::depopall(302079);
		quest::depopall(302080);
		quest::depopall(302081);
		quest::depopall(302082);
		quest::depopall(302083);
	if($ulevel >= 50 && $ulevel <= 55) {
		quest::spawn2(302080,0,0,-1498.2,-378.9,263.7,136.1);
		quest::spawn2(302081,0,0,-1462.3,-422.6,263.8,156.4);
		quest::spawn2(302081,0,0,-1468.9,-476.1,263.5,178.4);
		quest::spawn2(302081,0,0,-1535.2,-431.8,269.6,112.3);
		quest::spawn2(302081,0,0,-1544.1,-370.8,270.1,119.8);
		}
	elsif($ulevel >= 56 && $ulevel <= 60) {
		quest::spawn2(302082,0,0,-1498.2,-378.9,263.7,136.1);
		quest::spawn2(302083,0,0,-1462.3,-422.6,263.8,156.4);
		quest::spawn2(302083,0,0,-1468.9,-476.1,263.5,178.4);
		quest::spawn2(302083,0,0,-1535.2,-431.8,269.6,112.3);
		quest::spawn2(302083,0,0,-1544.1,-370.8,270.1,119.8);
		}
	elsif($ulevel >= 56 && $ulevel <= 65) {
		quest::spawn2(302078,0,0,-1498.2,-378.9,263.7,136.1);
		quest::spawn2(302079,0,0,-1462.3,-422.6,263.8,156.4);
		quest::spawn2(302079,0,0,-1468.9,-476.1,263.5,178.4);
		quest::spawn2(302079,0,0,-1535.2,-431.8,269.6,112.3);
		quest::spawn2(302079,0,0,-1544.1,-370.8,270.1,119.8);
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

