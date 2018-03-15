sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(88116,600,10);
	}