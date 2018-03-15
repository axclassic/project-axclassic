##zonecontroller.pl ID 27169 in Lavastorm##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(27170,0,0,-891.5,-1419,7.4,52.5);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
   
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(27149); 
		quest::depopall(27150);
		quest::depopall(27151);
		quest::depopall(27152);
		quest::depopall(27153);
		quest::depopall(27154);
		quest::depopall(27155);
		quest::depopall(27156);
		quest::depopall(27157);
		quest::depopall(27158);
		quest::depopall(27159);
		quest::depopall(27160);
		quest::depopall(27161);
		quest::depopall(27162);
		quest::depopall(27163);
		quest::depopall(27164);
		quest::depopall(27165);
		quest::depopall(27166);
		quest::depopall(27167);
		quest::depopall(27168);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(27149,0,0,-877.7,-1395.7,-4.5,84.5);
		quest::spawn2(27150,0,0,-872.8,-1483.8,21.2,50.8);
		quest::spawn2(27150,0,0,-869.8,-1444.6,9.1,60.9);
		quest::spawn2(27150,0,0,-853.1,-1368.3,-3.8,87.1);
		quest::spawn2(27150,0,0,-829.6,-1340.6,-3,113.5);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(27151,0,0,-877.7,-1395.7,-4.5,84.5);
		quest::spawn2(27152,0,0,-872.8,-1483.8,21.2,50.8);
		quest::spawn2(27152,0,0,-869.8,-1444.6,9.1,60.9);
		quest::spawn2(27152,0,0,-853.1,-1368.3,-3.8,87.1);
		quest::spawn2(27152,0,0,-829.6,-1340.6,-3,113.5);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(27153,0,0,-877.7,-1395.7,-4.5,84.5);
		quest::spawn2(27154,0,0,-872.8,-1483.8,21.2,50.8);
		quest::spawn2(27154,0,0,-869.8,-1444.6,9.1,60.9);
		quest::spawn2(27154,0,0,-853.1,-1368.3,-3.8,87.1);
		quest::spawn2(27154,0,0,-829.6,-1340.6,-3,113.5);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(27155,0,0,-877.7,-1395.7,-4.5,84.5);
		quest::spawn2(27156,0,0,-872.8,-1483.8,21.2,50.8);
		quest::spawn2(27156,0,0,-869.8,-1444.6,9.1,60.9);
		quest::spawn2(27156,0,0,-853.1,-1368.3,-3.8,87.1);
		quest::spawn2(27156,0,0,-829.6,-1340.6,-3,113.5);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(27157,0,0,-877.7,-1395.7,-4.5,84.5);
		quest::spawn2(27158,0,0,-872.8,-1483.8,21.2,50.8);
		quest::spawn2(27158,0,0,-869.8,-1444.6,9.1,60.9);
		quest::spawn2(27158,0,0,-853.1,-1368.3,-3.8,87.1);
		quest::spawn2(27158,0,0,-829.6,-1340.6,-3,113.5);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(27159,0,0,-877.7,-1395.7,-4.5,84.5);
		quest::spawn2(27160,0,0,-872.8,-1483.8,21.2,50.8);
		quest::spawn2(27160,0,0,-869.8,-1444.6,9.1,60.9);
		quest::spawn2(27160,0,0,-853.1,-1368.3,-3.8,87.1);
		quest::spawn2(27160,0,0,-829.6,-1340.6,-3,113.5);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(27161,0,0,-877.7,-1395.7,-4.5,84.5);
		quest::spawn2(27162,0,0,-872.8,-1483.8,21.2,50.8);
		quest::spawn2(27162,0,0,-869.8,-1444.6,9.1,60.9);
		quest::spawn2(27162,0,0,-853.1,-1368.3,-3.8,87.1);
		quest::spawn2(27162,0,0,-829.6,-1340.6,-3,113.5);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(27163,0,0,-877.7,-1395.7,-4.5,84.5);
		quest::spawn2(27164,0,0,-872.8,-1483.8,21.2,50.8);
		quest::spawn2(27164,0,0,-869.8,-1444.6,9.1,60.9);
		quest::spawn2(27164,0,0,-853.1,-1368.3,-3.8,87.1);
		quest::spawn2(27164,0,0,-829.6,-1340.6,-3,113.5);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(27165,0,0,-877.7,-1395.7,-4.5,84.5);
		quest::spawn2(27166,0,0,-872.8,-1483.8,21.2,50.8);
		quest::spawn2(27166,0,0,-869.8,-1444.6,9.1,60.9);
		quest::spawn2(27166,0,0,-853.1,-1368.3,-3.8,87.1);
		quest::spawn2(27166,0,0,-829.6,-1340.6,-3,113.5);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(27167,0,0,-877.7,-1395.7,-4.5,84.5);
		quest::spawn2(27168,0,0,-872.8,-1483.8,21.2,50.8);
		quest::spawn2(27168,0,0,-869.8,-1444.6,9.1,60.9);
		quest::spawn2(27168,0,0,-853.1,-1368.3,-3.8,87.1);
		quest::spawn2(27168,0,0,-829.6,-1340.6,-3,113.5);
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