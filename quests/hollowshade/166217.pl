#angelox
#Owlbear Lookout
sub EVENT_SPAWN
{
	quest::delglobal("sstate");
	quest::setglobal("sstate",2,3,"F");
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
 if ($astate==1){
 quest::shout("To arms! The grimlins are attacking the Owlbear camp!");
}
 elsif ($astate==3){
 quest::shout("To arms! Sonics are attacking the Owlbear camp!");
 }
}
sub EVENT_DEATH {
    quest::emote("staggers for a moment and then collapses.");
} 
#Angelox
#Sets up owlbear globals when the war switches races
#an_owlbear_lookout

