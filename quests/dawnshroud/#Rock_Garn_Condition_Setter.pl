sub EVENT_SIGNAL {
    if($signal == 530) {
        quest::settimer("Sambata", 300)
    }
    if($signal == 940) {
        quest::settimer("Rockhopper", 300)
    }
}

sub EVENT_TIMER {
    if($timer eq "Sambata") {
        quest::stoptimer("Sambata");
        if(!defined $qglobals{"Rockhopper_Sambata"}) {
            quest::spawn_condition($zonesn, 2, 1);
            quest::spawn_condition($zonesn, 1, 0);
        }
    }
    if($timer eq "Rockhopper") {
        quest::stoptimer("Rockhopper");
        if(!defined $qglobals{"Rockhopper_Sambata"}) {
            quest::spawn_condition($zonesn, 2, 0);
            quest::spawn_condition($zonesn, 1, 1);
        }
    }
}

# END of FILE Zone:dawnshroud  #Rock_Garn_Condition_Setter (174240)