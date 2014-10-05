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
	quest::spawn2(340081,340069,0,649.4,659.8,61.6,64.9);
	quest::spawn2(340082,340070,0,183.5,936.8,61.5,255.2);
	quest::spawn2(340083,340071,0,182.1,932.5,61.5,0.5);
    quest::spawn2(340084,340072,0,648.4,298.5,61.6,62);
    quest::spawn2(340085,340073,0,-643.7,-667.6,61.6,191.1);
	quest::spawn2(340086,340074,0,-646.9,-309.9,61.6,202.6);
	quest::spawn2(340087,340076,0,825.8,-406,-6.1,254.8);
	quest::depop();
}