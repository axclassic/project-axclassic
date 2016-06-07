# Gutripping_War_Beast.pl npcid - 223146

sub EVENT_DEATH {
  quest::signalwith(223173,14035,0); #Triggers #fire_trigger.pl
}

sub EVENT_SIGNAL {
  # if ($signal == 66){
     # quest::depop();
# }
 }