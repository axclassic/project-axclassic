sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(51175,600,10);
	}