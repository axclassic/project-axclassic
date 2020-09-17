# Deathbringer_Skullsmash.pl npcid - (223031)

sub EVENT_DEATH {
    quest::signalwith(223154,11030,0);
    quest::emote("coughs, 'Not bad, for mere amateurs. A commendable exertion on your part.'");
}

