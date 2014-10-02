sub EVENT_WAYPOINT {
    if ($wp == 4) {
    quest::signalwith(340079,566,0);
    }
	if ($wp == 5) {
	quest::spawn2(340082,340070,0,183.5,936.8,61.5,255.2);
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
   quest::spawn2(340082,340070,0,183.5,936.8,61.5,255.2);
}