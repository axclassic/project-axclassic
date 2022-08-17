#An_air_phoneix_noble npcid -223087

sub EVENT_DEATH {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    quest::signalwith(223187,14058,4000);
    quest::spawn2(223995,0,0,$x,$y + 5,$z,$h); #a rock shaped assassin
    quest::spawn2(223995,0,0,$x,$y - 5,$z,$h);
    my $rndspawn = int(rand(100));
    if($rndspawn < 50) {
        quest::spawn2(223995,0,0,$x,$y + 10,$z,$h);
    }
    $rndspawn = int(rand(100));
    if($rndspawn < 50) {
        quest::spawn2(223995,0,0,$x,$y - 10,$z,$h);
    }
}

