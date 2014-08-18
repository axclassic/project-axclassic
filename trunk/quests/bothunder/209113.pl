sub EVENT_SPAWN {
quest::settimer(1,300);
}

sub EVENT_TIMER  {
if($timer == 1) {
quest::depop();
}
}

sub EVENT_SAY {
if($text=~/hail/i) {
$client->Message(14,"Kill the stormlord and his minions!");
quest::depop();
}
}