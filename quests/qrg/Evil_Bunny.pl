sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(3086,600,10);
	}