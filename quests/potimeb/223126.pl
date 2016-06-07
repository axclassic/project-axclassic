#223126.pl npcid - A_Deepwater_Assassin

sub EVENT_DEATH {
  quest::signalwith(223181,14058,0); #Triggers #water_counter.pl
  quest::signalwith(223172,14035,0); #Triggers #water_trigger.pl
}