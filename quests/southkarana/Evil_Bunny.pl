sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(14192,600,10);
	}