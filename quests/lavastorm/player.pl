sub EVENT_ENTERZONE {
     if($ulevel <= 5 && $ulevel >= 1) {
    quest::signalwith(27169,353,0);
	quest::signalwith(27169,354,10);
	}
	elsif($ulevel <= 10 && $ulevel >= 6) {
	quest::signalwith(27169,353,0);
	quest::signalwith(27169,355,10);
	}
	elsif($ulevel <= 15 && $ulevel >= 11) {
	quest::signalwith(27169,353,0);
	quest::signalwith(27169,356,10);
	}
	elsif($ulevel <= 20 && $ulevel >= 16) {
	quest::signalwith(27169,353,0);
	quest::signalwith(27169,357,10);
	}
	elsif($ulevel <= 25 && $ulevel >= 21) {
	quest::signalwith(27169,353,0);
	quest::signalwith(27169,358,10);
	}
	elsif($ulevel <= 30 && $ulevel >= 26) {
	quest::signalwith(27169,353,0);
	quest::signalwith(27169,359,10);
	}
	elsif($ulevel <= 35 && $ulevel >= 31) {
	quest::signalwith(27169,353,0);
	quest::signalwith(27169,360,10);
	}
	elsif($ulevel <= 40 && $ulevel >= 36) {
	quest::signalwith(27169,353,0);
	quest::signalwith(27169,361,10);
	}
	elsif($ulevel <= 45 && $ulevel >= 41) {
	quest::signalwith(27169,353,0);
	quest::signalwith(27169,362,10);
	}
	elsif($ulevel <= 49 && $ulevel >= 46) {
	quest::signalwith(27169,353,0);
	quest::signalwith(27169,363,10);
	}
	else {
	quest::signalwith(27169,353,0);
	}
	}