# 223109.pl A_Smoldering_Elemental

sub EVENT_DEATH {
    #Triggers #fire_counter.pl
    quest::signalwith(223182,14068,4000);
    #Triggers #fire_trigger.pl
    quest::signalwith(223173,14035,4000);
}
