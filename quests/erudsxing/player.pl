##New Easter Event the signals tell the controller for eruds crossing zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 1 && $ulevel <= 5) {
    quest::signalwith(98080,342,0);
	quest::signalwith(98080,343,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(98080,342,0);
	quest::signalwith(98080,344,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(98080,342,0);
	quest::signalwith(98080,345,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(98080,342,0);
	quest::signalwith(98080,346,10);
	}
	elsif($ulevel >= 21 && $ulevel <= 25) {
	quest::signalwith(98080,342,0);
	quest::signalwith(98080,347,10);
	}
	elsif($ulevel >= 26 && $ulevel <= 30) {
	quest::signalwith(98080,342,0);
	quest::signalwith(98080,348,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(98080,342,0);
	quest::signalwith(98080,349,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(98080,342,0);
	quest::signalwith(98080,350,10);
	}
	elsif($ulevel >= 41 && $ulevel <= 45) {
	quest::signalwith(98080,342,0);
	quest::signalwith(98080,351,10);
	}
	elsif($ulevel >= 46 && $ulevel <= 49) {
	quest::signalwith(98080,342,0);
	quest::signalwith(98080,352,10);
	}
	else {
	quest::signalwith(98080,331,0);
	}
	}