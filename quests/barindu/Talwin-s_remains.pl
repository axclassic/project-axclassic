sub EVENT_SPAWN {
    quest::settimer("setdead", 5);
}

sub EVENT_TIMER {
    if($timer eq "setdead") {
        $npc->SetAppearance(3);
    }
}


