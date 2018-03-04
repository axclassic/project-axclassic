##New Easter Event the signals tell the controller for Overthere zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 50 && $ulevel <= 55) {
    quest::signalwith(93308,518,0);
	quest::signalwith(93308,519,10);
	}
	elsif($ulevel >= 56 && $ulevel <= 60) {
	quest::signalwith(93308,518,0);
	quest::signalwith(93308,520,10);
	}
	elsif($ulevel >= 61 && $ulevel <= 65) {
	quest::signalwith(93308,518,0);
	quest::signalwith(93308,521,10);
	}
	  else {
	quest::signalwith(93308,518,0);
	}
	}