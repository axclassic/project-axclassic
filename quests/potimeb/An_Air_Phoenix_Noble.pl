# An_Air_Phoenix_Noble (223087)

sub EVENT_DEATH {
    my $x1 = $npc->GetX();
    my $y1 = $npc->GetY();
    my $z1 = $npc->GetZ();
    my $h1 = $npc->GetHeading();
    # Servitor_of_Xegony (223995)
    #quest::ze(15, "Congdar An_Air_Phoenix_Noble spawning 2 Servitor_of_Xegony (223995).");
    quest::spawn2(223995,0,0,$x1,$y1 + 5,$z1,$h1);
    quest::spawn2(223995,0,0,$x1,$y1 - 5,$z1,$h1);
    my $rndspawn = int(rand(100));
    if($rndspawn < 50) {
        #quest::ze(15, "Congdar An_Air_Phoenix_Noble spawning BONUS Servitor_of_Xegony (223995).");
        quest::spawn2(223995,0,0,$x1,$y1 + 10,$z1,$h1);
    }
    $rndspawn = int(rand(100));
    if($rndspawn < 50) {
        #quest::ze(15, "Congdar An_Air_Phoenix_Noble spawning BONUS Servitor_of_Xegony (223995).");
        quest::spawn2(223995,0,0,$x1,$y1 - 10,$z1,$h1);
    }
}

