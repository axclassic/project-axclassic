##a_flame_mephit.pl npcid - 223088

sub EVENT_DEATH {
    my $x1 = $npc->GetX();
    my $y1 = $npc->GetY();
    my $z1 = $npc->GetZ();
    my $h1 = $npc->GetHeading();
    #quest::ze(15, "Congdar a_flame_mephit signaling fire_event (223190).");
    quest::signalwith(223190, 14028, 2000);
    #quest::ze(15, "Congdar a_flame_mephit spawning a_flame_mephit and an_inferno_mephit.");
    # a_flame_mephit (223089)
    quest::spawn2(223089,0,0,$x1,$y1 + 5,$z1,$h1);
    # an_inferno_mephit (223095)
    quest::spawn2(223095,0,0,$x1,$y1 - 5,$z1,$h1);
    my $rndspawn = int(rand(100));
    if($rndspawn < 50) {
        #quest::ze(15, "Congdar a_flame_mephit spawning BONUS a_flame_mephit.");
        quest::spawn2(223089,0,0,$x1,$y1 + 10,$z1,$h1);
    }
    $rndspawn = int(rand(100));
    if($rndspawn < 50) {
        #quest::ze(15, "Congdar a_flame_mephit spawning BONUS an_inferno_mephit.");
        quest::spawn2(223095,0,0,$x1,$y1 - 10,$z1,$h1);
    }
}

