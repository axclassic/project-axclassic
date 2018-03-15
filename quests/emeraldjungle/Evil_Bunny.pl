sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(94163,600,10);
	}