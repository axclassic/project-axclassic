# 223006.pl A_Dark_Guardian_of_the_Warlord

sub EVENT_DEATH {
    #triggers phase3_trigger.pl with signal 1011
    quest::signalwith(223154, 1011, 2000);
}

