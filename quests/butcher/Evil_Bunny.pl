sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(68347,600,10);
	}