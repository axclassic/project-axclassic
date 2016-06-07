# Ralthos_Enrok.pl npcid is 223127

sub EVENT_DEATH {
  quest::signalwith(223171,14035,0); #Triggers undead_trigger.pl
}

sub EVENT_SIGNAL {
  # if ($signal == 66){
     # quest::depop();
# }
 }