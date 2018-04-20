sub EVENT_DEATH {
    my $add = quest::ChooseRandom(158022,158025,158026,158055,158063,158065);
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    quest::spawn2($add,0,0,$x,$y,$z+5,$h);
}

