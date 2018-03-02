sub EVENT_ENTERZONE {
     if($ulevel <= 5 && $ulevel >= 1) {
    quest::signalwith(94163,243,0);
	quest::signalwith(94163,244,10);
	}
	elsif($ulevel <= 10 && $ulevel >= 6) {
	quest::signalwith(94163,243,0);
	quest::signalwith(94163,245,10);
	}
	elsif($ulevel <= 15 && $ulevel >= 11) {
	quest::signalwith(94163,243,0);
	quest::signalwith(94163,246,10);
	}
	elsif($ulevel <= 20 && $ulevel >= 16) {
	quest::signalwith(94163,243,0);
	quest::signalwith(94163,247,10);
	}
	elsif($ulevel <= 25 && $ulevel >= 21) {
	quest::signalwith(94163,243,0);
	quest::signalwith(94163,248,10);
	}
	elsif($ulevel <= 30 && $ulevel >= 26) {
	quest::signalwith(94163,243,0);
	quest::signalwith(94163,249,10);
	}
	elsif($ulevel <= 35 && $ulevel >= 31) {
	quest::signalwith(94163,243,0);
	quest::signalwith(94163,250,10);
	}
	elsif($ulevel <= 40 && $ulevel >= 36) {
	quest::signalwith(94163,243,0);
	quest::signalwith(94163,251,10);
	}
	elsif($ulevel <= 45 && $ulevel >= 41) {
	quest::signalwith(94163,243,0);
	quest::signalwith(94163,252,10);
	}
	elsif($ulevel <= 49 && $ulevel >= 46) {
	quest::signalwith(94163,243,0);
	quest::signalwith(94163,253,10);
	}
	else {
	quest::signalwith(94163,243,0);
	}
	}