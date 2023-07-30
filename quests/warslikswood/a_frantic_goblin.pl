#BeginFile: warslikswood\a_frantic_goblin.pl (79130)
#Quest for Warsliks Wood - a frantic goblin: Berserker Epic 1.0 (Trial of Mastery)
######################
## Edited By Aardil ##
##    11-11-2013    ##
######################
sub EVENT_SPAWN {
    quest::settimer(1,60);
}

sub EVENT_TIMER {
    if($timer == 1) {
        quest::stoptimer(1);
        quest::signalwith(79128,1,0);
    }
}

sub EVENT_DEATH {
    quest::stoptimer(1);
    quest::signalwith(79128,2,0);
}

sub EVENT_SIGNAL {
    if($signal == 1) {
        quest::stoptimer(1);
        quest::depop();
    }
}
#EndFile: warslikswood\a_frantic_goblin.pl (79130)

