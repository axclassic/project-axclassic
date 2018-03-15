sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(33178,600,10);
	}