##New Easter Event the signals tell the controller for dreadlands zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 50 && $ulevel <= 55) {
    quest::signalwith(86164,485,0);
	quest::signalwith(86164,486,10);
	}
	elsif($ulevel >= 56 && $ulevel <= 60) {
	quest::signalwith(86164,485,0);
	quest::signalwith(86164,487,10);
	}
	elsif($ulevel >= 61 && $ulevel <= 65) {
	quest::signalwith(86164,485,0);
	quest::signalwith(86164,488,10);
	}
	
	else {
	quest::signalwith(86164,485,0);
	}
	}