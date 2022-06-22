#  #Grieg_Veneficus (163075)

my $shadow_count = 0;

sub EVENT_SPAWN {
    $shadow_count = 0;
}

sub EVENT_SIGNAL {
    if($signal == 163483) {
        $shadow_count++;
        if($shadow_count > 11) {
            $npc->Depop();
            quest::spawn2(163097, 0, 0, 2340, 503, 170, 130); #__Grieg_Veneficus__ (163097)
        }
    }
}

