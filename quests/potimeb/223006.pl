# 223006.pl A_Dark_Guardian_of_the_Warlord

sub EVENT_DEATH {
    quest::signalwith(223154,1011,0); #triggers phase3_trigger.pl with signal 1011
}
