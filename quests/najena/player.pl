sub EVENT_ZONE {
     if($ulevel <= 5 && $ulevel >= 1) {
    quest::signalwith(44135,364,0);
	quest::signalwith(44135,365,10);
	}
	elsif($ulevel <= 10 && $ulevel >= 6) {
	quest::signalwith(44135,364,0);
	quest::signalwith(44135,366,10);
	}
	elsif($ulevel <= 15 && $ulevel >= 11) {
	quest::signalwith(44135,364,0);
	quest::signalwith(44135,367,10);
	}
	elsif($ulevel <= 20 && $ulevel >= 16) {
	quest::signalwith(44135,364,0);
	quest::signalwith(44135,368,10);
	}
	elsif($ulevel <= 25 && $ulevel >= 21) {
	quest::signalwith(44135,364,0);
	quest::signalwith(44135,369,10);
	}
	elsif($ulevel <= 30 && $ulevel >= 26) {
	quest::signalwith(44135,364,0);
	quest::signalwith(44135,370,10);
	}
	elsif($ulevel <= 35 && $ulevel >= 31) {
	quest::signalwith(44135,364,0);
	quest::signalwith(44135,371,10);
	}
	elsif($ulevel <= 40 && $ulevel >= 36) {
	quest::signalwith(44135,364,0);
	quest::signalwith(44135,372,10);
	}
	elsif($ulevel <= 45 && $ulevel >= 41) {
	quest::signalwith(44135,364,0);
	quest::signalwith(44135,373,10);
	}
	elsif($ulevel <= 49 && $ulevel >= 46) {
	quest::signalwith(44135,364,0);
	quest::signalwith(44135,374,10);
	}
	else {
	quest::signalwith(44135,364,0);
	}
	}