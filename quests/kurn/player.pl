sub EVENT_ENTERZONE {
     if($ulevel <= 5 && $ulevel >= 1) {
    quest::signalwith(97104,276,0);
	quest::signalwith(97104,277,10);
	}
	elsif($ulevel <= 10 && $ulevel >= 6) {
	quest::signalwith(97104,276,0);
	quest::signalwith(97104,278,10);
	}
	elsif($ulevel <= 15 && $ulevel >= 11) {
	quest::signalwith(97104,276,0);
	quest::signalwith(97104,279,10);
	}
	elsif($ulevel <= 20 && $ulevel >= 16) {
	quest::signalwith(97104,276,0);
	quest::signalwith(97104,280,10);
	}
	elsif($ulevel <= 25 && $ulevel >= 21) {
	quest::signalwith(97104,276,0);
	quest::signalwith(97104,281,10);
	}
	elsif($ulevel <= 30 && $ulevel >= 26) {
	quest::signalwith(97104,276,0);
	quest::signalwith(97104,282,10);
	}
	elsif($ulevel <= 35 && $ulevel >= 31) {
	quest::signalwith(97104,276,0);
	quest::signalwith(97104,283,10);
	}
	elsif($ulevel <= 40 && $ulevel >= 36) {
	quest::signalwith(97104,276,0);
	quest::signalwith(97104,284,10);
	}
	elsif($ulevel <= 45 && $ulevel >= 41) {
	quest::signalwith(97104,276,0);
	quest::signalwith(97104,285,10);
	}
	elsif($ulevel <= 49 && $ulevel >= 46) {
	quest::signalwith(97104,276,0);
	quest::signalwith(97104,286,10);
	}
	else {
	quest::signalwith(97104,276,0);
	}
	}