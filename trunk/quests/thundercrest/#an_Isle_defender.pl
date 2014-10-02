sub EVENT_WAYPOINT {
    if ($wp == 5) {
    quest::signalwith(340079,566,0);
    }
	if ($wp == 6) {
	quest::spawn2(340081,340069,0,694.4,659.8,61.6,64.9);
	quest::depop();
}
}
sub EVENT_SIGNAL {
   if ($signal == 676) {
   quest::depop();
}
}
sub EVENT_DEATH {
   quest::signalwith(340080,666,0);
   quest::spawn2(340081,340069,0,694.4,659.8,61.6,64.9);
}