sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(302084,600,10);
	}