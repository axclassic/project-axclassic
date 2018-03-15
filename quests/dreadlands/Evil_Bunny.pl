sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(86164,600,10);
	}