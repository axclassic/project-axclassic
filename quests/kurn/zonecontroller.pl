##zonecontroller.pl ID 97104 in Kurns Tower##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(97105,0,0,194.5,-91.9,1.9,89.4);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
   
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(97084); 
		quest::depopall(97085);
		quest::depopall(97086);
		quest::depopall(97087);
		quest::depopall(97088);
		quest::depopall(97089);
		quest::depopall(97090);
		quest::depopall(97091);
		quest::depopall(97092);
		quest::depopall(97093);
		quest::depopall(97094);
		quest::depopall(97095);
		quest::depopall(97096);
		quest::depopall(97097);
		quest::depopall(97098);
		quest::depopall(97099);
		quest::depopall(97100);
		quest::depopall(97101);
		quest::depopall(97102);
		quest::depopall(97103);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(97084,0,0,217.6,-116.3,1,189.4);
		quest::spawn2(97085,0,0,167.5,-107.1,1,188.5);
		quest::spawn2(97085,0,0,193.8,-105.7,1,185.5);
		quest::spawn2(97085,0,0,195.2,-137.1,1,199.5);
		quest::spawn2(97085,0,0,167,-137.1,1,198);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(97086,0,0,217.6,-116.3,1,189.4);
		quest::spawn2(97087,0,0,167.5,-107.1,1,188.5);
		quest::spawn2(97087,0,0,193.8,-105.7,1,185.5);
		quest::spawn2(97087,0,0,195.2,-137.1,1,199.5);
		quest::spawn2(97087,0,0,167,-137.1,1,198);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(97088,0,0,217.6,-116.3,1,189.4);
		quest::spawn2(97089,0,0,167.5,-107.1,1,188.5);
		quest::spawn2(97089,0,0,193.8,-105.7,1,185.5);
		quest::spawn2(97089,0,0,195.2,-137.1,1,199.5);
		quest::spawn2(97089,0,0,167,-137.1,1,198);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(97090,0,0,217.6,-116.3,1,189.4);
		quest::spawn2(97091,0,0,167.5,-107.1,1,188.5);
		quest::spawn2(97091,0,0,193.8,-105.7,1,185.5);
		quest::spawn2(97091,0,0,195.2,-137.1,1,199.5);
		quest::spawn2(97091,0,0,167,-137.1,1,198);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(97092,0,0,217.6,-116.3,1,189.4);
		quest::spawn2(97093,0,0,167.5,-107.1,1,188.5);
		quest::spawn2(97093,0,0,193.8,-105.7,1,185.5);
		quest::spawn2(97093,0,0,195.2,-137.1,1,199.5);
		quest::spawn2(97093,0,0,167,-137.1,1,198);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(97094,0,0,217.6,-116.3,1,189.4);
		quest::spawn2(97095,0,0,167.5,-107.1,1,188.5);
		quest::spawn2(97095,0,0,193.8,-105.7,1,185.5);
		quest::spawn2(97095,0,0,195.2,-137.1,1,199.5);
		quest::spawn2(97095,0,0,167,-137.1,1,198);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(97096,0,0,217.6,-116.3,1,189.4);
		quest::spawn2(97097,0,0,167.5,-107.1,1,188.5);
		quest::spawn2(97097,0,0,193.8,-105.7,1,185.5);
		quest::spawn2(97097,0,0,195.2,-137.1,1,199.5);
		quest::spawn2(97097,0,0,167,-137.1,1,198);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(97098,0,0,217.6,-116.3,1,189.4);
		quest::spawn2(97099,0,0,167.5,-107.1,1,188.5);
		quest::spawn2(97099,0,0,193.8,-105.7,1,185.5);
		quest::spawn2(97099,0,0,195.2,-137.1,1,199.5);
		quest::spawn2(97099,0,0,167,-137.1,1,198);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(97100,0,0,217.6,-116.3,1,189.4);
		quest::spawn2(97101,0,0,167.5,-107.1,1,188.5);
		quest::spawn2(97101,0,0,193.8,-105.7,1,185.5);
		quest::spawn2(97101,0,0,195.2,-137.1,1,199.5);
		quest::spawn2(97101,0,0,167,-137.1,1,198);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(97102,0,0,217.6,-116.3,1,189.4);
		quest::spawn2(97103,0,0,167.5,-107.1,1,188.5);
		quest::spawn2(97103,0,0,193.8,-105.7,1,185.5);
		quest::spawn2(97103,0,0,195.2,-137.1,1,199.5);
		quest::spawn2(97103,0,0,167,-137.1,1,198);
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
