## zone_controller 317154##

sub EVENT_SPAWN {
    quest::settimer("spawn_status_event", 30);
}

sub EVENT_TIMER {
    if($timer eq "spawn_status_event") {
        quest::stoptimer("spawn_status_event");
        quest::spawn2(317117, 0, 0, -3.8, 798, 646, 121);
    }
}

