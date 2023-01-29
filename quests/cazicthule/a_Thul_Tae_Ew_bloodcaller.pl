# a_Thul_Tae_Ew_bloodcaller

sub EVENT_DEATH {
    my $random_result = int(rand(100));
    my $a1 = 48426;
    my $x1 = $npc->GetX();
    my $y1 = $npc->GetY();
    my $z1 = $npc->GetZ();
    my $h1 = $npc->GetHeading();

    if($random_result<=50) {
        #Spawns my mob at the location that just died
        quest::spawn2($a1,0,0,$x1,$y1,$z1,$h1);
    }
}
