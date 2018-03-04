##New Easter Event the signals tell the controller for Jaggedpine zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 1 && $ulevel <= 5) {
    quest::signalwith(181546,187,0);
	quest::signalwith(181546,188,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(181546,187,0);
	quest::signalwith(181546,189,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(181546,187,0);
	quest::signalwith(181546,190,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(181546,187,0);
	quest::signalwith(181546,191,10);
	}
	elsif($ulevel >= 21 && $ulevel <= 25) {
	quest::signalwith(181546,187,0);
	quest::signalwith(181546,192,10);
	}
	elsif($ulevel >= 26 && $ulevel <= 30) {
	quest::signalwith(181546,187,0);
	quest::signalwith(181546,193,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(181546,187,0);
	quest::signalwith(181546,194,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(181546,187,0);
	quest::signalwith(181546,195,10);
	}
	elsif($ulevel >= 41 && $ulevel <= 45) {
	quest::signalwith(181546,187,0);
	quest::signalwith(181546,196,10);
	}
	elsif($ulevel >= 46 && $ulevel <= 49) {
	quest::signalwith(181546,187,0);
	quest::signalwith(181546,197,10);
	}
	else {
	quest::signalwith(181546,187,0);
	}
	}