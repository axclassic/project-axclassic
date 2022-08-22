# #Navigator_counter (228107)

my $navigator_counter = 1;

sub EVENT_SPAWN {
    $navigator_counter = 1;
}

sub EVENT_SIGNAL {
    if($signal == 23) {
        $navigator_counter = $navigator_counter + 1;
    }
    if($counter >= 13) {
        #spawn Navigator
        quest::spawn2(228110,0,0,1542,982,-582,125); # NPC: the_Broken_Skull_Navigator
        $navigator_counter = 1;
    }
}

