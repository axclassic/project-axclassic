sub EVENT_ZONE {
     if($ulevel <= 5 && $ulevel >= 1) {
    quest::signalwith(13147,198,0);
	quest::signalwith(13147,199,10);
	}
	elsif($ulevel <= 10 && $ulevel >= 6) {
	quest::signalwith(13147,198,0);
	quest::signalwith(13147,200,10);
	}
	elsif($ulevel <= 15 && $ulevel >= 11) {
	quest::signalwith(13147,198,0);
	quest::signalwith(13147,201,10);
	}
	elsif($ulevel <= 20 && $ulevel >= 16) {
	quest::signalwith(13147,198,0);
	quest::signalwith(13147,202,10);
	}
	elsif($ulevel <= 25 && $ulevel >= 21) {
	quest::signalwith(13147,198,0);
	quest::signalwith(13147,203,10);
	}
	elsif($ulevel <= 30 && $ulevel >= 26) {
	quest::signalwith(13147,198,0);
	quest::signalwith(13147,204,10);
	}
	elsif($ulevel <= 35 && $ulevel >= 31) {
	quest::signalwith(13147,198,0);
	quest::signalwith(13147,205,10);
	}
	elsif($ulevel <= 40 && $ulevel >= 36) {
	quest::signalwith(13147,198,0);
	quest::signalwith(13147,206,10);
	}
	elsif($ulevel <= 45 && $ulevel >= 41) {
	quest::signalwith(13147,198,0);
	quest::signalwith(13147,207,10);
	}
	elsif($ulevel <= 49 && $ulevel >= 46) {
	quest::signalwith(13147,198,0);
	quest::signalwith(13147,208,10);
	}
	else {
	quest::signalwith(13147,198,0);
	}
	}