sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(10233,600,10);
	}