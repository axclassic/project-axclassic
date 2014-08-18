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
quest::spawn2(209102,0,0,-763.4,-1675.5,1726.2,50);
quest::movepc(209,-727,-1662,1728,177.6);
}
}