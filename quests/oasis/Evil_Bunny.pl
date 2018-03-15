sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(37191,600,10);
	}