# A_Fire_Etched_Doombringer npcid - 223114

sub EVENT_DEATH {
  quest::signalwith(223182,14068,0); #Triggers #fire_counter.pl
}

sub EVENT_SIGNAL {
  # if ($signal == 66){
     # quest::depop();
# }
 }