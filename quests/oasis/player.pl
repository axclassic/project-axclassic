##New Easter Event the signals tell the controller for Oasis zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 1 && $ulevel <= 5) {
    quest::signalwith(37191,143,0);
	quest::signalwith(37191,133,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(37191,143,0);
	quest::signalwith(37191,134,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(37191,143,0);
	quest::signalwith(37191,135,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(37191,143,0);
	quest::signalwith(37191,136,10);
	}
	elsif($ulevel >= 21 && $ulevel <= 25) {
	quest::signalwith(37191,143,0);
	quest::signalwith(37191,137,10);
	}
	elsif($ulevel >= 26 && $ulevel <= 30) {
	quest::signalwith(37191,143,0);
	quest::signalwith(37191,138,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(37191,143,0);
	quest::signalwith(37191,139,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(37191,143,0);
	quest::signalwith(37191,140,10);
	}
	elsif($ulevel >= 41 && $ulevel <= 45) {
	quest::signalwith(37191,143,0);
	quest::signalwith(37191,141,10);
	}
	elsif($ulevel >= 46 && $ulevel <= 49) {
	quest::signalwith(37191,143,0);
	quest::signalwith(37191,142,10);
	}
	else {
	quest::signalwith(37191,143,0);
	}
	}