# #drunk_counter (228113)

my $drunk_counter = 1;

sub EVENT_SPAWN {
    $drunk_counter = 1;
}

sub EVENT_SIGNAL {
    my $drunkup = $entity_list->GetMobByNpcTypeID(228111);
    if($signal == 33) {
        $drunk_counter = $drunk_counter + 1;
    }
    if(($drunk_counter >= 24} && !$drunkup) {
        #spawn the drunken buccaneer
        quest::spawn2(228111,0,0,431,1006,-607.4,0); # NPC: the_Drunken_Buccaneer
        $drunk_counter = 1;
    }
    elsif(($drunk >= 23) && $drunkup) {
        $drunk_counter = 1;
    }
}

