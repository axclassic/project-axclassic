##New Easter Event the signals tell the controller for South Ro zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 1 && $ulevel <= 5) {
    quest::signalwith(35188,132,0);
	quest::signalwith(35188,122,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(35188,132,0);
	quest::signalwith(35188,123,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(35188,132,0);
	quest::signalwith(35188,124,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(35188,132,0);
	quest::signalwith(35188,125,10);
	}
	elsif($ulevel >= 21 && $ulevel <= 25) {
	quest::signalwith(35188,132,0);
	quest::signalwith(35188,126,10);
	}
	elsif($ulevel >= 26 && $ulevel <= 30) {
	quest::signalwith(35188,132,0);
	quest::signalwith(35188,127,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(35188,132,0);
	quest::signalwith(35188,128,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(35188,132,0);
	quest::signalwith(35188,129,10);
	}
	elsif($ulevel >= 41 && $ulevel <= 45) {
	quest::signalwith(35188,132,0);
	quest::signalwith(35188,130,10);
	}
	elsif($ulevel >= 46 && $ulevel <= 49) {
	quest::signalwith(35188,132,0);
	quest::signalwith(35188,131,10);
	}
	else {
	quest::signalwith(35188,132,0);
	}
	}