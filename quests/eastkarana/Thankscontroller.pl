##Thankscontroller.pl ID 15222 in East Karana##
##Spawns Master Gulmr ID 15220 and 3 of a_young_domestic_turkey ID 15221 for Thanksgiving Event ##
##Uses Global event9 ##
sub EVENT_SPAWN {
      if((defined $event9) && ($event9 == 1)) {
       quest::unique_spawn(15220,0,0,-54.2,-724.1,2,243); 
       quest::unique_spawn(15221,0,0,-95.3,-745.9,2,9);
       quest::unique_spawn(15221,0,0,-79.3,-739.8,1.1,243.6);
       quest::unique_spawn(15221,0,0,-101.3,-742,1.1,25.3);	   
   }
   }