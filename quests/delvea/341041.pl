 sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	}
sub EVENT_ENTER {
    quest::spawn2(341061,0,0,-1158.6,1055.2,25.9,162.6);
    quest::spawn2(341060,0,0,-1139,1006.9,25.9,208.1);
	quest::spawn2(341062,0,0,-1171.5,983.2,25.9,248.4);
 }