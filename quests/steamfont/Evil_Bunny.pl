sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(56228,600,10);
	}