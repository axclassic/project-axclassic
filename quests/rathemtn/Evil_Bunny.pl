sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(50666,600,10);
	}