##A_Ferocious_War_Boar npcid - 223117

sub EVENT_DEATH {
  quest::signalwith(223182,14068,0); #Triggers #fire_counter.pl
  quest::signalwith(223173,14035,0); #Triggers #fire_trigger.pl
}

sub EVENT_SIGNAL {
  # if ($signal == 66){
     # quest::depop();
# }
 }