# Ralthos_Enrok.pl npcid is 223127

sub EVENT_DEATH {
    quest::signalwith(223171, 14035, 2000); #Triggers undead_trigger.pl
}
