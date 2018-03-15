sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(20276,600,10);
	}