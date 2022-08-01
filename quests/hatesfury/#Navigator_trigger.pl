sub EVENT_SPAWN {
    my $x1 = $npc->GetX();
    my $y1 = $npc->GetY();
    quest::set_proximity($x1 - 25, $x1 + 25, $y1 - 100, $y1 + 100);
}

sub EVENT_ENTER {
    quest::spawn2(228107,0,0,0,0,0,0); # NPC: #Navigator_counter
    quest::depop();
}
