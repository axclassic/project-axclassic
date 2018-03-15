sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(12215,600,10);
	}