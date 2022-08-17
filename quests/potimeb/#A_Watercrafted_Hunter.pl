##A_Watercrafted_Hunter.pl npcid - 223153

sub EVENT_DEATH {
    #Triggers #water_counter.pl
    quest::signalwith(223181,14058,4000);
    #Triggers #water_trigger.pl
    quest::signalwith(223172,14035,4000);
}
