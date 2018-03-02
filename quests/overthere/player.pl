sub EVENT_ZONE {
     if($ulevel <= 55 && $ulevel >= 50) {
    quest::signalwith(93308,518,0);
	quest::signalwith(93308,519,10);
	}
	elsif($ulevel <= 60 && $ulevel >= 56) {
	quest::signalwith(93308,518,0);
	quest::signalwith(93308,520,10);
	}
	elsif($ulevel <= 65 && $ulevel >= 61) {
	quest::signalwith(93308,518,0);
	quest::signalwith(93308,521,10);
	}
	  else {
	quest::signalwith(93308,518,0);
	}
	}