sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(84423,600,10);
	}