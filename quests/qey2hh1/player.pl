sub EVENT_ENTERZONE {
     if($ulevel <= 5 && $ulevel >= 1) {
    quest::signalwith(12215,165,0);
	quest::signalwith(12215,166,10);
	}
	elsif($ulevel <= 10 && $ulevel >= 6) {
	quest::signalwith(12215,165,0);
	quest::signalwith(12215,167,10);
	}
	elsif($ulevel <= 15 && $ulevel >= 11) {
	quest::signalwith(12215,165,0);
	quest::signalwith(12215,168,10);
	}
	elsif($ulevel <= 20 && $ulevel >= 16) {
	quest::signalwith(12215,165,0);
	quest::signalwith(12215,169,10);
	}
	elsif($ulevel <= 25 && $ulevel >= 21) {
	quest::signalwith(12215,165,0);
	quest::signalwith(12215,170,10);
	}
	elsif($ulevel <= 30 && $ulevel >= 26) {
	quest::signalwith(12215,165,0);
	quest::signalwith(12215,171,10);
	}
	elsif($ulevel <= 35 && $ulevel >= 31) {
	quest::signalwith(12215,165,0);
	quest::signalwith(12215,172,10);
	}
	elsif($ulevel <= 40 && $ulevel >= 36) {
	quest::signalwith(12215,165,0);
	quest::signalwith(12215,173,10);
	}
	elsif($ulevel <= 45 && $ulevel >= 41) {
	quest::signalwith(12215,165,0);
	quest::signalwith(12215,174,10);
	}
	elsif($ulevel <= 49 && $ulevel >= 46) {
	quest::signalwith(12215,165,0);
	quest::signalwith(12215,175,10);
	}
	else {
	quest::signalwith(12215,165,0);
	}
	}