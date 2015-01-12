sub EVENT_SPAWN {
    quest::shout("So you have defeated my Guards, Come to me and the real test of your metal will begin!");
   }
sub EVENT_DEATH {
    quest::say("This can not be. you have bested me.");
	quest:spawn2(37152,0,0,-816.8,2375.2,-2.8,21.1);
	}