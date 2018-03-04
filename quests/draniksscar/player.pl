##New Easter Event the signals tell the controller for draniksscar zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 50 && $ulevel <= 55) {
    quest::signalwith(302084,474,0);
	quest::signalwith(302084,475,10);
	}
	elsif($ulevel >= 56 && $ulevel <= 60) {
	quest::signalwith(302084,474,0);
	quest::signalwith(302084,476,10);
	}
	elsif($ulevel >= 61 && $ulevel <= 65) {
	quest::signalwith(302084,474,0);
	quest::signalwith(302084,477,10);
	}
	  else {
	quest::signalwith(302084,474,0);
	}
	}