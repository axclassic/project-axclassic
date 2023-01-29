# a_Thul_Tae_Ew_Warder

sub EVENT_SPAWN {
    my x1 = $npc->GetX();
    my y1 = $npc->GetY();
    quest::set_proximity($x1-40,$x1+40,$y1-40,$y1+40);
}

sub EVENT_ENTER {
    quest::say("Begone intruder!");
    quest::castspell(2129, $userid)
}

