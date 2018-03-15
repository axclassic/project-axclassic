sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(98080,600,10);
	}