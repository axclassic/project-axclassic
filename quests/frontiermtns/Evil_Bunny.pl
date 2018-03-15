sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(92205,600,10);
	}