sub EVENT_ENTERZONE {
     if($ulevel >= 1 && $ulevel <= 5) {
    quest::signalwith(12215,165,0);
	quest::signalwith(12215,166,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(12215,165,0);
	quest::signalwith(12215,167,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(12215,165,0);
	quest::signalwith(12215,168,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(12215,165,0);
	quest::signalwith(12215,169,10);
	}
	elsif($ulevel >= 21 && $ulevel <= 25) {
	quest::signalwith(12215,165,0);
	quest::signalwith(12215,170,10);
	}
	elsif($ulevel >= 26 && $ulevel <= 30) {
	quest::signalwith(12215,165,0);
	quest::signalwith(12215,171,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(12215,165,0);
	quest::signalwith(12215,172,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(12215,165,0);
	quest::signalwith(12215,173,10);
	}
	elsif($ulevel >= 41 && $ulevel <= 45) {
	quest::signalwith(12215,165,0);
	quest::signalwith(12215,174,10);
	}
	elsif($ulevel >= 46 && $ulevel <= 49) {
	quest::signalwith(12215,165,0);
	quest::signalwith(12215,175,10);
	}
	else {
	quest::signalwith(12215,165,0);
	}
	}