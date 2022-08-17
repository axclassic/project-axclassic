# Gutripping_War_Beast.pl npcid - 223146

sub EVENT_DEATH {
    quest::signalwith(223173,14035,4000); #Triggers #fire_trigger.pl
}
