# 223039.pl  Battlemaster_of_the_Faceless

sub EVENT_DEATH {
    #count 4th wave
    quest::signalwith(223154, 4044, 2000);
    quest::emote("loses its semi-rigid consistency and deflates. The burbling noise and fetid scent are nauseating.");
}

