##zonecontroller.pl ID 50666 in Rathe Mountains##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(50667,0,0,-2337.7,1495.6,14.6,164.9);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
   
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(50646); 
		quest::depopall(50647);
		quest::depopall(50648);
		quest::depopall(50649);
		quest::depopall(50650);
		quest::depopall(50651);
		quest::depopall(50652);
		quest::depopall(50653);
		quest::depopall(50654);
		quest::depopall(50655);
		quest::depopall(50656);
		quest::depopall(50657);
		quest::depopall(50658);
		quest::depopall(50659);
		quest::depopall(50660);
		quest::depopall(50661);
		quest::depopall(50662);
		quest::depopall(50663);
		quest::depopall(50664);
		quest::depopall(50665);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(50646,0,0,-2342.4,1489.7,-0.1,164.5);
		quest::spawn2(50647,0,0,-2344.7,1419.3,-1.5,137);
		quest::spawn2(50647,0,0,-2344.4,1453.5,-0.8,152.4);
		quest::spawn2(50647,0,0,-2380.8,1490.4,-0.9,147.6);
		quest::spawn2(50647,0,0,-2427.1,1469.1,-1.4,123);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(50648,0,0,-2342.4,1489.7,-0.1,164.5);
		quest::spawn2(50649,0,0,-2344.7,1419.3,-1.5,137);
		quest::spawn2(50649,0,0,-2344.4,1453.5,-0.8,152.4);
		quest::spawn2(50649,0,0,-2380.8,1490.4,-0.9,147.6);
		quest::spawn2(50649,0,0,-2427.1,1469.1,-1.4,123);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(50650,0,0,-2342.4,1489.7,-0.1,164.5);
		quest::spawn2(50651,0,0,-2344.7,1419.3,-1.5,137);
		quest::spawn2(50651,0,0,-2344.4,1453.5,-0.8,152.4);
		quest::spawn2(50651,0,0,-2380.8,1490.4,-0.9,147.6);
		quest::spawn2(50651,0,0,-2427.1,1469.1,-1.4,123);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(50652,0,0,-2342.4,1489.7,-0.1,164.5);
		quest::spawn2(50653,0,0,-2344.7,1419.3,-1.5,137);
		quest::spawn2(50653,0,0,-2344.4,1453.5,-0.8,152.4);
		quest::spawn2(50653,0,0,-2380.8,1490.4,-0.9,147.6);
		quest::spawn2(50653,0,0,-2427.1,1469.1,-1.4,123);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(50654,0,0,-2342.4,1489.7,-0.1,164.5);
		quest::spawn2(50655,0,0,-2344.7,1419.3,-1.5,137);
		quest::spawn2(50655,0,0,-2344.4,1453.5,-0.8,152.4);
		quest::spawn2(50655,0,0,-2380.8,1490.4,-0.9,147.6);
		quest::spawn2(50655,0,0,-2427.1,1469.1,-1.4,123);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(50656,0,0,-2342.4,1489.7,-0.1,164.5);
		quest::spawn2(50657,0,0,-2344.7,1419.3,-1.5,137);
		quest::spawn2(50657,0,0,-2344.4,1453.5,-0.8,152.4);
		quest::spawn2(50657,0,0,-2380.8,1490.4,-0.9,147.6);
		quest::spawn2(50657,0,0,-2427.1,1469.1,-1.4,123);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(50658,0,0,-2342.4,1489.7,-0.1,164.5);
		quest::spawn2(50659,0,0,-2344.7,1419.3,-1.5,137);
		quest::spawn2(50659,0,0,-2344.4,1453.5,-0.8,152.4);
		quest::spawn2(50659,0,0,-2380.8,1490.4,-0.9,147.6);
		quest::spawn2(50659,0,0,-2427.1,1469.1,-1.4,123);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(50660,0,0,-2342.4,1489.7,-0.1,164.5);
		quest::spawn2(50661,0,0,-2344.7,1419.3,-1.5,137);
		quest::spawn2(50661,0,0,-2344.4,1453.5,-0.8,152.4);
		quest::spawn2(50661,0,0,-2380.8,1490.4,-0.9,147.6);
		quest::spawn2(50661,0,0,-2427.1,1469.1,-1.4,123);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(50662,0,0,-2342.4,1489.7,-0.1,164.5);
		quest::spawn2(50663,0,0,-2344.7,1419.3,-1.5,137);
		quest::spawn2(50663,0,0,-2344.4,1453.5,-0.8,152.4);
		quest::spawn2(50663,0,0,-2380.8,1490.4,-0.9,147.6);
		quest::spawn2(50663,0,0,-2427.1,1469.1,-1.4,123);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(50664,0,0,-2342.4,1489.7,-0.1,164.5);
		quest::spawn2(50665,0,0,-2344.7,1419.3,-1.5,137);
		quest::spawn2(50665,0,0,-2344.4,1453.5,-0.8,152.4);
		quest::spawn2(50665,0,0,-2380.8,1490.4,-0.9,147.6);
		quest::spawn2(50665,0,0,-2427.1,1469.1,-1.4,123);
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
