##New Easter Event the signals tell the controller for crushbone zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 1 && $ulevel <= 5) {
    quest::signalwith(58081,77,0);
	quest::signalwith(58081,67,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(58081,77,0);
	quest::signalwith(58081,68,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(58081,77,0);
	quest::signalwith(58081,69,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(58081,77,0);
	quest::signalwith(58081,70,10);
	}
	elsif($ulevel >= 21 && $ulevel <= 25) {
	quest::signalwith(58081,77,0);
	quest::signalwith(58081,71,10);
	}
	elsif($ulevel >= 26 && $ulevel <= 30) {
	quest::signalwith(58081,77,0);
	quest::signalwith(58081,72,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(58081,77,0);
	quest::signalwith(58081,73,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(58081,77,0);
	quest::signalwith(58081,74,10);
	}
	elsif($ulevel >= 41&& $ulevel <= 45) {
	quest::signalwith(58081,77,0);
	quest::signalwith(58081,75,10);
	}
	elsif($ulevel >= 44 && $ulevel <= 49) {
	quest::signalwith(58081,77,0);
	quest::signalwith(58081,76,10);
	}
	else {
	quest::signalwith(58081,77,0);
	}
	}