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
$client->Message(14,"You have done it! Defeated Agnarr the Storm Lord! Go up the stairs and speak with Lord Karana $name.");
quest::spawn2(209108,0,0,-475,-1750,2350.2,190.1);
 }
}

