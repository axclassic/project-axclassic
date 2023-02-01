# RoF Event

# npcId = 48251
sub EVENT_SPAWN {
    quest::emote("attacks with eerie speed!");
    quest::settimer("version", 20);
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

