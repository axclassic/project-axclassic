##Freeze Trigger 211197## 
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
 }
sub EVENT_ENTER {
#quest::settimer("Chaosfreeze",60);
#$client->Freeze();
quest::signalwith(211142,300,500);
}
#sub EVENT_TIMER {
#if($timer eq "Chaosfreeze"){
  # quest::stoptimer("Chaosfreeze");
   # $client->UnFreeze();
	#quest::depop();
	#}
	#}