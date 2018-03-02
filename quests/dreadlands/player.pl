sub EVENT_ZONE {
     if($ulevel <= 55 && $ulevel >= 50) {
    quest::signalwith(86164,485,0);
	quest::signalwith(86164,486,10);
	}
	elsif($ulevel <= 56 && $ulevel >= 60) {
	quest::signalwith(86164,485,0);
	quest::signalwith(86164,487,10);
	}
	elsif($ulevel <= 65 && $ulevel >= 61) {
	quest::signalwith(86164,485,0);
	quest::signalwith(86164,488,10);
	}
	
	else {
	quest::signalwith(86164,485,0);
	}
	}