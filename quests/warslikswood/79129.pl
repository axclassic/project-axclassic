#BeginFile: warslikswood\79129.pl (Raving Goblinmaster - KOS)
#Quest for Warsliks Wood - Raving Goblinmaster: Berserker Epic 1.0 (Trial of Mastery)
######################
## Edited By Aardil ##
##   11-11-2013     ##
######################
sub EVENT_SPAWN {
    quest::settimer(1,600); #Depop after 10 minutes
}

sub EVENT_TIMER {
    quest::stoptimer(1);
    quest::shout("If you thought you could dawdle, you were not right. Because you're lazy, you lost the chance to fight."); #Text made up
    quest::depop();
}

sub EVENT_DEATH {
    quest::stoptimer(1);
}
#EndFile: warslikswood\79129.pl (Raving Goblinmaster - KOS)
