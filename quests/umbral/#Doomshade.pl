# depop doomshade after 1 hr
#

sub EVENT_SPAWN {
    quest::settimer("depopdoom",3600);
}

sub EVENT_TIMER {
    if($timer eq "depopdoom") {
        quest::stoptimer("depopdoom");
        quest::depop();
    }
}
sub EVENT_DEATH{
    quest::signalwith(176105,176,0);
}

# EOF

