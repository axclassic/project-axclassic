sub EVENT_ENTERZONE {
     if($ulevel <= 5 && $ulevel >= 1) {
    quest::signalwith(35188,132,0);
	quest::signalwith(35188,122,10);
	}
	elsif($ulevel <= 10 && $ulevel >= 6) {
	quest::signalwith(35188,132,0);
	quest::signalwith(35188,123,10);
	}
	elsif($ulevel <= 15 && $ulevel >= 11) {
	quest::signalwith(35188,132,0);
	quest::signalwith(35188,124,10);
	}
	elsif($ulevel <= 20 && $ulevel >= 16) {
	quest::signalwith(35188,132,0);
	quest::signalwith(35188,125,10);
	}
	elsif($ulevel <= 25 && $ulevel >= 21) {
	quest::signalwith(35188,132,0);
	quest::signalwith(35188,126,10);
	}
	elsif($ulevel <= 30 && $ulevel >= 26) {
	quest::signalwith(35188,132,0);
	quest::signalwith(35188,127,10);
	}
	elsif($ulevel <= 35 && $ulevel >= 31) {
	quest::signalwith(35188,132,0);
	quest::signalwith(35188,128,10);
	}
	elsif($ulevel <= 40 && $ulevel >= 36) {
	quest::signalwith(35188,132,0);
	quest::signalwith(35188,129,10);
	}
	elsif($ulevel <= 45 && $ulevel >= 41) {
	quest::signalwith(35188,132,0);
	quest::signalwith(35188,130,10);
	}
	elsif($ulevel <= 49 && $ulevel >= 46) {
	quest::signalwith(35188,132,0);
	quest::signalwith(35188,131,10);
	}
	else {
	quest::signalwith(35188,132,0);
	}
	}