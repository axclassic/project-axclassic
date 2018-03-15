sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(25234,600,10);
	}