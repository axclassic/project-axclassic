# an_undead_guardian_ (223107)

sub EVENT_DEATH {
    quest::ze(15, "Congdar an_undead_guardian_ signaling undead_counter and undead_trigger.");
    #Triggers #undead_counter.pl
    quest::signalwith(223180, 14048, 2000);
    #Triggers undead_trigger.pl
    quest::signalwith(223171, 14035, 2000);
}

