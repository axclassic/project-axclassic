sub EVENT_DEATH {
    my $add = quest::ChooseRandom(158005,158036,158037,158059,158060,158072);
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    quest::spawn2($add,0,0,$x,$y,$z+5,$h);
}

