## General_Spawner ID 167997 ##
sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
}
sub EVENT_ENTER {
if(defined $qglobals{"EpicBox"} == 1){
   quest::spawn2(167969,0,0,-263.8,484.2,44.1,58.9);
   quest::depopall(167997);
 }
elsif(!defined $qglobals{"EpicBox"}){
#quest::shout("Nope not happening.");
}
}