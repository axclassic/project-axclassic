# A_Smoldering_Elemental.pl npcid - 223124

sub EVENT_DEATH {
    quest::signalwith(223182,14068,4000); #Triggers #fire_counter.pl
    quest::signalwith(223173,14035,4000); #Triggers #fire_trigger.pl
}
