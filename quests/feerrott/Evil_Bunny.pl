sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(47233,600,10);
	}