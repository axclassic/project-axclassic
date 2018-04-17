sub EVENT_SPAWN {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    quest::set_proximity($x - 2500, $x + 2500, $y - 2500, $y + 2500,$z - 300, $z + 200);
}

sub EVENT_ENTER {
    quest::movepc(10,-1570,-25,20,231);
}

