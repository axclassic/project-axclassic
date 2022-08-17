# Herlsoakian.pl npcid - 223013

sub EVENT_DEATH {
    quest::signalwith(223154,11040,4000);
    quest::emote("loses its semi-rigid consistency and deflates. The burbling noise and fetid scent are nauseating.");
}

