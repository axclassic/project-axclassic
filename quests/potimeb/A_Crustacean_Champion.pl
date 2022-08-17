# A_Crustacean_Cmapion.pl npcid - 223132

sub EVENT_DEATH {
    #Triggers #water_trigger.pl
    quest::signalwith(223172,14035,4000);
}
