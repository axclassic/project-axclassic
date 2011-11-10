sub EVENT_SPAWN {
quest::say("All to me!");
quest::settimer(1,600);
}

sub EVENT_TIMER  {
if($timer == 1) {
quest::depop();
}
}

sub EVENT_SAY {
if($text=~/hail/i) {
$client->Message(9,"You are doing well... The Storm Lord does not stand a chance!");
#quest::movepc(209,-371,-1680,2356);
quest::movepc(209,-663,-1738,2251);#Threeflies: ports to Agnars room instead of Karanas in order to sove Door issue.
}
}