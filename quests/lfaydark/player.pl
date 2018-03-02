sub EVENT_ENTERZONE {
   if($ulevel <= 5 && $ulevel >= 1) {
    quest::signalwith(57166,55,0);
	quest::signalwith(57166,45,10);
	}
	elsif($ulevel <= 10 && $ulevel >= 6) {
	quest::signalwith(57166,55,0);
	quest::signalwith(57166,46,10);
	}
	elsif($ulevel <= 15 && $ulevel >= 11) {
	quest::signalwith(57166,55,0);
	quest::signalwith(57166,47,10);
	}
	elsif($ulevel <= 20 && $ulevel >= 16) {
	quest::signalwith(57166,55,0);
	quest::signalwith(57166,48,10);
	}
	elsif($ulevel <= 25 && $ulevel >= 21) {
	quest::signalwith(57166,55,0);
	quest::signalwith(57166,49,10);
	}
	elsif($ulevel <= 30 && $ulevel >= 26) {
	quest::signalwith(57166,55,0);
	quest::signalwith(57166,50,10);
	}
	elsif($ulevel <= 35 && $ulevel >= 31) {
	quest::signalwith(57166,55,0);
	quest::signalwith(57166,51,10);
	}
	elsif($ulevel <= 40 && $ulevel >= 36) {
	quest::signalwith(57166,55,0);
	quest::signalwith(57166,52,10);
	}
	elsif($ulevel <= 45 && $ulevel >= 41) {
	quest::signalwith(57166,55,0);
	quest::signalwith(57166,53,10);
	}
	elsif($ulevel <= 49 && $ulevel >= 46) {
	quest::signalwith(57166,55,0);
	quest::signalwith(57166,54,10);
	}
	else {
	quest::signalwith(57166,55,0);
	}
	}