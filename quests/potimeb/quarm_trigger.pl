# quarm_trigger.pl npcid - 223159

sub EVENT_SPAWN {
    quest::spawn2(223215,0,0,251,-1124,-2.8,0); #Quarm Pathing
	quest::spawn2(223994,0,0,20,-1105,-2.8,64); #Quarm
	quest::signalwith(223111, 1005, 2000); #flavor
	quest::depopall(223130);
	quest::depopall(223145);
	quest::depopall(223002);
	quest::depopall(223003);
    #quest::spawn2(223999, 0, 0, 374.5, -1.3, 3.1, 192);#phase5_flag
}

