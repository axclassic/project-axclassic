# Zone to Tox event
# Reset Wars
# Zone: Hollowshade
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 15, $x + 15, $y - 15, $y + 15);
	
	#resets the invaderw
	quest::spawn_condition("hollowshade",8,0); #owl invader to grimlin camp are 8
	quest::spawn_condition("hollowshade",9,0); #wolf invader to grimlin camp are 9
	quest::spawn_condition("hollowshade",10,0); #wolf invader to owl camp are 10
	quest::spawn_condition("hollowshade",11,0); #grimlin invader to owl camp are 11
	quest::spawn_condition("hollowshade",12,0); #owl invader to wolf camp are 12
	quest::spawn_condition("hollowshade",13,0); #grimlin invader to wolf camp are 13
	#resets rest of the war
	quest::delglobal("astate");
	quest::setglobal("astate",1,3,"F");
	$astate=undef;
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
	#starts zone with gremlins, resets everything
	quest::spawn_condition("hollowshade",3,0); #wolves are 3
	quest::spawn_condition("hollowshade",2,0); #owls are 2
	quest::spawn_condition("hollowshade",1,1); #grimlin are 1
	quest::spawn_condition("hollowshade",4,0); #grimlin defender are 4
	quest::spawn_condition("hollowshade",5,0); #owls defender are 5
	quest::spawn_condition("hollowshade",6,0); #wolves defender are 6
}

sub EVENT_ENTER
{
	quest::movepc(38,2474,-953,-6);
}
