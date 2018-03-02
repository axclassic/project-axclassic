sub EVENT_ENTERZONE {
     if($ulevel <= 5 && $ulevel >= 1) {
    quest::signalwith(34178,121,0);
	quest::signalwith(34178,100,10);
	}
	elsif($ulevel <= 10 && $ulevel >= 6) {
	quest::signalwith(34178,121,0);
	quest::signalwith(34178,111,10);
	}
	elsif($ulevel <= 15 && $ulevel >= 11) {
	quest::signalwith(34178,121,0);
	quest::signalwith(34178,112,10);
	}
	elsif($ulevel <= 20 && $ulevel >= 16) {
	quest::signalwith(34178,121,0);
	quest::signalwith(34178,113,10);
	}
	elsif($ulevel <= 25 && $ulevel >= 21) {
	quest::signalwith(34178,121,0);
	quest::signalwith(34178,114,10);
	}
	elsif($ulevel <= 30 && $ulevel >= 26) {
	quest::signalwith(34178,121,0);
	quest::signalwith(34178,115,10);
	}
	elsif($ulevel <= 35 && $ulevel >= 31) {
	quest::signalwith(34178,121,0);
	quest::signalwith(34178,116,10);
	}
	elsif($ulevel <= 40 && $ulevel >= 36) {
	quest::signalwith(34178,121,0);
	quest::signalwith(34178,117,10);
	}
	elsif($ulevel <= 45 && $ulevel >= 41) {
	quest::signalwith(34178,121,0);
	quest::signalwith(34178,118,10);
	}
	elsif($ulevel <= 49 && $ulevel >= 46) {
	quest::signalwith(34178,121,0);
	quest::signalwith(34178,119,10);
	}
	else {
	quest::signalwith(34178,121,0);
	}
	}