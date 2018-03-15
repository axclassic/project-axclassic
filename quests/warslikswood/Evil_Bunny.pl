sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(79141,600,10);
	}