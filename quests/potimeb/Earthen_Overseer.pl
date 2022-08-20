# Earthen_Overseer.pl npcid 223134

sub EVENT_DEATH {
    quest::ze(15, "Congdar signaling the earth_trigger.");
    #Triggers earth_trigger.pl
    quest::signalwith(223169, 14035, 2000);
}
