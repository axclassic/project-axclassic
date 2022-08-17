#An_Elemental_Stonefist.pl npcid - 223102

sub EVENT_DEATH {
    quest::signalwith(223178,14028,4000); #Triggers earth_counter.pl
    quest::signalwith(223169,14035,4000); #Triggers earth_trigger.pl
}
