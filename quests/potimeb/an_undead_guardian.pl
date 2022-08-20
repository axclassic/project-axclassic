# an_undead_guardian (223116)

sub EVENT_DEATH {
    quest::ze(15, "Congdar an_undead_guardian signaling undead_event.");
    quest::signalwith(223188, 14048, 2000);
}

