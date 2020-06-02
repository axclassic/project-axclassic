# a_dragorn_defender (305004)

sub EVENT_SPAWN {
    quest::settimer("aggro", 2);
}

sub EVENT_TIMER {
    if($timer eq "aggro") {
        quest::settimer("aggro", 8);
        my $aggromob = $entity_list->GetMobByNpcTypeID(305000);
        if($aggromob) {
            my $target = $aggromob->GetHateRandom();
            if($target) {
                $npc->AddToHateList($target, 10);
            }
        }
    }
}

sub EVENT_COMBAT {
    if($npc->IsEngaged()) {
        quest::stoptimer("aggro");
    }
}

