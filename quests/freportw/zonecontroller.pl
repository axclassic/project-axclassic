##zonecontroller.pl ID 9186 in West Freeport FreportW##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 300, $x + 300, $y - 300, $y + 300);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(9165,0,0,-66.5,59.1,-27,101.4); ##Peter Cottontail
	   quest::unique_spawn(9187,0,0,616.5,-486.7,-24.6,131.9); ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }

sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
        quest::depopall(9166); 
    	quest::depopall(9167);
	    quest::depopall(9168);
	    quest::depopall(9169);
	    quest::depopall(9170);
	    quest::depopall(9171);
	    quest::depopall(9172);
	    quest::depopall(9173);
	    quest::depopall(9174);
	    quest::depopall(9175);
	    quest::depopall(9176);
	    quest::depopall(9177);
	    quest::depopall(9178);
	    quest::depopall(9179);
	    quest::depopall(9180);
	    quest::depopall(9181);
	    quest::depopall(9182);
	    quest::depopall(9183);
	    quest::depopall(9184);
	    quest::depopall(9185);
   if($ulevel >= 1 && $ulevel <= 5) {
        quest::spawn2(9166,0,0,567.8,-576.5,-27,246.1);
		quest::spawn2(9167,0,0,526.6,-576.4,-27,254.5);
		quest::spawn2(9167,0,0,535.9,-538.1,-27,31);
		quest::spawn2(9167,0,0,580,-538.8,-27,232.9);
		quest::spawn2(9167,0,0,611.7,-575.1,-27,238.8);
      }
   elsif($ulevel >= 6 && $ulevel <= 10) {
        quest::spawn2(9168,0,0,567.8,-576.5,-27,246.1);
		quest::spawn2(9169,0,0,526.6,-576.4,-27,254.5);
		quest::spawn2(9169,0,0,535.9,-538.1,-27,31);
		quest::spawn2(9169,0,0,580,-538.8,-27,232.9);
		quest::spawn2(9169,0,0,611.7,-575.1,-27,238.8);
      }
   elsif($ulevel >= 11 && $ulevel <= 15) {
        quest::spawn2(9170,0,0,567.8,-576.5,-27,246.1);
		quest::spawn2(9171,0,0,526.6,-576.4,-27,254.5);
		quest::spawn2(9171,0,0,535.9,-538.1,-27,31);
		quest::spawn2(9171,0,0,580,-538.8,-27,232.9);
		quest::spawn2(9171,0,0,611.7,-575.1,-27,238.8);
      }
   elsif($ulevel >= 16 && $ulevel <= 20) {
        quest::spawn2(9172,0,0,567.8,-576.5,-27,246.1);
		quest::spawn2(9173,0,0,526.6,-576.4,-27,254.5);
		quest::spawn2(9173,0,0,535.9,-538.1,-27,31);
		quest::spawn2(9173,0,0,580,-538.8,-27,232.9);
		quest::spawn2(9173,0,0,611.7,-575.1,-27,238.8);
      }
   elsif($ulevel >= 21 && $ulevel <= 25) {
        quest::spawn2(9174,0,0,567.8,-576.5,-27,246.1);
		quest::spawn2(9175,0,0,526.6,-576.4,-27,254.5);
		quest::spawn2(9175,0,0,535.9,-538.1,-27,31);
		quest::spawn2(9175,0,0,580,-538.8,-27,232.9);
		quest::spawn2(9175,0,0,611.7,-575.1,-27,238.8);
      }
   elsif($ulevel >= 26 && $ulevel <= 30) {
        quest::spawn2(9176,0,0,567.8,-576.5,-27,246.1);
		quest::spawn2(9177,0,0,526.6,-576.4,-27,254.5);
		quest::spawn2(9177,0,0,535.9,-538.1,-27,31);
		quest::spawn2(9177,0,0,580,-538.8,-27,232.9);
		quest::spawn2(9177,0,0,611.7,-575.1,-27,238.8);
      }
   elsif($ulevel >= 31 && $ulevel <= 35) {
        quest::spawn2(9178,0,0,567.8,-576.5,-27,246.1);
	    quest::spawn2(9179,0,0,526.6,-576.4,-27,254.5);
	    quest::spawn2(9179,0,0,535.9,-538.1,-27,31);
	    quest::spawn2(9179,0,0,580,-538.8,-27,232.9);
	    quest::spawn2(9179,0,0,611.7,-575.1,-27,238.8);
      }
   elsif($ulevel >= 36 && $ulevel <= 40) {
        quest::spawn2(9180,0,0,567.8,-576.5,-27,246.1);
	    quest::spawn2(9181,0,0,526.6,-576.4,-27,254.5);
	    quest::spawn2(9181,0,0,535.9,-538.1,-27,31);
	    quest::spawn2(9181,0,0,580,-538.8,-27,232.9);
	    quest::spawn2(9181,0,0,611.7,-575.1,-27,238.8);
      }
   elsif($ulevel >= 41 && $ulevel <= 45) {
        quest::spawn2(9182,0,0,567.8,-576.5,-27,246.1);
	    quest::spawn2(9183,0,0,526.6,-576.4,-27,254.5);
	    quest::spawn2(9183,0,0,535.9,-538.1,-27,31);
	    quest::spawn2(9183,0,0,580,-538.8,-27,232.9);
	    quest::spawn2(9183,0,0,611.7,-575.1,-27,238.8);
      }
   elsif($ulevel >= 46 && $ulevel <= 49) {
        quest::spawn2(9184,0,0,567.8,-576.5,-27,246.1);
	    quest::spawn2(9185,0,0,526.6,-576.4,-27,254.5);
	    quest::spawn2(9185,0,0,535.9,-538.1,-27,31);
	    quest::spawn2(9185,0,0,580,-538.8,-27,232.9);
	    quest::spawn2(9185,0,0,611.7,-575.1,-27,238.8);
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
