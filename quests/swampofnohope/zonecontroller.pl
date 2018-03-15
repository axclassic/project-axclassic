##zonecontroller.pl ID 83382 in Swamp of No Hope##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
	quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
	if((defined $event8) && ($event8 == 1)) {
	    quest::unique_spawn(83361,0,0,-1943,-1145.6,25,171.8); ##Peter Cottontail
		quest::unique_spawn(83383,0,0,685.9,4452.6,96.3,126);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
	}
	}

sub EVENT_ENTER {
if((defined $event8) && ($event8 == 1)) {
    if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
        quest::depopall(83362); 
		quest::depopall(83363);
		quest::depopall(83364);
		quest::depopall(83365);
		quest::depopall(83366);
		quest::depopall(83367);
		quest::depopall(83368);
		quest::depopall(83369);
		quest::depopall(83370);
		quest::depopall(83371);
		quest::depopall(83372);
		quest::depopall(83373);
		quest::depopall(83374);
		quest::depopall(83375);
		quest::depopall(83376);
		quest::depopall(83377);
		quest::depopall(83378);
		quest::depopall(83379);
		quest::depopall(83380);
		quest::depopall(83381);
    if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(83362,0,0,655.1,4393.9,80.2,89.1);
		quest::spawn2(83363,0,0,709.7,4402.3,78.6,64);
		quest::spawn2(83363,0,0,678.9,4412.3,84.9,89.3);
		quest::spawn2(83363,0,0,617.9,4361.3,74.6,73.1);
		quest::spawn2(83363,0,0,656.7,4347.8,72.3,77.3);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	    quest::spawn2(83364,0,0,655.1,4393.9,80.2,89.1);
		quest::spawn2(83365,0,0,709.7,4402.3,78.6,64);
		quest::spawn2(83365,0,0,678.9,4412.3,84.9,89.3);
		quest::spawn2(83365,0,0,617.9,4361.3,74.6,73.1);
		quest::spawn2(83365,0,0,656.7,4347.8,72.3,77.3);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	    quest::spawn2(83366,0,0,655.1,4393.9,80.2,89.1);
		quest::spawn2(83367,0,0,709.7,4402.3,78.6,64);
		quest::spawn2(83367,0,0,678.9,4412.3,84.9,89.3);
		quest::spawn2(83367,0,0,617.9,4361.3,74.6,73.1);
		quest::spawn2(83367,0,0,656.7,4347.8,72.3,77.3);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(83368,0,0,655.1,4393.9,80.2,89.1);
		quest::spawn2(83369,0,0,709.7,4402.3,78.6,64);
		quest::spawn2(83369,0,0,678.9,4412.3,84.9,89.3);
		quest::spawn2(83369,0,0,617.9,4361.3,74.6,73.1);
		quest::spawn2(83369,0,0,656.7,4347.8,72.3,77.3);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(83370,0,0,655.1,4393.9,80.2,89.1);
		quest::spawn2(83371,0,0,709.7,4402.3,78.6,64);
		quest::spawn2(83371,0,0,678.9,4412.3,84.9,89.3);
		quest::spawn2(83371,0,0,617.9,4361.3,74.6,73.1);
		quest::spawn2(83371,0,0,656.7,4347.8,72.3,77.3);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(83372,0,0,655.1,4393.9,80.2,89.1);
		quest::spawn2(83373,0,0,709.7,4402.3,78.6,64);
		quest::spawn2(83373,0,0,678.9,4412.3,84.9,89.3);
		quest::spawn2(83373,0,0,617.9,4361.3,74.6,73.1);
		quest::spawn2(83373,0,0,656.7,4347.8,72.3,77.3);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(83374,0,0,655.1,4393.9,80.2,89.1);
		quest::spawn2(83375,0,0,709.7,4402.3,78.6,64);
		quest::spawn2(83375,0,0,678.9,4412.3,84.9,89.3);
		quest::spawn2(83375,0,0,617.9,4361.3,74.6,73.1);
		quest::spawn2(83375,0,0,656.7,4347.8,72.3,77.3);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(83376,0,0,655.1,4393.9,80.2,89.1);
		quest::spawn2(83377,0,0,709.7,4402.3,78.6,64);
		quest::spawn2(83377,0,0,678.9,4412.3,84.9,89.3);
		quest::spawn2(83377,0,0,617.9,4361.3,74.6,73.1);
		quest::spawn2(83377,0,0,656.7,4347.8,72.3,77.3);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(83378,0,0,655.1,4393.9,80.2,89.1);
		quest::spawn2(83379,0,0,709.7,4402.3,78.6,64);
		quest::spawn2(83379,0,0,678.9,4412.3,84.9,89.3);
		quest::spawn2(83379,0,0,617.9,4361.3,74.6,73.1);
		quest::spawn2(83379,0,0,656.7,4347.8,72.3,77.3);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(83380,0,0,655.1,4393.9,80.2,89.1);
		quest::spawn2(83381,0,0,709.7,4402.3,78.6,64);
		quest::spawn2(83381,0,0,678.9,4412.3,84.9,89.3);
		quest::spawn2(83381,0,0,617.9,4361.3,74.6,73.1);
		quest::spawn2(83381,0,0,656.7,4347.8,72.3,77.3);
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