##New Easter Event the signals tell the controller for lfaydark zone what level NPC to spawn
sub EVENT_ENTERZONE {
   if($ulevel >= 1 && $ulevel <= 5) {
    quest::signalwith(57166,55,0);
	quest::signalwith(57166,45,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(57166,55,0);
	quest::signalwith(57166,46,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(57166,55,0);
	quest::signalwith(57166,47,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(57166,55,0);
	quest::signalwith(57166,48,10);
	}
	elsif($ulevel >= 21 && $ulevel <= 25) {
	quest::signalwith(57166,55,0);
	quest::signalwith(57166,49,10);
	}
	elsif($ulevel >= 26 && $ulevel <= 30) {
	quest::signalwith(57166,55,0);
	quest::signalwith(57166,50,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(57166,55,0);
	quest::signalwith(57166,51,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(57166,55,0);
	quest::signalwith(57166,52,10);
	}
	elsif($ulevel >= 41 && $ulevel <= 41) {
	quest::signalwith(57166,55,0);
	quest::signalwith(57166,53,10);
	}
	elsif($ulevel >= 46 && $ulevel <= 49) {
	quest::signalwith(57166,55,0);
	quest::signalwith(57166,54,10);
	}
	else {
	quest::signalwith(57166,55,0);
	}
	}