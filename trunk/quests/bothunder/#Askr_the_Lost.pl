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
$client->Message(9,"Kill the stormlord!");
quest::movepc(209,-727,-1662,1728);
#quest::movepc(209,-663,-1738,2251); #Threeflies: portes to Agnars room instead of Karanas in order to solve door issue.
}
}