# An_Unholy_Rock_Fiend (223125) 

sub EVENT_DEATH {
    #quest::ze(15, "Congdar signaling the earth_counter and earth_trigger.");
    #Triggers earth_counter.pl
    quest::signalwith(223178, 14028, 2000);
    #Triggers earth_trigger.pl
    quest::signalwith(223169, 14035, 2000);
}

