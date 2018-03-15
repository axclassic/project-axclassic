##zonecontroller.pl ID 10233 in East Freeport freporte##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 300, $x + 300, $y - 300, $y + 300);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(10212,0,0,-638.7,-244.1,-55,208.8); ##Peter Cottontail
	   quest::unique_spawn(10234,0,0,-121.1,-892.3,-51.6,176.5); ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }

sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
        quest::depopall(10213); 
		quest::depopall(10214);
		quest::depopall(10215);
		quest::depopall(10216);
		quest::depopall(10217);
		quest::depopall(10218);
		quest::depopall(10219);
		quest::depopall(10220);
		quest::depopall(10221);
		quest::depopall(10222);
		quest::depopall(10223);
		quest::depopall(10224);
		quest::depopall(10225);
		quest::depopall(10226);
		quest::depopall(10227);
		quest::depopall(10228);
		quest::depopall(10229);
		quest::depopall(10230);
		quest::depopall(10231);
		quest::depopall(10232);
   if($ulevel >= 1 && $ulevel <= 5) {
        quest::spawn2(10213,0,0,-122.5,-915.8,-55,191);
		quest::spawn2(10214,0,0,-120.8,-943.1,-55,201.3);
		quest::spawn2(10214,0,0,-150.2,-923.9,-55,199.4);
		quest::spawn2(10214,0,0,-147.8,-892.1,-55,190.5);
		quest::spawn2(10214,0,0,-123.8,-870.5,-55,180.5);
      }
   elsif($ulevel >= 6 && $ulevel <= 10) {
        quest::spawn2(10215,0,0,-122.5,-915.8,-55,191);
		quest::spawn2(10216,0,0,-120.8,-943.1,-55,201.3);
		quest::spawn2(10216,0,0,-150.2,-923.9,-55,199.4);
		quest::spawn2(10216,0,0,-147.8,-892.1,-55,190.5);
		quest::spawn2(10216,0,0,-123.8,-870.5,-55,180.5);
      }
   elsif($ulevel >= 11 && $ulevel <= 15) {
        quest::spawn2(10217,0,0,-122.5,-915.8,-55,191);
		quest::spawn2(10218,0,0,-120.8,-943.1,-55,201.3);
		quest::spawn2(10218,0,0,-150.2,-923.9,-55,199.4);
		quest::spawn2(10218,0,0,-147.8,-892.1,-55,190.5);
		quest::spawn2(10218,0,0,-123.8,-870.5,-55,180.5);
      }
   elsif($ulevel >= 16 && $ulevel <= 20) {
        quest::spawn2(10219,0,0,-122.5,-915.8,-55,191);
		quest::spawn2(10220,0,0,-120.8,-943.1,-55,201.3);
		quest::spawn2(10220,0,0,-150.2,-923.9,-55,199.4);
		quest::spawn2(10220,0,0,-147.8,-892.1,-55,190.5);
		quest::spawn2(10220,0,0,-123.8,-870.5,-55,180.5);
      }
   elsif($ulevel >= 21 && $ulevel <= 25) {
        quest::spawn2(10221,0,0,-122.5,-915.8,-55,191);
		quest::spawn2(10222,0,0,-120.8,-943.1,-55,201.3);
		quest::spawn2(10222,0,0,-150.2,-923.9,-55,199.4);
		quest::spawn2(10222,0,0,-147.8,-892.1,-55,190.5);
		quest::spawn2(10222,0,0,-123.8,-870.5,-55,180.5);
      }
   elsif($ulevel >= 26 && $ulevel <= 30) {
        quest::spawn2(10223,0,0,-122.5,-915.8,-55,191);
		quest::spawn2(10224,0,0,-120.8,-943.1,-55,201.3);
		quest::spawn2(10224,0,0,-150.2,-923.9,-55,199.4);
		quest::spawn2(10224,0,0,-147.8,-892.1,-55,190.5);
		quest::spawn2(10224,0,0,-123.8,-870.5,-55,180.5);
      }
   elsif($ulevel >= 31 && $ulevel <= 35) {
        quest::spawn2(10225,0,0,-122.5,-915.8,-55,191);
		quest::spawn2(10226,0,0,-120.8,-943.1,-55,201.3);
		quest::spawn2(10226,0,0,-150.2,-923.9,-55,199.4);
		quest::spawn2(10226,0,0,-147.8,-892.1,-55,190.5);
		quest::spawn2(10226,0,0,-123.8,-870.5,-55,180.5);
      }
   elsif($ulevel >= 36 && $ulevel <= 40) {
        quest::spawn2(10227,0,0,-122.5,-915.8,-55,191);
		quest::spawn2(10228,0,0,-120.8,-943.1,-55,201.3);
		quest::spawn2(10228,0,0,-150.2,-923.9,-55,199.4);
		quest::spawn2(10228,0,0,-147.8,-892.1,-55,190.5);
		quest::spawn2(10228,0,0,-123.8,-870.5,-55,180.5);
      }
   elsif($ulevel >= 41 && $ulevel <= 45) {
        quest::spawn2(10229,0,0,-122.5,-915.8,-55,191);
		quest::spawn2(10230,0,0,-120.8,-943.1,-55,201.3);
		quest::spawn2(10230,0,0,-150.2,-923.9,-55,199.4);
		quest::spawn2(10230,0,0,-147.8,-892.1,-55,190.5);
		quest::spawn2(10230,0,0,-123.8,-870.5,-55,180.5);
      }
   elsif($ulevel >= 46 && $ulevel <= 49) {
        quest::spawn2(10231,0,0,-122.5,-915.8,-55,191);
		quest::spawn2(10232,0,0,-120.8,-943.1,-55,201.3);
		quest::spawn2(10232,0,0,-150.2,-923.9,-55,199.4);
		quest::spawn2(10232,0,0,-147.8,-892.1,-55,190.5);
		quest::spawn2(10232,0,0,-123.8,-870.5,-55,180.5);
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
