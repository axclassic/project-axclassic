##zonecontroller.pl ID 22261 in ecommons##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 300, $x + 300, $y - 300, $y + 300);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(22262,0,0,-1053.8,-575,-37.3,221.1);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(22241); 
		quest::depopall(22242);
		quest::depopall(22243);
		quest::depopall(22244);
		quest::depopall(22245);
		quest::depopall(22246);
		quest::depopall(22247);
		quest::depopall(22248);
		quest::depopall(22249);
		quest::depopall(22250);
		quest::depopall(22251);
		quest::depopall(22252);
		quest::depopall(22253);
		quest::depopall(22254);
		quest::depopall(22255);
		quest::depopall(22256);
		quest::depopall(22257);
		quest::depopall(22258);
		quest::depopall(22259);
		quest::depopall(22260);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(22241,0,0,-1080.2,-573.9,-53.5,218);
		quest::spawn2(22242,0,0,-1122.1,-575.4,-53.5,245.8);
		quest::spawn2(22242,0,0,-1130.3,-551,-53.5,230.3);
		quest::spawn2(22242,0,0,-1081.4,-514,-53.5,242);
		quest::spawn2(22242,0,0,-1039.9,-533.4,-53.5,227.6);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(22243,0,0,-1080.2,-573.9,-53.5,218);
		quest::spawn2(22244,0,0,-1122.1,-575.4,-53.5,245.8);
		quest::spawn2(22244,0,0,-1130.3,-551,-53.5,230.3);
		quest::spawn2(22244,0,0,-1081.4,-514,-53.5,242);
		quest::spawn2(22244,0,0,-1039.9,-533.4,-53.5,227.6);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(22245,0,0,-1080.2,-573.9,-53.5,218);
		quest::spawn2(22246,0,0,-1122.1,-575.4,-53.5,245.8);
		quest::spawn2(22246,0,0,-1130.3,-551,-53.5,230.3);
		quest::spawn2(22246,0,0,-1081.4,-514,-53.5,242);
		quest::spawn2(22246,0,0,-1039.9,-533.4,-53.5,227.6);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(22247,0,0,-1080.2,-573.9,-53.5,218);
		quest::spawn2(22248,0,0,-1122.1,-575.4,-53.5,245.8);
		quest::spawn2(22248,0,0,-1130.3,-551,-53.5,230.3);
		quest::spawn2(22248,0,0,-1081.4,-514,-53.5,242);
		quest::spawn2(22248,0,0,-1039.9,-533.4,-53.5,227.6);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(22249,0,0,-1080.2,-573.9,-53.5,218);
		quest::spawn2(22250,0,0,-1122.1,-575.4,-53.5,245.8);
		quest::spawn2(22250,0,-1130.3,-551,-53.5,230.3);
		quest::spawn2(22250,0,0,-1081.4,-514,-53.5,242);
		quest::spawn2(22250,0,0,-1039.9,-533.4,-53.5,227.6);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(22251,0,0,-1080.2,-573.9,-53.5,218);
		quest::spawn2(22252,0,0,-1122.1,-575.4,-53.5,245.8);
		quest::spawn2(22252,0,0,-1130.3,-551,-53.5,230.3);
		quest::spawn2(22252,0,0,-1081.4,-514,-53.5,242);
		quest::spawn2(22252,0,0,-1039.9,-533.4,-53.5,227.6);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(22253,0,0,-1080.2,-573.9,-53.5,218);
		quest::spawn2(22254,0,0,-1122.1,-575.4,-53.5,245.8);
		quest::spawn2(22254,0,0,-1130.3,-551,-53.5,230.3);
		quest::spawn2(22254,0,0,-1081.4,-514,-53.5,242);
		quest::spawn2(22254,0,0,-1039.9,-533.4,-53.5,227.6);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(22255,0,0,-1080.2,-573.9,-53.5,218);
		quest::spawn2(22256,0,0,-1122.1,-575.4,-53.5,245.8);
		quest::spawn2(22256,0,0,-1130.3,-551,-53.5,230.3);
		quest::spawn2(22256,0,0,-1081.4,-514,-53.5,242);
		quest::spawn2(22256,0,0,-1039.9,-533.4,-53.5,227.6);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(22257,0,0,-1080.2,-573.9,-53.5,218);
		quest::spawn2(22258,0,0,-1122.1,-575.4,-53.5,245.8);
		quest::spawn2(22258,0,0,-1130.3,-551,-53.5,230.3);
		quest::spawn2(22258,0,0,-1081.4,-514,-53.5,242);
		quest::spawn2(22258,0,0,-1039.9,-533.4,-53.5,227.6);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(22259,0,0,-1080.2,-573.9,-53.5,218);
		quest::spawn2(22260,0,0,-1122.1,-575.4,-53.5,245.8);
		quest::spawn2(22260,0,0,-1130.3,-551,-53.5,230.3);
		quest::spawn2(22260,0,0,-1081.4,-514,-53.5,242);
		quest::spawn2(22260,0,0,-1039.9,-533.4,-53.5,227.6);
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