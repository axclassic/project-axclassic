##zonecontroller.pl ID 47233 in The Feerrott##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
	    quest::unique_spawn(47234,0,0,-2561.2,-412,0.9,250.5);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
	}
	}
       
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(47213); 
		quest::depopall(47214);
		quest::depopall(47215);
		quest::depopall(47216);
		quest::depopall(47217);
		quest::depopall(47218);
		quest::depopall(47219);
		quest::depopall(47220);
		quest::depopall(47221);
		quest::depopall(47222);
		quest::depopall(47223);
		quest::depopall(47224);
		quest::depopall(47225);
		quest::depopall(47226);
		quest::depopall(47227);
		quest::depopall(47228);
		quest::depopall(47229);
		quest::depopall(47230);
		quest::depopall(47231);
		quest::depopall(47232);
	if($ulevel >= 1 && $ulevel <= 5) {
	    quest::spawn2(47213,0,0,-2563.9,-1399.9,-7.9,253.9);
		quest::spawn2(47214,0,0,-2537.2,-1398.9,-6.2,247.4);
		quest::spawn2(47214,0,0,-2597.2,-1384.3,-12.2,11.1);
		quest::spawn2(47214,0,0,-2604.9,-1331.4,-20.1,1.4);
		quest::spawn2(47214,0,0,-2499.6,-1396.1,-7.3,236.1)
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	    quest::spawn2(47215,0,0,-2563.9,-1399.9,-7.9,253.9);
		quest::spawn2(47216,0,0,-2537.2,-1398.9,-6.2,247.4);
		quest::spawn2(47216,0,0,-2597.2,-1384.3,-12.2,11.1);
		quest::spawn2(47216,0,0,-2604.9,-1331.4,-20.1,1.4);
		quest::spawn2(47216,0,0,-2499.6,-1396.1,-7.3,236.1)
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	    quest::spawn2(47217,0,0,-2563.9,-1399.9,-7.9,253.9);
		quest::spawn2(47218,0,0,-2537.2,-1398.9,-6.2,247.4);
		quest::spawn2(47218,0,0,-2597.2,-1384.3,-12.2,11.1);
		quest::spawn2(47218,0,0,-2604.9,-1331.4,-20.1,1.4);
		quest::spawn2(47218,0,0,-2499.6,-1396.1,-7.3,236.1)
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(47219,0,0,-2563.9,-1399.9,-7.9,253.9);
		quest::spawn2(47220,0,0,-2537.2,-1398.9,-6.2,247.4);
		quest::spawn2(47220,0,0,-2597.2,-1384.3,-12.2,11.1);
		quest::spawn2(47220,0,0,-2604.9,-1331.4,-20.1,1.4);
		quest::spawn2(47220,0,0,-2499.6,-1396.1,-7.3,236.1)
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(47221,0,0,-2563.9,-1399.9,-7.9,253.9);
		quest::spawn2(47222,0,0,-2537.2,-1398.9,-6.2,247.4);
		quest::spawn2(47222,0,0,-2597.2,-1384.3,-12.2,11.1);
		quest::spawn2(47222,0,0,-2604.9,-1331.4,-20.1,1.4);
		quest::spawn2(47222,0,0,-2499.6,-1396.1,-7.3,236.1)
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(47223,0,0,-2563.9,-1399.9,-7.9,253.9);
		quest::spawn2(47224,0,0,-2537.2,-1398.9,-6.2,247.4);
		quest::spawn2(47224,0,0,-2597.2,-1384.3,-12.2,11.1);
		quest::spawn2(47224,0,0,-2604.9,-1331.4,-20.1,1.4);
		quest::spawn2(47224,0,0,-2499.6,-1396.1,-7.3,236.1);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(47225,0,0,-2563.9,-1399.9,-7.9,253.9);
		quest::spawn2(47226,0,0,-2537.2,-1398.9,-6.2,247.4);
		quest::spawn2(47226,0,0,-2597.2,-1384.3,-12.2,11.1);
		quest::spawn2(47226,0,0,-2604.9,-1331.4,-20.1,1.4);
		quest::spawn2(47226,0,0,-2499.6,-1396.1,-7.3,236.1)
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(47227,0,0,-2563.9,-1399.9,-7.9,253.9);
		quest::spawn2(47228,0,0,-2537.2,-1398.9,-6.2,247.4);
		quest::spawn2(47228,0,0,-2597.2,-1384.3,-12.2,11.1);
		quest::spawn2(47228,0,0,-2604.9,-1331.4,-20.1,1.4);
		quest::spawn2(47228,0,0,-2499.6,-1396.1,-7.3,236.1)
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(47229,0,0,-2563.9,-1399.9,-7.9,253.9);
		quest::spawn2(47230,0,0,-2537.2,-1398.9,-6.2,247.4);
		quest::spawn2(47230,0,0,-2597.2,-1384.3,-12.2,11.1);
		quest::spawn2(47230,0,0,-2604.9,-1331.4,-20.1,1.4);
		quest::spawn2(47230,0,0,-2499.6,-1396.1,-7.3,236.1)
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(47231,0,0,-2563.9,-1399.9,-7.9,253.9);
		quest::spawn2(47232,0,0,-2537.2,-1398.9,-6.2,247.4);
		quest::spawn2(47232,0,0,-2597.2,-1384.3,-12.2,11.1);
		quest::spawn2(47232,0,0,-2604.9,-1331.4,-20.1,1.4);
		quest::spawn2(47232,0,0,-2499.6,-1396.1,-7.3,236.1)
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