##zonecontroller.pl ID 94163 in Emerald Jungle##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(94164,0,0,4985.4,-1592.5,33.5,84.9);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
   
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(94143); 
		quest::depopall(94144);
		quest::depopall(94145);
		quest::depopall(94146);
		quest::depopall(94147);
		quest::depopall(94148);
		quest::depopall(94149);
		quest::depopall(94150);
		quest::depopall(94151);
		quest::depopall(94152);
		quest::depopall(94153);
		quest::depopall(94154);
		quest::depopall(94155);
		quest::depopall(94156);
		quest::depopall(94157);
		quest::depopall(94158);
		quest::depopall(94159);
		quest::depopall(94160);
		quest::depopall(94161);
		quest::depopall(94162);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(94143,0,0,5007.3,-1603.6,16.5,88.6);
		quest::spawn2(94144,0,0,5012.9,-1558.8,20.9,82.3);
		quest::spawn2(94144,0,0,4993.9,-1649.6,17.4,69.6);
		quest::spawn2(94144,0,0,5060.7,-1587.8,-1,86.9);
		quest::spawn2(94144,0,0,5045.4,-1655.6,3.6,57);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(94145,0,0,5007.3,-1603.6,16.5,88.6);
		quest::spawn2(94146,0,0,5012.9,-1558.8,20.9,82.3);
		quest::spawn2(94146,0,0,4993.9,-1649.6,17.4,69.6);
		quest::spawn2(94146,0,0,5060.7,-1587.8,-1,86.9);
		quest::spawn2(94146,0,0,5045.4,-1655.6,3.6,57);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(94147,0,0,5007.3,-1603.6,16.5,88.6);
		quest::spawn2(94148,0,0,5012.9,-1558.8,20.9,82.3);
		quest::spawn2(94148,0,0,4993.9,-1649.6,17.4,69.6);
		quest::spawn2(94148,0,0,5060.7,-1587.8,-1,86.9);
		quest::spawn2(94148,0,0,5045.4,-1655.6,3.6,57);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(94149,0,0,5007.3,-1603.6,16.5,88.6);
		quest::spawn2(94150,0,0,5012.9,-1558.8,20.9,82.3);
		quest::spawn2(94150,0,0,4993.9,-1649.6,17.4,69.6);
		quest::spawn2(94150,0,0,5060.7,-1587.8,-1,86.9);
		quest::spawn2(94150,0,0,5045.4,-1655.6,3.6,57);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(94151,0,0,5007.3,-1603.6,16.5,88.6);
		quest::spawn2(94152,0,0,5012.9,-1558.8,20.9,82.3);
		quest::spawn2(94152,0,0,4993.9,-1649.6,17.4,69.6);
		quest::spawn2(94152,0,0,5060.7,-1587.8,-1,86.9);
		quest::spawn2(94152,0,0,5045.4,-1655.6,3.6,57);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(94153,0,0,5007.3,-1603.6,16.5,88.6);
		quest::spawn2(94154,0,0,5012.9,-1558.8,20.9,82.3);
		quest::spawn2(94154,0,0,4993.9,-1649.6,17.4,69.6);
		quest::spawn2(94154,0,0,5060.7,-1587.8,-1,86.9);
		quest::spawn2(94154,0,0,5045.4,-1655.6,3.6,57);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(94155,0,0,5007.3,-1603.6,16.5,88.6);
		quest::spawn2(94156,0,0,5012.9,-1558.8,20.9,82.3);
		quest::spawn2(94156,0,0,4993.9,-1649.6,17.4,69.6);
		quest::spawn2(94156,0,0,5060.7,-1587.8,-1,86.9);
		quest::spawn2(94156,0,0,5045.4,-1655.6,3.6,57);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(94157,0,0,5007.3,-1603.6,16.5,88.6);
		quest::spawn2(94158,0,0,5012.9,-1558.8,20.9,82.3);
		quest::spawn2(94158,0,0,4993.9,-1649.6,17.4,69.6);
		quest::spawn2(94158,0,0,5060.7,-1587.8,-1,86.9);
		quest::spawn2(94158,0,0,5045.4,-1655.6,3.6,57);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(94159,0,0,5007.3,-1603.6,16.5,88.6);
		quest::spawn2(94160,0,0,5012.9,-1558.8,20.9,82.3);
		quest::spawn2(94160,0,0,4993.9,-1649.6,17.4,69.6);
		quest::spawn2(94160,0,0,5060.7,-1587.8,-1,86.9);
		quest::spawn2(94160,0,0,5045.4,-1655.6,3.6,57);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(94161,0,0,5007.3,-1603.6,16.5,88.6);
		quest::spawn2(94162,0,0,5012.9,-1558.8,20.9,82.3);
		quest::spawn2(94162,0,0,4993.9,-1649.6,17.4,69.6);
		quest::spawn2(94162,0,0,5060.7,-1587.8,-1,86.9);
		quest::spawn2(94162,0,0,5045.4,-1655.6,3.6,57);
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