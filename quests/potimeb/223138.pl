# an_undead_guardian_.pl npcid 223138

sub EVENT_DEATH {
    #Triggers #undead_counter.pl
    quest::signalwith(223180,14048,4000);
    #Triggers undead_trigger.pl
    quest::signalwith(223171,14035,4000);
}
