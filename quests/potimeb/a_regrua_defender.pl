# a_regrua_defender (223192)

sub EVENT_DEATH {
    #quest::ze(15, "Congdar a_regrua_defender spawning 2 a_deepwater_triloun.");
    # a_deepwater_triloun (223115)
    quest::spawn2(223115,0,0,$x,$y + 5,$z,$h);
    quest::spawn2(223115,0,0,$x,$y - 5,$z,$h);
    my $rndspawn = int(rand(100));
    if($rndspawn < 50) {
        #quest::ze(15, "Congdar a_regrua_defender spawning BONUS a_deepwater_triloun.");
        quest::spawn2(223115,0,0,$x,$y + 10,$z,$h);
    }
    $rndspawn = int(rand(100));
    if($rndspawn < 50) {
        #quest::ze(15, "Congdar a_regrua_defender spawning BONUS a_deepwater_triloun.");
        quest::spawn2(223115,0,0,$x,$y - 10,$z,$h);
    }
}

