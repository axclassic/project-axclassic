sub EVENT_ENTERZONE {
     if($ulevel <= 5 && $ulevel >= 1) {
    quest::signalwith(22261,110,0);
	quest::signalwith(22261,100,10);
	}
	elsif($ulevel <= 10 && $ulevel >= 6) {
	quest::signalwith(22261,110,0);
	quest::signalwith(22261,101,10);
	}
	elsif($ulevel <= 15 && $ulevel >= 11) {
	quest::signalwith(22261,110,0);
	quest::signalwith(22261,102,10);
	}
	elsif($ulevel <= 20 && $ulevel >= 16) {
	quest::signalwith(22261,110,0);
	quest::signalwith(22261,103,10);
	}
	elsif($ulevel <= 25 && $ulevel >= 21) {
	quest::signalwith(22261,110,0);
	quest::signalwith(22261,104,10);
	}
	elsif($ulevel <= 30 && $ulevel >= 26) {
	quest::signalwith(22261,110,0);
	quest::signalwith(22261,105,10);
	}
	elsif($ulevel <= 35 && $ulevel >= 31) {
	quest::signalwith(22261,110,0);
	quest::signalwith(22261,106,10);
	}
	elsif($ulevel <= 40 && $ulevel >= 36) {
	quest::signalwith(22261,110,0);
	quest::signalwith(22261,107,10);
	}
	elsif($ulevel <= 45 && $ulevel >= 41) {
	quest::signalwith(22261,110,0);
	quest::signalwith(22261,108,10);
	}
	elsif($ulevel <= 49 && $ulevel >= 46) {
	quest::signalwith(22261,110,0);
	quest::signalwith(22261,109,10);
	}
	else {
	quest::signalwith(22261,110,0);
	}
	}