# a_Thul_Tae_Ew_Warder

sub EVENT_SPAWN {
    my x1 = $npc->GetX();
    my y1 = $npc->GetY();
    quest::set_proximity($x1-40,$x1+40,$y1-40,$y1+40);
    quest::settimer("version", 20);
}

sub EVENT_ENTER {
    quest::say("Begone intruder!");
    quest::castspell(2129, $userid)
}

sub EVENT_TIMER {
    if($timer eq "version") {
        if(defined $cazpop) {
            if($cazpop eq 1) {
                quest::stoptimer("version");
                quest::depop();
            }
        }
    }
}

sub EVENT_DEATH {
    quest::stoptimer("version");
}

