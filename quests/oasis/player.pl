sub EVENT_ZONE {
     if($ulevel <= 5 && $ulevel >= 1) {
    quest::signalwith(37191,143,0);
	quest::signalwith(37191,133,10);
	}
	elsif($ulevel <= 10 && $ulevel >= 6) {
	quest::signalwith(37191,143,0);
	quest::signalwith(37191,134,10);
	}
	elsif($ulevel <= 15 && $ulevel >= 11) {
	quest::signalwith(37191,143,0);
	quest::signalwith(37191,135,10);
	}
	elsif($ulevel <= 20 && $ulevel >= 16) {
	quest::signalwith(37191,143,0);
	quest::signalwith(37191,136,10);
	}
	elsif($ulevel <= 25 && $ulevel >= 21) {
	quest::signalwith(37191,143,0);
	quest::signalwith(37191,137,10);
	}
	elsif($ulevel <= 30 && $ulevel >= 26) {
	quest::signalwith(37191,143,0);
	quest::signalwith(37191,138,10);
	}
	elsif($ulevel <= 35 && $ulevel >= 31) {
	quest::signalwith(37191,143,0);
	quest::signalwith(37191,139,10);
	}
	elsif($ulevel <= 40 && $ulevel >= 36) {
	quest::signalwith(37191,143,0);
	quest::signalwith(37191,140,10);
	}
	elsif($ulevel <= 45 && $ulevel >= 41) {
	quest::signalwith(37191,143,0);
	quest::signalwith(37191,141,10);
	}
	elsif($ulevel <= 49 && $ulevel >= 46) {
	quest::signalwith(37191,143,0);
	quest::signalwith(37191,142,10);
	}
	else {
	quest::signalwith(37191,143,0);
	}
	}