# Deathbringer_Blackheart.pl npcid - 223009

sub EVENT_DEATH {
    quest::signalwith(223154, 11010, 2000);
}

