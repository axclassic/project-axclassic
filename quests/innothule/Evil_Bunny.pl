sub EVENT_DEATH {
    quest::delglobal("EasterInProgress");
	quest::signalwith(46126,600,10);
	}