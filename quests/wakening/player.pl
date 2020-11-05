# Cleric Epic 1.5

sub EVENT_LOOT {
    if($looted_id == 9954) {
        if($class eq "Necromancer") {
            quest::spawn2(119180, 0, 0, 719.6, -3079.6, 21.7, 39.1); # a_chest (119180)
        }
    }
}


