sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(13147,600,10);
	}