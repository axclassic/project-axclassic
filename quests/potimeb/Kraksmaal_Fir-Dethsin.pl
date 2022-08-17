
sub EVENT_DEATH {
    quest::signalwith(223154,11020,4000);
}

sub EVENT_SIGNAL {
    if($signal == 66) {
        quest::depop();
    }
}

