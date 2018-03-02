sub EVENT_ENTERZONE {
     if($ulevel <= 5 && $ulevel >= 1) {
    quest::signalwith(58081,77,0);
	quest::signalwith(58081,67,10);
	}
	elsif($ulevel <= 10 && $ulevel >= 6) {
	quest::signalwith(58081,77,0);
	quest::signalwith(58081,68,10);
	}
	elsif($ulevel <= 15 && $ulevel >= 11) {
	quest::signalwith(58081,77,0);
	quest::signalwith(58081,69,10);
	}
	elsif($ulevel <= 20 && $ulevel >= 16) {
	quest::signalwith(58081,77,0);
	quest::signalwith(58081,70,10);
	}
	elsif($ulevel <= 25 && $ulevel >= 21) {
	quest::signalwith(58081,77,0);
	quest::signalwith(58081,71,10);
	}
	elsif($ulevel <= 30 && $ulevel >= 26) {
	quest::signalwith(58081,77,0);
	quest::signalwith(58081,72,10);
	}
	elsif($ulevel <= 35 && $ulevel >= 31) {
	quest::signalwith(58081,77,0);
	quest::signalwith(58081,73,10);
	}
	elsif($ulevel <= 40 && $ulevel >= 36) {
	quest::signalwith(58081,77,0);
	quest::signalwith(58081,74,10);
	}
	elsif($ulevel <= 45 && $ulevel >= 41) {
	quest::signalwith(58081,77,0);
	quest::signalwith(58081,75,10);
	}
	elsif($ulevel <= 49 && $ulevel >= 46) {
	quest::signalwith(58081,77,0);
	quest::signalwith(58081,76,10);
	}
	else {
	quest::signalwith(58081,77,0);
	}
	}