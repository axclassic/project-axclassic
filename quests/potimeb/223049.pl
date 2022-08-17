#223049.pl A_warboar_of_suffering

sub EVENT_DEATH {
    #count 5th wave
    quest::signalwith(223154,5055,4000);
}
