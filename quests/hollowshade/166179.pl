sub EVENT_SPAWN
{
	quest::delglobal("sstate");
	quest::setglobal("sstate",1,3,"F");
	$sstate=undef;
	quest::delglobal("defder1");
	quest::setglobal("defder1",0,3,"F");
	$defder1=undef;
	quest::delglobal("defder2");
	quest::setglobal("defder2",0,3,"F");
	$defder2=undef;
	quest::delglobal("defder3");
	quest::setglobal("defder3",0,3,"F");
	$defder3=undef;
	quest::delglobal("defder4");
	quest::setglobal("defder4",0,3,"F");
	$defder4=undef;
	quest::delglobal("defder5");
	quest::setglobal("defder5",0,3,"F");
	$defder5=undef;
}
sub EVENT_SIGNAL {
 if ($astate==3){
 quest::shout("To arms! Sonic wolves are attacking the grimlin camp!");
}
 elsif ($astate==2){
 quest::shout("To arms! Owlbears are attacking the grimlin camp!");
 }
}
#angelox
#Grimlin lookout
#Sets up grimlin globals when the war switches races
