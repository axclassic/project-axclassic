sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(78250,600,10);
	}