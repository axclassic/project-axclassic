sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(70090,600,10);
	}