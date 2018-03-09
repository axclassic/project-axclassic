##zonecotroller for qeynos2 North Qeynos##
##spawns Peter_Cottontail##
sub EVENT_SIGNAL {
   if((defined $event8) && ($event8 == 1)) {
     quest::spawn2(2158,0,0,216.9,328.3,0,241.1);
    }
  }