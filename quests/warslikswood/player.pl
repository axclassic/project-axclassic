sub EVENT_ENTERZONE {
     if($ulevel <= 55 && $ulevel >= 50) {
    quest::signalwith(79141,507,0);
	quest::signalwith(79141,508,10);
	}
	elsif($ulevel <= 60 && $ulevel >= 56) {
	quest::signalwith(79141,507,0);
	quest::signalwith(79141,509,10);
	}
	elsif($ulevel <= 65 && $ulevel >= 61) {
	quest::signalwith(79141,507,0);
	quest::signalwith(79141,510,10);
	}
	  else {
	quest::signalwith(79141,507,0);
	}
	}