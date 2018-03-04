##New Easter Event the signals tell the controller for Kaesora zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 1 && $ulevel <= 5) {
    quest::signalwith(88116,232,0);
	quest::signalwith(88116,233,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(88116,232,0);
	quest::signalwith(88116,234,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(88116,232,0);
	quest::signalwith(88116,235,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(88116,232,0);
	quest::signalwith(88116,236,10);
	}
	elsif($ulevel >= 21 && $ulevel <= 25) {
	quest::signalwith(88116,232,0);
	quest::signalwith(88116,237,10);
	}
	elsif($ulevel >= 26 && $ulevel <= 30) {
	quest::signalwith(88116,232,0);
	quest::signalwith(88116,238,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(88116,232,0);
	quest::signalwith(88116,239,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(88116,232,0);
	quest::signalwith(88116,240,10);
	}
	elsif($ulevel >= 41 && $ulevel <= 45) {
	quest::signalwith(88116,232,0);
	quest::signalwith(88116,241,10);
	}
	elsif($ulevel >= 46 && $ulevel <= 49) {
	quest::signalwith(88116,232,0);
	quest::signalwith(88116,242,10);
	}
	else {
	quest::signalwith(88116,232,0);
	}
	}