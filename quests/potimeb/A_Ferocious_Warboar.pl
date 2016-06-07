# A_Ferocious_Warboar npcid - 223008

sub EVENT_DEATH {
  quest::signalwith(223154,11010,0); #sets counter
}

sub EVENT_SIGNAL {
  # if ($signal == 66){
     # quest::depop();
# }
 }
