sub EVENT_DEATH {
    my $add = quest::ChooseRandom(158004,158027,158044,158057,158061,158073);
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    quest::spawn2($add,0,0,$x,$y,$z+5,$h);
}

