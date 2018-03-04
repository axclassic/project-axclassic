##New Easter Event the signals tell the controller for cauldron zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 1 && $ulevel <= 5) {
    quest::signalwith(70090,66,0);
	quest::signalwith(70090,56,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(70090,66,0);
	quest::signalwith(70090,57,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(70090,66,0);
	quest::signalwith(70090,58,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(70090,66,0);
	quest::signalwith(70090,59,10);
	}
	elsif($ulevel >= 21 && $ulevel <= 25) {
	quest::signalwith(70090,66,0);
	quest::signalwith(70090,60,10);
	}
	elsif($ulevel >= 26 && $ulevel <= 30) {
	quest::signalwith(70090,66,0);
	quest::signalwith(70090,61,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(70090,66,0);
	quest::signalwith(70090,62,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(70090,66,0);
	quest::signalwith(70090,63,10);
	}
	elsif($ulevel >= 41 && $ulevel <= 45) {
	quest::signalwith(70090,66,0);
	quest::signalwith(70090,64,10);
	}
	elsif($ulevel >= 46 && $ulevel <= 49) {
	quest::signalwith(70090,66,0);
	quest::signalwith(70090,65,10);
	}
	else {
	quest::signalwith(70090,66,0);
	}
	}
