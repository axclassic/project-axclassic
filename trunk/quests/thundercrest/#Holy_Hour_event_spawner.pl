sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
    }
sub EVENT_ENTER {
    quest::spawn2(340079,0,0,1113.2,1604.9,33.1,95.2);
	quest::spawn2(340080,0,0,1367.9,1881.6,-5.7,106.9);
	quest::signalwith(340079,565,0);
	quest::signalwith(340080,665,0);
	$client->Message(14,"The Holy Hour is upon us, you must stop 50 creatures from crossing this bridge, allowing more than 10 to cross and you will fail this task.");
 	quest::signalwith(340079,566,0);
	quest::depop();
}