# #Hexxt_Pvin_Nki (295143)

sub EVENT_SPAWN {
    quest::setnexthpevent(45);
}

sub EVENT_HP {
    if($hpevent == 45) {
        quest::settimer("castingHPN", 10);
    }
}

sub EVENT_TIMER {
    if($timer eq "castingHPN") {
        quest::stoptimer("castingHPN");
        my $spid = quest::ChooseRandom(4850, 4849, 4851);
        my $tgt = $npc->GetTarget();
        $npc->SendBeginCast($spid, 0);
        quest::castspell($spid, $tgt);
        quest::settimer("castingHPN", 30);
    }
}

sub EVENT_TIMER {
    quest::stoptimer("castingHPN");
}

