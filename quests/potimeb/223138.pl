# an_undead_guardian_.pl npcid 223138

sub EVENT_DEATH {
  quest::signalwith(223180,14048,0); #Triggers #undead_counter.pl
  quest::signalwith(223171,14035,0); #Triggers undead_trigger.pl
}