sub EVENT_SPAWN {
quest::spawn2(339123,0,0,1817,6597.3,657.9,118.1);
quest::spawn2(339125,0,0,1836.7,6483.9,642.3,249.6);
}
sub EVENT_DEATH {
quest::signalwith(339123,921,0);
quest::signalwith(339125,921,0);
}