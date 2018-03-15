sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(35188,600,10);
	}