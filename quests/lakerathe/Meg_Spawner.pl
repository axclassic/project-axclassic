##Meg_Spawner ID 51158##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 60, $x + 60, $y - 60, $y + 60);
	}
sub EVENT_ENTER {
if(defined $qglobals{"EpicBox"} == 1) {
quest::spawn2(51152,33,0,1601.8,1037,-163.4,255);
quest::depopall(51177);
}
if(!defined $qglobals{"EpicBox"}) {
#quest::shout("Nope! Not happening!");
}
}