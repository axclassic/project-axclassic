##Guard Kliknaw Afraid##
sub EVENT_SPAWN{
quest::shout("Flee! Flee for your lives the encampment has been over taken!!");
}
sub EVENT_WAYPOINT{
if ($wp == 9) {
    quest::depop();
 }
}
