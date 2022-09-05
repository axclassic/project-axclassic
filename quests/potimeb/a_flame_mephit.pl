# a_flame_mephit npcid - 223088

sub EVENT_DEATH {
    #quest::ze(15, "Congdar a_flame_mephit signaling fire_event (223190).");
    quest::signalwith(223190, 14028, 2000);
}

