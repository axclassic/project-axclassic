sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(189520,600,10);
	}