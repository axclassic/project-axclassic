# Berserker Epic 2.0

sub EVENT_LOOT {
    if($looted_id == 17137) {
        if($class eq "Berserker") {
            if($berserker_epic eq "9") {
                if(!ber_epic_ge) {
                    quest::setglobal("ber_epic_ge", "1", 5, "F");
                    quest::spawn2(163056, 0, 0, 1784.2, -626.3, -74, 85.8); # a_chest (163056)
                }
            }
        }
    }
}

