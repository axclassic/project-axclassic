# An_Unholy_Rock_Fiend (223110) 


sub EVENT_DEATH {
  quest::signalwith(223178,14028,0); #Triggers earth_counter.pl
  quest::signalwith(223169,14035,0); #Triggers earth_trigger.pl
}
}
sub EVENT_SIGNAL {
  # if ($signal == 66){
     # quest::depop();
# }
# }
