sub EVENT_ZONE {
     if($ulevel <= 55 && $ulevel >= 50) {
    quest::signalwith(92205,529,0);
	quest::signalwith(92205,530,10);
	}
	elsif($ulevel <= 60 && $ulevel >= 56) {
	quest::signalwith(92205,529,0);
	quest::signalwith(92205,531,10);
	}
	elsif($ulevel <= 65 && $ulevel >= 61) {
	quest::signalwith(92205,529,0);
	quest::signalwith(92205,532,10);
	}
	  else {
	quest::signalwith(92205,529,0);
	}
	}