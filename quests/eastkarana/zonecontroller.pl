##zonecontroller.pl ID 15218 in East Karana##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 250, $x + 250, $y - 250, $y + 250);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(15219,0,0,968.9,-247.6,-74.9,198.5);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
   
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(15198); 
		quest::depopall(15199);
		quest::depopall(15200);
		quest::depopall(15201);
		quest::depopall(15202);
		quest::depopall(15203);
		quest::depopall(15204);
		quest::depopall(15205);
		quest::depopall(15206);
		quest::depopall(15207);
		quest::depopall(15208);
		quest::depopall(15209);
		quest::depopall(15210);
		quest::depopall(15211);
		quest::depopall(15212);
		quest::depopall(15213);
		quest::depopall(15214);
		quest::depopall(15215);
		quest::depopall(15216);
		quest::depopall(15217);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(15198,0,0,939.5,-237.6,-71.1,180.1);
		quest::spawn2(15199,0,0,883.7,-257.6,-59.7,228.9);
		quest::spawn2(15199,0,0,915.3,-227,-70.3,211.8);
		quest::spawn2(15199,0,0,967.7,-188.2,-71.5,172.8);
		quest::spawn2(15199,0,0,965.5,-147.6,-65.5,167.4);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(15200,0,0,939.5,-237.6,-71.1,180.1);
		quest::spawn2(15201,0,0,883.7,-257.6,-59.7,228.9);
		quest::spawn2(15201,0,0,915.3,-227,-70.3,211.8);
		quest::spawn2(15201,0,0,967.7,-188.2,-71.5,172.8);
		quest::spawn2(15201,0,0,965.5,-147.6,-65.5,167.4);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(15202,0,0,939.5,-237.6,-71.1,180.1);
		quest::spawn2(15203,0,0,883.7,-257.6,-59.7,228.9);
		quest::spawn2(15203,0,0,915.3,-227,-70.3,211.8);
		quest::spawn2(15203,0,0,967.7,-188.2,-71.5,172.8);
		quest::spawn2(15203,0,0,965.5,-147.6,-65.5,167.4);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(15204,0,0,939.5,-237.6,-71.1,180.1);
		quest::spawn2(15205,0,0,883.7,-257.6,-59.7,228.9);
		quest::spawn2(15205,0,0,915.3,-227,-70.3,211.8);
		quest::spawn2(15205,0,0,967.7,-188.2,-71.5,172.8);
		quest::spawn2(15205,0,0,965.5,-147.6,-65.5,167.4);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(15206,0,0,939.5,-237.6,-71.1,180.1);
		quest::spawn2(15207,0,0,883.7,-257.6,-59.7,228.9);
		quest::spawn2(15207,0,0,915.3,-227,-70.3,211.8);
		quest::spawn2(15207,0,0,967.7,-188.2,-71.5,172.8);
		quest::spawn2(15207,0,0,965.5,-147.6,-65.5,167.4);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(15208,0,0,939.5,-237.6,-71.1,180.1);
		quest::spawn2(15209,0,0,883.7,-257.6,-59.7,228.9);
		quest::spawn2(15209,0,0,915.3,-227,-70.3,211.8);
		quest::spawn2(15209,0,0,967.7,-188.2,-71.5,172.8);
		quest::spawn2(15209,0,0,965.5,-147.6,-65.5,167.4);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(15210,0,0,939.5,-237.6,-71.1,180.1);
		quest::spawn2(15211,0,0,883.7,-257.6,-59.7,228.9);
		quest::spawn2(15211,0,0,915.3,-227,-70.3,211.8);
		quest::spawn2(15211,0,0,967.7,-188.2,-71.5,172.8);
		quest::spawn2(15211,0,0,965.5,-147.6,-65.5,167.4);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(15212,0,0,939.5,-237.6,-71.1,180.1);
		quest::spawn2(15213,0,0,883.7,-257.6,-59.7,228.9);
		quest::spawn2(15213,0,0,915.3,-227,-70.3,211.8);
		quest::spawn2(15213,0,0,967.7,-188.2,-71.5,172.8);
		quest::spawn2(15213,0,0,965.5,-147.6,-65.5,167.4);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(15214,0,0,939.5,-237.6,-71.1,180.1);
		quest::spawn2(15215,0,0,883.7,-257.6,-59.7,228.9);
		quest::spawn2(15215,0,0,915.3,-227,-70.3,211.8);
		quest::spawn2(15215,0,0,967.7,-188.2,-71.5,172.8);
		quest::spawn2(15215,0,0,965.5,-147.6,-65.5,167.4);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(15216,0,0,939.5,-237.6,-71.1,180.1);
		quest::spawn2(15217,0,0,883.7,-257.6,-59.7,228.9);
		quest::spawn2(15217,0,0,915.3,-227,-70.3,211.8);
		quest::spawn2(15217,0,0,967.7,-188.2,-71.5,172.8);
		quest::spawn2(15217,0,0,965.5,-147.6,-65.5,167.4);
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
