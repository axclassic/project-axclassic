##zonecontroller.pl ID 79141 in Warsliks Woods##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(79142,0,0,2903.6,-1868.1,113,170);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }

sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if($ulevel <= 49) {
	    #Do nothing;
		}

	if($ulevel >= 50 && !defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(79135); 
		quest::depopall(79136);
		quest::depopall(79137);
		quest::depopall(79138);
		quest::depopall(79139);
		quest::depopall(79140);
	if($ulevel >= 50 && $ulevel <= 55) {
		quest::spawn2(79135,0,0,2882.8,-1878.1,100.7,196.9);
		quest::spawn2(79136,0,0,2882.3,-1933.1,102,199.5);
		quest::spawn2(79136,0,0,2839,-1909.5,82.7,188.9);
		quest::spawn2(79136,0,0,2883.3,-1836.9,109.8,193.1);
		quest::spawn2(79136,0,0,2842.4,-1841.5,90.7,178.5);
		}
	elsif($ulevel >= 56 && $ulevel <= 60) {
		quest::spawn2(79137,0,0,2882.8,-1878.1,100.7,196.9);
		quest::spawn2(79138,0,0,2882.3,-1933.1,102,199.5);
		quest::spawn2(79138,0,0,2839,-1909.5,82.7,188.9);
		quest::spawn2(79138,0,0,2883.3,-1836.9,109.8,193.1);
		quest::spawn2(79138,0,0,2842.4,-1841.5,90.7,178.5);
		}
	elsif($ulevel >= 56 && $ulevel <= 65) {
		quest::spawn2(79139,0,0,2882.8,-1878.1,100.7,196.9);
		quest::spawn2(79140,0,0,2882.3,-1933.1,102,199.5);
		quest::spawn2(79140,0,0,2839,-1909.5,82.7,188.9);
		quest::spawn2(79140,0,0,2883.3,-1836.9,109.8,193.1);
		quest::spawn2(79140,0,0,2842.4,-1841.5,90.7,178.5);
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



