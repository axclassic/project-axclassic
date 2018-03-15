sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(22261,600,10);
	}