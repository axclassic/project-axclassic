##zonecontroller.pl ID 85268 in Lake of Ill Omen##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(85269,0,0,-2895.3,1261.7,232.7,192.6);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
   
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(85248); 
		quest::depopall(85249);
		quest::depopall(85250);
		quest::depopall(85251);
		quest::depopall(85252);
		quest::depopall(85253);
		quest::depopall(85254);
		quest::depopall(85255);
		quest::depopall(85256);
		quest::depopall(85257);
		quest::depopall(85258);
		quest::depopall(85259);
		quest::depopall(85260);
		quest::depopall(85261);
		quest::depopall(85262);
		quest::depopall(85263);
		quest::depopall(85264);
		quest::depopall(85265);
		quest::depopall(85266);
		quest::depopall(85267);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(85248,0,0,-3004.8,1155.5,254.1,222.3);
		quest::spawn2(85249,0,0,-3013.5,1223.1,238.3,30.4);
		quest::spawn2(85249,0,0,-3042.8,1172.6,252.6,21.5);
		quest::spawn2(85249,0,0,-2949,1151.5,260.6,232.4);
		quest::spawn2(85249,0,0,-2959.3,1193.3,243.6,26.1);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(85250,0,0,-3004.8,1155.5,254.1,222.3);
		quest::spawn2(85251,0,0,-3013.5,1223.1,238.3,30.4);
		quest::spawn2(85251,0,0,-3042.8,1172.6,252.6,21.5);
		quest::spawn2(85251,0,0,-2949,1151.5,260.6,232.4);
		quest::spawn2(85251,0,0,-2959.3,1193.3,243.6,26.1);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(85252,0,0,-3004.8,1155.5,254.1,222.3);
		quest::spawn2(85253,0,0,-3013.5,1223.1,238.3,30.4);
		quest::spawn2(85253,0,0,-3042.8,1172.6,252.6,21.5);
		quest::spawn2(85253,0,0,-2949,1151.5,260.6,232.4);
		quest::spawn2(85253,0,0,-2959.3,1193.3,243.6,26.1);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(85254,0,0,-3004.8,1155.5,254.1,222.3);
		quest::spawn2(85255,0,0,-3013.5,1223.1,238.3,30.4);
		quest::spawn2(85255,0,0,-3042.8,1172.6,252.6,21.5);
		quest::spawn2(85255,0,0,-2949,1151.5,260.6,232.4);
		quest::spawn2(85255,0,0,-2959.3,1193.3,243.6,26.1);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(85256,0,0,-3004.8,1155.5,254.1,222.3);
		quest::spawn2(85257,0,0,-3013.5,1223.1,238.3,30.4);
		quest::spawn2(85257,0,0,-3042.8,1172.6,252.6,21.5);
		quest::spawn2(85257,0,0,-2949,1151.5,260.6,232.4);
		quest::spawn2(85257,0,0,-2959.3,1193.3,243.6,26.1);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(85258,0,0,-3004.8,1155.5,254.1,222.3);
		quest::spawn2(85259,0,0,-3013.5,1223.1,238.3,30.4);
		quest::spawn2(85259,0,0,-3042.8,1172.6,252.6,21.5);
		quest::spawn2(85259,0,0,-2949,1151.5,260.6,232.4);
		quest::spawn2(85259,0,0,-2959.3,1193.3,243.6,26.1);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(85260,0,0,-3004.8,1155.5,254.1,222.3);
		quest::spawn2(85261,0,0,-3013.5,1223.1,238.3,30.4);
		quest::spawn2(85261,0,0,-3042.8,1172.6,252.6,21.5);
		quest::spawn2(85261,0,0,-2949,1151.5,260.6,232.4);
		quest::spawn2(85261,0,0,-2959.3,1193.3,243.6,26.1);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(85262,0,0,-3004.8,1155.5,254.1,222.3);
		quest::spawn2(85263,0,0,-3013.5,1223.1,238.3,30.4);
		quest::spawn2(85263,0,0,-3042.8,1172.6,252.6,21.5);
		quest::spawn2(85263,0,0,-2949,1151.5,260.6,232.4);
		quest::spawn2(85263,0,0,-2959.3,1193.3,243.6,26.1);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(85264,0,0,-3004.8,1155.5,254.1,222.3);
		quest::spawn2(85265,0,0,-3013.5,1223.1,238.3,30.4);
		quest::spawn2(85265,0,0,-3042.8,1172.6,252.6,21.5);
		quest::spawn2(85265,0,0,-2949,1151.5,260.6,232.4);
		quest::spawn2(85265,0,0,-2959.3,1193.3,243.6,26.1);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(85266,0,0,-3004.8,1155.5,254.1,222.3);
		quest::spawn2(85267,0,0,-3013.5,1223.1,238.3,30.4);
		quest::spawn2(85267,0,0,-3042.8,1172.6,252.6,21.5);
		quest::spawn2(85267,0,0,-2949,1151.5,260.6,232.4);
		quest::spawn2(85267,0,0,-2959.3,1193.3,243.6,26.1);
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
