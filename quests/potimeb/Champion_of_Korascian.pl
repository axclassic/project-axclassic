#Champion_of_Korascian.pl npcid - 223099

sub EVENT_DEATH {
    quest::signalwith(223181,14058,4000); #Triggers #water_counter.pl
}

