##zonecontroller.pl ID 16057 in beholder Gorge of King Xorbb##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 250, $x + 250, $y - 250, $y + 250);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(16058,0,0,-81.1,-845.4,62.5,51.1);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
   
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(16037); 
		quest::depopall(16038);
		quest::depopall(16039);
		quest::depopall(16040);
		quest::depopall(16041);
		quest::depopall(16042);
		quest::depopall(16043);
		quest::depopall(16044);
		quest::depopall(16045);
		quest::depopall(16046);
		quest::depopall(16047);
		quest::depopall(16048);
		quest::depopall(16049);
		quest::depopall(16050);
		quest::depopall(16051);
		quest::depopall(16052);
		quest::depopall(16053);
		quest::depopall(16054);
		quest::depopall(16055);
		quest::depopall(16056);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(16037,0,0,-1.5,-847.9,61.5,205.9);
		quest::spawn2(16038,0,0,-141.5,-784.9,53.7,56.5);
		quest::spawn2(16038,0,0,10.4,-799.6,60.5,225.5);
		quest::spawn2(16038,0,0,-163.7,-858.4,59.1,134.9);
		quest::spawn2(16038,0,0,-48.2,-900.3,54.9,201.6);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(16039,0,0,-1.5,-847.9,61.5,205.9);
		quest::spawn2(16040,0,0,-141.5,-784.9,53.7,56.5);
		quest::spawn2(16040,0,0,10.4,-799.6,60.5,225.5);
		quest::spawn2(16040,0,0,-163.7,-858.4,59.1,134.9);
		quest::spawn2(16040,0,0,-48.2,-900.3,54.9,201.6);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(16041,0,0,-1.5,-847.9,61.5,205.9);
		quest::spawn2(16042,0,0,-141.5,-784.9,53.7,56.5);
		quest::spawn2(16042,0,0,10.4,-799.6,60.5,225.5);
		quest::spawn2(16042,0,0,-163.7,-858.4,59.1,134.9);
		quest::spawn2(16042,0,0,-48.2,-900.3,54.9,201.6);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(16043,0,0,-1.5,-847.9,61.5,205.9);
		quest::spawn2(16044,0,0,-141.5,-784.9,53.7,56.5);
		quest::spawn2(16044,0,0,10.4,-799.6,60.5,225.5);
		quest::spawn2(16044,0,0,-163.7,-858.4,59.1,134.9);
		quest::spawn2(16044,0,0,-48.2,-900.3,54.9,201.6);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(16045,0,0,-1.5,-847.9,61.5,205.9);
		quest::spawn2(16046,0,0,-141.5,-784.9,53.7,56.5);
		quest::spawn2(16046,0,0,10.4,-799.6,60.5,225.5);
		quest::spawn2(16046,0,0,-163.7,-858.4,59.1,134.9);
		quest::spawn2(16046,0,0,-48.2,-900.3,54.9,201.6);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(16047,0,0,-1.5,-847.9,61.5,205.9);
		quest::spawn2(16048,0,0,-141.5,-784.9,53.7,56.5);
		quest::spawn2(16048,0,0,10.4,-799.6,60.5,225.5);
		quest::spawn2(16048,0,0,-163.7,-858.4,59.1,134.9);
		quest::spawn2(16048,0,0,-48.2,-900.3,54.9,201.6);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(16049,0,0,-1.5,-847.9,61.5,205.9);
		quest::spawn2(16050,0,0,-141.5,-784.9,53.7,56.5);
		quest::spawn2(16050,0,0,10.4,-799.6,60.5,225.5);
		quest::spawn2(16050,0,0,-163.7,-858.4,59.1,134.9);
		quest::spawn2(16050,0,0,-48.2,-900.3,54.9,201.6);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(16051,0,0,-1.5,-847.9,61.5,205.9);
		quest::spawn2(16052,0,0,-141.5,-784.9,53.7,56.5);
		quest::spawn2(16052,0,0,10.4,-799.6,60.5,225.5);
		quest::spawn2(16052,0,0,-163.7,-858.4,59.1,134.9);
		quest::spawn2(16052,0,0,-48.2,-900.3,54.9,201.6);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(16053,0,0,-1.5,-847.9,61.5,205.9);
		quest::spawn2(16054,0,0,-141.5,-784.9,53.7,56.5);
		quest::spawn2(16054,0,0,10.4,-799.6,60.5,225.5);
		quest::spawn2(16054,0,0,-163.7,-858.4,59.1,134.9);
		quest::spawn2(16054,0,0,-48.2,-900.3,54.9,201.6);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(16055,0,0,-1.5,-847.9,61.5,205.9);
		quest::spawn2(16056,0,0,-141.5,-784.9,53.7,56.5);
		quest::spawn2(16056,0,0,10.4,-799.6,60.5,225.5);
		quest::spawn2(16056,0,0,-163.7,-858.4,59.1,134.9);
		quest::spawn2(16056,0,0,-48.2,-900.3,54.9,201.6);
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
