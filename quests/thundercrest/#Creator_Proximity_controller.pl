sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
    }
sub EVENT_ENTER {
    quest::spawn2(340109,0,0,542.5,-795.9,111.5,216.6);
	quest::spawn2(340000,0,0,434.9,-815.3,111.5,60.4);
	quest::spawn2(340001,0,0,404.6,-741.1,111.5,74.6);
	quest::spawn2(340002,0,0,443.5,-684.2,111.5,125.9);
	quest::spawn2(340000,0,0,521,-697.9,111.5,140.4);
	$client->Message(14,"There will be great strife in your attempts to find the secrets, which is why you must destroy anything in your way starting with the sentry guarding the first secret.");
 	quest::depop();
}