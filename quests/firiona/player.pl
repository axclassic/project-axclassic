sub EVENT_ENTERZONE {
     if($ulevel <= 5 && $ulevel >= 1) {
    quest::signalwith(84423,287,0);
	quest::signalwith(84423,288,10);
	}
	elsif($ulevel <= 10 && $ulevel >= 6) {
	quest::signalwith(84423,287,0);
	quest::signalwith(84423,289,10);
	}
	elsif($ulevel <= 15 && $ulevel >= 11) {
	quest::signalwith(84423,287,0);
	quest::signalwith(84423,290,10);
	}
	elsif($ulevel <= 20 && $ulevel >= 16) {
	quest::signalwith(84423,287,0);
	quest::signalwith(84423,291,10);
	}
	elsif($ulevel <= 25 && $ulevel >= 21) {
	quest::signalwith(84423,287,0);
	quest::signalwith(84423,292,10);
	}
	elsif($ulevel <= 30 && $ulevel >= 26) {
	quest::signalwith(84423,287,0);
	quest::signalwith(84423,293,10);
	}
	elsif($ulevel <= 35 && $ulevel >= 31) {
	quest::signalwith(84423,287,0);
	quest::signalwith(84423,294,10);
	}
	elsif($ulevel <= 40 && $ulevel >= 36) {
	quest::signalwith(84423,287,0);
	quest::signalwith(84423,295,10);
	}
	elsif($ulevel <= 45 && $ulevel >= 41) {
	quest::signalwith(84423,287,0);
	quest::signalwith(84423,296,10);
	}
	elsif($ulevel <= 49 && $ulevel >= 46) {
	quest::signalwith(84423,287,0);
	quest::signalwith(84423,297,10);
	}
	else {
	quest::signalwith(84423,287,0);
	}
	}