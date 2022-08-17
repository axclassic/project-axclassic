#223048.pl A_Minion_of_the_Warlord

sub EVENT_DEATH {
    #count 5th wave
    quest::signalwith(223154,5055,4000);
}
