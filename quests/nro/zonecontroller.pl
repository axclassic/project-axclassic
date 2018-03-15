##zonecontroller.pl ID 34178 in nro##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 400, $x + 400, $y - 400, $y + 400);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(34179,0,0,-260,3480.9,-12.7,87);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(34158); 
		quest::depopall(34159);
		quest::depopall(34160);
		quest::depopall(34161);
		quest::depopall(34162);
		quest::depopall(34163);
		quest::depopall(34164);
		quest::depopall(34165);
		quest::depopall(34166);
		quest::depopall(34167);
		quest::depopall(34168);
		quest::depopall(34169);
		quest::depopall(34170);
		quest::depopall(34171);
		quest::depopall(34172);
		quest::depopall(34173);
		quest::depopall(34174);
		quest::depopall(34175);
		quest::depopall(34176);
		quest::depopall(34177);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(34158,0,0,-246,3472.9,-27.2,81.4);
		quest::spawn2(34159,0,0,-196.7,3422.5,-27.4,90.3);
		quest::spawn2(34159,0,0,-222.6,3449.7,-27.2,98.8);
		quest::spawn2(34159,0,0,-222.9,3474.2,-26.2,72.4);
		quest::spawn2(34159,0,0,-186,3474.6,-24.8,73.1);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(34160,0,0,-246,3472.9,-27.2,81.4);
		quest::spawn2(34161,0,0,-196.7,3422.5,-27.4,90.3);
		quest::spawn2(34161,0,0,-222.6,3449.7,-27.2,98.8);
		quest::spawn2(34161,0,0,-222.9,3474.2,-26.2,72.4);
		quest::spawn2(34161,0,0,-186,3474.6,-24.8,73.1);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(34162,0,0,-246,3472.9,-27.2,81.4);
		quest::spawn2(34163,0,0,-196.7,3422.5,-27.4,90.3);
		quest::spawn2(34163,0,0,-222.6,3449.7,-27.2,98.8);
		quest::spawn2(34163,0,0,-222.9,3474.2,-26.2,72.4);
		quest::spawn2(34163,0,0,-186,3474.6,-24.8,73.1);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(34164,0,0,-246,3472.9,-27.2,81.4);
		quest::spawn2(34165,0,0,-196.7,3422.5,-27.4,90.3);
		quest::spawn2(34165,0,0,-222.6,3449.7,-27.2,98.8);
		quest::spawn2(34165,0,0,-222.9,3474.2,-26.2,72.4);
		quest::spawn2(34165,0,0,-186,3474.6,-24.8,73.1);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(34166,0,0,-246,3472.9,-27.2,81.4);
		quest::spawn2(34167,0,0,-196.7,3422.5,-27.4,90.3);
		quest::spawn2(34167,0,0,-222.6,3449.7,-27.2,98.8);
		quest::spawn2(34167,0,0,-222.9,3474.2,-26.2,72.4);
		quest::spawn2(34167,0,0,-186,3474.6,-24.8,73.1);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(34168,0,0,-246,3472.9,-27.2,81.4);
		quest::spawn2(34169,0,0,-196.7,3422.5,-27.4,90.3);
		quest::spawn2(34169,0,0,-222.6,3449.7,-27.2,98.8);
		quest::spawn2(34169,0,0,-222.9,3474.2,-26.2,72.4);
		quest::spawn2(34169,0,0,-186,3474.6,-24.8,73.1);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(34170,0,0,-246,3472.9,-27.2,81.4);
		quest::spawn2(34171,0,0,-196.7,3422.5,-27.4,90.3);
		quest::spawn2(34171,0,0,-222.6,3449.7,-27.2,98.8);
		quest::spawn2(34171,0,0,-222.9,3474.2,-26.2,72.4);
		quest::spawn2(34171,0,0,-186,3474.6,-24.8,73.1);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(34172,0,0,-246,3472.9,-27.2,81.4);
		quest::spawn2(34173,0,0,-196.7,3422.5,-27.4,90.3);
		quest::spawn2(34173,0,0,-222.6,3449.7,-27.2,98.8);
		quest::spawn2(34173,0,0,-222.9,3474.2,-26.2,72.4);
		quest::spawn2(34173,0,0,-186,3474.6,-24.8,73.1);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(34174,0,0,-246,3472.9,-27.2,81.4);
		quest::spawn2(34175,0,0,-196.7,3422.5,-27.4,90.3);
		quest::spawn2(34175,0,0,-222.6,3449.7,-27.2,98.8);
		quest::spawn2(34175,0,0,-222.9,3474.2,-26.2,72.4);
		quest::spawn2(34175,0,0,-186,3474.6,-24.8,73.1);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(34176,0,0,-246,3472.9,-27.2,81.4);
		quest::spawn2(34177,0,0,-196.7,3422.5,-27.4,90.3);
		quest::spawn2(34177,0,0,-222.6,3449.7,-27.2,98.8);
		quest::spawn2(34177,0,0,-222.9,3474.2,-26.2,72.4);
		quest::spawn2(34177,0,0,-186,3474.6,-24.8,73.1);
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