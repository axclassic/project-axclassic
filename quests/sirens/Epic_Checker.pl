##Epic_Checker ID 125369##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 60, $x + 60, $y - 60, $y + 60);
	}
sub EVENT_ENTER {
if(defined $qglobals{"EpicBox"} == 1) {
quest::spawn2(125045,0,0,-49,170,-53.1,128);
quest::depopall(125369);
}
elsif(!defined $qglobals{"EpicBox"}) {
#quest::shout("Not gonna happen!");
}
}