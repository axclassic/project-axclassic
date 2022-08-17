# Earthen_Overseer.pl npcid 223134

sub EVENT_DEATH {
    #quest::signalwith(223191,10030,0); #triggers phase2_timer.pl with signal 10030
    quest::signalwith(223169,14035,4000); #Triggers earth_trigger.pl
}
