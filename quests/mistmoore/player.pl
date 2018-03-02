sub EVENT_ZONE {
   if($ulevel <= 5 && $ulevel >= 1) {
    quest::signalwith(59185,88,0);
	quest::signalwith(59185,78,10);
	}
	elsif($ulevel <= 10 && $ulevel >= 6) {
	quest::signalwith(59185,88,0);
	quest::signalwith(59185,79,10);
	}
	elsif($ulevel <= 15 && $ulevel >= 11) {
	quest::signalwith(59185,88,0);
	quest::signalwith(59185,80,10);
	}
	elsif($ulevel <= 20 && $ulevel >= 16) {
	quest::signalwith(59185,88,0);
	quest::signalwith(59185,81,10);
	}
	elsif($ulevel <= 25 && $ulevel >= 21) {
	quest::signalwith(59185,88,0);
	quest::signalwith(59185,82,10);
	}
	elsif($ulevel <= 30 && $ulevel >= 26) {
	quest::signalwith(59185,88,0);
	quest::signalwith(59185,83,10);
	}
	elsif($ulevel <= 35 && $ulevel >= 31) {
	quest::signalwith(59185,88,0);
	quest::signalwith(59185,84,10);
	}
	elsif($ulevel <= 40 && $ulevel >= 36) {
	quest::signalwith(59185,88,0);
	quest::signalwith(59185,85,10);
	}
	elsif($ulevel <= 45 && $ulevel >= 41) {
	quest::signalwith(59185,88,0);
	quest::signalwith(59185,86,10);
	}
	elsif($ulevel <= 49 && $ulevel >= 46) {
	quest::signalwith(59185,88,0);
	quest::signalwith(59185,87,10);
	}
	else {
	quest::signalwith(57166,88,0);
	}
	}