sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(181536,600,10);
	}