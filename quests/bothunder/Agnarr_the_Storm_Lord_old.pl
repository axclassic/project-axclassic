sub EVENT_SPAWN {
quest::settimer(1,7200);
}

sub EVENT_AGGRO {
quest::spawn2(209104,0,0,-888,-1623,2252,100);
quest::spawn2(209105,0,0,-888,-1890,2252,9);
quest::spawn2(209106,0,0,-1017,-1717,2252,66);
quest::stoptimer(1);
quest::settimer(1,7200);
quest::settimer(2,31);
quest::signalwith(209033,1,1);
}

sub EVENT_TIMER {
if($timer == 1) {
quest::stoptimer(1);
quest::spawn2(209026,0,0,$x,$y,$z,$h);
quest::signalwith(209033,2,1);
quest::depop;
}

if($timer == 2) {
quest::signalwith(209033,1,1);
quest::stoptimer(1);
quest::stoptimer(2);
quest::settimer(1,7200);
quest::settimer(2,31);
}

}

sub EVENT_DEATH {
quest::spawn2(202367,0,0,$x,$y,$z,$h);
quest::spawn2(209108,0,0,-469,-1754,2351.2,197.6); 
quest::stoptimer(1);
quest::stoptimer(2);
quest::signalwith(209033,2,1);
}