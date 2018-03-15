sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(58081,600,10);
	}