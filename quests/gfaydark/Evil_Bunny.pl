sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(54330,600,10);
	}