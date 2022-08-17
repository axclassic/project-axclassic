#A_Watercrafted_Hunter.pl npcid - 223148

sub EVENT_DEATH {
    quest::signalwith(223181,14058,4000); #Triggers #water_counter.pl
    quest::signalwith(223172,14035,4000); #Triggers #water_trigger.pl
}
