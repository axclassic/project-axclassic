##New Easter Event the signals tell the controller for Kurns Tower zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 1 && $ulevel <= 5) {
    quest::signalwith(97104,276,0);
	quest::signalwith(97104,277,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(97104,276,0);
	quest::signalwith(97104,278,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(97104,276,0);
	quest::signalwith(97104,279,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(97104,276,0);
	quest::signalwith(97104,280,10);
	}
	elsif($ulevel >= 21 && $ulevel <= 25) {
	quest::signalwith(97104,276,0);
	quest::signalwith(97104,281,10);
	}
	elsif($ulevel >= 26 && $ulevel <= 30) {
	quest::signalwith(97104,276,0);
	quest::signalwith(97104,282,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(97104,276,0);
	quest::signalwith(97104,283,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(97104,276,0);
	quest::signalwith(97104,284,10);
	}
	elsif($ulevel >= 41 && $ulevel <= 45) {
	quest::signalwith(97104,276,0);
	quest::signalwith(97104,285,10);
	}
	elsif($ulevel >= 46 && $ulevel <= 49) {
	quest::signalwith(97104,276,0);
	quest::signalwith(97104,286,10);
	}
	else {
	quest::signalwith(97104,276,0);
	}
	}