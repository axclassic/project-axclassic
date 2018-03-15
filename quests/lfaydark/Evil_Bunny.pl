sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(57166,600,10);
	}