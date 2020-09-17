##an_undead_guardian npcid - 223105

sub EVENT_DEATH {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    quest::signalwith(223188,14048,0);
    quest::spawn2(223116,0,0,$x,$y + 5,$z,$h); #an_undead_protector
    quest::spawn2(223116,0,0,$x,$y - 5,$z,$h);
    quest::spawn2(quest::ChooseRandom(0,223116),0,0,$x,$y + 10,$z,$h);
    quest::spawn2(quest::ChooseRandom(0,223116),0,0,$x,$y - 10,$z,$h);
}
