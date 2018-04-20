sub EVENT_DEATH {
    my $add = quest::ChooseRandom(158019,158020,158021,158024,158064,158075);
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    quest::spawn2($add,0,0,$x,$y,$z+5,$h);
}

