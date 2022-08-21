# Revenant_of_the_Plaguebringer.pl npcid (223029)

sub EVENT_DEATH {
    quest::signalwith(223154, 2022, 2000); #triggers phase3_trigger.pl with signal 2022
}
