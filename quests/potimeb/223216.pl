# Servitor_of_Xegony npcid - 223216

sub EVENT_DEATH {
  quest::signalwith(223179,14038,0); #Triggers air_counter.pl
  quest::signalwith(223170,14035,0); #Triggers air_trigger.pl
}
