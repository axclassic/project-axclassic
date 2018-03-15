##zonecontroller.pl ID 33178 in Misty Thicket##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(33179,0,0,-2110.7,-1158.8,23.9,5.4);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
   
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(33158); 
		quest::depopall(33159);
		quest::depopall(33160);
		quest::depopall(33161);
		quest::depopall(33162);
		quest::depopall(33163);
		quest::depopall(33164);
		quest::depopall(33165);
		quest::depopall(33166);
		quest::depopall(33167);
		quest::depopall(33168);
		quest::depopall(33169);
		quest::depopall(33170);
		quest::depopall(33171);
		quest::depopall(33172);
		quest::depopall(33173);
		quest::depopall(33174);
		quest::depopall(33175);
		quest::depopall(33176);
		quest::depopall(33177);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(33158,0,0,-2109.3,-1145.3,9.1,5);
		quest::spawn2(33159,0,0,-2143.7,-1143,21.3,3.5);
		quest::spawn2(33159,0,0,-2104.5,-1077.8,1.7,3.4);
		quest::spawn2(33159,0,0,-2057.3,-1146.5,15.3,1.1);
		quest::spawn2(33159,0,0,-2056.1,-1096.4,4.5,249.6);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(33160,0,0,-2109.3,-1145.3,9.1,5);
		quest::spawn2(33161,0,0,-2143.7,-1143,21.3,3.5);
		quest::spawn2(33161,0,0,-2104.5,-1077.8,1.7,3.4);
		quest::spawn2(33161,0,0,-2057.3,-1146.5,15.3,1.1);
		quest::spawn2(33161,0,0,-2056.1,-1096.4,4.5,249.6);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(33162,0,0,-2109.3,-1145.3,9.1,5);
		quest::spawn2(33163,0,0,-2143.7,-1143,21.3,3.5);
		quest::spawn2(33163,0,0,-2104.5,-1077.8,1.7,3.4);
		quest::spawn2(33163,0,0,-2057.3,-1146.5,15.3,1.1);
		quest::spawn2(33163,0,0,-2056.1,-1096.4,4.5,249.6);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(33164,0,0,-2109.3,-1145.3,9.1,5);
		quest::spawn2(33165,0,0,-2143.7,-1143,21.3,3.5);
		quest::spawn2(33165,0,0,-2104.5,-1077.8,1.7,3.4);
		quest::spawn2(33165,0,0,-2057.3,-1146.5,15.3,1.1);
		quest::spawn2(33165,0,0,-2056.1,-1096.4,4.5,249.6);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(33166,0,0,-2109.3,-1145.3,9.1,5);
		quest::spawn2(33167,0,0,-2143.7,-1143,21.3,3.5);
		quest::spawn2(33167,0,0,-2104.5,-1077.8,1.7,3.4);
		quest::spawn2(33167,0,0,-2057.3,-1146.5,15.3,1.1);
		quest::spawn2(33167,0,0,-2056.1,-1096.4,4.5,249.6);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(33168,0,0,-2109.3,-1145.3,9.1,5);
		quest::spawn2(33169,0,0,-2143.7,-1143,21.3,3.5);
		quest::spawn2(33169,0,0,-2104.5,-1077.8,1.7,3.4);
		quest::spawn2(33169,0,0,-2057.3,-1146.5,15.3,1.1);
		quest::spawn2(33169,0,0,-2056.1,-1096.4,4.5,249.6);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(33170,0,0,-2109.3,-1145.3,9.1,5);
		quest::spawn2(33171,0,0,-2143.7,-1143,21.3,3.5);
		quest::spawn2(33171,0,0,-2104.5,-1077.8,1.7,3.4);
		quest::spawn2(33171,0,0,-2057.3,-1146.5,15.3,1.1);
		quest::spawn2(33171,0,0,-2056.1,-1096.4,4.5,249.6);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(33172,0,0,-2109.3,-1145.3,9.1,5);
		quest::spawn2(33173,0,0,-2143.7,-1143,21.3,3.5);
		quest::spawn2(33173,0,0,-2104.5,-1077.8,1.7,3.4);
		quest::spawn2(33173,0,0,-2057.3,-1146.5,15.3,1.1);
		quest::spawn2(33173,0,0,-2056.1,-1096.4,4.5,249.6);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(33174,0,0,-2109.3,-1145.3,9.1,5);
		quest::spawn2(33175,0,0,-2143.7,-1143,21.3,3.5);
		quest::spawn2(33175,0,0,-2104.5,-1077.8,1.7,3.4);
		quest::spawn2(33175,0,0,-2057.3,-1146.5,15.3,1.1);
		quest::spawn2(33175,0,0,-2056.1,-1096.4,4.5,249.6);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(33176,0,0,-2109.3,-1145.3,9.1,5);
		quest::spawn2(33177,0,0,-2143.7,-1143,21.3,3.5);
		quest::spawn2(33177,0,0,-2104.5,-1077.8,1.7,3.4);
		quest::spawn2(33177,0,0,-2057.3,-1146.5,15.3,1.1);
		quest::spawn2(33177,0,0,-2056.1,-1096.4,4.5,249.6);
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