# Gutripping_War_Beast (223146)

sub EVENT_DEATH {
    quest::ze(15, "Congdar Gutripping_War_Beast signaling the fire_trigger.");
    #Triggers #fire_trigger.pl
    quest::signalwith(223173, 14035, 2000);
}

