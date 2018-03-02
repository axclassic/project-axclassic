sub EVENT_ENTERZONE {
     if($ulevel <= 5 && $ulevel >= 1) {
    quest::signalwith(16057,441,0);
	quest::signalwith(16057,442,10);
	}
	elsif($ulevel <= 10 && $ulevel >= 6) {
	quest::signalwith(16057,441,0);
	quest::signalwith(16057,443,10);
	}
	elsif($ulevel <= 15 && $ulevel >= 11) {
	quest::signalwith(16057,441,0);
	quest::signalwith(16057,444,10);
	}
	elsif($ulevel <= 20 && $ulevel >= 16) {
	quest::signalwith(16057,441,0);
	quest::signalwith(16057,445,10);
	}
	elsif($ulevel <= 25 && $ulevel >= 21) {
	quest::signalwith(16057,441,0);
	quest::signalwith(16057,446,10);
	}
	elsif($ulevel <= 30 && $ulevel >= 26) {
	quest::signalwith(16057,441,0);
	quest::signalwith(16057,447,10);
	}
	elsif($ulevel <= 35 && $ulevel >= 31) {
	quest::signalwith(16057,441,0);
	quest::signalwith(16057,448,10);
	}
	elsif($ulevel <= 40 && $ulevel >= 36) {
	quest::signalwith(16057,441,0);
	quest::signalwith(16057,449,10);
	}
	elsif($ulevel <= 45 && $ulevel >= 41) {
	quest::signalwith(16057,441,0);
	quest::signalwith(16057,450,10);
	}
	elsif($ulevel <= 49 && $ulevel >= 46) {
	quest::signalwith(16057,441,0);
	quest::signalwith(16057,451,10);
	}
	else {
	quest::signalwith(16057,441,0);
	}
	}