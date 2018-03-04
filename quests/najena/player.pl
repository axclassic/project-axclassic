##New Easter Event the signals tell the controller for Najena zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 1 && $ulevel <= 6) {
    quest::signalwith(44135,364,0);
	quest::signalwith(44135,365,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(44135,364,0);
	quest::signalwith(44135,366,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(44135,364,0);
	quest::signalwith(44135,367,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(44135,364,0);
	quest::signalwith(44135,368,10);
	}
	elsif($ulevel >= 21 && $ulevel <= 25) {
	quest::signalwith(44135,364,0);
	quest::signalwith(44135,369,10);
	}
	elsif($ulevel >= 26 && $ulevel <= 30) {
	quest::signalwith(44135,364,0);
	quest::signalwith(44135,370,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(44135,364,0);
	quest::signalwith(44135,371,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(44135,364,0);
	quest::signalwith(44135,372,10);
	}
	elsif($ulevel >= 41 && $ulevel <= 45) {
	quest::signalwith(44135,364,0);
	quest::signalwith(44135,373,10);
	}
	elsif($ulevel >= 46 && $ulevel <= 49) {
	quest::signalwith(44135,364,0);
	quest::signalwith(44135,374,10);
	}
	else {
	quest::signalwith(44135,364,0);
	}
	}