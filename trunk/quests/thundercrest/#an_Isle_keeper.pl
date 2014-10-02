sub EVENT_WAYPOINT {
    if ($wp == 4) {
    quest::signalwith(340079,566,0);
    }
	if ($wp == 5) {
	quest::spawn2(340083,340071,0,182.1,932.5,61.5,0.5);
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
   quest::spawn2(340083,340071,0,182.1,932.5,61.5,0.5);
}