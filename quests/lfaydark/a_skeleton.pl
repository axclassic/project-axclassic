# a_skeleton

sub EVENT_DEATH {
    my $randomNumber = int(rand(100));
    if($randomNumber < 25) {
        my $myX = $npc->GetX();
        my $myY = $npc->GetY();
        my $myZ = $npc->GetZ();
        quest::spawn2(57103,0,0,$myX,$myY,$myZ,1);
    }
}

