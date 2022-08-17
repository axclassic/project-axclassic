# 223030.pl npcid - Archon_of_the_Plaguebringer

sub EVENT_DEATH {
    #triggers phase3_trigger.pl with signal 2022
    quest::signalwith(223154,2022,4000);
}
