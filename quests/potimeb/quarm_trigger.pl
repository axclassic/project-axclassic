# quarm_trigger.pl npcid - 223159

sub EVENT_SPAWN {
    #Quarm Pathing
    quest::spawn2(223215,0,0,251,-1124,-2.8,0);
    #Quarm
	quest::spawn2(223994,0,0,20,-1105,-2.8,64);
    #flavor
	quest::signalwith(223111, 1005, 2000);
	quest::depopall(223130);
	quest::depopall(223145);
	quest::depopall(223002);
	quest::depopall(223003);
}

