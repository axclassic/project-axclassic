#a_pile of living rubble npcid - 223106

sub EVENT_DEATH {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    quest::signalwith(223186,14018,4000);
    quest::spawn2(223147,0,0,$x,$y + 5,$z,$h); #a rock shaped assassin
    quest::spawn2(223147,0,0,$x,$y - 5,$z,$h);
    my $rndspawn = int(rand(100));
    if($rndspawn < 50) {
        quest::spawn2(223147,0,0,$x,$y + 10,$z,$h);
    }
    $rndspawn = int(rand(100));
    if($rndspawn < 50) {
        quest::spawn2(223147,0,0,$x,$y - 10,$z,$h);
    }
}

