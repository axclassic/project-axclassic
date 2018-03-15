sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(4223,600,10);
	}