# a_pile of living rubble npcid - 223106

sub EVENT_DEATH {
    my $x1 = $npc->GetX();
    my $y1 = $npc->GetY();
    my $z1 = $npc->GetZ();
    my $h1 = $npc->GetHeading();
    #quest::ze(15, "Congdar a_pile_of_living_rubble signaling earth_event (223186).");
    #quest::signalwith(223186, 14018, 2000);
    # a rock shaped assassin
    #quest::ze(15, "Congdar a_pile_of_living_rubble spawning 2 a_rock_shaped_assassin.");
    quest::spawn2(223147,0,0,$x1,$y1 + 5,$z1,$h1);
    quest::spawn2(223147,0,0,$x1,$y1 - 5,$z1,$h1);
    my $rndspawn = int(rand(100));
    if($rndspawn < 50) {
        #quest::ze(15, "Congdar a_pile_of_living_rubble spawning BONUS a_rock_shaped_assassin.");
        quest::spawn2(223147,0,0,$x1,$y1 + 10,$z1,$h1);
    }
    $rndspawn = int(rand(100));
    if($rndspawn < 50) {
        #quest::ze(15, "Congdar a_pile_of_living_rubble spawning BONUS a_rock_shaped_assassin.");
        quest::spawn2(223147,0,0,$x1,$y1 - 10,$z1,$h1);
    }
}

