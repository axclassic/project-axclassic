sub EVENT_SPAWN {
    my $x1 = $npc->GetX();
    my $y1 = $npc->GetY();
    quest::set_proximity($x1 - 10, $x1 + 10, $y1 - 10, $y1 + 10);
}

sub EVENT_ENTER {
    quest::spawn2(228113,0,0,0,0,0,0); # NPC: #drunk_counter
    quest::depop();
}
