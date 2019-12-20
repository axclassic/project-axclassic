# a_black_reaver that spawns trash an_apparition (90091), an_apparition (90153), a_wraith (90064), a_wraith (90073), a_phantom (90048), a_phantom (90057)
sub EVENT_DEATH {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    my $random_result = int(rand(100));
    if($random_result <= 15) {
       my $a = quest::ChooseRandom(90091,90153,90064,90073,90048,90057);
       quest::spawn2($a,0,0,$x,$y,$z,$h);
    }
    else {
        quest::spawn2(90006,0,0,$x,$y,$z,$h);
    }
}
#END of FILE Zone:citymist  ID:90006 -- a_black_reaver
