# #A_Tentacle_Terror (48451)

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

