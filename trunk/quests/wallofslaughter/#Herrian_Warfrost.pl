sub EVENT_SPAWN {
	quest::setnexthpevent(90);
}

sub EVENT_HP {
	if($hpevent == 90) {
	quest::shout("Fools! You are no match for me!");
	quest::spawn2(300058,0,0,-1442.6,1963.6,50.1,98.1);
	quest::spawn2(300058,0,0,-1503.5,1963,50.1,82.8);
	quest::spawn2(300058,0,0,-1429.9,1993,50.1,129.4);
	}
  }	
sub EVENT_DEATH {
    quest::say("This can not be! Arrrg!");
    quest::depopall(300058);
    quest::depop();
    }	