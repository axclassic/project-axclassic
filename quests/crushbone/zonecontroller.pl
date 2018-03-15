##zonecontroller.pl ID 58081 in Crushbone##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(58082,0,0,469.8,-43.1,-16.6,62.8);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
   
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(58061); 
		quest::depopall(58062);
		quest::depopall(58063);
		quest::depopall(58064);
		quest::depopall(58065);
		quest::depopall(58066);
		quest::depopall(58067);
		quest::depopall(58068);
		quest::depopall(58069);
		quest::depopall(58070);
		quest::depopall(58071);
		quest::depopall(58072);
		quest::depopall(58073);
		quest::depopall(58074);
		quest::depopall(58075);
		quest::depopall(58076);
		quest::depopall(58077);
		quest::depopall(58078);
		quest::depopall(58079);
		quest::depopall(58080);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(58061,0,0,514.2,-50.2,-18,77.1);
		quest::spawn2(58062,0,0,586.1,-41.1,-29,97.8);
		quest::spawn2(58062,0,0,533.6,-39.4,-22.7,67.9);
		quest::spawn2(58062,0,0,533.2,-74.4,-24.4,85.3);
		quest::spawn2(58062,0,0,565.1,-87,-28.2,7.9);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(58063,0,0,514.2,-50.2,-18,77.1);
		quest::spawn2(58064,0,0,586.1,-41.1,-29,97.8);
		quest::spawn2(58064,0,0,533.6,-39.4,-22.7,67.9);
		quest::spawn2(58064,0,0,533.2,-74.4,-24.4,85.3);
		quest::spawn2(58064,0,0,565.1,-87,-28.2,7.9);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(58065,0,0,514.2,-50.2,-18,77.1);
		quest::spawn2(58066,0,0,586.1,-41.1,-29,97.8);
		quest::spawn2(58066,0,0,533.6,-39.4,-22.7,67.9);
		quest::spawn2(58066,0,0,533.2,-74.4,-24.4,85.3);
		quest::spawn2(58066,0,0,565.1,-87,-28.2,7.9);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(58067,0,0,514.2,-50.2,-18,77.1);
		quest::spawn2(58068,0,0,586.1,-41.1,-29,97.8);
		quest::spawn2(58068,0,0,533.6,-39.4,-22.7,67.9);
		quest::spawn2(58068,0,0,533.2,-74.4,-24.4,85.3);
		quest::spawn2(58068,0,0,565.1,-87,-28.2,7.9);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(58069,0,0,514.2,-50.2,-18,77.1);
		quest::spawn2(58070,0,0,586.1,-41.1,-29,97.8);
		quest::spawn2(58070,0,0,533.6,-39.4,-22.7,67.9);
		quest::spawn2(58070,0,0,533.2,-74.4,-24.4,85.3);
		quest::spawn2(58070,0,0,565.1,-87,-28.2,7.9);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(58071,0,0,514.2,-50.2,-18,77.1);
		quest::spawn2(58072,0,0,586.1,-41.1,-29,97.8);
		quest::spawn2(58072,0,0,533.6,-39.4,-22.7,67.9);
		quest::spawn2(58072,0,0,533.2,-74.4,-24.4,85.3);
		quest::spawn2(58072,0,0,565.1,-87,-28.2,7.9);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(58073,0,0,514.2,-50.2,-18,77.1);
		quest::spawn2(58074,0,0,586.1,-41.1,-29,97.8);
		quest::spawn2(58074,0,0,533.6,-39.4,-22.7,67.9);
		quest::spawn2(58074,0,0,533.2,-74.4,-24.4,85.3);
		quest::spawn2(58074,0,0,565.1,-87,-28.2,7.9);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(58075,0,0,514.2,-50.2,-18,77.1);
		quest::spawn2(58076,0,0,586.1,-41.1,-29,97.8);
		quest::spawn2(58076,0,0,533.6,-39.4,-22.7,67.9);
		quest::spawn2(58076,0,0,533.2,-74.4,-24.4,85.3);
		quest::spawn2(58076,0,0,565.1,-87,-28.2,7.9);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(58077,0,0,514.2,-50.2,-18,77.1);
		quest::spawn2(58078,0,0,586.1,-41.1,-29,97.8);
		quest::spawn2(58078,0,0,533.6,-39.4,-22.7,67.9);
		quest::spawn2(58078,0,0,533.2,-74.4,-24.4,85.3);
		quest::spawn2(58078,0,0,565.1,-87,-28.2,7.9);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(58079,0,0,514.2,-50.2,-18,77.1);
		quest::spawn2(58080,0,0,586.1,-41.1,-29,97.8);
		quest::spawn2(58080,0,0,533.6,-39.4,-22.7,67.9);
		quest::spawn2(58080,0,0,533.2,-74.4,-24.4,85.3);
		quest::spawn2(58080,0,0,565.1,-87,-28.2,7.9);
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
