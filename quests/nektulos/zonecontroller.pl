##zonecontroller.pl ID 25234 in Nektulos##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
 	quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
	if((defined $event8) && ($event8 == 1)) {
	    quest::unique_spawn(25213,0,0,-990.9,2208.1,-6.4,18); ##Peter Cottontail	
		quest::unique_spawn(25235,0,0,1099.3,-2258,16.3,202.5);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
	}
	}

sub EVENT_ENTER {
if((defined $event8) && ($event8 == 1)) {
    if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
        quest::depopall(25214); 
		quest::depopall(25215);
		quest::depopall(25216);
		quest::depopall(25217);
		quest::depopall(25218);
		quest::depopall(25219);
		quest::depopall(25220);
		quest::depopall(25221);
		quest::depopall(25222);
		quest::depopall(25223);
		quest::depopall(25224);
		quest::depopall(25225);
		quest::depopall(25226);
		quest::depopall(25227);
		quest::depopall(25228);
		quest::depopall(25229);
		quest::depopall(25230);
		quest::depopall(25231);
		quest::depopall(25232);
		quest::depopall(25233);
    if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(25214,0,0,1099.2,-2239,-5,247.3);
		quest::spawn2(25215,0,0,1033,-2238.9,-6.6,251);
		quest::spawn2(25215,0,0,1080.9,-2197.9,-3,22.3);
		quest::spawn2(25215,0,0,1126.6,-2204.1,0,255);
		quest::spawn2(25215,0,0,1150.6,-2239.9,4.3,255);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	   	quest::spawn2(25216,0,0,1099.2,-2239,-5,247.3);
		quest::spawn2(25217,0,0,1033,-2238.9,-6.6,251);
		quest::spawn2(25217,0,0,1080.9,-2197.9,-3,22.3);
		quest::spawn2(25217,0,0,1126.6,-2204.1,0,255);
		quest::spawn2(25217,0,0,1150.6,-2239.9,4.3,255);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	    quest::spawn2(25218,0,0,1099.2,-2239,-5,247.3);
		quest::spawn2(25219,0,0,1033,-2238.9,-6.6,251);
		quest::spawn2(25219,0,0,1080.9,-2197.9,-3,22.3);
		quest::spawn2(25219,0,0,1126.6,-2204.1,0,255);
		quest::spawn2(25219,0,0,1150.6,-2239.9,4.3,255);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(25220,0,0,1099.2,-2239,-5,247.3);
		quest::spawn2(25221,0,0,1033,-2238.9,-6.6,251);
		quest::spawn2(25221,0,0,1080.9,-2197.9,-3,22.3);
		quest::spawn2(25221,0,0,1126.6,-2204.1,0,255);
		quest::spawn2(25221,0,0,1150.6,-2239.9,4.3,255);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(25222,0,0,1099.2,-2239,-5,247.3);
		quest::spawn2(25223,0,0,1033,-2238.9,-6.6,251);
		quest::spawn2(25223,0,0,1080.9,-2197.9,-3,22.3);
		quest::spawn2(25223,0,0,1126.6,-2204.1,0,255);
		quest::spawn2(25223,0,0,1150.6,-2239.9,4.3,255);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(25224,0,0,1099.2,-2239,-5,247.3);
		quest::spawn2(25225,0,0,1033,-2238.9,-6.6,251);
		quest::spawn2(25225,0,0,1080.9,-2197.9,-3,22.3);
		quest::spawn2(25225,0,0,1126.6,-2204.1,0,255);
		quest::spawn2(25225,0,0,1150.6,-2239.9,4.3,255);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(25226,0,0,1099.2,-2239,-5,247.3);
		quest::spawn2(25227,0,0,1033,-2238.9,-6.6,251);
		quest::spawn2(25227,0,0,1080.9,-2197.9,-3,22.3);
		quest::spawn2(25227,0,0,1126.6,-2204.1,0,255);
		quest::spawn2(25227,0,0,1150.6,-2239.9,4.3,255);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(25228,0,0,1099.2,-2239,-5,247.3);
		quest::spawn2(25229,0,0,1033,-2238.9,-6.6,251);
		quest::spawn2(25229,0,0,1080.9,-2197.9,-3,22.3);
		quest::spawn2(25229,0,0,1126.6,-2204.1,0,255);
		quest::spawn2(25229,0,0,1150.6,-2239.9,4.3,255);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(25230,0,0,1099.2,-2239,-5,247.3);
		quest::spawn2(25231,0,0,1033,-2238.9,-6.6,251);
		quest::spawn2(25231,0,0,1080.9,-2197.9,-3,22.3);
		quest::spawn2(25231,0,0,1126.6,-2204.1,0,255);
		quest::spawn2(25231,0,0,1150.6,-2239.9,4.3,255);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(25232,0,0,1099.2,-2239,-5,247.3);
		quest::spawn2(25233,0,0,1033,-2238.9,-6.6,251);
		quest::spawn2(25233,0,0,1080.9,-2197.9,-3,22.3);
		quest::spawn2(25233,0,0,1126.6,-2204.1,0,255);
		quest::spawn2(25233,0,0,1150.6,-2239.9,4.3,255);
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