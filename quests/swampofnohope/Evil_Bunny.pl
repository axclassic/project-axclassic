sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(83382,600,10);
	}