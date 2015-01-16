sub EVENT_SPAWN {
	quest::setnexthpevent(90);
}

sub EVENT_HP {
	if($hpevent == 90) {
	quest::shout("Fools! You are no match for me!");
	quest::spawn2(280087,0,0,1621.2,-471.3,437.8,179.5);
	quest::spawn2(280088,0,0,1569.3,-505.9,437.8,39);
	quest::spawn2(280086,0,0,1637.3,-542.7,439,242.5);
	quest:shout("Senival, You worthless scum! Get out here and dispatch these bothersome gnats!");
	quest::spawn2(280083,0,0,1595.4,-460,437.8,119.5);
	}
  }	
sub EVENT_DEATH {
    quest::say("This can not be! Arrrg!");
    quest::depop(280083);
    quest::depop(280087);
    quest::depop(280088);
    quest::signalwith(280086,280,0);
   }	