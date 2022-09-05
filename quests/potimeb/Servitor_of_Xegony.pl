# Servitor_of_Xegony (223995)
 
sub EVENT_DEATH {
    quest::ze(15, "Congdar Servitor_of_Xegony signaling air_counter, air_event and air_trigger.");
    #Triggers #air_event.pl
    quest::signalwith(223187, 14058, 2000);
    #Triggers #air_counter.pl
    quest::signalwith(223179, 14038, 2000);
    #Triggers air_trigger.pl
    quest::signalwith(223170, 14035, 2000);
}
