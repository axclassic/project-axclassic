##New Easter Event the signals tell the controller for eastkarana zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 1 && $ulevel <= 5) {
    quest::signalwith(15218,209,0);
	quest::signalwith(15218,210,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(15218,209,0);
	quest::signalwith(15218,211,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(15218,209,0);
	quest::signalwith(15218,212,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(15218,209,0);
	quest::signalwith(15218,213,10);
	}
	elsif($ulevel >= 21 && $ulevel <= 25) {
	quest::signalwith(15218,209,0);
	quest::signalwith(15218,214,10);
	}
	elsif($ulevel >= 26 && $ulevel <= 30) {
	quest::signalwith(15218,209,0);
	quest::signalwith(15218,215,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(15218,209,0);
	quest::signalwith(15218,216,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(15218,209,0);
	quest::signalwith(15218,217,10);
	}
	elsif($ulevel >= 41 && $ulevel <= 45) {
	quest::signalwith(15218,209,0);
	quest::signalwith(15218,218,10);
	}
	elsif($ulevel >= 46 && $ulevel <= 49) {
	quest::signalwith(15218,209,0);
	quest::signalwith(15218,219,10);
	}
	else {
	quest::signalwith(15218,209,0);
	}
	}