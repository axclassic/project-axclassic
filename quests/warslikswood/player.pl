##New Easter Event the signals tell the controller for Warslikswood zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 50 && $ulevel <= 55) {
    quest::signalwith(79141,507,0);
	quest::signalwith(79141,508,10);
	}
	elsif($ulevel >= 56 && $ulevel <= 60) {
	quest::signalwith(79141,507,0);
	quest::signalwith(79141,509,10);
	}
	elsif($ulevel >= 61 && $ulevel <= 65) {
	quest::signalwith(79141,507,0);
	quest::signalwith(79141,510,10);
	}
	  else {
	quest::signalwith(79141,507,0);
	}
	}