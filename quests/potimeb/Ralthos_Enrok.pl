# Ralthos_Enrok.pl npcid is 223127

sub EVENT_DEATH {
    #Triggers undead_trigger.pl
    quest::signalwith(223171, 14035, 2000);
}

