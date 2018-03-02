sub EVENT_ZONE {
     if($ulevel <= 55 && $ulevel >= 50) {
    quest::signalwith(87168,463,0);
	quest::signalwith(87168,464,10);
	}
	elsif($ulevel <= 60 && $ulevel >= 56) {
	quest::signalwith(87168,463,0);
	quest::signalwith(87168,465,10);
	}
	elsif($ulevel <= 65 && $ulevel >= 61) {
	quest::signalwith(87168,463,0);
	quest::signalwith(87168,466,10);
	}
	  else {
	quest::signalwith(87168,463,0);
	}
	}