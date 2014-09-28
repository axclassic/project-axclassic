sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
    }
sub EVENT_ENTER {
    quest::spawn2(340056,0,0,2093,2186.7,-53.4,208.1);
	quest::signalwith(340056,312,0);
	$client->Message(14,"There will be great strife in your attempts to find the secrets, which is why you must destroy anything in your way starting with the sentry guarding the first secret.");
 	quest::shout("sending signal 312 to controller");
	quest::depop();
}