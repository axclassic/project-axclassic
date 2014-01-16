my $gregspawn = 0;

 sub EVENT_SPAWN {
 $gregspawn = 0;
 }

 sub EVENT_SIGNAL {
 if ($signal == 400){ # trigger from shadowmaster#
  $gregspawn += 1 # adds one to spawn variable # 
 }

 if ($gregspawn == 12){ # looks for 12 dead#
 quest::depop(163075); # depops merchant 
 quest::spawn2 (163156,0,0,2340.0,503.0,169.8,130.0); 
 # spawns Wizard #
 $gregspawn == 0; # resets variable #
 }

 }
