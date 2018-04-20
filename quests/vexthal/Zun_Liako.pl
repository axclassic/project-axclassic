sub EVENT_DEATH {
    my $add = quest::ChooseRandom(158018,158023,158045,158058,158070,158071);
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    quest::spawn2($add,0,0,$x,$y,$z+5,$h);
}

