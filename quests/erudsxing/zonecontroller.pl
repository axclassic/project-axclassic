##zonecontroller.pl ID 98080 in Eruds Crossing##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 300, $x + 300, $y - 300, $y + 300);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(98081,0,0,1136.5,-702.1,13.8,128.6);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
   
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(98060); 
		quest::depopall(98061);
		quest::depopall(98062);
		quest::depopall(98063);
		quest::depopall(98064);
		quest::depopall(98065);
		quest::depopall(98066);
		quest::depopall(98067);
		quest::depopall(98068);
		quest::depopall(98069);
		quest::depopall(98070);
		quest::depopall(98071);
		quest::depopall(98072);
		quest::depopall(98073);
		quest::depopall(98074);
		quest::depopall(98075);
		quest::depopall(98076);
		quest::depopall(98077);
		quest::depopall(98078);
		quest::depopall(98079);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(98060,0,0,1120.7,-752.3,17.4,0.4);
		quest::spawn2(98061,0,0,1148.8,-722.7,14.7,215.3);
		quest::spawn2(98061,0,0,1126.2,-697.5,11,1.8);
		quest::spawn2(98061,0,0,1081.8,-732.5,6.8,229.4);
		quest::spawn2(98061,0,0,1113.8,-791.8,21.7,208.5);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(98062,0,0,1120.7,-752.3,17.4,0.4);
		quest::spawn2(98063,0,0,1148.8,-722.7,14.7,215.3);
		quest::spawn2(98063,0,0,1126.2,-697.5,11,1.8);
		quest::spawn2(98063,0,0,1081.8,-732.5,6.8,229.4);
		quest::spawn2(98063,0,0,1113.8,-791.8,21.7,208.5);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(98064,0,0,1120.7,-752.3,17.4,0.4);
		quest::spawn2(98065,0,0,1148.8,-722.7,14.7,215.3);
		quest::spawn2(98065,0,0,1126.2,-697.5,11,1.8);
		quest::spawn2(98065,0,0,1081.8,-732.5,6.8,229.4);
		quest::spawn2(98065,0,0,1113.8,-791.8,21.7,208.5);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(98066,0,0,1120.7,-752.3,17.4,0.4);
		quest::spawn2(98067,0,0,1148.8,-722.7,14.7,215.3);
		quest::spawn2(98067,0,0,1126.2,-697.5,11,1.8);
		quest::spawn2(98067,0,0,1081.8,-732.5,6.8,229.4);
		quest::spawn2(98067,0,0,1113.8,-791.8,21.7,208.5);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(98068,0,0,1120.7,-752.3,17.4,0.4);
		quest::spawn2(98069,0,0,1148.8,-722.7,14.7,215.3);
		quest::spawn2(98069,0,0,1126.2,-697.5,11,1.8);
		quest::spawn2(98069,0,0,1081.8,-732.5,6.8,229.4);
		quest::spawn2(98069,0,0,1113.8,-791.8,21.7,208.5);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(98070,0,0,1120.7,-752.3,17.4,0.4);
		quest::spawn2(98071,0,0,1148.8,-722.7,14.7,215.3);
		quest::spawn2(98071,0,0,1126.2,-697.5,11,1.8);
		quest::spawn2(98071,0,0,1081.8,-732.5,6.8,229.4);
		quest::spawn2(98071,0,0,1113.8,-791.8,21.7,208.5);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(98072,0,0,1120.7,-752.3,17.4,0.4);
		quest::spawn2(98073,0,0,1148.8,-722.7,14.7,215.3);
		quest::spawn2(98073,0,0,1126.2,-697.5,11,1.8);
		quest::spawn2(98073,0,0,1081.8,-732.5,6.8,229.4);
		quest::spawn2(98073,0,0,1113.8,-791.8,21.7,208.5);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(98074,0,0,1120.7,-752.3,17.4,0.4);
		quest::spawn2(98075,0,0,1148.8,-722.7,14.7,215.3);
		quest::spawn2(98075,0,0,1126.2,-697.5,11,1.8);
		quest::spawn2(98075,0,0,1081.8,-732.5,6.8,229.4);
		quest::spawn2(98075,0,0,1113.8,-791.8,21.7,208.5);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(98076,0,0,1120.7,-752.3,17.4,0.4);
		quest::spawn2(98077,0,0,1148.8,-722.7,14.7,215.3);
		quest::spawn2(98077,0,0,1126.2,-697.5,11,1.8);
		quest::spawn2(98077,0,0,1081.8,-732.5,6.8,229.4);
		quest::spawn2(98077,0,0,1113.8,-791.8,21.7,208.5);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(98078,0,0,1120.7,-752.3,17.4,0.4);
		quest::spawn2(98079,0,0,1148.8,-722.7,14.7,215.3);
		quest::spawn2(98079,0,0,1126.2,-697.5,11,1.8);
		quest::spawn2(98079,0,0,1081.8,-732.5,6.8,229.4);
		quest::spawn2(98079,0,0,1113.8,-791.8,21.7,208.5);
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
