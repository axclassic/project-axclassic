# #an_undead_guardian npcid - 223105

sub EVENT_DEATH {
    my $x1 = $npc->GetX();
    my $y1 = $npc->GetY();
    my $z1 = $npc->GetZ();
    my $h1 = $npc->GetHeading();
    #quest::ze(15, "Congdar an_undead_guardian signaling undead_event (223188).");
    quest::signalwith(223188, 14048, 2000);
    #quest::ze(15, "Congdar an_undead_guardian spawning 2 an_undead_guardian.");
    # an_undead_guardian (223116)
    quest::spawn2(223116,0,0,$x1,$y1 + 5,$z1,$h1);
    quest::spawn2(223116,0,0,$x1,$y1 - 5,$z1,$h1);
    my $rndspawn = int(rand(100));
    if($rndspawn < 50) {
        #quest::ze(15, "Congdar an_undead_guardian spawning BONUS an_undead_guardian.");
        quest::spawn2(223116,0,0,$x1,$y1 + 10,$z1,$h1);
    }
    $rndspawn = int(rand(100));
    if($rndspawn < 50) {
        #quest::ze(15, "Congdar an_undead_guardian spawning BONUS an_undead_guardian.");
        quest::spawn2(223116,0,0,$x1,$y1 - 10,$z1,$h1);
    }
}
