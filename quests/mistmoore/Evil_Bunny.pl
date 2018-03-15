sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(59185,600,10);
	}