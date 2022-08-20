# #An_Air_Phoenix_Noble.pl npcid - 223226

sub EVENT_DEATH {
    quest::ze(15, "Congdar signaling the air_counter and air_trigger.");
    #Triggers #air_counter.pl
    quest::signalwith(223179, 14038, 2000);
    #Triggers air_trigger.pl
    quest::signalwith(223170, 14035, 2000);
}

