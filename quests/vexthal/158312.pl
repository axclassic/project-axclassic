sub EVENT_SPAWN {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    quest::set_proximity($x-80, $x+80, $y-80, $y+80);
}

sub EVENT_ENTER {
    my $add = quest::ChooseRandom(158004,158027,158044,158057,158061,158073);
    quest::spawn2($add,0,0,-782.8,0.1,-39.7,192);
    $add = quest::ChooseRandom(158005,158036,158037,158059,158060,158072);
    quest::spawn2($add,0,0,-782.8,29.9,-39.7,192);
    $add = quest::ChooseRandom(158019,158020,158021,158024,158064,158075);
    quest::spawn2($add,0,0,-782.8,-29.9,-39.7,192);
    quest::depop();
}

#End of File, Zone:vexthal  NPC:158312 -- #Courtyard_Trigger
