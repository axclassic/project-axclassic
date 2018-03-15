sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(30190,600,10);
	}