#223048.pl A_Minion_of_the_Warlord

sub EVENT_DEATH {
  quest::signalwith(223154,5055,0); #count 5th wave
}