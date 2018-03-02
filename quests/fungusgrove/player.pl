sub EVENT_ZONE {
     if($ulevel <= 55 && $ulevel >= 50) {
    quest::signalwith(157425,485,0);
	quest::signalwith(157425,486,10);
	}
	elsif($ulevel <= 60 && $ulevel >= 66) {
	quest::signalwith(157425,485,0);
	quest::signalwith(157425,487,10);
	}
	elsif($ulevel <= 65 && $ulevel >= 61) {
	quest::signalwith(157425,485,0);
	quest::signalwith(157425,488,10);
	}
	
	else {
	quest::signalwith(157425,485,0);
	}
	}