# a_living_void

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 8720 => 1)) {
        my $a1 = 48424;
        my $x1 = $npc->GetX();
        my $y1 = $npc->GetY();
        my $z1 = $npc->GetZ();
        my $h = $npc->GetHeading();

        quest::spawn2($a1,0,0,$x1,$y1,$z1,$h1);
    }
}
#EOF
