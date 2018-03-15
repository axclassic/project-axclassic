sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(44135,600,10);
	}