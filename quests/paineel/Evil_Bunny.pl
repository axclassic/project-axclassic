sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(75174,600,10);
	}