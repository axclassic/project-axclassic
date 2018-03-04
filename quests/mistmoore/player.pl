##New Easter Event the signals tell the controller for mistmoore zone what level NPC to spawn
sub EVENT_ENTERZONE {
   if($ulevel >= 1 && $ulevel <= 5) {
    quest::signalwith(59185,88,0);
	quest::signalwith(59185,78,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(59185,88,0);
	quest::signalwith(59185,79,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(59185,88,0);
	quest::signalwith(59185,80,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(59185,88,0);
	quest::signalwith(59185,81,10);
	}
	elsif($ulevel >= 21 && $ulevel <= 25) {
	quest::signalwith(59185,88,0);
	quest::signalwith(59185,82,10);
	}
	elsif($ulevel >= 26 && $ulevel <= 30) {
	quest::signalwith(59185,88,0);
	quest::signalwith(59185,83,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(59185,88,0);
	quest::signalwith(59185,84,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(59185,88,0);
	quest::signalwith(59185,85,10);
	}
	elsif($ulevel >= 41 && $ulevel <= 45) {
	quest::signalwith(59185,88,0);
	quest::signalwith(59185,86,10);
	}
	elsif($ulevel >= 46 && $ulevel <= 49) {
	quest::signalwith(59185,88,0);
	quest::signalwith(59185,87,10);
	}
	else {
	quest::signalwith(57166,88,0);
	}
	}