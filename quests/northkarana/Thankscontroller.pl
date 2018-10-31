##Thankscontroller.pl ID 13150 in North Karana##
##Spawns Old_Lady_Einarr for Thanksgiving Event ##
##Uses Global event9 ##
sub EVENT_SPAWN {
      if((defined $event9) && ($event9 == 1)) {
       quest::unique_spawn(13149,0,0,1208.5,-1265.7,-9.1,81);    
   }
   }