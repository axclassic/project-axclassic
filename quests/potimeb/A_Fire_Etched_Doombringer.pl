# A_Fire_Etched_Doombringer npcid - 223114

sub EVENT_DEATH {
    #Triggers #fire_counter.pl
    quest::signalwith(223182,14068,4000);
}
