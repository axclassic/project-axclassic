# a_black_reaver that spawns Lord_Ghiosk (90180)
sub EVENT_DEATH {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    my $random_result = int(rand(100));
    if($random_result < 15) {
        quest::spawn2(90180,0,0,$x,$y,$z,$h);
    }
    else {
        quest::spawn2(90004,0,0,$x,$y,$z,$h);
    }
}
#END of FILE Zone:citymist  ID:90004 -- a_black_reaver
