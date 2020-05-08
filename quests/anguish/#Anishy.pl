## Anishy 317136 ##

sub EVENT_TIMER {
    if($timer eq "shout") {
        quest::stoptimer("shout");
        quest::shout("Now fools. Strike while we hold him, we cannot hold this seal for long.");
        quest::ze(15, "Tendrils of energy shoot from the fingertips of the Riftseekers, turning Mata Murams magic inward.");
    }
}

sub EVENT_SIGNAL {
    quest::settimer("shout", 5);
}
