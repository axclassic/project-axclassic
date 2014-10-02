sub EVENT_WAYPOINT {
    if ($wp == 9) {
    quest::signalwith(340079,566,0);
    }
	if ($wp == 10) {
	quest::spawn2(340086,340074,0,-646.9,-309.9,61.6,202.6);
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
   quest::spawn2(340086,340074,0,-646.9,-309.9,61.6,202.6);
}