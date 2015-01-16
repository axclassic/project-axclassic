sub EVENT_SPAWN {
	quest::setnexthpevent(95);
}

sub EVENT_HP {
if($hpevent == 95) {
	quest::spawn2(334108,0,0,-33.1,1243,62.2,13);
	quest::setnexthpevent(75);
	}
	if($hpevent == 75) {
	quest::shout("Fools! You are no match for me!");
	quest::spawn2(334089,0,0,-48.3,1435.7,60.2,112.6);
	quest::spawn2(334090,0,0,28.4,1358.5,60.2,191.5);
	quest::spawn2(334091,0,0,-40,1348.1,60.2,25.6);
	quest::setnexthpevent(40);
	}
	if($hpevent == 40) {
	quest::shout("So, You think you have me? Come my children let us show these mortals what death means!");
	quest::spawn2(334099,0,0,1621.2,-471.3,437.8,179.5);
	quest::spawn2(334100,0,0,1569.3,-505.9,437.8,39);
	quest::spawn2(334098,0,0,1637.3,-542.7,439,242.5);
	quest::spawn2(334097,0,0,-61.8,1396.7,60.2,68.9);
	quest::spawn2(334101,0,0,0.4,1336.8,60.2,254.4);
	}
  }	
sub EVENT_DEATH {
    quest::say("This can not be! Arrrg!");
	quest::spawn2(334092,0,0,-3.8,1397.5,59,162.2);
    quest::depop(334089);
    quest::depop(334090);
    quest::depop(334091);
    quest::depop(334097);
	quest::depop(334098);
	quest::depop(334099);
	quest::depop(334100);
	quest::depop(334101);
	quest::depop();
   }	