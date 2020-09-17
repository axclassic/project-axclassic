# 223109.pl A_Smoldering_Elemental

sub EVENT_DEATH {
    quest::signalwith(223182,14068,0); #Triggers #fire_counter.pl
    quest::signalwith(223173,14035,0); #Triggers #fire_trigger.pl
}
