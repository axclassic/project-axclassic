sub EVENT_ZONE {
     if($ulevel <= 5 && $ulevel >= 1) {
    quest::signalwith(85268,254,0);
	quest::signalwith(85268,255,10);
	}
	elsif($ulevel <= 10 && $ulevel >= 6) {
	quest::signalwith(85268,254,0);
	quest::signalwith(85268,256,10);
	}
	elsif($ulevel <= 15 && $ulevel >= 11) {
	quest::signalwith(85268,254,0);
	quest::signalwith(85268,257,10);
	}
	elsif($ulevel <= 20 && $ulevel >= 16) {
	quest::signalwith(85268,254,0);
	quest::signalwith(85268,258,10);
	}
	elsif($ulevel <= 25 && $ulevel >= 21) {
	quest::signalwith(85268,254,0);
	quest::signalwith(85268,259,10);
	}
	elsif($ulevel <= 30 && $ulevel >= 26) {
	quest::signalwith(85268,254,0);
	quest::signalwith(85268,260,10);
	}
	elsif($ulevel <= 35 && $ulevel >= 31) {
	quest::signalwith(85268,254,0);
	quest::signalwith(85268,261,10);
	}
	elsif($ulevel <= 40 && $ulevel >= 36) {
	quest::signalwith(85268,254,0);
	quest::signalwith(85268,262,10);
	}
	elsif($ulevel <= 45 && $ulevel >= 41) {
	quest::signalwith(85268,254,0);
	quest::signalwith(85268,263,10);
	}
	elsif($ulevel <= 49 && $ulevel >= 46) {
	quest::signalwith(85268,254,0);
	quest::signalwith(85268,264,10);
	}
	else {
	quest::signalwith(85268,254,0);
	}
	}