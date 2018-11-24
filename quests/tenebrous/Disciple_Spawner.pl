## Disciple_Spawner ID 172420 ##
sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 60, $x + 60, $y - 60, $y + 60);
}
sub EVENT_ENTER {
if(defined $qglobals{"EpicBox"} == 1){
   quest::spawn2(172419,0,0,898.2,229.2,-9,66.4);
   quest::depopall(172420);
 }
elsif(!defined $qglobals{"EpicBox"}){
#quest::shout("Nope not happening.");
}
}