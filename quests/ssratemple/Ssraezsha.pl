# Ssraezsha (162280)

sub EVENT_SPAWN {
    quest::set_proximity($x - 60, $x + 60, $y - 60, $y + 60);
    quest::settimer("depop", 3600);
}

sub EVENT_ENTER {
    quest::castspell(2076, $userid); #-- Spell: Presence of Ssraeshza
}

sub EVENT_TIMER {
    if($timer eq "depop") {
        quest::depop();
    }
}

