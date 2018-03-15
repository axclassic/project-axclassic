sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(27169,600,10);
	}