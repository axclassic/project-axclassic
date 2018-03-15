##zonecontroller.pl ID 59185 in Mistmoore##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 300, $x + 300, $y - 300, $y + 300);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(59186,0,0,310.1,-291.5,-231.4,112.3);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(59165); 
		quest::depopall(59166);
		quest::depopall(59167);
		quest::depopall(59168);
		quest::depopall(59169);
		quest::depopall(59170);
		quest::depopall(59171);
		quest::depopall(59172);
		quest::depopall(59173);
		quest::depopall(59174);
		quest::depopall(59175);
		quest::depopall(59176);
		quest::depopall(59177);
		quest::depopall(59178);
		quest::depopall(59179);
		quest::depopall(59180);
		quest::depopall(59181);
		quest::depopall(59182);
		quest::depopall(59183);
		quest::depopall(59184);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(59165,0,0,349.8,-370.5,-236.9,8.1);
		quest::spawn2(59166,0,0,311.6,-349,-236.9,14.1);
		quest::spawn2(59166,0,0,333.7,-360.8,-236.9,31.1);
		quest::spawn2(59166,0,0,371.6,-367.2,-236.9,228.3);
		quest::spawn2(59166,0,0,389,-354.5,-236.9,223.8);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(59167,0,0,349.8,-370.5,-236.9,8.1);
		quest::spawn2(59168,0,0,311.6,-349,-236.9,14.1);
		quest::spawn2(59168,0,0,333.7,-360.8,-236.9,31.1);
		quest::spawn2(59168,0,0,371.6,-367.2,-236.9,228.3);
		quest::spawn2(59168,0,0,389,-354.5,-236.9,223.8);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(59169,0,0,349.8,-370.5,-236.9,8.1);
		quest::spawn2(59170,0,0,311.6,-349,-236.9,14.1);
		quest::spawn2(59170,0,0,333.7,-360.8,-236.9,31.1);
		quest::spawn2(59170,0,0,371.6,-367.2,-236.9,228.3);
		quest::spawn2(59170,0,0,389,-354.5,-236.9,223.8);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(59171,0,0,349.8,-370.5,-236.9,8.1);
		quest::spawn2(59172,0,0,311.6,-349,-236.9,14.1);
		quest::spawn2(59172,0,0,333.7,-360.8,-236.9,31.1);
		quest::spawn2(59172,0,0,371.6,-367.2,-236.9,228.3);
		quest::spawn2(59172,0,0,389,-354.5,-236.9,223.8);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(59173,0,0,349.8,-370.5,-236.9,8.1);
		quest::spawn2(59174,0,0,311.6,-349,-236.9,14.1);
		quest::spawn2(59174,0,0,333.7,-360.8,-236.9,31.1);
		quest::spawn2(59174,0,0,371.6,-367.2,-236.9,228.3);
		quest::spawn2(59174,0,0,389,-354.5,-236.9,223.8);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(59175,0,0,349.8,-370.5,-236.9,8.1);
		quest::spawn2(59176,0,0,311.6,-349,-236.9,14.1);
		quest::spawn2(59176,0,0,333.7,-360.8,-236.9,31.1);
		quest::spawn2(59176,0,0,371.6,-367.2,-236.9,228.3);
		quest::spawn2(59176,0,0,389,-354.5,-236.9,223.8);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(59177,0,0,349.8,-370.5,-236.9,8.1);
		quest::spawn2(59178,0,0,311.6,-349,-236.9,14.1);
		quest::spawn2(59178,0,0,333.7,-360.8,-236.9,31.1);
		quest::spawn2(59178,0,0,371.6,-367.2,-236.9,228.3);
		quest::spawn2(59178,0,0,389,-354.5,-236.9,223.8);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(59179,0,0,349.8,-370.5,-236.9,8.1);
		quest::spawn2(59180,0,0,311.6,-349,-236.9,14.1);
		quest::spawn2(59180,0,0,333.7,-360.8,-236.9,31.1);
		quest::spawn2(59180,0,0,371.6,-367.2,-236.9,228.3);
		quest::spawn2(59180,0,0,389,-354.5,-236.9,223.8);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(59181,0,0,349.8,-370.5,-236.9,8.1);
		quest::spawn2(59182,0,0,311.6,-349,-236.9,14.1);
		quest::spawn2(59182,0,0,333.7,-360.8,-236.9,31.1);
		quest::spawn2(59182,0,0,371.6,-367.2,-236.9,228.3);
		quest::spawn2(59182,0,0,389,-354.5,-236.9,223.8);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(59183,0,0,349.8,-370.5,-236.9,8.1);
		quest::spawn2(59184,0,0,311.6,-349,-236.9,14.1);
		quest::spawn2(59184,0,0,333.7,-360.8,-236.9,31.1);
		quest::spawn2(59184,0,0,371.6,-367.2,-236.9,228.3);
		quest::spawn2(59184,0,0,389,-354.5,-236.9,223.8);
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