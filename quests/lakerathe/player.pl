##New Easter Event the signals tell the controller for Lake Rathe zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 1 && $ulevel <= 5) {
    quest::signalwith(51175,408,0);
	quest::signalwith(51175,409,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(51175,408,0);
	quest::signalwith(51175,410,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(51175,408,0);
	quest::signalwith(51175,411,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(51175,408,0);
	quest::signalwith(51175,412,10);
	}
	elsif($ulevel >= 21 && $ulevel <= 25) {
	quest::signalwith(51175,408,0);
	quest::signalwith(51175,413,10);
	}
	elsif($ulevel >= 26 && $ulevel <= 30) {
	quest::signalwith(51175,408,0);
	quest::signalwith(51175,414,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(51175,408,0);
	quest::signalwith(51175,415,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(51175,408,0);
	quest::signalwith(51175,416,10);
	}
	elsif($ulevel >= 41 && $ulevel <= 45 {
	quest::signalwith(51175,408,0);
	quest::signalwith(51175,417,10);
	}
	elsif($ulevel >= 46 && $ulevel <= 49) {
	quest::signalwith(51175,408,0);
	quest::signalwith(51175,418,10);
	}
	else {
	quest::signalwith(51175,408,0);
	}
	}