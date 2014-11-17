##corrupted_drake NPC ID 343093##
sub EVENT_DEATH {
 quest::signalwith(343257,622,0);
}
sub EVENT_SIGNAL {
if ($signal == 400) {
    quest::depop();
	}
	}