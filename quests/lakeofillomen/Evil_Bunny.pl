sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(85268,600,10);
	}