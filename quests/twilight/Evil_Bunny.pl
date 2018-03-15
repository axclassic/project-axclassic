sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(170576,600,10);
	}