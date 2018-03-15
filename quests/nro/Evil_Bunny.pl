sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(34178,600,10);
	}