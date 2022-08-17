#A_Deepwater_Assassin.pl npcid - 223141

sub EVENT_DEATH {
    #Triggers #water_counter.pl
    quest::signalwith(223181,14058,4000);
}

