# an_undead_guardian (223116)

sub EVENT_DEATH {
    #quest::ze(15, "Congdar an_undead_guardian signaling undead_event.");
    #Triggers #undead_event.pl
    quest::signalwith(223188, 14048, 2000);
    #Triggers #undead_counter.pl
    quest::signalwith(223180,14048,4000);
    #Triggers undead_trigger.pl
    quest::signalwith(223171,14035,4000);
}

