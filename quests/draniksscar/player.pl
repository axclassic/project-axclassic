sub EVENT_ZONE {
     if($ulevel <= 55 && $ulevel >= 50) {
    quest::signalwith(302084,474,0);
	quest::signalwith(302084,475,10);
	}
	elsif($ulevel <= 60 && $ulevel >= 56) {
	quest::signalwith(302084,474,0);
	quest::signalwith(302084,476,10);
	}
	elsif($ulevel <= 65 && $ulevel >= 61) {
	quest::signalwith(302084,474,0);
	quest::signalwith(302084,477,10);
	}
	  else {
	quest::signalwith(302084,474,0);
	}
	}