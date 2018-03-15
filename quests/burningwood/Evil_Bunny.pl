sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(87168,600,10);
	}