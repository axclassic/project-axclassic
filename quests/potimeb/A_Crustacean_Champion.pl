# A_Crustacean_Cmapion.pl npcid - 223132

sub EVENT_DEATH {
    quest::signalwith(223172,14035,0); #Triggers #water_trigger.pl
}
