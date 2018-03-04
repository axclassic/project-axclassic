##New Easter Event the signals tell the controller for east commons zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 1 && $ulevel <= 5) {
    quest::signalwith(22261,110,0);
	quest::signalwith(22261,100,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(22261,110,0);
	quest::signalwith(22261,101,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(22261,110,0);
	quest::signalwith(22261,102,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(22261,110,0);
	quest::signalwith(22261,103,10);
	}
	elsif($ulevel >= 21 && $ulevel <= 25) {
	quest::signalwith(22261,110,0);
	quest::signalwith(22261,104,10);
	}
	elsif($ulevel >= 26 && $ulevel <= 30) {
	quest::signalwith(22261,110,0);
	quest::signalwith(22261,105,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(22261,110,0);
	quest::signalwith(22261,106,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(22261,110,0);
	quest::signalwith(22261,107,10);
	}
	elsif($ulevel >= 41 && $ulevel <= 45) {
	quest::signalwith(22261,110,0);
	quest::signalwith(22261,108,10);
	}
	elsif($ulevel >= 46 && $ulevel <= 49) {
	quest::signalwith(22261,110,0);
	quest::signalwith(22261,109,10);
	}
	else {
	quest::signalwith(22261,110,0);
	}
	}