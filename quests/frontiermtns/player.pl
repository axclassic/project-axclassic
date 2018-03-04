##New Easter Event the signals tell the controller for Frontier Mountains zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 50 && $ulevel <= 55) {
    quest::signalwith(92205,529,0);
	quest::signalwith(92205,530,10);
	}
	elsif($ulevel >= 56 && $ulevel <= 60) {
	quest::signalwith(92205,529,0);
	quest::signalwith(92205,531,10);
	}
	elsif($ulevel >= 61 && $ulevel <= 65) {
	quest::signalwith(92205,529,0);
	quest::signalwith(92205,532,10);
	}
	  else {
	quest::signalwith(92205,529,0);
	}
	}