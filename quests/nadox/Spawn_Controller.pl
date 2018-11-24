##Spawn_Controller ID 227146##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 120, $x + 120, $y - 120, $y + 120);
	}
sub EVENT_ENTER {
if(defined $qglobals{"EpicBox"} == 1) {
quest::spawn2(227144,0,0,-633.1,-568,5,191.2);
quest::spawn2(227144,0,0,-421.5,-561.7,5.9,63.4);
quest::depopall(227146);
}
}

