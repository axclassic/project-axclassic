##New Easter Event the signals tell the controller for Firiona Vie zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 1 && $ulevel <= 5) {
    quest::signalwith(84423,298,0);
	quest::signalwith(84423,299,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(84423,298,0);
	quest::signalwith(84423,300,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(84423,287,0);
	quest::signalwith(84423,301,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(84423,298,0);
	quest::signalwith(84423,302,10);
	}
	elsif($ulevel >= 21 && $ulevel <= 25) {
	quest::signalwith(84423,298,0);
	quest::signalwith(84423,303,10);
	}
	elsif($ulevel >= 26 && $ulevel <= 30) {
	quest::signalwith(84423,298,0);
	quest::signalwith(84423,304,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(84423,298,0);
	quest::signalwith(84423,305,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(84423,298,0);
	quest::signalwith(84423,306,10);
	}
	elsif($ulevel >= 41 && $ulevel <= 45) {
	quest::signalwith(84423,298,0);
	quest::signalwith(84423,307,10);
	}
	elsif($ulevel >= 46 && $ulevel <= 49) {
	quest::signalwith(84423,298,0);
	quest::signalwith(84423,308,10);
	}
	else {
	quest::signalwith(84423,298,0);
	}
	}