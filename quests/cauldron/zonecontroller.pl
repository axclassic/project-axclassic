##zonecontroller.pl ID 70090 in Dagnors Cauldron##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(70091,0,0,-165.7,1298.6,174.6,47.5);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }

sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(70070); 
		quest::depopall(70071);
		quest::depopall(70072);
		quest::depopall(70073);
		quest::depopall(70074);
		quest::depopall(70075);
		quest::depopall(70076);
		quest::depopall(70077);
		quest::depopall(70078);
		quest::depopall(70079);
		quest::depopall(70080);
		quest::depopall(70081);
		quest::depopall(70082);
		quest::depopall(70083);
		quest::depopall(70084);
		quest::depopall(70085);
		quest::depopall(70086);
		quest::depopall(70087);
		quest::depopall(70088);
		quest::depopall(70089);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(70070,0,0,-141.7,1314.2,169.6,252.5);
		quest::spawn2(70071,0,0,-186.6,1341.1,169.3,6.9);
		quest::spawn2(70071,0,0,-202.1,1395,172.2,39.1);
		quest::spawn2(70071,0,0,-126,1341.9,169.5,236.8);
		quest::spawn2(70071,0,0,-135.3,1405,173.2,243.3);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(70072,0,0,-141.7,1314.2,169.6,252.5);
		quest::spawn2(70073,0,0,-186.6,1341.1,169.3,6.9);
		quest::spawn2(70073,0,0,-202.1,1395,172.2,39.1);
		quest::spawn2(70073,0,0,-126,1341.9,169.5,236.8);
		quest::spawn2(70073,0,0,-135.3,1405,173.2,243.3);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(70074,0,0,-141.7,1314.2,169.6,252.5);
		quest::spawn2(70075,0,0,-186.6,1341.1,169.3,6.9);
		quest::spawn2(70075,0,0,-202.1,1395,172.2,39.1);
		quest::spawn2(70075,0,0,-126,1341.9,169.5,236.8);
		quest::spawn2(70075,0,0,-135.3,1405,173.2,243.3);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(70076,0,0,-141.7,1314.2,169.6,252.5);
		quest::spawn2(70077,0,0,-186.6,1341.1,169.3,6.9);
		quest::spawn2(70077,0,0,-202.1,1395,172.2,39.1);
		quest::spawn2(70077,0,0,-126,1341.9,169.5,236.8);
		quest::spawn2(70077,0,0,-135.3,1405,173.2,243.3);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(70078,0,0,-141.7,1314.2,169.6,252.5);
		quest::spawn2(70079,0,0,-186.6,1341.1,169.3,6.9);
		quest::spawn2(70079,0,0,-202.1,1395,172.2,39.1);
		quest::spawn2(70079,0,0,-126,1341.9,169.5,236.8);
		quest::spawn2(70079,0,0,-135.3,1405,173.2,243.3);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(70080,0,0,-141.7,1314.2,169.6,252.5);
		quest::spawn2(70081,0,0,-186.6,1341.1,169.3,6.9);
		quest::spawn2(70081,0,0,-202.1,1395,172.2,39.1);
		quest::spawn2(70081,0,0,-126,1341.9,169.5,236.8);
		quest::spawn2(70081,0,0,-135.3,1405,173.2,243.3);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(70082,0,0,-141.7,1314.2,169.6,252.5);
		quest::spawn2(70083,0,0,-186.6,1341.1,169.3,6.9);
		quest::spawn2(70083,0,0,-202.1,1395,172.2,39.1);
		quest::spawn2(70083,0,0,-126,1341.9,169.5,236.8);
		quest::spawn2(70083,0,0,-135.3,1405,173.2,243.3);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(70084,0,0,-141.7,1314.2,169.6,252.5);
		quest::spawn2(70085,0,0,-186.6,1341.1,169.3,6.9);
		quest::spawn2(70085,0,0,-202.1,1395,172.2,39.1);
		quest::spawn2(70085,0,0,-126,1341.9,169.5,236.8);
		quest::spawn2(70085,0,0,-135.3,1405,173.2,243.3);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(70086,0,0,-141.7,1314.2,169.6,252.5);
		quest::spawn2(70087,0,0,-186.6,1341.1,169.3,6.9);
		quest::spawn2(70087,0,0,-202.1,1395,172.2,39.1);
		quest::spawn2(70087,0,0,-126,1341.9,169.5,236.8);
		quest::spawn2(70087,0,0,-135.3,1405,173.2,243.3);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(70088,0,0,-141.7,1314.2,169.6,252.5);
		quest::spawn2(70089,0,0,-186.6,1341.1,169.3,6.9);
		quest::spawn2(70089,0,0,-202.1,1395,172.2,39.1);
		quest::spawn2(70089,0,0,-126,1341.9,169.5,236.8);
		quest::spawn2(70089,0,0,-135.3,1405,173.2,243.3);
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