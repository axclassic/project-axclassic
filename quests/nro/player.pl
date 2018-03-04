##New Easter Event the signals tell the controller for North Ro zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 1 && $ulevel <= 5) {
    quest::signalwith(34178,121,0);
	quest::signalwith(34178,100,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(34178,121,0);
	quest::signalwith(34178,111,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(34178,121,0);
	quest::signalwith(34178,112,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(34178,121,0);
	quest::signalwith(34178,113,10);
	}
	elsif($ulevel >= 21 && $ulevel <= 25) {
	quest::signalwith(34178,121,0);
	quest::signalwith(34178,114,10);
	}
	elsif($ulevel >= 26 && $ulevel <= 30) {
	quest::signalwith(34178,121,0);
	quest::signalwith(34178,115,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(34178,121,0);
	quest::signalwith(34178,116,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(34178,121,0);
	quest::signalwith(34178,117,10);
	}
	elsif($ulevel >= 41 && $ulevel <= 45) {
	quest::signalwith(34178,121,0);
	quest::signalwith(34178,118,10);
	}
	elsif($ulevel >= 46 && $ulevel <= 49) {
	quest::signalwith(34178,121,0);
	quest::signalwith(34178,119,10);
	}
	else {
	quest::signalwith(34178,121,0);
	}
	}