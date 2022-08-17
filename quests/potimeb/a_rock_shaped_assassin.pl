#a_rock_shaped_assassin npcid - 223147

sub EVENT_DEATH {
    #signals 223186 earth_event
    quest::signalwith(223186,14018,4000);
}

