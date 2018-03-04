##New Easter Event the signals tell the controller for twilight zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 50 && $ulevel <= 55) {
    quest::signalwith(170576,496,0);
	quest::signalwith(170576,497,10);
	}
	elsif($ulevel >= 51 && $ulevel <= 55) {
	quest::signalwith(170576,496,0);
	quest::signalwith(170576,498,10);
	}
	elsif($ulevel >= 61 && $ulevel <= 65) {
	quest::signalwith(170576,496,0);
	quest::signalwith(170576,499,10);
	}
	  else {
	quest::signalwith(170576,496,0);
	}
	}