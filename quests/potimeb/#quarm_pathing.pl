
sub EVENT_SPAWN {
    $x = $npc->GetX();
    $y = $npc->GetY();
    quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
}

