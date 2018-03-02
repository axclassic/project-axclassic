sub EVENT_ZONE {
     if($ulevel <= 5 && $ulevel >= 1) {
    quest::signalwith(51175,408,0);
	quest::signalwith(51175,409,10);
	}
	elsif($ulevel <= 10 && $ulevel >= 6) {
	quest::signalwith(51175,408,0);
	quest::signalwith(51175,410,10);
	}
	elsif($ulevel <= 15 && $ulevel >= 11) {
	quest::signalwith(51175,408,0);
	quest::signalwith(51175,411,10);
	}
	elsif($ulevel <= 20 && $ulevel >= 16) {
	quest::signalwith(51175,408,0);
	quest::signalwith(51175,412,10);
	}
	elsif($ulevel <= 25 && $ulevel >= 21) {
	quest::signalwith(51175,408,0);
	quest::signalwith(51175,413,10);
	}
	elsif($ulevel <= 30 && $ulevel >= 26) {
	quest::signalwith(51175,408,0);
	quest::signalwith(51175,414,10);
	}
	elsif($ulevel <= 35 && $ulevel >= 31) {
	quest::signalwith(51175,408,0);
	quest::signalwith(51175,415,10);
	}
	elsif($ulevel <= 40 && $ulevel >= 36) {
	quest::signalwith(51175,408,0);
	quest::signalwith(51175,416,10);
	}
	elsif($ulevel <= 45 && $ulevel >= 41) {
	quest::signalwith(51175,408,0);
	quest::signalwith(51175,417,10);
	}
	elsif($ulevel <= 49 && $ulevel >= 46) {
	quest::signalwith(51175,408,0);
	quest::signalwith(51175,418,10);
	}
	else {
	quest::signalwith(51175,408,0);
	}
	}