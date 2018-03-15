sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(97104,600,10);
	}