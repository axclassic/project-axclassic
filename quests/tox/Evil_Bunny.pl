sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(38235,600,10);
	}