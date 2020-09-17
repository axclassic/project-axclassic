# #An_Elemental_Stonefist.pl npcid - 223133

sub EVENT_DEATH {
    quest::signalwith(223178,14028,0); #Triggers earth_counter.pl
    quest::signalwith(223169,14035,0); #Triggers earth_trigger.pl
}
