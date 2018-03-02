sub EVENT_ENTERZONE {
     if($ulevel <= 5 && $ulevel >= 1) {
    quest::signalwith(88116,232,0);
	quest::signalwith(88116,233,10);
	}
	elsif($ulevel <= 10 && $ulevel >= 6) {
	quest::signalwith(88116,232,0);
	quest::signalwith(88116,234,10);
	}
	elsif($ulevel <= 15 && $ulevel >= 11) {
	quest::signalwith(88116,232,0);
	quest::signalwith(88116,235,10);
	}
	elsif($ulevel <= 20 && $ulevel >= 16) {
	quest::signalwith(88116,232,0);
	quest::signalwith(88116,236,10);
	}
	elsif($ulevel <= 25 && $ulevel >= 21) {
	quest::signalwith(88116,232,0);
	quest::signalwith(88116,237,10);
	}
	elsif($ulevel <= 30 && $ulevel >= 26) {
	quest::signalwith(88116,232,0);
	quest::signalwith(88116,238,10);
	}
	elsif($ulevel <= 35 && $ulevel >= 31) {
	quest::signalwith(88116,232,0);
	quest::signalwith(88116,239,10);
	}
	elsif($ulevel <= 40 && $ulevel >= 36) {
	quest::signalwith(88116,232,0);
	quest::signalwith(88116,240,10);
	}
	elsif($ulevel <= 45 && $ulevel >= 41) {
	quest::signalwith(88116,232,0);
	quest::signalwith(88116,241,10);
	}
	elsif($ulevel <= 49 && $ulevel >= 46) {
	quest::signalwith(88116,232,0);
	quest::signalwith(88116,242,10);
	}
	else {
	quest::signalwith(88116,232,0);
	}
	}