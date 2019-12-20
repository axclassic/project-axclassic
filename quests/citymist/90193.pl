# a_black_reaver that spawns #Tzirathk (90164)
sub EVENT_DEATH {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    my $random_result = int(rand(100));
    if($random_result < 15) {
        quest::spawn2(90164,0,0,$x,$y,$z,$h);
    }
    else {
        quest::spawn2(90193,0,0,$x,$y,$z,$h);
    }
}
#END of FILE Zone:citymist  ID:90193 -- a_black_reaver
