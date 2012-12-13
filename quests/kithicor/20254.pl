# Zone to HighPassHold
# Zone: East Karana
# AngeloX

sub EVENT_SPAWN{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER{
    $clientver = $client->GetClientVersion();
    if($clientver > 2){
	quest::movepc(407,190.7,-1380.4,-118.7);
    }
}