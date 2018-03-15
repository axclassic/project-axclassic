sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(15218,600,10);
	}