#Servitor_of_Xegony npcid - 223995
 
sub EVENT_DEATH {
    #quest::signalwith(223163,10010,0); #phase 2 timer
    #quest::signalwith(223187,14058,0);
    quest::signalwith(223170,14035,0); #Triggers air_trigger.pl
}
