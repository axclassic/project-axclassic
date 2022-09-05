# A_Fire_Etched_Doombringer (223114)

sub EVENT_DEATH {
    #quest::ze(15, "Congdar A_Fire_Etched_Doombringer signaling the fire_counter.");
    #Triggers #fire_counter.pl
    quest::signalwith(223182, 14068, 2000);
    #Triggers #fire_trigger.pl
    quest::signalwith(223173,14035,4000);
}

