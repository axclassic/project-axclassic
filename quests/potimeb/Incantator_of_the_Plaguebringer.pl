# Incantator_of_the_Plaguebringer.pl npcid - 223026
sub EVENT_DEATH{
 quest::signalwith(223154,2022,0); #triggers phase3_trigger.pl with signal 2022
 }