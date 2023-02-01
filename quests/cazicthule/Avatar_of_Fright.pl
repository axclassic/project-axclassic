# RoF Event Avatar_of_Fright (48420)

sub EVENT_SPAWN {
    quest::settimer("version", 20);
}

sub EVENT_SIGNAL {
    # signal 1 = Come to Life
    if ($signal == 1) {
        quest::modifynpcstat("special_attacks","SETQMCDfd");
    }
}

sub EVENT_TIMER {
    if($timer eq "version") {
        if(defined $cazpop) {
            if($cazpop eq 1) {
                quest::stoptimer("version");
                quest::depop();
            }
        }
    }
}

sub EVENT_DEATH {
    quest::stoptimer("version");
}

