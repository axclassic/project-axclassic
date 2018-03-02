sub EVENT_ZONE {
     if($ulevel <= 55 && $ulevel >= 50) {
    quest::signalwith(170576,496,0);
	quest::signalwith(170576,497,10);
	}
	elsif($ulevel <= 60 && $ulevel >= 56) {
	quest::signalwith(170576,496,0);
	quest::signalwith(170576,498,10);
	}
	elsif($ulevel <= 65 && $ulevel >= 61) {
	quest::signalwith(170576,496,0);
	quest::signalwith(170576,499,10);
	}
	  else {
	quest::signalwith(170576,496,0);
	}
	}