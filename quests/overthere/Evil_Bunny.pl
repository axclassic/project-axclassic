sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(93308,600,10);
	}