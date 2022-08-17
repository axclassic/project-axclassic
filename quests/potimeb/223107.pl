# an_undead_guardian_ he's a wizard class with npcid 223107

sub EVENT_DEATH {
    #Triggers #undead_counter.pl
    quest::signalwith(223180,14048,4000);
    #Triggers undead_trigger.pl
    quest::signalwith(223171,14035,4000);
}

