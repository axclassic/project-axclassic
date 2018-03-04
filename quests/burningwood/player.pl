##New Easter Event the signals tell the controller for burningwood zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 50 && $ulevel <= 55) {
    quest::signalwith(87168,463,0);
	quest::signalwith(87168,464,10);
	}
	elsif($ulevel >= 55 && $ulevel <= 60) {
	quest::signalwith(87168,463,0);
	quest::signalwith(87168,465,10);
	}
	elsif($ulevel >= 61 && $ulevel <= 65) {
	quest::signalwith(87168,463,0);
	quest::signalwith(87168,466,10);
	}
	  else {
	quest::signalwith(87168,463,0);
	}
	}