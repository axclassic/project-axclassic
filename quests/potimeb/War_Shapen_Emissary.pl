# War_Shapen_Emissary npcid - 223096

sub EVENT_DEATH {
    #Triggers #water_trigger.pl
	quest::signalwith(223172,14035,4000);
}
