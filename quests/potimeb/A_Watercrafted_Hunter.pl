#A_Watercrafted_Hunter.pl npcid - 223148

sub EVENT_DEATH {
  quest::signalwith(223181,14058,0); #Triggers #water_counter.pl
  quest::signalwith(223172,14035,0); #Triggers #water_trigger.pl
}

sub EVENT_SIGNAL {
  # if ($signal == 66){
     # quest::depop();
# }
 }