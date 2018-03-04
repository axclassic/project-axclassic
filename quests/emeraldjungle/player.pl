##New Easter Event the signals tell the controller for emeraldjungle zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 1 && $ulevel <= 5) {
    quest::signalwith(94163,243,0);
	quest::signalwith(94163,244,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(94163,243,0);
	quest::signalwith(94163,245,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(94163,243,0);
	quest::signalwith(94163,246,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(94163,243,0);
	quest::signalwith(94163,247,10);
	}
	elsif($ulevel >= 21 && $ulevel <= 25) {
	quest::signalwith(94163,243,0);
	quest::signalwith(94163,248,10);
	}
	elsif($ulevel >= 26 && $ulevel <= 30) {
	quest::signalwith(94163,243,0);
	quest::signalwith(94163,249,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(94163,243,0);
	quest::signalwith(94163,250,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(94163,243,0);
	quest::signalwith(94163,251,10);
	}
	elsif($ulevel >= 41 && $ulevel <= 45) {
	quest::signalwith(94163,243,0);
	quest::signalwith(94163,252,10);
	}
	elsif($ulevel >= 46 && $ulevel <= 49) {
	quest::signalwith(94163,243,0);
	quest::signalwith(94163,253,10);
	}
	else {
	quest::signalwith(94163,243,0);
	}
	}