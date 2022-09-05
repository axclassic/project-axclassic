# This should be 223123
# Champion_of_Korascian.pl (223123)

sub EVENT_DEATH {
    #quest::ze(15, "Congdar A_Watercrafted_Hunter signaling water_counter and water_trigger.");
    quest::signalwith(223181, 14058, 2000);
    quest::signalwith(223172, 14035, 2000);
}

