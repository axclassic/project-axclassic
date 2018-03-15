##zonecontroller.pl ID 57166 in Lfaydark##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
    if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(57167,0,0,-378.2,-943.9,8.3,42);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }

sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
        quest::depopall(57146); 
		quest::depopall(57147);
		quest::depopall(57148);
		quest::depopall(57149);
		quest::depopall(57150);
		quest::depopall(57151);
		quest::depopall(57152);
		quest::depopall(57153);
		quest::depopall(57154);
		quest::depopall(57155);
		quest::depopall(57156);
		quest::depopall(57157);
		quest::depopall(57158);
		quest::depopall(57159);
		quest::depopall(57160);
		quest::depopall(57161);
		quest::depopall(57162);
		quest::depopall(57163);
		quest::depopall(57164);
		quest::depopall(57165);
   if($ulevel >= 1 && $ulevel <= 5) {
        quest::spawn2(57146,0,0,-365.5,-938.3,-4,40);
		quest::spawn2(57147,0,0,-365.7,-916.9,-4,35.1);
		quest::spawn2(57147,0,0,-366.4,-893.6,-4,13.5);
		quest::spawn2(57147,0,0,-341,-941.5,-4,45);
		quest::spawn2(57147,0,0,-308.9,-941.4,-4,28);
      }
   elsif($ulevel >= 6 && $ulevel <= 10) {
        quest::spawn2(57148,0,0,-365.5,-938.3,-4,40);
		quest::spawn2(57149,0,0,-365.7,-916.9,-4,35.1);
		quest::spawn2(57149,0,0,-366.4,-893.6,-4,13.5);
		quest::spawn2(57149,0,0,-341,-941.5,-4,45);
		quest::spawn2(57149,0,0,-308.9,-941.4,-4,28);
      }
   elsif($ulevel >= 11 && $ulevel <= 15) {
        quest::spawn2(57150,0,0,-365.5,-938.3,-4,40);
		quest::spawn2(57151,0,0,-365.7,-916.9,-4,35.1);
		quest::spawn2(57151,0,0,-366.4,-893.6,-4,13.5);
		quest::spawn2(57151,0,0,-341,-941.5,-4,45);
		quest::spawn2(57151,0,0,-308.9,-941.4,-4,28);
      }
   elsif($ulevel >= 16 && $ulevel <= 20) {
        quest::spawn2(57152,0,0,-365.5,-938.3,-4,40);
		quest::spawn2(57153,0,0,-365.7,-916.9,-4,35.1);
		quest::spawn2(57153,0,0,-366.4,-893.6,-4,13.5);
		quest::spawn2(57153,0,0,-341,-941.5,-4,45);
		quest::spawn2(57153,0,0,-308.9,-941.4,-4,28);
      }
   elsif($ulevel >= 21 && $ulevel <= 25) {
        quest::spawn2(57154,0,0,-365.5,-938.3,-4,40);
		quest::spawn2(57155,0,0,-365.7,-916.9,-4,35.1);
		quest::spawn2(57155,0,0,-366.4,-893.6,-4,13.5);
		quest::spawn2(57155,0,0,-341,-941.5,-4,45);
		quest::spawn2(57155,0,0,-308.9,-941.4,-4,28);
      }
   elsif($ulevel >= 26 && $ulevel <= 30) {
        quest::spawn2(57156,0,0,-365.5,-938.3,-4,40);
		quest::spawn2(57157,0,0,-365.7,-916.9,-4,35.1);
		quest::spawn2(57157,0,0,-366.4,-893.6,-4,13.5);
		quest::spawn2(57157,0,0,-341,-941.5,-4,45);
		quest::spawn2(57157,0,0,-308.9,-941.4,-4,28);
      }
   elsif($ulevel >= 31 && $ulevel <= 35) {
        quest::spawn2(57158,0,0,-365.5,-938.3,-4,40);
		quest::spawn2(57159,0,0,-365.7,-916.9,-4,35.1);
		quest::spawn2(57159,0,0,-366.4,-893.6,-4,13.5);
		quest::spawn2(57159,0,0,-341,-941.5,-4,45);
		quest::spawn2(57159,0,0,-308.9,-941.4,-4,28);
      }
   elsif($ulevel >= 36 && $ulevel <= 40) {
        quest::spawn2(57160,0,0,-365.5,-938.3,-4,40);
		quest::spawn2(57161,0,0,-365.7,-916.9,-4,35.1);
		quest::spawn2(57161,0,0,-366.4,-893.6,-4,13.5);
		quest::spawn2(57161,0,0,-341,-941.5,-4,45);
		quest::spawn2(57161,0,0,-308.9,-941.4,-4,28);
      }
   elsif($ulevel >= 41 && $ulevel <= 45) {
        quest::spawn2(57162,0,0,-365.5,-938.3,-4,40);
		quest::spawn2(57163,0,0,-365.7,-916.9,-4,35.1);
		quest::spawn2(57163,0,0,-366.4,-893.6,-4,13.5);
		quest::spawn2(57163,0,0,-341,-941.5,-4,45);
		quest::spawn2(57163,0,0,-308.9,-941.4,-4,28);
      }
   elsif($ulevel >= 46 && $ulevel <= 49) {
        quest::spawn2(57164,0,0,-365.5,-938.3,-4,40);
		quest::spawn2(57165,0,0,-365.7,-916.9,-4,35.1);
		quest::spawn2(57165,0,0,-366.4,-893.6,-4,13.5);
		quest::spawn2(57165,0,0,-341,-941.5,-4,45);
		quest::spawn2(57165,0,0,-308.9,-941.4,-4,28);
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
