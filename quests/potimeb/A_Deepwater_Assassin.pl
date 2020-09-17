#A_Deepwater_Assassin.pl npcid - 223141

sub EVENT_DEATH {
    quest::signalwith(223181,14058,0); #Triggers #water_counter.pl
}

