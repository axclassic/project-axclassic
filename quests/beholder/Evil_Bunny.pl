sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(16057,600,10);
	}