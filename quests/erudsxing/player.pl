sub EVENT_ZONE {
     if($ulevel <= 5 && $ulevel >= 1) {
    quest::signalwith(98080,342,0);
	quest::signalwith(98080,343,10);
	}
	elsif($ulevel <= 10 && $ulevel >= 6) {
	quest::signalwith(98080,342,0);
	quest::signalwith(98080,344,10);
	}
	elsif($ulevel <= 15 && $ulevel >= 11) {
	quest::signalwith(98080,342,0);
	quest::signalwith(98080,345,10);
	}
	elsif($ulevel <= 20 && $ulevel >= 16) {
	quest::signalwith(98080,342,0);
	quest::signalwith(98080,346,10);
	}
	elsif($ulevel <= 25 && $ulevel >= 21) {
	quest::signalwith(98080,342,0);
	quest::signalwith(98080,347,10);
	}
	elsif($ulevel <= 30 && $ulevel >= 26) {
	quest::signalwith(98080,342,0);
	quest::signalwith(98080,348,10);
	}
	elsif($ulevel <= 35 && $ulevel >= 31) {
	quest::signalwith(98080,342,0);
	quest::signalwith(98080,349,10);
	}
	elsif($ulevel <= 40 && $ulevel >= 36) {
	quest::signalwith(98080,342,0);
	quest::signalwith(98080,350,10);
	}
	elsif($ulevel <= 45 && $ulevel >= 41) {
	quest::signalwith(98080,342,0);
	quest::signalwith(98080,351,10);
	}
	elsif($ulevel <= 49 && $ulevel >= 46) {
	quest::signalwith(98080,342,0);
	quest::signalwith(98080,352,10);
	}
	else {
	quest::signalwith(98080,331,0);
	}
	}