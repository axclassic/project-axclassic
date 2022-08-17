
sub EVENT_AGGRO {
    quest::say("Imagine every debilitating disease in the world stripping away your body and mind. Now prepare to experience that feeling by a hundred fold!");
}

sub EVENT_DEATH {
    quest::signalwith(223158,13010,4000);
    quest::say("Defeat by mortals. . . impossible. The power of decay still beckons for you. . . someday. . .");
}

