sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(9186,600,10);
	}