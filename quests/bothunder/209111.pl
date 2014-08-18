sub EVENT_SPAWN {
quest::shout("All to me!");
quest::settimer(1,300);
}

sub EVENT_TIMER  {
if($timer == 1) {
quest::depop();
}
}

sub EVENT_SAY {
if($text=~/hail/i) {
$client->Message(14,"You are doing well... The Storm Lord does not stand a chance!");
quest::spawn2(209042,0,0,-899,-1740,2263.6,63);
quest::spawn2(209113,0,0,-723.9,-1741.7,2250.2,61.5);
quest::spawn2(209115,0,0,-888,-1623,2252,100);
quest::spawn2(209105,0,0,-888,-1890,2252,9);
quest::spawn2(209106,0,0,-1017,-1717,2252,66);
quest::movepc(209,-663,-1738,2250.2,187.9);
quest::depop();
}
}



