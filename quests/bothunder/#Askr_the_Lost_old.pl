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
$client->Message(9,"Kill the stormlord!");
quest::movepc(209,-727,-1662,1728);
}
}