sub EVENT_EBTERZONE {
     if($ulevel <= 5 && $ulevel >= 1) {
    quest::signalwith(70090,66,0);
	quest::signalwith(70090,56,10);
	}
	elsif($ulevel <= 10 && $ulevel >= 6) {
	quest::signalwith(70090,66,0);
	quest::signalwith(70090,57,10);
	}
	elsif($ulevel <= 15 && $ulevel >= 11) {
	quest::signalwith(70090,66,0);
	quest::signalwith(70090,58,10);
	}
	elsif($ulevel <= 20 && $ulevel >= 16) {
	quest::signalwith(70090,66,0);
	quest::signalwith(70090,59,10);
	}
	elsif($ulevel <= 25 && $ulevel >= 21) {
	quest::signalwith(70090,66,0);
	quest::signalwith(70090,60,10);
	}
	elsif($ulevel <= 30 && $ulevel >= 26) {
	quest::signalwith(70090,66,0);
	quest::signalwith(70090,61,10);
	}
	elsif($ulevel <= 35 && $ulevel >= 31) {
	quest::signalwith(70090,66,0);
	quest::signalwith(70090,62,10);
	}
	elsif($ulevel <= 40 && $ulevel >= 36) {
	quest::signalwith(70090,66,0);
	quest::signalwith(70090,63,10);
	}
	elsif($ulevel <= 45 && $ulevel >= 41) {
	quest::signalwith(70090,66,0);
	quest::signalwith(70090,64,10);
	}
	elsif($ulevel <= 49 && $ulevel >= 46) {
	quest::signalwith(70090,66,0);
	quest::signalwith(70090,65,10);
	}
	else {
	quest::signalwith(70090,66,0);
	}
	}