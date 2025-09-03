# a_gnoll_prisoner (18070)

sub EVENT_SIGNAL {
    if($signal == 1) {
        quest::spawn2(18099, 0, 0, $x, $y, $z, $h); 
        quest::depop();
    }
}

