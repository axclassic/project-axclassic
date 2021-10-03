

sub EVENT_SPAWN {
    $x = $npc->GetX();
    $y = $npc->GetY();
    quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 150);
}

sub EVENT_ENTER {
    if(defined($Sleeperawake)) {
        $npc->Say("Sleeper Awake!");
        quest::spawn_condition("sleeper", 1,0); ##This has to be the zone name  so code knows which zone to look into
        quest::spawn_condition("sleeper", 2,1);
        quest::depop();
    }
    else {
        $npc->Say("Sleeper Sleeping");
        quest::spawn_condition("sleeper", 1,1); 
        quest::spawn_condition("sleeper", 2,0);
        quest::depop();
    }
}

