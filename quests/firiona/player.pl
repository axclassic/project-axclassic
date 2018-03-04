##New Easter Event the signals tell the controller for Firiona Vie zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 1 && $ulevel <= 5) {
    quest::signalwith(84423,287,0);
	quest::signalwith(84423,288,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(84423,287,0);
	quest::signalwith(84423,289,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(84423,287,0);
	quest::signalwith(84423,290,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(84423,287,0);
	quest::signalwith(84423,291,10);
	}
	elsif($ulevel>= 21 && $ulevel <= 25) {
	quest::signalwith(84423,287,0);
	quest::signalwith(84423,292,10);
	}
	elsif($ulevel >= 26 && $ulevel <= 30) {
	quest::signalwith(84423,287,0);
	quest::signalwith(84423,293,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(84423,287,0);
	quest::signalwith(84423,294,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(84423,287,0);
	quest::signalwith(84423,295,10);
	}
	elsif($ulevel >= 41 && $ulevel <= 45) {
	quest::signalwith(84423,287,0);
	quest::signalwith(84423,296,10);
	}
	elsif($ulevel >= 46 && $ulevel <= 49) {
	quest::signalwith(84423,287,0);
	quest::signalwith(84423,297,10);
	}
	else {
	quest::signalwith(84423,287,0);
	}
	}