##New Easter Event the signals tell the controller for southkarana zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 1 && $ulevel <= 5) {
    quest::signalwith(14192,419,0);
	quest::signalwith(14192,420,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(14192,419,0);
	quest::signalwith(14192,421,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(14192,419,0);
	quest::signalwith(14192,422,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(14192,419,0);
	quest::signalwith(14192,423,10);
	}
	elsif($ulevel >= 21 && $ulevel <= 25) {
	quest::signalwith(14192,419,0);
	quest::signalwith(14192,424,10);
	}
	elsif($ulevel >= 26 && $ulevel <= 30) {
	quest::signalwith(14192,419,0);
	quest::signalwith(14192,425,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(14192,419,0);
	quest::signalwith(14192,426,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(14192,419,0);
	quest::signalwith(14192,427,10);
	}
	elsif($ulevel >= 41 && $ulevel <= 45) {
	quest::signalwith(14192,419,0);
	quest::signalwith(14192,428,10);
	}
	elsif($ulevel >= 46 && $ulevel <= 49) {
	quest::signalwith(14192,419,0);
	quest::signalwith(14192,429,10);
	}
	else {
	quest::signalwith(14192,419,0);
	}
	}