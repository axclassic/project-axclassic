# Servitor_of_Xegony npcid - 223216

sub EVENT_DEATH {
    #Triggers air_counter.pl
    quest::signalwith(223179,14038,4000);
    #Triggers air_trigger.pl
    quest::signalwith(223170,14035,4000);
}

