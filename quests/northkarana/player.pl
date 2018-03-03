sub EVENT_ENTERZONE {
     if($ulevel >= 1 && $ulevel <= 5) {
    quest::signalwith(13147,198,0);
	quest::signalwith(13147,199,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(13147,198,0);
	quest::signalwith(13147,200,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(13147,198,0);
	quest::signalwith(13147,201,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(13147,198,0);
	quest::signalwith(13147,202,10);
	}
	elsif($ulevel >= 21 && $ulevel <= 25) {
	quest::signalwith(13147,198,0);
	quest::signalwith(13147,203,10);
	}
	elsif($ulevel >= 26 && $ulevel <= 30) {
	quest::signalwith(13147,198,0);
	quest::signalwith(13147,204,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(13147,198,0);
	quest::signalwith(13147,205,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(13147,198,0);
	quest::signalwith(13147,206,10);
	}
	elsif($ulevel >= 41 && $ulevel <= 45) {
	quest::signalwith(13147,198,0);
	quest::signalwith(13147,207,10);
	}
	elsif($ulevel >= 46 && $ulevel <= 49) {
	quest::signalwith(13147,198,0);
	quest::signalwith(13147,208,10);
	}
	else {
	quest::signalwith(13147,198,0);
	}
	}