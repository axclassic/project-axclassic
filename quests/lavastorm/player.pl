##New Easter Event the signals tell the controller for Lavastorm zone what level NPC to spawn
sub EVENT_ENTERZONE {
     if($ulevel >= 1 && $ulevel <= 5) {
    quest::signalwith(27169,353,0);
	quest::signalwith(27169,354,10);
	}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	quest::signalwith(27169,353,0);
	quest::signalwith(27169,355,10);
	}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	quest::signalwith(27169,353,0);
	quest::signalwith(27169,356,10);
	}
	elsif($ulevel >= 16 && $ulevel <= 20) {
	quest::signalwith(27169,353,0);
	quest::signalwith(27169,357,10);
	}
	elsif($ulevel >= 21 && $ulevel <= 25) {
	quest::signalwith(27169,353,0);
	quest::signalwith(27169,358,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 30) {
	quest::signalwith(27169,353,0);
	quest::signalwith(27169,359,10);
	}
	elsif($ulevel >= 31 && $ulevel <= 35) {
	quest::signalwith(27169,353,0);
	quest::signalwith(27169,360,10);
	}
	elsif($ulevel >= 36 && $ulevel <= 40) {
	quest::signalwith(27169,353,0);
	quest::signalwith(27169,361,10);
	}
	elsif($ulevel >= 41 && $ulevel <= 45) {
	quest::signalwith(27169,353,0);
	quest::signalwith(27169,362,10);
	}
	elsif($ulevel >= 46 && $ulevel <= 49) {
	quest::signalwith(27169,353,0);
	quest::signalwith(27169,363,10);
	}
	else {
	quest::signalwith(27169,353,0);
	}
	}