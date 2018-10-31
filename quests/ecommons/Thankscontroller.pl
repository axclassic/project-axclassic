##Thankscontroller.pl ID 22264 in ecommons##
##Spawns Farmer_Glumr for Thanksgiving Event ##
##Uses Global event9 ##
sub EVENT_SPAWN {
      if((defined $event9) && ($event9 == 1)) {
       quest::unique_spawn(22263,0,0,-2.7,-1726.2,1.9,132.5);    
   }
   }