# Abram_the_Corrupted`s_corpse (309006)

sub EVENT_SPAWN {
    quest::settimer("die", 5);
}

sub EVENT_TIMER {
    if($timer eq "die") {
        quest::stoptimer("die");
        # --dead
        $npc->SetAppearance(3);
    }
}

